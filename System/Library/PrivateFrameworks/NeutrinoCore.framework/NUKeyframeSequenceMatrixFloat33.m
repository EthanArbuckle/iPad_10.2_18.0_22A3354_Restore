@implementation NUKeyframeSequenceMatrixFloat33

- (NUKeyframeSequenceMatrixFloat33)initWithCount:(unint64_t)a3 times:(id *)a4 values:(id *)a5
{
  NUKeyframeSequenceMatrixFloat33 *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NUKeyframeSequenceMatrixFloat33;
  v7 = -[NUKeyframeSequence initWithInterpolation:count:times:](&v17, sel_initWithInterpolation_count_times_, 0, a3, a4);
  if (a3)
  {
    v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(a3, 0x30uLL, 0x1000040EED21634uLL);
    v9 = 0;
    v7->_values = v8;
    v10 = 1;
    do
    {
      v11 = 3 * v9;
      v12 = (_OWORD *)((char *)v7->_values + 16 * v11);
      v13 = (__int128 *)((char *)a5 + 16 * v11);
      v14 = *v13;
      v15 = v13[2];
      v12[1] = v13[1];
      v12[2] = v15;
      *v12 = v14;
      v9 = v10++;
    }
    while (v9 < a3);
  }
  return v7;
}

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *values;
  objc_super v4;

  values = self->_values;
  if (values)
    free(values);
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequenceMatrixFloat33;
  -[NUKeyframeSequence dealloc](&v4, sel_dealloc);
}

- (__n128)valueOfKeyframeAtIndex:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  if (a1[5])
  {
    v5 = objc_msgSend(a1, "count") - 1;
    if (v5 >= a3)
      v5 = a3;
    v6 = a1[5] + 48 * (v5 & ~(v5 >> 63));
  }
  else
  {
    v6 = MEMORY[0x1E0C83FE8];
  }
  return *(__n128 *)v6;
}

- (uint64_t)sampleAtTime:(__int128 *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v6;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v3 = a1;
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    v9 = *a3;
    v10 = *((_QWORD *)a3 + 2);
    v6 = objc_msgSend(a1, "indexOfKeyframeAtOrBeforeTime:", &v9);
    if (objc_msgSend(v3, "interpolation"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("NUKeyframeSequence.m"), 799, CFSTR("Don't know how to interpolate transforms"));

    }
    a1 = v3;
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(a1, "valueOfKeyframeAtIndex:", v4);
}

@end

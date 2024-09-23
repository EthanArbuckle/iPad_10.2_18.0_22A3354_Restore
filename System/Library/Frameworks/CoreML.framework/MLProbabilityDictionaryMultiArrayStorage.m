@implementation MLProbabilityDictionaryMultiArrayStorage

- (MLProbabilityDictionaryMultiArrayStorage)initWithMultiArray:(id)a3
{
  id v5;
  MLProbabilityDictionaryMultiArrayStorage *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MLProbabilityDictionaryMultiArrayStorage;
  v6 = -[MLProbabilityDictionaryMultiArrayStorage init](&v8, sel_init);
  if (v6)
  {
    if (objc_msgSend(v5, "dataType") != 65552
      && objc_msgSend(v5, "dataType") != 65568
      && objc_msgSend(v5, "dataType") != 65600)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("class probability multiArray must use Float16, Float32 or Float64 scalars."));
    }
    objc_storeStrong((id *)&v6->_multiArray, a3);
    v6->_count = objc_msgSend(v5, "count");
  }

  return v6;
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if (-[MLProbabilityDictionaryMultiArrayStorage count](self, "count") <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Probability index %tu is out of range because there are only %tu classes."), a3, -[MLProbabilityDictionaryMultiArrayStorage count](self, "count"));
  return -[MLMultiArray objectAtIndexedSubscript:](self->_multiArray, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)maxElementIndex
{
  unint64_t v3;
  unint64_t v4;
  MLMultiArray *multiArray;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[MLProbabilityDictionaryMultiArrayStorage count](self, "count");
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    multiArray = self->_multiArray;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MLProbabilityDictionaryMultiArrayStorage_maxElementIndex__block_invoke;
    v7[3] = &unk_1E3D66F18;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = v3;
    -[MLMultiArray getBytesWithHandler:](multiArray, "getBytesWithHandler:", v7);
    v4 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  return v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiArray, 0);
}

void __59__MLProbabilityDictionaryMultiArrayStorage_maxElementIndex__block_invoke(_QWORD *a1, uint64_t a2)
{
  MLMultiArrayBufferLayout *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MLMultiArrayBufferLayout *v8;
  MLMultiArrayBufferLayout *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _WORD *v16;
  __int16 *v17;
  __int16 *v18;
  uint64_t v19;
  __int16 *v20;
  __int16 v21;
  uint64_t v28;
  uint64_t v31;
  uint64_t v32;
  MLMultiArrayBufferLayout *v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  float *v37;
  float *v38;
  float *v39;
  float v40;
  uint64_t v41;
  float *v42;
  float v43;
  float v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  double *v49;
  double *v50;
  double *v51;
  double v52;
  uint64_t v53;
  double *v54;
  double v55;
  double v56;
  uint64_t v57;
  MLMultiArrayBufferLayout *v58;
  unint64_t v59;

  v4 = [MLMultiArrayBufferLayout alloc];
  objc_msgSend(*(id *)(a1[4] + 8), "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "strides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[MLMultiArrayBufferLayout initWithShape:strides:](v4, "initWithShape:strides:", v5, v6);

  if (objc_msgSend(*(id *)(a1[4] + 8), "dataType") == 65552)
  {
    v7 = a1[6];
    v8 = v58;
    if (v7 >= 1)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      LOWORD(_S8) = 0;
      do
      {
        v59 = 0;
        v13 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v9, "offsetOfScalarAtIndex:contiguousScalars:", v10, &v59, v58);
        v16 = (_WORD *)(a2 + 2 * v13);
        if (v59 >= 2)
        {
          v18 = v16 + 1;
          LOWORD(_S0) = *v16;
          v19 = 2 * v59 - 2;
          v17 = (__int16 *)(a2 + 2 * v13);
          v20 = v16 + 1;
          do
          {
            v21 = *v20++;
            LOWORD(_S1) = v21;
            __asm
            {
              FCVT            S2, H0
              FCVT            S3, H1
            }
            if (_S2 < _S3)
            {
              _S0 = _S1;
              v17 = v18;
            }
            v18 = v20;
            v19 -= 2;
          }
          while (v19);
        }
        else
        {
          v17 = (__int16 *)(a2 + 2 * v13);
        }
        v28 = v17 - v16;
        LOWORD(_S0) = *v17;
        __asm
        {
          FCVT            S1, H8
          FCVT            S2, H0
        }
        if (_S2 > _S1)
        {
          v11 = v28;
          _S8 = _S0;
        }
        v10 += v59;
      }
      while (v10 < v7);
      goto LABEL_40;
    }
LABEL_39:
    v11 = 0;
    goto LABEL_40;
  }
  v31 = objc_msgSend(*(id *)(a1[4] + 8), "dataType");
  v32 = a1[6];
  v33 = v58;
  if (v31 == 65568)
  {
    if (v32 < 1)
      goto LABEL_39;
    v34 = 0;
    v11 = 0;
    v35 = 1.1755e-38;
    do
    {
      v59 = 0;
      v36 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v33, "offsetOfScalarAtIndex:contiguousScalars:", v34, &v59, v58);
      v37 = (float *)(a2 + 4 * v36);
      if (v59 >= 2)
      {
        v39 = v37 + 1;
        v40 = *v37;
        v41 = 4 * v59 - 4;
        v38 = (float *)(a2 + 4 * v36);
        v42 = v37 + 1;
        do
        {
          v43 = *v42++;
          v44 = v43;
          if (v40 < v43)
          {
            v40 = v44;
            v38 = v39;
          }
          v39 = v42;
          v41 -= 4;
        }
        while (v41);
      }
      else
      {
        v38 = (float *)(a2 + 4 * v36);
      }
      v45 = v38 - v37;
      if (*v38 > v35)
      {
        v11 = v45;
        v35 = *v38;
      }
      v34 += v59;
    }
    while (v34 < v32);
  }
  else
  {
    if (v32 < 1)
      goto LABEL_39;
    v46 = 0;
    v11 = 0;
    v47 = 2.22507386e-308;
    do
    {
      v59 = 0;
      v48 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v33, "offsetOfScalarAtIndex:contiguousScalars:", v46, &v59, v58);
      v49 = (double *)(a2 + 8 * v48);
      if (v59 >= 2)
      {
        v51 = v49 + 1;
        v52 = *v49;
        v53 = 8 * v59 - 8;
        v50 = (double *)(a2 + 8 * v48);
        v54 = v49 + 1;
        do
        {
          v55 = *v54++;
          v56 = v55;
          if (v52 < v55)
          {
            v52 = v56;
            v50 = v51;
          }
          v51 = v54;
          v53 -= 8;
        }
        while (v53);
      }
      else
      {
        v50 = (double *)(a2 + 8 * v48);
      }
      v57 = v50 - v49;
      if (*v50 > v47)
      {
        v11 = v57;
        v47 = *v50;
      }
      v46 += v59;
    }
    while (v46 < v32);
  }
LABEL_40:

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;
}

@end

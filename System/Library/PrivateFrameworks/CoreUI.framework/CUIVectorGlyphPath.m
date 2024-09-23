@implementation CUIVectorGlyphPath

- (CUIVectorGlyphPathLengthData)lengthData
{
  float **p_subpathLengths;
  __int128 v5;
  __int128 v6;

  p_subpathLengths = &self->subpathLengths;
  if (*(float *)&self->subpathLengths >= 0.0)
  {
    v6 = *(_OWORD *)&self->elementToSubpath;
    *(_OWORD *)&retstr->totalLength = *(_OWORD *)p_subpathLengths;
    *(_OWORD *)&retstr->elementLengths = v6;
    *(_OWORD *)&retstr->numSubpaths = *(_OWORD *)&self->numElements;
  }
  else
  {
    *(_OWORD *)&retstr->elementLengths = 0u;
    *(_OWORD *)&retstr->numSubpaths = 0u;
    *(_OWORD *)&retstr->totalLength = 0u;
    self = (CUIVectorGlyphPathLengthData *)-[CUIVectorGlyphPathLengthData computeLengthData](self, "computeLengthData");
    v5 = *(_OWORD *)&retstr->elementLengths;
    *(_OWORD *)p_subpathLengths = *(_OWORD *)&retstr->totalLength;
    *((_OWORD *)p_subpathLengths + 1) = v5;
    *((_OWORD *)p_subpathLengths + 2) = *(_OWORD *)&retstr->numSubpaths;
  }
  return self;
}

+ (float)realloc_float_array:(float *)a3 withNewCount:(unint64_t)a4
{
  float *result;

  result = (float *)malloc_type_realloc(a3, 4 * a4, 0x100004052888210uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FailedRealloc"), CFSTR("Requested size was not available"));
    return a3;
  }
  return result;
}

+ (CUIVectorGlyphPathElementLength)realloc_length_array:(CUIVectorGlyphPathElementLength *)a3 withNewCount:(unint64_t)a4
{
  CUIVectorGlyphPathElementLength *result;

  result = (CUIVectorGlyphPathElementLength *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FailedRealloc"), CFSTR("Requested size was not available"));
    return a3;
  }
  return result;
}

+ (unint64_t)realloc_long_array:(unint64_t *)a3 withNewCount:(unint64_t)a4
{
  unint64_t *result;

  result = (unint64_t *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FailedRealloc"), CFSTR("Requested size was not available"));
    return a3;
  }
  return result;
}

+ (CUIVectorGlyphPathLengthData)emptyData
{
  *(_OWORD *)&retstr->elementLengths = 0u;
  *(_OWORD *)&retstr->numSubpaths = 0u;
  *(_OWORD *)&retstr->totalLength = 0u;
  retstr->totalLength = -1.0;
  return result;
}

- (CUIVectorGlyphPathLengthData)computeLengthData
{
  const CGPath *path;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  float *v16;
  unint64_t v17;
  CUIVectorGlyphPathElementLength *v18;
  CUIVectorGlyphPathLengthData *result;
  _QWORD v20[16];
  _QWORD v21[4];
  CGPoint v22;
  _QWORD v23[4];
  CGPoint v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  float *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];

  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 6;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 50;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v42 = malloc_type_calloc(6uLL, 4uLL, 0x100004052888210uLL);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v38 = malloc_type_calloc(v52[3], 8uLL, 0x100004000313F17uLL);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v34 = malloc_type_calloc(v52[3], 8uLL, 0x100004000313F17uLL);
  v27 = 0;
  v28 = (float *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3010000000;
  v23[3] = &unk_19EC9DD21;
  v24 = CGPointZero;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[3] = &unk_19EC9DD21;
  v22 = v24;
  path = (const CGPath *)self->_path;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __39__CUIVectorGlyphPath_computeLengthData__block_invoke;
  v20[3] = &unk_1E41B8BE0;
  v20[6] = &v47;
  v20[7] = &v43;
  v20[8] = &v51;
  v20[9] = &v35;
  v20[4] = self;
  v20[5] = v25;
  v20[10] = &v31;
  v20[11] = v21;
  v20[12] = v23;
  v20[13] = v55;
  v20[14] = &v39;
  v20[15] = &v27;
  CGPathApplyWithBlock(path, v20);
  v7 = (void *)objc_opt_class(self, v6);
  v8 = objc_msgSend(v7, "realloc_float_array:withNewCount:", v40[3], v48[3]);
  v40[3] = (uint64_t)v8;
  v10 = (void *)objc_opt_class(self, v9);
  v11 = objc_msgSend(v10, "realloc_length_array:withNewCount:", v36[3], v44[3]);
  v36[3] = (uint64_t)v11;
  v13 = (void *)objc_opt_class(self, v12);
  v14 = (unint64_t *)objc_msgSend(v13, "realloc_long_array:withNewCount:", v32[3], v44[3]);
  v32[3] = (uint64_t)v14;
  *(_OWORD *)&retstr->totalLength = 0u;
  *(_OWORD *)&retstr->elementLengths = 0u;
  *(_OWORD *)&retstr->numSubpaths = 0u;
  retstr->totalLength = v28[6];
  v15 = v48[3];
  if (v15)
    v16 = (float *)v40[3];
  else
    v16 = 0;
  retstr->subpathLengths = v16;
  v17 = v44[3];
  if (v17)
  {
    v18 = (CUIVectorGlyphPathElementLength *)v36[3];
  }
  else
  {
    v18 = 0;
    v14 = 0;
  }
  retstr->elementLengths = v18;
  retstr->elementToSubpath = v14;
  retstr->numSubpaths = v15;
  retstr->numElements = v17;
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);
  return result;
}

void __39__CUIVectorGlyphPath_computeLengthData__block_invoke(_QWORD *a1, int *a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  float v10;
  double *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  CGPoint *v20;
  CGPoint v21;
  double v22;
  uint64_t v23;

  v4 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 1 > v6)
  {
    v7 = (unint64_t)((double)v6 * 1.5);
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend((id)objc_opt_class(a1[4], a2), "realloc_length_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24), v7);
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = objc_msgSend((id)objc_opt_class(a1[4], v8), "realloc_long_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24), v7);
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v7;
  }
  v9 = *a2;
  v10 = 0.0;
  v11 = (double *)*((_QWORD *)a2 + 1);
  switch(v9)
  {
    case 0:
      *(_OWORD *)(*(_QWORD *)(a1[11] + 8) + 32) = *(_OWORD *)v11;
      goto LABEL_11;
    case 1:
      v10 = CGPathLineLength(*(double *)(*(_QWORD *)(a1[12] + 8) + 32), *(double *)(*(_QWORD *)(a1[12] + 8) + 40), *v11, v11[1]);
      *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = *(float *)(*(_QWORD *)(a1[5] + 8) + 24) + v10;
LABEL_11:
      v20 = *(CGPoint **)(a1[12] + 8);
      v21 = *(CGPoint *)v11;
      goto LABEL_17;
    case 2:
      CGPathQuadraticLength(*(double *)(*(_QWORD *)(a1[12] + 8) + 32), *(double *)(*(_QWORD *)(a1[12] + 8) + 40), *v11, v11[1], v11[2], v11[3]);
      v10 = v22;
      *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = *(float *)(*(_QWORD *)(a1[5] + 8) + 24) + v10;
      v20 = *(CGPoint **)(a1[12] + 8);
      v21 = (CGPoint)*((_OWORD *)v11 + 1);
      goto LABEL_17;
    case 3:
      v10 = CGPathCubicLength(*(double *)(*(_QWORD *)(a1[12] + 8) + 32), *(double *)(*(_QWORD *)(a1[12] + 8) + 40), *v11, v11[1], v11[2], v11[3], v11[4], v11[5]);
      *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = *(float *)(*(_QWORD *)(a1[5] + 8) + 24) + v10;
      v20 = *(CGPoint **)(a1[12] + 8);
      v21 = (CGPoint)*((_OWORD *)v11 + 2);
      goto LABEL_17;
    case 4:
      v12 = *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24);
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 1 > v12)
      {
        v13 = (unint64_t)((double)v12 * 1.5);
        *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = objc_msgSend((id)objc_opt_class(a1[4], a2), "realloc_float_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24), v13);
        *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = v13;
      }
      v14 = *(_QWORD *)(a1[11] + 8);
      v15 = *(double *)(v14 + 32);
      v16 = *(_QWORD *)(a1[12] + 8);
      v17 = *(double *)(v16 + 32);
      if (vabdd_f64(v15, v17) >= 2.22044605e-16)
      {
        v19 = *(double *)(v16 + 40);
        v18 = *(double *)(v14 + 40);
      }
      else
      {
        v18 = *(double *)(v14 + 40);
        v19 = *(double *)(v16 + 40);
        v10 = 0.0;
        if (vabdd_f64(v18, v19) < 2.22044605e-16)
          goto LABEL_16;
      }
      v10 = CGPathLineLength(v17, v19, v15, v18);
LABEL_16:
      *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = v10 + *(float *)(*(_QWORD *)(a1[5] + 8) + 24);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) + 4 * v5) = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      *(float *)(*(_QWORD *)(a1[15] + 8) + 24) = *(float *)(*(_QWORD *)(a1[5] + 8) + 24)
                                                   + *(float *)(*(_QWORD *)(a1[15] + 8) + 24);
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
      *(_OWORD *)(*(_QWORD *)(a1[12] + 8) + 32) = *(_OWORD *)(*(_QWORD *)(a1[11] + 8) + 32);
      v20 = *(CGPoint **)(a1[11] + 8);
      v21 = CGPointZero;
LABEL_17:
      v20[2] = v21;
LABEL_18:
      v23 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) + 8 * *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      *(_DWORD *)v23 = v4;
      *(float *)(v23 + 4) = v10;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) + 8 * (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24))++) = v5;
      return;
    default:
      goto LABEL_18;
  }
}

+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4
{
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v7 = objc_opt_new(a1);
  *(_QWORD *)(v7 + 56) = MEMORY[0x1A1AEE508](a3);
  *(_QWORD *)(v7 + 64) = objc_msgSend(a4, "copy");
  if (a1)
  {
    objc_msgSend(a1, "emptyData");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  *(_OWORD *)(v7 + 40) = v11;
  *(_OWORD *)(v7 + 24) = v10;
  *(_OWORD *)(v7 + 8) = v9;
  return (id)v7;
}

+ (id)createWithPath:(CGPath *)a3 clipStrokeKeyframeProvider:(id)a4
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = objc_opt_new(a1);
  *(_QWORD *)(v6 + 56) = MEMORY[0x1A1AEE508](a3);
  *(_QWORD *)(v6 + 64) = 0;
  objc_msgSend((id)v6, "computeLengthData");
  v7 = v10;
  v8 = v11;
  *(_OWORD *)(v6 + 40) = v12;
  *(_OWORD *)(v6 + 24) = v8;
  *(_OWORD *)(v6 + 8) = v7;
  *(_QWORD *)(v6 + 64) = (id)(*((uint64_t (**)(id, uint64_t))a4 + 2))(a4, v6);
  return (id)v6;
}

+ (id)_createAdoptingPath:(CGPath *)a3 clipStrokeKeyframes:(id)a4
{
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v7 = objc_opt_new(a1);
  *(_QWORD *)(v7 + 56) = CGPathRetain(a3);
  *(_QWORD *)(v7 + 64) = a4;
  if (a1)
  {
    objc_msgSend(a1, "emptyData");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  *(_OWORD *)(v7 + 40) = v11;
  *(_OWORD *)(v7 + 24) = v10;
  *(_OWORD *)(v7 + 8) = v9;
  return (id)v7;
}

+ (void)extendClipStrokeKeyframes:(id)a3 withKeyframes:(id)a4 subpathOffset:(float)a5
{
  unint64_t v8;
  uint64_t v9;

  if (objc_msgSend(a4, "length") && objc_msgSend(a4, "length") && objc_msgSend(a4, "length"))
  {
    v8 = 0;
    do
    {
      v9 = 0;
      objc_msgSend(a3, "appendBytes:length:", (char *)objc_msgSend(a4, "bytes") + v8, 8);
      objc_msgSend(a4, "getBytes:range:", (char *)&v9 + 4, v8 + 8, 4);
      objc_msgSend(a4, "getBytes:range:", &v9, v8 + 12, 4);
      *(float *)&v9 = *(float *)&v9 + a5;
      *((float *)&v9 + 1) = *((float *)&v9 + 1) + a5;
      objc_msgSend(a3, "appendBytes:length:", (char *)&v9 + 4, 4);
      objc_msgSend(a3, "appendBytes:length:", &v9, 4);
      v8 += 16;
    }
    while (v8 < (unint64_t)objc_msgSend(a4, "length"));
  }
}

+ (id)createFromSubpaths:(id)a3 indices:(id)a4
{
  CGPath *Mutable;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  float v13;
  void *i;
  id v15;
  id v16;
  id v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  Mutable = CGPathCreateMutable();
  v8 = objc_msgSend(a3, "count");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(a4);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "integerValue");
        if (v15 < v8)
        {
          v16 = objc_msgSend(a3, "objectAtIndex:", v15);
          CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v16, "path"));
          if (objc_msgSend(v16, "clipStrokeKeyframes"))
          {
            if (!v11)
              v11 = +[NSMutableData data](NSMutableData, "data");
            v17 = objc_msgSend(v16, "clipStrokeKeyframes");
            *(float *)&v18 = v13;
            objc_msgSend(a1, "extendClipStrokeKeyframes:withKeyframes:subpathOffset:", v11, v17, v18);
          }
          v13 = v13 + 1.0;
        }
      }
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v19 = objc_msgSend(a1, "_createAdoptingPath:clipStrokeKeyframes:", Mutable, v11);
  CGPathRelease(Mutable);
  return v19;
}

+ (id)createConcatenatingPaths:(id)a3
{
  CGPath *Mutable;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  float v10;
  void *i;
  void *v12;
  id v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  Mutable = CGPathCreateMutable();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v12, "path"));
        if (objc_msgSend(v12, "clipStrokeKeyframes"))
        {
          if (!v8)
            v8 = +[NSMutableData data](NSMutableData, "data");
          v13 = objc_msgSend(v12, "clipStrokeKeyframes");
          *(float *)&v14 = v10;
          objc_msgSend(a1, "extendClipStrokeKeyframes:withKeyframes:subpathOffset:", v8, v13, v14);
        }
        v10 = v10 + (float)(uint64_t)objc_msgSend(v12, "subpathCount");
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v15 = objc_msgSend(a1, "_createAdoptingPath:clipStrokeKeyframes:", Mutable, v8);
  CGPathRelease(Mutable);
  return v15;
}

- (int64_t)subpathCount
{
  const CGPath *path;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  path = (const CGPath *)self->_path;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__CUIVectorGlyphPath_subpathCount__block_invoke;
  v5[3] = &unk_1E41B8C08;
  v5[4] = v10;
  v5[5] = &v6;
  CGPathApplyWithBlock(path, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v3;
}

uint64_t __34__CUIVectorGlyphPath_subpathCount__block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*a2 == 4)
  {
    if (*(_BYTE *)(v2 + 24))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
      v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    }
    *(_BYTE *)(v2 + 24) = 0;
  }
  else if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
  }
  return result;
}

- (id)createCopyApplyingTransform:(CGAffineTransform *)a3
{
  const CGPath *v4;
  id v5;

  v4 = (const CGPath *)MEMORY[0x1A1AEE52C](self->_path, a3);
  v5 = +[CUIVectorGlyphPath _createAdoptingPath:clipStrokeKeyframes:](CUIVectorGlyphPath, "_createAdoptingPath:clipStrokeKeyframes:", v4, self->_clipStrokeKeyframes);
  CGPathRelease(v4);
  return v5;
}

- (id)createSubpaths
{
  const CGPath *path;
  id v4;
  NSData *clipStrokeKeyframes;
  unint64_t v6;
  double v7;
  float v8;
  NSNumber *v9;
  id v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[4];
  float v15;

  path = (const CGPath *)self->_path;
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  clipStrokeKeyframes = self->_clipStrokeKeyframes;
  if (clipStrokeKeyframes && -[NSData length](clipStrokeKeyframes, "length"))
  {
    v6 = 0;
    do
    {
      LODWORD(v14[0]) = 0;
      v15 = 0.0;
      -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", v14, v6 + 8, 4);
      -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", &v15, v6 + 12, 4);
      v8 = floorf(*(float *)v14);
      if (v8 == floorf(v15))
      {
        *(float *)&v7 = v8;
        v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7);
        v10 = objc_msgSend(v4, "objectForKey:", v9);
        if (!v10)
        {
          v10 = +[NSMutableData data](NSMutableData, "data");
          objc_msgSend(v4, "setObject:forKey:", v10, v9);
        }
        objc_msgSend(v10, "appendBytes:length:", (char *)-[NSData bytes](self->_clipStrokeKeyframes, "bytes") + v6, 8);
        -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", v14, v6 + 8, 4);
        -[NSData getBytes:range:](self->_clipStrokeKeyframes, "getBytes:range:", &v15, v6 + 12, 4);
        *(float *)v14 = *(float *)v14 - v8;
        v15 = v15 - v8;
        objc_msgSend(v10, "appendBytes:length:", v14, 4);
        objc_msgSend(v10, "appendBytes:length:", &v15, 4);
      }
      v6 += 16;
    }
    while (v6 < -[NSData length](self->_clipStrokeKeyframes, "length"));
  }
  if (!path)
    return 0;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __36__CUIVectorGlyphPath_createSubpaths__block_invoke;
  v13[3] = &unk_1E41B8C30;
  v13[5] = v4;
  v13[6] = v14;
  v13[4] = v11;
  CGPathApplyWithBlock(path, v13);
  _Block_object_dispose(v14, 8);
  return v11;
}

void __36__CUIVectorGlyphPath_createSubpaths__block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat *v4;
  CGPath *v5;
  double v6;
  id v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_DWORD *)a2 == 4)
      return;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGPathCreateMutable();
  }
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 16), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 24));
      break;
    case 3:
      v4 = *(CGFloat **)(a2 + 8);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0, *v4, v4[1], v4[2], v4[3], v4[4], v4[5]);
      break;
    case 4:
      v5 = *(CGPath **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v5)
      {
        CGPathCloseSubpath(v5);
        *(float *)&v6 = (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "count");
        v7 = +[CUIVectorGlyphPath _createAdoptingPath:clipStrokeKeyframes:](CUIVectorGlyphPath, "_createAdoptingPath:clipStrokeKeyframes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)));
        CGPathRelease(*(CGPathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
      break;
    default:
      return;
  }
}

- (void)dealloc
{
  float *subpathLengths;
  CUIVectorGlyphPathElementLength *elementLengths;
  unint64_t *elementToSubpath;
  objc_super v6;

  CGPathRelease((CGPathRef)self->_path);
  self->_path = 0;

  self->_clipStrokeKeyframes = 0;
  subpathLengths = self->_lengthData.subpathLengths;
  if (subpathLengths)
    free(subpathLengths);
  elementLengths = self->_lengthData.elementLengths;
  if (elementLengths)
    free(elementLengths);
  elementToSubpath = self->_lengthData.elementToSubpath;
  if (elementToSubpath)
    free(elementToSubpath);
  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphPath;
  -[CUIVectorGlyphPath dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CUIVectorGlyphPath createWithPath:clipStrokeKeyframes:](CUIVectorGlyphPath, "createWithPath:clipStrokeKeyframes:", self->_path, self->_clipStrokeKeyframes);
}

- (id)path
{
  return self->_path;
}

- (NSData)clipStrokeKeyframes
{
  return self->_clipStrokeKeyframes;
}

@end

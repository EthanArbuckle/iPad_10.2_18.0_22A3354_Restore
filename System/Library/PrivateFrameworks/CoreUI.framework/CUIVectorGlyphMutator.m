@implementation CUIVectorGlyphMutator

+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphWeight:(int64_t)a3 glyphSize:(int64_t)a4
{
  double v4;
  double v7;
  uint64_t *v8;
  id v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_msgSend(a1, "transformForGlyphSize:", a4);
  switch(a3)
  {
    case 0:
    case 4:
      v8 = &_CUIVectorGlyphContinuousWeightRegular;
      goto LABEL_11;
    case 1:
      v8 = &_CUIVectorGlyphContinuousWeightUltralight;
      goto LABEL_11;
    case 2:
      v8 = &_CUIVectorGlyphContinuousWeightThin;
      goto LABEL_11;
    case 3:
      v8 = &_CUIVectorGlyphContinuousWeightLight;
      goto LABEL_11;
    case 5:
      v8 = &_CUIVectorGlyphContinuousWeightMedium;
      goto LABEL_11;
    case 6:
      v8 = &_CUIVectorGlyphContinuousWeightSemibold;
      goto LABEL_11;
    case 7:
      v8 = &_CUIVectorGlyphContinuousWeightBold;
      goto LABEL_11;
    case 8:
      v8 = &_CUIVectorGlyphContinuousWeightHeavy;
      goto LABEL_11;
    case 9:
      v8 = &_CUIVectorGlyphContinuousWeightBlack;
LABEL_11:
      v4 = *(double *)v8;
      break;
    default:
      break;
  }
  v9 = objc_msgSend(objc_msgSend(a1, "_interpolationData"), "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  if (!v9)
    +[CUIVectorGlyphMutator scalarsForGlyphWeight:glyphSize:].cold.1();
  objc_msgSend(a1, "_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:", v9, 1, v4);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphSize:(int64_t)a3
{
  double v3;
  double v4;
  uint64_t *v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = 0.0;
  if ((unint64_t)a3 < 2)
  {
    v4 = 1.0;
  }
  else
  {
    if (a3 == 2)
    {
      v5 = &_CUIVectorGlyphContinuousSizeMedium;
      goto LABEL_7;
    }
    v4 = 0.0;
    if (a3 == 3)
    {
      v5 = &_CUIVectorGlyphContinuousSizeLarge;
LABEL_7:
      v4 = *(double *)v5;
      v3 = *(double *)v5 * -0.352294922 + 0.352294922;
    }
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

void __36__CUIVectorGlyphMutator_cgPathFrom___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;

  switch(*a2)
  {
    case 0:
      v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * (2 * v3)), *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * ((2 * v3) | 1u)));
      goto LABEL_4;
    case 1:
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * (2 * v4)), *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * ((2 * v4) | 1u)));
LABEL_4:
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(_DWORD *)(v5 + 24) + 1;
      goto LABEL_7;
    case 2:
      v7 = 2 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * v7), *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * (v7 | 1)), *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * (v7 + 2)), *(CGFloat *)(*(_QWORD *)(a1 + 48) + 8 * (v7 + 3)));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(_DWORD *)(v5 + 24) + 2;
      goto LABEL_7;
    case 3:
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 2 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(v8 + 8 * v9), *(CGFloat *)(v8 + 8 * (v9 | 1)), *(CGFloat *)(v8 + 8 * (v9 + 2)), *(CGFloat *)(v8 + 8 * (v9 + 3)), *(CGFloat *)(v8 + 8 * (v9 + 4)), *(CGFloat *)(v8 + 8 * (v9 + 5)));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(_DWORD *)(v5 + 24) + 3;
LABEL_7:
      *(_DWORD *)(v5 + 24) = v6;
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 40));
      break;
    default:
      return;
  }
}

char *__44__CUIVectorGlyphMutator_pointArrayFromPath___block_invoke(char *result, uint64_t a2)
{
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v3 = result;
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      v4 = result + 40;
      v5 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24);
      v6 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24);
      if (v5 + 1 > v6)
      {
        result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 7) + 8) + 24), 2 * (*((_QWORD *)result + 8) + v6));
        v7 = v3[8];
        *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) = result;
        *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 24) += v7;
        v5 = *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24);
      }
      v8 = *(_QWORD **)(a2 + 8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * v5) = *v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 8) = v8[1];
      v9 = 1;
      goto LABEL_11;
    case 2:
      v4 = result + 40;
      v10 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24);
      v11 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24);
      if (v10 + 2 > v11)
      {
        result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 7) + 8) + 24), 2 * (*((_QWORD *)result + 8) + v11));
        v12 = v3[8];
        *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) = result;
        *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 24) += v12;
        v10 = *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24);
      }
      v13 = *(_QWORD **)(a2 + 8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * v10) = *v13;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 8) = v13[1];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 16) = v13[2];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 24) = v13[3];
      v9 = 2;
      goto LABEL_11;
    case 3:
      v4 = result + 40;
      v14 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24);
      v15 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24);
      if (v14 + 3 > v15)
      {
        result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 7) + 8) + 24), 2 * (*((_QWORD *)result + 8) + v15));
        v16 = v3[8];
        *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) = result;
        *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 24) += v16;
        v14 = *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24);
      }
      v17 = *(_QWORD **)(a2 + 8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * v14) = *v17;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 8) = v17[1];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 16) = v17[2];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 24) = v17[3];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 32) = v17[4];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 24) + 16 * *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 24) + 40) = v17[5];
      v9 = 3;
LABEL_11:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 24) += v9;
      break;
    default:
      return result;
  }
  return result;
}

- (CUIVectorGlyphMutator)initWithPointSize:(double)a3 regular:(id)a4 ultralight:(id)a5 black:(id)a6
{
  CUIVectorGlyphMutator *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t numPoints;
  id v27;
  id v28;
  unint64_t v29;
  double v30;
  double v31;
  unint64_t v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CUIVectorGlyphMutator;
  v10 = -[CUIVectorGlyphMutator init](&v42, sel_init);
  if (v10)
  {
    v10->_originPath = (CUIVectorGlyphPath *)a4;
    v10->_ultralightPath = (CUIVectorGlyphPath *)a5;
    v10->_blackPath = (CUIVectorGlyphPath *)a6;
    -[CUIVectorGlyphMutator setPointSize:](v10, "setPointSize:", a3);
    v38 = a4;
    v11 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", objc_msgSend(a4, "path"));
    v13 = v12;
    v14 = a5;
    v15 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", objc_msgSend(a5, "path"));
    v17 = v16;
    v18 = a6;
    v19 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", objc_msgSend(a6, "path"));
    v21 = v20;
    -[CUIVectorGlyphMutator setOriginPoints:](v10, "setOriginPoints:", v11, v13);
    v22 = +[CUIVectorGlyphMutator deltaArrayFrom:to:](CUIVectorGlyphMutator, "deltaArrayFrom:to:", v10->_originPoints.pointComponents, v10->_originPoints.numPoints, v15, v17);
    -[CUIVectorGlyphMutator setUltralightDeltas:](v10, "setUltralightDeltas:", v22, v23);
    v24 = +[CUIVectorGlyphMutator deltaArrayFrom:to:](CUIVectorGlyphMutator, "deltaArrayFrom:to:", v10->_originPoints.pointComponents, v10->_originPoints.numPoints, v19, v21);
    -[CUIVectorGlyphMutator setBlackDeltas:](v10, "setBlackDeltas:", v24, v25);
    free(v15);
    free(v19);
    numPoints = v10->_originPoints.numPoints;
    if (numPoints != v10->_ultralightDeltas.numDeltas)
      -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:].cold.2();
    if (numPoints != v10->_blackDeltas.numDeltas)
      -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:].cold.1();
    if (objc_msgSend(v38, "clipStrokeKeyframes"))
    {
      if (objc_msgSend(v14, "clipStrokeKeyframes"))
      {
        if (objc_msgSend(v18, "clipStrokeKeyframes"))
        {
          if (objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length"))
          {
            if (((unint64_t)objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length") & 0xF) == 0)
            {
              v27 = objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length");
              if (v27 == objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "length"))
              {
                v28 = objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length");
                if (v28 == objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "length"))
                {
                  if (objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length"))
                  {
                    v29 = 0;
                    while (1)
                    {
                      v40 = 0;
                      v41 = 0;
                      v39 = 0;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "getBytes:range:", (char *)&v41 + 4, v29, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v41, v29, 4);
                      LODWORD(v30) = HIDWORD(v41);
                      if (*((float *)&v41 + 1) != *(float *)&v41)
                        break;
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes", v30), "getBytes:range:", &v41, v29, 4);
                      LODWORD(v31) = HIDWORD(v41);
                      if (*((float *)&v41 + 1) != *(float *)&v41)
                        break;
                      v32 = v29 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes", v31), "getBytes:range:", (char *)&v40 + 4, v32, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v40, v32, 4);
                      LODWORD(v33) = HIDWORD(v40);
                      if (*((float *)&v40 + 1) != *(float *)&v40)
                        break;
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes", v33), "getBytes:range:", &v40, v32, 4);
                      LODWORD(v34) = HIDWORD(v40);
                      if (*((float *)&v40 + 1) != *(float *)&v40)
                        break;
                      v35 = v32 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes", v34), "getBytes:range:", (char *)&v39 + 4, v35, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v39, v35, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39))
                        break;
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "getBytes:range:", &v39, v35, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39))
                        break;
                      v36 = v35 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "getBytes:range:", (char *)&v39 + 4, v36, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v39, v36, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39))
                        break;
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "getBytes:range:", &v39, v36, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39))
                        break;
                      v29 = v36 + 4;
                      if (v29 >= (unint64_t)objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length"))
                        goto LABEL_22;
                    }
                  }
                  else
                  {
LABEL_22:
                    v10->_originClipStrokeKeyframes = (NSData *)objc_msgSend(v38, "clipStrokeKeyframes");
                    v10->_ultralightClipStrokeKeyframes = (NSData *)objc_msgSend(v14, "clipStrokeKeyframes");
                    v10->_blackClipStrokeKeyframes = (NSData *)objc_msgSend(v18, "clipStrokeKeyframes");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

+ ($57208586A15A58339C904728178D1914)pointArrayFromPath:(CGPath *)a3
{
  unint64_t v5;
  uint64_t v6;
  double *v7;
  double *v8;
  unint64_t v9;
  _QWORD block[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  $57208586A15A58339C904728178D1914 result;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v22 = malloc_type_calloc(0x64uLL, 8uLL, 0x100004000313F17uLL);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 50;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__CUIVectorGlyphMutator_pointArrayFromPath___block_invoke;
  block[3] = &unk_1E41B1E28;
  block[6] = &v15;
  block[7] = &v19;
  block[4] = a1;
  block[5] = &v11;
  block[8] = 50;
  CGPathApplyWithBlock(a3, block);
  v5 = v16[3];
  v6 = v12[3];
  v7 = (double *)v20[3];
  if (v5 != v6)
  {
    v7 = (double *)objc_msgSend(a1, "realloc_cgfloat_array:withNewCount:", v20[3], 2 * v6);
    v20[3] = (uint64_t)v7;
    v5 = v12[3];
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  v8 = v7;
  v9 = v5;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (double)realloc_cgfloat_array:(double *)a3 withNewCount:(unint64_t)a4
{
  double *result;

  result = (double *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FailedRealloc"), CFSTR("Requested size was not available"));
    return a3;
  }
  return result;
}

+ ($57208586A15A58339C904728178D1914)deltaArrayFrom:(id)a3 to:(id)a4
{
  double *var0;
  unint64_t var1;
  double *v6;
  vDSP_Length v7;
  double *v8;
  double *v9;
  unint64_t v10;
  $57208586A15A58339C904728178D1914 result;

  if (a3.var1 != a4.var1)
    +[CUIVectorGlyphMutator deltaArrayFrom:to:].cold.1();
  var0 = a4.var0;
  var1 = a3.var1;
  v6 = a3.var0;
  v7 = 2 * a3.var1;
  v8 = (double *)malloc_type_malloc(16 * a3.var1, 0x100004000313F17uLL);
  vDSP_vsubD(v6, 1, var0, 1, v8, 1, v7);
  v9 = v8;
  v10 = var1;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setUltralightDeltas:(id)a3
{
  self->_ultralightDeltas = ($73760B565FA833B9811E339F2D9A23FA)a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)setOriginPoints:(id)a3
{
  self->_originPoints = ($F954F316BB7F473710547896A635F93A)a3;
}

- (void)setOriginPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setBlackDeltas:(id)a3
{
  self->_blackDeltas = ($73760B565FA833B9811E339F2D9A23FA)a3;
}

- (id)pathForScalars:(id)a3 andTransform:(id)a4
{
  double var1;
  double var0;
  id v7;
  uint64_t v8;
  _QWORD v10[7];

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = -[CUIVectorGlyphMutator applyDeltasWithScalars:andTransform:](self, "applyDeltasWithScalars:andTransform:", a3.var0, a3.var1, a4.var0, a4.var1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __53__CUIVectorGlyphMutator_pathForScalars_andTransform___block_invoke;
  v10[3] = &unk_1E41B1E00;
  v10[4] = self;
  *(double *)&v10[5] = var0;
  *(double *)&v10[6] = var1;
  return +[CUIVectorGlyphPath createWithPath:clipStrokeKeyframeProvider:](CUIVectorGlyphPath, "createWithPath:clipStrokeKeyframeProvider:", -[CUIVectorGlyphMutator cgPathFrom:](self, "cgPathFrom:", v7, v8), v10);
}

- (void)dealloc
{
  objc_super v3;

  free(-[CUIVectorGlyphMutator originPoints](self, "originPoints"));
  free(-[CUIVectorGlyphMutator ultralightDeltas](self, "ultralightDeltas"));
  free(-[CUIVectorGlyphMutator blackDeltas](self, "blackDeltas"));

  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphMutator;
  -[CUIVectorGlyphMutator dealloc](&v3, sel_dealloc);
}

- ($57208586A15A58339C904728178D1914)ultralightDeltas
{
  unint64_t numDeltas;
  double *deltaComponents;
  $57208586A15A58339C904728178D1914 result;

  numDeltas = self->_ultralightDeltas.numDeltas;
  deltaComponents = self->_ultralightDeltas.deltaComponents;
  result.var1 = numDeltas;
  result.var0 = deltaComponents;
  return result;
}

- ($57208586A15A58339C904728178D1914)originPoints
{
  unint64_t numPoints;
  double *pointComponents;
  $57208586A15A58339C904728178D1914 result;

  numPoints = self->_originPoints.numPoints;
  pointComponents = self->_originPoints.pointComponents;
  result.var1 = numPoints;
  result.var0 = pointComponents;
  return result;
}

- ($57208586A15A58339C904728178D1914)blackDeltas
{
  unint64_t numDeltas;
  double *deltaComponents;
  $57208586A15A58339C904728178D1914 result;

  numDeltas = self->_blackDeltas.numDeltas;
  deltaComponents = self->_blackDeltas.deltaComponents;
  result.var1 = numDeltas;
  result.var0 = deltaComponents;
  return result;
}

- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3 andTransform:(id)a4
{
  unint64_t numDeltas;
  vDSP_Length v6;
  double *v7;
  void *v8;
  double var1;
  double v10;
  unint64_t numPoints;
  double *v12;
  double v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 __B;
  $57208586A15A58339C904728178D1914 result;

  __B = a3;
  v14 = a4;
  numDeltas = self->_ultralightDeltas.numDeltas;
  v6 = 2 * numDeltas;
  v7 = &v13 - 2 * numDeltas;
  vDSP_vsmsmaD(self->_ultralightDeltas.deltaComponents, 1, &__B.var0, self->_blackDeltas.deltaComponents, 1, &__B.var1, v7, 1, 2 * numDeltas);
  v8 = malloc_type_malloc(16 * numDeltas, 0x100004000313F17uLL);
  vDSP_vaddD(self->_originPoints.pointComponents, 1, v7, 1, (double *)v8, 1, v6);
  vDSP_vsmulD((const double *)v8, 1, &v14.var0, (double *)v8, 1, v6);
  var1 = v14.var1;
  -[CUIVectorGlyphMutator pointSize](self, "pointSize");
  v13 = var1 * v10;
  vDSP_vsaddD((const double *)v8 + 1, 2, &v13, (double *)v8 + 1, 2, self->_originPoints.numPoints);
  numPoints = self->_originPoints.numPoints;
  v12 = (double *)v8;
  result.var1 = numPoints;
  result.var0 = v12;
  return result;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (CGPath)cgPathFrom:(id)a3
{
  double *var0;
  CGMutablePathRef Mutable;
  const CGPath *v6;
  _QWORD block[7];
  _QWORD v9[3];
  int v10;

  var0 = a3.var0;
  Mutable = CGPathCreateMutable();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6 = -[CUIVectorGlyphPath path](self->_originPath, "path");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __36__CUIVectorGlyphMutator_cgPathFrom___block_invoke;
  block[3] = &unk_1E41B1E50;
  block[5] = Mutable;
  block[6] = var0;
  block[4] = v9;
  CGPathApplyWithBlock(v6, block);
  free(var0);
  CFAutorelease(Mutable);
  _Block_object_dispose(v9, 8);
  return Mutable;
}

+ (id)_interpolationData
{
  if (_interpolationData_once != -1)
    dispatch_once(&_interpolationData_once, &__block_literal_global_10);
  return (id)_interpolationData_interpolationData;
}

id __43__CUIVectorGlyphMutator__interpolationData__block_invoke()
{
  id v0;
  id result;
  _QWORD v2[9];
  _QWORD v3[9];
  _QWORD v4[9];
  _QWORD v5[9];
  _QWORD v6[9];
  _QWORD v7[9];
  _QWORD v8[9];
  _QWORD v9[9];
  _QWORD v10[9];
  _QWORD v11[9];
  _QWORD v12[9];
  _QWORD v13[9];
  _QWORD v14[6];
  _QWORD v15[6];

  v0 = objc_alloc((Class)NSDictionary);
  v14[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.2);
  v12[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v13[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0115, 0.0221);
  v12[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v13[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.0661);
  v12[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v13[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.435);
  v12[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v13[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.6924);
  v12[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v13[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.8145);
  v12[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v13[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.9057);
  v12[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.006, 0.9609);
  v12[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 1.1061);
  v12[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v13[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.1324, 1.132);
  v15[0] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 9);
  v14[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.5);
  v10[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v11[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.6338, 0.0);
  v10[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v11[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.2328, 0.0);
  v10[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v11[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0528, 0.2287);
  v10[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v11[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.4969);
  v10[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v11[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.6859);
  v10[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v11[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.7909);
  v10[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4);
  v11[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0739, 0.8937);
  v10[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.56);
  v11[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.076, 1.08);
  v10[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v11[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.1325, 1.1847);
  v15[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 9);
  v14[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0);
  v8[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v9[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.0, 0.0);
  v8[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v9[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.774193548, 0.0);
  v8[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v9[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.333333333, 0.0);
  v8[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v9[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.0);
  v8[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v9[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.18);
  v8[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v9[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.318);
  v8[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4);
  v9[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.5);
  v8[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.56);
  v9[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.763978947);
  v8[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v9[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 1.0);
  v15[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
  v14[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.276);
  v6[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v7[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.06801437, 0.0);
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v7[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.86796777, 0.0);
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v7[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.477400592, 0.0);
  v6[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v7[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1820937, 0.0);
  v6[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v7[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.148437509, 0.164952978);
  v6[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v7[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.122634428, 0.291416928);
  v6[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4);
  v7[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0886042787, 0.458202717);
  v6[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.56);
  v7[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0392418641, 0.700133751);
  v6[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v7[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.00488514296, 0.916405434);
  v15[3] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v14[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.647);
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v5[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.1353466, 0.0);
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v5[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.962479273, 0.0);
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v5[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.624976402, 0.0);
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v5[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.369791304, 0.0);
  v4[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v5[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.300349522, 0.130728598);
  v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v5[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.247110822, 0.230953856);
  v4[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4);
  v5[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.176897463, 0.363134994);
  v4[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.56);
  v5[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0750495154, 0.554870272);
  v4[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v5[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0159963775, 0.726269989);
  v15[4] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 9);
  v14[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2.0);
  v2[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.8);
  v3[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.1162, -0.0495);
  v2[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.6);
  v3[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.0524, -0.0104);
  v2[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -0.4);
  v3[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.7878, 0.0);
  v2[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
  v3[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.5464, 0.0);
  v2[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.23);
  v3[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.4641, 0.1072);
  v2[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
  v3[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.3875, 0.2173);
  v2[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.4);
  v3[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.2925, 0.352);
  v2[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.56);
  v3[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1862, 0.5134);
  v2[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.62);
  v3[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1176, 0.707);
  v15[5] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  result = objc_msgSend(v0, "initWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 6));
  _interpolationData_interpolationData = (uint64_t)result;
  return result;
}

- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3
{
  double *v3;
  unint64_t v4;
  $57208586A15A58339C904728178D1914 result;

  v3 = (double *)-[CUIVectorGlyphMutator applyDeltasWithScalars:andTransform:](self, "applyDeltasWithScalars:andTransform:", a3.var0, a3.var1, 1.0, 0.0);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)convertDistance0:(float)a3 distance1:(float)a4 elementIndex0Out:(unint64_t *)a5 distance0Out:(float *)a6 elementIndex1Out:(unint64_t *)a7 distance1Out:(float *)a8 forSubpath:(unint64_t)a9 data:(CUIVectorGlyphPathLengthData *)a10
{
  unint64_t numElements;
  unint64_t v11;
  double v12;
  float v13;
  float v14;
  unint64_t *elementToSubpath;
  unint64_t v16;
  CUIVectorGlyphPathElementLength *v17;
  float var0;
  float var1;
  float v20;
  BOOL v21;
  float v22;
  float v23;
  float v25;

  numElements = a10->numElements;
  if (numElements)
  {
    v11 = 0;
    v12 = a10->subpathLengths[a9];
    v13 = (a3 - floor(a3)) * v12;
    v14 = (a4 - floor(a4)) * v12;
    elementToSubpath = a10->elementToSubpath;
    do
    {
      v16 = elementToSubpath[v11];
      if (v16 >= a9)
      {
        v17 = &a10->elementLengths[v11];
        var0 = v17->var0;
        var1 = v17->var1;
        v20 = v17->var0 + var1;
        v21 = *a6 != -1.0 || v20 <= v13;
        v22 = fabsf(var1);
        if (!v21)
        {
          v23 = 0.0;
          if (v22 >= 0.00000011921)
            v23 = (float)(v13 - var0) / var1;
          *a5 = v11;
          *a6 = v23;
        }
        if (*a8 == -1.0 && v20 > v14)
        {
          v25 = 0.0;
          if (v22 >= 0.00000011921)
            v25 = (float)(v14 - var0) / var1;
          *a7 = v11;
          *a8 = v25;
        }
        if (v16 > a9)
          return;
        numElements = a10->numElements;
      }
      ++v11;
    }
    while (v11 < numElements);
  }
}

- (id)clipStrokeKeyframesForPath:(id)a3 scalars:(id)a4
{
  double var1;
  double var0;
  id v6;
  uint64_t v8;
  CUIVectorGlyphPath *originPath;
  uint64_t v10;
  CUIVectorGlyphPath *ultralightPath;
  uint64_t v12;
  CUIVectorGlyphPath *blackPath;
  _BOOL4 v14;
  NSMutableData *v15;
  uint64_t v16;
  CUIVectorGlyphPath *v17;
  uint64_t v18;
  CUIVectorGlyphPath *v19;
  uint64_t v20;
  CUIVectorGlyphPath *v21;
  CUIVectorGlyphPath *v22;
  uint64_t v23;
  CUIVectorGlyphPath *v24;
  uint64_t v25;
  CUIVectorGlyphPath *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  uint64_t v31;
  CUIVectorGlyphPath *v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  CUIVectorGlyphPath *v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  CUIVectorGlyphPath *v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[7];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;

  if (!self->_originClipStrokeKeyframes)
    return 0;
  var1 = a4.var1;
  var0 = a4.var0;
  v6 = a3;
  if (a3)
  {
    objc_msgSend(a3, "lengthData");
    v8 = *((_QWORD *)&v107 + 1);
  }
  else
  {
    v8 = 0;
    v108 = 0u;
    v109 = 0u;
    v107 = 0u;
  }
  originPath = self->_originPath;
  if (originPath)
  {
    -[CUIVectorGlyphPath lengthData](originPath, "lengthData");
    v10 = *((_QWORD *)&v104 + 1);
  }
  else
  {
    v10 = 0;
    v105 = 0u;
    v106 = 0u;
    v104 = 0u;
  }
  ultralightPath = self->_ultralightPath;
  if (ultralightPath)
  {
    -[CUIVectorGlyphPath lengthData](ultralightPath, "lengthData");
    v12 = *((_QWORD *)&v101 + 1);
  }
  else
  {
    v12 = 0;
    v102 = 0u;
    v103 = 0u;
    v101 = 0u;
  }
  blackPath = self->_blackPath;
  if (blackPath)
  {
    -[CUIVectorGlyphPath lengthData](blackPath, "lengthData");
    v14 = *((_QWORD *)&v98 + 1) != 0;
  }
  else
  {
    v14 = 0;
    v99 = 0u;
    v100 = 0u;
    v98 = 0u;
  }
  v15 = 0;
  if (!v8 || !v10 || !v12 || !v14)
    return v15;
  if (v6)
  {
    objc_msgSend(v6, "lengthData");
    v16 = v96;
  }
  else
  {
    v16 = 0;
    v96 = 0u;
    v97 = 0u;
    v95 = 0u;
  }
  v17 = self->_originPath;
  if (v17)
  {
    -[CUIVectorGlyphPath lengthData](v17, "lengthData");
    v18 = v93;
  }
  else
  {
    v18 = 0;
    v93 = 0u;
    v94 = 0u;
    v92 = 0u;
  }
  v19 = self->_ultralightPath;
  if (v19)
  {
    -[CUIVectorGlyphPath lengthData](v19, "lengthData");
    v20 = v90;
  }
  else
  {
    v20 = 0;
    v90 = 0u;
    v91 = 0u;
    v89 = 0u;
  }
  v21 = self->_blackPath;
  if (!v21)
    return 0;
  -[CUIVectorGlyphPath lengthData](v21, "lengthData");
  v15 = 0;
  if (!v16 || !v18 || !v20 || !v88)
    return v15;
  if (v6)
  {
    objc_msgSend(v6, "lengthData");
    v6 = (id)*((_QWORD *)&v86 + 1);
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
    v85 = 0u;
  }
  v22 = self->_originPath;
  if (v22)
  {
    -[CUIVectorGlyphPath lengthData](v22, "lengthData");
    v23 = *((_QWORD *)&v83 + 1);
  }
  else
  {
    v23 = 0;
    v83 = 0u;
    v84 = 0u;
    v82 = 0u;
  }
  v24 = self->_ultralightPath;
  if (v24)
  {
    -[CUIVectorGlyphPath lengthData](v24, "lengthData");
    v25 = *((_QWORD *)&v80 + 1);
  }
  else
  {
    v25 = 0;
    v80 = 0u;
    v81 = 0u;
    v79 = 0u;
  }
  v26 = self->_blackPath;
  if (!v26)
    return 0;
  -[CUIVectorGlyphPath lengthData](v26, "lengthData");
  v15 = 0;
  if (v6)
  {
    if (v23)
    {
      if (v25)
      {
        if (v78[4])
        {
          v15 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", -[NSData length](self->_originClipStrokeKeyframes, "length"));
          if (-[NSData length](self->_originClipStrokeKeyframes, "length"))
          {
            v27 = 0;
            while (1)
            {
              v77 = 0;
              v78[0] = 0;
              v76 = 0;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", (char *)v78 + 4, v27, 4);
              -[NSMutableData appendBytes:length:](v15, "appendBytes:length:", (char *)v78 + 4, 4);
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", v78, v27 + 4, 4);
              -[NSMutableData appendBytes:length:](v15, "appendBytes:length:", v78, 4);
              v28 = v27 + 8;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", (char *)&v77 + 4, v27 + 8, 4);
              v29 = v27 + 12;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", &v77, v29, 4);
              v31 = v77;
              v74 = 0;
              v75 = 0;
              v72 = 0;
              v73 = 0;
              v70 = 0;
              v71 = 0;
              v68 = -1.0;
              v69 = -1.0;
              v66 = -1.0;
              v67 = -1.0;
              v64 = -1.0;
              v65 = -1.0;
              v32 = self->_originPath;
              if (v32)
              {
                -[CUIVectorGlyphPath lengthData](v32, "lengthData");
              }
              else
              {
                HIDWORD(v33) = 0;
                v62 = 0u;
                v63 = 0u;
                v61 = 0u;
              }
              v34 = vcvtms_u32_f32(*((float *)&v31 + 1));
              LODWORD(v33) = HIDWORD(v31);
              LODWORD(v30) = v31;
              -[CUIVectorGlyphMutator convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:](self, "convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:", &v75, &v69, &v74, &v68, v34, &v61, v33, v30);
              if (v69 == -1.0)
                break;
              *(float *)&v35 = v68;
              if (v68 == -1.0)
                break;
              -[NSData getBytes:range:](self->_ultralightClipStrokeKeyframes, "getBytes:range:", (char *)&v76 + 4, v28, 4, v35);
              -[NSData getBytes:range:](self->_ultralightClipStrokeKeyframes, "getBytes:range:", &v76, v29, 4);
              v37 = v76;
              v38 = self->_ultralightPath;
              if (v38)
              {
                -[CUIVectorGlyphPath lengthData](v38, "lengthData");
              }
              else
              {
                HIDWORD(v39) = 0;
                v59 = 0u;
                v60 = 0u;
                v58 = 0u;
              }
              LODWORD(v39) = HIDWORD(v37);
              LODWORD(v36) = v37;
              -[CUIVectorGlyphMutator convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:](self, "convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:", &v73, &v67, &v72, &v66, v34, &v58, v39, v36);
              if (v67 == -1.0)
                break;
              *(float *)&v40 = v66;
              if (v66 == -1.0)
                break;
              -[NSData getBytes:range:](self->_blackClipStrokeKeyframes, "getBytes:range:", (char *)&v76 + 4, v28, 4, v40);
              -[NSData getBytes:range:](self->_blackClipStrokeKeyframes, "getBytes:range:", &v76, v29, 4);
              v42 = v76;
              v43 = self->_blackPath;
              if (v43)
              {
                -[CUIVectorGlyphPath lengthData](v43, "lengthData");
              }
              else
              {
                HIDWORD(v44) = 0;
                v56 = 0u;
                v57 = 0u;
                v55 = 0u;
              }
              LODWORD(v44) = HIDWORD(v42);
              LODWORD(v41) = v42;
              -[CUIVectorGlyphMutator convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:](self, "convertDistance0:distance1:elementIndex0Out:distance0Out:elementIndex1Out:distance1Out:forSubpath:data:", &v71, &v65, &v70, &v64, v34, &v55, v44, v41);
              if (v65 == -1.0 || v64 == -1.0)
                break;
              v45 = *(float *)(v8 + 4 * v34);
              v46 = fabsf(v45);
              v47 = 0.0;
              if (v46 >= 0.00000011921)
              {
                v48 = *(float *)(v16 + 8 * v75) + (float)(*(float *)(v16 + 8 * v75 + 4) * v69);
                v49 = v48
                    + var0
                    * (float)((float)(*(float *)(v16 + 8 * v73) + (float)(*(float *)(v16 + 8 * v73 + 4) * v67)) - v48)
                    + var1
                    * (float)((float)(*(float *)(v16 + 8 * v71) + (float)(*(float *)(v16 + 8 * v71 + 4) * v65)) - v48);
                v47 = v49 / v45;
              }
              v50 = *(float *)(v16 + 8 * v74) + (float)(*(float *)(v16 + 8 * v74 + 4) * v68);
              v51 = v50
                  + var0
                  * (float)((float)(*(float *)(v16 + 8 * v72) + (float)(*(float *)(v16 + 8 * v72 + 4) * v66)) - v50)
                  + var1
                  * (float)((float)(*(float *)(v16 + 8 * v70) + (float)(*(float *)(v16 + 8 * v70 + 4) * v64)) - v50);
              v52 = v51 / v45;
              if (v46 >= 0.00000011921)
                v53 = v52;
              else
                v53 = 0.0;
              *(float *)&v77 = v53 + (float)v34;
              *((float *)&v77 + 1) = v47 + (float)v34;
              -[NSMutableData appendBytes:length:](v15, "appendBytes:length:", (char *)&v77 + 4, 4, v55, v56, v57, v58, v59, v60, v61, v62, v63);
              -[NSMutableData appendBytes:length:](v15, "appendBytes:length:", &v77, 4);
              v27 = v29 + 4;
              if (v27 >= -[NSData length](self->_originClipStrokeKeyframes, "length"))
                return v15;
            }
            return 0;
          }
        }
      }
    }
  }
  return v15;
}

- (id)pathForScalars:(id)a3
{
  return -[CUIVectorGlyphMutator pathForScalars:andTransform:](self, "pathForScalars:andTransform:", a3.var0, a3.var1, 1.0, 0.0);
}

id __53__CUIVectorGlyphMutator_pathForScalars_andTransform___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clipStrokeKeyframesForPath:scalars:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphContinuousSize:(double)a3
{
  uint64_t v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphSizes[v3] != a3)
  {
    if (++v3 == 3)
      goto LABEL_7;
  }
  if (kCoreThemeDiscreteGlyphSizes[v3])
  {
    objc_msgSend(a1, "transformForGlyphSize:");
    goto LABEL_8;
  }
LABEL_7:
  v4 = a3 * -0.352294922 + 0.352294922;
LABEL_8:
  result.var1 = v4;
  result.var0 = a3;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_scalarsForGlyphContinuousWeight:(double)a3 inDictionary:(id)a4 shouldClamp:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (!a4)
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:].cold.1();
  v7 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a5));
  if (v7)
    goto LABEL_5;
  v9 = _segmentForGlyphContinuousWeight(0, a3);
  v10 = v8;
  if (vabdd_f64(v8, v9) < 2.22044605e-16)
  {
    v7 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    if (!v7)
      +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:].cold.2();
LABEL_5:
    objc_msgSend(v7, "deltaScalarsValue");
    goto LABEL_18;
  }
  v13 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  v14 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  if (!v13)
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:].cold.3();
  v15 = v14;
  if (!v14)
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:].cold.4();
  objc_msgSend(v13, "deltaScalarsValue");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "deltaScalarsValue");
  v22 = (a3 - v9) / (v10 - v9);
  v23 = v20 + (v17 - v20) * v22;
  v24 = v21 + (v19 - v21) * v22;
  v25 = (a3 - v10) / (v10 - v9) + 1.0;
  v26 = v20 + (v17 - v20) * v25;
  if (v10 < a3)
    v24 = v21 + (v19 - v21) * v25;
  else
    v26 = v23;
  v27 = (v9 - a3) / (v10 - v9) + 1.0;
  v11 = v17 + (v20 - v17) * v27;
  v12 = v19 + (v21 - v19) * v27;
  if (v9 <= a3)
  {
    v11 = v26;
    v12 = v24;
  }
LABEL_18:
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphContinuousWeight:(double)a3 glyphContinuousSize:(double)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v7 = objc_msgSend(a1, "_interpolationData");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  if (v8)
  {
    v9 = v8;
    v10 = a1;
    v11 = a3;
  }
  else
  {
    v12 = _segmentForGlyphContinuousSize(0, a4);
    v14 = v13;
    v15 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    v16 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    if (!v15)
      +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:].cold.1();
    v17 = v16;
    if (!v16)
      +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:].cold.2();
    v18 = v14 - v12;
    if (fabs(v14 - v12) >= 2.22044605e-16)
    {
      objc_msgSend(a1, "_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:", v15, 0, a3);
      v22 = v21;
      v24 = v23;
      objc_msgSend(a1, "_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:", v17, 0, a3);
      v25 = (a4 - v12) / v18;
      v19 = v26 + (v22 - v26) * v25;
      v20 = v27 + (v24 - v27) * v25;
      goto LABEL_11;
    }
    v10 = a1;
    v11 = a3;
    v9 = v17;
  }
  objc_msgSend(v10, "_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:", v9, 0, v11);
LABEL_11:
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (CUIVectorGlyphPath)originPath
{
  return self->_originPath;
}

- (CUIVectorGlyphPath)ultralightPath
{
  return self->_ultralightPath;
}

- (void)setUltralightPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CUIVectorGlyphPath)blackPath
{
  return self->_blackPath;
}

- (void)setBlackPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)originClipStrokeKeyframes
{
  return self->_originClipStrokeKeyframes;
}

- (void)setOriginClipStrokeKeyframes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSData)ultralightClipStrokeKeyframes
{
  return self->_ultralightClipStrokeKeyframes;
}

- (void)setUltralightClipStrokeKeyframes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSData)blackClipStrokeKeyframes
{
  return self->_blackClipStrokeKeyframes;
}

- (void)setBlackClipStrokeKeyframes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)initWithPointSize:regular:ultralight:black:.cold.1()
{
  __assert_rtn("-[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]", "CUIVectorGlyphMutator.m", 114, "_originPoints.numPoints == _blackDeltas.numDeltas");
}

- (void)initWithPointSize:regular:ultralight:black:.cold.2()
{
  __assert_rtn("-[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]", "CUIVectorGlyphMutator.m", 113, "_originPoints.numPoints == _ultralightDeltas.numDeltas");
}

+ (void)deltaArrayFrom:to:.cold.1()
{
  __assert_rtn("+[CUIVectorGlyphMutator deltaArrayFrom:to:]", "CUIVectorGlyphMutator.m", 557, "start.numPoints == end.numPoints");
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.1()
{
  __assert_rtn("+[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]", "CUIVectorGlyphMutator.m", 607, "dictionary");
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.2()
{
  __assert_rtn("+[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]", "CUIVectorGlyphMutator.m", 623, "entry");
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.3()
{
  __assert_rtn("+[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]", "CUIVectorGlyphMutator.m", 630, "upperVal");
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.4()
{
  __assert_rtn("+[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]", "CUIVectorGlyphMutator.m", 631, "lowerVal");
}

+ (void)scalarsForGlyphContinuousWeight:glyphContinuousSize:.cold.1()
{
  __assert_rtn("+[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:]", "CUIVectorGlyphMutator.m", 669, "upperEntry");
}

+ (void)scalarsForGlyphContinuousWeight:glyphContinuousSize:.cold.2()
{
  __assert_rtn("+[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:]", "CUIVectorGlyphMutator.m", 670, "lowerEntry");
}

+ (void)scalarsForGlyphWeight:glyphSize:.cold.1()
{
  __assert_rtn("+[CUIVectorGlyphMutator scalarsForGlyphWeight:glyphSize:]", "CUIVectorGlyphMutator.m", 691, "entry");
}

@end

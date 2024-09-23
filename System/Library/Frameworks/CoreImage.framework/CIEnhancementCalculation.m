@implementation CIEnhancementCalculation

- (CIEnhancementCalculation)init
{
  CIEnhancementCalculation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculation;
  result = -[CIEnhancementCalculation init](&v3, sel_init);
  if (result)
  {
    result->exposureValue = 0.0;
    *(_OWORD *)&result->satHist = 0u;
    *(_OWORD *)&result->lumHist = 0u;
    result->faceInputSet = 0;
    result->originalFaceColor.i = 0.0;
    result->originalFaceColor.q = 0.0;
    *(_OWORD *)&result->maxShadow = xmmword_192493BA0;
    *(_OWORD *)&result->exposureValueAtZeroShadow = xmmword_1924948F0;
    result->percentFaceChange = 0.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculation;
  -[CIEnhancementCalculation dealloc](&v3, sel_dealloc);
}

- (void)setCurvePercent:(double)a3
{
  self->curvePercent = fmax(fmin(a3, 1.0), 0.0);
}

- (void)setLuminanceHistogram:(id)a3
{
  self->lumHist = (CIEnhancementHistogram *)a3;
}

- (void)setRGBSumHistogram:(id)a3
{
  self->rgbSumHist = (CIEnhancementHistogram *)a3;
}

- (void)setBorderHistogram:(id)a3
{
  self->borderHist = (CIEnhancementHistogram *)a3;
}

- (void)setSaturationHistogram:(id)a3
{
  self->satHist = (CIEnhancementHistogram *)a3;
}

+ (double)bestWarmthForI:(double)a3 q:(double)a4 percentChange:(double *)a5
{
  double v5;
  double v6;

  if (a5)
  {
    v5 = (unk_1EE27D030 - unk_1EE27D020) * (unk_1EE27D030 - unk_1EE27D020);
    v6 = fmin(fmax(((a4 - unk_1EE27D020) * (unk_1EE27D030 - unk_1EE27D020)+ (a3 - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ))/ (v5+ (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)), 0.0), 1.0)* 0.75+ 0.25;
    *a5 = sqrt((a3- (*(double *)&faceBalanceIndoorIQ+ v6 * (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)))* (a3- (*(double *)&faceBalanceIndoorIQ+ v6 * (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)))+ (a4 - (unk_1EE27D020 + v6 * (unk_1EE27D030 - unk_1EE27D020)))* (a4 - (unk_1EE27D020 + v6 * (unk_1EE27D030 - unk_1EE27D020))))/ sqrt((*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)* (*(double *)&faceBalanceOutdoorIQ - *(double *)&faceBalanceIndoorIQ)+ v5);
  }
  return 0.5;
}

- (void)setFaceColorFromChromaI:(double)a3 andChromaQ:(double)a4
{
  self->originalFaceColor.i = a3;
  self->originalFaceColor.q = a4;
  self->faceInputSet = 1;
  +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", &self->percentFaceChange);
}

- (void)setupFaceColor:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  unint64_t v36;
  double v37;
  long double v38;
  long double v39;
  double v41;
  CIEnhancementCalculation *v42;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  unint64_t i;
  void *v52;
  long double __x;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v45)
  {
    v42 = self;
    v44 = *(_QWORD *)v55;
    v10 = a4;
    v11 = a5;
    v12 = a6;
    v13 = 0.0;
    v14 = 1.0;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(a3);
        v48 = v16;
        v47 = v17;
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "bytesPerPixel");
        v20 = objc_msgSend(v18, "width");
        v52 = v18;
        v21 = objc_msgSend(v18, "height");
        v22 = v21;
        v49 = v15;
        v50 = v13;
        v46 = v20;
        if (v21)
        {
          v23 = 0;
          v24 = v14 / ((double)v20 * (double)v21);
          v25 = v20 - 1;
          v26 = 0.0;
          v27 = 0.0;
          for (i = v21; i > v23; v22 = i)
          {
            v28 = objc_msgSend(v52, "rowAtIndex:", v23);
            if (v25)
            {
              v30 = v28;
              v31 = 0;
              v32 = 1;
              do
              {
                v33 = v30 + v31;
                LOBYTE(v29) = *(_BYTE *)(v33 + v10);
                *(double *)&v34 = pow((double)*(unint64_t *)&v29 / 255.0, 0.555555556);
                v35 = *(double *)&v34;
                LOBYTE(v34) = *(_BYTE *)(v33 + v11);
                *(double *)&v36 = pow((double)v34 / 255.0, 0.555555556);
                v37 = *(double *)&v36;
                LOBYTE(v36) = *(_BYTE *)(v33 + v12);
                v38 = pow((double)v36 / 255.0, 0.555555556);
                v39 = v37 * -0.2755 + v35 * 0.596 + v38 * -0.321;
                v29 = v37 * -0.523 + v35 * 0.212 + v38 * 0.311;
                v26 = v26 + v24 * v39;
                v27 = v27 + v24 * v29;
                v31 += v19;
              }
              while (v25 > v32++);
            }
            v23 = (v23 + 1);
          }
        }
        else
        {
          v27 = 0.0;
          v26 = 0.0;
        }
        __x = 0.0;
        +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", &__x, v26, v27);
        v14 = 1.0;
        v41 = fmin(1.0 / fmax(pow(__x, 3.0), 0.0001), 1.0) * (double)(v22 * v46);
        v16 = v48 + v41 * v26;
        v15 = v49 + v41 * v27;
        v13 = v50 + v41;
        v17 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v45);
    if (v13 > 0.0)
      -[CIEnhancementCalculation setFaceColorFromChromaI:andChromaQ:](v42, "setFaceColorFromChromaI:andChromaQ:", v16 / v13, v15 / v13);
  }
}

- (void)setExposureValue:(double)a3
{
  self->exposureValue = a3;
}

- (void)setShadowsMin:(double)a3 max:(double)a4 zeroExposure:(double)a5
{
  self->maxShadow = fmax(a4, 0.0);
  self->minShadow = fmin(a3, 0.0);
  self->exposureValueAtZeroShadow = a5;
}

- (id)faceBalanceStrength
{
  if (self->faceInputSet)
    return &unk_1E2F1B390;
  else
    return 0;
}

- (id)faceBalanceWarmth
{
  void *v2;

  if (!self->faceInputSet)
    return 0;
  v2 = (void *)MEMORY[0x1E0CB37E8];
  +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", 0, self->originalFaceColor.i, self->originalFaceColor.q);
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)originalFaceColor
{
  double i;
  double q;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  i = self->originalFaceColor.i;
  q = self->originalFaceColor.q;
  result.var1 = q;
  result.var0 = i;
  return result;
}

- (id)vibrance
{
  id result;
  uint64_t v4;
  double v5;
  unint64_t v6;
  int v7;
  long double v8;
  void *v9;
  double v10;
  long double v11;

  result = self->satHist;
  if (result)
  {
    v4 = objc_msgSend(result, "values");
    v5 = 0.0;
    v6 = 255;
    do
    {
      v7 = v6 - 1;
      if (v6 < 2)
        break;
      v5 = v5 + *(double *)(v4 + 8 * v6--);
    }
    while (v5 < 0.02);
    v8 = (255.0 - (double)v7) / 255.0;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = fmax(1.0 - self->percentFaceChange, 0.0) * 8.0 * 0.4;
    v11 = pow(v8, 3.0) * v10;
    return (id)objc_msgSend(v9, "numberWithDouble:", (double)(pow(1.0 - v8, 1.6) * v11));
  }
  return result;
}

- (unint64_t)curveCount
{
  if (self->rgbSumHist)
    return 5;
  else
    return 0;
}

- (CGPoint)curvePointAtIndex:(unint64_t)a3
{
  CIEnhancementHistogram *rgbSumHist;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double curvePercent;
  double v20;
  _QWORD *v21;
  uint64_t v22;
  double *v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  uint64_t v30;
  double v31;
  __int128 v32;
  uint64_t v33;
  _OWORD v34[5];
  uint64_t v35;
  CGPoint result;

  v35 = *MEMORY[0x1E0C80C00];
  v34[2] = xmmword_1924991E8;
  v34[3] = unk_1924991F8;
  v34[4] = xmmword_192499208;
  v34[0] = xmmword_1924991C8;
  v34[1] = unk_1924991D8;
  rgbSumHist = self->rgbSumHist;
  if (rgbSumHist)
  {
    v30 = 0;
    v32 = 0u;
    v31 = 0.25;
    v33 = 0x3FF0000000000000;
    v29 = 0.0;
    v27 = 0u;
    v28 = 0u;
    v6 = -[CIEnhancementHistogram values](rgbSumHist, "values", 0x3F50624DD2F1A9FCLL, 0x3FD0000000000000, 0x3FE0000000000000, 0x3FE8000000000000, 0x3FEFF7CED916872BLL);
    v7 = 0;
    v8 = 0.0;
    do
    {
      v8 = v8 + *(double *)(v6 + v7);
      v7 += 8;
    }
    while (v7 != 2048);
    for (i = 0; i != 5; ++i)
    {
      v10 = 0;
      v11 = v8 * *((double *)&v26 + i);
      v12 = 0.0;
      while (1)
      {
        v13 = *(double *)(v6 + 8 * v10);
        if (v12 + v13 >= v11)
          break;
        ++v10;
        v12 = v12 + v13;
        if (v10 == 256)
          goto LABEL_10;
      }
      *((double *)&v27 + i) = (double)(int)v10 * 0.00390625 + (v11 - v12) / v13 * 0.00390625;
LABEL_10:
      ;
    }
    v14 = 0;
    v15 = *(double *)&v27 * fmin(fmax(*(double *)&v27 * -0.8 + 1.0, 0.6), 1.0);
    v16 = (1.0 - v29) * fmin(fmax((1.0 - v29) * -0.8 + 1.0, 0.6), 1.0) * -0.5 + 1.0;
    v17 = 1.0 / (v16 - v15);
    *(double *)&v27 = v15;
    *((double *)&v27 + 1) = (*((double *)&v27 + 1)
                           + (*(double *)&v28 - v15 + 1.0) * v15
                           + (*(double *)&v28 - v15 + 1.0) * *(double *)&v28)
                          / ((*(double *)&v28 - v15) * 2.0 + 3.0);
    *((double *)&v28 + 1) = (*((double *)&v28 + 1)
                           + (v16 - *(double *)&v28 + 1.0) * v16
                           + (v16 - *(double *)&v28 + 1.0) * *(double *)&v28)
                          / ((v16 - *(double *)&v28) * 2.0 + 3.0);
    v29 = v16;
    v18 = (*(double *)&v28 - v15) * v17;
    curvePercent = self->curvePercent;
    v20 = v17 * (1.0 - curvePercent);
    v31 = (*((double *)&v27 + 1) - v15) * v20
        + curvePercent * fmin((v18 + 0.0) * 0.5, v17 * (*((double *)&v27 + 1) - v15));
    *(double *)&v32 = v18;
    *((double *)&v32 + 1) = v20 * (*((double *)&v28 + 1) - v15)
                          + curvePercent * fmax((v18 + 1.0) * 0.5, v17 * (*((double *)&v28 + 1) - v15));
    v21 = (_QWORD *)v34 + 1;
    do
    {
      v22 = *(uint64_t *)((char *)&v30 + v14);
      *(v21 - 1) = *(_QWORD *)((char *)&v27 + v14);
      *v21 = v22;
      v14 += 8;
      v21 += 2;
    }
    while (v14 != 40);
    v23 = (double *)&v34[a3 % 5];
    v24 = *v23;
    v25 = v23[1];
  }
  else
  {
    v25 = 0.0;
    v24 = 0.0;
  }
  result.y = v25;
  result.x = v24;
  return result;
}

- (int)putShadowsAnalysisInto:(double *)a3
{
  const double *v5;
  const double *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  const double *v11;
  const double *v12;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  unsigned int v24;
  int v25;
  double v26;
  int v27;
  double *v28;
  int v29;
  double v30;
  int v31;
  const double *v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double *v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  double *v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  int result;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  double *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD v67[256];
  _QWORD v68[16];
  _QWORD v69[16];
  _QWORD v70[16];
  _QWORD v71[17];

  v71[16] = *MEMORY[0x1E0C80C00];
  v5 = -[CIEnhancementHistogram values](self->lumHist, "values");
  v6 = v5;
  v7 = 0;
  v8 = *v5;
  v9 = 0.0;
  do
  {
    v10 = v5[v7];
    v8 = fmax(v8, v10);
    v9 = v9 + v10;
    *(double *)&v67[v7++] = v9;
  }
  while (v7 != 256);
  v11 = -[CIEnhancementHistogram values](self->borderHist, "values");
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v15 = *v11;
  do
  {
    if (v11[v13] > v15)
    {
      v14 = v13;
      v15 = v11[v13];
    }
    ++v13;
  }
  while (v13 != 256);
  if (-[CIEnhancementCalculation curveCount](self, "curveCount") == 5)
  {
    -[CIEnhancementCalculation curvePointAtIndex:](self, "curvePointAtIndex:", 0);
    v17 = v16;
    -[CIEnhancementCalculation curvePointAtIndex:](self, "curvePointAtIndex:", 4);
    v18 = llround(v17 * 255.0);
    v20 = v19 - v17;
  }
  else
  {
    v18 = 0;
    v20 = 1.0;
  }
  v71[0] = 0x3FF0000000000000;
  *(double *)v68 = v15;
  *(double *)v70 = v8;
  v69[0] = 0x3FF0000000000000;
  *(double *)&v71[1] = (double)v14 * 0.00390625;
  v21 = (double *)&v12[v14];
  v22 = *v21;
  *(double *)&v68[1] = *v21 / v15;
  *(double *)&v70[1] = v6[v14] / v8;
  v69[1] = v67[v14];
  v23 = v22 * 0.5;
  v24 = v14;
  do
  {
    v25 = v24++;
    if (v24 > 0x108)
      break;
    v26 = *v21++;
  }
  while (v26 >= v23);
  if (v24 <= 0x108)
    v27 = v25;
  else
    v27 = 255;
  *(double *)&v71[2] = (double)v27 * 0.00390625;
  *(double *)&v68[2] = v12[v27] / v15;
  *(double *)&v70[2] = v6[v27] / v8;
  v69[2] = v67[v27];
  v28 = (double *)&v12[v14];
  do
  {
    v29 = v14--;
    if (v14 > 0x108)
      break;
    v30 = *v28--;
  }
  while (v30 >= v23);
  if (v14 <= 0x108)
    v31 = v29;
  else
    v31 = 0;
  *(double *)&v71[3] = (double)v31 * 0.00390625;
  *(double *)&v68[3] = v12[v31] / v15;
  *(double *)&v70[3] = v6[v31] / v8;
  v69[3] = v67[v31];
  v32 = -[CIEnhancementHistogram values](self->borderHist, "values");
  for (i = 0; i != 4; ++i)
  {
    v34 = putShadowsAnalysisInto__segTop[i];
    v35 = putShadowsAnalysisInto__segStart[i];
    v36 = 0.0;
    if ((int)v34 > (int)v35)
    {
      v37 = 1.0 / (double)((int)v34 - (int)v35);
      v38 = (double *)&v32[v35];
      v39 = v34 - v35;
      v40 = 0.0;
      v36 = 0.0;
      do
      {
        v41 = *v38++;
        v36 = v36 + v40 * v41;
        v40 = v37 + v40;
        --v39;
      }
      while (v39);
    }
    v42 = putShadowsAnalysisInto__segDown[i];
    if ((int)v34 < (int)v42)
    {
      v43 = (double *)&v32[v34];
      v44 = v42 - v34;
      do
      {
        v45 = *v43++;
        v36 = v36 + v45;
        --v44;
      }
      while (v44);
    }
    v46 = putShadowsAnalysisInto__segEnd[i];
    if ((int)v46 > (int)v42)
    {
      v47 = 1.0 / (double)((int)v46 - (int)v42);
      v48 = (double *)&v32[v42];
      v49 = v46 - v42;
      v50 = 1.0;
      do
      {
        v51 = *v48++;
        v36 = v36 + v50 * v51;
        v50 = v50 - v47;
        --v49;
      }
      while (v49);
    }
    *(double *)&(&v63)[i] = v36;
  }
  v52 = 0;
  result = 0;
  v68[4] = v64;
  v70[4] = v65;
  v69[4] = v66;
  v54 = llround(v20 * (double)(int)(v18 + 64));
  v71[4] = v63;
  *(double *)&v71[5] = (double)v54 * 0.00390625;
  *(double *)&v68[5] = v12[v54] / v15;
  *(double *)&v70[5] = v6[v54] / v8;
  v55 = v67[v54];
  v56 = llround(v20 * (double)(int)(v18 + 128));
  v69[5] = v55;
  *(double *)&v71[6] = (double)v56 * 0.00390625;
  *(double *)&v68[6] = v12[v56] / v15;
  v57 = v67[v56];
  *(double *)&v70[6] = v6[v56] / v8;
  v69[6] = v57;
  v63 = v71;
  v64 = v68;
  v65 = v70;
  v66 = v69;
  do
  {
    v58 = 0;
    v59 = 0;
    v60 = (&v63)[v52];
    do
    {
      a3[result] = *(double *)&v60[v59];
      v61 = &a3[result++ + 2];
      v62 = v58;
      do
      {
        a3[result] = *(double *)&v60[v59] - *(double *)((char *)v60 + v62);
        *v61 = *(double *)&v60[v59] * *(double *)((char *)v60 + v62);
        v61 += 2;
        result += 2;
        v62 += 8;
      }
      while (v62 != 56);
      ++v59;
      v58 += 8;
    }
    while (v59 != 7);
    ++v52;
  }
  while (v52 != 4);
  return result;
}

- (id)shadow
{
  double v2;

  if (!self->lumHist)
    return 0;
  objc_msgSend(-[CIEnhancementCalculation rawShadow](self, "rawShadow"), "doubleValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(tanh(fmin(fmax(v2, 0.0), 1.0)) * 0.6, 0.0));
}

- (id)rawShadow
{
  uint64_t v3;
  double v4;
  float64x2_t v5;
  double maxShadow;
  double v7;
  double exposureValueAtZeroShadow;
  _BYTE v10[3200];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->lumHist)
    return 0;
  bzero(v10, 0xC80uLL);
  -[CIEnhancementCalculation putShadowsAnalysisInto:](self, "putShadowsAnalysisInto:", v10);
  v3 = 0;
  v4 = 0.0;
  do
  {
    v5 = vmulq_f64((float64x2_t)xmmword_192499258[v3], *(float64x2_t *)&v10[v3 * 16]);
    v4 = v4 + v5.f64[0] + v5.f64[1];
    ++v3;
  }
  while (v3 != 126);
  maxShadow = self->maxShadow;
  v7 = fmax(self->minShadow, fmin(maxShadow, v4));
  exposureValueAtZeroShadow = self->exposureValueAtZeroShadow;
  if (exposureValueAtZeroShadow > 0.0)
    v7 = fmin(v7, fmax(maxShadow * (1.0 - self->exposureValue / exposureValueAtZeroShadow), 0.0));
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
}

- (void)downSampleHistogram:(id)a3 to:(unsigned int)a4 storeIn:(double *)a5
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  double *v13;
  double v14;

  v7 = objc_msgSend(a3, "values");
  if (a4)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v8 + 1;
      v11 = floor(256.0 / (double)a4 * (double)(v8 + 1));
      v12 = 0.0;
      if (v11 > (double)v9)
      {
        v13 = (double *)(v7 + 8 * v9);
        do
        {
          v14 = *v13++;
          v12 = v12 + v14;
          ++v9;
        }
        while (v11 > (double)v9);
      }
      a5[v8++] = v12;
    }
    while (v10 != a4);
  }
}

- (void)printHistogram:(id)a3 downsampledTo:(unsigned int)a4
{
  double *v5;
  uint64_t v6;
  double v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (double *)((char *)v8 - ((8 * a4 + 15) & 0xFFFFFFFF0));
  -[CIEnhancementCalculation downSampleHistogram:to:storeIn:](self, "downSampleHistogram:to:storeIn:", a3);
  if (a4)
  {
    v6 = a4;
    do
    {
      v7 = *v5++;
      printf("%.5f\t", v7);
      --v6;
    }
    while (v6);
  }
}

- (void)printAnalysis
{
  int v2;
  uint64_t v3;
  double *v4;
  double v5;
  _BYTE v6[3200];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = -[CIEnhancementCalculation putShadowsAnalysisInto:](self, "putShadowsAnalysisInto:", v6);
  if (v2 >= 1)
  {
    v3 = v2;
    v4 = (double *)v6;
    do
    {
      v5 = *v4++;
      printf("%.6f\t", v5);
      --v3;
    }
    while (v3);
  }
}

- (void)printHistogramsDownsampledTo:(unsigned int)a3
{
  -[CIEnhancementCalculation printAnalysis](self, "printAnalysis", *(_QWORD *)&a3);
  putchar(10);
}

- (CIEnhancementHistogram)lumHist
{
  return self->lumHist;
}

- (CIEnhancementHistogram)rgbSumHist
{
  return self->rgbSumHist;
}

- (CIEnhancementHistogram)satHist
{
  return self->satHist;
}

- (CIEnhancementHistogram)borderHist
{
  return self->borderHist;
}

@end

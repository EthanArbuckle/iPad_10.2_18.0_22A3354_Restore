@implementation CIEnhancementCalculator

- (CIEnhancementCalculator)init
{
  CIEnhancementCalculator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIEnhancementCalculator;
  result = -[CIEnhancementCalculation init](&v3, sel_init);
  if (result)
  {
    result->shadowsEnabled = 1;
    result->curvesEnabled = 1;
    result->vibranceEnabled = 1;
    result->faceBalanceEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CIEnhancementCalculator;
  -[CIEnhancementCalculation dealloc](&v2, sel_dealloc);
}

- (id)histogramFromRows:(id)a3 componentOffset:(unsigned int)a4
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t i;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;
  double v16;
  uint64_t v17;
  float64x2_t v18;
  double v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "width");
  v7 = objc_msgSend(a3, "height");
  v8 = objc_msgSend(a3, "bytesPerPixel");
  bzero(v20, 0x800uLL);
  if (v7)
  {
    for (i = 0; i < v7; i = (i + 1))
    {
      v10 = objc_msgSend(a3, "rowAtIndex:", i);
      if (v6)
      {
        v11 = 0;
        v12 = 1;
        do
        {
          v13 = *(unsigned __int8 *)(v10 + a4 + v11);
          v20[v13] = v20[v13] + 1.0;
          v11 += v8;
        }
        while (v6 > v12++);
      }
    }
  }
  v15 = 0;
  v16 = 0.0;
  do
    v16 = v16 + v20[v15++];
  while (v15 != 256);
  v17 = 0;
  v18 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0);
  do
  {
    *(float64x2_t *)&v20[v17] = vdivq_f64(*(float64x2_t *)&v20[v17], v18);
    v17 += 2;
  }
  while (v17 != 256);
  return +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v20);
}

- (void)setupHistogramsUsing:(id)a3 redIndex:(int)a4 greenIndex:(int)a5 blueIndex:(int)a6
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  double v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  double v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  float64x2_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  float64x2_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  float64x2_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  float64x2_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  double v59[256];
  double v60[256];
  _BYTE v61[2048];
  _BYTE v62[2048];
  uint64_t v63;

  v6 = MEMORY[0x1E0C80A78](self, a2, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v56 = (void *)v6;
  v63 = *MEMORY[0x1E0C80C00];
  bzero(v62, 0x800uLL);
  bzero(v61, 0x800uLL);
  bzero(v60, 0x800uLL);
  v15 = objc_msgSend(v14, "bytesPerPixel");
  bzero(v59, 0x800uLL);
  v16 = objc_msgSend(v14, "width");
  v58 = v14;
  v57 = objc_msgSend(v14, "height");
  if (v57)
  {
    v17 = v16;
    v18 = 0;
    v19 = v8;
    v20 = v17 - 1;
    do
    {
      v21 = objc_msgSend(v58, "rowAtIndex:", v18);
      if (v20)
      {
        v25 = 0;
        LOBYTE(v22) = *(_BYTE *)(v21 + v19);
        LOBYTE(v23) = *(_BYTE *)(v21 + v12);
        LOBYTE(v24) = *(_BYTE *)(v21 + v10);
        v26 = (double)v24 * 0.7 + (double)v23 * 0.2;
        LOBYTE(v27) = llround(v26 + (double)v22 * 0.1);
        do
        {
          v28 = v21 + v25 * v15;
          v29 = *(unsigned __int8 *)(v28 + v12);
          v59[*(unsigned __int8 *)(v28 + v12)] = v59[*(unsigned __int8 *)(v28 + v12)] + 1.0;
          v30 = *(unsigned __int8 *)(v28 + v10);
          v59[*(unsigned __int8 *)(v28 + v10)] = v59[*(unsigned __int8 *)(v28 + v10)] + 1.0;
          v31 = *(unsigned __int8 *)(v28 + v19);
          v32 = v59[v31] + 1.0;
          v59[v31] = v32;
          LOBYTE(v36) = v27;
          v33 = v21 + ++v25 * v15;
          LOBYTE(v32) = *(_BYTE *)(v33 + v12);
          LOBYTE(v26) = *(_BYTE *)(v33 + v10);
          *(double *)&v34 = (double)*(unint64_t *)&v26 * 0.7;
          v35 = *(double *)&v34 + (double)*(unint64_t *)&v32 * 0.2;
          LOBYTE(v34) = *(_BYTE *)(v33 + v19);
          v26 = (double)v34;
          v27 = llround(v35 + v26 * 0.1);
          *(double *)&v62[8 * v36] = *(double *)&v62[8 * v36] + 1.0;
          v36 = v36;
          if (v36 >= v27)
            v37 = v27;
          else
            v37 = v36;
          if (v36 <= v27)
            v36 = v27;
          v38 = v37 + 1;
          if (v38 < v36)
          {
            do
            {
              *(double *)&v61[8 * (__int16)v38] = *(double *)&v61[8 * (__int16)v38] + 1.0;
              ++v38;
            }
            while ((int)v36 > (__int16)v38);
          }
          if (v30 <= v31)
            v39 = v31;
          else
            v39 = v30;
          if (v29 > v39)
            v39 = v29;
          if (v39 == v31)
          {
            if (v31 != v29 || (LOBYTE(v39) = v31, v31 != v30))
            {
              LOBYTE(v39) = 2 * v31;
              if (2 * v31 >= 0xFF)
                LOBYTE(v39) = -1;
            }
          }
          if (v30 >= v31)
            v30 = v31;
          if (v29 >= v30)
            LOBYTE(v29) = v30;
          v60[(v39 - v29)] = v60[(v39 - v29)] + 1.0;
        }
        while (v20 > v25);
      }
      v18 = (v18 + 1);
    }
    while (v57 > v18);
  }
  v40 = 0;
  v41 = 0.0;
  do
    v41 = v41 + v59[v40++];
  while (v40 != 256);
  v42 = 0;
  v43 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v41, 0);
  do
  {
    *(float64x2_t *)&v59[v42] = vdivq_f64(*(float64x2_t *)&v59[v42], v43);
    v42 += 2;
  }
  while (v42 != 256);
  objc_msgSend(v56, "setRGBSumHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v59));
  v44 = 0;
  v45 = 0.0;
  do
  {
    v45 = v45 + *(double *)&v62[v44];
    v44 += 8;
  }
  while (v44 != 2048);
  v46 = 0;
  v47 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v45, 0);
  do
  {
    *(float64x2_t *)&v62[v46] = vdivq_f64(*(float64x2_t *)&v62[v46], v47);
    v46 += 16;
  }
  while (v46 != 2048);
  objc_msgSend(v56, "setLuminanceHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v62));
  v48 = 0;
  v49 = 0.0;
  do
  {
    v49 = v49 + *(double *)&v61[v48];
    v48 += 8;
  }
  while (v48 != 2048);
  v50 = 0;
  v51 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v49, 0);
  do
  {
    *(float64x2_t *)&v61[v50] = vdivq_f64(*(float64x2_t *)&v61[v50], v51);
    v50 += 16;
  }
  while (v50 != 2048);
  objc_msgSend(v56, "setBorderHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v61));
  v52 = 0;
  v53 = 0.0;
  do
    v53 = v53 + v60[v52++];
  while (v52 != 256);
  v54 = 0;
  v55 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v53, 0);
  do
  {
    *(float64x2_t *)&v60[v54] = vdivq_f64(*(float64x2_t *)&v60[v54], v55);
    v54 += 2;
  }
  while (v54 != 256);
  objc_msgSend(v56, "setSaturationHistogram:", +[CIEnhancementHistogram histogramFromData:](CIEnhancementHistogram, "histogramFromData:", v60));
}

- (void)analyzeFeatures:(id)a3 usingContext:(id)a4 baseImage:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  CIAutoEnhanceFace *v17;
  CIAutoEnhanceFace *v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  long double x;
  double v25;
  double v26;
  double v27;
  const __CFDictionary *v28;
  CIAutoEnhanceFace *v29;
  double v30;
  double v31;
  double v32;
  int v33;
  CIEnhancementCalculator *v34;
  double v35;
  CGRect __x;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v34 = self;
      v11 = *(_QWORD *)v38;
      v12 = 0.0;
      v13 = 0.0;
      v14 = 0.0;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(a3);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = [CIAutoEnhanceFace alloc];
            objc_msgSend(v16, "bounds");
            v18 = -[CIAutoEnhanceFace initWithBounds:andImage:usingContext:](v17, "initWithBounds:andImage:usingContext:", a5, a4);
            __x.origin.x = 0.0;
            -[CIAutoEnhanceFace I](v18, "I");
            v20 = v19;
            -[CIAutoEnhanceFace Q](v18, "Q");
            +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", &__x, v20, v21);
            if (__x.origin.x < 4.3)
            {
              v22 = -[CIAutoEnhanceFace size](v18, "size", __x.origin.x);
              v23 = (double)(-[CIAutoEnhanceFace size](v18, "size") * v22);
              x = __x.origin.x;
              goto LABEL_10;
            }
            goto LABEL_11;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = (const __CFDictionary *)objc_msgSend(v16, "valueForKey:", CFSTR("bounds"));
            memset(&__x, 0, sizeof(__x));
            if (v28)
            {
              if (CGRectMakeWithDictionaryRepresentation(v28, &__x))
              {
                v29 = [CIAutoEnhanceFace alloc];
                v18 = -[CIAutoEnhanceFace initWithBounds:andImage:usingContext:](v29, "initWithBounds:andImage:usingContext:", a5, a4, __x.origin.x, __x.origin.y, *(_OWORD *)&__x.size);
                v35 = 0.0;
                -[CIAutoEnhanceFace I](v18, "I");
                v31 = v30;
                -[CIAutoEnhanceFace Q](v18, "Q");
                +[CIEnhancementCalculation bestWarmthForI:q:percentChange:](CIEnhancementCalculation, "bestWarmthForI:q:percentChange:", &v35, v31, v32);
                if (v35 < 4.3)
                {
                  v33 = -[CIAutoEnhanceFace size](v18, "size", v35);
                  v23 = (double)(-[CIAutoEnhanceFace size](v18, "size") * v33);
                  x = v35;
LABEL_10:
                  v25 = fmin(1.0 / fmax(pow(x, 3.0), 0.0001), 1.0) * v23;
                  v12 = v12 + v25;
                  -[CIAutoEnhanceFace I](v18, "I");
                  v14 = v14 + v25 * v26;
                  -[CIAutoEnhanceFace Q](v18, "Q");
                  v13 = v13 + v25 * v27;
                }
LABEL_11:

                continue;
              }
            }
          }
        }
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (!v10)
        {
          if (v12 > 0.0)
            -[CIEnhancementCalculation setFaceColorFromChromaI:andChromaQ:](v34, "setFaceColorFromChromaI:andChromaQ:", v14 / v12, v13 / v12);
          return;
        }
      }
    }
  }
}

- (id)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 detectorOpts:(id)a5
{
  NSArray *v8;

  v8 = -[CIDetector featuresInImage:options:](+[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", CFSTR("CIDetectorTypeFace")), "featuresInImage:options:", a3, a5);
  -[CIEnhancementCalculator analyzeFeatures:usingContext:baseImage:](self, "analyzeFeatures:usingContext:baseImage:", v8, a4, a3);
  return v8;
}

- (void)setupFaceColorFromImage:(id)a3 usingContext:(id)a4 features:(id)a5
{
  -[CIEnhancementCalculator analyzeFeatures:usingContext:baseImage:](self, "analyzeFeatures:usingContext:baseImage:", a5, a4, a3);
}

- (BOOL)faceBalanceEnabled
{
  return self->faceBalanceEnabled;
}

- (void)setFaceBalanceEnabled:(BOOL)a3
{
  self->faceBalanceEnabled = a3;
}

- (BOOL)vibranceEnabled
{
  return self->vibranceEnabled;
}

- (void)setVibranceEnabled:(BOOL)a3
{
  self->vibranceEnabled = a3;
}

- (BOOL)curvesEnabled
{
  return self->curvesEnabled;
}

- (void)setCurvesEnabled:(BOOL)a3
{
  self->curvesEnabled = a3;
}

- (BOOL)shadowsEnabled
{
  return self->shadowsEnabled;
}

- (void)setShadowsEnabled:(BOOL)a3
{
  self->shadowsEnabled = a3;
}

@end

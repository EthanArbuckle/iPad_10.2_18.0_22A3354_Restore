@implementation CAMZoomPoint

+ (id)zoomPointWithFactor:(double)a3 displayed:(double)a4
{
  double *v6;

  v6 = (double *)objc_alloc_init((Class)a1);
  v6[4] = 0.0;
  v6[2] = a3;
  v6[3] = a4;
  return v6;
}

+ (BOOL)_canExtendFromCustomLens:(int64_t)a3 toLens:(int64_t)a4 withIntermediateLens:(int64_t *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v20;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveFocalLengthForCustomLens:", a3);
  v10 = objc_msgSend(v8, "effectiveFocalLengthForCustomLens:", a4);
  v11 = objc_msgSend(v8, "baseFocalLengthForCustomLens:", 0);
  v12 = objc_msgSend(v8, "effectiveFocalLengthForCustomLens:", 0);
  if (v11 == v9 && v12 == v10)
  {
    v16 = 0;
    v20 = 1;
    if (!a5)
      goto LABEL_18;
    goto LABEL_17;
  }
  v14 = 0;
  while (1)
  {
    v15 = v14;
    if (v14 == 5)
      break;
    v16 = CAMCustomLensAllLenses[v14 + 1];
    v17 = objc_msgSend(v8, "baseFocalLengthForCustomLens:", v16);
    v18 = objc_msgSend(v8, "effectiveFocalLengthForCustomLens:", v16);
    v14 = v15 + 1;
    if (v17 == v9 && v18 == v10)
      goto LABEL_16;
  }
  v16 = 0;
LABEL_16:
  v20 = v15 < 5;
  if (a5)
LABEL_17:
    *a5 = v16;
LABEL_18:

  return v20;
}

+ (id)zoomPointWithCustomLens:(int64_t)a3 baseZoomPoint:(id)a4
{
  id v7;
  int v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v17;

  v7 = a4;
  v17 = 0;
  v8 = objc_msgSend(a1, "_canExtendFromCustomLens:toLens:withIntermediateLens:", objc_msgSend(v7, "customLens"), a3, &v17);
  v9 = 0;
  if (v8)
  {
    v9 = objc_alloc_init((Class)a1);
    *((_QWORD *)v9 + 4) = v17;
    objc_storeStrong((id *)v9 + 1, a4);
    if (v17 > 5)
      v10 = NAN;
    else
      v10 = dbl_1DB9A4E68[v17] / dbl_1DB9A4E38[v17];
    objc_msgSend(v7, "displayZoomFactor");
    *((double *)v9 + 3) = round(v11 * v10 * 10.0) / 10.0;
    objc_msgSend(v7, "zoomFactor");
    v13 = v10 * v12;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zoomFactorForCustomLensZoomFactor:", v13);
    *((_QWORD *)v9 + 2) = v15;

  }
  return v9;
}

+ (id)zoomPointsWithFactors:(id)a3 displayZoomFactors:(id)a4 customLensGroup:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v32 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    v31 = v7;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
      objc_msgSend(v33, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      +[CAMZoomPoint zoomPointWithFactor:displayed:](CAMZoomPoint, "zoomPointWithFactor:displayed:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v15);
      objc_msgSend(v15, "displayZoomFactor");
      v17 = v16;
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "wideDisplayZoomFactor");
      v20 = v19;

      if (v17 == v20)
      {
        v34 = v15;
        v21 = v15;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v22 = v32;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v36;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v36 != v25)
                objc_enumerationMutation(v22);
              v27 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v26), "integerValue");
              if (v27)
              {
                +[CAMZoomPoint zoomPointWithCustomLens:baseZoomPoint:](CAMZoomPoint, "zoomPointWithCustomLens:baseZoomPoint:", v27, v21);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_msgSend(v8, "addObject:", v28);
                  v29 = v28;

                  v21 = v29;
                }

              }
              ++v26;
            }
            while (v24 != v26);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          }
          while (v24);
        }

        v7 = v31;
        v15 = v34;
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }

  return v8;
}

+ (id)zoomFactorsFromZoomPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "zoomFactor", (_QWORD)v13);
        objc_msgSend(v10, "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)displayZoomFactorsFromZoomPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "displayZoomFactor", (_QWORD)v13);
        objc_msgSend(v10, "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)significantIndexesInZoomPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "isCustomLens"))
        {
          v11 = v10;
          v12 = v11;
          v13 = (void *)*((_QWORD *)v11 + 1);
          if (v13)
          {
            do
            {
              v14 = v13;

              objc_msgSend(v4, "addObject:", v14);
              v13 = (void *)v14[1];
              v12 = v14;
            }
            while (v13);
          }
          else
          {
            v14 = v11;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__CAMZoomPoint_significantIndexesInZoomPoints___block_invoke;
  v18[3] = &unk_1EA329A50;
  v19 = v4;
  v15 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __47__CAMZoomPoint_significantIndexesInZoomPoints___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CAMZoomPoint isEqualToZoomPoint:](self, "isEqualToZoomPoint:", v4);

  return v5;
}

- (BOOL)isEqualToZoomPoint:(id)a3
{
  CAMZoomPoint *v4;
  CAMZoomPoint *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  CAMZoomPoint *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (CAMZoomPoint *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (v4 == self)
  {
    v16 = 1;
    goto LABEL_12;
  }
  -[CAMZoomPoint zoomFactor](self, "zoomFactor");
  v7 = v6;
  -[CAMZoomPoint zoomFactor](v5, "zoomFactor");
  if (v7 == v8
    && (-[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor"),
        v10 = v9,
        -[CAMZoomPoint displayZoomFactor](v5, "displayZoomFactor"),
        v10 == v11)
    && (v12 = -[CAMZoomPoint customLens](self, "customLens"), v12 == -[CAMZoomPoint customLens](v5, "customLens")))
  {
    -[CAMZoomPoint baseZoomPoint](self, "baseZoomPoint");
    v13 = (CAMZoomPoint *)objc_claimAutoreleasedReturnValue();
    if (v13 == self)
    {
      v16 = 1;
    }
    else
    {
      -[CAMZoomPoint baseZoomPoint](self, "baseZoomPoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMZoomPoint baseZoomPoint](v5, "baseZoomPoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToZoomPoint:", v15);

    }
  }
  else
  {
LABEL_8:
    v16 = 0;
  }
LABEL_12:

  return v16;
}

- (CAMZoomPoint)baseZoomPoint
{
  if (self->_baseZoomPoint)
    self = self->_baseZoomPoint;
  return self;
}

- (CAMZoomPoint)fundamentalZoomPoint
{
  CAMZoomPoint *v2;

  if (self->_baseZoomPoint)
  {
    -[CAMZoomPoint fundamentalZoomPoint](self->_baseZoomPoint, "fundamentalZoomPoint");
    v2 = (CAMZoomPoint *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self;
  }
  return v2;
}

- (NSArray)allZoomPoints
{
  void *v3;
  CAMZoomPoint *v4;
  id *p_isa;
  id *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_baseZoomPoint;
  if (v4)
  {
    p_isa = (id *)&v4->super.isa;
    do
    {
      objc_msgSend(v3, "addObject:", p_isa);
      v6 = (id *)p_isa[1];

      p_isa = v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (BOOL)isCustomLens
{
  return -[CAMZoomPoint customLens](self, "customLens") != 0;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  if (-[CAMZoomPoint isCustomLens](self, "isCustomLens"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = -[CAMZoomPoint customLens](self, "customLens");
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "baseFocalLengthForCustomLens:", v4);
    v7 = objc_msgSend(v5, "effectiveFocalLengthForCustomLens:", v4);
    if (v6 == v7)
    {
      v8 = CFSTR("Base");
    }
    else
    {
      v10 = v7;
      v11 = (void *)MEMORY[0x1E0CB3940];
      if (v6 > 3)
        v12 = 0;
      else
        v12 = dword_1DB9A4ED0[v6];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dmm"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 > 3)
        v14 = 0;
      else
        v14 = dword_1DB9A4ED0[v10];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dmm"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ as %@"), v13, v15);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1EA3325A0;
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomPoint zoomFactor](self, "zoomFactor");
  v20 = v19;
  -[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; (%.3f, %.1fx)%@>"), v18, self, v20, v21, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (double)displayFocalLength
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMZoomPoint isCustomLens](self, "isCustomLens"))
  {
    v4 = objc_msgSend(v3, "effectiveFocalLengthForCustomLens:", -[CAMZoomPoint customLens](self, "customLens"));
    v5 = 0.0;
    if (v4 < 4)
      v5 = dbl_1DB9A4E98[v4];
  }
  else
  {
    -[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor");
    v7 = v6;
    objc_msgSend(v3, "superWideDisplayZoomFactor");
    if (v7 == v8)
    {
      v9 = objc_msgSend(v3, "backSuperWideFocalLengthDisplayValue");
    }
    else
    {
      -[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor");
      v11 = v10;
      objc_msgSend(v3, "wideDisplayZoomFactor");
      if (v11 == v12)
      {
        v9 = objc_msgSend(v3, "backWideFocalLengthDisplayValue");
      }
      else
      {
        -[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor");
        v14 = v13;
        objc_msgSend(v3, "quadraWideDisplayZoomFactor");
        if (v14 == v15)
        {
          v9 = objc_msgSend(v3, "backQuadraWideFocalLengthDisplayValue");
        }
        else
        {
          -[CAMZoomPoint displayZoomFactor](self, "displayZoomFactor");
          v17 = v16;
          objc_msgSend(v3, "telephotoDisplayZoomFactor");
          if (v17 != v18)
          {
            v5 = 0.0;
            goto LABEL_13;
          }
          v9 = objc_msgSend(v3, "backTelephotoFocalLengthDisplayValue");
        }
      }
    }
    v5 = (double)v9;
  }
LABEL_13:

  return v5;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)displayZoomFactor
{
  return self->_displayZoomFactor;
}

- (int64_t)customLens
{
  return self->_customLens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseZoomPoint, 0);
}

@end

@implementation VCPHoughTransform

- (VCPHoughTransform)initWithEdgeMap:(float *)a3 mapWidth:(int)a4 mapHeight:(int)a5 angleStep:(float)a6
{
  VCPHoughTransform *v10;
  VCPHoughTransform *v11;
  VCPHoughTransform *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  size_t v17;
  int *v18;
  VCPHoughTransform *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VCPHoughTransform;
  v10 = -[VCPHoughTransform init](&v21, sel_init);
  v11 = v10;
  v12 = 0;
  if (a5 >= 1 && a4 >= 1 && a3 && v10)
  {
    v10->_verbose = 0;
    v10->_edgeMap = a3;
    v10->_mapWidth = a4;
    v10->_mapHeight = a5;
    if (a4 <= a5)
      v13 = a5;
    else
      v13 = a4;
    v14 = llround((double)v13 * 1.41421356 * 0.5);
    v10->_accHalfHeight = v14;
    v15 = llroundf(180.0 / a6);
    v14 *= 2;
    v10->_accWidth = v15;
    v10->_accHeight = v14;
    v10->_angleStep = a6;
    v16 = v14 * v15;
    if (v16 < 0)
      v17 = -1;
    else
      v17 = 4 * v16;
    v18 = (int *)operator new[](v17, MEMORY[0x1E0DE4E10]);
    v11->_accumulator = v18;
    if (v18)
    {
      -[VCPHoughTransform Transform](v11, "Transform");
      v19 = v11;
    }
    else
    {
      v19 = 0;
    }
    v12 = v19;
  }

  return v12;
}

- (void)dealloc
{
  int *accumulator;
  objc_super v4;

  accumulator = self->_accumulator;
  if (accumulator)
    MEMORY[0x1BCCA128C](accumulator, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPHoughTransform;
  -[VCPHoughTransform dealloc](&v4, sel_dealloc);
}

- (int)DetectLinesWithThreshold:(int)a3 output:(id)a4
{
  int accHeight;
  int v7;
  int accWidth;
  int v9;
  int v10;
  int *accumulator;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  double v20;
  BOOL v21;
  double mapHeight;
  __float2 v23;
  double mapWidth;
  double v25;
  __float2 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  id v42;
  NSPoint v43;
  NSPoint v44;

  v42 = a4;
  accHeight = self->_accHeight;
  if (accHeight >= 1)
  {
    v7 = 0;
    accWidth = self->_accWidth;
    v9 = -4;
    do
    {
      if (accWidth >= 1)
      {
        v10 = 0;
        while (1)
        {
          accumulator = self->_accumulator;
          v12 = accumulator[v10 + accWidth * v7];
          if (v12 >= a3)
          {
            v13 = v9 * accWidth - 4;
            v14 = -4;
            while (v14 + v7 < 0 || v14 + v7 >= self->_accHeight)
            {
LABEL_14:
              v13 += accWidth;
              v21 = v14++ < 3;
              if (!v21)
              {
                v16 = accumulator[v10 + accWidth * v7];
                goto LABEL_16;
              }
            }
            v15 = -5;
            while (1)
            {
              if (v10 + v15 + 1 >= 0 && v10 + v15 + 1 < accWidth)
              {
                v16 = accumulator[v10 + 5 + v13 + v15];
                if ((int)v16 > v12)
                  break;
              }
              if (++v15 >= 3)
                goto LABEL_14;
            }
LABEL_16:
            if ((int)v16 <= v12)
            {
              v17 = self->_angleStep * (float)v10;
              v18 = (float)(v7 - self->_accHalfHeight);
              v19 = v17 * 0.017453;
              v20 = v18;
              v21 = v17 < 45.0 || v17 > 135.0;
              if (v21)
              {
                mapHeight = (double)self->_mapHeight;
                v23 = __sincosf_stret(v19);
                mapWidth = (double)self->_mapWidth;
                v31 = (v20 + mapHeight * 0.5 * v23.__sinval) / v23.__cosval / mapWidth + 0.5;
                v30 = (v20 + mapHeight * -0.5 * v23.__sinval) / v23.__cosval / mapWidth + 0.5;
                v29 = 1.0;
                v28 = 0.0;
              }
              else
              {
                v25 = (double)self->_mapWidth;
                v26 = __sincosf_stret(v19);
                v27 = (double)self->_mapHeight;
                v28 = (v20 + v25 * 0.5 * v26.__cosval) / v26.__sinval / v27 + 0.5;
                v29 = (v20 + v25 * -0.5 * v26.__cosval) / v26.__sinval / v27 + 0.5;
                v30 = 1.0;
                v31 = 0.0;
              }
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v32)
              {
                v40 = -108;
                goto LABEL_30;
              }
              v43.x = v31;
              v43.y = v28;
              NSStringFromPoint(v43);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v33, CFSTR("Point0"));

              v44.x = v30;
              v44.y = v29;
              NSStringFromPoint(v44);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v34, CFSTR("Point1"));

              *(float *)&v35 = v18;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v36, CFSTR("Radius"));

              *(float *)&v37 = v17;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v38, CFSTR("Theta"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v39, CFSTR("Length"));

              objc_msgSend(v42, "addObject:", v32);
              accWidth = self->_accWidth;
            }
          }
          if (++v10 >= accWidth)
          {
            accHeight = self->_accHeight;
            break;
          }
        }
      }
      ++v7;
      ++v9;
    }
    while (v7 < accHeight);
  }
  objc_msgSend(v42, "sortUsingComparator:", &__block_literal_global_67);
  v40 = 0;
LABEL_30:

  return v40;
}

uint64_t __53__VCPHoughTransform_DetectLinesWithThreshold_output___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("Length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "integerValue");
  if (v7 < objc_msgSend(v6, "integerValue"))
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (void)Transform
{
  float *edgeMap;
  int mapHeight;
  uint64_t mapWidth;
  int v6;
  double v7;
  uint64_t v8;
  int accWidth;
  uint64_t v10;
  float angleStep;
  int *accumulator;
  __double2 v13;
  signed int accHeight;

  edgeMap = self->_edgeMap;
  mapHeight = self->_mapHeight;
  mapWidth = self->_mapWidth;
  bzero(self->_accumulator, 4 * self->_accHeight * (uint64_t)self->_accWidth);
  if (mapHeight >= 1)
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      if ((int)mapWidth >= 1)
      {
        v8 = 0;
        do
        {
          if (edgeMap[v8] != 0.0)
          {
            accWidth = self->_accWidth;
            if (accWidth >= 1)
            {
              v10 = 0;
              angleStep = self->_angleStep;
              accumulator = self->_accumulator;
              do
              {
                v13 = __sincos_stret((float)(angleStep * (float)(int)v10) * 0.0174532924);
                accHeight = llround((v7 - (double)mapHeight * 0.5) * v13.__sinval+ ((double)(int)v8 - (double)(int)mapWidth * 0.5) * v13.__cosval+ (double)self->_accHalfHeight);
                if (self->_accHeight < accHeight)
                  accHeight = self->_accHeight;
                ++accumulator[v10 + accHeight * accWidth];
                accWidth = self->_accWidth;
                ++v10;
              }
              while ((int)v10 < accWidth);
            }
          }
          ++v8;
        }
        while (v8 != mapWidth);
      }
      edgeMap += mapWidth;
      v7 = v7 + 1.0;
      ++v6;
    }
    while (v6 != mapHeight);
  }
}

@end

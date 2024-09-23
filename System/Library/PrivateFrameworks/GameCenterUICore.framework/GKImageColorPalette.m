@implementation GKImageColorPalette

- (void)reset
{
  HSVColor *imageHSVMap;

  imageHSVMap = self->_imageHSVMap;
  if (imageHSVMap)
  {
    free(imageHSVMap);
    self->_imageHSVMap = 0;
  }
  self->_imageSize = (CGSize)*MEMORY[0x24BDBF148];
  -[GKImageColorPalette clearMainHistograms](self, "clearMainHistograms");
  -[GKImageColorPalette clearSaturationAndBrightnessHistograms](self, "clearSaturationAndBrightnessHistograms");
  self->_borderPercentageForBorderDetection = 0.0;
  self->_hueSpread = 7;
  self->_saturationSpread = 10;
  self->_brightnessSpread = 10;
  self->_grayscaleSpread = 15;
}

- (void)clearMainHistograms
{
  bzero(self->_hueHistogram, 0x5A0uLL);
}

- (void)clearSaturationAndBrightnessHistograms
{
  bzero(self->_saturationHistogram, 0x400uLL);
  bzero(self->_brightnessHistogram, 0x400uLL);
}

- (void)generateHSVMapWithContext:(CGContext *)a3
{
  size_t BytesPerRow;
  void *Data;
  void *v7;
  uint64_t height;
  unsigned int width;
  HSVColor *v10;
  __int16 BitmapInfo;
  double v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  size_t v20;
  HSVColor *imageHSVMap;
  uint64_t v22;
  uint64_t v23;
  float v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double *p_var0;
  BOOL v37;
  double v38;

  if (a3)
  {
    BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    Data = CGBitmapContextGetData(a3);
    if (Data)
    {
      v7 = Data;
      height = self->_imageSize.height;
      width = self->_imageSize.width;
      v10 = (HSVColor *)malloc_type_calloc(width * height, 0x18uLL, 0x1000040504FFAC1uLL);
      self->_imageHSVMap = v10;
      if (v10)
      {
        BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
        if ((_DWORD)height)
        {
          v15 = 0;
          v16 = 0;
          v17 = BitmapInfo & 0x3000;
          v18 = 3;
          if ((BitmapInfo & 0x3000) != 0)
            v18 = 0;
          do
          {
            if (width)
            {
              v19 = 0;
              v20 = (size_t)v7 + BytesPerRow * v16;
              imageHSVMap = self->_imageHSVMap;
              do
              {
                if (v17)
                  v22 = 2;
                else
                  v22 = 1;
                if (v17)
                  v23 = 1;
                else
                  v23 = 2;
                LOBYTE(v12) = *(_BYTE *)(v20 + v18);
                LOBYTE(v13) = *(_BYTE *)(v20 + v23);
                LOBYTE(v14) = *(_BYTE *)(v20 + v22);
                v24 = (float)LODWORD(v14);
                *(float *)&v12 = (float)LODWORD(v12) / 255.0;
                v25 = *(float *)&v12;
                *(float *)&v13 = (float)LODWORD(v13) / 255.0;
                v26 = *(float *)&v13;
                v27 = v24 / 255.0;
                v28 = (float)(v24 / 255.0);
                if (v27 < *(float *)&v13 || v27 < *(float *)&v12)
                {
                  if (*(float *)&v13 < *(float *)&v12 || *(float *)&v13 < v27)
                  {
                    if (*(float *)&v13 >= v27)
                      v31 = v28;
                    else
                      v31 = *(float *)&v13;
                    v12 = *(float *)&v12;
                  }
                  else
                  {
                    if (v27 >= *(float *)&v12)
                      v31 = *(float *)&v12;
                    else
                      v31 = v28;
                    v12 = *(float *)&v13;
                  }
                }
                else
                {
                  if (*(float *)&v13 >= *(float *)&v12)
                    v31 = *(float *)&v12;
                  else
                    v31 = *(float *)&v13;
                  v12 = v28;
                }
                v32 = 0.0;
                if (v12 <= 0.0)
                {
                  v13 = 0.0;
                }
                else
                {
                  v33 = v12 - v31;
                  v13 = (v12 - v31) / v12;
                  if (v13 != 0.0)
                  {
                    v34 = (v12 - v26) / v33;
                    v35 = (v12 - v25) / v33;
                    if (v12 == v28)
                    {
                      if (v31 == v26)
                        v32 = v35 + 5.0;
                      else
                        v32 = 1.0 - v34;
                    }
                    else
                    {
                      v37 = v12 == v26;
                      v38 = (v12 - v28) / v33;
                      if (v37)
                      {
                        if (v31 == v25)
                          v32 = v38 + 1.0;
                        else
                          v32 = 3.0 - v35;
                      }
                      else if (v31 == v28)
                      {
                        v32 = v34 + 3.0;
                      }
                      else
                      {
                        v32 = 5.0 - v38;
                      }
                    }
                  }
                }
                v14 = v32 / 6.0;
                p_var0 = &imageHSVMap[v15 + v19].var0;
                *p_var0 = v32 / 6.0;
                p_var0[1] = v13;
                p_var0[2] = v12;
                v20 += 4;
                ++v19;
              }
              while (width != v19);
            }
            ++v16;
            v15 += width;
          }
          while (v16 != height);
        }
      }
    }
  }
}

- (void)printHistogram:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v5 = 0;
    v6 = a4;
    do
    {
      v7 = a3[v5];
      if ((_DWORD)v7)
        printf("%ld - %ld\n", v5, v7);
      ++v5;
    }
    while (v6 != v5);
  }
}

- (unsigned)weightHistogram:(unsigned int *)a3 size:(unsigned int)a4 spread:(unsigned int)a5
{
  size_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  double v16;
  int v17;
  char v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  unsigned int v22;

  v8 = 4 * a4;
  v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
  memcpy(v9, a3, v8);
  if (a4)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *((_DWORD *)v9 + v11);
      if (!a5)
        goto LABEL_26;
      v15 = 0;
      v16 = (double)v14;
      v17 = 1;
      v18 = 1;
      do
      {
        v19 = v11 + v15 - 1;
        v20 = v19 < 0 && a4 == 360;
        LODWORD(v21) = v11 + v15 + 359;
        if (v20)
          v21 = v21;
        else
          v21 = v19;
        if ((v21 & 0x80000000) == 0)
        {
          LODWORD(v10) = *((_DWORD *)v9 + v21);
          v10 = (double)*(unint64_t *)&v10;
          if (v16 >= v10)
          {
            v10 = ((double)v17 * -0.0500000007 + 1.0) * v10;
            v14 += vcvtad_u64_f64(v10);
            a3[v21] = 0;
          }
          else
          {
            v18 = 0;
          }
        }
        v22 = v11 + v17;
        if ((int)v11 + v17 > 360 && a4 == 360)
          v22 = v11 + v17 - 360;
        if (v22 < a4)
        {
          LODWORD(v10) = *((_DWORD *)v9 + (int)v22);
          v10 = (double)*(unint64_t *)&v10;
          if (v16 >= v10)
          {
            v10 = ((double)v17 * -0.0500000007 + 1.0) * v10;
            v14 += vcvtad_u64_f64(v10);
            a3[v22] = 0;
          }
          else
          {
            v18 = 0;
          }
        }
        ++v17;
        --v15;
      }
      while (-a5 != v15);
      if ((v18 & 1) == 0)
        v14 = a3[v11];
      else
LABEL_26:
        a3[v11] = v14;
      if (v14 > v12)
      {
        v13 = v11;
        v12 = v14;
      }
      ++v11;
    }
    while (v11 != a4);
  }
  else
  {
    v13 = 0;
  }
  free(v9);
  return v13;
}

- (void)iterateOverPixelsWithBlock:(id)a3 forHue:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  unsigned int height;
  int v8;
  int v9;
  uint64_t width;
  uint64_t v11;
  int v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    if (self->_imageHSVMap)
    {
      height = self->_imageSize.height;
      if (height)
      {
        v8 = 0;
        v9 = 0;
        width = self->_imageSize.width;
        v13 = v6;
        do
        {
          v11 = width;
          v12 = v8;
          if ((_DWORD)width)
          {
            do
            {
              (*((void (**)(id, HSVColor *, uint64_t))v6 + 2))(v13, &self->_imageHSVMap[v12], v4);
              v6 = v13;
              ++v12;
              --v11;
            }
            while (v11);
          }
          ++v9;
          v8 += width;
        }
        while (v9 != height);
      }
    }
  }

}

- (void)findBrightColors
{
  unsigned int *hueHistogram;
  void *v4;
  uint64_t i;
  SortHueEntry *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__GKImageColorPalette_findBrightColors__block_invoke;
  v7[3] = &unk_24DC27B70;
  v7[4] = self;
  -[GKImageColorPalette iterateOverPixelsWithBlock:forHue:](self, "iterateOverPixelsWithBlock:forHue:", v7, 0);
  hueHistogram = self->_hueHistogram;
  -[GKImageColorPalette weightHistogram:size:spread:](self, "weightHistogram:size:spread:", self->_hueHistogram, 360, self->_hueSpread);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 360);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 360; ++i)
  {
    if (hueHistogram[i] >= 0xB)
    {
      v6 = -[SortHueEntry initWithHue:count:]([SortHueEntry alloc], "initWithHue:count:", i, hueHistogram[i]);
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_9);

}

double __39__GKImageColorPalette_findBrightColors__block_invoke(uint64_t a1, double *a2)
{
  double result;
  double v3;
  unsigned int v4;

  result = a2[1];
  if (result >= 0.0399999991)
  {
    v3 = a2[2];
    if (v3 <= 0.899999976)
    {
      result = result * 0.100000001 + 0.0 + v3;
      if (result >= 0.200000003)
      {
        result = *a2 * 359.0;
        v4 = vcvtad_u64_f64(result);
        ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56 + 4 * v4);
      }
    }
  }
  return result;
}

uint64_t __39__GKImageColorPalette_findBrightColors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 <= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 < objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)analyzeImage:(CGImage *)a3
{
  CGFloat Width;
  size_t Height;
  GKImageContext *v7;
  CGContext *v8;
  HSVColor *imageHSVMap;
  CGRect v11;

  -[GKImageColorPalette reset](self, "reset");
  if (a3)
  {
    Width = (double)CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    self->_imageSize.width = Width;
    self->_imageSize.height = (double)Height;
    v7 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", 0, self->_imageSize.width, self->_imageSize.height, 1.0);
    v8 = -[GKImageContext CGContext](v7, "CGContext");
    v11.size.width = self->_imageSize.width;
    v11.size.height = self->_imageSize.height;
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    CGContextDrawImage(v8, v11, a3);
    -[GKImageColorPalette generateHSVMapWithContext:](self, "generateHSVMapWithContext:", -[GKImageContext CGContext](v7, "CGContext"));
    imageHSVMap = self->_imageHSVMap;
    LOBYTE(a3) = imageHSVMap != 0;
    if (imageHSVMap)
      -[GKImageColorPalette findBrightColors](self, "findBrightColors");

  }
  return (char)a3;
}

- (GKImageColorPalette)initWithImage:(id)a3
{
  id v4;
  GKImageColorPalette *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKImageColorPalette;
  v5 = -[GKImageColorPalette init](&v7, sel_init);
  if (v5)
    -[GKImageColorPalette analyzeImage:](v5, "analyzeImage:", objc_msgSend(objc_retainAutorelease(v4), "CGImage"));

  return v5;
}

@end

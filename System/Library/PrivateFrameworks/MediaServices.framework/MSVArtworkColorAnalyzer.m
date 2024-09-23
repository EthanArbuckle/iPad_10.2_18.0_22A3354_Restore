@implementation MSVArtworkColorAnalyzer

+ (BOOL)isLightColor:(CGColor *)a3
{
  uint64_t *v4;
  size_t NumberOfComponents;
  __int128 v6;
  int64x2_t v7;
  CGColorSpace *v8;
  CGColorSpaceRef ColorSpace;
  CGColorSpace *v10;
  unint64_t v11;
  CGColor *v12;
  CGContext *v13;
  CGContext *v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  __n128 v18;
  ITColor *v19;
  double v20;
  unint64_t v22;
  __int128 v23;
  int64x2_t v24;
  __n128 v25;
  int data;
  CGFloat components[2];
  __int128 v28;
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)CGColorGetComponents(a3);
  v23 = xmmword_1A07D4D50;
  NumberOfComponents = CGColorGetNumberOfComponents(a3);
  *((_QWORD *)&v6 + 1) = 0x3FF0000000000000;
  switch(NumberOfComponents)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      *((_QWORD *)&v6 + 1) = v4[1];
LABEL_3:
      *(_QWORD *)&v6 = *v4;
      v7 = vdupq_lane_s64(*v4, 0);
      goto LABEL_7;
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      *((_QWORD *)&v6 + 1) = v4[3];
LABEL_6:
      v7 = *(int64x2_t *)v4;
      *(_QWORD *)&v6 = v4[2];
LABEL_7:
      v23 = v6;
      v24 = v7;
      break;
    default:
      v24 = 0u;
      break;
  }
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  ColorSpace = CGColorGetColorSpace(a3);
  v10 = ColorSpace;
  data = 0;
  if (!ColorSpace || !v8 || !CFEqual(ColorSpace, v8))
  {
    *(int64x2_t *)components = v24;
    v28 = v23;
    v12 = CGColorCreate(v10, components);
    *(_QWORD *)&v23 = 0;
    if (v12)
    {
      v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, v8, 0x4002u);
      v14 = v13;
      if (v13)
      {
        CGContextSetFillColorWithColor(v13, v12);
        v30.origin.x = 0.0;
        v30.origin.y = 0.0;
        v30.size.width = 1.0;
        v30.size.height = 1.0;
        CGContextFillRect(v14, v30);
        LOBYTE(v15) = BYTE1(data);
        v16 = (double)v15 / 255.0;
        *(double *)v24.i64 = v16;
        LOBYTE(v16) = BYTE2(data);
        *(double *)&v17 = (double)*(unint64_t *)&v16 / 255.0;
        v22 = v17;
        LOBYTE(v17) = HIBYTE(data);
        *(double *)&v23 = (double)v17 / 255.0;
LABEL_17:
        CGColorRelease(v12);
        CGContextRelease(v14);
        v11 = v22;
        goto LABEL_18;
      }
    }
    else
    {
      v14 = 0;
    }
    v22 = 0;
    v24.i64[0] = 0;
    goto LABEL_17;
  }
  v11 = v24.u64[1];
LABEL_18:
  v18.n128_u64[0] = v24.i64[0];
  v18.n128_u64[1] = v11;
  v25 = v18;
  CGColorSpaceRelease(v8);
  ITColor::GetLuminance(v19, v25, *(double *)&v23);
  return v20 >= 0.180000007;
}

- (MSVArtworkColorAnalyzer)initWithSourceImage:(CGImage *)a3
{
  MSVArtworkColorAnalyzer *v4;
  MSVArtworkColorAnalyzer *v5;

  v4 = -[MSVArtworkColorAnalyzer init](self, "init");
  v5 = v4;
  if (v4)
    -[MSVArtworkColorAnalyzer setSourceImage:](v4, "setSourceImage:", a3);
  return v5;
}

- (id)analyze
{
  MSVMutableArtworkColorAnalysis *v3;
  CGImage *v4;
  size_t Width;
  size_t Height;
  CGColorSpace *v7;
  CGImageRef CopyWithColorSpace;
  CGImage *v9;
  CGImage *v10;
  CGContext *v11;
  CGContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AnalyzedImageColors v18;
  CGRect v19;

  v3 = objc_alloc_init(MSVMutableArtworkColorAnalysis);
  -[MSVArtworkColorAnalysis setBackgroundColorHex:](v3, "setBackgroundColorHex:", CFSTR("#000000"));
  -[MSVMutableArtworkColorAnalysis setBackgroundColorLight:](v3, "setBackgroundColorLight:", 0);
  -[MSVArtworkColorAnalysis setPrimaryTextColorHex:](v3, "setPrimaryTextColorHex:", CFSTR("#FFFFFF"));
  -[MSVMutableArtworkColorAnalysis setPrimaryTextColorLight:](v3, "setPrimaryTextColorLight:", 0);
  -[MSVArtworkColorAnalysis setSecondaryTextColorHex:](v3, "setSecondaryTextColorHex:", CFSTR("#63666A"));
  -[MSVMutableArtworkColorAnalysis setSecondaryTextColorLight:](v3, "setSecondaryTextColorLight:", 0);
  -[MSVArtworkColorAnalysis setTertiaryTextColorHex:](v3, "setTertiaryTextColorHex:", CFSTR("#63666A"));
  -[MSVMutableArtworkColorAnalysis setTertiaryTextColorLight:](v3, "setTertiaryTextColorLight:", 0);
  -[MSVArtworkColorAnalyzer sourceImage](self, "sourceImage");
  v4 = (CGImage *)objc_claimAutoreleasedReturnValue();
  Width = CGImageGetWidth(v4);
  Height = CGImageGetHeight(v4);
  if (Width && Height)
  {
    if (CGColorSpaceGetSRGB(void)::sOnceToken != -1)
      dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1175);
    v7 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    if (CGColorSpaceGetSRGB(void)::sSpace)
    {
      CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v4, (CGColorSpaceRef)CGColorSpaceGetSRGB(void)::sSpace);
      v9 = CopyWithColorSpace;
      if (CopyWithColorSpace)
        v10 = CopyWithColorSpace;
      else
        v10 = v4;
    }
    else
    {
      v9 = 0;
      v10 = v4;
    }
    v12 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, v7, 0x2002u);
    v11 = v12;
    if (v12)
    {
      v19.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
      v19.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
      v19.size.width = 22.0;
      v19.size.height = 22.0;
      CGContextDrawImage(v12, v19, v10);
    }
    if (v9)
      CGImageRelease(v9);

    if (v11)
    {
      memset(&v18, 0, 24);
      v18.var0.var3 = 1.0;
      memset(&v18.var1, 0, 24);
      v18.var1.var3 = 1.0;
      memset(&v18.var2, 0, 24);
      v18.var2.var3 = 1.0;
      memset(&v18.var3, 0, 24);
      v18.var3.var3 = 1.0;
      memset(&v18.var4, 0, 24);
      v18.var4.var3 = 1.0;
      memset(&v18.var5, 0, 24);
      v18.var5.var3 = 1.0;
      memset(&v18.var6, 0, 24);
      v18.var6.var3 = 1.0;
      memset(&v18.var7, 0, 24);
      v18.var7.var3 = 1.0;
      memset(&v18.var8, 0, 24);
      v18.var8.var3 = 1.0;
      *(double *)((char *)&v18.var9 + 5) = 0.0;
      v18.var9 = 0.0;
      AnalyzeImagePlease(v11, &v18);
      if (v18.var10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v18.var0.var0 * 255.0), (int)(v18.var0.var1 * 255.0), (int)(v18.var0.var2 * 255.0));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkColorAnalysis setBackgroundColorHex:](v3, "setBackgroundColorHex:", v13);

        -[MSVMutableArtworkColorAnalysis setBackgroundColorLight:](v3, "setBackgroundColorLight:", v18.var11);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v18.var1.var0 * 255.0), (int)(v18.var1.var1 * 255.0), (int)(v18.var1.var2 * 255.0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkColorAnalysis setPrimaryTextColorHex:](v3, "setPrimaryTextColorHex:", v14);

        -[MSVMutableArtworkColorAnalysis setPrimaryTextColorLight:](v3, "setPrimaryTextColorLight:", v18.var12);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v18.var2.var0 * 255.0), (int)(v18.var2.var1 * 255.0), (int)(v18.var2.var2 * 255.0));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkColorAnalysis setSecondaryTextColorHex:](v3, "setSecondaryTextColorHex:", v15);

        -[MSVMutableArtworkColorAnalysis setSecondaryTextColorLight:](v3, "setSecondaryTextColorLight:", v18.var13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v18.var3.var0 * 255.0), (int)(v18.var3.var1 * 255.0), (int)(v18.var3.var2 * 255.0));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkColorAnalysis setTertiaryTextColorHex:](v3, "setTertiaryTextColorHex:", v16);

      }
    }
  }
  else
  {

    v11 = 0;
  }
  CGContextRelease(v11);
  return v3;
}

- (void)analyzeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MSVArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E43E9EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (CGImage)sourceImage
{
  return self->_sourceImage;
}

- (void)setSourceImage:(CGImage *)a3
{
  objc_storeStrong((id *)&self->_sourceImage, a3);
}

- (CGSize)preferredImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredImageSize.width;
  height = self->_preferredImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredImageSize:(CGSize)a3
{
  self->_preferredImageSize = a3;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceImage, 0);
}

void __56__MSVArtworkColorAnalyzer_analyzeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "analyze");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

@end

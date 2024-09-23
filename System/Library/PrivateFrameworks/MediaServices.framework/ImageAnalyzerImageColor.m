@implementation ImageAnalyzerImageColor

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ImageAnalyzerImageColor colorString:](self, "colorString:", -[ImageAnalyzerImageColor backgroundColor](self, "backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ImageAnalyzerImageColor colorString:](self, "colorString:", -[ImageAnalyzerImageColor primaryTextColor](self, "primaryTextColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ImageAnalyzerImageColor colorString:](self, "colorString:", -[ImageAnalyzerImageColor secondaryTextColor](self, "secondaryTextColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ImageAnalyzerImageColor colorString:](self, "colorString:", -[ImageAnalyzerImageColor tertiaryTextColor](self, "tertiaryTextColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ImageAnalyzerImageColor colorString:](self, "colorString:", -[ImageAnalyzerImageColor quaternaryTextColor](self, "quaternaryTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("backgroundColor:{%@}, textPrimaryColor:{%@}, secondaryTextColor:{%@}, tertiaryTextColor:{%@}, quaternaryTextColor:{%@}"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)colorString:(CGColor *)a3
{
  const CGFloat *Components;
  size_t NumberOfComponents;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  Components = CGColorGetComponents(a3);
  NumberOfComponents = CGColorGetNumberOfComponents(a3);
  v6 = 1.0;
  switch(NumberOfComponents)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      v6 = Components[1];
LABEL_3:
      v7 = *(_QWORD *)Components;
      v8 = *(_QWORD *)Components;
      v9 = *(_QWORD *)Components;
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("red: %f, green: %f, blue: %f, alpha: %f"), v7, v8, v9, *(_QWORD *)&v6);
    case 3uLL:
      goto LABEL_6;
    case 4uLL:
      v6 = Components[3];
LABEL_6:
      v7 = *(_QWORD *)Components;
      v8 = *((_QWORD *)Components + 1);
      v9 = *((_QWORD *)Components + 2);
      break;
    default:
      v7 = 0;
      v8 = 0;
      v9 = 0;
      break;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("red: %f, green: %f, blue: %f, alpha: %f"), v7, v8, v9, *(_QWORD *)&v6);
}

- (ImageAnalyzerImageColor)initWithImageAnalyzer:(const void *)a3
{
  ImageAnalyzerImageColor *v4;
  __int128 v5;
  CGColorSpace *DeviceRGB;
  CGColorRef v7;
  __int128 v8;
  CGColorSpace *v9;
  CGColorRef v10;
  __int128 v11;
  CGColorSpace *v12;
  CGColorRef v13;
  __int128 v14;
  CGColorSpace *v15;
  CGColorRef v16;
  __int128 v17;
  CGColorSpace *v18;
  CGColorRef v19;
  __int128 v20;
  CGColorSpace *v21;
  CGColorRef v22;
  __int128 v23;
  CGColorSpace *v24;
  CGColorRef v25;
  __int128 v26;
  CGColorSpace *v27;
  CGColorRef v28;
  __int128 v29;
  CGColorSpace *v30;
  CGColorRef v31;
  ITColor *v32;
  double v33;
  ITColor *v34;
  double v35;
  ITColor *v36;
  double v37;
  objc_super v39;
  CGFloat components[2];
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)ImageAnalyzerImageColor;
  v4 = -[ImageAnalyzerImageColor init](&v39, sel_init);
  if (v4)
  {
    v5 = *((_OWORD *)a3 + 3);
    *(_OWORD *)components = *((_OWORD *)a3 + 2);
    v41 = v5;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v7 = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4->_backgroundColor = v7;
    v8 = *((_OWORD *)a3 + 5);
    *(_OWORD *)components = *((_OWORD *)a3 + 4);
    v41 = v8;
    v9 = CGColorSpaceCreateDeviceRGB();
    v10 = CGColorCreate(v9, components);
    CGColorSpaceRelease(v9);
    v4->_primaryTextColor = v10;
    v11 = *((_OWORD *)a3 + 7);
    *(_OWORD *)components = *((_OWORD *)a3 + 6);
    v41 = v11;
    v12 = CGColorSpaceCreateDeviceRGB();
    v13 = CGColorCreate(v12, components);
    CGColorSpaceRelease(v12);
    v4->_secondaryTextColor = v13;
    v14 = *((_OWORD *)a3 + 9);
    *(_OWORD *)components = *((_OWORD *)a3 + 8);
    v41 = v14;
    v15 = CGColorSpaceCreateDeviceRGB();
    v16 = CGColorCreate(v15, components);
    CGColorSpaceRelease(v15);
    v4->_tertiaryTextColor = v16;
    v17 = *((_OWORD *)a3 + 11);
    *(_OWORD *)components = *((_OWORD *)a3 + 10);
    v41 = v17;
    v18 = CGColorSpaceCreateDeviceRGB();
    v19 = CGColorCreate(v18, components);
    CGColorSpaceRelease(v18);
    v4->_quaternaryTextColor = v19;
    v20 = *((_OWORD *)a3 + 13);
    *(_OWORD *)components = *((_OWORD *)a3 + 12);
    v41 = v20;
    v21 = CGColorSpaceCreateDeviceRGB();
    v22 = CGColorCreate(v21, components);
    CGColorSpaceRelease(v21);
    v4->_primaryDropShadowColor = v22;
    v23 = *((_OWORD *)a3 + 15);
    *(_OWORD *)components = *((_OWORD *)a3 + 14);
    v41 = v23;
    v24 = CGColorSpaceCreateDeviceRGB();
    v25 = CGColorCreate(v24, components);
    CGColorSpaceRelease(v24);
    v4->_tertiaryDropShadowColor = v25;
    v26 = *((_OWORD *)a3 + 17);
    *(_OWORD *)components = *((_OWORD *)a3 + 16);
    v41 = v26;
    v27 = CGColorSpaceCreateDeviceRGB();
    v28 = CGColorCreate(v27, components);
    CGColorSpaceRelease(v27);
    v4->_secondaryDropShadowColor = v28;
    v29 = *((_OWORD *)a3 + 19);
    *(_OWORD *)components = *((_OWORD *)a3 + 18);
    v41 = v29;
    v30 = CGColorSpaceCreateDeviceRGB();
    v31 = CGColorCreate(v30, components);
    CGColorSpaceRelease(v30);
    v4->_quarnaryDropShadowColor = v31;
    ITColor::GetLuminance(v32, *((__n128 *)a3 + 2), *((double *)a3 + 6));
    v4->_isBackgroundLight = v33 >= 0.180000007;
    ITColor::GetLuminance(v34, *((__n128 *)a3 + 4), *((double *)a3 + 10));
    v4->_isPrimaryColorLight = v35 >= 0.180000007;
    ITColor::GetLuminance(v36, *((__n128 *)a3 + 6), *((double *)a3 + 14));
    v4->_isSecondaryColorLight = v37 >= 0.180000007;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_primaryTextColor);
  CGColorRelease(self->_secondaryTextColor);
  CGColorRelease(self->_tertiaryTextColor);
  CGColorRelease(self->_quaternaryTextColor);
  CGColorRelease(self->_primaryDropShadowColor);
  CGColorRelease(self->_tertiaryDropShadowColor);
  CGColorRelease(self->_secondaryDropShadowColor);
  CGColorRelease(self->_quarnaryDropShadowColor);
  v3.receiver = self;
  v3.super_class = (Class)ImageAnalyzerImageColor;
  -[ImageAnalyzerImageColor dealloc](&v3, sel_dealloc);
}

- (ImageAnalyzerImageColor)initWithAnalyzedImageColors:(const AnalyzedImageColors *)a3
{
  ImageAnalyzerImageColor *v4;
  __int128 v5;
  CGColorSpace *DeviceRGB;
  CGColorRef v7;
  __int128 v8;
  CGColorSpace *v9;
  CGColorRef v10;
  __int128 v11;
  CGColorSpace *v12;
  CGColorRef v13;
  __int128 v14;
  CGColorSpace *v15;
  CGColorRef v16;
  __int128 v17;
  CGColorSpace *v18;
  CGColorRef v19;
  __int128 v20;
  CGColorSpace *v21;
  CGColorRef v22;
  __int128 v23;
  CGColorSpace *v24;
  CGColorRef v25;
  __int128 v26;
  CGColorSpace *v27;
  CGColorRef v28;
  __int128 v29;
  CGColorSpace *v30;
  CGColorRef v31;
  objc_super v33;
  CGFloat components[2];
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)ImageAnalyzerImageColor;
  v4 = -[ImageAnalyzerImageColor init](&v33, sel_init);
  if (v4)
  {
    v5 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var0.var0;
    v35 = v5;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v7 = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4->_backgroundColor = v7;
    v8 = *(_OWORD *)&a3->var1.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var1.var0;
    v35 = v8;
    v9 = CGColorSpaceCreateDeviceRGB();
    v10 = CGColorCreate(v9, components);
    CGColorSpaceRelease(v9);
    v4->_primaryTextColor = v10;
    v11 = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var2.var0;
    v35 = v11;
    v12 = CGColorSpaceCreateDeviceRGB();
    v13 = CGColorCreate(v12, components);
    CGColorSpaceRelease(v12);
    v4->_secondaryTextColor = v13;
    v14 = *(_OWORD *)&a3->var3.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var3.var0;
    v35 = v14;
    v15 = CGColorSpaceCreateDeviceRGB();
    v16 = CGColorCreate(v15, components);
    CGColorSpaceRelease(v15);
    v4->_tertiaryTextColor = v16;
    v17 = *(_OWORD *)&a3->var4.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var4.var0;
    v35 = v17;
    v18 = CGColorSpaceCreateDeviceRGB();
    v19 = CGColorCreate(v18, components);
    CGColorSpaceRelease(v18);
    v4->_quaternaryTextColor = v19;
    v20 = *(_OWORD *)&a3->var5.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var5.var0;
    v35 = v20;
    v21 = CGColorSpaceCreateDeviceRGB();
    v22 = CGColorCreate(v21, components);
    CGColorSpaceRelease(v21);
    v4->_primaryDropShadowColor = v22;
    v23 = *(_OWORD *)&a3->var7.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var7.var0;
    v35 = v23;
    v24 = CGColorSpaceCreateDeviceRGB();
    v25 = CGColorCreate(v24, components);
    CGColorSpaceRelease(v24);
    v4->_tertiaryDropShadowColor = v25;
    v26 = *(_OWORD *)&a3->var6.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var6.var0;
    v35 = v26;
    v27 = CGColorSpaceCreateDeviceRGB();
    v28 = CGColorCreate(v27, components);
    CGColorSpaceRelease(v27);
    v4->_secondaryDropShadowColor = v28;
    v29 = *(_OWORD *)&a3->var8.var2;
    *(_OWORD *)components = *(_OWORD *)&a3->var8.var0;
    v35 = v29;
    v30 = CGColorSpaceCreateDeviceRGB();
    v31 = CGColorCreate(v30, components);
    CGColorSpaceRelease(v30);
    v4->_quarnaryDropShadowColor = v31;
    v4->_isBackgroundLight = a3->var11;
    v4->_isPrimaryColorLight = a3->var12;
    v4->_isSecondaryColorLight = a3->var13;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[ImageAnalyzerImageColor isEqualToImageColor:](self, "isEqualToImageColor:", v4);

  return v5;
}

- (BOOL)isEqualToImageColor:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && CGColorEqualToColor(-[ImageAnalyzerImageColor backgroundColor](self, "backgroundColor"), (CGColorRef)objc_msgSend(v4, "backgroundColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor primaryTextColor](self, "primaryTextColor"), (CGColorRef)objc_msgSend(v4, "primaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor tertiaryTextColor](self, "tertiaryTextColor"), (CGColorRef)objc_msgSend(v4, "tertiaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor quaternaryTextColor](self, "quaternaryTextColor"), (CGColorRef)objc_msgSend(v4, "quaternaryTextColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor primaryDropShadowColor](self, "primaryDropShadowColor"), (CGColorRef)objc_msgSend(v4, "primaryDropShadowColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor secondaryDropShadowColor](self, "secondaryDropShadowColor"), (CGColorRef)objc_msgSend(v4, "secondaryDropShadowColor"))&& CGColorEqualToColor(-[ImageAnalyzerImageColor tertiaryDropShadowColor](self, "tertiaryDropShadowColor"),
         (CGColorRef)objc_msgSend(v4, "tertiaryDropShadowColor"))
    && CGColorEqualToColor(-[ImageAnalyzerImageColor quarnaryDropShadowColor](self, "quarnaryDropShadowColor"), (CGColorRef)objc_msgSend(v4, "quarnaryDropShadowColor"));

  return v5;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (CGColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (CGColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (CGColor)quaternaryTextColor
{
  return self->_quaternaryTextColor;
}

- (CGColor)primaryDropShadowColor
{
  return self->_primaryDropShadowColor;
}

- (CGColor)secondaryDropShadowColor
{
  return self->_secondaryDropShadowColor;
}

- (CGColor)tertiaryDropShadowColor
{
  return self->_tertiaryDropShadowColor;
}

- (CGColor)quarnaryDropShadowColor
{
  return self->_quarnaryDropShadowColor;
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (BOOL)isPrimaryColorLight
{
  return self->_isPrimaryColorLight;
}

- (BOOL)isSecondaryColorLight
{
  return self->_isSecondaryColorLight;
}

+ (ImageAnalyzerImageColor)defaultColors
{
  if (+[ImageAnalyzerImageColor defaultColors]::onceToken != -1)
    dispatch_once(&+[ImageAnalyzerImageColor defaultColors]::onceToken, &__block_literal_global);
  return (ImageAnalyzerImageColor *)(id)+[ImageAnalyzerImageColor defaultColors]::_defaultColors;
}

+ (ImageAnalyzerImageColor)imageColorWithImageAnalyzer:(const void *)a3
{
  return (ImageAnalyzerImageColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithImageAnalyzer:", a3);
}

+ (ImageAnalyzerImageColor)imageColorWithAnalyzedImageColors:(const AnalyzedImageColors *)a3
{
  return (ImageAnalyzerImageColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAnalyzedImageColors:", a3);
}

+ (id)determineColors:(CGImage *)a3 error:(id *)a4
{
  CGImageAlphaInfo AlphaInfo;
  int v6;
  CGColorSpace *ColorSpace;
  CGColorSpace *v8;
  CGColorSpaceModel Model;
  BOOL v10;
  CGContext *v12;
  CGContext *v13;
  CGImage *Image;
  CGImage *v15;
  __int16 BitmapInfo;
  vImage_Error v17;
  char v18;
  vImage_Error v19;
  char v20;
  vImagePixelCount height;
  vImagePixelCount width;
  double v23;
  __int128 v24;
  vImagePixelCount v25;
  int v26;
  unsigned int v27;
  unint64_t v28;
  _BOOL4 v29;
  BOOL v30;
  _BOOL4 v31;
  char v32;
  uint64_t v33;
  char *v34;
  char *v35;
  vImagePixelCount v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  unint64_t v43;
  __n128 v44;
  double v45;
  __int128 v46;
  double HSVColor;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  ITColor *v52;
  double v53;
  ITColor *v54;
  ITColor *v55;
  void *v56;
  std::logic_error *exception;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  void *v89;
  vImagePixelCount v90;
  unint64_t v91;
  vImagePixelCount v92;
  size_t rowBytes;
  char *data;
  __n128 v95;
  double v96;
  __int128 v97;
  _QWORD v98[40];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  vImage_CGImageFormat format;
  vImage_Buffer buf;
  CGImage *v105;
  char v106;
  CGContext *v107;
  char v108;
  ITColor v109;
  CGRect v110;

  memset(&v98[4], 0, 24);
  v98[7] = 0x3FF0000000000000;
  memset(&v98[8], 0, 24);
  v98[11] = 0x3FF0000000000000;
  memset(&v98[12], 0, 24);
  v98[15] = 0x3FF0000000000000;
  memset(&v98[16], 0, 24);
  v98[19] = 0x3FF0000000000000;
  memset(&v98[20], 0, 24);
  v98[23] = 0x3FF0000000000000;
  memset(&v98[24], 0, 24);
  v98[27] = 0x3FF0000000000000;
  memset(&v98[28], 0, 24);
  v98[31] = 0x3FF0000000000000;
  memset(&v98[32], 0, 24);
  v98[35] = 0x3FF0000000000000;
  memset(&v98[36], 0, 24);
  v98[39] = 0x3FF0000000000000;
  v98[0] = 0;
  v98[1] = 0;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  if (!a3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ImageAnalyzer::AnalyzeImage() - CGImageRef parameter is nil.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E43E7938, MEMORY[0x1E0DE4360]);
  }
  AlphaInfo = CGImageGetAlphaInfo(a3);
  v6 = AlphaInfo;
  if (AlphaInfo)
  {
    if (AlphaInfo == kCGImageAlphaLast)
    {
      v6 = 1;
    }
    else if (AlphaInfo == kCGImageAlphaFirst)
    {
      v6 = 2;
    }
  }
  else
  {
    v6 = 5;
  }
  ColorSpace = CGImageGetColorSpace(a3);
  v8 = ColorSpace;
  if (ColorSpace)
  {
    Model = CGColorSpaceGetModel(ColorSpace);
    v10 = CGColorSpaceSupportsOutput(v8);
    if (Model != kCGColorSpaceModelRGB || !v10)
    {
      if (CGColorSpaceGetSRGB(void)::sOnceToken != -1)
        dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1175);
      v8 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    }
  }
  v12 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0, v8, 1u);
  v13 = v12;
  if (!v12)
  {
    v59 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v59, 2, "ImageAnalyzer::GenerateColorMaps() - Failed to create CG Context", v60, v61, v62, v63, v64, v88);
  }
  v107 = v12;
  v108 = 1;
  v110.origin.x = 0.0;
  v110.origin.y = 0.0;
  v110.size.width = 22.0;
  v110.size.height = 22.0;
  CGContextDrawImage(v12, v110, a3);
  Image = CGBitmapContextCreateImage(v13);
  v15 = Image;
  if (!Image)
  {
    v65 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v65, 3, "ImageAnalyzer::GenerateColorMaps() - Failed to create CG Image", v66, v67, v68, v69, v70, v88);
  }
  v105 = Image;
  v106 = 1;
  BitmapInfo = CGImageGetBitmapInfo(Image);
  memset(&buf, 0, sizeof(buf));
  memset(&format, 0, sizeof(format));
  v17 = vImageBuffer_InitWithCGImage(&buf, &format, 0, v15, 0x100u);
  v18 = v17;
  if (v17)
  {
    v71 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v71, 4, "ImageAnalyzer::GenerateColorMaps() - Failed to create vImageBuffer from CGImage (%zd)", v72, v73, v74, v75, v76, v18);
  }
  if (v6 == 1)
  {
    v19 = vImageUnpremultiplyData_RGBA8888(&buf, &buf, 0x100u);
  }
  else
  {
    if (v6 != 2)
      goto LABEL_24;
    v19 = vImageUnpremultiplyData_ARGB8888(&buf, &buf, 0x100u);
  }
  v20 = v19;
  if (v19)
  {
    v77 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v77, 4, "ImageAnalyzer::GenerateColorMaps() - vImage error un-premultiplying image data. (%zd)", v83, v84, v85, v86, v87, v20);
LABEL_57:
  }
LABEL_24:
  height = buf.height;
  width = buf.width;
  rowBytes = buf.rowBytes;
  data = (char *)buf.data;
  v89 = malloc_type_calloc(buf.height * buf.width, 0x28uLL, 0x10000400A747E1EuLL);
  if (!v89)
  {
    v77 = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)v77, 1, "ImageAnalyzer::getHSVMap() - Failed to allocate memory for imageHSVMap.", v78, v79, v80, v81, v82, v88);
    goto LABEL_57;
  }
  v25 = height - 1;
  if (height - 1 >= 2)
  {
    v26 = 0;
    v27 = v6 & 0xFFFFFFFB;
    v28 = width - 1;
    v29 = (BitmapInfo & 0x3000) != 0;
    v30 = (BitmapInfo & 0x3000) == 0 || (v6 & 0xFFFFFFFB) == 2;
    v31 = v27 == 2 && v29;
    v32 = v27 == 2 || v29;
    v90 = width - 2;
    v33 = 1;
    v91 = width - 1;
    v92 = v25;
    do
    {
      if (v28 >= 2)
      {
        v34 = &data[v33 * rowBytes];
        v35 = v34 + 7;
        v36 = v90;
        v37 = (uint64_t)v89 + 40 * v26 + 16;
        v26 += v90;
        do
        {
          v38 = v34;
          v34 += 4;
          if (v30)
          {
            if (v31)
            {
              v39 = v35 - 1;
              v40 = v35 - 2;
              v41 = v34;
              v42 = v35;
            }
            else if ((v32 & 1) != 0)
            {
              v42 = v38 + 5;
              v39 = v38 + 6;
              v40 = v38 + 7;
              v41 = v34;
            }
            else
            {
              v39 = v38 + 5;
              v40 = v38 + 6;
              v41 = v35;
              v42 = v34;
            }
          }
          else
          {
            v41 = v38 + 7;
            v42 = v38 + 6;
            v39 = v38 + 5;
            v40 = v34;
          }
          LOBYTE(v23) = *v42;
          *(double *)&v43 = (double)*(unint64_t *)&v23;
          v44.n128_f64[0] = *(double *)&v43 / 255.0;
          LOBYTE(v43) = *v39;
          LOBYTE(v24) = *v40;
          *(double *)&v24 = (double)(unint64_t)v24;
          v45 = *(double *)&v24 / 255.0;
          LOBYTE(v24) = *v41;
          v44.n128_f64[1] = (double)v43 / 255.0;
          v95 = v44;
          v96 = v45;
          *(double *)&v24 = (double)(unint64_t)v24;
          v97 = v24;
          *(double *)&v46 = v45;
          *((_QWORD *)&v46 + 1) = v24;
          *(__n128 *)&v109.var0 = v44;
          *(_OWORD *)&v109.var2 = v46;
          HSVColor = ITColor::GetHSVColor(&v109);
          v49 = v48;
          v51 = v50;
          ITColor::GetLuminance(v52, v95, v96);
          *(double *)(v37 - 16) = HSVColor;
          *(_QWORD *)(v37 - 8) = v49;
          *(_QWORD *)v37 = v51;
          *(double *)(v37 + 8) = v53;
          *((_QWORD *)&v24 + 1) = *((_QWORD *)&v97 + 1);
          *(_QWORD *)(v37 + 16) = v97;
          *(_QWORD *)&v24 = *((_QWORD *)&v102 + 1);
          v23 = v53 + *((double *)&v102 + 1);
          *((double *)&v102 + 1) = v23;
          v35 += 4;
          v37 += 40;
          --v36;
        }
        while (v36);
        v28 = v91;
        v25 = v92;
      }
      ++v33;
    }
    while (v33 != v25);
  }
  *((double *)&v102 + 1) = *((double *)&v102 + 1) / 400.0;
  v98[0] = v89;
  if (buf.data)
    free(buf.data);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act((uint64_t)&v105);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act((uint64_t)&v107);
  ImageAnalyzer::QuantizeColorMaps((ImageAnalyzer *)v98);
  ImageAnalyzer::PickBackgroundColor((ImageAnalyzer *)v98);
  ImageAnalyzer::PickTextColors((ImageAnalyzer *)v98);
  ImageAnalyzer::DoPostImageAnalysis((ImageAnalyzer *)v98, v54, v55);
  +[ImageAnalyzerImageColor imageColorWithImageAnalyzer:](ImageAnalyzerImageColor, "imageColorWithImageAnalyzer:", v98);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v98);
  return v56;
}

+ (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  CGContext *v4;
  CGContext *v5;
  void *v6;
  void *exception;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  AnalyzedImageColors v15;

  v4 = (CGContext *)objc_msgSend(a1, "createContextForImage:", a3);
  v5 = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 2, "+[ImageColor analyzeImage:error:] - failed to create CGContext.", v9, v10, v11, v12, v13, v14);
  }
  memset(&v15, 0, 24);
  v15.var0.var3 = 1.0;
  memset(&v15.var1, 0, 24);
  v15.var1.var3 = 1.0;
  memset(&v15.var2, 0, 24);
  v15.var2.var3 = 1.0;
  memset(&v15.var3, 0, 24);
  v15.var3.var3 = 1.0;
  memset(&v15.var4, 0, 24);
  v15.var4.var3 = 1.0;
  memset(&v15.var5, 0, 24);
  v15.var5.var3 = 1.0;
  memset(&v15.var6, 0, 24);
  v15.var6.var3 = 1.0;
  memset(&v15.var7, 0, 24);
  v15.var7.var3 = 1.0;
  memset(&v15.var8, 0, 24);
  v15.var8.var3 = 1.0;
  *(double *)((char *)&v15.var9 + 5) = 0.0;
  v15.var9 = 0.0;
  AnalyzeImagePlease(v4, &v15);
  +[ImageAnalyzerImageColor imageColorWithAnalyzedImageColors:](ImageAnalyzerImageColor, "imageColorWithAnalyzedImageColors:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v5);
  return v6;
}

+ (CGColor)_colorFromITColor:(ITColor)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  CGColorSpace *DeviceRGB;
  CGColorRef v8;
  CGFloat components[5];

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = var0;
  components[1] = var1;
  components[2] = var2;
  components[3] = var3;
  v8 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  CFAutorelease(v8);
  return v8;
}

+ (CGContext)createContextForImage:(CGImage *)a3
{
  CGImage *v3;
  size_t Width;
  size_t Height;
  CGContext *v6;
  CGColorSpace *v7;
  CGImageRef CopyWithColorSpace;
  CGImage *v9;
  CGContext *v10;
  CGRect v12;

  if (!a3)
    return 0;
  v3 = a3;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(v3);
  v6 = 0;
  if (Width && Height)
  {
    if (CGColorSpaceGetSRGB(void)::sOnceToken != -1)
      dispatch_once(&CGColorSpaceGetSRGB(void)::sOnceToken, &__block_literal_global_1175);
    v7 = (CGColorSpace *)CGColorSpaceGetSRGB(void)::sSpace;
    if (CGColorSpaceGetSRGB(void)::sSpace)
    {
      CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v3, (CGColorSpaceRef)CGColorSpaceGetSRGB(void)::sSpace);
      v9 = CopyWithColorSpace;
      if (CopyWithColorSpace)
        v3 = CopyWithColorSpace;
    }
    else
    {
      v9 = 0;
    }
    v10 = CGBitmapContextCreate(0, 0x16uLL, 0x16uLL, 8uLL, 0x58uLL, v7, 0x2002u);
    v6 = v10;
    if (v10)
    {
      v12.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
      v12.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
      v12.size.width = 22.0;
      v12.size.height = 22.0;
      CGContextDrawImage(v10, v12, v3);
    }
    if (v9)
      CGImageRelease(v9);
  }
  return v6;
}

CGColorRef __40__ImageAnalyzerImageColor_defaultColors__block_invoke()
{
  uint64_t v0;
  void *v1;
  CGColorRef result;
  uint64_t v3;

  v0 = objc_opt_new();
  v1 = (void *)+[ImageAnalyzerImageColor defaultColors]::_defaultColors;
  +[ImageAnalyzerImageColor defaultColors]::_defaultColors = v0;

  *(_QWORD *)(+[ImageAnalyzerImageColor defaultColors]::_defaultColors + 16) = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
  *(_QWORD *)(+[ImageAnalyzerImageColor defaultColors]::_defaultColors + 24) = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  result = CGColorCreateGenericRGB(0.333, 0.333, 0.333, 1.0);
  v3 = +[ImageAnalyzerImageColor defaultColors]::_defaultColors;
  *(_QWORD *)(+[ImageAnalyzerImageColor defaultColors]::_defaultColors + 32) = result;
  *(_BYTE *)(v3 + 8) = 1;
  return result;
}

@end

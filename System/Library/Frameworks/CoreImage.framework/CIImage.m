@implementation CIImage

- (CIImage)initWithEmptyClearColor
{
  CI::FillImage *v3;
  CIImage *v4;

  v3 = (CI::FillImage *)operator new();
  CI::FillImage::FillImage(v3);
  v4 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v3);
  CI::Object::unref(v3);
  return v4;
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  CIImage *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CIImage;
    v4 = -[CIImage init](&v6, sel_init);
    if (v4)
      v4->_priv = (void *)CI::Object::ref((uint64_t)a3);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (CIImage)initWithCGImage:(CGImageRef)image
{
  return -[CIImage initWithCGImage:options:](self, "initWithCGImage:options:", image, 0);
}

- (id)_initWithIOSurface:(__IOSurface *)a3 options:(id)a4 owner:(void *)a5
{
  CI *PixelFormat;
  uint64_t v10;
  size_t Width;
  size_t Height;
  CGColorSpaceRef v13;
  id v14;
  __IOSurface *v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  BOOL v43;
  int v44;
  int v45;
  void *v46;
  _BOOL4 v48;
  void *v49;
  NSObject *v50;
  void *v51;
  BOOL v53;
  void *v54;
  BOOL v56;
  CGColorSpaceRef DeviceRGB;
  void *v58;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  float v67;
  CI::SurfaceImage *v68;
  uint64_t ContentDigestFromOptions;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CGFloat v76;
  _BOOL4 v77;
  CI::Image *v78;
  char v79;
  int v80;
  char v81;
  char v82;
  int v83;
  _OWORD v84[3];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[3];
  __int128 v89;
  double v90;
  _QWORD v91[5];
  int v92;
  CGRect v93;

  if (!a3)
  {
LABEL_19:

    return 0;
  }
  PixelFormat = (CI *)IOSurfaceGetPixelFormat(a3);
  v10 = (uint64_t)PixelFormat;
  if ((_DWORD)PixelFormat == 1919365992 || (_DWORD)PixelFormat == 1919365990)
  {
    Width = IOSurfaceGetWidth(a3);
    Height = IOSurfaceGetHeight(a3);
    v13 = (CGColorSpaceRef)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CIImageColorSpace"));
    if (!v13)
    {
      v13 = CopySurfaceColorSpace(a3);
      CFAutorelease(v13);
    }
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __44__CIImage__initWithIOSurface_options_owner___block_invoke;
    v91[3] = &unk_1E2EC40F0;
    v91[4] = a3;
    v92 = v10;
    return -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](self, "initWithImageProvider:width:height:format:colorSpace:options:", v91, Width, Height, 2056, v13, a4);
  }
  if ((CI::PixelFormatType_is_source_supported(PixelFormat) & 1) == 0)
  {
    if (v10 < 0x29)
    {
      v27 = ci_logger_api();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CIImage _initWithIOSurface:options:owner:].cold.4(v10, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      LODWORD(v85) = bswap32(v10);
      v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CIImage _initWithIOSurface:options:owner:].cold.3((uint64_t)&v85, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_19;
  }
  v16 = CI::format_from_IOSurface(a3, v15);
  v17 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageSurfaceFormat"));
  if (v17)
  {
    v18 = objc_msgSend(v17, "unsignedIntValue");
    v19 = CI::format_bits_per_pixel(v16);
    v16 = v18;
    if (v19 != CI::format_bits_per_pixel(v18))
    {
      v34 = ci_logger_api();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CIImage _initWithIOSurface:options:owner:].cold.2();
      goto LABEL_19;
    }
  }
  if (objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")))
    v80 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue");
  else
    v80 = 1;
  if (CI::format_has_unpremul_alpha(v16))
  {
    v36 = 2;
  }
  else if ((CI::format_has_alpha(v16) & 1) != 0)
  {
    v36 = 0;
  }
  else if (CI::format_has_x(v16))
  {
    v36 = -1;
  }
  else
  {
    v36 = 1;
  }
  if (objc_msgSend(a4, "objectForKey:", CFSTR("CIImagePremultiplied")))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIImagePremultiplied")), "BOOLValue"))
      v36 = 0;
    else
      v36 = 2;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAlphaSkip")), "BOOLValue"))
    v37 = -1;
  else
    v37 = v36;
  v38 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
  if (CI::format_is_ycc(v16) | v38)
    v39 = 1;
  else
    v39 = v37;
  if (a4)
    v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgesAreClear"));
  else
    v40 = 0;
  v41 = (void *)MEMORY[0x1E0C9AAB0];
  v43 = v40 == (void *)MEMORY[0x1E0C9AAB0] || v40 == &unk_1E2F1B9F8;
  if (v43 && v39 == 0)
    v44 = 4;
  else
    v44 = v39;
  if (v43 && v44 == 2)
    v45 = 6;
  else
    v45 = v44;
  if (a4)
  {
    v46 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageClampToEdge"));
    v48 = v46 == v41 || v46 == &unk_1E2F1B9F8;
    v83 = v48;
    v49 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgeRepeat"));
  }
  else
  {
    v83 = 0;
    v49 = 0;
  }
  if (v49 == v41 || v49 == &unk_1E2F1B9F8)
  {
    v50 = ci_logger_api();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      -[CIImage _initWithIOSurface:options:owner:].cold.1();
      if (a4)
        goto LABEL_67;
LABEL_75:
      v82 = 0;
      v54 = 0;
      goto LABEL_76;
    }
  }
  if (!a4)
    goto LABEL_75;
LABEL_67:
  v51 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageNearestSampling"));
  v53 = v51 == v41 || v51 == &unk_1E2F1B9F8;
  v82 = v53;
  v54 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageCacheHint"));
LABEL_76:
  v56 = v54 == v41 || v54 == &unk_1E2F1B9F8;
  v81 = v56;
  DeviceRGB = (CGColorSpaceRef)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageColorSpace"));
  if ((CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0C99E38], "null") == DeviceRGB || CI_NO_CM())
  {
    v79 = 1;
  }
  else
  {
    if (!DeviceRGB)
    {
      DeviceRGB = CopySurfaceColorSpace(a3);
      if (DeviceRGB || (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0)
        CFAutorelease(DeviceRGB);
    }
    v79 = 0;
  }
  if (objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR")))
  {
    if (a4)
      v58 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"));
    else
      v58 = 0;
    v60 = v58 == v41 || v58 == &unk_1E2F1B9F8;
    v77 = v60;
  }
  else
  {
    v77 = 0;
  }
  v61 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageProperties"));
  v62 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
  v78 = DeviceRGB;
  if (objc_msgSend(v62, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v63 = (void *)objc_msgSend(v61, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    if (v63)
      LODWORD(v63) = objc_msgSend(v63, "intValue");
    if (((_DWORD)v63 - 9) >= 0xFFFFFFF8)
      v64 = (int)v63;
    else
      v64 = 0;
    if (!v61 || (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v61)
      goto LABEL_116;
    v65 = &__block_literal_global_688;
    goto LABEL_114;
  }
  if (!v61)
  {
    v64 = 0;
    goto LABEL_116;
  }
  v64 = 0;
  if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v61)
  {
    v65 = &__block_literal_global_692;
LABEL_114:
    v61 = (void *)dictionaryDeepCopy(v61, (uint64_t)v65);
  }
LABEL_116:
  if (objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageYCCMatrix")))
    v66 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageYCCMatrix")), "intValue");
  else
    v66 = 0;
  v67 = OptionHeadroom((NSDictionary *)a4);
  v68 = (CI::SurfaceImage *)operator new();
  ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a4);
  CI::SurfaceImage::SurfaceImage((uint64_t)v68, a3, ContentDigestFromOptions, v16, v66, v61, v45, v83, v67, v82, v81);
  v70 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVDepthData"));
  if (v70)
  {
    v71 = v70;
    AVDepthDataClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(CI::SurfaceImage *, uint64_t))(*(_QWORD *)v68 + 320))(v68, v71);
  }
  v72 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVPortraitEffectsMatte"));
  if (v72)
  {
    v73 = v72;
    AVPortraitEffectsMatteClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(CI::SurfaceImage *, uint64_t))(*(_QWORD *)v68 + 328))(v68, v73);
  }
  v74 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVSemanticSegmentationMatte"));
  if (v74)
  {
    v75 = v74;
    AVSemanticSegmentationMatteClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(CI::SurfaceImage *, uint64_t))(*(_QWORD *)v68 + 336))(v68, v75);
  }
  if (a5)
    CI::SurfaceImage::set_owner(v68, a5);
  if ((v79 & 1) == 0)
    v68 = CI::ColorMatchImage::append_and_unref(v68, v78, (CGColorSpace *)v77);
  if (v80 && IOSurfaceGetHeight(a3) != 1)
  {
    v88[1] = 0;
    v88[2] = 0;
    v88[0] = 0x3FF0000000000000;
    v89 = xmmword_192493540;
    v90 = (double)IOSurfaceGetHeight(a3);
    v68 = CI::AffineImage::append_and_unref(v68, (CI::Image *)v88, 0);
  }
  if (v64 >= 2)
  {
    v76 = (double)IOSurfaceGetWidth(a3);
    v93.size.height = (double)IOSurfaceGetHeight(a3);
    v86 = 0u;
    v87 = 0u;
    v85 = 0u;
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    v93.size.width = v76;
    orientationTransform(v93, v64, &v85);
    v84[0] = v85;
    v84[1] = v86;
    v84[2] = v87;
    v68 = CI::AffineImage::append_and_unref(v68, (CI::Image *)v84, 0);
  }
  v14 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v68);
  if (v68)
    CI::Object::unref(v68);
  return v14;
}

- (CIImage)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  CGImage *CopyWithColorSpace;
  void *Property;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  id v14;
  CIImage *v15;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  CGImage *v19;
  size_t v20;
  int v21;
  CGImage *v22;
  int v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const CGFloat *Decode;
  const CGFloat *v35;
  CGColorSpace *ColorSpace;
  size_t v37;
  size_t v38;
  int v39;
  int is_supported_source_bitmap;
  id v41;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  CGBitmapInfo v44;
  CGBitmapInfo BitmapInfo;
  NSObject *v46;
  const char *v47;
  const char *v48;
  CGColorSpace *v49;
  CGColorSpace *v50;
  CGColorSpace *BaseColorSpace;
  CGColorSpaceRef v52;
  CGColorSpace *DeviceRGB;
  void *v54;
  id v55;
  char v56;
  unsigned int v57;
  double v59;
  char v60;
  uint64_t ImageProvider;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *Surface;
  size_t v66;
  size_t v67;
  size_t v68;
  size_t v69;
  CGColorSpace *v70;
  uint32_t v71;
  CGContext *v72;
  CGImage *v73;
  CGImageRef v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t ImageBlock;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  uint64_t PixelSize;
  __IOSurface *WrappedSurface;
  CGColorSpace *v97;
  CFPropertyListRef v98;
  const void *v99;
  const void *Data;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  int v104;
  CGBitmapInfo v105;
  int v106;
  CIImage *v107;
  _QWORD v108[5];
  _QWORD v109[6];
  size_t v110[3];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[3];
  _QWORD v116[3];
  uint64_t v117;
  id v118;
  uint8_t buf[4];
  _BYTE v120[18];
  __int16 v121;
  size_t v122;
  __int16 v123;
  size_t v124;
  __int16 v125;
  CGBitmapInfo v126;
  __int16 v127;
  const char *v128;
  _BYTE v129[128];
  uint64_t v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  v130 = *MEMORY[0x1E0C80C00];
  if (!image)
  {
    v25 = ci_logger_api();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CIImage initWithCGImage:options:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_23:

    return 0;
  }
  CopyWithColorSpace = image;
  if (CGImageGetImageProvider())
  {
    Property = (void *)CGImageProviderGetProperty();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](options, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
      if (!v8)
        goto LABEL_14;
      v9 = v8;
      v10 = *(_QWORD *)v112;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v112 != v10)
            objc_enumerationMutation(options);
          v13 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", CFSTR("CIImageProperties")) & 1) == 0)
            v11 &= objc_msgSend(v13, "hasPrefix:", CFSTR("kCGImageSource"));
        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](options, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
      }
      while (v9);
      if ((v11 & 1) != 0)
      {
LABEL_14:
        v14 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageProperties"));
        if (v14)
          Property = (void *)objc_msgSend(Property, "imageBySettingProperties:", v14);

        return (CIImage *)Property;
      }
    }
  }
  Width = CGImageGetWidth(CopyWithColorSpace);
  Height = CGImageGetHeight(CopyWithColorSpace);
  BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
  if (!Width || !Height)
    goto LABEL_23;
  v20 = BytesPerRow;
  v107 = self;
  v21 = CI::alpha_mode_from_CGImage((uint64_t)CopyWithColorSpace, v19);
  v23 = CI::format_from_CGImage((uint64_t)CopyWithColorSpace, v22);
  if (CGImageGetMask())
    v24 = 1;
  else
    v24 = CGImageGetMaskingColors() != 0;
  Decode = CGImageGetDecode(CopyWithColorSpace);
  if (Decode
    && (v35 = Decode,
        ColorSpace = CGImageGetColorSpace(CopyWithColorSpace),
        (v37 = 2 * CGColorSpaceGetNumberOfComponents(ColorSpace)) != 0))
  {
    v38 = 0;
    while (v35[v38] == 0.0 && v35[v38 + 1] == 1.0)
    {
      v38 += 2;
      if (v38 >= v37)
        goto LABEL_33;
    }
    v39 = 1;
  }
  else
  {
LABEL_33:
    v39 = 0;
  }
  is_supported_source_bitmap = CI::format_is_supported_source_bitmap(v23);
  if ((v39 & 1) == 0 && !(is_supported_source_bitmap ^ 1 | v24))
  {
    if (options)
      v41 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
    else
      v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = v41;
    v55 = -[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("kCIImageCacheImmediately"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v55)
    {
      v56 = objc_msgSend(v55, "BOOLValue");
    }
    else
    {
      v57 = atomic_load(&dword_1ECF872F0[17]);
      v56 = v57 < 0x101 && v20 * Height < 0x4000001;
    }
    v59 = iosurface_limits((uint64_t)buf);
    if (Height <= *(_QWORD *)&v120[4])
    {
      v59 = iosurface_limits((uint64_t)v110);
      v60 = Width <= v110[0] ? v56 : 0;
      if ((v60 & 1) != 0)
      {
        ImageProvider = CGImageGetImageProvider();
        if (ImageProvider)
        {
          v62 = ImageProvider;
          v63 = -[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("kCIImageRequestSurfaceFormat"));
          if (v63)
          {
            v117 = *MEMORY[0x1E0CBD2D0];
            v118 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
            v64 = CGImageProviderCopyIOSurface();
            if (v64)
            {
              Surface = (void *)v64;
              goto LABEL_96;
            }
          }
          Surface = (void *)CGImageProviderCopyIOSurface();
          if (Surface)
          {
LABEL_96:
            if (!objc_msgSend(v54, "objectForKey:", CFSTR("CIImageColorSpace"), Data))
              objc_msgSend(v54, "setObject:forKey:", CGImageGetColorSpace(CopyWithColorSpace), CFSTR("CIImageColorSpace"));
            if (v21 == 2)
            {
              v83 = MEMORY[0x1E0C9AAA0];
              v84 = CFSTR("CIImagePremultiplied");
            }
            else
            {
              if (v21 != 1)
              {
LABEL_103:
                if (!getContentDigestFromOptions(options))
                  objc_msgSend(v54, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", CGImageGetIdentifier() | 0x6367696400000000), CFSTR("kCIImageContentDigest"));
                v15 = -[CIImage _initWithIOSurface:options:owner:](v107, "_initWithIOSurface:options:owner:", Surface, v54, 0);
                -[CIImage _setOriginalCGImage:options:](v15, "_setOriginalCGImage:options:", CopyWithColorSpace, options);

                CFRelease(Surface);
                return v15;
              }
              v83 = MEMORY[0x1E0C9AAB0];
              v84 = CFSTR("kCIImageAlphaOne");
            }
            objc_msgSend(v54, "setObject:forKey:", v83, v84);
            goto LABEL_103;
          }
          v104 = CI_IOSURFACE_WRAPPING(1u);
          v85 = *MEMORY[0x1E0C9DAB8];
          v115[0] = *MEMORY[0x1E0C9DAC0];
          v115[1] = v85;
          v116[0] = MEMORY[0x1E0C9AAB0];
          v116[1] = MEMORY[0x1E0C9AAB0];
          v115[2] = *MEMORY[0x1E0C9DA98];
          v116[2] = &unk_1E2F1B998;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
          v21 = CI::alpha_mode_from_CGImageProvider(v62);
          v86 = CI::format_from_CGImageProvider(v62);
          v106 = CI::PixelFormatType_from_format(v86);
          v87 = CI::PixelFormatType_approx_from_format(v86);
          if ((_DWORD)v86)
          {
            if (v87)
            {
              v103 = v87;
              v88 = CGImageProviderCopyImageBlockSetWithOptions();
              if (v88)
              {
                v89 = v88;
                if (CGImageBlockSetGetCount() == 1)
                {
                  v102 = v89;
                  ImageBlock = CGImageBlockSetGetImageBlock();
                  if (iosurface_creatable_from_cgblock(ImageBlock))
                  {
                    CGImageBlockGetRect();
                    v133.origin.x = v91;
                    v133.origin.y = v92;
                    v133.size.width = v93;
                    v133.size.height = v94;
                    v132.origin.x = 0.0;
                    v132.origin.y = 0.0;
                    v132.size.width = (double)Width;
                    v132.size.height = (double)Height;
                    if (CGRectEqualToRect(v132, v133))
                    {
                      v101 = CGImageBlockGetBytesPerRow();
                      Data = (const void *)CGImageBlockGetData();
                      if (IOSurfaceWrapPointerOk(Data) && (v101 & 3) == 0 && v104)
                      {
                        PixelSize = CGImageProviderGetPixelSize();
                        WrappedSurface = CreateWrappedSurface(Width, Height, v103, v101, PixelSize, (uint64_t)Data);
                        if (WrappedSurface)
                        {
                          Surface = WrappedSurface;
                          CGImageBlockSetRetain();
                          v108[0] = MEMORY[0x1E0C809B0];
                          v108[1] = 3221225472;
                          v108[2] = __35__CIImage_initWithCGImage_options___block_invoke_2;
                          v108[3] = &__block_descriptor_40_e5_v8__0l;
                          v108[4] = v102;
                          SetSurfaceDeallocBlock(Surface, (uint64_t)v108);
                          goto LABEL_119;
                        }
                      }
                      else
                      {
                        Surface = CreateSurface((__CVBuffer *)Width, (__CVBuffer *)Height, (void *)0x10, v103, 0);
                        v109[0] = MEMORY[0x1E0C809B0];
                        v109[1] = 3221225472;
                        v109[2] = __35__CIImage_initWithCGImage_options___block_invoke;
                        v109[3] = &__block_descriptor_48_e21_v48__0_v8Q16Q24Q32Q40l;
                        v109[4] = Data;
                        v109[5] = v101;
                        SurfaceApplyPlaneBlock((__IOSurface *)Surface, (uint64_t)v109);
                        if (Surface)
                        {
LABEL_119:
                          v97 = CGImageGetColorSpace(CopyWithColorSpace);
                          if (v97)
                          {
                            v98 = CGColorSpaceCopyPropertyList(v97);
                            if (v98)
                            {
                              v99 = v98;
                              IOSurfaceSetValue((IOSurfaceRef)Surface, (CFStringRef)*MEMORY[0x1E0CBBF90], v98);
                              CFRelease(v99);
                            }
                          }
                          if (v21 == 1 || v21 == -1)
                            IOSurfaceSetValue((IOSurfaceRef)Surface, CFSTR("IOSurfaceAlphaIsOpaque"), (CFTypeRef)*MEMORY[0x1E0C9AE50]);
                          if (v106 != v103)
                            objc_msgSend(v54, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v86), CFSTR("CIImageSurfaceFormat"));
                          CGImageBlockSetRelease();
                          goto LABEL_96;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          CGImageBlockSetRelease();
        }
      }
    }
    v15 = -[CIImage _initNaiveWithCGImage:options:](v107, "_initNaiveWithCGImage:options:", CopyWithColorSpace, v54, v59, Data);
    -[CIImage _setOriginalCGImage:options:](v15, "_setOriginalCGImage:options:", CopyWithColorSpace, options);

    return v15;
  }
  BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
  BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
  v44 = (CGImageGetBitmapInfo(CopyWithColorSpace) >> 8) & 1;
  if (BitsPerComponent > 8)
    v44 = 1;
  v105 = v44;
  BitmapInfo = CGImageGetBitmapInfo(CopyWithColorSpace);
  v46 = ci_logger_performance();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = "ABGR8";
    *(_DWORD *)buf = 136447490;
    *(_QWORD *)v120 = "-[CIImage initWithCGImage:options:]";
    if (v105)
      v47 = "RGBAh";
    *(_WORD *)&v120[8] = 2082;
    *(_QWORD *)&v120[10] = v47;
    v48 = "decode array";
    if (!v39)
      v48 = "pixel format that is unsupported";
    v121 = 2048;
    v122 = BitsPerComponent;
    v123 = 2048;
    v124 = BitsPerPixel;
    v125 = 1024;
    v126 = BitmapInfo;
    if (v24)
      v48 = "mask";
    v127 = 2082;
    v128 = v48;
    _os_log_impl(&dword_1921E4000, v46, OS_LOG_TYPE_INFO, "%{public}s CI_CONVERSION: Rendered to intermediate %{public}s CGImage because the CGImage (bpc:%zu bpp:%zu info:0x%X) passed to Core Image has a %{public}s.", buf, 0x3Au);
  }
  v49 = CGImageGetColorSpace(CopyWithColorSpace);
  v50 = CGColorSpaceRetain(v49);
  if (CGColorSpaceGetModel(v50) == kCGColorSpaceModelIndexed)
  {
    BaseColorSpace = CGColorSpaceGetBaseColorSpace(v50);
    v52 = CGColorSpaceRetain(BaseColorSpace);
    CGColorSpaceRelease(v50);
    v50 = v52;
  }
  if (CGColorSpaceGetModel(v50) != kCGColorSpaceModelRGB)
  {
    CGColorSpaceRelease(v50);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    goto LABEL_56;
  }
  if (v50)
  {
    if (CGColorSpaceSupportsOutput(v50))
    {
      DeviceRGB = v50;
LABEL_56:
      v50 = 0;
      goto LABEL_78;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(CopyWithColorSpace, DeviceRGB);
  }
  else
  {
    DeviceRGB = 0;
  }
LABEL_78:
  if (v105)
  {
    v66 = 8 * Width;
    v67 = Width;
    v68 = Height;
    v69 = 16;
    v70 = DeviceRGB;
    v71 = 4353;
  }
  else
  {
    v66 = 4 * Width;
    v67 = Width;
    v68 = Height;
    v69 = 8;
    v70 = DeviceRGB;
    v71 = 8194;
  }
  v72 = CGBitmapContextCreate(0, v67, v68, v69, v66, v70, v71);
  CGColorSpaceRelease(DeviceRGB);
  if (!v72)
  {
    if (v50)
      CGImageRelease(CopyWithColorSpace);
    CGColorSpaceRelease(v50);
    v75 = ci_logger_api();
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_94;
LABEL_93:
    -[CIImage initWithCGImage:options:].cold.2(v75, v76, v77, v78, v79, v80, v81, v82);
LABEL_94:

    return 0;
  }
  v131.size.width = (double)Width;
  v131.size.height = (double)Height;
  v131.origin.x = 0.0;
  v131.origin.y = 0.0;
  CGContextDrawImage(v72, v131, CopyWithColorSpace);
  v73 = CGBitmapContextCreateImage(v72);
  CGContextRelease(v72);
  if (!v73)
  {
    if (v50)
      CGImageRelease(CopyWithColorSpace);
    CGColorSpaceRelease(v50);
    v75 = ci_logger_api();
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      goto LABEL_94;
    goto LABEL_93;
  }
  if (v50)
  {
    v74 = CGImageCreateCopyWithColorSpace(v73, v50);
    CGImageRelease(v73);
    CGImageRelease(CopyWithColorSpace);
    v73 = v74;
  }
  v15 = -[CIImage initWithCGImage:options:](v107, "initWithCGImage:options:", v73, options);
  CGColorSpaceRelease(v50);
  CGImageRelease(v73);
  return v15;
}

void *__35__CIImage_initWithCGImage_options___block_invoke(void *result, char *__dst, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6)
{
  uint64_t v9;
  uint64_t i;
  size_t v11;
  size_t v12;

  if (a5)
  {
    v9 = (uint64_t)result;
    for (i = 0; i != a5; ++i)
    {
      v11 = *(_QWORD *)(v9 + 40);
      if (v11 >= a6)
        v12 = a6;
      else
        v12 = *(_QWORD *)(v9 + 40);
      result = memcpy(__dst, (const void *)(*(_QWORD *)(v9 + 32) + v11 * i), v12);
      __dst += a6;
    }
  }
  return result;
}

- (void)_setOriginalCGImage:(CGImage *)a3 options:(id)a4
{
  id v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6 = (id)objc_msgSend(a4, "mutableCopy");
  v7[0] = CFSTR("kCIImageCacheHint");
  v7[1] = CFSTR("kCIImageCacheImmediately");
  v7[2] = CFSTR("kCIImageContentDigest");
  v7[3] = CFSTR("CIImageEdgesAreClear");
  v7[4] = CFSTR("kCIImageAVDepthData");
  v7[5] = CFSTR("CIImageProperties");
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6));
  if (!objc_msgSend(v6, "count"))
    (*(void (**)(void *, CGImage *))(*(_QWORD *)self->_priv + 312))(self->_priv, a3);
}

void __18__CIImage_dealloc__block_invoke(uint64_t a1)
{
  CI::Object *v1;

  v1 = *(CI::Object **)(a1 + 32);
  if (v1)
    CI::Object::unref(v1);
}

- (CIImage)imageByCroppingToRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CI::Image *v21;
  CI::CropImage *v22;
  CIImage *v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  -[CIImage extent](self, "extent");
  v29.origin.x = v8;
  v29.origin.y = v9;
  v29.size.width = v10;
  v29.size.height = v11;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (CGRectContainsRect(v24, v29))
    return self;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v26 = CGRectIntegral(v25);
  v13 = v26.origin.x;
  v14 = v26.origin.y;
  v15 = v26.size.width;
  v16 = v26.size.height;
  -[CIImage extent](self, "extent");
  v30.origin.x = v17;
  v30.origin.y = v18;
  v30.size.width = v19;
  v30.size.height = v20;
  v27.origin.x = v13;
  v27.origin.y = v14;
  v27.size.width = v15;
  v27.size.height = v16;
  if (!CGRectIntersectsRect(v27, v30))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v21 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v22 = (CI::CropImage *)operator new();
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CI::CropImage::CropImage(v22, v21, v28);
  v23 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v22);
  CI::Object::unref(v22);
  return v23;
}

- (CGRect)extent
{
  CGRect v2;
  CGRect v3;

  v2.origin.x = (*(double (**)(void *, SEL))(*(_QWORD *)self->_priv + 88))(self->_priv, a2);
  v3 = CGRectInset(v2, 0.00100000005, 0.00100000005);
  return CGRectIntegral(v3);
}

- (void)dealloc
{
  void (*priv)(_QWORD);
  objc_super v4;
  _QWORD v5[5];
  void (*v6[5])(_QWORD);

  priv = (void (*)(_QWORD))self->_priv;
  if (priv)
  {
    if (*((_DWORD *)priv + 18) > 0x3FFu)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __18__CIImage_dealloc__block_invoke_2;
      v5[3] = &__block_descriptor_40_e5_v8__0l;
      v5[4] = priv;
      CI::Object::performDeferredRoot(v5);
    }
    else
    {
      v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v6[1] = (void (*)(_QWORD))3221225472;
      v6[2] = __18__CIImage_dealloc__block_invoke;
      v6[3] = (void (*)(_QWORD))&__block_descriptor_40_e5_v8__0l;
      v6[4] = priv;
      CI::Object::performDeferred(v6);
    }
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImage;
  -[CIImage dealloc](&v4, sel_dealloc);
}

- (void)_internalRepresentation
{
  return self->_priv;
}

+ (CIImage)imageWithInternalRepresentation:(void *)a3
{
  return (CIImage *)-[CIImage _initWithInternalRepresentation:]([CIImage alloc], "_initWithInternalRepresentation:", a3);
}

+ (CIImage)blackImage
{
  unsigned __int8 v2;

  {
    +[CIImage blackImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor blackColor](CIColor, "blackColor"));
  }
  return (CIImage *)+[CIImage blackImage]::i;
}

+ (CIImage)whiteImage
{
  unsigned __int8 v2;

  {
    +[CIImage whiteImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor whiteColor](CIColor, "whiteColor"));
  }
  return (CIImage *)+[CIImage whiteImage]::i;
}

+ (CIImage)grayImage
{
  unsigned __int8 v2;

  {
    +[CIImage grayImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor grayColor](CIColor, "grayColor"));
  }
  return (CIImage *)+[CIImage grayImage]::i;
}

+ (CIImage)redImage
{
  unsigned __int8 v2;

  {
    +[CIImage redImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor redColor](CIColor, "redColor"));
  }
  return (CIImage *)+[CIImage redImage]::i;
}

+ (CIImage)greenImage
{
  unsigned __int8 v2;

  {
    +[CIImage greenImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor greenColor](CIColor, "greenColor"));
  }
  return (CIImage *)+[CIImage greenImage]::i;
}

+ (CIImage)blueImage
{
  unsigned __int8 v2;

  {
    +[CIImage blueImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor blueColor](CIColor, "blueColor"));
  }
  return (CIImage *)+[CIImage blueImage]::i;
}

+ (CIImage)cyanImage
{
  unsigned __int8 v2;

  {
    +[CIImage cyanImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor cyanColor](CIColor, "cyanColor"));
  }
  return (CIImage *)+[CIImage cyanImage]::i;
}

+ (CIImage)magentaImage
{
  unsigned __int8 v2;

  {
    +[CIImage magentaImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor magentaColor](CIColor, "magentaColor"));
  }
  return (CIImage *)+[CIImage magentaImage]::i;
}

+ (CIImage)yellowImage
{
  unsigned __int8 v2;

  {
    +[CIImage yellowImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor yellowColor](CIColor, "yellowColor"));
  }
  return (CIImage *)+[CIImage yellowImage]::i;
}

+ (CIImage)clearImage
{
  unsigned __int8 v2;

  {
    +[CIImage clearImage]::i = -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", +[CIColor clearColor](CIColor, "clearColor"));
  }
  return (CIImage *)+[CIImage clearImage]::i;
}

uint64_t __44__CIImage__initWithIOSurface_options_owner___block_invoke(uint64_t a1, char *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v13;
  uint64_t v14;
  __IOSurface *v15;
  _QWORD v18[10];
  int v19;

  if (a7)
  {
    v13 = __b;
    v14 = a7;
    do
    {
      memset_pattern8(v13, &unk_1924920A8, 8 * a6);
      v13 += a3;
      --v14;
    }
    while (v14);
  }
  v15 = *(__IOSurface **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__CIImage__initWithIOSurface_options_owner___block_invoke_2;
  v18[3] = &__block_descriptor_84_e22_v48__0r_v8Q16Q24Q32Q40l;
  v18[4] = a7;
  v18[5] = __b;
  v18[6] = a3;
  v18[7] = a5;
  v19 = *(_DWORD *)(a1 + 40);
  v18[8] = a6;
  v18[9] = a4;
  return SurfaceApplyPlaneReadOnlyBlock(v15, (uint64_t)v18);
}

uint64_t __44__CIImage__initWithIOSurface_options_owner___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(result + 32);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)(result + 48);
    v9 = *(_DWORD *)(result + 80);
    v10 = *(_QWORD *)(result + 40) + 2 * a3;
    v11 = a2 + *(_QWORD *)(result + 56) * a6;
    do
    {
      if (v9 == 1919365992)
      {
        v13 = *(_QWORD *)(result + 64);
        if (v13)
        {
          v14 = 0;
          v15 = v11 + 2 * *(_QWORD *)(result + 72);
          v16 = (_WORD *)v10;
          do
          {
            *v16 = *(_WORD *)(v15 + 2 * v14);
            v16 += 4;
            ++v14;
          }
          while (v13 != v14);
        }
      }
      else if (v9 == 1919365990)
      {
        v12 = *(_QWORD *)(result + 64);
        if (v12)
        {
          v17 = 0;
          v18 = v11 + 4 * *(_QWORD *)(result + 72);
          do
          {
            _S0 = *(_DWORD *)(v18 + v17);
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v10 + 2 * v17) = _S0;
            v17 += 4;
            --v12;
          }
          while (v12);
        }
      }
      ++v7;
      v10 += v8;
      v11 += a6;
    }
    while (v7 != v6);
  }
  return result;
}

+ (id)nullImage
{
  return +[CIImage emptyImage](CIImage, "emptyImage");
}

+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface
{
  return +[CIImage imageWithIOSurface:options:](CIImage, "imageWithIOSurface:options:", surface, 0);
}

+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options
{
  return -[CIImage initWithIOSurface:options:]([CIImage alloc], "initWithIOSurface:options:", surface, options);
}

- (CIImage)initWithIOSurface:(IOSurfaceRef)surface
{
  return -[CIImage initWithIOSurface:options:](self, "initWithIOSurface:options:", surface, 0);
}

- (CIImage)initWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options
{
  return (CIImage *)-[CIImage _initWithIOSurface:options:owner:](self, "_initWithIOSurface:options:owner:", surface, options, 0);
}

- (CGImageRef)CGImage
{
  CGImage *v2;
  CGImage *v3;
  CFTypeID v4;

  v2 = (CGImage *)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_priv + 304))(self->_priv, a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 != CGImageGetTypeID())
    return 0;
  return v3;
}

+ (CIImage)imageWithCGImage:(CGImageRef)image
{
  return +[CIImage imageWithCGImage:options:](CIImage, "imageWithCGImage:options:", image, 0);
}

+ (CIImage)imageWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  return -[CIImage initWithCGImage:options:]([CIImage alloc], "initWithCGImage:options:", image, options);
}

+ (CIImage)imageWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict
{
  return -[CIImage initWithCGImageSource:index:options:]([CIImage alloc], "initWithCGImageSource:index:options:", source, index, dict);
}

- (id)_initNaiveWithCGImage:(CGImage *)a3 options:(id)a4
{
  CIImage *v6;
  int v7;
  void *v8;
  void *v9;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v22;
  CI::Image *ColorSpace;
  CIImage *v24;
  void *v25;
  _BOOL8 v26;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  float v33;
  CI::ColorMatchImage *v34;
  uint64_t ContentDigestFromOptions;
  CGFloat Width;
  uint64_t v38;
  char v39;
  int v40;
  uint64_t v41;
  _OWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  __int128 v47;
  double Height;
  objc_super v49;
  CGRect v50;

  if (!a3)
  {

    return 0;
  }
  v49.receiver = self;
  v49.super_class = (Class)CIImage;
  v6 = -[CIImage init](&v49, sel_init);
  if (v6)
  {
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")))
      v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue");
    else
      v7 = 1;
    v8 = (void *)MEMORY[0x1E0C9AAB0];
    if (a4)
    {
      v9 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgesAreClear"));
      v11 = v9 == v8 || v9 == &unk_1E2F1B9F8;
      HIDWORD(v41) = v11;
      v12 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageClampToEdge"));
      v14 = v12 == v8 || v12 == &unk_1E2F1B9F8;
      LODWORD(v41) = v14;
      v15 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgeRepeat"));
    }
    else
    {
      v41 = 0;
      v15 = 0;
    }
    if ((v15 == v8 || v15 == &unk_1E2F1B9F8)
      && (v16 = ci_logger_api(), os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)))
    {
      -[CIImage _initNaiveWithCGImage:options:].cold.1();
      if (a4)
        goto LABEL_26;
    }
    else if (a4)
    {
LABEL_26:
      v17 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageNearestSampling"));
      v19 = v17 == v8 || v17 == &unk_1E2F1B9F8;
      v20 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageCacheHint"));
LABEL_35:
      v22 = v20 == v8 || v20 == &unk_1E2F1B9F8;
      ColorSpace = (CI::Image *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageColorSpace"));
      HIDWORD(v38) = v7;
      if ((CI::Image *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == ColorSpace || CI_NO_CM())
      {
        LODWORD(v38) = 1;
      }
      else
      {
        if (!ColorSpace)
          ColorSpace = CGImageGetColorSpace(a3);
        LODWORD(v38) = 0;
      }
      v24 = v6;
      if (objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"), v38))
      {
        if (a4)
          v25 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"));
        else
          v25 = 0;
        v26 = v25 == v8 || v25 == &unk_1E2F1B9F8;
      }
      else
      {
        v26 = 0;
      }
      v28 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageProperties"));
      v29 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
      if (objc_msgSend(v29, "isEqual:", MEMORY[0x1E0C9AAB0]))
      {
        v30 = (void *)objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
        if (v30)
          LODWORD(v30) = objc_msgSend(v30, "intValue");
        if (((_DWORD)v30 - 9) >= 0xFFFFFFF8)
          v31 = (int)v30;
        else
          v31 = 0;
        if (!v28 || (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v28)
          goto LABEL_72;
        v32 = &__block_literal_global_688;
      }
      else
      {
        if (!v28)
        {
          v31 = 0;
          goto LABEL_72;
        }
        v31 = 0;
        if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v28)
        {
LABEL_72:
          v33 = OptionHeadroom((NSDictionary *)a4);
          v34 = (CI::ColorMatchImage *)operator new();
          ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a4);
          CI::CGImage::CGImage(v34, a3, ContentDigestFromOptions, v28, v41, v19, HIDWORD(v41), v22, v33);
          if ((v39 & 1) == 0)
            v34 = CI::ColorMatchImage::append_and_unref(v34, ColorSpace, (CGColorSpace *)v26);
          if (v40 && CGImageGetHeight(a3) != 1)
          {
            v46[1] = 0;
            v46[2] = 0;
            v46[0] = 0x3FF0000000000000;
            v47 = xmmword_192493540;
            Height = (double)CGImageGetHeight(a3);
            v34 = CI::AffineImage::append_and_unref(v34, (CI::Image *)v46, 0);
          }
          if (v31 >= 2)
          {
            Width = (double)CGImageGetWidth(a3);
            v50.size.height = (double)CGImageGetHeight(a3);
            v44 = 0u;
            v45 = 0u;
            v43 = 0u;
            v50.origin.x = 0.0;
            v50.origin.y = 0.0;
            v50.size.width = Width;
            orientationTransform(v50, v31, &v43);
            v42[0] = v43;
            v42[1] = v44;
            v42[2] = v45;
            v34 = CI::AffineImage::append_and_unref(v34, (CI::Image *)v42, 0);
          }
          v6 = -[CIImage _initWithInternalRepresentation:](v24, "_initWithInternalRepresentation:", v34);
          if (v34)
            CI::Object::unref(v34);
          return v6;
        }
        v32 = &__block_literal_global_692;
      }
      v28 = (void *)dictionaryDeepCopy(v28, (uint64_t)v32);
      goto LABEL_72;
    }
    v19 = 0;
    v20 = 0;
    goto LABEL_35;
  }
  return v6;
}

uint64_t __35__CIImage_initWithCGImage_options___block_invoke_2()
{
  return CGImageBlockSetRelease();
}

- (id)initAuxiliaryWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 options:(id)a5 depth:(BOOL)a6
{
  const char *v10;
  const __CFDictionary *v11;
  uint64_t v12;
  const void *Value;
  const void *v14;
  CFTypeRef v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CFDictionaryRef v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint64_t v39;
  const void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_26;
  v10 = (const char *)(a6 ? 1751410032 : 1751411059);
  v11 = imageSourceCopyAuxiliaryDataInfo(a3, a4, (const __CFString *)*MEMORY[0x1E0CBC708]);
  if (!v11)
  {
    v11 = imageSourceCopyAuxiliaryDataInfo(a3, a4, (const __CFString *)*MEMORY[0x1E0CBC700]);
    if (!v11)
      goto LABEL_26;
  }
  v12 = *MEMORY[0x1E0CBC6D0];
  Value = CFDictionaryGetValue(v11, (const void *)*MEMORY[0x1E0CBC6D0]);
  v14 = Value;
  if (Value)
  {
    v15 = CFRetain(Value);
    CFAutorelease(v15);
  }
  v16 = (void *)AVFDepthDataFromDictionary(v11);
  CFRelease(v11);
  if (!v16)
    goto LABEL_26;
  if (AVFDepthDataType(v16, v17) != (_DWORD)v10)
    v16 = AVFDepthDataByConvertingToDepthDataType(v16, v10);
  v19 = AVFDepthDataMap(v16, v18);
  if (v19)
  {
    v20 = v19;
    v43 = CFSTR("kCIImageAVDepthData");
    v44[0] = v16;
    v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    if (v14)
    {
      v41[1] = CFSTR("CIImageProperties");
      v42[0] = v16;
      v41[0] = CFSTR("kCIImageAVDepthData");
      v39 = v12;
      v40 = v14;
      v42[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    }
    v22 = v21;
    v23 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
    if (objc_msgSend(v23, "isEqual:", MEMORY[0x1E0C9AAB0]))
    {
      v24 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a5);
      v25 = *MEMORY[0x1E0CBCFF0];
      v26 = (void *)-[__CFDictionary objectForKey:](v24, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      if (v26)
      {
        v27 = objc_msgSend(v26, "intValue");
        v28 = v27 - 9 >= 0xFFFFFFF8 ? v27 : 0;
        if ((int)v28 >= 1)
        {
          v37[0] = CFSTR("kCIImageAVDepthData");
          v37[1] = CFSTR("kCIImageApplyOrientationProperty");
          v38[0] = v16;
          v38[1] = MEMORY[0x1E0C9AAB0];
          v37[2] = CFSTR("CIImageProperties");
          v35 = v25;
          v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
          v38[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
          if (v14)
          {
            v33[0] = CFSTR("kCIImageAVDepthData");
            v33[1] = CFSTR("kCIImageApplyOrientationProperty");
            v34[0] = v16;
            v34[1] = MEMORY[0x1E0C9AAB0];
            v33[2] = CFSTR("CIImageProperties");
            v31[1] = v12;
            v32[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28, v25);
            v32[1] = v14;
            v34[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
            v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
          }
          v22 = v29;
        }
      }
      CFRelease(v24);
    }
    return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v20, v22);
  }
  else
  {
LABEL_26:

    return 0;
  }
}

- (__CVBuffer)_pixelBufferFromAuxProps:(__CFDictionary *)a3 linear:(BOOL)a4
{
  _BOOL4 v4;
  void *Value;
  const void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  __CVBuffer *result;
  CVReturn v16;
  CFTypeRef *v17;
  _QWORD v18[5];
  int v19;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  if (!a3)
    return 0;
  v4 = a4;
  Value = (void *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CBC6C8]);
  v7 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CBC6C0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v8 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", CFSTR("Width")), "intValue");
  v9 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", CFSTR("Height")), "intValue");
  v10 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", CFSTR("BytesPerRow")), "intValue");
  v11 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", CFSTR("PixelFormat")), "unsignedLongValue");
  v12 = !v8 || v9 == 0;
  if (v12 || v10 == 0)
    return 0;
  if (v10 < v8 || v11 != 1278226488)
    return 0;
  v21 = *MEMORY[0x1E0CA8FF0];
  v22[0] = MEMORY[0x1E0C9AA70];
  v16 = CVPixelBufferCreate(0, v8, v9, 0x4C303038u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1), &pixelBufferOut);
  result = pixelBufferOut;
  if (!v16)
  {
    v17 = (CFTypeRef *)MEMORY[0x1E0CA8EB8];
    if (!v4)
      v17 = (CFTypeRef *)MEMORY[0x1E0CA8EE0];
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], *v17, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D88], kCVAttachmentMode_ShouldPropagate);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__CIImage__pixelBufferFromAuxProps_linear___block_invoke;
    v18[3] = &unk_1E2EC4138;
    v18[4] = v7;
    v19 = v10;
    PixelBufferApplyOnePlaneBlock(pixelBufferOut, 0, (uint64_t)v18);
    return pixelBufferOut;
  }
  return result;
}

char *__43__CIImage__pixelBufferFromAuxProps_linear___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6)
{
  char *result;
  char *v11;
  uint64_t v12;
  size_t v13;
  size_t v14;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "bytes");
  v11 = result;
  if (*(_DWORD *)(a1 + 40) == a6)
    return (char *)memcpy(a2, result, a6 * a5);
  if (a5)
  {
    v12 = 0;
    do
    {
      v13 = *(int *)(a1 + 40);
      if (v13 >= a6)
        v14 = a6;
      else
        v14 = *(int *)(a1 + 40);
      result = (char *)memcpy(a2, &v11[(int)v13 * (uint64_t)(int)v12++], v14);
      a2 += a6;
    }
    while (a5 != v12);
  }
  return result;
}

- (id)initMatteWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  void *v7;
  int v8;
  const __CFString **v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const void *Value;
  const void *v22;
  CFTypeRef v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  __CVBuffer *v34;
  void *v35;
  void *v36;
  char v37;
  char v38;
  char v39;
  void *v40;
  CFDictionaryRef v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  const void *v57;
  _QWORD v58[6];

  v58[5] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_55;
  v7 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliaryPortraitEffectsMatte"));
  v8 = objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]);
  v9 = (const __CFString **)MEMORY[0x1E0CBC720];
  if (v8)
  {
    v10 = (const __CFString *)*MEMORY[0x1E0CBC720];
    v11 = CFSTR("kCIImageAVPortraitEffectsMatte");
LABEL_15:
    v18 = 1;
    goto LABEL_16;
  }
  v12 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkinMatte"));
  if (objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v13 = (const __CFString **)MEMORY[0x1E0CBC738];
LABEL_14:
    v10 = *v13;
    v11 = CFSTR("kCIImageAVSemanticSegmentationMatte");
    goto LABEL_15;
  }
  v14 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte"));
  if (objc_msgSend(v14, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v13 = (const __CFString **)MEMORY[0x1E0CBC730];
    goto LABEL_14;
  }
  v15 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationTeethMatte"));
  if (objc_msgSend(v15, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v13 = (const __CFString **)MEMORY[0x1E0CBC748];
    goto LABEL_14;
  }
  v16 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte"));
  if (objc_msgSend(v16, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v13 = (const __CFString **)MEMORY[0x1E0CBC728];
    goto LABEL_14;
  }
  v17 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkyMatte"));
  if (objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v13 = (const __CFString **)MEMORY[0x1E0CBC740];
    goto LABEL_14;
  }
  v10 = 0;
  v18 = 0;
  v11 = 0;
LABEL_16:
  v19 = imageSourceCopyAuxiliaryDataInfo(a3, 0, v10);
  if (!v19)
    goto LABEL_55;
  v20 = v19;
  v51 = *MEMORY[0x1E0CBC6D0];
  Value = CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E0CBC6D0]);
  v22 = Value;
  if (Value)
  {
    v23 = CFRetain(Value);
    CFAutorelease(v23);
  }
  v24 = *MEMORY[0x1E0CBC730];
  v58[0] = *MEMORY[0x1E0CBC738];
  v58[1] = v24;
  v25 = *MEMORY[0x1E0CBC728];
  v58[2] = *MEMORY[0x1E0CBC748];
  v58[3] = v25;
  v58[4] = *MEMORY[0x1E0CBC740];
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 5);
  if (v10 == *v9)
  {
    v32 = (void *)AVPortraitEffectsMatteFromDictionary(v20);
    v31 = v32;
    if (v32)
    {
      v30 = AVFPortraitEffectsMatteImage(v32, v33);
      v29 = 0;
      if (!v30)
        goto LABEL_30;
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (!objc_msgSend(v26, "containsObject:", v10))
  {
    v31 = 0;
LABEL_28:
    v29 = 0;
LABEL_30:
    v34 = -[CIImage _pixelBufferFromAuxProps:linear:](self, "_pixelBufferFromAuxProps:linear:", v20, 1);
    if (v34)
    {
      v30 = v34;
      CFAutorelease(v34);
      goto LABEL_32;
    }
    CFRelease(v20);
LABEL_55:

    return 0;
  }
  v27 = (void *)AVSemanticSegmentationMatteFromDictionary(v20, (uint64_t)v10);
  v29 = v27;
  if (!v27)
  {
    v31 = 0;
    goto LABEL_30;
  }
  v30 = AVSemanticSegmentationMatteImage(v27, v28);
  v31 = 0;
  if (!v30)
    goto LABEL_30;
LABEL_32:
  CFRelease(v20);
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = v35;
  v37 = v18 ^ 1;
  if (v31)
    v38 = v37;
  else
    v38 = 1;
  if ((v38 & 1) == 0)
    objc_msgSend(v35, "setObject:forKey:", v31, v11);
  if (v29)
    v39 = v37;
  else
    v39 = 1;
  if ((v39 & 1) == 0)
    objc_msgSend(v36, "setObject:forKey:", v29, v11);
  if (v22)
  {
    v56 = v51;
    v57 = v22;
    objc_msgSend(v36, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1), CFSTR("CIImageProperties"));
  }
  if (objc_msgSend(a4, "valueForKey:", CFSTR("CIImageColorSpace")))
    objc_msgSend(v36, "setObject:forKey:", objc_msgSend(a4, "valueForKey:", CFSTR("CIImageColorSpace")), CFSTR("CIImageColorSpace"));
  v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
  if (objc_msgSend(v40, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v41 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a4);
    v42 = *MEMORY[0x1E0CBCFF0];
    v43 = (void *)-[__CFDictionary objectForKey:](v41, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    if (v43)
    {
      v44 = objc_msgSend(v43, "intValue");
      v45 = v44 - 9 >= 0xFFFFFFF8 ? v44 : 0;
      if ((int)v45 >= 1)
      {
        objc_msgSend(v36, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCIImageApplyOrientationProperty"));
        if (v22)
        {
          v54[0] = v42;
          v54[1] = v51;
          v55[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
          v55[1] = v22;
          v46 = (void *)MEMORY[0x1E0C99D80];
          v47 = v55;
          v48 = v54;
          v49 = 2;
        }
        else
        {
          v52 = v42;
          v53 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
          v46 = (void *)MEMORY[0x1E0C99D80];
          v47 = &v53;
          v48 = &v52;
          v49 = 1;
        }
        objc_msgSend(v36, "setObject:forKey:", objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, v49), CFSTR("CIImageProperties"));
      }
    }
    CFRelease(v41);
  }
  return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v30, v36);
}

- (id)initGainmapWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  void *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  const void *Value;
  const void *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  void *v14;
  uint64_t v15;
  CIImage *v16;
  void *v17;
  CFDictionaryRef v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_14;
  v7 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAuxiliaryHDRGainMap"));
  if ((objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
    goto LABEL_14;
  v34 = *MEMORY[0x1E0CBC6E8];
  v35[0] = *MEMORY[0x1E0CBC6F0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v8 = (const __CFDictionary *)CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions();
  if (!v8)
  {
    v8 = imageSourceCopyAuxiliaryDataInfo(a3, 0, (const __CFString *)*MEMORY[0x1E0CBC710]);
    if (!v8)
      goto LABEL_14;
  }
  v9 = *MEMORY[0x1E0CBC6D0];
  Value = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0CBC6D0]);
  v11 = Value;
  if (Value)
  {
    CFRetain(Value);
    CFAutorelease(v11);
  }
  v12 = (__CVBuffer *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0CBC6E0]);
  if (!v12)
  {
    v13 = -[CIImage _pixelBufferFromAuxProps:linear:](self, "_pixelBufferFromAuxProps:linear:", v8, 1);
    CFRelease(v8);
    if (v13)
      goto LABEL_10;
LABEL_14:

    return 0;
  }
  v13 = v12;
  CFRetain(v12);
  CFRelease(v8);
LABEL_10:
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (v11)
  {
    v32 = v9;
    v33 = v11;
    objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), CFSTR("CIImageProperties"));
  }
  if (objc_msgSend(a4, "valueForKey:", CFSTR("CIImageColorSpace")))
    v15 = objc_msgSend(a4, "valueForKey:", CFSTR("CIImageColorSpace"));
  else
    v15 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("CIImageColorSpace"));
  v17 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
  if (objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v18 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a4);
    v19 = *MEMORY[0x1E0CBCFF0];
    v20 = (void *)-[__CFDictionary objectForKey:](v18, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    if (v20)
    {
      v21 = objc_msgSend(v20, "intValue");
      v22 = v21 - 9 >= 0xFFFFFFF8 ? v21 : 0;
      if ((int)v22 >= 1)
      {
        objc_msgSend(v14, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCIImageApplyOrientationProperty"));
        if (v11)
        {
          v30[0] = v19;
          v30[1] = v9;
          v31[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
          v31[1] = v11;
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = v31;
          v25 = v30;
          v26 = 2;
        }
        else
        {
          v28 = v19;
          v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v29;
          v25 = &v28;
          v26 = 1;
        }
        objc_msgSend(v14, "setObject:forKey:", objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26), CFSTR("CIImageProperties"));
      }
    }
    CFRelease(v18);
  }
  v16 = -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v13, v14);
  CFRelease(v13);
  return v16;
}

- (id)_imageByApplyingGainMap:(id)a3 headroom:(float)a4
{
  void *v7;
  uint64_t v8;
  const CGImageMetadata *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  float v14;
  float v15;
  NSObject *v16;
  int v17;
  int v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  int32x2_t v24;
  void *v25;
  int32x4_t v26;
  __int32 v27;
  void *v28;
  int32x4_t v29;
  __int32 v30;
  void *v31;
  int32x2_t v32;
  void *v33;
  int32x4_t v34;
  __int32 v35;
  void *v36;
  int32x4_t v37;
  __int32 v38;
  void *v39;
  int32x2_t v40;
  void *v41;
  int32x4_t v42;
  __int32 v43;
  void *v44;
  int32x4_t v45;
  __int32 v46;
  void *v47;
  int32x2_t v48;
  void *v49;
  int32x4_t v50;
  __int32 v51;
  void *v52;
  int32x4_t v53;
  __int32 v54;
  void *v55;
  int32x2_t v56;
  void *v57;
  float32x4_t v58;
  __int32 v59;
  void *v60;
  float32x4_t v61;
  __int32 v62;
  CGImageMetadataTag *v63;
  CGImageMetadataTag *v64;
  void *v65;
  NSObject *v66;
  const char *v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v86;
  float v87;
  CIColorKernel *v88;
  CGColorSpaceRef ExtendedLinearized;
  CIColorKernel *v90;
  float v91;
  float v92;
  float v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  double v103;
  CGColorSpace *v104;
  CIImage *v105;
  float v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  double v114;
  float32x4_t v116;
  uint64_t v117;
  float v118;
  double v119;
  double v120;
  float32x4_t v121;
  double v122;
  int32x4_t v123;
  int32x4_t v124;
  int32x4_t v125;
  int32x4_t v126;
  CGAffineTransform v127;
  CGAffineTransform buf;
  const __CFString *v129;
  uint64_t v130;
  _QWORD v131[3];
  const __CFString *v132;
  uint64_t v133;
  _QWORD v134[9];

  v134[8] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return self;
  v7 = (void *)objc_msgSend(a3, "properties");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  if (!v8)
  {
    v13 = 0;
    v14 = 0.0;
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v15 = 0.0;
    goto LABEL_6;
  }
  v9 = (const CGImageMetadata *)v8;
  v10 = (void *)MEMORY[0x194026220]();
  v11 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:Version"));
  if (v11)
    v12 = objc_msgSend(v11, "intValue");
  else
    v12 = 0;
  v13 = objc_msgSend((id)copyMetadataValue(v9, CFSTR("HDRToneMap:BaseColorIsWorkingColor")), "isEqual:", CFSTR("True"));
  v19 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:BaseHeadroom"));
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v15 = v20;
  }
  else
  {
    v15 = NAN;
  }
  v21 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:AlternateHeadroom"));
  if (v21)
  {
    objc_msgSend(v21, "floatValue");
    v14 = v22;
  }
  else
  {
    v14 = NAN;
  }
  v23 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[0].BaseOffset"));
  if (v23)
    objc_msgSend(v23, "floatValue");
  else
    v24.i32[0] = 2143289344;
  v126 = vdupq_lane_s32(v24, 0);
  v25 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[1].BaseOffset"));
  if (v25)
  {
    objc_msgSend(v25, "floatValue");
    v26 = v126;
    v26.i32[1] = v27;
    v126 = v26;
  }
  v28 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[2].BaseOffset"));
  if (v28)
  {
    objc_msgSend(v28, "floatValue");
    v29 = v126;
    v29.i32[2] = v30;
    v126 = v29;
  }
  v31 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[0].AlternateOffset"));
  if (v31)
    objc_msgSend(v31, "floatValue");
  else
    v32.i32[0] = 2143289344;
  v125 = vdupq_lane_s32(v32, 0);
  v33 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[1].AlternateOffset"));
  if (v33)
  {
    objc_msgSend(v33, "floatValue");
    v34 = v125;
    v34.i32[1] = v35;
    v125 = v34;
  }
  v36 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[2].AlternateOffset"));
  if (v36)
  {
    objc_msgSend(v36, "floatValue");
    v37 = v125;
    v37.i32[2] = v38;
    v125 = v37;
  }
  v39 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[0].GainMapMin"));
  if (v39)
    objc_msgSend(v39, "floatValue");
  else
    v40.i32[0] = 2143289344;
  v124 = vdupq_lane_s32(v40, 0);
  v41 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[1].GainMapMin"));
  if (v41)
  {
    objc_msgSend(v41, "floatValue");
    v42 = v124;
    v42.i32[1] = v43;
    v124 = v42;
  }
  v44 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[2].GainMapMin"));
  if (v44)
  {
    objc_msgSend(v44, "floatValue");
    v45 = v124;
    v45.i32[2] = v46;
    v124 = v45;
  }
  v47 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[0].GainMapMax"));
  if (v47)
    objc_msgSend(v47, "floatValue");
  else
    v48.i32[0] = 2143289344;
  v123 = vdupq_lane_s32(v48, 0);
  v49 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[1].GainMapMax"));
  if (v49)
  {
    objc_msgSend(v49, "floatValue");
    v50 = v123;
    v50.i32[1] = v51;
    v123 = v50;
  }
  v52 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[2].GainMapMax"));
  if (v52)
  {
    objc_msgSend(v52, "floatValue");
    v53 = v123;
    v53.i32[2] = v54;
    v123 = v53;
  }
  v55 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[0].Gamma"));
  if (v55)
    objc_msgSend(v55, "floatValue");
  else
    v56.i32[0] = 2143289344;
  v121 = (float32x4_t)vdupq_lane_s32(v56, 0);
  v57 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[1].Gamma"));
  if (v57)
  {
    objc_msgSend(v57, "floatValue");
    v58 = v121;
    v58.i32[1] = v59;
    v121 = v58;
  }
  v60 = (void *)copyMetadataValue(v9, CFSTR("HDRToneMap:ChannelMetadata[2].Gamma"));
  if (v60)
  {
    objc_msgSend(v60, "floatValue");
    v61 = v121;
    v61.i32[2] = v62;
    v121 = v61;
  }
  objc_autoreleasePoolPop(v10);
  v63 = CGImageMetadataCopyTagWithPath(v9, 0, CFSTR("HDRGainMap:HDRGainMapVersion"));
  v64 = v63;
  if (v63)
    v65 = (void *)CGImageMetadataTagCopyValue(v63);
  else
    v65 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    if (!v65)
      goto LABEL_59;
    goto LABEL_58;
  }
  v18 = objc_msgSend(v65, "intValue");
  if (v65)
LABEL_58:
    CFRelease(v65);
LABEL_59:
  if (v64)
    CFRelease(v64);
  if (v12 == 1)
  {
    v17 = 1;
    goto LABEL_73;
  }
  if (v12 >= 2)
  {
    v66 = ci_logger_api();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      v67 = "Image's gain map will be ignored because FlexRange version value was not supported.";
LABEL_71:
      _os_log_impl(&dword_1921E4000, v66, OS_LOG_TYPE_DEFAULT, v67, (uint8_t *)&buf, 2u);
      goto LABEL_72;
    }
    goto LABEL_72;
  }
  v17 = 0;
  if (v18 != 0x20000 && v18 != 0x10000)
  {
    if (v18)
    {
      v66 = ci_logger_api();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.a) = 0;
        v67 = "Image's gain map will be ignored because GainMap version value was not supported.";
        goto LABEL_71;
      }
LABEL_72:
      v17 = 0;
      goto LABEL_73;
    }
LABEL_6:
    v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_1921E4000, v16, OS_LOG_TYPE_DEFAULT, "Image's gain map will be ignored because no version tag was present.", (uint8_t *)&buf, 2u);
    }
    v17 = 0;
    v18 = 0;
  }
LABEL_73:
  memset(&buf, 0, sizeof(buf));
  -[CIImage extent](self, "extent");
  v69 = v68;
  objc_msgSend(a3, "extent");
  v71 = v69 / v70;
  -[CIImage extent](self, "extent");
  v73 = v72;
  objc_msgSend(a3, "extent");
  CGAffineTransformMakeScale(&buf, v71, v73 / v74);
  v127 = buf;
  v75 = objc_msgSend(a3, "imageByApplyingTransform:", &v127);
  if (v17)
  {
    v76 = exp2f(v15);
    v77 = exp2f(v14);
    v78 = fmaxf(v76, v77);
    v79 = fminf(fmaxf(a4, fminf(v76, v77)), v78);
    if (a4 == 0.0)
      v79 = v78;
    v80 = log2f(v79);
    __asm { FMOV            V0.4S, #1.0 }
    v116 = vdivq_f32(_Q0, v121);
    v86 = fminf(fmaxf((float)(v80 - v15) / (float)(v14 - v15), 0.0), 1.0);
    if (v80 <= v15)
      v87 = -v86;
    else
      v87 = v86;
    v88 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMap, *(_OWORD *)&v116);
    if (v13 && -[CIImage colorSpace](self, "colorSpace"))
      ExtendedLinearized = CGColorSpaceCreateExtendedLinearized(-[CIImage colorSpace](self, "colorSpace"));
    else
      ExtendedLinearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D950]);
    v104 = ExtendedLinearized;
    v105 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self, "imageByColorMatchingWorkingSpaceToColorSpace:", ExtendedLinearized);
    v106 = exp2f(v80);
    -[CIImage extent](v105, "extent");
    v108 = v107;
    v122 = v109;
    v119 = v111;
    v120 = v110;
    v134[0] = v105;
    v134[1] = v75;
    v134[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)&v117, *((float *)&v117 + 1), v118);
    v134[3] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)v124.i32, *(float *)&v124.i32[1], *(float *)&v124.i32[2]);
    v134[4] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)v123.i32, *(float *)&v123.i32[1], *(float *)&v123.i32[2]);
    *(float *)&v112 = v87;
    v134[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v112);
    v134[6] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)v126.i32, *(float *)&v126.i32[1], *(float *)&v126.i32[2]);
    v134[7] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)v125.i32, *(float *)&v125.i32[1], *(float *)&v125.i32[2]);
    v113 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 8);
    v132 = CFSTR("kCIImageContentHeadroom");
    *(float *)&v114 = v106;
    v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v114);
    self = (CIImage *)objc_msgSend(-[CIColorKernel applyWithExtent:arguments:options:](v88, "applyWithExtent:arguments:options:", v113, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1), v108, v122, v120, v119), "imageByColorMatchingColorSpaceToWorkingSpace:", v104);
    CGColorSpaceRelease(v104);
  }
  else if (v18 == 0x20000 || v18 == 0x10000)
  {
    v90 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gainMap);
    -[CIImage _makernoteMeteorHeadroom](self, "_makernoteMeteorHeadroom");
    v92 = fminf(fmaxf(a4, 1.0), v91);
    v93 = a4 == 0.0 ? v91 : v92;
    if (v93 > 1.0)
    {
      -[CIImage extent](self, "extent");
      v95 = v94;
      v97 = v96;
      v99 = v98;
      v101 = v100;
      v131[0] = self;
      v131[1] = v75;
      *(float *)&v94 = v93;
      v131[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
      v102 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
      v129 = CFSTR("kCIImageContentHeadroom");
      *(float *)&v103 = v93;
      v130 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v103);
      return -[CIColorKernel applyWithExtent:arguments:options:](v90, "applyWithExtent:arguments:options:", v102, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1), v95, v97, v99, v101);
    }
  }
  return self;
}

- (id)imageByApplyingGainMap:(id)a3
{
  double v3;

  LODWORD(v3) = 0;
  return -[CIImage _imageByApplyingGainMap:headroom:](self, "_imageByApplyingGainMap:headroom:", a3, v3);
}

- (CGColorSpace)_copyHDRColorspaceFromSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  CGImage *ImageAtIndex;
  CGColorSpace *ColorSpace;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CBD1A0];
  v13[0] = *MEMORY[0x1E0CBD1B0];
  v6 = *MEMORY[0x1E0CBD1A8];
  v12[0] = v5;
  v12[1] = v6;
  v10 = *MEMORY[0x1E0CBC6B0];
  v11 = MEMORY[0x1E0C9AAB0];
  v13[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  CGColorSpaceRetain(ColorSpace);
  CGImageRelease(ImageAtIndex);
  return ColorSpace;
}

- (CIImage)initWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict
{
  id v9;
  CIImage *v10;
  CGImageSourceRef v11;
  size_t v12;
  NSDictionary *v13;
  uint64_t v14;
  CIImage *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  BOOL v34;
  int v35;
  id v36;
  CIImage *v37;
  CFDictionaryRef v38;
  CFDictionaryRef v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  CIImage *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  CGImageRef ImageAtIndex;
  CGImage *v52;
  int v53;
  uint64_t v54;
  void *v55;
  id v56;
  CGColorSpace *v57;
  CGColorSpace *v58;
  CGColorSpaceRef PQBasedCopy;
  CGColorSpace *v60;
  CGColorSpace *v61;
  CGColorSpace *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  const void *v66;
  void *v67;
  CIImage *v68;
  int v69;

  if (!source)
  {

    return 0;
  }
  v9 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliaryDepth"));
  if (objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v10 = self;
    v11 = source;
    v12 = index;
    v13 = dict;
    v14 = 1;
    return (CIImage *)-[CIImage initAuxiliaryWithImageSource:index:options:depth:](v10, "initAuxiliaryWithImageSource:index:options:depth:", v11, v12, v13, v14);
  }
  v17 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliaryDisparity"));
  if (objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v10 = self;
    v11 = source;
    v12 = index;
    v13 = dict;
    v14 = 0;
    return (CIImage *)-[CIImage initAuxiliaryWithImageSource:index:options:depth:](v10, "initAuxiliaryWithImageSource:index:options:depth:", v11, v12, v13, v14);
  }
  v18 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliaryPortraitEffectsMatte"));
  if ((objc_msgSend(v18, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v19 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte"));
  if ((objc_msgSend(v19, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v20 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkyMatte"));
  if ((objc_msgSend(v20, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v21 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkinMatte"));
  if ((objc_msgSend(v21, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v22 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte"));
  if ((objc_msgSend(v22, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v23 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationTeethMatte"));
  if (objc_msgSend(v23, "isEqual:", MEMORY[0x1E0C9AAB0]))
    return (CIImage *)-[CIImage initMatteWithImageSource:options:](self, "initMatteWithImageSource:options:", source, dict);
  v24 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCIImageAuxiliaryHDRGainMap"));
  v25 = (id)MEMORY[0x1E0C9AAB0];
  if (!objc_msgSend(v24, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    if (dict)
      v26 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("kCIImageExpandToHDR"));
    else
      v26 = 0;
    if (v26 == v25 || v26 == &unk_1E2F1B9F8)
      -[__CFString hasSuffix:]((id)CGImageSourceGetType(source), "hasSuffix:", CFSTR("raw-image"));
    if (dict)
      v27 = (id)-[NSDictionary mutableCopy](dict, "mutableCopy");
    else
      v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = v27;
    v29 = *MEMORY[0x1E0CBD2B8];
    v30 = -[NSDictionary valueForKey:](dict, "valueForKey:", *MEMORY[0x1E0CBD2B8]);
    v31 = *MEMORY[0x1E0C9AE50];
    if (!v30)
      objc_msgSend(v28, "setObject:forKey:", *MEMORY[0x1E0C9AE50], v29);
    objc_msgSend(v28, "setObject:forKey:", v31, *MEMORY[0x1E0CBD198]);
    if (!-[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("kCGImageSourceRasterizationDPI")))
      objc_msgSend(v28, "setObject:forKey:", &unk_1E2F1B9B0, CFSTR("kCGImageSourceRasterizationDPI"));
    v32 = (id)MEMORY[0x1E0C9AAB0];
    objc_msgSend(v28, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD138]);
    if (dict)
      v33 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("kCIImageExpandToHDR"));
    else
      v33 = 0;
    v34 = v33 == v32 || v33 == &unk_1E2F1B9F8;
    v35 = v34;
    if (v34)
    {
      v36 = (id)-[NSDictionary mutableCopy](dict, "mutableCopy");
      objc_msgSend(v36, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCIImageAuxiliaryHDRGainMap"));
      v37 = +[CIImage imageWithCGImageSource:index:options:](CIImage, "imageWithCGImageSource:index:options:", source, index, v36);
    }
    else
    {
      v37 = 0;
    }
    if (!objc_msgSend(v28, "objectForKey:", CFSTR("CIImageProperties")))
    {
      v38 = CGImageSourceCopyPropertiesAtIndex(source, index, (CFDictionaryRef)v28);
      if (v38)
      {
        v39 = v38;
        v69 = v35;
        v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v38);
        v41 = (void *)objc_msgSend(v40, "valueForKeyPath:", CFSTR("{JPEG}.ChromaSubsamplingX"));
        v42 = (void *)objc_msgSend(v40, "valueForKeyPath:", CFSTR("{JPEG}.ChromaSubsamplingY"));
        if (objc_msgSend(v41, "intValue") == 1 || objc_msgSend(v42, "intValue") == 1)
          objc_msgSend(v28, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1111970369), CFSTR("kCIImageRequestSurfaceFormat"));
        objc_msgSend(v40, "removeObjectForKey:", *MEMORY[0x1E0CBCF60]);
        objc_msgSend(v28, "setObject:forKey:", v40, CFSTR("CIImageProperties"));
        CFRelease(v39);
        v35 = v69;
      }
    }
    v43 = *MEMORY[0x1E0CBD250];
    v44 = (void *)objc_msgSend(v28, "valueForKey:", *MEMORY[0x1E0CBD250]);
    v45 = objc_msgSend(v28, "valueForKey:", CFSTR("kCIImageCacheImmediately"));
    if (v44 && !v45)
    {
      v46 = v37;
      v47 = v35;
      v48 = (void *)MEMORY[0x1E0CB37E8];
      v49 = objc_msgSend(v44, "BOOLValue");
      v50 = v48;
      v35 = v47;
      v37 = v46;
      objc_msgSend(v28, "setValue:forKey:", objc_msgSend(v50, "numberWithBool:", v49), CFSTR("kCIImageCacheImmediately"));
    }
    objc_msgSend(v28, "setValue:forKey:", MEMORY[0x1E0C9AAA0], v43);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(source, index, (CFDictionaryRef)v28);
    if (ImageAtIndex)
    {
      v52 = ImageAtIndex;
      v15 = -[CIImage initWithCGImage:options:](self, "initWithCGImage:options:", ImageAtIndex, v28);
      CGImageRelease(v52);
      if (v37)
        v53 = v35;
      else
        v53 = 0;
      if (v53 != 1)
        goto LABEL_73;
      v54 = -[CIImage imageByApplyingGainMap:](v15, "imageByApplyingGainMap:", v37);
      if ((CIImage *)v54 == v15)
        goto LABEL_73;
      v55 = (void *)v54;
      if (dict)
        v56 = -[NSDictionary objectForKey:](dict, "objectForKey:", CFSTR("kCIImageGenerateFlexGTC"));
      else
        v56 = 0;
      if (v56 == (id)MEMORY[0x1E0C9AAB0] || v56 == &unk_1E2F1B9F8)
      {
        v58 = -[CIImage _copyHDRColorspaceFromSource:index:](v15, "_copyHDRColorspaceFromSource:index:", source, index);
        v57 = v58;
        if (v58 && CGColorSpaceIsPQBased(v58))
        {
          PQBasedCopy = CGColorSpaceRetain(v57);
LABEL_70:
          v62 = PQBasedCopy;
          v63 = (void *)objc_msgSend(v55, "imageByTaggingWithColorSpace:", PQBasedCopy);
          CGColorSpaceRelease(v62);
          CGColorSpaceRelease(v57);
          v64 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v63, "properties"));
          objc_msgSend(v64, "setObject:forKey:", &unk_1E2F1B9C8, CFSTR("Depth"));
          v65 = CGColorSpaceCopyICCProfileDescription();
          if (v65)
          {
            v66 = (const void *)v65;
            objc_msgSend(v64, "setObject:forKey:", v65, CFSTR("ProfileName"));
            CFRelease(v66);
          }
          v67 = (void *)objc_msgSend(v63, "imageBySettingProperties:", v64);
          v68 = v15;
          v15 = v67;
LABEL_73:

          return v15;
        }
      }
      else
      {
        v57 = 0;
      }
      v60 = -[CIImage colorSpace](v15, "colorSpace");
      PQBasedCopy = CI::ColorSpaceCreatePQBasedCopy(v60, v61);
      goto LABEL_70;
    }

    return 0;
  }
  return (CIImage *)-[CIImage initGainmapWithImageSource:options:](self, "initGainmapWithImageSource:options:", source, dict);
}

+ (CIImage)imageWithCGLayer:(CGLayerRef)layer
{
  return (CIImage *)objc_msgSend(a1, "imageWithCGLayer:options:", layer, 0);
}

+ (CIImage)imageWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options
{
  return -[CIImage initWithCGLayer:options:]([CIImage alloc], "initWithCGLayer:options:", layer, options);
}

- (CIImage)initWithCGLayer:(CGLayerRef)layer
{
  return -[CIImage initWithCGLayer:options:](self, "initWithCGLayer:options:", layer, 0);
}

- (CIImage)initWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options
{
  CGSize Size;
  CGContextRef Context;
  BOOL v9;
  size_t v11;
  size_t v12;
  CGColorSpace *v13;
  CGContext *v14;
  CGImage *Image;
  CIImage *v16;

  if (!layer)
    goto LABEL_14;
  Size = CGLayerGetSize(layer);
  Context = CGLayerGetContext(layer);
  v9 = Size.width < 0.5 || Size.height < 0.5;
  if (v9 || Context == 0)
    goto LABEL_14;
  v11 = vcvtpd_u64_f64(Size.width);
  v12 = vcvtpd_u64_f64(Size.height);
  v13 = (CGColorSpace *)CGContextCopyDeviceColorSpace();
  if (!v13)
    v13 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
  v14 = CGBitmapContextCreate(0, v11, v12, 8uLL, 0, v13, 2u);
  CGColorSpaceRelease(v13);
  if (v14
    && (CGContextDrawLayerAtPoint(v14, *MEMORY[0x1E0C9D538], layer),
        CGContextFlush(v14),
        Image = CGBitmapContextCreateImage(v14),
        CGContextRelease(v14),
        Image))
  {
    v16 = -[CIImage initWithCGImage:options:](self, "initWithCGImage:options:", Image, options);
    CGImageRelease(Image);
    return v16;
  }
  else
  {
LABEL_14:

    return 0;
  }
}

+ (CIImage)imageWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  return -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:options:", a3, a4, *(_QWORD *)&a6, a7, a5.width, a5.height);
}

+ (CIImage)imageWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  return -[CIImage initWithBitmapData:bytesPerRow:size:format:colorSpace:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:colorSpace:", data, bytesPerRow, *(_QWORD *)&format, colorSpace, size.width, size.height);
}

- (id)_initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  uint64_t v8;
  double height;
  double width;
  id result;
  id v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v17[6];
  int v18;
  objc_super v19;

  v8 = *(_QWORD *)&a6;
  height = a5.height;
  width = a5.width;
  v19.receiver = self;
  v19.super_class = (Class)CIImage;
  result = -[CIImage init](&v19, sel_init);
  if (result)
  {
    v14 = result;
    if (a3
      && ((unint64_t)width ? (v15 = (unint64_t)height == 0) : (v15 = 1),
          !v15 && CI::format_bytes_per_row(v8, (unint64_t)width) <= a4))
    {
      v16 = objc_msgSend(a7, "objectForKey:", CFSTR("CIImageColorSpace"));
      if (objc_msgSend(MEMORY[0x1E0C99E38], "null") == v16 || CI_NO_CM())
        v16 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__CIImage__initWithBitmapData_bytesPerRow_size_format_options___block_invoke;
      v17[3] = &unk_1E2EC4160;
      v18 = v8;
      v17[4] = a3;
      v17[5] = a4;
      return (id)objc_msgSend(v14, "initWithImageProvider:width:height:format:colorSpace:options:", v17, (unint64_t)width, (unint64_t)height, v8, v16, a7);
    }
    else
    {

      return 0;
    }
  }
  return result;
}

char *__63__CIImage__initWithBitmapData_bytesPerRow_size_format_options___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v14;
  char *result;
  char *v16;
  size_t v17;

  v14 = CI::format_bytes_per_pixel(*(_DWORD *)(a1 + 48));
  result = (char *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
  if (a7)
  {
    v16 = &result[*(_QWORD *)(a1 + 40) * a5 + v14 * a4];
    v17 = v14 * a6;
    do
    {
      result = (char *)memcpy(a2, v16, v17);
      v16 += *(_QWORD *)(a1 + 40);
      a2 += a3;
      --a7;
    }
    while (a7);
  }
  return result;
}

- (CIImage)initWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v7;
  double height;
  double width;
  const __CFString *v14;
  _QWORD v15[2];

  v7 = *(_QWORD *)&format;
  height = size.height;
  width = size.width;
  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("CIImageColorSpace");
  if (!colorSpace)
    colorSpace = (CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15[0] = colorSpace;
  return -[CIImage initWithBitmapData:bytesPerRow:size:format:options:](self, "initWithBitmapData:bytesPerRow:size:format:options:", data, bytesPerRow, v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1), width, height);
}

- (CIImage)initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  double height;
  double width;
  id v14;
  uint64_t v16;
  BOOL v17;
  size_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __IOSurface *WrappedSurface;
  __IOSurface *v42;
  id v43;
  id v45;
  CIImage *v46;

  v10 = *(_QWORD *)&a6;
  height = a5.height;
  width = a5.width;
  v14 = a3;
  LODWORD(v7) = vcvtpd_u64_f64(a5.width);
  LODWORD(v8) = vcvtpd_u64_f64(a5.height);
  v16 = objc_msgSend(a3, "length");
  if ((_DWORD)v7)
    v17 = (_DWORD)v8 == 0;
  else
    v17 = 1;
  if (v17)
    goto LABEL_26;
  v18 = v16;
  if (!objc_msgSend(v14, "bytes"))
    goto LABEL_26;
  v20 = CI::format_modernize(v10, (CI *)"-[CIImage initWithBitmapData:bytesPerRow:size:format:options:]", v19);
  if ((CI::format_is_supported_source_bitmap(v20) & 1) == 0)
  {
    v22 = CI::name_for_format(v20);
    v23 = ci_logger_api();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
        -[CIImage initWithBitmapData:bytesPerRow:size:format:options:].cold.3((uint64_t)v22, v23, v25, v26, v27, v28, v29, v30);
    }
    else if (v24)
    {
      -[CIImage initWithBitmapData:bytesPerRow:size:format:options:].cold.2();
    }
    goto LABEL_26;
  }
  if (ceil(height) * (double)a4 > (double)v18)
  {
    v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIImage initWithBitmapData:bytesPerRow:size:format:options:].cold.1();
LABEL_26:

    return 0;
  }
  v31 = (const void *)objc_msgSend(v14, "bytes");
  v32 = CI_IOSURFACE_WRAPPING(1u);
  if ((a4 & 3) != 0)
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  if (!v32)
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  v33 = atomic_load(&dword_1ECF872F0[17]);
  if (v33 >= 0x101)
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  if ((IOSurfaceWrapPointerOk(v31) & 1) == 0)
  {
    v34 = mmap(0, v18, 3, 4098, 1140850688, 0);
    if (v34 != (void *)-1)
    {
      v35 = v34;
      memcpy(v34, v31, v18);
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v35, v18, &__block_literal_global_39);
      v36 = v14;
      goto LABEL_19;
    }
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  }
LABEL_19:
  v37 = CI::PixelFormatType_from_format(v20);
  v38 = CI::PixelFormatType_approx_from_format(v20);
  v39 = objc_msgSend(v14, "bytes");
  v40 = CI::format_bytes_per_pixel(v20);
  if (!(_DWORD)v38)
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  WrappedSurface = CreateWrappedSurface(v7, v8, v38, a4, v40, v39);
  if (!WrappedSurface)
    return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
  v42 = WrappedSurface;
  objc_setAssociatedObject(WrappedSurface, SetSurfaceBackingObject, v14, (void *)1);
  if (v37 == (_DWORD)v38)
  {
    v43 = a7;
  }
  else
  {
    if (a7)
      v45 = (id)objc_msgSend(a7, "mutableCopy");
    else
      v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = v45;
    objc_msgSend(v45, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20), CFSTR("CIImageSurfaceFormat"));
  }
  v46 = -[CIImage _initWithIOSurface:options:owner:](self, "_initWithIOSurface:options:owner:", v42, v43, 0);
  CFRelease(v42);

  return v46;
}

uint64_t __62__CIImage_initWithBitmapData_bytesPerRow_size_format_options___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace
{
  return -[CIImage initWithTexture:size:flipped:colorSpace:]([CIImage alloc], "initWithTexture:size:flipped:colorSpace:", *(_QWORD *)&name, flipped, colorSpace, size.width, size.height);
}

+ (CIImage)imageWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5
{
  return -[CIImage initWithTexture:size:options:]([CIImage alloc], "initWithTexture:size:options:", *(_QWORD *)&a3, a5, a4.width, a4.height);
}

+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options
{
  return -[CIImage initWithTexture:size:flipped:options:]([CIImage alloc], "initWithTexture:size:flipped:options:", *(_QWORD *)&name, flipped, options, size.width, size.height);
}

- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace
{
  _BOOL8 v6;
  double height;
  double width;
  uint64_t v9;
  _QWORD v12[2];
  _QWORD v13[3];

  v6 = flipped;
  height = size.height;
  width = size.width;
  v9 = *(_QWORD *)&name;
  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIImageColorSpace");
  if (!colorSpace)
    colorSpace = (CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12[1] = CFSTR("CIImageFlipped");
  v13[0] = colorSpace;
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  return -[CIImage initWithTexture:size:options:](self, "initWithTexture:size:options:", v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2), width, height);
}

- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options
{
  _BOOL8 v6;
  double height;
  double width;
  uint64_t v9;
  void *v11;

  v6 = flipped;
  height = size.height;
  width = size.width;
  v9 = *(_QWORD *)&name;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("CIImageFlipped"));
  return -[CIImage initWithTexture:size:options:](self, "initWithTexture:size:options:", v9, v11, width, height);
}

- (CIImage)initWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5
{
  double height;
  CGFloat width;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  CIImage *v14;
  void *v15;
  void *v16;
  BOOL v18;
  int v19;
  int v20;
  void *v21;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t ContentDigestFromOptions;
  uint64_t v39;
  void *v40;
  int v41;
  CIImage *v42;
  void *v43;
  CI::Image *v44;
  BOOL v45;
  void *v46;
  _BOOL8 v47;
  CIImage *v50;
  _QWORD v51[3];
  __int128 v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  height = a4.height;
  width = a4.width;
  v10 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageTextureTarget"));
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "intValue") == 3553)
  {
    objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageTextureFormat"));
    if (objc_msgSend(a5, "objectForKey:", CFSTR("CIImagePremultiplied")))
    {
      if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("CIImagePremultiplied")), "BOOLValue"))
        v12 = 0;
      else
        v12 = 2;
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue"))
      v12 = 1;
    v50 = self;
    if (a5)
      v15 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageEdgesAreClear"));
    else
      v15 = 0;
    v16 = (void *)MEMORY[0x1E0C9AAB0];
    v18 = v15 == (void *)MEMORY[0x1E0C9AAB0] || v15 == &unk_1E2F1B9F8;
    if (v18 && v12 == 0)
      v19 = 4;
    else
      v19 = v12;
    if (v18 && v19 == 2)
      v20 = 6;
    else
      v20 = v19;
    if (a5)
    {
      v21 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageClampToEdge"));
      v23 = v21 == v16 || v21 == &unk_1E2F1B9F8;
      v24 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageEdgeRepeat"));
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    if (v24 == v16 || v24 == &unk_1E2F1B9F8)
    {
      v25 = ci_logger_api();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CIImage initWithTexture:size:options:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    v33 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageProperties"));
    if (v33 && (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v33)
      v33 = (void *)dictionaryDeepCopy(v33, (uint64_t)&__block_literal_global_692);
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.width = width;
    v54.size.height = height;
    if (CGRectIsNull(v54))
    {
      LODWORD(v34) = 0;
      LODWORD(v35) = 0;
      if (!v11)
        goto LABEL_51;
LABEL_49:
      v36 = objc_msgSend(v11, "intValue") << 32;
      goto LABEL_52;
    }
    v55.origin.x = 0.0;
    v55.origin.y = 0.0;
    v55.size.width = width;
    v55.size.height = height;
    if (CGRectIsInfinite(v55))
    {
      LODWORD(v34) = -1;
      LODWORD(v35) = -1;
      if (v11)
        goto LABEL_49;
    }
    else
    {
      v56.origin.x = 0.0;
      v56.origin.y = 0.0;
      v56.size.width = width;
      v56.size.height = height;
      v57 = CGRectInset(v56, 0.000001, 0.000001);
      v58 = CGRectIntegral(v57);
      v35 = (unint64_t)v58.size.width;
      v34 = (unint64_t)v58.size.height;
      if (v11)
        goto LABEL_49;
    }
LABEL_51:
    v36 = 0xDE100000000;
LABEL_52:
    v37 = (uint64_t *)operator new();
    ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a5);
    CI::TextureImage::TextureImage((uint64_t)v37, v36 | a3, v39, ContentDigestFromOptions, v35, v34, v33, v20, v23);
    *v37 = (uint64_t)&off_1E2EBA720;
    v37[13] = (uint64_t)&unk_1E2EBA890;
    v40 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageNearestSampling"));
    if (v40)
    {
      v41 = objc_msgSend(v40, "BOOLValue");
      v42 = v50;
      v43 = (void *)MEMORY[0x1E0C9AAB0];
      if (v41)
        v37 = (uint64_t *)CI::SampleModeImage::append_and_unref(v37, 0);
    }
    else
    {
      v42 = v50;
      v43 = (void *)MEMORY[0x1E0C9AAB0];
    }
    v44 = (CI::Image *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageColorSpace"));
    v45 = !v44 || (CI::Image *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v44 || CI_NO_CM();
    if (objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR")))
    {
      if (a5)
        v46 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"));
      else
        v46 = 0;
      v47 = v46 == v43 || v46 == &unk_1E2F1B9F8;
      if (v45)
        goto LABEL_74;
    }
    else
    {
      v47 = 0;
      if (v45)
      {
LABEL_74:
        if (objc_msgSend(a5, "objectForKey:", CFSTR("CIImageFlipped"))
          && objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue")
          && height > 1.0)
        {
          v51[1] = 0;
          v51[2] = 0;
          v51[0] = 0x3FF0000000000000;
          v52 = xmmword_192493540;
          v53 = height;
          v37 = (uint64_t *)CI::AffineImage::append_and_unref((CI::AffineImage *)v37, (CI::Image *)v51, 0);
        }
        v14 = -[CIImage _initWithInternalRepresentation:](v42, "_initWithInternalRepresentation:", v37);
        if (v37)
          CI::Object::unref((CI::Object *)v37);
        return v14;
      }
    }
    v37 = (uint64_t *)CI::ColorMatchImage::append_and_unref((CI::ColorMatchImage *)v37, v44, (CGColorSpace *)v47);
    goto LABEL_74;
  }
  v13 = ci_logger_api();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CIImage initWithTexture:size:options:].cold.2();

  return 0;
}

- (void)_setOriginalMTLTexture:(id)a3 options:(id)a4
{
  id v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6 = (id)objc_msgSend(a4, "mutableCopy");
  v7[0] = CFSTR("kCIImageCacheHint");
  v7[1] = CFSTR("kCIImageCacheImmediately");
  v7[2] = CFSTR("kCIImageContentDigest");
  v7[3] = CFSTR("CIImageEdgesAreClear");
  v7[4] = CFSTR("kCIImageAVDepthData");
  v7[5] = CFSTR("CIImageProperties");
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6));
  if (!objc_msgSend(v6, "count"))
    (*(void (**)(void *, id))(*(_QWORD *)self->_priv + 312))(self->_priv, a3);
}

- (MTLTexture)metalTexture
{
  MTLTexture *v2;
  MTLTexture *v3;

  v2 = (MTLTexture *)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_priv + 304))(self->_priv, a2);
  if (!v2)
    return 0;
  v3 = v2;
  if ((-[MTLTexture conformsToProtocol:](v2, "conformsToProtocol:", &unk_1EE2AB1A0) & 1) == 0)
    return 0;
  return v3;
}

+ (CIImage)imageWithMTLTexture:(id)texture options:(NSDictionary *)options
{
  return -[CIImage initWithMTLTexture:options:]([CIImage alloc], "initWithMTLTexture:options:", texture, options);
}

- (CIImage)initWithMTLTexture:(id)texture options:(NSDictionary *)options
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CIImage *v23;
  __IOSurface *v25;
  __IOSurface *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  id v32;
  id v33;
  BOOL v35;
  int v36;
  int v37;
  id v38;
  _BOOL4 v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  CI::ColorMatchImage *v51;
  uint64_t ContentDigestFromOptions;
  CI::Image *v53;
  BOOL v54;
  id v55;
  _BOOL8 v56;
  CIImage *v58;
  void *v59;
  int v60;
  _QWORD v61[3];
  __int128 v62;
  double v63;

  if (objc_msgSend(texture, "textureType") != 2)
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIImage initWithMTLTexture:options:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_7;
  }
  if ((objc_msgSend(texture, "usage") & 1) == 0)
  {
    v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CIImage initWithMTLTexture:options:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_7:

    return 0;
  }
  v25 = (__IOSurface *)objc_msgSend(texture, "iosurface");
  if (!v25
    || (v26 = v25, IOSurfaceGetPlaneCount(v25) < 2)
    || (v27 = (void *)objc_msgSend(texture, "device"), (CIMetalDeviceIsA9OrHigher(v27, v28) & 1) != 0))
  {
    v29 = objc_msgSend(texture, "pixelFormat");
    v30 = objc_msgSend(texture, "swizzle") >> 24;
    if (v30 != 1)
    {
      if (v30 == 5)
      {
        v30 = 1;
        if (v29 <= 499)
        {
          if ((unint64_t)(v29 - 10) <= 0x37 && ((1 << (v29 - 10)) & 0x84200000308403) != 0
            || (unint64_t)(v29 - 240) <= 0x3D
            && ((1 << (v29 + 16)) & 0x3000000000000003) != 0
            || v29 == 105)
          {
            goto LABEL_28;
          }
        }
        else if ((unint64_t)(v29 - 500) <= 0x37
               && ((1 << (v29 + 12)) & 0xC1FF00000007EDLL) != 0
               || (unint64_t)(v29 - 570) < 3)
        {
          goto LABEL_28;
        }
      }
      v30 = 2 * ((objc_msgSend(texture, "pixelFormat") & 0xFFFFFFFFFFFFFFFBLL) == 90);
    }
LABEL_28:
    if (-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImagePremultiplied")))
    {
      if (objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImagePremultiplied")), "BOOLValue"))v30 = 0;
      else
        v30 = 2;
    }
    if (objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue"))v31 = 1;
    else
      v31 = v30;
    v58 = self;
    if (options)
      v32 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageEdgesAreClear"));
    else
      v32 = 0;
    v33 = (id)MEMORY[0x1E0C9AAB0];
    v35 = v32 == (id)MEMORY[0x1E0C9AAB0] || v32 == &unk_1E2F1B9F8;
    if (v35 && v31 == 0)
      v36 = 4;
    else
      v36 = v31;
    if (v35 && v36 == 2)
      v37 = 6;
    else
      v37 = v36;
    v60 = v37;
    if (options)
    {
      v38 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageClampToEdge"));
      v40 = v38 == v33 || v38 == &unk_1E2F1B9F8;
      v41 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageEdgeRepeat"), self);
    }
    else
    {
      v40 = 0;
      v41 = 0;
    }
    if (v41 == v33 || v41 == &unk_1E2F1B9F8)
    {
      v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CIImage initWithMTLTexture:options:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    v50 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageProperties"), v58);
    if (v50 && (id)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v50)
      v50 = (id)dictionaryDeepCopy(v50, (uint64_t)&__block_literal_global_692);
    v51 = (CI::ColorMatchImage *)operator new();
    ContentDigestFromOptions = getContentDigestFromOptions(options);
    CI::MetalTextureImage::MetalTextureImage((uint64_t)v51, (uint64_t)texture, ContentDigestFromOptions, objc_msgSend(texture, "width"), objc_msgSend(texture, "height"), v50, v60, v40);
    v53 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageColorSpace"));
    v54 = !v53 || (CI::Image *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v53 || CI_NO_CM();
    if (-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR")))
    {
      if (options)
        v55 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"));
      else
        v55 = 0;
      v56 = v55 == v33 || v55 == &unk_1E2F1B9F8;
    }
    else
    {
      v56 = 0;
    }
    if (!v54)
      v51 = CI::ColorMatchImage::append_and_unref(v51, v53, (CGColorSpace *)v56);
    if (-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageFlipped"))
      && objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue")&& (unint64_t)objc_msgSend(texture, "height") >= 2)
    {
      v61[1] = 0;
      v61[2] = 0;
      v61[0] = 0x3FF0000000000000;
      v62 = xmmword_192493540;
      v63 = (double)(unint64_t)objc_msgSend(texture, "height");
      v51 = CI::AffineImage::append_and_unref(v51, (CI::Image *)v61, 0);
    }
    v23 = (CIImage *)objc_msgSend(v59, "_initWithInternalRepresentation:", v51);
    -[CIImage _setOriginalMTLTexture:options:](v23, "_setOriginalMTLTexture:options:", texture, options);
    if (v51)
      CI::Object::unref(v51);
    return v23;
  }
  if (!-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageFlipped")))
  {
    options = (NSDictionary *)(id)-[NSDictionary mutableCopy](options, "mutableCopy");
    -[NSDictionary setObject:forKey:](options, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("CIImageFlipped"));
  }
  return (CIImage *)-[CIImage _initWithIOSurface:options:owner:](self, "_initWithIOSurface:options:owner:", v26, options, 0);
}

- (void)_setOriginalCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4
{
  id v6;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v6 = (id)objc_msgSend(a4, "mutableCopy");
  v7[0] = CFSTR("kCIImageCacheHint");
  v7[1] = CFSTR("kCIImageCacheImmediately");
  v7[2] = CFSTR("kCIImageContentDigest");
  v7[3] = CFSTR("CIImageEdgesAreClear");
  v7[4] = CFSTR("kCIImageAVDepthData");
  v7[5] = CFSTR("kCIImageAVPortraitEffectsMatte");
  v7[6] = CFSTR("kCIImageAVSemanticSegmentationMatte");
  v7[7] = CFSTR("CIImageProperties");
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8));
  if (!objc_msgSend(v6, "count"))
    (*(void (**)(void *, __CVBuffer *))(*(_QWORD *)self->_priv + 312))(self->_priv, a3);
}

- (CVPixelBufferRef)pixelBuffer
{
  __CVBuffer *v2;
  __CVBuffer *v3;
  CFTypeID v4;

  v2 = (__CVBuffer *)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_priv + 304))(self->_priv, a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 != CVPixelBufferGetTypeID())
    return 0;
  return v3;
}

- (AVDepthData)depthData
{
  return (AVDepthData *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 208))(self->_priv);
}

- (AVPortraitEffectsMatte)portraitEffectsMatte
{
  return (AVPortraitEffectsMatte *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 216))(self->_priv);
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatte
{
  return (AVSemanticSegmentationMatte *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 224))(self->_priv);
}

- (id)_initWithCVImageBuffer:(__CVBuffer *)a3 options:(id)a4
{
  CFTypeID v6;
  CGSize EncodedSize;
  __CVBuffer *v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  BOOL v19;
  int v20;
  int v21;
  void *v22;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BOOL v29;
  void *v30;
  BOOL v32;
  int PixelBufferYCCMatrix;
  NSObject *v34;
  CGColorSpaceRef DeviceRGB;
  void *v36;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  float v44;
  void *Attachment;
  CFTypeRef v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  float v51;
  CFTypeID v52;
  unint64_t height;
  CI::ColorMatchImage *v54;
  uint64_t ContentDigestFromOptions;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;
  _BOOL4 v62;
  int v63;
  _BOOL4 v65;
  char v66;
  char v67;
  int v68;
  int v69;
  char v70;
  int v71;
  _OWORD v73[3];
  _QWORD v74[3];
  __int128 v75;
  double v76;
  uint64_t v77[3];
  _QWORD v78[5];
  int v79;
  uint8_t buf[16];
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  CGRect v84;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = CFGetTypeID(a3);
  if (v6 == CVPixelBufferGetTypeID())
  {
    EncodedSize = CVImageBufferGetEncodedSize(a3);
    v9 = CI::format_from_CVPixelBuffer(a3, v8);
    v10 = CVImageBufferIsFlipped(a3) != 0;
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")))
      v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue");
    v71 = v10;
    if (CI::format_has_unpremul_alpha(v9))
    {
      v11 = 2;
    }
    else if ((CI::format_has_alpha(v9) & 1) != 0)
    {
      v11 = 0;
    }
    else if (CI::format_has_x(v9))
    {
      v11 = -1;
    }
    else
    {
      v11 = 1;
    }
    if (objc_msgSend(a4, "objectForKey:", CFSTR("CIImagePremultiplied")))
    {
      if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("CIImagePremultiplied")), "BOOLValue"))
        v11 = 0;
      else
        v11 = 2;
    }
    v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
    if (CI::format_is_ycc(v9) | v14)
      v15 = 1;
    else
      v15 = v11;
    if (a4)
      v16 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgesAreClear"));
    else
      v16 = 0;
    v17 = (void *)MEMORY[0x1E0C9AAB0];
    v19 = v16 == (void *)MEMORY[0x1E0C9AAB0] || v16 == &unk_1E2F1B9F8;
    if (v19 && v15 == 0)
      v20 = 4;
    else
      v20 = v15;
    if (v19 && v20 == 2)
      v21 = 6;
    else
      v21 = v20;
    v69 = v21;
    if (a4)
    {
      v22 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageClampToEdge"));
      v24 = v22 == v17 || v22 == &unk_1E2F1B9F8;
      v68 = v24;
      v25 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageEdgeRepeat"));
    }
    else
    {
      v68 = 0;
      v25 = 0;
    }
    if (v25 == v17 || v25 == &unk_1E2F1B9F8)
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CIImage _initWithCVImageBuffer:options:].cold.1();
    }
    if (a4)
    {
      v27 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageNearestSampling"));
      v29 = v27 == v17 || v27 == &unk_1E2F1B9F8;
      v67 = v29;
      v30 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageCacheHint"));
    }
    else
    {
      v67 = 0;
      v30 = 0;
    }
    v32 = v30 == v17 || v30 == &unk_1E2F1B9F8;
    v66 = v32;
    if (!CI::format_is_ycc_or_ycca(v9)
      || !objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageYCCMatrix"))
      || (PixelBufferYCCMatrix = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageYCCMatrix")), "intValue")) == 0)
    {
      if (CI::format_is_ycc_or_ycca(v9))
      {
        PixelBufferYCCMatrix = GetPixelBufferYCCMatrix(a3);
        if (!PixelBufferYCCMatrix)
        {
          PixelBufferYCCMatrix = CI::format_get_default_ycc_color_matrix(v9);
          v34 = ci_logger_api();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = PixelBufferYCCMatrix;
            _os_log_impl(&dword_1921E4000, v34, OS_LOG_TYPE_INFO, "CIImage will use Rec. %d YCC Matrix because the CVPixelBuffer was not tagged with a supported kCVImageBufferYCbCrMatrixKey.", buf, 8u);
          }
        }
      }
      else
      {
        PixelBufferYCCMatrix = 0;
      }
    }
    DeviceRGB = (CGColorSpaceRef)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageColorSpace"));
    if ((CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0C99E38], "null") == DeviceRGB || CI_NO_CM())
    {
      v70 = 1;
    }
    else
    {
      if (!DeviceRGB)
      {
        DeviceRGB = CVImageBufferCopyColorSpace(a3);
        if (DeviceRGB || (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0)
          CFAutorelease(DeviceRGB);
      }
      v70 = 0;
    }
    if (objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR")))
    {
      if (a4)
        v36 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageToneMapHDRtoSDR"));
      else
        v36 = 0;
      v38 = v36 == v17 || v36 == &unk_1E2F1B9F8;
      v65 = v38;
    }
    else
    {
      v65 = 0;
    }
    v39 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIImageProperties"));
    v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageApplyOrientationProperty"));
    if (objc_msgSend(v40, "isEqual:", MEMORY[0x1E0C9AAB0]))
    {
      v41 = (void *)objc_msgSend(v39, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      if (v41)
        LODWORD(v41) = objc_msgSend(v41, "intValue");
      if (((_DWORD)v41 - 9) >= 0xFFFFFFF8)
        v42 = (int)v41;
      else
        v42 = 0;
      if (!v39 || (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v39)
        goto LABEL_106;
      v43 = &__block_literal_global_688;
    }
    else
    {
      if (!v39)
      {
        v42 = 0;
LABEL_106:
        v44 = OptionHeadroom((NSDictionary *)a4);
        if (v44 == 0.0)
        {
          Attachment = (void *)CVBufferGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8E58], 0);
          v46 = CVBufferGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8DA8], 0);
          if (Attachment)
          {
            v47 = (void *)v46;
            if (v46)
            {
              objc_msgSend(Attachment, "doubleValue");
              v49 = v48;
              objc_msgSend(v47, "doubleValue");
              *(float *)&v50 = v50;
              v51 = v49;
              v44 = fmax(fminf(*(float *)&v50, v51) / 203.0, 203.0);
            }
          }
        }
        v52 = CFGetTypeID(a3);
        height = (unint64_t)EncodedSize.height;
        if (v52 == CVPixelBufferGetTypeID())
        {
          v54 = (CI::ColorMatchImage *)operator new();
          ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a4);
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __42__CIImage__initWithCVImageBuffer_options___block_invoke;
          v78[3] = &unk_1E2EC41C8;
          v79 = v9;
          v78[4] = a3;
          memset(v77, 0, sizeof(v77));
          CI::ProviderImage::ProviderImage((uint64_t)v54, ContentDigestFromOptions, CFSTR("initWithCVPixelBuffer"), v78, (unint64_t)EncodedSize.width, (unint64_t)EncodedSize.height, v77, v9, v44, PixelBufferYCCMatrix, v39, v69, v68, v67, v66, 1);
          *(_QWORD *)buf = v77;
          std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
        }
        else
        {
          v54 = 0;
        }
        v56 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVDepthData"));
        if (v54)
        {
          v57 = v56;
          if (v56)
          {
            AVDepthDataClass();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              (*(void (**)(CI::ColorMatchImage *, uint64_t))(*(_QWORD *)v54 + 320))(v54, v57);
          }
        }
        v58 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVPortraitEffectsMatte"));
        v59 = v58;
        if (v58)
          v60 = v54 != 0;
        else
          v60 = 0;
        if (v60)
        {
          AVPortraitEffectsMatteClass(v58);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            (*(void (**)(CI::ColorMatchImage *, uint64_t))(*(_QWORD *)v54 + 328))(v54, v59);
        }
        v61 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAVSemanticSegmentationMatte"));
        if (v61)
          v62 = v54 != 0;
        else
          v62 = 0;
        if (v62)
        {
          AVSemanticSegmentationMatteClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            (*(void (**)(CI::ColorMatchImage *, uint64_t))(*(_QWORD *)v54 + 336))(v54, v61);
        }
        if ((v70 & 1) == 0)
          v54 = CI::ColorMatchImage::append_and_unref(v54, DeviceRGB, (CGColorSpace *)v65);
        if (height == 1)
          v63 = 0;
        else
          v63 = v71;
        if (v63 == 1)
        {
          v74[1] = 0;
          v74[2] = 0;
          v74[0] = 0x3FF0000000000000;
          v75 = xmmword_192493540;
          v76 = (double)height;
          v54 = CI::AffineImage::append_and_unref(v54, (CI::Image *)v74, 0);
        }
        if (v42 >= 2)
        {
          v84.size.width = (double)(unint64_t)EncodedSize.width;
          v84.size.height = (double)height;
          v81 = 0u;
          v82 = 0u;
          *(_OWORD *)buf = 0u;
          v84.origin.x = 0.0;
          v84.origin.y = 0.0;
          orientationTransform(v84, v42, buf);
          v73[0] = *(_OWORD *)buf;
          v73[1] = v81;
          v73[2] = v82;
          v54 = CI::AffineImage::append_and_unref(v54, (CI::Image *)v73, 0);
        }
        v13 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v54);
        if (v54)
          CI::Object::unref(v54);
        return v13;
      }
      v42 = 0;
      if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v39)
        goto LABEL_106;
      v43 = &__block_literal_global_692;
    }
    v39 = (void *)dictionaryDeepCopy(v39, (uint64_t)v43);
    goto LABEL_106;
  }
  v12 = ci_logger_api();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CIImage _initWithCVImageBuffer:options:].cold.2();

  return 0;
}

uint64_t __42__CIImage__initWithCVImageBuffer_options___block_invoke(uint64_t a1, uint64_t a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CVBuffer *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v20[10];

  CI::format_is_packed(*(_DWORD *)(a1 + 40));
  v16 = *(__CVBuffer **)(a1 + 32);
  v17 = CI::format_bytes_for_width_of_plane(*(_DWORD *)(a1 + 40), a5, a3);
  v18 = CI::format_bytes_for_width_of_plane(*(_DWORD *)(a1 + 40), a7, a3);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__CIImage__initWithCVImageBuffer_options___block_invoke_2;
  v20[3] = &__block_descriptor_80_e22_v48__0r_v8Q16Q24Q32Q40l;
  v20[4] = a6;
  v20[5] = v17;
  v20[6] = a8;
  v20[7] = a2;
  v20[8] = a4;
  v20[9] = v18;
  return PixelBufferApplyOnePlaneReadOnlyBlock(v16, a3, (uint64_t)v20);
}

_QWORD *__42__CIImage__initWithCVImageBuffer_options___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;

  if (result[6])
  {
    v7 = result;
    v8 = 0;
    v9 = (char *)(a2 + result[4] * a6 + result[5]);
    do
    {
      result = memcpy((void *)(v7[7] + v7[8] * v8++), v9, v7[9]);
      v9 += a6;
    }
    while (v8 < v7[6]);
  }
  return result;
}

+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  return +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", pixelBuffer, 0);
}

+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  return -[CIImage initWithCVPixelBuffer:options:]([CIImage alloc], "initWithCVPixelBuffer:options:", pixelBuffer, options);
}

- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", pixelBuffer, 0);
}

- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  CFTypeID v7;
  CI *PixelFormatType;
  uint64_t v9;
  size_t Width;
  size_t Height;
  CGColorSpaceRef v12;
  CIImage *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CIImage *v42;
  void *v43;
  id v44;
  uint64_t PixelBufferYCCMatrix;
  CGColorSpaceRef v46;
  unsigned int v47;
  _QWORD v48[5];
  int v49;

  if (!pixelBuffer)
  {
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CIImage initWithCVPixelBuffer:options:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_12;
  }
  v7 = CFGetTypeID(pixelBuffer);
  if (v7 != CVPixelBufferGetTypeID())
  {
    v22 = ci_logger_api();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CIImage initWithCVPixelBuffer:options:].cold.4(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_12;
  }
  PixelFormatType = (CI *)CVPixelBufferGetPixelFormatType(pixelBuffer);
  v9 = (uint64_t)PixelFormatType;
  if ((_DWORD)PixelFormatType == 1919365992 || (_DWORD)PixelFormatType == 1919365990)
  {
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(pixelBuffer);
    v12 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("CIImageColorSpace"));
    if (!v12)
    {
      v12 = CVImageBufferCopyColorSpace(pixelBuffer);
      CFAutorelease(v12);
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __41__CIImage_initWithCVPixelBuffer_options___block_invoke;
    v48[3] = &unk_1E2EC40F0;
    v48[4] = pixelBuffer;
    v49 = v9;
    return -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](self, "initWithImageProvider:width:height:format:colorSpace:options:", v48, Width, Height, 2056, v12, options);
  }
  if ((CI::PixelFormatType_is_source_supported(PixelFormatType) & 1) == 0)
  {
    if (v9 < 0x29)
    {
      v35 = ci_logger_api();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[CIImage initWithCVPixelBuffer:options:].cold.3(v9, v35, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      v47 = bswap32(v9);
      v34 = ci_logger_api();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CIImage initWithCVPixelBuffer:options:].cold.2((uint64_t)&v47, v34);
    }
LABEL_12:

    return 0;
  }
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurface)
  {
    v32 = IOSurface;
    if (options)
      v33 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
    else
      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = v33;
    v44 = v33;
    PixelBufferYCCMatrix = GetPixelBufferYCCMatrix(pixelBuffer);
    if ((_DWORD)PixelBufferYCCMatrix)
      objc_msgSend(v43, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PixelBufferYCCMatrix), CFSTR("kCIImageYCCMatrix"));
    if (!-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageColorSpace")))
    {
      v46 = CVImageBufferCopyColorSpace(pixelBuffer);
      objc_msgSend(v43, "setObject:forKey:", v46, CFSTR("CIImageColorSpace"));
      CFRelease(v46);
    }
    if (CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8CA8], 0) == (CFTypeRef)*MEMORY[0x1E0C9AE50])
      objc_msgSend(v43, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCIImageAlphaSkip"));
    if (!-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("CIImageFlipped"))
      && !CVImageBufferIsFlipped(pixelBuffer))
    {
      objc_msgSend(v43, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("CIImageFlipped"));
    }
    v42 = -[CIImage _initWithIOSurface:options:owner:](self, "_initWithIOSurface:options:owner:", v32, v43, pixelBuffer);
  }
  else
  {
    v42 = -[CIImage _initWithCVImageBuffer:options:](self, "_initWithCVImageBuffer:options:", pixelBuffer, options);
  }
  v13 = v42;
  -[CIImage _setOriginalCVPixelBuffer:options:](v42, "_setOriginalCVPixelBuffer:options:", pixelBuffer, options);
  return v13;
}

uint64_t __41__CIImage_initWithCVPixelBuffer_options___block_invoke(uint64_t a1, char *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v13;
  uint64_t v14;
  __CVBuffer *v15;
  _QWORD v18[10];
  int v19;

  if (a7)
  {
    v13 = __b;
    v14 = a7;
    do
    {
      memset_pattern8(v13, &unk_1924920A8, 8 * a6);
      v13 += a3;
      --v14;
    }
    while (v14);
  }
  v15 = *(__CVBuffer **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__CIImage_initWithCVPixelBuffer_options___block_invoke_2;
  v18[3] = &__block_descriptor_84_e22_v48__0r_v8Q16Q24Q32Q40l;
  v18[4] = a7;
  v18[5] = __b;
  v18[6] = a3;
  v18[7] = a5;
  v19 = *(_DWORD *)(a1 + 40);
  v18[8] = a6;
  v18[9] = a4;
  return PixelBufferApplyPlaneReadOnlyBlock(v15, (uint64_t)v18);
}

uint64_t __41__CIImage_initWithCVPixelBuffer_options___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(result + 32);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)(result + 48);
    v9 = *(_DWORD *)(result + 80);
    v10 = *(_QWORD *)(result + 40) + 2 * a3;
    v11 = a2 + *(_QWORD *)(result + 56) * a6;
    do
    {
      if (v9 == 1919365992)
      {
        v13 = *(_QWORD *)(result + 64);
        if (v13)
        {
          v14 = 0;
          v15 = v11 + 2 * *(_QWORD *)(result + 72);
          v16 = (_WORD *)v10;
          do
          {
            *v16 = *(_WORD *)(v15 + 2 * v14);
            v16 += 4;
            ++v14;
          }
          while (v13 != v14);
        }
      }
      else if (v9 == 1919365990)
      {
        v12 = *(_QWORD *)(result + 64);
        if (v12)
        {
          v17 = 0;
          v18 = v11 + 4 * *(_QWORD *)(result + 72);
          do
          {
            _S0 = *(_DWORD *)(v18 + v17);
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v10 + 2 * v17) = _S0;
            v17 += 4;
            --v12;
          }
          while (v12);
        }
      }
      ++v7;
      v10 += v8;
      v11 += a6;
    }
    while (v7 != v6);
  }
  return result;
}

+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer
{
  return +[CIImage imageWithCVImageBuffer:options:](CIImage, "imageWithCVImageBuffer:options:", imageBuffer, 0);
}

+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options
{
  return -[CIImage initWithCVImageBuffer:options:]([CIImage alloc], "initWithCVImageBuffer:options:", imageBuffer, options);
}

- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer
{
  return -[CIImage initWithCVImageBuffer:options:](self, "initWithCVImageBuffer:options:", imageBuffer, 0);
}

- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options
{
  CFTypeID v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (imageBuffer)
  {
    v7 = CFGetTypeID(imageBuffer);
    if (v7 == CVPixelBufferGetTypeID())
      return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", imageBuffer, options);
    v17 = CFGetTypeID(imageBuffer);
    if (v17 == CVMetalTextureGetTypeID())
      return -[CIImage initWithMTLTexture:options:](self, "initWithMTLTexture:options:", CVMetalTextureGetTexture(imageBuffer), options);
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIImage initWithCVImageBuffer:options:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CIImage initWithCVImageBuffer:options:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  return 0;
}

+ (CIImage)imageWithColor:(CIColor *)color
{
  return -[CIImage initWithColor:]([CIImage alloc], "initWithColor:", color);
}

- (CIImage)initWithColorR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  CI::FillImage *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  CIImage *v16;

  v11 = (CI::FillImage *)operator new();
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  CI::FillImage::FillImage(v11, v12, v13, v14, v15);
  v16 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v11);
  CI::Object::unref(v11);
  return v16;
}

- (CIImage)initWithColor:(CIColor *)color
{
  CI::FillImage *v5;
  CIImage *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CI::FillImage *)operator new();
    CI::FillImage::FillImage(v5, -[CIColor cgColor](color, "cgColor"));
    v6 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v5);
    CI::Object::unref(v5);
    return v6;
  }
  else
  {

    return 0;
  }
}

+ (id)noiseImage
{
  unsigned __int8 v2;

  {
    +[CIImage noiseImage]::noiseImage = (uint64_t)_noiseImage(0);
  }
  return (id)+[CIImage noiseImage]::noiseImage;
}

+ (id)noiseImageNearest
{
  unsigned __int8 v2;

  {
    +[CIImage noiseImageNearest]::noiseImage = (uint64_t)_noiseImage(1);
  }
  return (id)+[CIImage noiseImageNearest]::noiseImage;
}

+ (id)noiseImagePadded
{
  if (+[CIImage noiseImagePadded]::onceToken != -1)
    dispatch_once(&+[CIImage noiseImagePadded]::onceToken, &__block_literal_global_314);
  return (id)+[CIImage noiseImagePadded]::noiseImage;
}

CIImage *__27__CIImage_noiseImagePadded__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  CIImage *result;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 268320);
  v1 = objc_msgSend(v0, "mutableBytes");
  srandom(0x2Au);
  v2 = 0;
  v3 = v1 + 1044;
  do
  {
    v4 = 0;
    ++v2;
    do
      *(_BYTE *)(v3 + v4++) = random();
    while (v4 != 1024);
    v3 += 1040;
  }
  while (v2 != 256);
  for (i = 0; i != 266240; i += 1040)
  {
    v6 = v1 + i;
    *(_DWORD *)(v6 + 1040) = *(_DWORD *)(v1 + i + 2064);
    *(_DWORD *)(v6 + 2068) = *(_DWORD *)(v1 + i + 1044);
  }
  memcpy((void *)v1, (const void *)(v1 + 266240), 0x410uLL);
  memcpy((void *)(v1 + 267280), (const void *)(v1 + 1040), 0x410uLL);
  v8 = CFSTR("CIImageColorSpace");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  result = -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:options:", v0, 1040, 265, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1), 258.0, 258.0);
  +[CIImage noiseImagePadded]::noiseImage = (uint64_t)result;
  return result;
}

+ (CIImage)emptyImage
{
  unsigned __int8 v2;

  {
    +[CIImage emptyImage]::empty = -[CIImage initWithEmptyClearColor]([CIImage alloc], "initWithEmptyClearColor");
  }
  return (CIImage *)+[CIImage emptyImage]::empty;
}

- (CGAffineTransform)imageTransformForOrientation:(SEL)a3
{
  CGRect v7;

  -[CIImage extent](self, "extent");
  return (CGAffineTransform *)orientationTransform(v7, orientation, retstr);
}

- (CIImage)imageByApplyingOrientation:(int)orientation
{
  _OWORD v5[3];

  if (self)
    -[CIImage imageTransformForOrientation:](self, "imageTransformForOrientation:", *(_QWORD *)&orientation);
  else
    memset(v5, 0, sizeof(v5));
  return -[CIImage imageByApplyingTransform:](self, "imageByApplyingTransform:", v5);
}

- (CGAffineTransform)imageTransformForCGOrientation:(SEL)a3
{
  CGRect v7;

  -[CIImage extent](self, "extent");
  return (CGAffineTransform *)orientationTransform(v7, orientation, retstr);
}

- (CIImage)imageByApplyingCGOrientation:(CGImagePropertyOrientation)orientation
{
  _OWORD v5[3];

  if (self)
    -[CIImage imageTransformForCGOrientation:](self, "imageTransformForCGOrientation:", *(_QWORD *)&orientation);
  else
    memset(v5, 0, sizeof(v5));
  return -[CIImage imageByApplyingTransform:](self, "imageByApplyingTransform:", v5);
}

+ (CIImage)imageWithData:(NSData *)data
{
  return -[CIImage initWithData:options:]([CIImage alloc], "initWithData:options:", data, 0);
}

+ (CIImage)imageWithData:(NSData *)data options:(NSDictionary *)options
{
  return -[CIImage initWithData:options:]([CIImage alloc], "initWithData:options:", data, options);
}

- (CIImage)initWithData:(NSData *)data
{
  return -[CIImage initWithData:options:](self, "initWithData:options:", data, 0);
}

- (CIImage)initWithData:(NSData *)data options:(NSDictionary *)options
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CGImageSourceRef v11;
  CGImageSourceRef v12;
  id v13;
  CIImage *v14;
  CIRAWFilter *v15;
  NSDictionary *v16;
  double v17;
  id v18;
  void *v19;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  if (!data)
    goto LABEL_9;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = *MEMORY[0x1E0CBD2A8];
  if (-[NSDictionary valueForKey:](options, "valueForKey:", *MEMORY[0x1E0CBD2A8]))
    objc_msgSend(v8, "setObject:forKey:", -[NSDictionary valueForKey:](options, "valueForKey:", v9), v9);
  v10 = *MEMORY[0x1E0CBD290];
  if (-[NSDictionary objectForKey:](options, "objectForKey:", *MEMORY[0x1E0CBD290]))
    objc_msgSend(v8, "setObject:forKey:", -[NSDictionary objectForKey:](options, "objectForKey:", v10), v10);
  v11 = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)v8);
  if (v11)
  {
    v12 = v11;
    if (options)
      v13 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageExpandToHDR"));
    else
      v13 = 0;
    if ((v13 == (id)MEMORY[0x1E0C9AAB0] || v13 == &unk_1E2F1B9F8)
      && -[__CFString hasSuffix:]((id)CGImageSourceGetType(v12), "hasSuffix:", CFSTR("raw-image"))
      && (v15 = +[CIRAWFilter filterWithImageData:identifierHint:](CIRAWFilter, "filterWithImageData:identifierHint:", data, CGImageSourceGetType(v12)), (v18 = hdrRawImage(v15, v16, v17)) != 0))
    {
      v19 = v18;
      CFRelease(v12);

      v14 = v19;
    }
    else
    {
      v14 = -[CIImage initWithCGImageSource:index:options:](self, "initWithCGImageSource:index:options:", v12, 0, options);
      CFRelease(v12);
    }
  }
  else
  {
LABEL_9:

    v14 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v14;
}

+ (CIImage)imageWithContentsOfURL:(NSURL *)url
{
  return (CIImage *)objc_msgSend(a1, "imageWithContentsOfURL:options:", url, 0);
}

+ (CIImage)imageWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options
{
  return -[CIImage initWithContentsOfURL:options:]([CIImage alloc], "initWithContentsOfURL:options:", url, options);
}

- (CIImage)initWithContentsOfURL:(NSURL *)url
{
  return -[CIImage initWithContentsOfURL:options:](self, "initWithContentsOfURL:options:", url, 0);
}

- (CIImage)initWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options
{
  void *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  id v10;
  CIImage *v11;
  BOOL v12;
  CIRAWFilter *v13;
  NSDictionary *v14;
  double v15;
  id v16;
  void *v17;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  v8 = CGImageSourceCreateWithURL((CFURLRef)url, 0);
  if (v8)
  {
    v9 = v8;
    if (options)
      v10 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageExpandToHDR"));
    else
      v10 = 0;
    v12 = v10 == (id)MEMORY[0x1E0C9AAB0] || v10 == &unk_1E2F1B9F8;
    if (v12
      && -[__CFString hasSuffix:]((id)CGImageSourceGetType(v9), "hasSuffix:", CFSTR("raw-image"))
      && (v13 = +[CIRAWFilter filterWithImageURL:](CIRAWFilter, "filterWithImageURL:", url),
          (v16 = hdrRawImage(v13, v14, v15)) != 0))
    {
      v17 = v16;
      CFRelease(v9);

      v11 = v17;
    }
    else
    {
      v11 = -[CIImage initWithCGImageSource:index:options:](self, "initWithCGImageSource:index:options:", v9, 0, options);
      CFRelease(v9);
      if (v11)
        (*(void (**)(void *, NSURL *))(*(_QWORD *)v11->_priv + 280))(v11->_priv, url);
    }
  }
  else
  {

    v11 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v11;
}

+ (CIImage)imageWithContentsOfFile:(id)a3
{
  return +[CIImage imageWithContentsOfFile:options:](CIImage, "imageWithContentsOfFile:options:", a3, 0);
}

+ (CIImage)imageWithContentsOfFile:(id)a3 options:(id)a4
{
  return -[CIImage initWithContentsOfFile:options:]([CIImage alloc], "initWithContentsOfFile:options:", a3, a4);
}

- (CIImage)initWithContentsOfFile:(id)a3
{
  return -[CIImage initWithContentsOfFile:options:](self, "initWithContentsOfFile:options:", a3, 0);
}

- (CIImage)initWithContentsOfFile:(id)a3 options:(id)a4
{
  return -[CIImage initWithContentsOfURL:options:](self, "initWithContentsOfURL:options:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3), a4);
}

- (id)_imageByApplyingTransform:(CGAffineTransform *)a3 highQualityDownsample:(Trilean)a4
{
  __int128 v7;
  CI::Image *v9;
  float64x2_t v10;
  float64x2_t v11;
  CI::Image *v12;
  CIImage *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CI::AffineImage *v23;
  CI::Object *v24;
  __int128 v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  CGRect v32;

  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v31.c = v7;
  *(_OWORD *)&v31.tx = *(_OWORD *)&a3->tx;
  if (CGAffineTransformIsIdentity(&v31))
    return self;
  v9 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v10.f64[0] = a3->a;
  v10.f64[1] = a3->c;
  v11 = *(float64x2_t *)&a3->d;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(v10), (int8x16_t)vcgezq_f64(v10)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(v11), (int8x16_t)vcgezq_f64(v11)))))) & 1) != 0)
  {
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CIImage _imageByApplyingTransform:highQualityDownsample:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  v12 = v9;
  if (fabs(vmlad_n_f64(-(a3->b * a3->c), a3->a, v11.f64[0])) >= 1.0e-10)
  {
    v23 = (CI::AffineImage *)operator new();
    v24 = v23;
    if (a4.var0)
    {
      v25 = *(_OWORD *)&a3->c;
      v28 = *(_OWORD *)&a3->a;
      v29 = v25;
      v30 = *(_OWORD *)&a3->tx;
      if (a4.var0 == 1)
        v26 = 121;
      else
        v26 = 110;
      CI::AffineImage::AffineImage(v23, v12, (const CI::Affine *)&v28, v26);
    }
    else
    {
      v27 = *(_OWORD *)&a3->c;
      v28 = *(_OWORD *)&a3->a;
      v29 = v27;
      v30 = *(_OWORD *)&a3->tx;
      CI::AffineImage::AffineImage(v23, v12, (const CI::Affine *)&v28, 0);
    }
    v13 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v24, v28, v29, v30);
    CI::Object::unref(v24);
    return v13;
  }
  v32.origin.x = (*(double (**)(CI::Image *))(*(_QWORD *)v9 + 88))(v9);
  if (!CGRectIsInfinite(v32))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if ((*(unsigned int (**)(CI::Image *))(*(_QWORD *)v12 + 16))(v12) == 9)
    return self;
  return 0;
}

- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&matrix->c;
  v5[0] = *(_OWORD *)&matrix->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&matrix->tx;
  return (CIImage *)-[CIImage _imageByApplyingTransform:highQualityDownsample:](self, "_imageByApplyingTransform:highQualityDownsample:", v5, 0);
}

- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix highQualityDownsample:(BOOL)highQualityDownsample
{
  __int128 v4;
  uint64_t v5;
  _OWORD v7[3];

  v4 = *(_OWORD *)&matrix->c;
  v7[0] = *(_OWORD *)&matrix->a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&matrix->tx;
  if (highQualityDownsample)
    v5 = 1;
  else
    v5 = 255;
  return (CIImage *)-[CIImage _imageByApplyingTransform:highQualityDownsample:](self, "_imageByApplyingTransform:highQualityDownsample:", v7, v5);
}

- (CIImage)imageByClampingToRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CI::Image *v9;
  CI::ClampImage *v10;
  CIImage *v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  if (CGRectIsEmpty(rect))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (CGRectIsInfinite(v12))
    return self;
  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v13))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](self, "extent");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v15 = CGRectIntersection(v14, v17);
  if (CGRectIsEmpty(v15))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v9 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v10 = (CI::ClampImage *)operator new();
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CI::ClampImage::ClampImage(v10, v9, v16);
  v11 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v10);
  CI::Object::unref(v10);
  return v11;
}

- (CIImage)imageByClampingToExtent
{
  -[CIImage extent](self, "extent");
  return -[CIImage imageByClampingToRect:](self, "imageByClampingToRect:");
}

- (CIImage)imageByCompositingOverImage:(CIImage *)dest
{
  _BOOL4 IsEmpty;
  _BOOL4 v6;
  CIImage *v8;
  CGRect v9;
  CGRect v10;

  -[CIImage extent](self, "extent");
  IsEmpty = CGRectIsEmpty(v9);
  -[CIImage extent](dest, "extent");
  v6 = CGRectIsEmpty(v10);
  if (IsEmpty && v6)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (v6)
  {
    v8 = self;
    return v8;
  }
  if (IsEmpty)
  {
    v8 = dest;
    return v8;
  }
  return (CIImage *)-[CIImage filteredImage:keysAndValues:](self, "filteredImage:keysAndValues:", CFSTR("CISourceOverCompositing"), CFSTR("inputBackgroundImage"), dest, 0);
}

- (CIImage)imageByPremultiplyingAlpha
{
  _DWORD *v4;
  uint64_t v5;
  CI::PremultiplyImage *v6;
  CIImage *v7;
  CGRect v8;

  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v8))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)v4 + 16))(v4) == 16)
  {
    if (v4[30] == -1)
    {
      v5 = (*(uint64_t (**)(_DWORD *, _QWORD))(*(_QWORD *)v4 + 48))(v4, 0);
      return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
    }
  }
  else if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)v4 + 128))(v4))
  {
    v5 = (uint64_t)v4;
    return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
  }
  v6 = (CI::PremultiplyImage *)operator new();
  CI::PremultiplyImage::PremultiplyImage(v6, (CI::Image *)v4, 1);
  v7 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v6);
  CI::Object::unref(v6);
  return v7;
}

- (CIImage)imageByUnpremultiplyingAlpha
{
  _DWORD *v4;
  uint64_t v5;
  CI::PremultiplyImage *v6;
  CIImage *v7;
  CGRect v8;

  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v8))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)v4 + 16))(v4) == 16)
  {
    if (v4[30] == 1)
    {
      v5 = (*(uint64_t (**)(_DWORD *, _QWORD))(*(_QWORD *)v4 + 48))(v4, 0);
      return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
    }
  }
  else if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)v4 + 128))(v4))
  {
    v5 = (uint64_t)v4;
    return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
  }
  v6 = (CI::PremultiplyImage *)operator new();
  CI::PremultiplyImage::PremultiplyImage(v6, (CI::Image *)v4, -1);
  v7 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v6);
  CI::Object::unref(v6);
  return v7;
}

- (id)_imageByClampingAlpha
{
  CI::Image *v2;
  CI::ClampToAlphaImage *v3;
  CIImage *v4;

  v2 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v3 = (CI::ClampToAlphaImage *)operator new();
  CI::ClampToAlphaImage::ClampToAlphaImage(v3, v2);
  v4 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v3);
  CI::Object::unref(v3);
  return v4;
}

- (CIImage)imageBySettingAlphaOneInExtent:(CGRect)extent
{
  double height;
  double width;
  double y;
  double x;
  uint64_t *v7;
  CI::Object *v8;
  CIImage *v9;

  height = extent.size.height;
  width = extent.size.width;
  y = extent.origin.y;
  x = extent.origin.x;
  v7 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v8 = (CI::Object *)operator new();
  CI::SwizzleImage::SwizzleImage((uint64_t)v8, v7, 10);
  v9 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v8);
  CI::Object::unref(v8);
  return -[CIImage imageByCroppingToRect:](v9, "imageByCroppingToRect:", x, y, width, height);
}

- (id)_imageByApplyingGamma:(double)a3
{
  CI::Image *v6;
  CI::GammaImage *v7;
  CIImage *v8;
  CGRect v9;

  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v9))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (fabs(a3 + -1.0) < 0.01)
    return self;
  v6 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v7 = (CI::GammaImage *)operator new();
  CI::GammaImage::GammaImage(v7, v6, a3);
  v8 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v7);
  CI::Object::unref(v7);
  return v8;
}

- (CIImage)imageByApplyingGaussianBlurWithSigma:(double)sigma
{
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (sigma < 0.16)
    return self;
  v5 = CFSTR("inputRadius");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  return -[CIImage imageByApplyingFilter:withInputParameters:](self, "imageByApplyingFilter:withInputParameters:", CFSTR("CIGaussianBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (CIImage)imageByColorMatchingWorkingSpaceToColorSpace:(CGColorSpaceRef)colorSpace
{
  CIImage *v3;
  CGColorSpace *v5;
  CGColorSpace *v7;
  CGColorSpace *v8;
  CGColorSpace *v9;
  uint64_t v10;
  CGColorSpace *v11;
  CI::ColorMatchImage *v12;
  CIImage *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGRect v22;

  v3 = self;
  if (!colorSpace)
    return self;
  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v22))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((_BOOL8)colorSpace, v5))
  {
    v7 = -[CIImage baseColorSpace](v3, "baseColorSpace");
    if (!CI_NO_CM()
      && CI::ColorSpace_is_HDR(v7, v8)
      && (CI::ColorSpace_is_HDR(colorSpace, v9) & 1) == 0
      && !CGColorSpaceUsesExtendedRange(colorSpace))
    {
      v3 = -[CIImage imageByToneMappingColorSpaceToWorkingSpace:](-[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v3, "imageByColorMatchingWorkingSpaceToColorSpace:", v7), "imageByToneMappingColorSpaceToWorkingSpace:", v7);
    }
    v10 = -[CIImage _internalRepresentation](v3, "_internalRepresentation");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10) == 4
      && *(_BYTE *)(v10 + 137)
      && ((v11 = *(CGColorSpace **)(v10 + 120), v11 == colorSpace) || v11 && CFEqual(colorSpace, v11))
      && !*(_BYTE *)(v10 + 138))
    {
      return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v10 + 48))(v10, 0));
    }
    else
    {
      v12 = (CI::ColorMatchImage *)operator new();
      CI::ColorMatchImage::ColorMatchImage(v12, (CI::Image *)v10, colorSpace);
      v13 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v12);
      CI::Object::unref(v12);
      return v13;
    }
  }
  else
  {
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
}

- (id)imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:(CGColorSpace *)a3
{
  CGColorSpace **v5;
  CGColorSpace *v6;
  CI::ColorMatchImage *v7;
  CIImage *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    return self;
  if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((_BOOL8)a3, (CGColorSpace *)a2))
  {
    v5 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    if ((*((unsigned int (**)(CGColorSpace **))*v5 + 2))(v5) == 4
      && *((_BYTE *)v5 + 137)
      && ((v6 = v5[15], v6 == a3) || v6 && CFEqual(a3, v6))
      && !*((_BYTE *)v5 + 138))
    {
      return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", (*((uint64_t (**)(CGColorSpace **, _QWORD))*v5 + 6))(v5, 0));
    }
    else
    {
      v7 = (CI::ColorMatchImage *)operator new();
      CI::ColorMatchImage::ColorMatchImage(v7, (CI::Image *)v5, a3);
      v8 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v7);
      CI::Object::unref(v7);
      return v8;
    }
  }
  else
  {
    v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CIImage imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    return 0;
  }
}

- (CIImage)imageByColorMatchingColorSpaceToWorkingSpace:(CGColorSpaceRef)colorSpace
{
  CGColorSpace **v5;
  char v6;
  char v7;
  CGColorSpace *v8;
  char v9;
  CI::ColorMatchImage *v10;
  CIImage *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!colorSpace)
    return self;
  if ((CI::ColorSpace_is_RGB_or_Gray(colorSpace, (CGColorSpace *)a2) & 1) != 0)
  {
    v5 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    if ((*((unsigned int (**)(CGColorSpace **))*v5 + 2))(v5) == 4
      && (v6 = CGColorSpaceContainsFlexGTCInfo(), *((_BYTE *)v5 + 136))
      && ((v7 = v6, v8 = v5[16], v8 == colorSpace) || v8 && CFEqual(colorSpace, v8))
      && (*((_BYTE *)v5 + 138) ? (v9 = 1) : (v9 = v7), (v9 & 1) == 0))
    {
      return +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", (*((uint64_t (**)(CGColorSpace **, _QWORD))*v5 + 6))(v5, 0));
    }
    else
    {
      v10 = (CI::ColorMatchImage *)operator new();
      CI::ColorMatchImage::ColorMatchImage(v10, (CI::Image *)v5, colorSpace, 0);
      v11 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v10);
      CI::Object::unref(v10);
      return v11;
    }
  }
  else
  {
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    return 0;
  }
}

- (id)_imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3 targetHeadroom:(float)a4
{
  CGColorSpace *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CI::Image *v26;
  CI::ColorMatchImage *v27;
  CIImage *v28;

  if (!a3)
    return self;
  if (!CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2)
    || (CI::ColorSpace_is_HDR(a3, v7) & 1) == 0)
  {
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CIImage _imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  if (a4 < 1.0 || a4 > 16.0)
  {
    v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CIImage _imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  v26 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v27 = (CI::ColorMatchImage *)operator new();
  CI::ColorMatchImage::ColorMatchImage(v27, v26, a3, a4);
  v28 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v27);
  CI::Object::unref(v27);
  return v28;
}

- (id)imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3
{
  CGColorSpace *v5;
  CI::Image *v6;
  CI::ColorMatchImage *v7;
  CIImage *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    return self;
  if (CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2)
    && (CI::ColorSpace_is_HDR(a3, v5) & 1) != 0)
  {
    v6 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    v7 = (CI::ColorMatchImage *)operator new();
    CI::ColorMatchImage::ColorMatchImage(v7, v6, a3, 1);
    v8 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v7);
    CI::Object::unref(v7);
    return v8;
  }
  else
  {
    v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CIImage imageByToneMappingColorSpaceToWorkingSpace:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    return 0;
  }
}

- (id)imageByTaggingWithColorSpace:(CGColorSpace *)a3
{
  CI::Image *v5;
  CI::TagColorSpaceImage *v6;
  CIImage *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 && (CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2) & 1) == 0)
  {
    v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CIImage imageByTaggingWithColorSpace:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  else
  {
    v5 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    v6 = (CI::TagColorSpaceImage *)operator new();
    CI::TagColorSpaceImage::TagColorSpaceImage(v6, v5, a3);
    v7 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v6);
    CI::Object::unref(v6);
    return v7;
  }
}

- (id)_imageByApplyingColorMatrixRed:(CIImage *)self green:(SEL)a2 blue:bias:
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  const double (*v7)[4];
  CIImage *v9;
  CI::Image *v10;
  CI::ColorMatrixImage *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  double v17;
  uint64_t v18;
  float64x2_t v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  float64x2_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v28;

  v14 = v4;
  v15 = v5;
  v12 = v2;
  v13 = v3;
  v27 = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v28))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v16[0] = vcvtq_f64_f32(*(float32x2_t *)&v12);
  *(double *)&v16[1] = *((float *)&v12 + 2);
  *((_QWORD *)&v16[1] + 1) = 0;
  v16[2] = vcvtq_f64_f32(*(float32x2_t *)&v13);
  v17 = *((float *)&v13 + 2);
  v18 = 0;
  v19 = vcvtq_f64_f32(*(float32x2_t *)&v14);
  v20 = *((float *)&v14 + 2);
  v21 = 0;
  v22 = xmmword_192495498;
  v23 = unk_1924954A8;
  v24 = vcvtq_f64_f32(*(float32x2_t *)&v15);
  v25 = *((float *)&v15 + 2);
  v26 = 0;
  if (CI::ColorMatrixImage::is_identity((CI::ColorMatrixImage *)v16, v7))
    return self;
  v10 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v11 = (CI::ColorMatrixImage *)operator new();
  CI::ColorMatrixImage::ColorMatrixImage(v11, v10, (const double (*)[4])v16);
  v9 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v11);
  CI::Object::unref(v11);
  return v9;
}

- (CIImage)imageByInsertingIntermediate
{
  Trilean v2;

  v2.var0 = 0;
  return implRenderToIntermediate(self, v2, 1);
}

- (CIImage)imageByInsertingIntermediate:(BOOL)cache
{
  Trilean v3;

  if (cache)
    v3.var0 = 1;
  else
    v3.var0 = -1;
  return implRenderToIntermediate(self, v3, cache);
}

- (id)_imageByRenderingToIntermediate
{
  Trilean v2;

  v2.var0 = 0;
  return implRenderToIntermediate(self, v2, 0);
}

- (CIImage)imageBySettingProperties:(NSDictionary *)properties
{
  NSArray *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  CFTypeID v12;
  const __CFDictionary *v13;
  CI::Image *v14;
  CI::SetPropsImage *v15;
  CIImage *v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSDictionary allValues](properties, "allValues");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)MEMORY[0x194026220]();
    v8 = -[NSArray count](v5, "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", i);
        v12 = CFGetTypeID(v11);
        if (v12 != CGImageMetadataGetTypeID() && v12 != CGColorSpaceGetTypeID() && v12 != CGColorGetTypeID())
          v11 = (id)objc_msgSend(v11, "copy");
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v11, i);
      }
    }
    objc_autoreleasePoolPop(v7);
    v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v6, -[NSDictionary allKeys](properties, "allKeys"));
    v14 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    v15 = (CI::SetPropsImage *)operator new();
    CI::SetPropsImage::SetPropsImage(v15, v14, v13);
    v16 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v15);
    CI::Object::unref(v15);
    return v16;
  }
  else
  {
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIImage imageBySettingProperties:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    return self;
  }
}

- (id)imageBySettingPropertiesNoCopy:(id)a3
{
  const __CFDictionary *v5;
  CI::Image *v6;
  CI::SetPropsImage *v7;
  CIImage *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (const __CFDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", a3, 0);
    v6 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
    v7 = (CI::SetPropsImage *)operator new();
    CI::SetPropsImage::SetPropsImage(v7, v6, v5);
    v8 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v7);
    CI::Object::unref(v7);
    return v8;
  }
  else
  {
    v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CIImage imageBySettingPropertiesNoCopy:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    return self;
  }
}

- (CIImage)imageBySamplingNearest
{
  uint64_t *v4;
  CI::Object *v5;
  CIImage *v6;
  CGRect v7;

  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v7))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v5 = (CI::Object *)operator new();
  CI::SampleModeImage::SampleModeImage((uint64_t)v5, v4, 0);
  v6 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
  CI::Object::unref(v5);
  return v6;
}

- (CIImage)imageBySamplingLinear
{
  uint64_t *v4;
  CI::Object *v5;
  CIImage *v6;
  CGRect v7;

  -[CIImage extent](self, "extent");
  if (CGRectIsEmpty(v7))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
  v5 = (CI::Object *)operator new();
  CI::SampleModeImage::SampleModeImage((uint64_t)v5, v4, 1);
  v6 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v5);
  CI::Object::unref(v5);
  return v6;
}

+ (id)imageForRenderingWithMetal:(id)a3 orNonMetal:(id)a4
{
  return -[CIImage initForRenderingWithMetal:orNonMetal:]([CIImage alloc], "initForRenderingWithMetal:orNonMetal:", a3, a4);
}

- (id)initForRenderingWithMetal:(id)a3 orNonMetal:(id)a4
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2), &__block_literal_global_326);
}

uint64_t __48__CIImage_initForRenderingWithMetal_orNonMetal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("kContextInfoIsMetal")), "BOOLValue");
}

+ (id)imageForRenderingWithMPS:(id)a3 orNonMPS:(id)a4
{
  return -[CIImage initForRenderingWithMPS:orNonMPS:]([CIImage alloc], "initForRenderingWithMPS:orNonMPS:", a3, a4);
}

- (id)initForRenderingWithMPS:(id)a3 orNonMPS:(id)a4
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a4;
  v5[1] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2), &__block_literal_global_329);
}

uint64_t __44__CIImage_initForRenderingWithMPS_orNonMPS___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("kContextInfoSupportsMPS")), "BOOLValue");
}

+ (id)imageForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5
{
  return -[CIImage initForRenderingWithMetalContext:orOpenGLContextUsingMetal:orNonMetalContext:]([CIImage alloc], "initForRenderingWithMetalContext:orOpenGLContextUsingMetal:orNonMetalContext:", a3, a4, a5);
}

- (id)initForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = a5;
  v6[1] = a4;
  v6[2] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3), &__block_literal_global_332);
}

uint64_t __88__CIImage_initForRenderingWithMetalContext_orOpenGLContextUsingMetal_orNonMetalContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  const char *v4;
  const void *v5;

  if ((objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("kContextInfoIsMetal")), "BOOLValue") & 1) != 0)
    return 0;
  v3 = CIMetalCopyDefaultDevice();
  if (!v3)
    return 2;
  v5 = v3;
  if (CIMetalDeviceIsSupported(v3, v4))
    v2 = 1;
  else
    v2 = 2;
  CFRelease(v5);
  return v2;
}

+ (CIImage)imageWithArrayOfImages:(id)a3 selector:(id)a4
{
  return -[CIImage initWithArrayOfImages:selector:]([CIImage alloc], "initWithArrayOfImages:selector:", a3, a4);
}

- (CIImage)initWithArrayOfImages:(id)a3 selector:(id)a4
{
  int v7;
  CI::SerialObjectPtrArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CI::Object *v12;
  CIImage *v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (objc_msgSend(a3, "count"))
  {
    v7 = objc_msgSend(a3, "count");
    v8 = (CI::SerialObjectPtrArray *)operator new();
    CI::SerialObjectPtrArray::SerialObjectPtrArray(v8, v7);
    if (v7 < 1)
    {
LABEL_6:
      v12 = (CI::Object *)operator new();
      CI::SwitchImage::SwitchImage(v12, v8, a4);
      v13 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v12);
      CI::Object::unref(v12);
      return v13;
    }
    v9 = 0;
    v10 = v7;
    while (1)
    {
      v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      CI::SerialObjectPtrArray::append((uint64_t)v8, (CI::Object *)objc_msgSend(v11, "_internalRepresentation"));
      if (v10 == ++v9)
        goto LABEL_6;
    }
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIImage initWithArrayOfImages:selector:].cold.1(v9, v15, v16, v17, v18, v19, v20, v21);
    CI::SerialObjectPtrArray::~SerialObjectPtrArray(v8);
    MEMORY[0x194025AAC]();
  }

  return 0;
}

- (CIFilterShape)definition
{
  -[CIImage extent](self, "extent");
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:");
}

void __18__CIImage_dealloc__block_invoke_2(uint64_t a1)
{
  CI::Object *v1;

  v1 = *(CI::Object **)(a1 + 32);
  if (v1)
    CI::Object::unref(v1);
}

- (id)description
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;
  CGRect v13;

  -[CIImage extent](self, "extent");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsInfinite(v12))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIImage: %p extent [infinite]>"), self, v8, v9, v10, v11);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectIsEmpty(v13))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIImage: %p extent [empty]>"), self, v8, v9, v10, v11);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIImage: %p extent [%g %g %g %g]>"), self, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__CIImage_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __27__CIImage_debugDescription__block_invoke(uint64_t a1, __sFILE *a2)
{
  _QWORD *v3;
  CI::Image *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v10;
  CGRect v11;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (CI::Image *)v3[1];
  objc_msgSend(v3, "extent");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  if (CGRectIsInfinite(v10))
  {
    fprintf(a2, "<CIImage: %p extent [infinite]>\n");
  }
  else
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (CGRectIsEmpty(v11))
      fprintf(a2, "<CIImage: %p extent [empty]>\n");
    else
      fprintf(a2, "<CIImage: %p extent [%g %g %g %g]>\n");
  }
  return CI::Image::print_graph(v4, a2);
}

- (NSDictionary)properties
{
  return (NSDictionary *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 200))(self->_priv);
}

- (float)contentHeadroom
{
  float result;

  (*(void (**)(void *))(*(_QWORD *)self->_priv + 232))(self->_priv);
  return result;
}

- (float)headroom
{
  float result;

  (*(void (**)(void *))(*(_QWORD *)self->_priv + 232))(self->_priv);
  return result;
}

- (float)_makernoteMeteorHeadroom
{
  NSDictionary *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v13;

  v2 = -[CIImage properties](self, "properties");
  v3 = -[NSDictionary valueForKeyPath:](v2, "valueForKeyPath:", CFSTR("{MakerApple}.33"));
  if (!v3)
    return NAN;
  v4 = (void *)v3;
  v5 = -[NSDictionary valueForKeyPath:](v2, "valueForKeyPath:", CFSTR("{MakerApple}.48"));
  if (!v5)
    return NAN;
  v6 = (void *)v5;
  objc_msgSend(v4, "floatValue");
  v8 = v7;
  objc_msgSend(v6, "floatValue");
  if (v8 >= 1.0)
  {
    if (v9 <= 0.01)
    {
      v13 = (float)(v9 * -70.0) + 3.0;
      return exp2f(v13);
    }
    v10 = 2.303;
    v11 = -0.303;
  }
  else if (v9 <= 0.01)
  {
    v10 = 1.8;
    v11 = -20.0;
  }
  else
  {
    v10 = 1.601;
    v11 = -0.101;
  }
  v13 = v10 + (float)(v9 * v11);
  return exp2f(v13);
}

- (CGColorSpaceRef)colorSpace
{
  return (CGColorSpaceRef)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 240))(self->_priv);
}

- (CGColorSpace)baseColorSpace
{
  return (CGColorSpace *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 248))(self->_priv);
}

- (BOOL)isOpaque
{
  return (*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 128))(self->_priv);
}

- (int)outputFormat
{
  return (*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 144))(self->_priv);
}

- (NSURL)url
{
  return (NSURL *)objc_autorelease(objc_retain((id)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_priv
                                                                                          + 272))(self->_priv, a2)));
}

- (void)setUserInfo:(id)a3
{
  (*(void (**)(void *, id))(*(_QWORD *)self->_priv + 296))(self->_priv, a3);
}

- (id)userInfo
{
  return (id)(*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_priv + 288))(self->_priv, a2);
}

- (BOOL)cacheHint
{
  return 0;
}

- (unint64_t)digest
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[10];
  else
    return 0;
}

- (unint64_t)recipeDigest
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[11];
  else
    return 0;
}

- (id)filteredImage:(id)a3 keysAndValues:(id)a4
{
  void *v7;
  CIFilter *v8;
  CIFilter *v9;
  id *v10;
  CIImage *v11;
  uint64_t *v13;
  uint64_t v14;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  v8 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", a3);
  if (v8)
  {
    v9 = v8;
    -[CIFilter setValue:forKey:](v8, "setValue:forKey:", self, CFSTR("inputImage"));
    v13 = &v14;
    if (a4)
    {
      do
      {
        -[CIFilter setValue:forKey:](v9, "setValue:forKey:", *v13, a4);
        v10 = (id *)(v13 + 1);
        v13 += 2;
        a4 = *v10;
      }
      while (*v10);
    }
    v11 = -[CIFilter outputImage](v9, "outputImage");
    objc_autoreleasePoolPop(v7);
    return v11;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (CIImage)imageByApplyingFilter:(NSString *)filterName withInputParameters:(NSDictionary *)params
{
  void *v7;
  CIFilter *v8;
  CIFilter *v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  CIImage *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x194026220](self, a2);
  v8 = +[CIFilter filterWithName:setDefaults:](CIFilter, "filterWithName:setDefaults:", filterName, 1);
  if (v8)
  {
    v9 = v8;
    if (-[NSDictionary objectForKey:](-[CIFilter attributes](v8, "attributes"), "objectForKey:", CFSTR("inputImage")))
      -[CIFilter setValue:forKey:](v9, "setValue:forKey:", self, CFSTR("inputImage"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](params, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(params);
          -[CIFilter setValue:forKey:](v9, "setValue:forKey:", -[NSDictionary objectForKey:](params, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13)), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](params, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
    v14 = -[CIFilter outputImage](v9, "outputImage");
    objc_autoreleasePoolPop(v7);
    return v14;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (CIImage)imageByApplyingFilter:(NSString *)filterName
{
  return -[CIImage imageByApplyingFilter:withInputParameters:](self, "imageByApplyingFilter:withInputParameters:", filterName, 0);
}

- (void)writeToTIFF:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  CGRect v8;

  v5 = +[CIContext _singletonContext](CIContext, "_singletonContext");
  -[CIImage extent](self, "extent");
  CGRectIsInfinite(v8);
  v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v7 = objc_msgSend(v5, "workingColorSpace");
  objc_msgSend(v5, "writeTIFFRepresentationOfImage:toURL:format:colorSpace:options:error:", self, v6, 2056, v7, MEMORY[0x1E0C9AA70], 0);
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  CGImage *v9;
  CGImage *v10;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  uint64_t BitmapInfo;
  _BOOL8 ShouldInterpolate;
  CGDataProvider *DataProvider;
  CFDataRef v19;
  CFDataRef v20;
  CGColorRenderingIntent RenderingIntent;
  CGRect v22;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v5 = CFSTR("CIRequiresKeyedArchiver");
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = CFSTR("CoreImage doesn't support old-style archiving");
    goto LABEL_5;
  }
  -[CIImage extent](self, "extent");
  if (CGRectIsInfinite(v22))
  {
    v5 = CFSTR("CIImageEncoder");
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = CFSTR("CoreImage doesn't support archiving infinite images.");
LABEL_5:
    objc_msgSend(v6, "raise:format:", v5, v7);
    return;
  }
  v8 = +[CIContext _singletonContext](CIContext, "_singletonContext");
  -[CIImage extent](self, "extent");
  v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", self);
  if (v9)
  {
    v10 = v9;
    Width = CGImageGetWidth(v9);
    Height = CGImageGetHeight(v10);
    BitsPerComponent = CGImageGetBitsPerComponent(v10);
    BitsPerPixel = CGImageGetBitsPerPixel(v10);
    BytesPerRow = CGImageGetBytesPerRow(v10);
    BitmapInfo = CGImageGetBitmapInfo(v10);
    ShouldInterpolate = CGImageGetShouldInterpolate(v10);
    RenderingIntent = CGImageGetRenderingIntent(v10);
    DataProvider = CGImageGetDataProvider(v10);
    if (DataProvider)
    {
      v19 = CGDataProviderCopyData(DataProvider);
      if (v19)
      {
        v20 = v19;
        objc_msgSend(a3, "encodeObject:forKey:", v19, CFSTR("CICGImageData"));
        objc_msgSend(a3, "encodeInt:forKey:", Width, CFSTR("CICGImageWidth"));
        objc_msgSend(a3, "encodeInt:forKey:", Height, CFSTR("CICGImageHeight"));
        objc_msgSend(a3, "encodeInt:forKey:", BitsPerComponent, CFSTR("CICGImageBPC"));
        objc_msgSend(a3, "encodeInt:forKey:", BitsPerPixel, CFSTR("CICGImageBPP"));
        objc_msgSend(a3, "encodeInt:forKey:", BytesPerRow, CFSTR("CICGImageBPR"));
        objc_msgSend(a3, "encodeInt:forKey:", BitmapInfo, CFSTR("CICGImageAlphaInfo"));
        objc_msgSend(a3, "encodeBool:forKey:", ShouldInterpolate, CFSTR("CICGImageInterp"));
        objc_msgSend(a3, "encodeInt:forKey:", RenderingIntent, CFSTR("CICGImageRI"));
        CFRelease(v20);
      }
    }
    CGImageRelease(v10);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIImage)initWithCoder:(id)a3
{
  const __CFData *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  CGBitmapInfo v10;
  char shouldInterpolate;
  CGColorRenderingIntent intent;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v14;
  CGImage *v15;
  int v17;
  size_t v18;
  objc_super v19;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    goto LABEL_26;
  v19.receiver = self;
  v19.super_class = (Class)CIImage;
  self = -[CIImage init](&v19, sel_init);
  if (!self)
    return self;
  if (!objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageData")))
    goto LABEL_26;
  v5 = (const __CFData *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CICGImageData"));
  v6 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageWidth"));
  v7 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageHeight"));
  v8 = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageBPC"))
     ? (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageBPC"))
     : 8;
  v18 = v8;
  v9 = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageBPP"))
     ? objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageBPP"))
     : 32;
  v17 = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageBPR"))
      ? objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageBPR"))
      : (v9 >> 3) * v6;
  v10 = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageAlphaInfo"))
      ? objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageAlphaInfo"))
      : 2;
  shouldInterpolate = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageInterp"))
                    ? objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CICGImageInterp"))
                    : 1;
  intent = objc_msgSend(a3, "containsValueForKey:", CFSTR("CICGImageRI"))
         ? objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICGImageRI"))
         : kCGRenderingIntentDefault;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = CGDataProviderCreateWithCFData(v5);
  v15 = CGImageCreate(v6, v7, v18, v9, v17, DeviceRGB, v10, v14, 0, shouldInterpolate, intent);
  CGDataProviderRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  if (!v15)
  {
LABEL_26:

    return 0;
  }
  self = -[CIImage initWithCGImage:](self, "initWithCGImage:", v15);
  CGImageRelease(v15);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CIUserInfo"))
    && -[CIImage initWithCoder:]::onceToken != -1)
  {
    dispatch_once(&-[CIImage initWithCoder:]::onceToken, &__block_literal_global_363);
  }
  return self;
}

void __25__CIImage_initWithCoder___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __25__CIImage_initWithCoder___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)printTree
{
  FILE *v3;
  _QWORD v4[5];

  v3 = (FILE *)CI_LOG_FILE();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__CIImage_printTree__block_invoke;
  v4[3] = &unk_1E2EC2F58;
  v4[4] = self;
  stream_to_file(v3, (uint64_t)v4);
}

size_t __20__CIImage_printTree__block_invoke(uint64_t a1, FILE *a2)
{
  CI::Image *v3;

  v3 = *(CI::Image **)(*(_QWORD *)(a1 + 32) + 8);
  fprintf(a2, "<CIImage: %p> printTree:\n", *(const void **)(a1 + 32));
  CI::Image::print_graph(v3, a2);
  return fwrite("\n\n", 2uLL, 1uLL, a2);
}

- (id)TIFFRepresentation
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  id v9;
  CGColorSpace *DeviceRGB;
  CGImage *v11;
  __CFData *v12;
  CGImageDestination *v13;
  CGImageDestination *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  CGRect v20;
  CGRect v21;

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x194026220](self, a2);
  -[CIImage extent](self, "extent");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsEmpty(v20))
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectIsInfinite(v21))
  {
    height = 1024.0;
    width = 1024.0;
    y = 0.0;
    x = 0.0;
  }
  v9 = +[CIContext _singletonContext](CIContext, "_singletonContext", 0.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:format:colorSpace:", self, 265, DeviceRGB, x, y, width, height);
  CGColorSpaceRelease(DeviceRGB);
  if (v11)
  {
    v12 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v18 = *MEMORY[0x1E0CBD090];
    v16 = *MEMORY[0x1E0CBD078];
    v17 = &unk_1E2F1B9E0;
    v19[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = CGImageDestinationCreateWithData(v12, CFSTR("public.tiff"), 1uLL, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
    if (v13)
    {
      v14 = v13;
      CGImageDestinationAddImage(v13, v11, 0);
      v15 = CGImageDestinationFinalize(v14);
      CFRelease(v14);
      CGImageRelease(v11);
      if (v15)
        goto LABEL_12;
    }
    else
    {
      CGImageRelease(v11);
    }

  }
  v12 = 0;
LABEL_12:
  objc_autoreleasePoolPop(v3);
  return v12;
}

- (CGRect)regionOfInterestForImage:(CIImage *)image inRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD *v30;
  CI::Image *v31;
  CI::Image *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  double *v36;
  unint64_t v37;
  double *v38;
  unint64_t v39;
  BOOL v40;
  _QWORD *v41;
  int v42;
  _QWORD *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect result;
  CGRect v62;
  CGRect v63;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  if (!CGRectIsEmpty(rect))
  {
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v52 = CGRectInset(v51, 0.001, 0.001);
    v53 = CGRectIntegral(v52);
    v10 = v53.origin.x;
    v11 = v53.origin.y;
    v12 = v53.size.width;
    v13 = v53.size.height;
    -[CIImage extent](self, "extent");
    v62.origin.x = v14;
    v62.origin.y = v15;
    v62.size.width = v16;
    v62.size.height = v17;
    v54.origin.x = v10;
    v54.origin.y = v11;
    v54.size.width = v12;
    v54.size.height = v13;
    v55 = CGRectIntersection(v54, v62);
    v18 = v55.origin.x;
    v19 = v55.origin.y;
    v20 = v55.size.width;
    v21 = v55.size.height;
    if (!CGRectIsEmpty(v55))
    {
      v30 = -[CIImage _internalRepresentation](image, "_internalRepresentation");
      v31 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
      while ((*(unsigned int (**)(_QWORD *))(*v30 + 16))(v30) == 16
           || (*(unsigned int (**)(_QWORD *))(*v30 + 16))(v30) == 4)
        v30 = (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD))(*v30 + 48))(v30, 0);
      v56.origin.x = v18;
      v56.origin.y = v19;
      v56.size.width = v20;
      v56.size.height = v21;
      v33 = CI::Image::BuildMapToUnionRoi(v31, v32, v56);
      v34 = v33;
      v22 = *MEMORY[0x1E0C9D628];
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v36 = (double *)(v33 + 8);
      v35 = *(_QWORD **)(v33 + 8);
      if (v35)
      {
        v37 = v30[10];
        v38 = (double *)(v33 + 8);
        do
        {
          v39 = v35[4];
          v40 = v39 >= v37;
          if (v39 >= v37)
            v41 = v35;
          else
            v41 = v35 + 1;
          if (v40)
            v38 = (double *)v35;
          v35 = (_QWORD *)*v41;
        }
        while (*v41);
        if (v38 == v36 || v37 < *((_QWORD *)v38 + 4))
        {
          if (!v33)
            goto LABEL_4;
          v42 = 0;
        }
        else
        {
          v44 = v38[5];
          v45 = v38[6];
          v46 = v38[7];
          v47 = v38[8];
          v63.origin.x = (*(double (**)(_QWORD *))(*v30 + 88))(v30);
          v63.origin.y = v48;
          v63.size.width = v49;
          v63.size.height = v50;
          v57.origin.x = v44;
          v57.origin.y = v45;
          v57.size.width = v46;
          v57.size.height = v47;
          v58 = CGRectIntersection(v57, v63);
          v22 = v58.origin.x;
          v23 = v58.origin.y;
          v24 = v58.size.width;
          v25 = v58.size.height;
          if (!v34)
            goto LABEL_27;
          v42 = 1;
        }
        v43 = *(_QWORD **)v36;
      }
      else
      {
        v43 = 0;
        v42 = 0;
      }
      std::__tree<std::__value_type<unsigned long long,CI::DAGHelper::ImageArgInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CI::DAGHelper::ImageArgInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CI::DAGHelper::ImageArgInfo>>>::destroy(v34, v43);
      MEMORY[0x194025AAC](v34, 0x1020C4062D53EE8);
      if (!v42)
        goto LABEL_4;
LABEL_27:
      v59.origin.x = v22;
      v59.origin.y = v23;
      v59.size.width = v24;
      v59.size.height = v25;
      v60 = CGRectIntegral(v59);
      v22 = v60.origin.x;
      v23 = v60.origin.y;
      v24 = v60.size.width;
      v25 = v60.size.height;
      goto LABEL_4;
    }
  }
  v22 = *MEMORY[0x1E0C9D628];
  v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_4:
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  NSObject *v4;

  v4 = ci_logger_api();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CIImage setValue:forKeyPath:].cold.1();
}

- (CIImage)initWithDepthData:(AVDepthData *)data options:(NSDictionary *)options
{
  void *v7;
  void *v8;
  void *v9;

  if (data && (v7 = AVFDepthDataMap(data, a2)) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
    objc_msgSend(v9, "setValue:forKey:", data, CFSTR("kCIImageAVDepthData"));
    return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v8, v9);
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithDepthData:(AVDepthData *)data
{
  return -[CIImage initWithDepthData:options:](self, "initWithDepthData:options:", data, 0);
}

+ (CIImage)imageWithDepthData:(AVDepthData *)data options:(NSDictionary *)options
{
  return -[CIImage initWithDepthData:options:]([CIImage alloc], "initWithDepthData:options:", data, options);
}

+ (CIImage)imageWithDepthData:(AVDepthData *)data
{
  return -[CIImage initWithDepthData:options:]([CIImage alloc], "initWithDepthData:options:", data, 0);
}

- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options
{
  void *v7;
  void *v8;
  void *v9;

  if (matte && (v7 = AVFPortraitEffectsMatteImage(matte, a2)) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
    objc_msgSend(v9, "setValue:forKey:", matte, CFSTR("kCIImageAVPortraitEffectsMatte"));
    return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v8, v9);
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte
{
  return -[CIImage initWithPortaitEffectsMatte:options:](self, "initWithPortaitEffectsMatte:options:", matte, 0);
}

+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options
{
  return -[CIImage initWithPortaitEffectsMatte:options:]([CIImage alloc], "initWithPortaitEffectsMatte:options:", matte, options);
}

+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte
{
  return -[CIImage initWithPortaitEffectsMatte:options:]([CIImage alloc], "initWithPortaitEffectsMatte:options:", matte, 0);
}

- (CIImage)initWithPortraitEffectsMatte:(id)a3
{
  return -[CIImage initWithPortraitEffectsMatte:options:](self, "initWithPortraitEffectsMatte:options:", a3, 0);
}

+ (CIImage)imageWithPortraitEffectsMatte:(id)a3 options:(id)a4
{
  return -[CIImage initWithPortraitEffectsMatte:options:]([CIImage alloc], "initWithPortraitEffectsMatte:options:", a3, a4);
}

+ (CIImage)imageWithPortraitEffectsMatte:(id)a3
{
  return -[CIImage initWithPortraitEffectsMatte:options:]([CIImage alloc], "initWithPortraitEffectsMatte:options:", a3, 0);
}

- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options
{
  void *v7;
  void *v8;
  void *v9;

  if (matte && (v7 = AVSemanticSegmentationMatteImage(matte, a2)) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
    objc_msgSend(v9, "setValue:forKey:", matte, CFSTR("kCIImageAVSemanticSegmentationMatte"));
    return -[CIImage initWithCVPixelBuffer:options:](self, "initWithCVPixelBuffer:options:", v8, v9);
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte
{
  return -[CIImage initWithSemanticSegmentationMatte:options:](self, "initWithSemanticSegmentationMatte:options:", matte, 0);
}

+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options
{
  return -[CIImage initWithSemanticSegmentationMatte:options:]([CIImage alloc], "initWithSemanticSegmentationMatte:options:", matte, options);
}

+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte
{
  return -[CIImage initWithSemanticSegmentationMatte:options:]([CIImage alloc], "initWithSemanticSegmentationMatte:options:", matte, 0);
}

- (CIImage)imageByConvertingWorkingSpaceToLab
{
  CIColorKernel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_RGBtoLAB);
  -[CIImage extent](self, "extent");
  v9[0] = self;
  return (CIImage *)-[CIImage imageByTaggingWithColorSpace:](-[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), v4, v5, v6, v7), "imageByTaggingWithColorSpace:", 0);
}

- (CIImage)imageByConvertingLabToWorkingSpace
{
  CIColorKernel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_LABtoRGB);
  -[CIImage extent](self, "extent");
  v9[0] = self;
  return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), v4, v5, v6, v7);
}

+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4
{
  return -[CIImage initWithAttributedString:format:options:]([CIImage alloc], "initWithAttributedString:format:options:", a3, *(_QWORD *)&a4, 0);
}

+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4 options:(id)a5
{
  return -[CIImage initWithAttributedString:format:options:]([CIImage alloc], "initWithAttributedString:format:options:", a3, *(_QWORD *)&a4, a5);
}

- (CIImage)initWithAttributedString:(id)a3 format:(int)a4
{
  return -[CIImage initWithAttributedString:format:options:](self, "initWithAttributedString:format:options:", a3, *(_QWORD *)&a4, 0);
}

- (CIImage)initWithAttributedString:(id)a3 format:(int)a4 options:(id)a5
{
  uint64_t v6;
  CGColorSpace *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  const char *v14;
  float v15;
  int v16;
  int v17;
  const __CTFramesetter *v18;
  CFIndex v19;
  CGSize v20;
  double width;
  const __CTLine *v22;
  double x;
  CGFloat y;
  CGFloat v25;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  const CGPath *v30;
  CTFrameRef Frame;
  const __CTFrame *v32;
  void *v33;
  id v34;
  CFDataRef v35;
  CGColorSpaceRef DeviceGray;
  double v37;
  int v38;
  CIImage *v39;
  _QWORD v41[7];
  int v42;
  int v43;
  float v44;
  float v45;
  unsigned int v46;
  const __CFString *v47;
  _QWORD v48[3];
  CFRange v49;
  CFRange v50;
  CGSize v51;
  CGRect BoundsWithOptions;
  CGRect v53;
  CGRect v54;

  v6 = *(_QWORD *)&a4;
  v48[1] = *MEMORY[0x1E0C80C00];
  v9 = (CGColorSpace *)objc_msgSend(a5, "objectForKey:", CFSTR("CIImageColorSpace"));
  v10 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageTextScaleFactor"));
  if (v10)
  {
    objc_msgSend(v10, "floatValue");
    v12 = v11;
  }
  else
  {
    v12 = 1.0;
  }
  v45 = v12;
  v13 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageTextPadding"));
  if (v13)
  {
    objc_msgSend(v13, "floatValue");
    v16 = vcvtps_s32_f32(v15);
  }
  else
  {
    v16 = 1;
  }
  v17 = CI::format_modernize(v6, (CI *)"-[CIImage(TextImage) initWithAttributedString:format:options:]", v14);
  v46 = v17;
  v18 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a3);
  v19 = objc_msgSend(a3, "length");
  v51.width = 1.79769313e308;
  v49.location = 0;
  v49.length = v19;
  v51.height = 1.79769313e308;
  v20 = CTFramesetterSuggestFrameSizeWithConstraints(v18, v49, 0, v51, 0);
  width = v20.width;
  v22 = CTLineCreateWithAttributedString((CFAttributedStringRef)a3);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v22, 8uLL);
  x = BoundsWithOptions.origin.x;
  y = BoundsWithOptions.origin.y;
  v25 = BoundsWithOptions.size.width;
  height = BoundsWithOptions.size.height;
  if (v20.width < CGRectGetMaxX(BoundsWithOptions))
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = v25;
    v53.size.height = height;
    width = CGRectGetMaxX(v53);
  }
  v27 = ceil(-0.001 - x);
  v28 = -0.0;
  if (x < 0.0)
    v28 = v27;
  v29 = v28 + width;
  CFRelease(v22);
  v54.origin.x = 0.0;
  v54.origin.y = 0.0;
  v54.size.width = v29;
  v54.size.height = v20.height;
  v30 = CGPathCreateWithRect(v54, 0);
  v50.location = 0;
  v50.length = v19;
  Frame = CTFramesetterCreateFrame(v18, v50, v30, 0);
  v32 = Frame;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v33 = (void *)objc_msgSend(a3, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(a3, "length"), &unk_1E2F1D580, 0)) == 0)
  {
    v33 = (void *)archivedDataWithRootObject(objc_msgSend(a3, "string"));
  }
  v34 = (id)objc_msgSend(v33, "mutableCopy");
  objc_msgSend(v34, "appendBytes:length:", &v46, 4);
  objc_msgSend(v34, "appendBytes:length:", &v45, 4);
  if (v9)
  {
    v35 = CGColorSpaceCopyICCData(v9);
    objc_msgSend(v34, "appendData:", v35);

  }
  else
  {
    if (CI::format_is_luminance(v17))
      DeviceGray = CGColorSpaceCreateDeviceGray();
    else
      DeviceGray = CGColorSpaceCreateDeviceRGB();
    v9 = DeviceGray;
  }
  v37 = 0.0;
  if (x < 0.0)
    v37 = v27;
  if ((v16 & ~(v16 >> 31)) >= 0xC8)
    v38 = 200;
  else
    v38 = v16 & ~(v16 >> 31);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke_2;
  v41[3] = &unk_1E2EC42C8;
  *(double *)&v41[6] = v37;
  v42 = v17;
  v43 = v38;
  v44 = v45;
  v41[4] = v32;
  v41[5] = v9;
  v47 = CFSTR("kCIImageProviderContentDigest");
  v48[0] = v34;
  v39 = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](self, "initWithImageProvider:width:height:format:colorSpace:options:", v41, vcvtpd_u64_f64(ceil(v29 * v12 + -0.001) + (double)(2 * v38)), vcvtpd_u64_f64(ceil(v20.height * v12 + -0.001) + (double)(2 * v38)), v46, v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1));
  CFRelease(Frame);

  CFRelease(v18);
  CGPathRelease(v30);
  return v39;
}

uint64_t __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("range(%lu,%lu)\n"), a3, a4);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(a2, "debugDescription"));
}

void __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke_2(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, size_t a6, size_t a7)
{
  size_t v12;
  size_t v13;
  uint32_t v14;
  CGContext *v15;

  v12 = CI::buffer_size_for_format(*(_DWORD *)(a1 + 56), a6, a7, a3);
  bzero(a2, v12);
  v13 = (int)CI::format_bits_per_component(*(_DWORD *)(a1 + 56));
  v14 = CI::format_CGBitmapInfo(*(_DWORD *)(a1 + 56), 1);
  v15 = CGBitmapContextCreate(a2, a6, a7, v13, a3, *(CGColorSpaceRef *)(a1 + 40), v14);
  CGContextSetShouldSmoothFonts(v15, 0);
  CGContextTranslateCTM(v15, *(CGFloat *)(a1 + 48), 0.0);
  CGContextTranslateCTM(v15, (double)*(int *)(a1 + 60), (double)*(int *)(a1 + 60));
  CGContextScaleCTM(v15, *(float *)(a1 + 64), *(float *)(a1 + 64));
  CTFrameDraw(*(CTFrameRef *)(a1 + 32), v15);
  CGContextRelease(v15);
}

- (id)_pdfDataRepresentation
{
  CI::GraphObject *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __CFString *v9;
  CGImage *v10;
  void *v11;
  unsigned __int8 v12;
  void *PDFData;

  v3 = (CI::GraphObject *)CFStringCreateWithFormat(0, 0, CFSTR("CIImage <%p>"), self);
  v4 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CIImageQuicklook"), 0);
  -[CIImage extent](self, "extent");
  v9 = (__CFString *)objc_msgSend(v4, "createCGImage:fromRect:format:colorSpace:deferred:", self, 264, objc_msgSend(v4, "_outputColorSpace"), 0, v5, v6, v7, v8);
  v11 = CI::GraphObject::graphviz_representation((CI::GraphObject *)self->_priv, v3, v9, v10);
  if ((v12 & 1) == 0
  {
    -[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer = (uint64_t)CIGVRendererCreatePDFRenderer();
  }
  CIGVRendererSetOutputFileURL((void *)-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer, 0);
  CIGVGraphRender(v11, (const char *)-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  CIGVRenddererFlushRender(-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  PDFData = (void *)CIGVRendererGetPDFData(-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  CFRelease(v3);
  CGImageRelease((CGImageRef)v9);
  CFRelease(v11);
  return PDFData;
}

- (CGImage)_cgImageGraphRepresentation
{
  CI::GraphObject *v3;
  CGImage *v4;
  void *v5;
  unsigned __int8 v6;
  CGImage *CGImage;

  v3 = (CI::GraphObject *)CFStringCreateWithFormat(0, 0, CFSTR("CIImage <%p>"), self);
  v5 = CI::GraphObject::graphviz_representation((CI::GraphObject *)self->_priv, v3, 0, v4);
  if ((v6 & 1) == 0
  {
    -[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer = (uint64_t)CIGVRendererCreatePNGRenderer();
  }
  CIGVGraphRender(v5, (const char *)-[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer);
  CGImage = (CGImage *)CIGVRendererGetCGImage(-[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer);
  CFRelease(v3);
  CFRelease(v5);
  return CGImage;
}

+ (id)clearImage:(CGRect)a3
{
  return -[CIColorKernel applyWithExtent:arguments:](+[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_clearer), "applyWithExtent:arguments:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_scaleImageToMaxDimension:(unsigned int)a3
{
  CIImage *v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CIImage *v18;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v4 = self;
  -[CIImage extent](self, "extent");
  x = v7;
  y = v9;
  v11 = fmin((double)a3 / v5, (double)a3 / v6);
  if (v11 < 1.0)
  {
    width = v5;
    height = v6;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    while (v11 < 0.5)
    {
      v20 = v21;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v23 = CGRectApplyAffineTransform(v22, &v20);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
      v20 = v21;
      v4 = -[CIImage _imageByRenderingToIntermediate](-[CIImage imageByApplyingTransform:](v4, "imageByApplyingTransform:", &v20), "_imageByRenderingToIntermediate");
      v11 = v11 + v11;
    }
    CGAffineTransformMakeScale(&v20, v11, v11);
    v21 = v20;
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v25 = CGRectApplyAffineTransform(v24, &v20);
    v26 = CGRectIntegral(v25);
    v14 = v26.origin.x;
    v15 = v26.origin.y;
    v16 = v26.size.width;
    v17 = v26.size.height;
    v18 = -[CIImage imageByClampingToExtent](v4, "imageByClampingToExtent");
    v20 = v21;
    return -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](v18, "imageByApplyingTransform:", &v20), "imageByCroppingToRect:", v14, v15, v16, v17);
  }
  return v4;
}

- (id)autoAdjustmentFiltersWithImageProperties:(id)a3 options:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double x;
  double y;
  double width;
  double height;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  char v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *v34;
  NSArray *v35;
  NSArray *v36;
  void *v37;
  id v38;
  id v39;
  CIEnhancementCalculator *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  void *v45;
  uint64_t v46;
  float v47;
  float v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float v57;
  float v58;
  float v59;
  int v60;
  id v61;
  void *v62;
  float64x2_t v68;
  CIFilter *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CIFilter *v77;
  CIFilter *v78;
  double v79;
  double v80;
  CIFilter *v81;
  CIFilter *v82;
  CIFilter *v83;
  CIFilter *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  CIFilter *v95;
  CIFilter *v96;
  unsigned int v97;
  id v98;
  void *v99;
  uint64_t v100;
  CIDetector *v101;
  unsigned int v102;
  id v103;
  id v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  double v115;
  double v116;
  double v117;
  double v118;
  const __CFString *v119;
  uint64_t v120;
  const __CFString *v121;
  uint64_t v122;
  const __CFString *v123;
  _QWORD v124[3];
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v124[1] = *MEMORY[0x1E0C80C00];
  v123 = CFSTR("high_quality_downsample");
  v124[0] = MEMORY[0x1E0C9AAB0];
  v104 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CIImageAutoAdjust"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1));
  v7 = *MEMORY[0x1E0CBCB50];
  v103 = a3;
  v8 = (void *)objc_msgSend(a3, "valueForKey:", *MEMORY[0x1E0CBCB50]);
  v9 = (void *)objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0CBCB88]);
  if (v9)
  {
    if ((objc_msgSend(v9, "intValue") & 1) != 0)
      v10 = 121;
    else
      v10 = 110;
  }
  else
  {
    v10 = 63;
  }
  v11 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustRedEye"));
  v12 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustEnhance"));
  v13 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustCrop"));
  v14 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel"));
  if (v12)
  {
    v15 = objc_msgSend(v12, "BOOLValue");
    if (v11)
      goto LABEL_8;
  }
  else
  {
    v15 = 1;
    if (v11)
    {
LABEL_8:
      v16 = objc_msgSend(v11, "BOOLValue");
      if (v13)
        goto LABEL_9;
LABEL_13:
      v17 = 0;
      if (v14)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  v16 = 1;
  if (!v13)
    goto LABEL_13;
LABEL_9:
  v17 = objc_msgSend(v13, "BOOLValue");
  if (v14)
  {
LABEL_10:
    v18 = objc_msgSend(v14, "BOOLValue");
    goto LABEL_15;
  }
LABEL_14:
  v18 = 0;
LABEL_15:
  -[CIImage extent](self, "extent");
  x = v125.origin.x;
  y = v125.origin.y;
  width = v125.size.width;
  height = v125.size.height;
  if (CGRectIsNull(v125))
    return 0;
  v126.origin.x = x;
  v126.origin.y = y;
  v126.size.width = width;
  v126.size.height = height;
  if (CGRectIsInfinite(v126))
    return 0;
  v127.origin.x = x;
  v127.origin.y = y;
  v127.size.width = width;
  v127.size.height = height;
  if (CGRectIsEmpty(v127))
    return 0;
  v23 = v15;
  v24 = v7;
  v25 = v16 ^ 1;
  if (v10 == 110)
    v25 = 1;
  v26 = fmin(width, height) < 160.0 ? 1 : v25;
  v102 = v23;
  v27 = v26 ^ 1 | v23 | v17;
  if (((v27 | v18) & 1) == 0)
    return 0;
  v100 = objc_msgSend(a4, "valueForKey:", CFSTR("kCIImageAutoAdjustFeatures"));
  v28 = (v100 != 0) | ~(_BYTE)v27;
  v29 = v24;
  if ((v28 & 1) == 0)
  {
    v30 = (void *)MEMORY[0x194026220]();
    v121 = CFSTR("CIDetectorBetterEyeLocs");
    v122 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26 ^ 1u);
    v101 = +[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", CFSTR("CIDetectorTypeFace"), v104, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
    v31 = objc_msgSend(a4, "valueForKey:", CFSTR("CIDetectorImageOrientation"));
    if (v31)
    {
      v119 = CFSTR("CIDetectorImageOrientation");
      v120 = v31;
      v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
    }
    else
    {
      v32 = 0;
    }
    v34 = -[NSArray sortedArrayUsingComparator:](-[CIDetector featuresInImage:options:](v101, "featuresInImage:options:", self, v32), "sortedArrayUsingComparator:", &__block_literal_global_41);
    v35 = v34;
    objc_autoreleasePoolPop(v30);
    v100 = (uint64_t)v34;
    v36 = v34;
  }
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((v26 & 1) == 0)
  {
    v38 = -[CIImage _autoRedEyeFilterWithFeatures:imageProperties:context:options:](self, "_autoRedEyeFilterWithFeatures:imageProperties:context:options:", v100, v103, v104, a4);
    if (v38)
    {
      v39 = v38;
      if ((objc_msgSend(v38, "_isIdentity") & 1) == 0)
        objc_msgSend(v37, "addObject:", v39);
    }
  }
  if ((v102 | v17 | v18) == 1)
  {
    v40 = objc_alloc_init(CIEnhancementCalculator);
    -[CIEnhancementCalculator setFaceBalanceEnabled:](v40, "setFaceBalanceEnabled:", v102);
    -[CIEnhancementCalculator setVibranceEnabled:](v40, "setVibranceEnabled:", v102);
    -[CIEnhancementCalculator setCurvesEnabled:](v40, "setCurvesEnabled:", v102);
    -[CIEnhancementCalculator setShadowsEnabled:](v40, "setShadowsEnabled:", v102);
    v99 = (void *)objc_opt_new();
    if (-[CIEnhancementCalculator faceBalanceEnabled](v40, "faceBalanceEnabled"))
    {
      v41 = (void *)objc_opt_new();
      -[CIEnhancementCalculator setupFaceColorFromImage:usingContext:features:](v40, "setupFaceColorFromImage:usingContext:features:", self, v104, v100);
      objc_msgSend(v41, "drain");
    }
    v98 = -[CIImage _scaleImageToMaxDimension:](self, "_scaleImageToMaxDimension:", 400);
    v42 = (void *)objc_opt_new();
    if (v102)
    {
      v43 = +[CIImageRowReader forImage:usingContext:](CIImageRowReader, "forImage:usingContext:", v98, v104);
      -[CIEnhancementCalculator setupHistogramsUsing:redIndex:greenIndex:blueIndex:](v40, "setupHistogramsUsing:redIndex:greenIndex:blueIndex:", v43, objc_msgSend(v43, "red"), objc_msgSend(v43, "green"), objc_msgSend(v43, "blue"));
    }
    v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v109 = *MEMORY[0x1E0C9BAA8];
    v110 = v44;
    v111 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v107.f64[0] = x;
    v107.f64[1] = y;
    v108.f64[0] = width;
    v108.f64[1] = height;
    if (v18)
    {
      v45 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel_MaxAngle"));
      v46 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel_UseVerticalDetector"));
      if (v45)
      {
        objc_msgSend(v45, "floatValue");
        v48 = v47;
      }
      else
      {
        v48 = -1.0;
      }
      if (v46)
        v97 = objc_msgSend(v14, "BOOLValue");
      else
        v97 = 0;
      v49 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel_MinAngle"));
      v50 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel_VerticalAngleThreshold"));
      v51 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIImageAutoAdjustLevel_DominantAngleDiffThreshold"));
      v56 = -1.0;
      v57 = -1.0;
      if (v49)
      {
        objc_msgSend(v49, "floatValue");
        v57 = v58;
      }
      if (v50)
      {
        objc_msgSend(v50, "floatValue");
        v56 = v59;
      }
      if (v51)
      {
        objc_msgSend(v51, "floatValue");
        LODWORD(v55) = v60;
      }
      else
      {
        LODWORD(v55) = -1.0;
      }
      *(float *)&v52 = v57;
      *(float *)&v53 = v48;
      *(float *)&v54 = v56;
      v61 = -[CIImage getAutoRotateFilter:ciImage:inputRect:rotateCropRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:](self, "getAutoRotateFilter:ciImage:inputRect:rotateCropRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:", v104, v98, &v107, v97, x, y, width, height, v52, v53, v54, v55);
      if (v61)
      {
        v62 = v61;
        objc_msgSend(v37, "addObject:", v61);
        CGAffineTransformFromObject(objc_msgSend(v62, "valueForKey:", CFSTR("inputTransform")), (uint64_t)&v109);
      }
    }
    objc_msgSend(v42, "drain");
    objc_msgSend(v99, "drain");
    v105 = v107;
    v106 = v108;
    if (v17)
    {
      v112 = v109;
      v113 = v110;
      v114 = v111;
      -[CIImage getAutocropRect:rotateXfrm:inputImageRect:clipRect:](self, "getAutocropRect:rotateXfrm:inputImageRect:clipRect:", v100, &v112, &v105, x, y, width, height);
    }
    v128.origin = (CGPoint)v105;
    v128.size = (CGSize)v106;
    v129.origin.x = x;
    v129.origin.y = y;
    v129.size.width = width;
    v129.size.height = height;
    if (!CGRectEqualToRect(v128, v129))
    {
      __asm { FMOV            V1.2D, #0.5 }
      v68 = vsubq_f64(v105, vcvtq_f64_f32(vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(v105, _Q1))))));
      v105 = vsubq_f64(v105, v68);
      v106 = vcvtq_f64_f32(vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(vaddq_f64(v106, v68), _Q1)))));
      v69 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CICrop"), CFSTR("inputRectangle"), +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(_OWORD *)&v105, *(_OWORD *)&v106), 0);
      acLog("   adding crop rect: x=%.3f,y=%.3f,w=%.3f,h=%.3f\n", v70, v71, v72, v73, v74, v75, v76, SLOBYTE(v105.f64[0]));
      if (v69)
        objc_msgSend(v37, "addObject:", v69);
    }
    if (v102)
    {
      if (-[CIEnhancementCalculator faceBalanceEnabled](v40, "faceBalanceEnabled"))
      {
        if (-[CIEnhancementCalculation faceBalanceWarmth](v40, "faceBalanceWarmth"))
        {
          if (-[CIEnhancementCalculation faceBalanceStrength](v40, "faceBalanceStrength"))
          {
            v77 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIFaceBalance"));
            if (v77)
            {
              v78 = v77;
              -[CIEnhancementCalculation originalFaceColor](v40, "originalFaceColor");
              v80 = v79;
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("inputOrigI"));
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v80), CFSTR("inputOrigQ"));
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", -[CIEnhancementCalculation faceBalanceStrength](v40, "faceBalanceStrength"), CFSTR("inputStrength"));
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", -[CIEnhancementCalculation faceBalanceWarmth](v40, "faceBalanceWarmth"), CFSTR("inputWarmth"));
              if (!-[CIFilter _isIdentity](v78, "_isIdentity"))
                objc_msgSend(v37, "addObject:", v78);
            }
          }
        }
      }
      if (-[CIEnhancementCalculator vibranceEnabled](v40, "vibranceEnabled"))
      {
        if (-[CIEnhancementCalculation vibrance](v40, "vibrance"))
        {
          v81 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVibrance"));
          if (v81)
          {
            v82 = v81;
            -[CIFilter setValue:forKey:](v81, "setValue:forKey:", -[CIEnhancementCalculation vibrance](v40, "vibrance"), CFSTR("inputAmount"));
            if (!-[CIFilter _isIdentity](v82, "_isIdentity"))
              objc_msgSend(v37, "addObject:", v82);
          }
        }
      }
      if (-[CIEnhancementCalculator curvesEnabled](v40, "curvesEnabled"))
      {
        if (-[CIEnhancementCalculation curveCount](v40, "curveCount") == 5)
        {
          v83 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIToneCurve"));
          if (v83)
          {
            v84 = v83;
            v85 = 0;
            v86 = (_QWORD *)&v112 + 1;
            do
            {
              -[CIEnhancementCalculation curvePointAtIndex:](v40, "curvePointAtIndex:", v85);
              *(v86 - 1) = v87;
              *v86 = v88;
              ++v85;
              v86 += 2;
            }
            while (v85 != 5);
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v112), CFSTR("inputPoint0"));
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v113), CFSTR("inputPoint1"));
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v114), CFSTR("inputPoint2"));
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v115, v116), CFSTR("inputPoint3"));
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v117, v118), CFSTR("inputPoint4"));
            -[CIFilter setValue:forKey:](v84, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputExtrapolate"));
            if (!-[CIFilter _isIdentity](v84, "_isIdentity"))
              objc_msgSend(v37, "addObject:", v84);
          }
        }
      }
      v89 = -[CIEnhancementCalculator shadowsEnabled](v40, "shadowsEnabled");
      if (v103)
      {
        if (v89)
        {
          v90 = (void *)objc_msgSend(v103, "objectForKey:", v29);
          v91 = objc_msgSend((id)objc_msgSend(v90, "objectForKey:", *MEMORY[0x1E0CBCB30]), "intValue");
          v92 = (void *)objc_msgSend(v103, "objectForKey:", *MEMORY[0x1E0CBD090]);
          v93 = (void *)objc_msgSend(v92, "objectForKey:", *MEMORY[0x1E0CBD0B8]);
          if (v91 == 3)
          {
            v94 = v93;
            if ((objc_msgSend(v93, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
              || objc_msgSend(v94, "hasPrefix:", CFSTR("iPad")))
            {
              -[CIEnhancementCalculator setShadowsEnabled:](v40, "setShadowsEnabled:", 0);
            }
          }
        }
      }
      if (-[CIEnhancementCalculator shadowsEnabled](v40, "shadowsEnabled"))
      {
        if (-[CIEnhancementCalculation shadow](v40, "shadow"))
        {
          v95 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIHighlightShadowAdjust"));
          if (v95)
          {
            v96 = v95;
            -[CIFilter setValue:forKey:](v95, "setValue:forKey:", -[CIEnhancementCalculation shadow](v40, "shadow"), CFSTR("inputShadowAmount"));
            -[CIFilter setValue:forKey:](v96, "setValue:forKey:", &unk_1E2F1BA10, CFSTR("__inputVersion"));
            if (!-[CIFilter _isIdentity](v96, "_isIdentity"))
              objc_msgSend(v37, "addObject:", v96);
          }
        }
      }
    }
  }
  else
  {
    v40 = 0;
  }
  if (autoAdjustmentFiltersWithImageProperties_options__didCheck != -1)
    dispatch_once(&autoAdjustmentFiltersWithImageProperties_options__didCheck, &__block_literal_global_75_0);
  if (autoAdjustmentFiltersWithImageProperties_options__dumpAutoEnhanceArray)
    NSLog(CFSTR("filters = %@"), v37);

  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v37);
}

uint64_t __72__CIImage_AutoAdjust__autoAdjustmentFiltersWithImageProperties_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "bounds");
  v6 = v5;
  objc_msgSend(a2, "bounds");
  v8 = v6 * v7;
  objc_msgSend(a3, "bounds");
  v10 = v9;
  objc_msgSend(a3, "bounds");
  if (v8 > v10 * v11)
    return -1;
  else
    return v8 < v10 * v11;
}

const char *__72__CIImage_AutoAdjust__autoAdjustmentFiltersWithImageProperties_options___block_invoke_73()
{
  const char *result;

  result = getenv("DUMP_AUTO_ENHANCE_ARRAY");
  if (result)
    result = (const char *)atoi(result);
  autoAdjustmentFiltersWithImageProperties_options__dumpAutoEnhanceArray = (int)result;
  return result;
}

- (NSArray)autoAdjustmentFilters
{
  return -[CIImage autoAdjustmentFiltersWithOptions:](self, "autoAdjustmentFiltersWithOptions:", 0);
}

- (NSArray)autoAdjustmentFiltersWithOptions:(NSDictionary *)options
{
  return (NSArray *)-[CIImage autoAdjustmentFiltersWithImageProperties:options:](self, "autoAdjustmentFiltersWithImageProperties:options:", -[CIImage properties](self, "properties"), options);
}

- (CIImage)imageWithMesh:(id)a3 transform:(CGAffineTransform *)a4
{
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = 0; i != 1352; i += 8)
  {
    v9 = *(int *)((char *)&imageWithMesh_transform__meshEndPointIndexes + i + 4);
    v10 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", *(int *)((char *)&imageWithMesh_transform__meshEndPointIndexes + i));
    objc_msgSend(v10, "X");
    v12 = v11;
    objc_msgSend(v10, "Y");
    v14 = v13;
    v15 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v9);
    objc_msgSend(v15, "X");
    v17 = v16;
    objc_msgSend(v15, "Y");
    objc_msgSend(v7, "addObject:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", a4->tx + v14 * a4->c + a4->a * v12, a4->ty + v14 * a4->d + a4->b * v12, a4->tx + v18 * a4->c + a4->a * v17, a4->ty + v18 * a4->d + a4->b * v17));
  }
  v21[0] = &unk_1E2F19F40;
  v20[0] = CFSTR("inputWidth");
  v20[1] = CFSTR("inputColor");
  v20[2] = CFSTR("inputMesh");
  v21[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 1.0, 0.0, 1.0);
  v21[2] = v7;
  return (CIImage *)objc_msgSend((id)-[CIFilter valueForKey:](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIMeshGenerator"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3)), "valueForKey:", CFSTR("outputImage")), "imageByCompositingOverImage:", self);
}

- (CGPoint)pointWithDictionary:(id)a3 name:(id)a4 index:(int)a5 transformedBy:(CGAffineTransform *)a6
{
  void *v7;
  double v8;
  double v9;
  float64x2_t v10;
  double v11;
  double v12;
  CGPoint result;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectAtIndexedSubscript:", a5);
  objc_msgSend(v7, "X");
  v12 = v8;
  objc_msgSend(v7, "Y");
  v10 = vaddq_f64(*(float64x2_t *)&a6->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a6->c, v9), *(float64x2_t *)&a6->a, v12));
  v11 = v10.f64[1];
  result.x = v10.f64[0];
  result.y = v11;
  return result;
}

- (id)_dictForFeature:(id)a3 invOrientationTransform:(CGAffineTransform *)a4 extent:(CGRect)a5
{
  double height;
  double width;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  double v27;
  double v28;
  __int128 v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  double v38;
  __int128 v39;
  double v40;
  double v41;
  __int128 v42;
  double v43;
  double v44;
  __int128 v45;
  double v46;
  double v47;
  __int128 v48;
  double v49;
  double v50;
  __int128 v51;
  double v52;
  double v53;
  __int128 v54;
  double v55;
  double v56;
  __int128 v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double v62;
  __int128 v63;
  double v64;
  double v65;
  __int128 v66;
  double v67;
  double v68;
  __int128 v69;
  double v70;
  double v71;
  __int128 v72;
  double v73;
  double v74;
  __int128 v75;
  double v76;
  double v77;
  __int128 v78;
  double v79;
  double v80;
  __int128 v81;
  double v82;
  double v83;
  __int128 v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;

  height = a5.size.height;
  width = a5.size.width;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a5.origin.x, a5.origin.y);
  v11 = CI_EDIT_RED_EYE_VERSION();
  -[CIImage extent](self, "extent");
  v13 = v12;
  v15 = v14;
  v16 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v11 >= 2 && objc_msgSend(a3, "landmarks"))
    {
      v17 = objc_msgSend(a3, "landmarks");
      v18 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v18;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftPupil"), 0, &v155);
      v20 = v19;
      v114 = v21;
      v22 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v22;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightPupil"), 0, &v155);
      v24 = v23;
      v118 = v25;
      v26 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v26;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("innerLips"), 1, &v155);
      v117 = v27;
      v121 = v28;
      v29 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v29;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("innerLips"), 4, &v155);
      v31 = v30;
      v115 = v32;
      v33 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v33;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("noseCrest"), 0, &v155);
      v116 = v34;
      v120 = v35;
      v36 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v36;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("noseCrest"), 2, &v155);
      v119 = v37;
      v123 = v38;
      v39 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v39;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 0, &v155);
      v122 = v40;
      v125 = v41;
      v42 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v42;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 1, &v155);
      v124 = v43;
      v127 = v44;
      v45 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v45;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 2, &v155);
      v126 = v46;
      v129 = v47;
      v48 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v48;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 3, &v155);
      v128 = v49;
      v131 = v50;
      v51 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v51;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 4, &v155);
      v130 = v52;
      v133 = v53;
      v54 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v54;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 5, &v155);
      v132 = v55;
      v135 = v56;
      v57 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v57;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 6, &v155);
      v134 = v58;
      v137 = v59;
      v60 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v60;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("leftEye"), 7, &v155);
      v136 = v61;
      v139 = v62;
      v63 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v63;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 0, &v155);
      v138 = v64;
      v141 = v65;
      v66 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v66;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 1, &v155);
      v140 = v67;
      v143 = v68;
      v69 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v69;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 2, &v155);
      v142 = v70;
      v145 = v71;
      v72 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v72;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 3, &v155);
      v144 = v73;
      v147 = v74;
      v75 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v75;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 4, &v155);
      v146 = v76;
      v149 = v77;
      v78 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v78;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 5, &v155);
      v148 = v79;
      v151 = v80;
      v81 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v81;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 6, &v155);
      v150 = v82;
      v153 = v83;
      v84 = *(_OWORD *)&a4->c;
      v155 = *(_OWORD *)&a4->a;
      v156 = v84;
      v157 = *(_OWORD *)&a4->tx;
      -[CIImage pointWithDictionary:name:index:transformedBy:](self, "pointWithDictionary:name:index:transformedBy:", v17, CFSTR("rightEye"), 7, &v155);
      v152 = v85;
      v154 = v86;
      v87 = v13 / width;
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v20), CFSTR("leftEyeX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v114 * (v15 / height)), CFSTR("leftEyeY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v24), CFSTR("rightEyeX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v118 * (v15 / height)), CFSTR("rightEyeY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * ((v117 + v31) * 0.5)), CFSTR("mouthCenterX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 + (v121 + v115) * -0.5 * (v15 / height)), CFSTR("mouthCenterY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v116), CFSTR("noseBridgeX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v120 * (v15 / height)), CFSTR("noseBridgeY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v119), CFSTR("noseTipX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v123 * (v15 / height)), CFSTR("noseTipY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v122), CFSTR("leftEyeLeftX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v125 * (v15 / height)), CFSTR("leftEyeLeftY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v124), CFSTR("leftEyelidNWX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v127 * (v15 / height)), CFSTR("leftEyelidNWY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v126), CFSTR("leftEyelidUpperX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v129 * (v15 / height)), CFSTR("leftEyelidUpperY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v128), CFSTR("leftEyelidNEX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v131 * (v15 / height)), CFSTR("leftEyelidNEY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v130), CFSTR("leftEyeRightX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v133 * (v15 / height)), CFSTR("leftEyeRightY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v132), CFSTR("leftEyelidSEX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v135 * (v15 / height)), CFSTR("leftEyelidSEY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v134), CFSTR("leftEyelidLowerX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v137 * (v15 / height)), CFSTR("leftEyelidLowerY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v136), CFSTR("leftEyelidSWX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v139 * (v15 / height)), CFSTR("leftEyelidSWY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v138), CFSTR("rightEyeLeftX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v141 * (v15 / height)), CFSTR("rightEyeLeftY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v140), CFSTR("rightEyelidNWX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v143 * (v15 / height)), CFSTR("rightEyelidNWY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v142), CFSTR("rightEyelidUpperX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v145 * (v15 / height)), CFSTR("rightEyelidUpperY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v144), CFSTR("rightEyelidNEX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v147 * (v15 / height)), CFSTR("rightEyelidNEY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v146), CFSTR("rightEyeRightX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v149 * (v15 / height)), CFSTR("rightEyeRightY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v148), CFSTR("rightEyelidSEX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v151 * (v15 / height)), CFSTR("rightEyelidSEY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v150), CFSTR("rightEyelidLowerX"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v153 * (v15 / height)), CFSTR("rightEyelidLowerY"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * v152), CFSTR("rightEyelidSWX"));
      v88 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v154 * (v15 / height));
      v89 = v10;
LABEL_8:
      objc_msgSend(v89, "setObject:forKeyedSubscript:", v88, CFSTR("rightEyelidSWY"));
      return v10;
    }
    if (objc_msgSend(a3, "hasLeftEyePosition"))
    {
      v90 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "leftEyePosition");
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v90, "numberWithDouble:"), CFSTR("leftEyeX"));
      v91 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "leftEyePosition");
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v91, "numberWithDouble:", v16 - v92), CFSTR("leftEyeY"));
    }
    if (objc_msgSend(a3, "hasRightEyePosition"))
    {
      v93 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "rightEyePosition");
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v93, "numberWithDouble:"), CFSTR("rightEyeX"));
      v94 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "rightEyePosition");
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v94, "numberWithDouble:", v16 - v95), CFSTR("rightEyeY"));
    }
    if (objc_msgSend(a3, "hasMouthPosition"))
    {
      v96 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "mouthPosition");
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v96, "numberWithDouble:"), CFSTR("mouthCenterX"));
      v97 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a3, "mouthPosition");
      v99 = v16 - v98;
      v100 = v97;
LABEL_28:
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v100, "numberWithDouble:", v99), CFSTR("mouthCenterY"));
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeX")))
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeX")), CFSTR("leftEyeX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeY")), CFSTR("leftEyeY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeX")), CFSTR("rightEyeX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeY")), CFSTR("rightEyeY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mouthCenterX")), CFSTR("mouthCenterX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mouthCenterY")), CFSTR("mouthCenterY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseBridgeX")), CFSTR("noseBridgeX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseBridgeY")), CFSTR("noseBridgeY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseTipX")), CFSTR("noseTipX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("noseTipY")), CFSTR("noseTipY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeLeftX")), CFSTR("leftEyeLeftX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeLeftY")), CFSTR("leftEyeLeftY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidNWX")), CFSTR("leftEyelidNWX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidNWY")), CFSTR("leftEyelidNWY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidUpperX")), CFSTR("leftEyelidUpperX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidUpperY")), CFSTR("leftEyelidUpperY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidNEX")), CFSTR("leftEyelidNEX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidNEY")), CFSTR("leftEyelidNEY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeRightX")), CFSTR("leftEyeRightX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyeRightY")), CFSTR("leftEyeRightY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidSEX")), CFSTR("leftEyelidSEX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidSEY")), CFSTR("leftEyelidSEY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidLowerX")), CFSTR("leftEyelidLowerX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidLowerY")), CFSTR("leftEyelidLowerY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidSWX")), CFSTR("leftEyelidSWX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("leftEyelidSWY")), CFSTR("leftEyelidSWY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeLeftX")), CFSTR("rightEyeLeftX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeLeftY")), CFSTR("rightEyeLeftY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidNWX")), CFSTR("rightEyelidNWX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidNWY")), CFSTR("rightEyelidNWY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidUpperX")), CFSTR("rightEyelidUpperX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidUpperY")), CFSTR("rightEyelidUpperY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidNEX")), CFSTR("rightEyelidNEX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidNEY")), CFSTR("rightEyelidNEY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeRightX")), CFSTR("rightEyeRightX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyeRightY")), CFSTR("rightEyeRightY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidSEX")), CFSTR("rightEyelidSEX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidSEY")), CFSTR("rightEyelidSEY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidLowerX")), CFSTR("rightEyelidLowerX"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidLowerY")), CFSTR("rightEyelidLowerY"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidSWX")), CFSTR("rightEyelidSWX"));
        v88 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rightEyelidSWY"));
        v89 = v10;
        goto LABEL_8;
      }
      v101 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("leftEyePosition"));
      if (v101 || (v101 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("leftEye"))) != 0)
      {
        v102 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v101, "X");
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v102, "numberWithDouble:"), CFSTR("leftEyeX"));
        v103 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v101, "Y");
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v103, "numberWithDouble:", v16 - v104), CFSTR("leftEyeY"));
      }
      v105 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("rightEyePosition"));
      if (v105 || (v105 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("rightEye"))) != 0)
      {
        v106 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v105, "X");
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v106, "numberWithDouble:"), CFSTR("rightEyeX"));
        v107 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v105, "Y");
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v107, "numberWithDouble:", v16 - v108), CFSTR("rightEyeY"));
      }
      if (objc_msgSend(a3, "valueForKey:", CFSTR("leftEyeTouchSize")))
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", CFSTR("leftEyeTouchSize")), CFSTR("leftEyeSize"));
      if (objc_msgSend(a3, "valueForKey:", CFSTR("rightEyeTouchSize")))
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", CFSTR("rightEyeTouchSize")), CFSTR("rightEyeSize"));
      v109 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("mouthPosition"));
      if (v109 || (v109 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("mouthCenter"))) != 0)
      {
        v110 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v109, "X");
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v110, "numberWithDouble:"), CFSTR("mouthCenterX"));
        v111 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v109, "Y");
        v99 = v16 - v112;
        v100 = v111;
        goto LABEL_28;
      }
    }
  }
  return v10;
}

- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGAffineTransform v20;

  -[CIImage extent](self, "extent");
  v10 = v9;
  v12 = v11;
  if (a4 < 5)
  {
    v14 = v7;
  }
  else
  {
    -[CIImage extent](self, "extent");
    v14 = v13;
    -[CIImage extent](self, "extent");
    v8 = v15;
  }
  v16 = v10;
  v17 = v12;
  v18 = v14;
  orientationTransform(*(CGRect *)(&v8 - 3), a4, &v20);
  return CGAffineTransformInvert(retstr, &v20);
}

- (id)_autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 context:(id)a5 options:(id)a6
{
  int v11;
  void *v12;
  uint64_t v13;
  CIImage *v14;
  CIImage *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CIDetector *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char isKindOfClass;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  size_t v56;
  void *v57;
  CGColorSpace *v58;
  CIFormat *v59;
  void *v60;
  CIRedEyeRepair3 *v61;
  CIRedEyeRepair3 *v62;
  id v63;
  CIFilter *v64;
  id v66;
  unsigned int v67;
  id v68;
  uint64_t v69;
  int v70;
  _OWORD v71[3];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  _QWORD v80[4];
  _BYTE v81[128];
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  _QWORD v85[3];
  CGRect v86;

  v85[1] = *MEMORY[0x1E0C80C00];
  v11 = CI_EDIT_RED_EYE_VERSION();
  v12 = (void *)objc_msgSend(a6, "valueForKey:", CFSTR("CIDetectorImageOrientation"));
  if (v12)
    v13 = objc_msgSend(v12, "intValue");
  else
    v13 = 1;
  v77 = 0u;
  v78 = 0u;
  v76 = 0u;
  -[CIImage extent](self, "extent");
  orientationTransform(v86, v13, &v76);
  v14 = self;
  v15 = self;
  if (v11 >= 2)
  {
    v14 = self;
    if (objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("fullSizeImage")))
      v14 = (CIImage *)objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("fullSizeImage"));
    if ((_DWORD)v13 == 1)
    {
      v15 = self;
    }
    else
    {
      v14 = -[CIImage imageByApplyingOrientation:](v14, "imageByApplyingOrientation:", v13);
      v15 = -[CIImage imageByApplyingOrientation:](self, "imageByApplyingOrientation:", v13);
    }
  }
  v70 = v11;
  if (!a5)
    a5 = +[CIContext _singletonContext](CIContext, "_singletonContext");
  v16 = (void *)objc_msgSend(a4, "valueForKey:", *MEMORY[0x1E0CBD090]);
  v17 = objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0CBD0B8]);
  v18 = (void *)objc_msgSend(a4, "valueForKey:", *MEMORY[0x1E0CBCB50]);
  v19 = (void *)objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0CBCB88]);
  if (v19 && (objc_msgSend(v19, "intValue") & 1) == 0)
    return 0;
  v67 = v13;
  if (!a3)
  {
    v84 = CFSTR("CIDetectorBetterEyeLocs");
    v85[0] = MEMORY[0x1E0C9AAB0];
    v20 = +[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", CFSTR("CIDetectorTypeFace"), a5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1));
    v21 = objc_msgSend(a6, "valueForKey:", CFSTR("CIDetectorImageOrientation"));
    if (v21)
    {
      v82 = CFSTR("CIDetectorImageOrientation");
      v83 = v21;
      v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    }
    else
    {
      v22 = 0;
    }
    a3 = -[CIDetector featuresInImage:options:](v20, "featuresInImage:options:", v15, v22);
  }
  v68 = a5;
  v69 = v17;
  v23 = a6;
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v73 != v27)
          objc_enumerationMutation(a3);
        v29 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        -[CIImage extent](v15, "extent");
        v71[0] = v76;
        v71[1] = v77;
        v71[2] = v78;
        objc_msgSend(v24, "addObject:", -[CIImage _dictForFeature:invOrientationTransform:extent:](v14, "_dictForFeature:invOrientationTransform:extent:", v29, v71));
      }
      v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v26);
  }
  if (!objc_msgSend(v24, "count"))
    return 0;
  -[CIImage extent](v14, "extent");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v66 = v23;
  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v39 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v40 = v68;
    if ((isKindOfClass & 1) != 0)
    {
      v41 = v69;
      if (!objc_msgSend(v39, "landmarks"))
      {
LABEL_36:
        v70 = 1;
        goto LABEL_37;
      }
    }
    else
    {
      objc_opt_class();
      v41 = v69;
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", CFSTR("leftEyeX")))
      {
        goto LABEL_36;
      }
    }
    if (v70 == 3)
    {
      v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v66);
      v80[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v80[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
      v80[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
      v80[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
      objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4), CFSTR("imageExtent"));
      +[CIRedEyeRepair3 supportRectangleWithFaceArray:options:](CIRedEyeRepair3, "supportRectangleWithFaceArray:options:", v24, v42);
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v70 = 3;
      v51 = 1;
      goto LABEL_38;
    }
  }
  else
  {
    v70 = 1;
    v40 = v68;
    v41 = v69;
  }
LABEL_37:
  +[CIRedEyeRepair supportRectangleWithFaceArray:imageSize:](CIRedEyeRepair, "supportRectangleWithFaceArray:imageSize:", v24, v35, v37);
  v44 = v52;
  v46 = v53;
  v48 = v54;
  v50 = v55;
  v51 = 0;
LABEL_38:
  v56 = vcvtd_n_u64_f64(ceil(v48), 2uLL);
  v57 = malloc_type_calloc(v56, vcvtpd_u64_f64(v50), 0x85FC1C59uLL);
  v58 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v59 = &kCIFormatBGRA8;
  if (v70 <= 1)
    v59 = &kCIFormatRGBA8;
  objc_msgSend(v40, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, v57, v56, *v59, v58, v44, v46, v48, v50);
  CGColorSpaceRelease(v58);
  if (v51)
  {
    v60 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v66);
    v79[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v79[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
    v79[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
    v79[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
    objc_msgSend(v60, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4), CFSTR("imageExtent"));
    objc_msgSend(v60, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v67), CFSTR("orientation"));
    v61 = -[CIRedEyeRepair3 initWithExternalBuffer:subRectangle:rowBytes:options:]([CIRedEyeRepair3 alloc], "initWithExternalBuffer:subRectangle:rowBytes:options:", v57, v56, v60, v44, v46, v48, v50);
  }
  else
  {
    v61 = -[CIRedEyeRepair initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:]([CIRedEyeRepair alloc], "initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:", v57, v56, v41, v44, v46, v48, v50, v35, v37);
  }
  v62 = v61;
  -[CIRedEyeRepair3 autoRepairWithFaceArray:](v61, "autoRepairWithFaceArray:", v24);
  v63 = -[CIRedEyeRepair3 repairArray](v62, "repairArray");

  if (v57)
    free(v57);
  if (!objc_msgSend(v63, "count"))
    return 0;
  v64 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRedEyeCorrections"));
  -[CIFilter setValue:forKey:](v64, "setValue:forKey:", self, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v64, "setValue:forKey:", v41, CFSTR("inputCameraModel"));
  -[CIFilter setValue:forKey:](v64, "setValue:forKey:", v63, CFSTR("inputCorrectionInfo"));
  return v64;
}

- (id)autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 options:(id)a5
{
  if (a3)
    return -[CIImage _autoRedEyeFilterWithFeatures:imageProperties:context:options:](self, "_autoRedEyeFilterWithFeatures:imageProperties:context:options:", a3, a4, 0, a5);
  else
    return 0;
}

- (id)autoRedEyeFilterWithFeatures:(id)a3 options:(id)a4
{
  if (a3)
    return -[CIImage _autoRedEyeFilterWithFeatures:imageProperties:context:options:](self, "_autoRedEyeFilterWithFeatures:imageProperties:context:options:", a3, -[CIImage properties](self, "properties"), 0, a4);
  else
    return 0;
}

- (CGPoint)calcIntersection:(CGPoint)a3 slope1:(CGPoint)a4 pt2:(CGPoint)a5 slope2:(CGPoint)a6
{
  CGFloat v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = ((a5.y - a3.y) * a6.x - (a5.x - a3.x) * a6.y) / (a6.x * a4.y - a4.x * a6.y);
  v7 = a3.x + v6 * a4.x;
  v8 = a3.y + v6 * a4.y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)getAutoRotateFilter:(id)a3 ciImage:(id)a4 inputRect:(CGRect)a5 rotateCropRect:(CGRect *)a6 minTiltAngle:(float)a7 maxTiltAngle:(float)a8 detectVerticalLines:(BOOL)a9 thrVertAngle:(float)a10 thrDomAngleDiff:(float)a11
{
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  double v23;
  double v24;
  CGImage *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  BOOL v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;

  v12 = a9;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "extent");
  v24 = v23;
  objc_msgSend(a4, "extent");
  v25 = (CGImage *)objc_msgSend(a3, "createCGImage:fromRect:", a4, 0.0, 0.0, v24);
  v26 = width;
  *(float *)&v27 = a7;
  *(float *)&v28 = a8;
  *(float *)&v29 = a10;
  *(float *)&v30 = a11;
  v31 = -[CIImage autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:](self, "autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:", a3, v25, v12, x, y, width, height, v27, v28, v29, v30);
  CGImageRelease(v25);
  if (!v31)
    return v31;
  if ((objc_msgSend(v31, "_isIdentity") & 1) != 0)
    return 0;
  v82 = 0u;
  v83 = 0u;
  v81 = 0u;
  v32 = objc_msgSend(v31, "valueForKey:", CFSTR("inputTransform"));
  if (v32)
  {
    v33 = (void *)v32;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = (const char *)objc_msgSend(v33, "objCType");
      if (!strcmp(v34, "{CGAffineTransform=dddddd}") || !strcmp(v34, "{?=dddddd}"))
        objc_msgSend(v33, "getValue:size:", &v81, 48);
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "count") == 6)
      {
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 0), "doubleValue");
        *(_QWORD *)&v81 = v67;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 1), "doubleValue");
        *((_QWORD *)&v81 + 1) = v68;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 2), "doubleValue");
        *(_QWORD *)&v82 = v69;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 3), "doubleValue");
        *((_QWORD *)&v82 + 1) = v70;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 4), "doubleValue");
        *(_QWORD *)&v83 = v71;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 5), "doubleValue");
        *((_QWORD *)&v83 + 1) = v72;
      }
      goto LABEL_13;
    }
    v85 = 0u;
    v86 = 0u;
    v84 = 0u;
    objc_msgSend(v33, "transformStruct");
    v81 = 0u;
    v82 = 0u;
    v36 = 0u;
  }
  else
  {
    v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v81 = *MEMORY[0x1E0C9BAA8];
    v82 = v35;
    v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v83 = v36;
LABEL_13:
  v37 = *(double *)&v83 + *(double *)&v82 * 0.0 + *(double *)&v81 * 0.0;
  v38 = *((double *)&v82 + 1) * 0.0 + *((double *)&v81 + 1) * 0.0;
  v39 = *((double *)&v83 + 1) + v38;
  v40 = *((double *)&v83 + 1)
      + *((double *)&v82 + 1) * 0.0
      + *((double *)&v81 + 1) * width
      - (*((double *)&v83 + 1)
       + v38);
  v41 = *(double *)&v83 + height * *(double *)&v82 + *(double *)&v81 * 0.0 - v37;
  v77 = *(double *)&v83 + *(double *)&v82 * 0.0 + *(double *)&v81 * width - v37;
  v80 = *((double *)&v83 + 1)
      + height * *((double *)&v82 + 1)
      + *((double *)&v81 + 1) * 0.0
      - (*((double *)&v83 + 1)
       + v38);
  v42 = width * 0.5;
  v43 = height * 0.5;
  v44 = height * -0.5;
  v45 = v26 * -0.5;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v42, v44, v37, *((double *)&v83 + 1) + v38);
  v75 = v47;
  v76 = v46;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v42, v44, v37, v39, v41, v80);
  v73 = v49;
  v74 = v48;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v45, v44, v37, v39, v77, v40);
  v78 = v50;
  v52 = v51;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v45, v44, v37, v39, v41, v80);
  if (a6)
  {
    v55 = (v52 - v43) * (v52 - v43) + (v78 - v42) * (v78 - v42);
    v56 = (v73 - v43) * (v73 - v43) + (v74 - v42) * (v74 - v42);
    v57 = (v75 - v43) * (v75 - v43) + (v76 - v42) * (v76 - v42);
    v58 = v56 < v57;
    if (v56 < v57)
    {
      v59 = v73;
    }
    else
    {
      v56 = (v75 - v43) * (v75 - v43) + (v76 - v42) * (v76 - v42);
      v59 = v75;
    }
    if (v58)
      v60 = v74;
    else
      v60 = v76;
    v61 = v55 < v56;
    if (v55 < v56)
    {
      v62 = v52;
    }
    else
    {
      v55 = v56;
      v62 = v59;
    }
    if (v61)
      v63 = v78;
    else
      v63 = v60;
    if ((v54 - v43) * (v54 - v43) + (v53 - v42) * (v53 - v42) >= v55)
    {
      v54 = v62;
      v53 = v63;
    }
    v64 = vabdd_f64(v54, v43);
    v65 = vabdd_f64(v53, v42);
    a6->origin.x = v42 - v65;
    a6->origin.y = v43 - v64;
    a6->size.width = v65 + v65;
    a6->size.height = v64 + v64;
  }
  return v31;
}

- (id)autoRotateFilterFFT:(id)a3 image:(CGImage *)a4 inputRect:(CGRect)a5 minTiltAngle:(float)a6 maxTiltAngle:(float)a7 detectVerticalLines:(BOOL)a8 thrVertAngle:(float)a9 thrDomAngleDiff:(float)a10
{
  _BOOL4 v10;
  CGFloat height;
  CGFloat width;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  float v33;
  float v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  float v55;
  float v56;
  float v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  float v74;
  double v75;
  float CFPreferenceFloat;
  float v77;
  float v78;
  float v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  float v87;
  float v88;
  float v89;
  double v90;
  double v91;
  double v92;
  int v93;
  float v94;
  double v95;
  size_t v96;
  float v97;
  float v98;
  uint64_t v99;
  uint64_t v100;
  CGColorSpace *DeviceRGB;
  int v102;
  void *v103;
  CGContext *v104;
  float v105;
  void *v106;
  void *v107;
  float v108;
  float v109;
  double v110;
  void *v111;
  void *v112;
  int v113;
  float v114;
  double v115;
  uint64_t v116;
  float *v117;
  double v118;
  double v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  float v128;
  float v129;
  float v130;
  float v131;
  BOOL v132;
  char v134;
  char v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  float v141;
  double v142;
  double v143;
  float v146;
  CGAffineTransform v147;
  CGAffineTransform v148;
  float v149;
  CGAffineTransform v150;
  uint64_t v151;
  CGRect v152;

  v10 = a8;
  height = a5.size.height;
  width = a5.size.width;
  v151 = *MEMORY[0x1E0C80C00];
  v23 = -[CIImage properties](self, "properties", a3, a5.origin.x, a5.origin.y);
  v142 = width;
  v143 = height;
  v146 = a6;
  if (v23)
  {
    acLog("autoRotateFilterFFT: props exist\n", v16, v17, v18, v19, v20, v21, v22, v134);
    v24 = -[NSDictionary objectForKey:](v23, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    if (v24)
      v32 = objc_msgSend(v24, "intValue");
    else
      v32 = 0;
    acLog("Orientation = %d\n", v25, v26, v27, v28, v29, v30, v31, v32);
    v35 = -[NSDictionary objectForKey:](v23, "objectForKey:", *MEMORY[0x1E0CBCF70]);
    v43 = 0.0;
    v44 = 0.0;
    v45 = 0.0;
    v46 = 0.0;
    if (v35)
    {
      v47 = (void *)objc_msgSend(v35, "objectForKey:", kMakerNoteProperty_AccelerationVector);
      acLog("  Found makerNotes\n", v48, v49, v50, v51, v52, v53, v54, v135);
      if (v47)
      {
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 0), "floatValue");
        v46 = v55;
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 1), "floatValue");
        v44 = v56;
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 2), "floatValue");
        v45 = v57;
        v136 = v46;
        acLog("    Found vector: %.3f,%.3f,%.3f\n", v58, v59, v60, v61, v62, v63, v64, SLOBYTE(v136));
      }
    }
    v137 = v46;
    acLog("acc = (%.5f, %.5f, %.5f)\n", v36, v37, v38, v39, v40, v41, v42, SLOBYTE(v137));
    v65 = (float)(v44 * v44) + (float)(v46 * v46);
    v34 = atan2f(v45, sqrtf(v65));
    v33 = sqrtf(v65 + (float)(v45 * v45)) + -1.0;
    v73 = atan2f(v44, v46);
    switch(v32)
    {
      case 1:
        v43 = flt_192495A90[v73 < 0.0];
        goto LABEL_13;
      case 3:
        goto LABEL_13;
      case 6:
        v43 = 1.5708;
        goto LABEL_13;
      case 8:
        v43 = -1.5708;
LABEL_13:
        v74 = (float)((float)(v73 + v43) * -180.0) / 3.14159265;
        v141 = v74;
        v75 = v74;
        acLog("accelTilt = %.3f deg, accelPitch = %.3f deg, accMagnitudeDev %.3f\n", v66, v67, v68, v69, v70, v71, v72, SLOBYTE(v75));
        LODWORD(v23) = 1;
        break;
      default:
        v109 = (float)((float)(v73 + 0.0) * -180.0) / 3.14159265;
        v141 = v109;
        v110 = (float)(v34 * 180.0) / 3.14159265;
        acLog("accelPitch = %.3f deg, accelMagnitudeDev = %.3f\n", v66, v67, v68, v69, v70, v71, v72, SLOBYTE(v110));
        LODWORD(v23) = 0;
        break;
    }
  }
  else
  {
    v33 = 0.0;
    v141 = 0.0;
    v34 = 0.0;
  }
  CFPreferenceFloat = getCFPreferenceFloat(CFSTR("MaxAccelPitch"), CFSTR("com.apple.mobileslideshow"), 25.0);
  v77 = getCFPreferenceFloat(CFSTR("MaxPixelTilt"), CFSTR("com.apple.mobileslideshow"), 10.0);
  v78 = getCFPreferenceFloat(CFSTR("MinPixelTilt"), CFSTR("com.apple.mobileslideshow"), 1.0);
  v79 = getCFPreferenceFloat(CFSTR("MaxAccelMagDev"), CFSTR("com.apple.mobileslideshow"), 0.03);
  v87 = getCFPreferenceFloat(CFSTR("MaxAccelFFTDiff"), CFSTR("com.apple.mobileslideshow"), 5.0);
  if (a7 == -1.0)
    v88 = v77;
  else
    v88 = a7;
  if (v146 == -1.0)
    v89 = v78;
  else
    v89 = v146;
  v90 = CFPreferenceFloat;
  v91 = v88;
  v92 = v89;
  v140 = v79;
  v139 = v89;
  acLog("MaxPitch = %.3f, MaxPixelTilt = %.3f, MinPixelTilt = %.3f, MaxAccelMagDev = %.3f, MaxAccelFFTDifff = %.3f\n", v80, v81, v82, v83, v84, v85, v86, SLOBYTE(v90));
  if (fabsf(v33) <= v79)
    v93 = (int)v23;
  else
    v93 = 0;
  v94 = v90 * 3.14159265 / 180.0;
  if (fabsf(v34) > v94)
    return 0;
  v95 = (double)CGImageGetWidth(a4);
  v96 = CGImageGetHeight(a4);
  v97 = (float)v96;
  v98 = v95;
  if (v95 > (double)v96)
    v99 = (int)(float)((float)((float)(v98 / v97) * 256.0) + 0.5);
  else
    v99 = 256;
  if (v95 > (double)v96)
    v100 = 256;
  else
    v100 = (int)(float)((float)((float)(v97 / v98) * 256.0) + 0.5);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v102 = (4 * v99 + 60) & 0xFFFFFFC0;
  v103 = malloc_type_malloc(v102 * (int)v100, 0xCC9713CDuLL);
  v104 = CGBitmapContextCreate(v103, (int)v99, (int)v100, 8uLL, v102, DeviceRGB, 5u);
  CGContextSetInterpolationQuality(v104, kCGInterpolationHigh);
  v152.size.width = (double)(int)v99;
  v152.size.height = (double)(int)v100;
  v152.origin.x = 0.0;
  v152.origin.y = 0.0;
  CGContextDrawImage(v104, v152, a4);
  CGContextRelease(v104);
  CGColorSpaceRelease(DeviceRGB);
  v149 = 0.0;
  if (v10)
  {
    if (a10 == -1.0)
      v105 = 0.17453;
    else
      v105 = a10 * 3.14159265 / 180.0;
    v150.a = 0.0;
    *(_QWORD *)&v150.b = &v150;
    *(_QWORD *)&v150.c = 0x2020000000;
    v111 = gethorizonDetectionFFTAnglesSymbolLoc_ptr;
    *(_QWORD *)&v150.d = gethorizonDetectionFFTAnglesSymbolLoc_ptr;
    if (!gethorizonDetectionFFTAnglesSymbolLoc_ptr)
    {
      v112 = (void *)VisionLibrary();
      v111 = dlsym(v112, "horizonDetectionFFTAngles");
      *(_QWORD *)(*(_QWORD *)&v150.b + 24) = v111;
      gethorizonDetectionFFTAnglesSymbolLoc_ptr = v111;
    }
    _Block_object_dispose(&v150, 8);
    if (!v111)
      -[CIImage(AutoAdjustCrop) autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:].cold.1();
    v113 = ((uint64_t (*)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, CGAffineTransform *, float))v111)(v103, (4 * (_DWORD)v99 + 60) & 0xFFFFFFC0, v99, v100, 1, 5, &v150, v105);
    v108 = *(float *)&v150.a;
    v149 = *(float *)&v150.a;
    if (a9 == -1.0)
    {
      v115 = 0.0349065848;
    }
    else
    {
      v114 = a9 * 3.14159265 / 180.0;
      v115 = v114;
    }
    if (v113 >= 1)
    {
      v116 = v113;
      v117 = (float *)&v150.a + 1;
      while (*v117 <= 0.1 || fabs(fabsf(*(v117 - 1)) + -1.57079637) >= v115)
      {
        v117 += 2;
        if (!--v116)
          goto LABEL_52;
      }
      v149 = 0.0;
      v108 = 0.0;
    }
LABEL_52:
    v118 = v108;
    v119 = fabs(v108);
    if (v119 <= 2.35619449)
    {
      if (v119 < 0.785398163)
        goto LABEL_57;
      v120 = v118 + 1.57079633;
    }
    else
    {
      v120 = v118 + 3.14159265;
    }
    v108 = v120;
    v149 = v108;
  }
  else
  {
    v150.a = 0.0;
    *(_QWORD *)&v150.b = &v150;
    *(_QWORD *)&v150.c = 0x2020000000;
    v106 = gethorizonDetectionFFTSymbolLoc_ptr;
    *(_QWORD *)&v150.d = gethorizonDetectionFFTSymbolLoc_ptr;
    if (!gethorizonDetectionFFTSymbolLoc_ptr)
    {
      v107 = (void *)VisionLibrary();
      v106 = dlsym(v107, "horizonDetectionFFT");
      *(_QWORD *)(*(_QWORD *)&v150.b + 24) = v106;
      gethorizonDetectionFFTSymbolLoc_ptr = v106;
    }
    _Block_object_dispose(&v150, 8);
    if (!v106)
      -[CIImage(AutoAdjustCrop) autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:].cold.2();
    ((void (*)(void *, _QWORD, uint64_t, uint64_t, float *, uint64_t))v106)(v103, (4 * (_DWORD)v99 + 60) & 0xFFFFFFC0, v99, v100, &v149, 1);
    v108 = v149;
  }
LABEL_57:
  free(v103);
  v138 = (float)(v108 * 180.0) / 3.14159265;
  acLog("FFT detected angle = %.3f deg\n", v121, v122, v123, v124, v125, v126, v127, SLOBYTE(v138));
  v129 = v92 * 3.14159265 / 180.0;
  v130 = v149;
  v131 = fabsf(v149);
  if (v131 >= v129)
  {
    v128 = v91 * 3.14159265 / 180.0;
    v132 = v131 > v128;
  }
  else
  {
    v132 = 1;
  }
  if (v132 || v93 && vabds_f32((float)(v149 * 180.0) / 3.1416, v141) > v87)
    return 0;
  memset(&v150, 0, sizeof(v150));
  CGAffineTransformMakeTranslation(&v150, v142 * 0.5, v143 * 0.5);
  v147 = v150;
  CGAffineTransformRotate(&v148, &v147, v130);
  v150 = v148;
  v147 = v148;
  CGAffineTransformTranslate(&v148, &v147, v142 * -0.5, v143 * -0.5);
  v150 = v148;
  return +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIAffineTransform"), CFSTR("inputTransform"), objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v150, "{CGAffineTransform=dddddd}"), 0, *(_QWORD *)&v139, *(_QWORD *)&v140, v87);
}

- (void)getAutocropRect:(id)a3 rotateXfrm:(CGAffineTransform *)a4 inputImageRect:(CGRect)a5 clipRect:(CGRect *)a6
{
  CGFloat height;
  CGFloat width;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double y;
  double x;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float v64;
  double v65;
  float v66;
  float v67;
  float v68;
  float v69;
  AutoCropper *v70;
  id v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  float v76;
  double v77;
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
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  const char *v93;
  CGFloat v94;
  char v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGSize v100;
  CGPoint v101;
  __int128 v102;
  CGAffineTransform v103;
  CGRect v104;
  __int128 v105;
  double v106[4];
  CGRect v107;
  CGRect v108;
  CGRect v109;

  height = a5.size.height;
  width = a5.size.width;
  v11 = objc_msgSend(a3, "count", a5.origin.x, a5.origin.y);
  acLog("Crop: Based on %d features\n", v12, v13, v14, v15, v16, v17, v18, v11);
  if (objc_msgSend(a3, "count"))
  {
    v96 = width;
    v97 = height;
    x = a6->origin.x;
    y = a6->origin.y;
    v21 = a6->size.width;
    v22 = a6->size.height;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v98 = v21;
    v99 = v22;
    if (objc_msgSend(a3, "count"))
    {
      v24 = 0;
      v25 = x + v21;
      v26 = y + v22;
      v27 = 0.0;
      v102 = *MEMORY[0x1E0C9D538];
      v100 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v101 = (CGPoint)*MEMORY[0x1E0C9D648];
      v28 = 0.0;
      v29 = 0.0;
      v30 = 0.0;
      do
      {
        v31 = (void *)objc_msgSend(a3, "objectAtIndex:", v24);
        v105 = v102;
        *(_OWORD *)v106 = v102;
        v104.origin = v101;
        v104.size = v100;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("bounds"));
          if (v32)
            objc_msgSend(v32, "getValue:", &v104);
          v33 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("leftEyePosition"));
          v34 = v33 != 0;
          if (v33)
            objc_msgSend(v33, "getValue:", v106);
          v35 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("rightEyePosition"));
          if (v35)
          {
            objc_msgSend(v35, "getValue:", &v105);
            v36 = 1;
          }
          else
          {
            v36 = 0;
          }
        }
        else
        {
          objc_msgSend(v31, "bounds");
          v104.origin.x = v37;
          v104.origin.y = v38;
          v104.size.width = v39;
          v104.size.height = v40;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = objc_msgSend(v31, "hasLeftEyePosition");
            v36 = objc_msgSend(v31, "hasRightEyePosition");
            objc_msgSend(v31, "leftEyePosition");
            v106[0] = v41;
            v106[1] = v42;
            objc_msgSend(v31, "rightEyePosition");
            *(_QWORD *)&v105 = v43;
            *((_QWORD *)&v105 + 1) = v44;
          }
          else
          {
            v36 = 0;
            v34 = 0;
          }
        }
        v45 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v103.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v103.c = v45;
        *(_OWORD *)&v103.tx = *(_OWORD *)&a4->tx;
        v107 = CGRectApplyAffineTransform(v104, &v103);
        v104 = v107;
        if (v34 && v36)
        {
          a = a4->a;
          b = a4->b;
          c = a4->c;
          d = a4->d;
          tx = a4->tx;
          ty = a4->ty;
          v59 = ty + v106[1] * d + b * v106[0];
          v106[0] = tx + v106[1] * c + a4->a * v106[0];
          v106[1] = v59;
          v60 = ty + d * *((double *)&v105 + 1) + b * *(double *)&v105;
          *(double *)&v105 = tx + c * *((double *)&v105 + 1) + a * *(double *)&v105;
          *((double *)&v105 + 1) = v60;
          acLog("  feature%d has left eye at (%.3f,%.3f), right eye at (%.3f,%.3f)\n", v46, v47, v48, v49, v50, v51, v52, v24);
          v61 = (v106[0] + *(double *)&v105) * 0.5;
          v62 = (v106[1] + *((double *)&v105 + 1)) * 0.5;
          v63 = v61 - v104.origin.x;
          if (v61 - v104.origin.x <= v104.origin.x + v104.size.width - v61)
            v63 = v104.origin.x + v104.size.width - v61;
          v64 = v63;
          v65 = v104.origin.y + v104.size.height - v62;
          if (v62 - v104.origin.y > v65)
            v65 = v62 - v104.origin.y;
          v66 = v65;
          if (v61 - v64 < x)
          {
            v67 = v61 - x;
            v64 = v67;
          }
          if (v61 + v64 > v25)
          {
            v68 = v25 - v61;
            v64 = v68;
          }
          if (v62 - v66 < y)
          {
            v69 = v62 - y;
            v66 = v69;
          }
          if (v62 + v66 > v26)
            v66 = v26 - v62;
          v107.origin.x = v61 - v64;
          v107.origin.y = v62 - v66;
          v104.size.width = (float)(v64 + v64);
          v104.size.height = (float)(v66 + v66);
        }
        v104.origin.x = v107.origin.x - x;
        v104.origin.y = v107.origin.y - y;
        objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v104, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        if (v24)
        {
          v108.origin.x = v27;
          v108.origin.y = v28;
          v108.size.width = v29;
          v108.size.height = v30;
          v109 = CGRectUnion(v108, v104);
          v27 = v109.origin.x;
          v28 = v109.origin.y;
          v29 = v109.size.width;
          v30 = v109.size.height;
        }
        else
        {
          v28 = v104.origin.y;
          v27 = v104.origin.x;
          v30 = v104.size.height;
          v29 = v104.size.width;
        }
        ++v24;
      }
      while (objc_msgSend(a3, "count") > v24);
    }
    else
    {
      v30 = 0.0;
      v29 = 0.0;
      v28 = 0.0;
      v27 = 0.0;
    }
    v70 = objc_alloc_init(AutoCropper);
    v71 = -[AutoCropper clusterRects:](v70, "clusterRects:", v23);
    memset(&v103, 0, 32);
    objc_msgSend((id)objc_msgSend(v71, "objectAtIndex:", 0), "getValue:", &v103);
    -[AutoCropper computeClippingWithinSize:forImportantRect:andType:restrictRect:](v70, "computeClippingWithinSize:forImportantRect:andType:restrictRect:", 0, v98, v99, v103.a, v103.b, v103.c, v103.d, *(_QWORD *)&v27, *(_QWORD *)&v28, *(_QWORD *)&v29, *(_QWORD *)&v30);
    a6->origin.x = v72;
    a6->origin.y = v73;
    a6->size.width = v74;
    a6->size.height = v75;
    v76 = v96 * v97;
    *(float *)&v72 = v74 * v75;
    v77 = (float)((float)(*(float *)&v72 * 100.0) / v76);
    acLog("  clip overall %% = %.3f\n", v78, v79, v80, v81, v82, v83, v84, SLOBYTE(v77));
    v92 = a6->size.width * a6->size.height;
    if (v92 >= (float)(v76 * 0.75))
    {
      if (v92 <= (float)(v76 * 0.99))
      {
        v94 = y + a6->origin.y;
        a6->origin.x = x + a6->origin.x;
        a6->origin.y = v94;
        goto LABEL_42;
      }
      v93 = "    too little clipping - reverting back\n";
    }
    else
    {
      v93 = "    too much clipping - reverting back to rotated crop only\n";
    }
    acLog(v93, v85, v86, v87, v88, v89, v90, v91, v95);
    a6->origin.x = x;
    a6->origin.y = y;
    a6->size.width = v98;
    a6->size.height = v99;
LABEL_42:

  }
}

- (CIImage)imageWithExtent:(CGRect)a3 processorDescription:(id)a4 argumentDigest:(unint64_t)a5 inputFormat:(int)a6 outputFormat:(int)a7 options:(id)a8 roiCallback:(id)a9 processor:(id)a10
{
  uint64_t v12;
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  const char *v21;
  int v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CIImage *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  CI::Object *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  CI::Image *v59;
  int v60;
  _QWORD v61[6];
  _QWORD v62[5];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v67 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (a10)
  {
    if (kCIFormatAllowSRGB != (_DWORD)v13)
      LODWORD(v13) = CI::format_modernize(v13, (CI *)"-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:]", v21);
    if (!(_DWORD)v13
      || (_DWORD)v13 == 274
      || (_DWORD)v13 == kCIFormatAllowSRGB
      || (CI::ProcessorImage::format_is_supported(v13, 1) & 1) != 0)
    {
      if (kCIFormatAllowSRGB == (_DWORD)v12
        || (v23 = CI::format_modernize(v12, (CI *)"-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:]", v21), (LODWORD(v12) = v23) == 0)|| v23 == kCIFormatAllowSRGB|| (CI::ProcessorImage::format_is_supported(v23, 0) & 1) != 0)
      {
        if (!a5)
        {
          v24 = ci_logger_performance();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v64 = "-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputForm"
                  "at:options:roiCallback:processor:]";
            v65 = 2114;
            v66 = a4;
            _os_log_impl(&dword_1921E4000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s argumentDigest is 0 which will prevent CoreImage from caching %{public}@ optimally.", buf, 0x16u);
          }
        }
        v60 = objc_msgSend((id)objc_msgSend(a8, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
        if (!a4)
          a4 = CFSTR("Image Processor");
        v59 = -[CIImage _internalRepresentation](self, "_internalRepresentation");
        v34 = (void *)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageProcessorSynchronizeInputs"));
        if (v34)
          v58 = objc_msgSend(v34, "BOOLValue");
        else
          v58 = 1;
        v35 = (void *)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageProcessorAllowPartialOutputRegion"));
        if (v35)
          v36 = objc_msgSend(v35, "BOOLValue");
        else
          v36 = 1;
        v37 = (void *)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageProcessorAllowCompressedInputsAndOutputs"));
        if (v37)
          v38 = objc_msgSend(v37, "BOOLValue");
        else
          v38 = 0;
        v39 = (void *)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageProcessorCanOutputLossyCompressed"));
        if (v39)
          v40 = objc_msgSend(v39, "BOOLValue");
        else
          v40 = 0;
        v41 = (CI::Object *)operator new();
        v61[5] = a10;
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke;
        v62[3] = &unk_1E2EC44F8;
        v62[4] = a9;
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke_2;
        v61[3] = &unk_1E2EC4520;
        v61[4] = a4;
        CI::ProcessorImage::ProcessorImage((uint64_t)v41, v59, (const __CFString *)a4, a5, v38, v13, v12, v60, x, y, width, height, v40, 0, v36, v58, v62, v61);
        v33 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v41);
        CI::Object::unref(v41);
        return v33;
      }
      v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    else
    {
      v50 = ci_logger_api();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:].cold.3(v50, v51, v52, v53, v54, v55, v56, v57);
    }
  }
  else
  {
    v25 = ci_logger_api();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
  }
  return 0;
}

double *__136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke@<X0>(uint64_t a1@<X0>, double **a2@<X8>)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double *result;

  v3 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  result = (double *)operator new(0x20uLL);
  a2[1] = result + 4;
  a2[2] = result + 4;
  *result = v3;
  *((_QWORD *)result + 1) = v5;
  *((_QWORD *)result + 2) = v7;
  *((_QWORD *)result + 3) = v9;
  *a2 = result;
  return result;
}

void __136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke_2(uint64_t a1, _QWORD **a2, _QWORD **a3, _QWORD **a4, double **a5, _DWORD **a6, uint64_t a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16, uint64_t a17)
{
  CIImageProcessorInput *v21;
  CIImageProcessorOutput *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint64_t v30;
  uint64_t v31;
  CIImageProcessorInput *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v21 = -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:context:]([CIImageProcessorInput alloc], "initWithSurface:texture:digest:allowSRGB:bounds:context:", **a2, **a3, (*a3)[1], **a4, **a6 & 1, a17, **a5, (*a5)[1], (*a5)[2], (*a5)[3]);
  v22 = -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:]([CIImageProcessorOutput alloc], "initWithSurface:texture:digest:allowSRGB:bounds:context:", a7, a13, a14, a15, a16, a17, a8, a9, a10, a11);
  v23 = (void *)MEMORY[0x194026220]();
  v24 = ci_signpost_log_render();
  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a17 + 272))(a17) << 32;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v36 = v26;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "processor_process", "%{public}@", buf, 0xCu);
  }
  v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a17 + 272))(a17);
  TimerBase::TimerBase((uint64_t)buf, v27, 0, (uint64_t)"processor_process", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _ZZZ136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor__EUb_EN13SignpostTimerD1Ev((TimerBase *)buf);
  v28 = ci_signpost_log_render();
  v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a17 + 272))(a17) << 32;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    v30 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v36 = v30;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "processor_postprocess", "%{public}@", buf, 0xCu);
  }
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a17 + 272))(a17);
  TimerBase::TimerBase((uint64_t)buf, v31, 0, (uint64_t)"processor_postprocess", 0);
  v34 = v21;
  post_process((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1), v22, a17);
  _ZZZ136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor__EUb_EN13SignpostTimerD1E_0v((TimerBase *)buf);
  objc_autoreleasePoolPop(v23);

}

+ (CIImage)imageWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  return -[CIImage initWithImageProvider:userInfo:size:format:flipped:colorSpace:]([CIImage alloc], "initWithImageProvider:userInfo:size:format:flipped:colorSpace:", a3, a4, *(_QWORD *)&a6, a7, a8, a5.width, a5.height);
}

+ (CIImage)imageWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options
{
  return -[CIImage initWithImageProvider:size::format:colorSpace:options:]([CIImage alloc], "initWithImageProvider:size::format:colorSpace:options:", p, width, height, *(_QWORD *)&f, cs, options);
}

- (CIImage)initWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("user_info");
  v10[1] = CFSTR("CIImageFlipped");
  v8 = MEMORY[0x1E0C9AAA0];
  if (a7)
    v8 = MEMORY[0x1E0C9AAB0];
  v11[0] = a4;
  v11[1] = v8;
  return -[CIImage initWithImageProvider:size::format:colorSpace:options:](self, "initWithImageProvider:size::format:colorSpace:options:", a3, (unint64_t)a5.width, (unint64_t)a5.height, *(_QWORD *)&a6, a8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
}

- (CIImage)initWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options
{
  uint64_t v10;
  const char *v15;
  char v16;
  id v17;
  BOOL v18;
  void *v19;
  objc_class *v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  _QWORD v31[8];
  BOOL v32;

  v10 = *(_QWORD *)&f;
  NSSelectorFromString(CFSTR("provideImageData:bytesPerRow:origin::size::userInfo:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = CI::format_modernize(v10, (CI *)"-[CIImage(CIImageProvider) initWithImageProvider:size::format:colorSpace:options:]", v15);
    NSSelectorFromString(CFSTR("provideImageTexture:bounds:userInfo:"));
    v16 = objc_opt_respondsToSelector() ^ 1;
    v17 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("user_info"));
    v18 = CI_LOG_IMAGE_PROVIDER() != 0;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
    if (!-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIImageProviderName")))
    {
      v20 = (objc_class *)objc_opt_class();
      objc_msgSend(v19, "setObject:forKey:", NSStringFromClass(v20), CFSTR("kCIImageProviderName"));
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __82__CIImage_CIImageProvider__initWithImageProvider_size::format_colorSpace_options___block_invoke;
    v31[3] = &unk_1E2EC45F8;
    v32 = v18;
    v31[6] = width;
    v31[7] = height;
    v31[4] = p;
    v31[5] = v17;
    return (CIImage *)-[CIImage _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:](self, "_initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:", v31, width, height, v30, cs, v16 & 1, v19);
  }
  else
  {
    v22 = ci_logger_api();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CIImage(CIImageProvider) initWithImageProvider:size::format:colorSpace:options:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    return 0;
  }
}

uint64_t __82__CIImage_CIImageProvider__initWithImageProvider_size::format_colorSpace_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend((id)objc_opt_class(), "description");
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544642;
      v21 = v15;
      v22 = 2048;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = v18;
      v28 = 2048;
      v29 = a4;
      v30 = 2048;
      v31 = a5;
      _os_log_impl(&dword_1921E4000, v14, OS_LOG_TYPE_INFO, "CIImageProvider <%{public}@ %p> %zux%zu at %zu,%zu", buf, 0x3Eu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "provideImageData:bytesPerRow:origin::size::userInfo:", a2, a3, a4, a5, a6, a7, *(_QWORD *)(a1 + 40));
}

- (CIImage)initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8
{
  return (CIImage *)-[CIImage _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:](self, "_initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:", a3, a4, a5, CI::format_modernize(*(uint64_t *)&a6, (CI *)"-[CIImage(CIImageProvider) initWithImageProvider:width:height:format:colorSpace:options:]", (const char *)a3), a7, 1, a8);
}

- (id)_initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 surfaceCache:(BOOL)a8 options:(id)a9
{
  int v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char v23;
  int v24;
  int v25;
  unsigned __int8 v26;
  int v27;
  int v28;
  CGColorSpace *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  BOOL v41;
  double v42;
  double v43;
  double v44;
  int v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t i;
  int v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t j;
  int v84;
  void *v85;
  void **v86;
  void **v87;
  void **v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  void **v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  void **v121;
  void *v122;
  void **v123;
  void **v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  void *v130;
  void **v131;
  void *v132;
  __int128 v133;
  int64_t v134;
  char *v135;
  void **v136;
  int64_t v137;
  char *v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t ContentDigestFromOptions;
  float v156;
  float v157;
  CI::ColorMatchImage *v158;
  CI::Image *DeviceRGB;
  CGColorSpace *v160;
  char v161;
  NSObject *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  char v171;
  const void *v172;
  const void *v173;
  char v174;
  char v175;
  int v176;
  int v177;
  CGColorSpace *v178;
  int v179;
  _QWORD v183[3];
  __int128 v184;
  double v185;
  uint64_t v186[3];
  _QWORD v187[5];
  void *__p;
  void *v189;
  uint64_t v190;
  void *v191;
  void *__dst;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  void **v196;
  void **v197;
  char *v198;
  __int128 v199;
  _QWORD v200[2];
  __int128 v201;
  uint64_t v202;
  void **v203;

  if (a3 && a4 && a5)
  {
    v12 = CI::format_modernize(*(uint64_t *)&a6, (CI *)"-[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:]", (const char *)a3);
    if (!CI::format_is_supported_source_bitmap(v12) || CI::format_is_ycc_biplanar(v12))
    {
      v13 = CI::name_for_format(v12);
      v14 = ci_logger_api();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

      return 0;
    }
    v179 = v12;
    if (objc_msgSend(a9, "objectForKey:", CFSTR("CIImageFlipped")))
      v23 = objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageFlipped")), "BOOLValue");
    else
      v23 = 1;
    v178 = a7;
    v170 = v23;
    if (CI::format_has_unpremul_alpha(v179))
      v24 = 2;
    else
      v24 = CI::format_has_alpha(v179) ^ 1;
    if (objc_msgSend(a9, "objectForKey:", CFSTR("CIImagePremultiplied")))
    {
      if (objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImagePremultiplied")), "BOOLValue"))
        v24 = 0;
      else
        v24 = 2;
    }
    v25 = objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
    if (CI::format_is_ycc(v179) | v25)
      v24 = 1;
    v26 = objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageEdgesAreClear")), "BOOLValue");
    if ((v26 & (v24 == 0)) != 0)
      v27 = 4;
    else
      v27 = v24;
    if ((v26 & (v27 == 2)) != 0)
      v28 = 6;
    else
      v28 = v27;
    v177 = v28;
    if ((objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageClampToEdge")), "BOOLValue") & 1) != 0)
    {
      v176 = 1;
      v29 = v178;
    }
    else
    {
      v29 = v178;
      if (objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageEdgeRepeat")), "BOOLValue"))
        NSLog(CFSTR("CIImage kCIImageEdgeRepeat not supported."));
      v176 = 0;
    }
    if (objc_msgSend(a9, "objectForKey:", CFSTR("CIImageNearestSampling")))
      v175 = objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageNearestSampling")), "BOOLValue");
    else
      v175 = 0;
    if (objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageCacheHint")))
    {
      v174 = objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageCacheHint")), "BOOLValue");
      if (!v29)
        goto LABEL_44;
    }
    else
    {
      v174 = 0;
      if (!v29)
        goto LABEL_44;
    }
    if ((CGColorSpace *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v29 && !CI_NO_CM())
    {
      v171 = 0;
LABEL_45:
      v173 = (const void *)objc_msgSend(a9, "objectForKey:", CFSTR("CIImageProperties"));
      if (a4 <= 0x3FF)
        v30 = a4;
      else
        v30 = 512;
      if (a5 <= 0x3FF)
        v31 = a5;
      else
        v31 = 512;
      v32 = objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageProviderName"));
      if (v32)
      {
        v33 = v32;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v34 = (const void *)v33;
        else
          v34 = 0;
        v172 = v34;
      }
      else
      {
        v172 = 0;
      }
      v201 = 0uLL;
      v202 = 0;
      v35 = (void *)objc_msgSend(a9, "objectForKey:", CFSTR("tile_size"));
      v36 = a4;
      v37 = a5;
      if (v35)
      {
        if (objc_msgSend(v35, "isEqual:", CFSTR("kCIImageProviderMaximumTileSize")))
        {
          if (max_safe_tile_size(void)::onceToken != -1)
            dispatch_once(&max_safe_tile_size(void)::onceToken, &__block_literal_global_42);
          if (max_safe_tile_size(void)::max_size >= a4)
            v36 = a4;
          else
            v36 = max_safe_tile_size(void)::max_size;
          if (max_safe_tile_size(void)::max_size >= a5)
            v37 = a5;
          else
            v37 = max_safe_tile_size(void)::max_size;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = v30;
            v37 = v31;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", 0), "intValue");
              v39 = objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", 1), "intValue");
              if (v38 >= 1)
                v36 = v38;
              else
                v36 = v30;
              if (v39 >= 1)
                v37 = v39;
              else
                v37 = v31;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                LODWORD(v36) = objc_msgSend(v35, "intValue");
                v40 = (int)v36;
                v41 = (int)v36 < 1;
                if ((int)v36 >= 1)
                  v36 = (int)v36;
                else
                  v36 = v30;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v162 = ci_logger_api();
                  if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
                    -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.8(v162, v163, v164, v165, v166, v167, v168, v169);

                  goto LABEL_212;
                }
                objc_msgSend(v35, "X");
                v43 = v42;
                objc_msgSend(v35, "Y");
                v45 = (int)v44;
                if ((int)v43 >= 1)
                  v36 = (int)v43;
                else
                  v36 = v30;
                v40 = v45;
                v41 = v45 < 1;
              }
              if (v41)
                v37 = v31;
              else
                v37 = v40;
            }
          }
        }
      }
      if (v36 && v37 && (v36 < a4 || v37 < a5))
      {
        CI::Tileable::TileRectGridMakeEqualSizedTilesWithImageSize(v36, v37, a4, a5, (uint64_t *)&v199);
        std::vector<std::vector<IRect>>::__vdeallocate((uint64_t *)&v201);
        v201 = v199;
        v202 = v200[0];
        v200[0] = 0;
        v199 = 0uLL;
        v196 = (void **)&v199;
        std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](&v196);
      }
      v46 = (void *)objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageProviderTileWidthArray"));
      v47 = (void *)objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageProviderTileHeightArray"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_213:
          ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a9, CFSTR("kCIImageContentDigest"));
          if (!ContentDigestFromOptions)
            ContentDigestFromOptions = getContentDigestFromOptions((NSDictionary *)a9, CFSTR("kCIImageProviderContentDigest"));
          if (objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageContentHeadroom")))
          {
            objc_msgSend((id)objc_msgSend(a9, "objectForKey:", CFSTR("kCIImageContentHeadroom")), "floatValue");
            v157 = v156;
          }
          else
          {
            v157 = 0.0;
          }
          v158 = (CI::ColorMatchImage *)operator new();
          v187[0] = MEMORY[0x1E0C809B0];
          v187[1] = 3221225472;
          v187[2] = __103__CIImage_CIImageProvider___initWithImageProvider_width_height_format_colorSpace_surfaceCache_options___block_invoke;
          v187[3] = &unk_1E2EC4620;
          v187[4] = a3;
          memset(v186, 0, sizeof(v186));
          std::vector<std::vector<IRect>>::__init_with_size[abi:nn180100]<std::vector<IRect>*,std::vector<IRect>*>(v186, v201, *((uint64_t *)&v201 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v201 + 1) - v201) >> 3));
          CI::ProviderImage::ProviderImage((uint64_t)v158, ContentDigestFromOptions, v172, v187, a4, a5, v186, v179, v157, 0, v173, v177, v176, v175, v174, a8);
          *(_QWORD *)&v199 = v186;
          std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v199);
          if ((v171 & 1) == 0)
          {
            if (v178)
              DeviceRGB = CGColorSpaceRetain(v178);
            else
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
            v160 = DeviceRGB;
            v158 = CI::ColorMatchImage::append_and_unref(v158, DeviceRGB, 0);
            CGColorSpaceRelease(v160);
          }
          v161 = v170 ^ 1;
          if (a5 == 1)
            v161 = 1;
          if ((v161 & 1) == 0)
          {
            v183[1] = 0;
            v183[2] = 0;
            v183[0] = 0x3FF0000000000000;
            v184 = xmmword_192493540;
            v185 = (double)a5;
            v158 = CI::AffineImage::append_and_unref(v158, (CI::Image *)v183, 0);
          }
          v21 = -[CIImage _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v158);
          if (v158)
            CI::Object::unref(v158);
          goto LABEL_229;
        }
      }
      v199 = 0uLL;
      v200[0] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0;
        for (i = 0; i < objc_msgSend(v46, "count"); ++i)
        {
          objc_msgSend(v46, "objectAtIndexedSubscript:", i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v104 = ci_logger_api();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.3(v104, v105, v106, v107, v108, v109, v110, v111);
            goto LABEL_172;
          }
          if ((int)objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", i), "intValue") <= 0)
          {
            v112 = ci_logger_api();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.2(v112, v113, v114, v115, v116, v117, v118, v119);
            goto LABEL_172;
          }
          v50 = objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", i), "intValue");
          v51 = v50;
          v52 = (char *)*((_QWORD *)&v199 + 1);
          if (*((_QWORD *)&v199 + 1) >= v200[0])
          {
            v54 = (char *)v199;
            v55 = (uint64_t)(*((_QWORD *)&v199 + 1) - v199) >> 3;
            v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) >> 61)
              abort();
            v57 = v200[0] - v199;
            if ((uint64_t)(v200[0] - v199) >> 2 > v56)
              v56 = v57 >> 2;
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
              v58 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v58 = v56;
            if (v58)
            {
              v59 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)v200, v58);
              v52 = (char *)*((_QWORD *)&v199 + 1);
              v54 = (char *)v199;
            }
            else
            {
              v59 = 0;
            }
            v60 = &v59[8 * v55];
            *(_QWORD *)v60 = v51;
            v53 = v60 + 8;
            while (v52 != v54)
            {
              v61 = *((_QWORD *)v52 - 1);
              v52 -= 8;
              *((_QWORD *)v60 - 1) = v61;
              v60 -= 8;
            }
            *(_QWORD *)&v199 = v60;
            *((_QWORD *)&v199 + 1) = v53;
            v200[0] = &v59[8 * v58];
            if (v54)
              operator delete(v54);
          }
          else
          {
            **((_QWORD **)&v199 + 1) = v50;
            v53 = v52 + 8;
          }
          *((_QWORD *)&v199 + 1) = v53;
          v48 += (int)objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", i), "intValue");
        }
      }
      else
      {
        if (v46)
        {
          v62 = ci_logger_api();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.7(v62, v63, v64, v65, v66, v67, v68, v69);
LABEL_172:

          v120 = 1;
LABEL_209:
          if ((_QWORD)v199)
          {
            *((_QWORD *)&v199 + 1) = v199;
            operator delete((void *)v199);
          }
          if (v120)
          {
LABEL_212:
            v21 = 0;
LABEL_229:
            *(_QWORD *)&v199 = &v201;
            std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v199);
            return v21;
          }
          goto LABEL_213;
        }
        v48 = 0;
      }
      if (v48 < a4)
      {
        v70 = (_QWORD *)*((_QWORD *)&v199 + 1);
        do
        {
          v71 = *(v70 - 1);
          if ((unint64_t)v70 >= v200[0])
          {
            v73 = (_QWORD *)v199;
            v74 = (uint64_t)((uint64_t)v70 - v199) >> 3;
            v75 = v74 + 1;
            if ((unint64_t)(v74 + 1) >> 61)
              abort();
            v76 = v200[0] - v199;
            if ((uint64_t)(v200[0] - v199) >> 2 > v75)
              v75 = v76 >> 2;
            if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
              v77 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v77 = v75;
            if (v77)
            {
              v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)v200, v77);
              v79 = *(v70 - 1);
              v70 = (_QWORD *)*((_QWORD *)&v199 + 1);
              v73 = (_QWORD *)v199;
            }
            else
            {
              v78 = 0;
              v79 = *(v70 - 1);
            }
            v80 = &v78[8 * v74];
            *(_QWORD *)v80 = v79;
            v72 = v80 + 8;
            while (v70 != v73)
            {
              v81 = *--v70;
              *((_QWORD *)v80 - 1) = v81;
              v80 -= 8;
            }
            *(_QWORD *)&v199 = v80;
            *((_QWORD *)&v199 + 1) = v72;
            v200[0] = &v78[8 * v77];
            if (v73)
              operator delete(v73);
          }
          else
          {
            *v70 = v71;
            v72 = v70 + 1;
          }
          v48 += v71;
          *((_QWORD *)&v199 + 1) = v72;
          v70 = v72;
        }
        while (v48 < a4);
      }
      v196 = 0;
      v197 = 0;
      v198 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v82 = 0;
        for (j = 0; j < objc_msgSend(v47, "count"); ++j)
        {
          objc_msgSend(v47, "objectAtIndexedSubscript:", j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v139 = ci_logger_api();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
              -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.5(v139, v140, v141, v142, v143, v144, v145, v146);
            goto LABEL_206;
          }
          if ((int)objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", j), "intValue") <= 0)
          {
            v147 = ci_logger_api();
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
              -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.4(v147, v148, v149, v150, v151, v152, v153, v154);
            goto LABEL_206;
          }
          v84 = objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", j), "intValue");
          v85 = (void *)v84;
          v86 = v197;
          if (v197 >= (void **)v198)
          {
            v88 = v196;
            v89 = v197 - v196;
            v90 = v89 + 1;
            if ((unint64_t)(v89 + 1) >> 61)
              abort();
            v91 = v198 - (char *)v196;
            if ((v198 - (char *)v196) >> 2 > v90)
              v90 = v91 >> 2;
            if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF8)
              v92 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v92 = v90;
            if (v92)
            {
              v93 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v198, v92);
              v88 = v196;
              v86 = v197;
            }
            else
            {
              v93 = 0;
            }
            v94 = (void **)&v93[8 * v89];
            *v94 = v85;
            v87 = v94 + 1;
            while (v86 != v88)
            {
              v95 = *--v86;
              *--v94 = v95;
            }
            v196 = v94;
            v197 = v87;
            v198 = &v93[8 * v92];
            if (v88)
              operator delete(v88);
          }
          else
          {
            *v197 = (void *)v84;
            v87 = v86 + 1;
          }
          v197 = v87;
          v82 += (int)objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", j), "intValue");
        }
      }
      else
      {
        if (v46)
        {
          v96 = ci_logger_api();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.6(v96, v97, v98, v99, v100, v101, v102, v103);
LABEL_206:

          v120 = 1;
          goto LABEL_207;
        }
        v82 = 0;
      }
      if (v82 < a5)
      {
        v121 = v197;
        do
        {
          v122 = *(v121 - 1);
          if (v121 >= (void **)v198)
          {
            v124 = v196;
            v125 = v121 - v196;
            v126 = v125 + 1;
            if ((unint64_t)(v125 + 1) >> 61)
              abort();
            v127 = v198 - (char *)v196;
            if ((v198 - (char *)v196) >> 2 > v126)
              v126 = v127 >> 2;
            if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF8)
              v128 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v128 = v126;
            if (v128)
            {
              v129 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v198, v128);
              v130 = *(v121 - 1);
              v124 = v196;
              v121 = v197;
            }
            else
            {
              v129 = 0;
              v130 = *(v121 - 1);
            }
            v131 = (void **)&v129[8 * v125];
            *v131 = v130;
            v123 = v131 + 1;
            while (v121 != v124)
            {
              v132 = *--v121;
              *--v131 = v132;
            }
            v196 = v131;
            v197 = v123;
            v198 = &v129[8 * v128];
            if (v124)
              operator delete(v124);
          }
          else
          {
            *v121 = v122;
            v123 = v121 + 1;
          }
          v82 += (unint64_t)v122;
          v197 = v123;
          v121 = v123;
        }
        while (v82 < a5);
      }
      __dst = 0;
      v193 = 0;
      v191 = 0;
      v133 = v199;
      v134 = *((_QWORD *)&v199 + 1) - v199;
      if (*((_QWORD *)&v199 + 1) != (_QWORD)v199)
      {
        std::vector<unsigned long>::__vallocate[abi:nn180100](&v191, v134 >> 3);
        v135 = (char *)__dst;
        memmove(__dst, (const void *)v133, v134);
        __dst = &v135[8 * (v134 >> 3)];
      }
      __p = 0;
      v189 = 0;
      v190 = 0;
      v136 = v196;
      v137 = (char *)v197 - (char *)v196;
      if (v197 != v196)
      {
        std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v137 >> 3);
        v138 = (char *)v189;
        memmove(v189, v136, v137);
        v189 = &v138[8 * (v137 >> 3)];
      }
      CI::Tileable::TileRectGridMakeFromWidthAndHeightArrays((uint64_t *)&v191, (int **)&__p, (uint64_t *)&v194);
      std::vector<std::vector<IRect>>::__vdeallocate((uint64_t *)&v201);
      v201 = v194;
      v202 = v195;
      v195 = 0;
      v194 = 0uLL;
      v203 = (void **)&v194;
      std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](&v203);
      if (__p)
      {
        v189 = __p;
        operator delete(__p);
      }
      if (v191)
      {
        __dst = v191;
        operator delete(v191);
      }
      v120 = 0;
LABEL_207:
      if (v196)
      {
        v197 = v196;
        operator delete(v196);
      }
      goto LABEL_209;
    }
LABEL_44:
    v171 = 1;
    goto LABEL_45;
  }

  return 0;
}

uint64_t __103__CIImage_CIImageProvider___initWithImageProvider_width_height_format_colorSpace_surfaceCache_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  return (CIImage *)objc_msgSend(a1, "imageWithYCCImage:matrix:fullRange:precision:colorSpace:", a3, *(_QWORD *)&a4, a5, 8, a6);
}

+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7
{
  void *v9;
  CIImage *result;
  _QWORD v11[3];
  _QWORD v12[3];
  const __CFString *v13;
  CIVector *v14;
  double v15[3];
  double v16[3];
  double v17[3];
  double v18[4];

  v18[3] = *(double *)MEMORY[0x1E0C80C00];
  if (!get_ycc_to_rgb_matrix(a4, a5, a6, v18, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15))
    return 0;
  v13 = CFSTR("inputBiasVector");
  v14 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v18[0], v18[1], v18[2]);
  v9 = (void *)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v11[0] = CFSTR("inputRVector");
  v12[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v17[0], v17[1], v17[2]);
  v11[1] = CFSTR("inputGVector");
  v12[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v16[0], v16[1], v16[2]);
  v11[2] = CFSTR("inputBVector");
  v12[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v15[0], v15[1], v15[2]);
  result = (CIImage *)objc_msgSend(v9, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  if (a7)
    return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](result, "imageByColorMatchingColorSpaceToWorkingSpace:", a7);
  return result;
}

+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  return (CIImage *)objc_msgSend(a1, "imageWithYImage:CrCbImage:CrCbScale:matrix:fullRange:precision:colorSpace:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, 8, a8);
}

+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 precision:(int)a8 colorSpace:(CGColorSpace *)a9
{
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  CIColorKernel *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v23;
  _QWORD v24[3];

  v9 = *(_QWORD *)&a8;
  v10 = a7;
  v11 = *(_QWORD *)&a6;
  v24[2] = *MEMORY[0x1E0C80C00];
  v15 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_yccCombiner);
  v16 = (void *)objc_msgSend(a4, "imageByClampingToExtent");
  CGAffineTransformMakeScale(&v23, (double)a5, (double)a5);
  v17 = objc_msgSend(v16, "imageByApplyingTransform:", &v23);
  objc_msgSend(a3, "extent");
  v24[0] = a3;
  v24[1] = v17;
  return +[CIImage imageWithYCCImage:matrix:fullRange:precision:colorSpace:](CIImage, "imageWithYCCImage:matrix:fullRange:precision:colorSpace:", -[CIColorKernel applyWithExtent:arguments:](v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2), v18, v19, v20, v21), v11, v10, v9, a9);
}

+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  return (id)objc_msgSend(a1, "imageYCC444:matrix:fullRange:precision:colorSpace:", a3, *(_QWORD *)&a4, a5, 8, a6);
}

+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7
{
  _QWORD v10[4];
  _QWORD v11[4];
  double v12[3];
  double v13[3];
  double v14[3];
  double v15[4];

  v15[3] = *(double *)MEMORY[0x1E0C80C00];
  if (!get_rgb_to_ycc_matrix(a4, a5, a6, v15, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12))
    return 0;
  if (a7)
    a3 = (id)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToColorSpace:", a7);
  if ((objc_msgSend(a3, "isOpaque") & 1) == 0)
  {
    objc_msgSend(a3, "extent");
    a3 = (id)objc_msgSend(a3, "imageBySettingAlphaOneInExtent:");
  }
  v10[0] = CFSTR("inputRVector");
  v11[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v14[0], v14[1], v14[2]);
  v10[1] = CFSTR("inputGVector");
  v11[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v13[0], v13[1], v13[2]);
  v10[2] = CFSTR("inputBVector");
  v11[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12[0], v12[1], v12[2]);
  v10[3] = CFSTR("inputBiasVector");
  v11[3] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v15[0], v15[1], v15[2]);
  return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4));
}

- (id)localLightStatisticsWithProxy:(BOOL)a3
{
  uint64_t v3;
  int v4;
  CIImage *v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  double v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  float v40;
  float v41;
  _BYTE *v42;
  NSData *v43;
  void *v44;
  _BYTE *v45;
  double *v46;
  float v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  id v52;
  id v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CIImage *v61;
  CIImage *v62;
  CIImage *v63;
  double v64;
  double v65;
  void *v66;
  _QWORD *v67;
  _QWORD *v68;
  BOOL v69;
  double v70;
  uint64_t v71;
  double v73;
  unint64_t v74;
  double v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  void *v85;
  CIImage *v86;
  int v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[8];
  _QWORD v97[8];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[5];
  _QWORD v101[11];
  _BYTE v102[76832];
  _QWORD v103[258];
  CGRect v104;
  CGRect v105;

  v3 = ((uint64_t (*)(CIImage *, SEL, BOOL))MEMORY[0x1E0C80A78])(self, a2, a3);
  v87 = v4;
  v5 = (CIImage *)v3;
  v103[256] = *MEMORY[0x1E0C80C00];
  v18 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CILocalLight-stats"), 0);
  -[CIImage extent](v5, "extent");
  v105 = CGRectIntegral(v104);
  x = v105.origin.x;
  y = v105.origin.y;
  width = v105.size.width;
  height = v105.size.height;
  -[CIImage extent](v5, "extent");
  v11 = (unint64_t)v10;
  -[CIImage extent](v5, "extent");
  v13 = (unint64_t)v12;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v11 * (unint64_t)v12);
  v15 = objc_msgSend(v14, "bytes");
  v85 = v18;
  v86 = v5;
  objc_msgSend(v18, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v5, objc_msgSend(v14, "mutableBytes"), 4 * v11, 264, 0, x, y, width, height);
  v16 = 0;
  v17 = 0;
  LODWORD(v18) = 0;
  v19 = (int)llroundf((float)v13 / 31.0);
  v95 = (int)llroundf((float)v11 / 31.0);
  v91 = v13;
  v89 = v13 - 1;
  v20 = v15 + 2;
  v88 = 4 * v11 * v19;
  v90 = v19;
  do
  {
    v21 = 0;
    v93 = v17;
    v94 = v16;
    v22 = v17 * v19;
    if (v17 * v19 + v19 <= v89)
      v23 = v17 * v19 + v19;
    else
      v23 = v91;
    v18 = (id)(int)v18;
    v24 = v23 + v16;
    v92 = v20;
    v25 = (_BYTE *)v20;
    do
    {
      v26 = v21 * v95;
      bzero(v103, 0x800uLL);
      v30 = v21 * v95 + v95;
      if (v30 > v11 - 1)
        v30 = v11;
      if (v30 > v26)
      {
        v31 = v25;
        do
        {
          v32 = v31;
          v33 = v24;
          if (v23 > v22)
          {
            do
            {
              LOBYTE(v27) = *(v32 - 2);
              LOBYTE(v28) = *(v32 - 1);
              LOBYTE(v29) = *v32;
              v29 = (double)*(unint64_t *)&v29 / 255.0;
              v34 = ((double)*(unint64_t *)&v27 / 255.0 + (double)v28 / 255.0 + v29) / 3.0;
              v28 = 0x4070000000000000;
              v35 = (int)fmin(floor(v34 * 256.0), 255.0);
              v27 = 1.0 / (double)(v30 * v23) + *(double *)&v103[v35];
              *(double *)&v103[v35] = v27;
              v32 += 4 * v11;
              --v33;
            }
            while (v33);
          }
          ++v26;
          v31 += 4;
        }
        while (v26 != v30);
      }
      v18 = (char *)v18 + 1;
      ++v21;
      v25 += 4 * v95;
    }
    while (v21 != 31);
    v17 = v93 + 1;
    v19 = v90;
    v16 = v94 - v90;
    v20 = v92 + v88;
  }
  while (v93 != 30);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 1922);
  v37 = objc_msgSend(v36, "mutableBytes");
  v38 = 0;
  v39 = (double *)v102;
  do
  {
    v40 = *(v39 - 1) * 2.44125725 + -1.0619469;
    v41 = *v39;
    v42 = (_BYTE *)(v37 + v38);
    *v42 = llround((v40 + 1.2) * 0.29412 * 255.0);
    v42[1] = llroundf(v41 * 255.0);
    v38 += 2;
    v39 += 10;
  }
  while (v38 != 1922);
  v43 = v36;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2);
  v45 = (_BYTE *)objc_msgSend(v44, "mutableBytes");
  v46 = (double *)v102;
  v47 = 0.0;
  v48 = 961;
  v49 = 0.0;
  do
  {
    v50 = *(v46 - 1) * 2.44125725 + -1.0619469;
    v51 = *v46;
    v49 = v49 + v50;
    v47 = v47 + v51;
    v46 += 10;
    --v48;
  }
  while (v48);
  *v45 = llround(((float)(v49 / 961.0) + 1.2) * 0.29412 * 255.0);
  v45[1] = llroundf((float)(v47 / 961.0) * 255.0);
  v52 = v44;
  v53 = v52;
  v54 = 0.0;
  v55 = 961;
  v56 = 7;
  v57 = 0.0;
  do
  {
    v58 = *(double *)&v101[v56 + 5];
    if (v58 > v57)
      v57 = *(double *)&v101[v56 + 5];
    v54 = v54 + v58;
    v56 += 10;
    --v55;
  }
  while (v55);
  if (v57 + v54 / -961.0 <= 0.5)
    v59 = v57;
  else
    v59 = v57 * 0.45;
  v60 = fabs(v59);
  if (!v87 || v60 < 1.0e-10)
  {
    v100[0] = CFSTR("lightMap");
    v100[1] = CFSTR("lightMapWidth");
    v101[0] = v43;
    v101[1] = &unk_1E2F1BB00;
    v100[2] = CFSTR("lightMapHeight");
    v100[3] = CFSTR("lightMapAvg");
    v101[2] = &unk_1E2F1BB00;
    v101[3] = v52;
    v100[4] = CFSTR("localAutoValue");
    v69 = v60 < 1.0e-10;
    v70 = 0.0;
    if (!v69)
      v70 = v59;
    v101[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v70);
    v66 = (void *)MEMORY[0x1E0C99D80];
    v67 = v101;
    v68 = v100;
    goto LABEL_35;
  }
  v61 = _lightMapImageFromData(v43, (NSNumber *)&unk_1E2F1BB00, (NSNumber *)&unk_1E2F1BB00);
  v62 = _scaledLightMapImage(v61, v86);
  if (!v62
    || (v63 = v62, -[CIImage extent](v62, "extent"), v64 < 31.0)
    || (-[CIImage extent](v63, "extent"), v65 < 31.0))
  {
    v98[0] = CFSTR("lightMap");
    v98[1] = CFSTR("lightMapWidth");
    v99[0] = v43;
    v99[1] = &unk_1E2F1BB00;
    v98[2] = CFSTR("lightMapHeight");
    v98[3] = CFSTR("lightMapAvg");
    v99[2] = &unk_1E2F1BB00;
    v99[3] = v53;
    v98[4] = CFSTR("localAutoValue");
    v99[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
    v66 = (void *)MEMORY[0x1E0C99D80];
    v67 = v99;
    v68 = v98;
LABEL_35:
    v71 = 5;
    return (id)objc_msgSend(v66, "dictionaryWithObjects:forKeys:count:", v67, v68, v71);
  }
  -[CIImage extent](v63, "extent");
  v74 = (unint64_t)v73;
  -[CIImage extent](v63, "extent");
  v76 = (unint64_t)v75;
  v77 = 2 * ((v74 & 1) + v74);
  v78 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v77 * (unint64_t)v75);
  v79 = objc_msgSend(v78, "mutableBytes");
  -[CIImage extent](v63, "extent");
  objc_msgSend(v85, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v63, v79, v77, 262, 0);
  if ((v74 & 1) != 0)
  {
    v80 = 2 * v74;
    v81 = objc_msgSend(v78, "mutableBytes");
    if (v76 >= 2)
    {
      v82 = v76 - 1;
      v83 = (char *)(v81 + v80 + 2);
      v84 = (char *)(v81 + v80);
      do
      {
        memcpy(v84, v83, 2 * v74);
        v83 += v80 + 2;
        v84 += v80;
        --v82;
      }
      while (v82);
    }
    objc_msgSend(v78, "setLength:", v80 * v76);
  }
  v96[0] = CFSTR("lightMap");
  v96[1] = CFSTR("lightMapWidth");
  v97[0] = v43;
  v97[1] = &unk_1E2F1BB00;
  v96[2] = CFSTR("lightMapHeight");
  v96[3] = CFSTR("lightMapAvg");
  v97[2] = &unk_1E2F1BB00;
  v97[3] = v53;
  v96[4] = CFSTR("localAutoValue");
  v97[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
  v97[5] = v78;
  v96[5] = CFSTR("proxyLightMap");
  v96[6] = CFSTR("proxyLightMapWidth");
  v97[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v74);
  v96[7] = CFSTR("proxyLightMapHeight");
  v97[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v76);
  v66 = (void *)MEMORY[0x1E0C99D80];
  v67 = v97;
  v68 = v96;
  v71 = 8;
  return (id)objc_msgSend(v66, "dictionaryWithObjects:forKeys:count:", v67, v68, v71);
}

- (id)localLightStatistics
{
  return -[CIImage localLightStatisticsWithProxy:](self, "localLightStatisticsWithProxy:", 1);
}

- (id)localLightStatisticsNoProxy
{
  return -[CIImage localLightStatisticsWithProxy:](self, "localLightStatisticsWithProxy:", 0);
}

- (id)autoPerspectiveFilterWithOptions:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  CIFilter *v21;
  void *v22;
  void *v23;
  void *v24;
  double v26[8];

  v5 = (objc_class *)CIPerspectiveAutoCalcDefaultImpl();
  v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("version"));
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "isEqual:", CFSTR("v1")))
      v5 = (objc_class *)objc_opt_class();
    if (objc_msgSend(v7, "isEqual:", CFSTR("v2")))
      v5 = (objc_class *)objc_opt_class();
  }
  v8 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("focalLength"), 0x403C000000000000, 0x3FD0C152382D7365, 0x3FC657184AE74487, 0x3FE0C152382D7365, vdupq_n_s64(0x3FE0C152382D7365uLL), 0);
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v26[0] = v9;
  }
  v10 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("lineSearchRangeV"), *(_QWORD *)&v26[0]);
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v26[1] = v11;
  }
  v12 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("lineSearchRangeH"));
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v26[2] = v13;
  }
  v14 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("pitchLimit"));
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v26[3] = v15;
  }
  v16 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("yawLimit"));
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    v26[4] = v17;
  }
  v18 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("rollLimit"));
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    v26[5] = v19;
  }
  *(_QWORD *)&v26[6] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("saliencyHeatMap"));
  v20 = (void *)objc_msgSend([v5 alloc], "initWithContext:image:config:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("context")), self, v26);
  if (objc_msgSend(v20, "isMemberOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(a3, "valueForKey:", CFSTR("minimumPitchCorrectionArea")))
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minimumPitchCorrectionArea")), "doubleValue");
      objc_msgSend(v20, "setMinimumPitchCorrectionAreaCoverage:");
    }
    if (objc_msgSend(a3, "valueForKey:", CFSTR("minimumYawCorrectionArea")))
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minimumYawCorrectionArea")), "doubleValue");
      objc_msgSend(v20, "setMinimumYawCorrectionAreaCoverage:");
    }
  }
  if (v20 && (objc_msgSend(v20, "compute") & 1) != 0)
  {
    v21 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveRotate"));
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", self, CFSTR("inputImage"));
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26[0]), CFSTR("inputFocalLength"));
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "pitch");
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v22, "numberWithDouble:"), CFSTR("inputPitch"));
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "yaw");
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v23, "numberWithDouble:"), CFSTR("inputYaw"));
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "roll");
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:"), CFSTR("inputRoll"));

  }
  else
  {

    return 0;
  }
  return v21;
}

- (id)autoPerspectiveResultWithOptions:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  CIFilter *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v34[8];

  v5 = (objc_class *)CIPerspectiveAutoCalcDefaultImpl();
  v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("version"));
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "isEqual:", CFSTR("v1")))
      v5 = (objc_class *)objc_opt_class();
    if (objc_msgSend(v7, "isEqual:", CFSTR("v2")))
      v5 = (objc_class *)objc_opt_class();
  }
  v8 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("focalLength"), 0x403C000000000000, 0x3FD0C152382D7365, 0x3FC657184AE74487, 0x3FE0C152382D7365, vdupq_n_s64(0x3FE0C152382D7365uLL), 0);
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v34[0] = v9;
  }
  v10 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("lineSearchRangeV"), *(_QWORD *)&v34[0]);
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v34[1] = v11;
  }
  v12 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("lineSearchRangeH"));
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v34[2] = v13;
  }
  v14 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("pitchLimit"));
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v34[3] = v15;
  }
  v16 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("yawLimit"));
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    v34[4] = v17;
  }
  v18 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("rollLimit"));
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    v34[5] = v19;
  }
  *(_QWORD *)&v34[6] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("saliencyHeatMap"));
  v20 = (void *)objc_msgSend([v5 alloc], "initWithContext:image:config:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("context")), self, v34);
  v21 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("generateDebugImage")), "BOOLValue");
  objc_msgSend(v20, "setGenerateDebugImage:", v21);
  if (objc_msgSend(v20, "isMemberOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(a3, "valueForKey:", CFSTR("minimumPitchCorrectionArea")))
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minimumPitchCorrectionArea")), "doubleValue");
      objc_msgSend(v20, "setMinimumPitchCorrectionAreaCoverage:");
    }
    if (objc_msgSend(a3, "valueForKey:", CFSTR("minimumYawCorrectionArea")))
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minimumYawCorrectionArea")), "doubleValue");
      objc_msgSend(v20, "setMinimumYawCorrectionAreaCoverage:");
    }
  }
  objc_msgSend(v20, "isMemberOfClass:", objc_opt_class());
  if (v20 && (objc_msgSend(v20, "compute") & 1) != 0)
  {
    v22 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveRotate"));
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", self, CFSTR("inputImage"));
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34[0]), CFSTR("inputFocalLength"));
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "pitch");
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v23, "numberWithDouble:"), CFSTR("inputPitch"));
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "yaw");
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:"), CFSTR("inputYaw"));
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "roll");
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v25, "numberWithDouble:"), CFSTR("inputRoll"));
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, CFSTR("filter"));
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "confidence");
    objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v27, "numberWithDouble:"), CFSTR("confidence"));
    if ((_DWORD)v21)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v20, "debugImage"), CFSTR("debugImage"));
    if (objc_msgSend(v20, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "pitchFailureReason")), CFSTR("pitchFailureReason"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "yawFailureReason")), CFSTR("yawFailureReason"));
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "pitchCorrectionAreaCoverage");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v28, "numberWithFloat:"), CFSTR("pitchCorrectionAreaCoverage"));
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "yawCorrectionAreaCoverage");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithFloat:"), CFSTR("yawCorrectionAreaCoverage"));
    }
    if (objc_msgSend(v20, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "pitchFailureReason")), CFSTR("pitchFailureReason"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "yawFailureReason")), CFSTR("yawFailureReason"));
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "unlimitedPitch");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v30, "numberWithDouble:"), CFSTR("unlimitedPitch"));
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "unlimitedYaw");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v31, "numberWithDouble:"), CFSTR("unlimitedYaw"));
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "unlimitedRoll");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v32, "numberWithDouble:"), CFSTR("unlimitedRoll"));
    }

    return (id)objc_msgSend(v26, "copy");
  }
  else
  {

    return 0;
  }
}

- (id)smartBlackAndWhiteStatistics
{
  if (-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteStatistics]::onceToken != -1)
    dispatch_once(&-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteStatistics]::onceToken, &__block_literal_global_65);
  return (id)MEMORY[0x1E0C9AA70];
}

void __66__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteStatistics__block_invoke()
{
  NSLog(CFSTR("There is no need to call smartBlackAndWhiteStatistics."));
  NSLog(CFSTR("Just use [CIFilter filterWithName:@\"CISmartBlackAndWhite\"] instead."));
}

- (id)smartBlackAndWhiteAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteAdjustmentsForValue:andStatistics:]::onceToken != -1)
    dispatch_once(&-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteAdjustmentsForValue:andStatistics:]::onceToken, &__block_literal_global_80_2);
  v6[0] = CFSTR("inputStrength");
  v6[1] = CFSTR("inputNeutralGamma");
  v7[0] = &unk_1E2F1ABD0;
  v7[1] = &unk_1E2F1ABB0;
  v7[2] = &unk_1E2F1ABB0;
  v6[2] = CFSTR("inputTone");
  v6[3] = CFSTR("inputHue");
  v7[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7[4] = &unk_1E2F1ABB0;
  v6[4] = CFSTR("inputGrain");
  v6[5] = CFSTR("inputSeed");
  v6[6] = CFSTR("inputScaleFactor");
  v7[5] = &unk_1E2F1ABB0;
  v7[6] = &unk_1E2F1ABB0;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
}

void __90__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteAdjustmentsForValue_andStatistics___block_invoke()
{
  NSLog(CFSTR("There is no need to call smartBlackAndWhiteAdjustmentsForValue:andStatistics:."));
  NSLog(CFSTR("Just use [CIFilter filterWithName:@\"CISmartBlackAndWhite\"] instead."));
}

- (id)smartToneStatistics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  double x;
  double y;
  double width;
  double height;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[10];
  _QWORD v33[10];
  double v34[512];
  _QWORD v35[5];
  _QWORD v36[5];
  const __CFString *v37;
  _QWORD v38[3];
  CGRect v39;
  CGRect v40;

  v2 = (void *)((uint64_t (*)(CIImage *, SEL))MEMORY[0x1E0C80A78])(self, a2);
  v38[1] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  if (!objc_msgSend(v2, "properties"))
    NSLog(CFSTR("Warning smartToneStatistics will soon need [receiver properties] be non-nil so flash-fired state can be determined."));
  v3 = (void *)objc_msgSend(v2, "properties");
  v4 = (void *)objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0CBCB50]);
  v5 = (void *)objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0CBCB88]);
  v6 = 1.0;
  if (v5)
  {
    if ((objc_msgSend(v5, "intValue") & 1) != 0)
      v6 = 0.6;
    else
      v6 = 1.0;
  }
  context = (void *)MEMORY[0x194026220]();
  v37 = CFSTR("working_format");
  v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v7 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CISmartTone-histogram"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1));
  objc_msgSend(v2, "extent");
  v40 = CGRectIntegral(v39);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  v12 = (unint64_t)v40.size.width;
  v13 = (unint64_t)v40.size.height;
  v14 = 4 * (unint64_t)v40.size.width;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v14 * (unint64_t)v40.size.height);
  v16 = objc_msgSend(v15, "bytes");
  v35[0] = CFSTR("inputRVector");
  v36[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.333333343, 0.333333343, 0.333333343, 0.0);
  v35[1] = CFSTR("inputGVector");
  v36[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.166666672, 0.166666672, 0.166666672, 0.0);
  v35[2] = CFSTR("inputBVector");
  v36[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", -1.0, -1.0, -1.0, 0.0);
  v35[3] = CFSTR("inputAVector");
  v36[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v35[4] = CFSTR("inputBiasVector");
  v36[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v7, "render:toBitmap:rowBytes:bounds:format:colorSpace:", objc_msgSend(v2, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5)), objc_msgSend(v15, "mutableBytes"), v14, 264, 0, x, y, width, height);
  bzero(v34, 0x1000uLL);
  if ((int)v13 >= 1)
  {
    v17 = 0;
    v18 = 1.0 / (double)(v13 * v12);
    v19 = (unsigned __int8 *)(v16 + 2);
    while (1)
    {
      v20 = v19;
      v21 = v12;
      if ((int)v12 >= 1)
        break;
LABEL_17:
      ++v17;
      v19 += v14;
      if (v17 == v13)
        goto LABEL_18;
    }
    while (1)
    {
      v22 = *v20;
      v23 = (char)*(v20 - 1);
      v34[*(v20 - 2)] = v18 + v34[*(v20 - 2)];
      if (v23 < 0)
        break;
      if ((_DWORD)v22)
        goto LABEL_12;
LABEL_13:
      v20 += 4;
      if (!--v21)
        goto LABEL_17;
    }
    v34[2 * v23] = v18 + v34[2 * v23];
    if (!(_DWORD)v22)
      goto LABEL_13;
LABEL_12:
    v34[v22 + 255] = v18 + v34[v22 + 255];
    goto LABEL_13;
  }
LABEL_18:
  objc_autoreleasePoolPop(context);
  v32[0] = CFSTR("tonalRange");
  v33[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v26);
  v32[1] = CFSTR("highKey");
  v33[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v26 + 1));
  v32[2] = CFSTR("p02");
  v33[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v27);
  v32[3] = CFSTR("p10");
  v33[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v27 + 1));
  v32[4] = CFSTR("p25");
  v33[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v28);
  v32[5] = CFSTR("p50");
  v33[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v28 + 1));
  v32[6] = CFSTR("p98");
  v33[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v29);
  v32[7] = CFSTR("autoValue");
  v33[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * *((double *)&v29 + 1));
  v32[8] = CFSTR("blackPoint");
  v33[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v30);
  v32[9] = CFSTR("whitePoint");
  v33[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v30 + 1));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 10);
}

- (id)smartColorStatistics
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  float v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  float v45;
  float v46;
  unint64_t v47;
  float v48;
  float v49;
  float v50;
  uint64_t v51;
  float v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  uint64_t v61;
  void *context;
  _QWORD v63[4];
  _QWORD v64[4];
  _BYTE v65[1024];
  _BYTE v66[1024];
  float v67[256];
  float v68[256];
  const __CFString *v69;
  uint64_t v70;
  _BYTE v71[1024];
  _BYTE v72[1024];
  uint64_t v73;

  v2 = (void *)((uint64_t (*)(CIImage *, SEL))MEMORY[0x1E0C80A78])(self, a2);
  v73 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x194026220]();
  v69 = CFSTR("working_format");
  v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v3 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CISmartColor-histogram"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
  objc_msgSend(v2, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (unint64_t)v8;
  v13 = (unint64_t)v10;
  v14 = 4 * (unint64_t)v8;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v14 * (unint64_t)v10);
  v61 = objc_msgSend(v15, "bytes");
  objc_msgSend(v3, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v2, objc_msgSend(v15, "mutableBytes"), v14, 264, 0, v5, v7, v9, v11);
  bzero(v66, 0x400uLL);
  bzero(v65, 0x400uLL);
  bzero(v72, 0x400uLL);
  bzero(v71, 0x400uLL);
  bzero(v68, 0x400uLL);
  bzero(v67, 0x400uLL);
  if ((int)v13 > 0)
  {
    v19 = 0;
    v20 = 1.0 / (double)(v13 * v12);
    v21 = (_BYTE *)(v61 + 2);
    do
    {
      v22 = v21;
      v23 = v12;
      if ((int)v12 >= 1)
      {
        do
        {
          LOBYTE(v16) = *(v22 - 2);
          LOBYTE(v17) = *(v22 - 1);
          v24 = (double)*(unint64_t *)&v16 / 255.0;
          v25 = (double)*(unint64_t *)&v17 / 255.0;
          LOBYTE(v18) = *v22;
          v26 = (double)*(unint64_t *)&v18 / 255.0;
          v27 = (v24 + v25 + v26) / 3.0;
          v16 = v24 * 255.0;
          v28 = llround(v16);
          v17 = v25 * 255.0;
          v29 = llround(v17);
          *(float *)&v17 = *(float *)&v71[4 * v29] + v20;
          v30 = llround(v26 * 255.0);
          *(float *)&v72[4 * v28] = *(float *)&v72[4 * v28] + v20;
          *(float *)&v16 = v68[v30] + v20;
          v18 = v27 * 255.0;
          *(_DWORD *)&v71[4 * v29] = LODWORD(v17);
          v31 = llround(v27 * 255.0);
          *(float *)&v17 = v67[v31];
          v68[v30] = *(float *)&v16;
          *(float *)&v16 = *(float *)&v17 + v20;
          v67[v31] = *(float *)&v17 + v20;
          v22 += 4;
          --v23;
        }
        while (v23);
      }
      ++v19;
      v21 += v14;
    }
    while (v19 != v13);
  }
  v32 = 0;
  __asm { FMOV            V1.2D, #1.0 }
  do
  {
    v38 = *(float32x4_t *)&v67[v32];
    v39 = vabdq_f32(*(float32x4_t *)&v71[v32 * 4], v38);
    v40 = vmaxnmq_f32(vaddq_f32(vaddq_f32(vabdq_f32(*(float32x4_t *)&v72[v32 * 4], v38), v39), vabdq_f32(*(float32x4_t *)&v68[v32], v38)), (float32x4_t)0);
    *(float32x4_t *)&v66[v32 * 4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(*(float32x2_t *)v40.f32), _Q1)), vminnmq_f64(vcvt_hight_f64_f32(v40), _Q1));
    *(float32x4_t *)&v65[v32 * 4] = v39;
    v32 += 4;
  }
  while (v32 != 256);
  objc_autoreleasePoolPop(context);
  v41 = 0;
  v42 = 71362;
  v43 = 71362;
  do
  {
    *(float *)&v43 = *(float *)&v43 + *(float *)&v66[v41];
    *(float *)&v42 = *(float *)&v42 + *(float *)&v65[v41];
    v41 += 4;
  }
  while (v41 != 1024);
  v44 = 0;
  v45 = 0.0;
  v46 = 0.0;
  do
  {
    v46 = v46 + *(float *)&v66[v44];
    *(float *)&v72[v44] = v46 / *(float *)&v43;
    v45 = v45 + *(float *)&v65[v44];
    *(float *)&v71[v44] = v45 / *(float *)&v42;
    v44 += 4;
  }
  while (v44 != 1024);
  v47 = 0;
  v48 = 0.0;
  v49 = 0.0;
  do
  {
    v50 = *(float *)&v72[4 * v47];
    if (v50 >= 0.75 && v48 == 0.0)
      v48 = (float)v47 / 255.0;
    if (v50 >= 0.98 && v49 == 0.0)
      v49 = (float)v47 / 255.0;
    ++v47;
  }
  while (v47 != 256);
  v51 = 0;
  v52 = 0.0;
  do
  {
    if (*(float *)&v71[4 * v51] >= 0.98 && v52 == 0.0)
      v52 = (float)(int)v51 / 255.0;
    ++v51;
  }
  while (v51 != 256);
  v53 = 1.0;
  v54 = fmax(fmin(1.0 - v49, 1.0), 0.0);
  if (v49 >= 0.99)
  {
    v55 = vabdd_f64(0.5, v48);
    if (v48 < 0.9)
      v54 = v55;
  }
  if (v52 >= v49)
    v53 = 2.0;
  v56 = fmin(v53 * v54, 0.2);
  v63[0] = CFSTR("satPercentile75");
  v64[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v63[1] = CFSTR("satPercentile98");
  *(float *)&v57 = v49;
  v64[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v63[2] = CFSTR("satPercentileG98");
  *(float *)&v58 = v52;
  v64[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
  v63[3] = CFSTR("satAutoValue");
  *(float *)&v59 = v56;
  v64[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
}

+ (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15[11];
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = fmax(fmin(*((double *)&v11 + 1), 2.0), -2.0);
  v6 = fmax(fmin(*(double *)&v12, 2.0), -2.0);
  v7 = fmax(fmin(*((double *)&v12 + 1), 2.0), -2.0);
  v8 = fmax(fmin(*(double *)&v13, 2.0), -2.0);
  v9 = fmax(fmin(*((double *)&v13 + 1), 2.0), -2.0);
  v16[0] = CFSTR("inputExposure");
  v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(fmin(*(double *)&v11, 2.0), -2.0));
  v16[1] = CFSTR("inputContrast");
  v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16[2] = CFSTR("inputBrightness");
  v17[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v16[3] = CFSTR("inputShadows");
  v17[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v16[4] = CFSTR("inputHighlights");
  v17[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v16[5] = CFSTR("inputBlack");
  v17[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
}

- (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  return +[CIImage smartToneAdjustmentsForValue:andStatistics:](CIImage, "smartToneAdjustmentsForValue:andStatistics:", a4, a3);
}

+ (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11[11];
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v12[0] = CFSTR("inputExposure");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7);
  v12[1] = CFSTR("inputContrast");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v7 + 1));
  v12[2] = CFSTR("inputBrightness");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v8);
  v12[3] = CFSTR("inputShadows");
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v8 + 1));
  v12[4] = CFSTR("inputHighlights");
  v13[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v9);
  v12[5] = CFSTR("inputBlack");
  v13[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v9 + 1));
  v12[6] = CFSTR("inputLocalLight");
  v13[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v10);
  v12[7] = CFSTR("inputRawHighlights");
  v13[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v10 + 1));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
}

- (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5
{
  return +[CIImage smartToneAdjustmentsForValue:localLightAutoValue:andStatistics:](CIImage, "smartToneAdjustmentsForValue:localLightAutoValue:andStatistics:", a5, a3, a4);
}

+ (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("satPercentile75")), "floatValue");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("satPercentile98")), "floatValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("satPercentileG98")), "floatValue");
  v11 = v10;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("satAutoValue")), "floatValue");
  v12 = a3;
  v13 = v9;
  if (v12 == 0.0 || (v14 = 0.0, v15 = 0.0, v13 >= 0.01))
  {
    v16 = v12;
    v17 = (float)(1.0 - v9);
    if (v16 + v16 <= v17)
    {
      v19 = 0.0;
    }
    else
    {
      v18 = -(v17 - v12 * 2.0) * 0.75;
      v19 = v18;
    }
    v20 = v12 / 3.0;
    v21 = v16 / (fmaxf(v7, 0.5) * 3.0);
    if (v7 > 0.0)
      v20 = v21;
    if (v12 < 0.0)
      v20 = v12;
    v22 = fminf(fmaxf(v20, -1.0), 1.0);
    if (v11 > 0.75 && v13 > 0.9 && v7 < 0.65 && v7 > 0.5)
      v19 = -v19;
    v14 = v22;
    v15 = fminf(fmaxf(v19 * 0.5, -1.0), 1.0);
  }
  v26[0] = CFSTR("inputVibrancy");
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v26[1] = CFSTR("inputContrast");
  v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v26[2] = CFSTR("inputCast");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
}

- (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  return +[CIImage smartColorAdjustmentsForValue:andStatistics:](CIImage, "smartColorAdjustmentsForValue:andStatistics:", a4, a3);
}

- (id)metalImageByApplyingFilter:(id)a3 withInputParameters:(id)a4
{
  id result;
  id v6;

  result = +[CIFilter metalFilterWithName:withInputParameters:](CIFilter, "metalFilterWithName:withInputParameters:", a3, a4);
  if (result)
  {
    v6 = result;
    objc_msgSend(result, "setValue:forKey:", self, CFSTR("inputImage"));
    return (id)objc_msgSend(v6, "outputImage");
  }
  return result;
}

- (id)metalImageByApplyingFilter:(id)a3
{
  id result;
  id v5;

  result = +[CIFilter metalFilterWithName:](CIFilter, "metalFilterWithName:", a3);
  if (result)
  {
    v5 = result;
    objc_msgSend(result, "setValue:forKey:", self, CFSTR("inputImage"));
    return (id)objc_msgSend(v5, "outputImage");
  }
  return result;
}

- (void)_initWithIOSurface:options:owner:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithIOSurface:options:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_initWithIOSurface:options:owner:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithIOSurface:options:] kCIImageSurfaceFormat option value is not compatable with actual format of surface.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_initWithIOSurface:(uint64_t)a3 options:(uint64_t)a4 owner:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_2(&dword_1921E4000, a2, a3, "[CIImage initWithIOSurface:options:] failed because surface format was %{public}.4s.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithIOSurface:(uint64_t)a3 options:(uint64_t)a4 owner:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a2, a3, "[CIImage initWithIOSurface:options:] failed because surface format was %ld.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initNaiveWithCGImage:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithCGImage:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)initWithCGImage:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the CGImage is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithCGImage:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the CGImage format is not supported and we failed to create a CGBitmapContext.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithBitmapData:bytesPerRow:size:format:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithBitmapData:] failed because data length was less than height times bytesPerRow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)initWithBitmapData:bytesPerRow:size:format:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithBitmapData:] failed because the format is not supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)initWithBitmapData:(uint64_t)a3 bytesPerRow:(uint64_t)a4 size:(uint64_t)a5 format:(uint64_t)a6 options:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a2, a3, "[CIImage initWithBitmapData:] failed because the format '%{public}s' is not supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithTexture:(uint64_t)a3 size:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s kCIImageEdgeRepeat option not supported. Ignoring.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithTexture:size:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s kCIImageTextureTarget option value is not supported. Value was %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s texture type must include MTLTextureUsageShaderRead.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s kCIImageEdgeRepeat option not supported. Ignoring.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s texture type must be MTLTextureType2D.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithCVImageBuffer:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithCVImageBuffer:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_initWithCVImageBuffer:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "[CIImage initWithCVPixelBuffer:optiopns:] failed because it is not a CVPixelBuffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the buffer is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithCVPixelBuffer:(uint64_t)a1 options:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136446722;
  v3 = "-[CIImage initWithCVPixelBuffer:options:]";
  v4 = 1042;
  v5 = 4;
  v6 = 2082;
  v7 = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s failed because its pixel format %{public}.4s is not supported.", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, a2, a3, "%{public}s failed because its pixel format %ld is not supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the buffer is not a CVPixelBufferRef.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithCVImageBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the buffer is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithCVImageBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the type of buffer is not yet supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_imageByApplyingTransform:(uint64_t)a3 highQualityDownsample:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s transform contains NAN values.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageByColorMatchingWorkingSpaceToColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an RGB or Gray CGColorSpaceRef that supports output.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an RGB or Gray CGColorSpaceRef that supports output.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageByColorMatchingColorSpaceToWorkingSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an RGB or Gray CGColorSpaceRef.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 targetHeadroom:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s The 'targetHeadroom' must in the range 1.0 to 16.0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 targetHeadroom:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an HDR RGB CGColorSpaceRef.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an HDR RGB CGColorSpaceRef.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageByTaggingWithColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s ColorSpace must be an RGB CGColorSpaceRef.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageBySettingProperties:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s properties is not a NSDictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)imageBySettingPropertiesNoCopy:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s properties is not a NSDictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithArrayOfImages:(uint64_t)a3 selector:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_2(&dword_1921E4000, a2, a3, "%{public}s object at index %d of array is not a CIImage.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __25__CIImage_initWithCoder___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s CIUserInfo is no longer decoded for sake of security.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setValue:forKeyPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s not supported for keypath %{public}@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end

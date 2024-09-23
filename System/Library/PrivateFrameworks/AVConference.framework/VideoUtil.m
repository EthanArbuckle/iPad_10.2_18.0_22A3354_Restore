@implementation VideoUtil

+ (id)convertPixelBuffer:(__CVBuffer *)a3 toImageType:(int)a4 withAssetIdentifier:(id)a5 cameraStatusBits:(unsigned __int8)a6 allowTimeMetaData:(BOOL)a7
{
  uint64_t v8;
  size_t Width;
  size_t Height;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v13;
  size_t BytesPerRow;
  CVPixelBufferRef v15;
  void *BaseAddress;
  size_t DataSize;
  CGDataProvider *v18;
  CGDataProvider *v19;
  CGImageRef v20;
  CGImage *v21;
  __CFString *v22;
  const __CFString *v23;
  __CFData *v24;
  CGImageDestinationRef v25;
  CGImageDestination *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  __CFData *v40;
  uint64_t v41;
  NSObject *v42;
  size_t v44;
  int v45;
  _BOOL4 v47;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  _BYTE buf[12];
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  size_t v58;
  __int16 v59;
  size_t v60;
  __int16 v61;
  void *v62;
  _QWORD v63[3];

  v47 = a7;
  v8 = *(_QWORD *)&a4;
  v63[1] = *MEMORY[0x1E0C80C00];
  pixelTransferSessionOut = 0;
  pixelBufferOut = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Width, Height, 0x42475241u, 0, &pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.9();
    }
    goto LABEL_50;
  }
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.8();
    }
    goto LABEL_50;
  }
  if (VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.7();
    }
    goto LABEL_50;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.1();
    }
LABEL_50:
    v19 = 0;
    v13 = 0;
LABEL_51:
    v21 = 0;
LABEL_52:
    v40 = 0;
    v27 = 0;
    goto LABEL_34;
  }
  v13 = DeviceRGB;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  CFRetain(pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
  v15 = pixelBufferOut;
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  DataSize = CVPixelBufferGetDataSize(pixelBufferOut);
  v18 = CGDataProviderCreateWithData(v15, BaseAddress, DataSize, (CGDataProviderReleaseDataCallback)ReleaseCVPixelBuffer);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.2();
    }
    v19 = 0;
    goto LABEL_51;
  }
  v19 = v18;
  v20 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, v13, 0x2006u, v18, 0, 0, kCGRenderingIntentDefault);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.3();
    }
    goto LABEL_51;
  }
  v21 = v20;
  v22 = +[VideoUtil typeIdentifierForImageType:](VideoUtil, "typeIdentifierForImageType:", v8);
  if (!v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.4();
    }
    goto LABEL_52;
  }
  v23 = v22;
  v24 = (__CFData *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v25 = CGImageDestinationCreateWithData(v24, v23, 1uLL, 0);
  if (!v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.5();
    }
    goto LABEL_52;
  }
  v26 = v25;
  v45 = v8;
  v27 = (void *)objc_opt_new();
  v44 = Height;
  if (ImageMetadataDictionary_sOnceToken != -1)
    dispatch_once(&ImageMetadataDictionary_sOnceToken, &__block_literal_global_44);
  v28 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v29 = objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "stringFromDate:", v28);
  v30 = objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "stringFromDate:", v28);
  if ((a6 & 0x80) != 0)
    __asm { BR              X10 }
  v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CBCFF0]);
  if (a5)
  {
    v63[0] = *MEMORY[0x1E0C89C70];
    *(_QWORD *)buf = a5;
    v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v63, 1);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CBCF70]);
  }
  v33 = (void *)objc_opt_new();
  if (v33)
  {
    v34 = v33;
    objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("Apple"), *MEMORY[0x1E0CBD0B0]);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", ImageMetadataDictionary_sMarketingNameString, *MEMORY[0x1E0CBD0B8]);
    if (v47)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CBD088]);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_1E9EF5120, *MEMORY[0x1E0CBD0F8]);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_1E9EF5120, *MEMORY[0x1E0CBD108]);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_1E9EF5138, *MEMORY[0x1E0CBD0D0]);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E9EF5120, *MEMORY[0x1E0CBCA00]);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E9EF5120, *MEMORY[0x1E0CBC9F8]);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CBD090]);

  }
  v35 = (void *)objc_opt_new();
  if (v35)
  {
    v36 = v35;
    if (v47)
    {
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CBCB40]);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CBCB38]);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CBCCA0]);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CBCC98]);
    }
    objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("Apple"), *MEMORY[0x1E0CBCBD8]);
    v37 = (void *)objc_opt_new();
    if (v37)
    {
      v38 = v37;
      if (ImageMetadataDictionary_sMarketingNameString)
      {
        objc_msgSend(v37, "appendString:");
        if ((a6 & 8) != 0)
          v39 = CFSTR(" back FaceTime camera");
        else
          v39 = CFSTR(" front FaceTime camera");
        objc_msgSend(v38, "appendString:", v39);
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0CBCBE0]);
      }

    }
    objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("FaceTime Photo"), *MEMORY[0x1E0CBCCB0]);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CBCB50]);

  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E9EFB1A8, *MEMORY[0x1E0CBC780]);
  CGImageDestinationAddImage(v26, v21, (CFDictionaryRef)v27);
  if (CGImageDestinationFinalize(v26))
  {
    v40 = v24;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v41;
        v51 = 2080;
        v52 = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
        v53 = 1024;
        v54 = 1472;
        v55 = 1024;
        v56 = v45;
        v57 = 2048;
        v58 = Width;
        v59 = 2048;
        v60 = v44;
        v61 = 2112;
        v62 = v27;
        _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created image type:%d data with (%zux%zu) %@", buf, 0x40u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.6();
    }
    v40 = 0;
  }
  CFRelease(v26);
LABEL_34:
  CGImageRelease(v21);
  CGColorSpaceRelease(v13);
  CGDataProviderRelease(v19);
  CVPixelBufferRelease(pixelBufferOut);
  if (pixelTransferSessionOut)
    CFRelease(pixelTransferSessionOut);

  return v40;
}

+ (CGSize)sizeForVideoResolution:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  if ((unint64_t)a3 < 0x1C)
  {
    if (a3 != 27)
    {
      v4 = dbl_1D910D030[a3];
      v3 = dbl_1D910D108[a3];
      goto LABEL_8;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VideoUtil sizeForVideoResolution:].cold.1();
  }
  v3 = 480.0;
  v4 = 640.0;
LABEL_8:
  result.height = v3;
  result.width = v4;
  return result;
}

+ (CGSize)getBestCaptureSizeForEncodingSize:(CGSize)a3
{
  double height;
  double width;
  int v5;
  int v6;
  BOOL v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = (int)a3.width;
  v6 = (int)a3.height;
  if ((int)a3.width)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (a3.width == a3.height)
    {
      +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:", 1280.0, 720.0);
LABEL_23:
      width = v8;
      height = v9;
    }
    else
    {
      v10 = 0;
      v11 = -1;
      v12 = -1;
      do
      {
        +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", v10);
        v14 = v13;
        v16 = v15;
        v17 = (int)v13;
        v18 = (int)v15;
        if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "cameraSupportsWidth:height:", (int)v13, (int)v15))
        {
          if (v17 == v5 && v18 == v6)
          {
            v12 = v10;
LABEL_21:
            v20 = v12;
LABEL_22:
            +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", v20);
            goto LABEL_23;
          }
          if (vabdd_f64(v14 / v16, width / height) >= 0.05)
            v11 = v10;
          else
            v12 = v10;
        }
        ++v10;
      }
      while (v10 != 28);
      if (v12 != -1)
        goto LABEL_21;
      if (v11 != -1)
      {
        v20 = v11;
        goto LABEL_22;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v25 = 136316162;
          v26 = v23;
          v27 = 2080;
          v28 = "+[VideoUtil getBestCaptureSizeForEncodingSize:]";
          v29 = 1024;
          v30 = 1642;
          v31 = 1024;
          v32 = v5;
          v33 = 1024;
          v34 = v6;
          _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot find capture size for %dx%d", (uint8_t *)&v25, 0x28u);
        }
      }
    }
  }
  v21 = width;
  v22 = height;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (int64_t)videoResolutionForWidth:(int)a3 height:(int)a4
{
  if (a3 == 1088 && a4 == 1088)
    return 20;
  if (a3 == 96 && a4 == 96)
    return 0;
  if (a3 == 128 && a4 == 128)
    return 1;
  if (a3 == 192 && a4 == 112)
    return 2;
  if (a3 == 192 && a4 == 192)
    return 3;
  if (a3 == 240 && a4 == 240)
    return 4;
  if (a3 == 256 && a4 == 256)
    return 5;
  if (a3 == 320 && a4 == 176)
    return 6;
  if (a3 == 320 && a4 == 240)
    return 7;
  if (a3 == 320 && a4 == 320)
    return 8;
  if (a3 == 480 && a4 == 272)
    return 9;
  if (a3 == 480 && a4 == 368)
    return 10;
  if (a3 == 480 && a4 == 480)
    return 11;
  if (a3 == 512 && a4 == 512)
    return 12;
  if (a3 == 640 && a4 == 368)
    return 13;
  if (a3 == 640 && a4 == 480)
    return 14;
  if (a3 == 640 && a4 == 640)
    return 15;
  if (a3 == 720 && a4 == 720)
    return 16;
  if (a3 == 1024 && a4 == 768)
    return 17;
  if (a3 == 1280 && a4 == 720)
    return 18;
  if (a3 == 1280 && a4 == 960)
    return 19;
  if (a3 == 1664 && a4 == 1248)
    return 21;
  if (a3 == 1920 && a4 == 1080)
    return 22;
  if (a3 == 2592 && a4 == 1936)
    return 24;
  if (a4 == 2448 && a3 == 3264)
    return 25;
  else
    return 27;
}

+ (int)setupBufferPool:(__CVPixelBufferPool *)a3 width:(double)a4 height:(double)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1DF088A10](a1, a2);
  v21 = *MEMORY[0x1E0CBC018];
  v22[0] = MEMORY[0x1E0C9AAB0];
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v10 = *MEMORY[0x1E0CA9058];
  v19[0] = *MEMORY[0x1E0CA9060];
  v19[1] = v10;
  v20[0] = &unk_1E9EF50D8;
  v20[1] = &unk_1E9EF50F0;
  v11 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v17[0] = *MEMORY[0x1E0CA90E0];
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v17[1] = *MEMORY[0x1E0CA8FD8];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v13 = *MEMORY[0x1E0CA9040];
  v18[1] = v12;
  v18[2] = &unk_1E9EF5108;
  v14 = *MEMORY[0x1E0CA8FF0];
  v17[2] = v13;
  v17[3] = v14;
  v18[3] = v9;
  v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  LODWORD(a3) = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, v15, a3);
  objc_autoreleasePoolPop(v8);
  return (int)a3;
}

+ (int64_t)compareVideoAspectRatioSizeA:(CGSize)a3 toSizeB:(CGSize)a4
{
  double v4;
  CGFloat v5;
  double v6;
  int64_t v7;

  v4 = a3.width / a3.height;
  v5 = a4.width / a4.height;
  v6 = vabdd_f64(v4, a4.width / a4.height);
  v7 = -1;
  if (v4 >= v5)
    v7 = 1;
  if (v6 >= 0.05)
    return v7;
  else
    return 0;
}

+ (__CFString)typeIdentifierForImageType:(int)a3
{
  if (!a3)
    return CFSTR("public.jpeg");
  if (a3 == 1)
    return CFSTR("public.heic");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VideoUtil typeIdentifierForImageType:].cold.1();
  }
  return 0;
}

+ (unsigned)videoCodecForPayload:(int)a3
{
  unsigned int result;

  if (a3 == 123)
    return 1635148593;
  if (a3 == 100)
    return 1752589105;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VideoUtil videoCodecForPayload:].cold.1();
  }
  return 0;
}

+ (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6
{
  double v6;
  double v7;
  CGSize result;

  v6 = ComputeVisibleAspectRatioWithRemoteScreenAspectRatio(a5, a6, a3.width, a3.height, a4.width, a4.height);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)compute16AlignedResolutionForNativeWidth:(unsigned int)a3 nativeHeight:(unsigned int)a4 maxScreenPixelCount:(unint64_t)a5 maxScreenEncodingSizeSupported:(unint64_t)a6
{
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (!a3)
  {
    v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.1();
    }
    goto LABEL_30;
  }
  if (!a4)
  {
    v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.2();
    }
    goto LABEL_30;
  }
  if (!a5)
  {
    v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.3();
    }
    goto LABEL_30;
  }
  if (!a6)
  {
    v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.4();
    }
    goto LABEL_30;
  }
  v6 = a4 * a3;
  if (!(_DWORD)v6)
  {
    v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.5();
    }
LABEL_30:
    v10 = 0.0;
    goto LABEL_14;
  }
  if (v6 >= a6)
    v7 = a6;
  else
    v7 = a4 * a3;
  if (v7 >= a5)
    v7 = a5;
  if (v7 >= v6)
  {
    v9 = (double)((a3 + 15) & 0xFFFFFFF0);
    v10 = (double)((a4 + 15) & 0xFFFFFFF0);
  }
  else
  {
    v8 = (double)a3 / (double)a4;
    v9 = (double)(((unint64_t)sqrt(v8 * (double)v7) + 15) & 0xFFFFFFF0);
    v10 = (double)(((unint64_t)(v9 / v8) + 15) & 0xFFFFFFF0);
  }
LABEL_14:
  v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (CGSize)computeResolutionForMainDisplayWithMaxScreenPixelCount:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v4 = +[VCHardwareSettings screenWidthForDisplayID:](VCHardwareSettings, "screenWidthForDisplayID:", 0);
  v5 = +[VCHardwareSettings screenHeightForDisplayID:](VCHardwareSettings, "screenHeightForDisplayID:", 0);
  +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:](VideoUtil, "compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:", v4, v5, a3, +[VCHardwareSettings maxScreenEncodingSizeSupported](VCHardwareSettings, "maxScreenEncodingSizeSupported"));
  if (v6 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:].cold.1();
    }
    goto LABEL_10;
  }
  if (v7 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:].cold.2();
    }
LABEL_10:
    v8 = 0.0;
    v9 = 0.0;
    goto LABEL_11;
  }
  v8 = VideoUtil_ComputeScreenSizeClosestToNativeAspectRatio(0x10u, v6, v7, (double)v4, (double)v5);
LABEL_11:
  result.height = v9;
  result.width = v8;
  return result;
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create color space", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.2()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  v5 = 1446;
  v6 = v0;
  v7 = 0;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d CGDataProviderCreateWithData failed %d", v3);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d source image is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create image with invalid type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create image with type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create destination image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTPixelTransferSessionTransferImage failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTPixelTransferSessionCreate failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.9()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CVPixelBufferCreate failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)sizeForVideoResolution:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil sizeForVideoResolution:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid resolution: %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil sizeForVideoResolution:]" >> 16, 1488);
  OUTLINED_FUNCTION_3();
}

+ (void)typeIdentifierForImageType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil typeIdentifierForImageType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid image type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil typeIdentifierForImageType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)videoCodecForPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VideoUtil videoCodecForPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported video payload type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil videoCodecForPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Device width cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Device height cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Max screen pixel count cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d MaxScreenEncodingSizeSupported cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get native pixel count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)computeResolutionForMainDisplayWithMaxScreenPixelCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d scaled encoder resolution width cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)computeResolutionForMainDisplayWithMaxScreenPixelCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d scaled encoder resolution height cannot be zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

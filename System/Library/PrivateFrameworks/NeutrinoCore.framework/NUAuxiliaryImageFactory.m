@implementation NUAuxiliaryImageFactory

+ (id)auxiliaryImageFromCoreGraphicsInfoDictionary:(id)a3 forCGAuxiliaryImageTypeString:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NUAuxiliaryImageRawBuffer *v11;
  NUAuxiliaryImageRawBuffer *v12;
  void *v14;
  size_t v15;
  void *v16;
  size_t v17;
  void *v18;
  size_t v19;
  void *v20;
  OSType v21;
  void *v22;
  const __CFAllocator *v23;
  id v24;
  void *v25;
  id v26;
  __CVBuffer *v27;
  const __CFString *v28;
  void *v29;
  NUAuxiliaryImageRawBuffer *v30;
  void *v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  size_t v39;
  void *v40;
  size_t v41;
  void *v42;
  OSType v43;
  void *v44;
  const __CFAllocator *v45;
  id v46;
  void *v47;
  CFDictionaryRef v48;
  uint64_t v49;
  OSType PixelFormatType;
  void *v51;
  char v52;
  void *v53;
  int v54;
  NUAuxiliaryImageRawBuffer *v55;
  void *v56;
  void *v57;
  NUColorSpace *v58;
  void *v59;
  void *v60;
  size_t v61;
  void *v62;
  size_t v63;
  void *v64;
  size_t v65;
  void *v66;
  OSType v67;
  void *v68;
  const __CFAllocator *v69;
  id v70;
  void *v71;
  uint64_t v72;
  NUAuxiliaryImageRawBuffer *v73;
  uint64_t v74;
  uint64_t bytesPerRow;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferRef texture[2];
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC708]))
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC720]))
    {
      objc_msgSend(MEMORY[0x1E0C8B348], "portraitEffectsMatteFromDictionaryRepresentation:error:", v8, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = -[NUAuxiliaryImageAVPortraitEffectsMatte initAuxiliaryImageFromAVPortraitEffectMatte:]([NUAuxiliaryImageAVPortraitEffectsMatte alloc], "initAuxiliaryImageFromAVPortraitEffectMatte:", v10);
        goto LABEL_13;
      }
LABEL_14:
      v12 = 0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC738]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC748]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC730]) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC728]))
    {
      objc_msgSend(MEMORY[0x1E0C8B390], "semanticSegmentationMatteFromImageSourceAuxiliaryDataType:dictionaryRepresentation:error:", v9, v8, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = -[NUAuxiliaryImageAVSemanticSegmentationMatte initAuxiliaryImageFromAVSemanticSegmentationMatte:]([NUAuxiliaryImageAVSemanticSegmentationMatte alloc], "initAuxiliaryImageFromAVSemanticSegmentationMatte:", v10);
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC740]))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntValue");

      texture[0] = 0;
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v24 = objc_retainAutorelease(v22);
      v25 = (void *)objc_msgSend(v24, "bytes");
      v26 = v24;
      CVPixelBufferCreateWithBytes(v23, v17, v19, v21, v25, v15, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v26, 0, texture);
      v27 = texture[0];
      v28 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
      +[NUColorSpace genericGrayColorSpace](NUColorSpace, "genericGrayColorSpace");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      CVBufferSetAttachment(v27, v28, (CFTypeRef)objc_msgSend(v29, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);

      v30 = [NUAuxiliaryImageRawBuffer alloc];
      v12 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v30, "initWithPixelBuffer:auxiliaryImageType:identifier:", texture[0], 9, v9);
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUAuxiliaryImageRawBuffer setMetadata:](v12, "setMetadata:", v31);

LABEL_19:
      CVPixelBufferRelease(texture[0]);

      goto LABEL_15;
    }
    v32 = *MEMORY[0x1E0CBC710];
    v33 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC710]);
    v34 = (_QWORD *)MEMORY[0x1E0CBC718];
    if ((v33 & 1) == 0 && !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC718]))
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:linearthumbnail")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:linearthumbnail")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:deltamap")) & 1) == 0
        && !objc_msgSend(v9, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:styledeltamap")))
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 7, CFSTR("Unable to convert auxiliary data to NUAuxiliaryImage"), a1, *a5);
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "unsignedLongValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "unsignedIntValue");

      texture[0] = 0;
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v70 = objc_retainAutorelease(v68);
      v71 = (void *)objc_msgSend(v70, "bytes");
      v26 = v70;
      CVPixelBufferCreateWithBytes(v69, v63, v65, v67, v71, v61, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v26, 0, texture);
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail")) & 1) != 0)
      {
        v72 = 10;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:deltamap")) & 1) != 0)
      {
        v72 = 12;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:styledeltamap")))
      {
        v72 = 12;
      }
      else
      {
        v72 = 11;
      }
      v73 = [NUAuxiliaryImageRawBuffer alloc];
      v12 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v73, "initWithPixelBuffer:auxiliaryImageType:identifier:", texture[0], v72, v9);
      goto LABEL_19;
    }
    pixelBuffer = 0;
    if (!ImageIOLibraryCore_frameworkLibrary_13300)
    {
      *(_OWORD *)texture = xmmword_1E5062438;
      v78 = 0;
      ImageIOLibraryCore_frameworkLibrary_13300 = _sl_dlopen();
    }
    if (!ImageIOLibraryCore_frameworkLibrary_13300
      || !getkCGImageAuxiliaryDataInfoPixelBufferSymbolLoc()
      || (getkCGImageAuxiliaryDataInfoPixelBuffer(),
          objc_msgSend(v8, "objectForKeyedSubscript:", v35),
          (pixelBuffer = (CVPixelBufferRef)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v74 = v32;
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC888]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      bytesPerRow = objc_msgSend(v37, "unsignedLongValue");

      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedLongValue");

      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "unsignedLongValue");

      objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD030]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "unsignedIntValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C0]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v46 = objc_retainAutorelease(v44);
      v47 = (void *)objc_msgSend(v46, "bytes");
      v48 = (CFDictionaryRef)v46;
      CVPixelBufferCreateWithBytes(v45, v39, v41, v43, v47, bytesPerRow, (CVPixelBufferReleaseBytesCallback)_NUAuxiliaryImageCVPixelBufferReleaseBytesCallback, v48, 0, &pixelBuffer);
      if (!pixelBuffer)
      {
        +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create pixel buffer from auxiliary info"), v8);
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

        goto LABEL_16;
      }

      v34 = (_QWORD *)MEMORY[0x1E0CBC718];
      v32 = v74;
    }
    +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v32)
      && !+[NUGlobalSettings forceMeteorPlusLinear](NUGlobalSettings, "forceMeteorPlusLinear"))
    {
      +[NUColorSpace genericGrayGamma2_2ColorSpace](NUColorSpace, "genericGrayGamma2_2ColorSpace");
      v49 = objc_claimAutoreleasedReturnValue();

      v36 = (void *)v49;
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    v48 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
    -[__CFDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9180]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    -[__CFDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9188]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "BOOLValue");

    if ((v52 & 1) != 0 || v54)
      CVBufferRemoveAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8CD8]);
    else
      CVBufferSetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8CD8], (CFTypeRef)objc_msgSend(v36, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);
    v55 = [NUAuxiliaryImageRawBuffer alloc];
    v12 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:](v55, "initWithPixelBuffer:auxiliaryImageType:identifier:", pixelBuffer, 7, v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAuxiliaryImageRawBuffer setMetadata:](v12, "setMetadata:", v56);

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6B8]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = -[NUColorSpace initWithCGColorSpace:]([NUColorSpace alloc], "initWithCGColorSpace:", v57);
      -[NUAuxiliaryImageRawBuffer setColorSpace:](v12, "setColorSpace:", v58);

    }
    if (objc_msgSend(v9, "isEqualToString:", *v34))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D8]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUAuxiliaryImageRawBuffer setCompatibilityMetadata:](v12, "setCompatibilityMetadata:", v59);

    }
    CVPixelBufferRelease(pixelBuffer);
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0C8B1A8], "depthDataFromDictionaryRepresentation:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_14;
  v11 = -[NUAuxiliaryImageAVDepthData initAuxiliaryImageFromAVDepthData:]([NUAuxiliaryImageAVDepthData alloc], "initAuxiliaryImageFromAVDepthData:", v10);
LABEL_13:
  v12 = v11;
LABEL_15:

LABEL_16:
  return v12;
}

+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 metadata:(CGImageMetadata *)a6
{
  id v9;
  NUAuxiliaryImageRawBuffer *v10;

  v9 = a5;
  v10 = -[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:]([NUAuxiliaryImageRawBuffer alloc], "initWithPixelBuffer:auxiliaryImageType:identifier:", a3, a4, v9);

  -[NUAuxiliaryImageRawBuffer setMetadata:](v10, "setMetadata:", a6);
  return v10;
}

+ (id)auxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5 originalProperties:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (a4 == 2)
  {
    objc_msgSend(v13, "auxiliaryImage:", a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:error:", a3, a7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "auxiliaryImageWithPixelBuffer:auxiliaryImageType:identifier:metadata:", a3, a4, v12, objc_msgSend(v13, "auxiliaryDataInfoMetadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColorSpace:", v17);

    v18 = objc_msgSend(v14, "compatibilityMetadata");
    objc_msgSend(v16, "setCompatibilityMetadata:", v18);
  }

  return v16;
}

@end

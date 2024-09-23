@implementation MFAttachment(Utilities)

- (id)_contentTypeIdentifierByStrippingZipIfNeeded:()Utilities
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((a3 & 1) != 0)
    objc_msgSend(a1, "filenameStrippingZipIfNeededUseApplications:", 0);
  else
    objc_msgSend(a1, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "inferredMimeType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(a1, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  softLinkQLTypeCopyUTIForURLAndMimeType(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (__CFString)className
{
  int v2;
  int v4;
  __CFString *v5;
  __CFString *v6;

  v2 = objc_msgSend(a1, "isPass");
  if ((objc_msgSend(a1, "isDisplayableImage") & 1) == 0 && !v2)
    return CFSTR("Apple-mail-fileattach");
  v4 = objc_msgSend(a1, "isSinglePagePDFFile");
  v5 = CFSTR("Apple-mail-imageattach");
  if (v4)
    v5 = CFSTR("Apple-mail-pdf");
  v6 = v5;
  return v6;
}

- (id)contentType
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(a1, "contentTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "typeWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)contentTypeIdentifier
{
  return objc_msgSend(a1, "_contentTypeIdentifierByStrippingZipIfNeeded:", 0);
}

- (uint64_t)isRestrictedMIMEType
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("application/atom+xml"), CFSTR("application/xml"), CFSTR("application/rss+xml"), CFSTR("application/x-webarchive"), CFSTR("application/x-javascript"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "mimeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "containsObject:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)isContentCompressed
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "mimeType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("application/zip"));

  if ((v4 & 1) != 0)
    return 1;
  objc_msgSend(a1, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC678]);

  return v5;
}

- (void)compressContentsWithCompletion:()Utilities
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D4D568]);
  objc_msgSend(a1, "fetchLocalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithContents:path:", v6, v7);

  objc_msgSend(MEMORY[0x1E0D4D560], "archiveDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArchiveEntry:", v8);
  objc_msgSend(MEMORY[0x1E0D4D558], "archive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke;
  v13[3] = &unk_1E5A658F0;
  v11 = v4;
  v16 = v11;
  v12 = v9;
  v14 = v12;
  v15 = a1;
  objc_msgSend(v10, "compressContents:completion:", v12, v13);

}

- (void)decompressContentsWithCompletion:()Utilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4D560], "archiveDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchLocalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputWithData:", v6);

  objc_msgSend(MEMORY[0x1E0D4D558], "archive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke;
  v10[3] = &unk_1E5A65918;
  v8 = v5;
  v11 = v8;
  v9 = v4;
  v12 = a1;
  v13 = v9;
  objc_msgSend(v7, "decompressContents:completion:", v8, v10);

}

- (uint64_t)isMedia
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualMIMETypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "mimeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "containsObject:", v4);
  }
  else
  {
    objc_msgSend(a1, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "MIMETypeForExtension:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v2, "containsObject:", v9);
  }

  return v5;
}

- (uint64_t)isPDFFile
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_opt_class();
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend((id)v2, "_isPDF:", v3);

  if ((v2 & 1) != 0)
    return 1;
  v5 = objc_alloc_init(MEMORY[0x1E0D46148]);
  objc_msgSend(a1, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPathExtension:", v7);

  objc_msgSend(a1, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilename:", v8);

  if (MFGetTypeInfo())
  {
    objc_msgSend(v5, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "mimeType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("application/pdf")) == 0;

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)isCalendarFile
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "mimeType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("text/calendar"));

  return v2;
}

- (uint64_t)_isContentTypeDisplayableByMobileMail
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t IsPlainText;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_contentTypeIdentifierByStrippingZipIfNeeded:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CEC570];
  v19[0] = *MEMORY[0x1E0CEC518];
  v19[1] = v3;
  v4 = *MEMORY[0x1E0CEC660];
  v19[2] = *MEMORY[0x1E0CEC638];
  v19[3] = v4;
  v19[4] = *MEMORY[0x1E0CEC578];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *MEMORY[0x1E0D4D670]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v5;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *MEMORY[0x1E0D4D678]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v2, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14) & 1) != 0)
        {

          IsPlainText = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  IsPlainText = MFContentTypeIsPlainText((uint64_t)v1);
LABEL_11:

  return IsPlainText;
}

- (uint64_t)isContentOpenable
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_contentTypeIdentifierByStrippingZipIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((softLinkQLPreviewControllerSupportsContentType(v2) & 1) != 0
    || (objc_msgSend(a1, "_isContentTypeDisplayableByMobileMail") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(a1, "isMedia");
  }

  return v3;
}

- (BOOL)isCameraRollCompatibleVideo
{
  NSString *v1;
  _BOOL8 IsCompatibleWithSavedPhotosAlbum;

  objc_msgSend(a1, "path");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v1);

  return IsCompatibleWithSavedPhotosAlbum;
}

- (double)imageDimensionsWithData:()Utilities
{
  const __CFData *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  double v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  float v9;
  float v10;
  float v11;
  float v12;

  v3 = a3;
  v4 = CGImageSourceCreateWithData(v3, 0);
  v5 = v4;
  v6 = *MEMORY[0x1E0C9D820];
  if (v4)
  {
    if (CGImageSourceGetCount(v4))
    {
      v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      v8 = v7;
      if (v7)
      {
        objc_msgSend((id)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0CBD048]), "floatValue");
        v10 = v9;
        objc_msgSend((id)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0CBD040]), "floatValue");
        v12 = v11;
        if ((int)objc_msgSend((id)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0CBCFF0]), "intValue") <= 4)
          v6 = v10;
        else
          v6 = v12;
        CFRelease(v8);
      }
    }
    CFRelease(v5);
  }

  return v6;
}

- (void)setImageDimensions:()Utilities
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:");

}

- (double)imageDimensions
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  void *v9;
  char v10;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("_MFImageDimensionsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "CGSizeValue");
    v5 = v4;
  }
  else if (objc_msgSend(a1, "isDataAvailableLocally")
         && objc_msgSend(a1, "isDisplayableImage"))
  {
    objc_msgSend(a1, "fetchLocalData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "imageDimensionsWithData:", v7);
    v5 = v8;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setMetadataValue:forKey:", v9, CFSTR("_MFImageDimensionsKey"));

  }
  else
  {
    v10 = objc_msgSend(a1, "isDisplayableImage");
    v5 = *MEMORY[0x1E0C9D820];
    if ((v10 & 1) == 0)
    {
      +[MFAttachmentImageGenerator defaultHeight](MFAttachmentImageGenerator, "defaultHeight");
      if (!objc_msgSend(a1, "isPass"))
        v5 = 0.0;
    }
  }

  return v5;
}

- (double)markupSizeForImageScale:()Utilities
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a1, "imageDimensions");
  v7 = v5;
  if (v5 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v9 = 1280.0;
    v10 = 640.0;
    if (a3 != 2)
      v10 = v5;
    if (a3 != 4)
      v9 = v10;
    if (a3 == 1)
      v11 = 320.0;
    else
      v11 = v9;
    if ((objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad", 320.0, v9) & 1) != 0)
      v12 = 728.0;
    else
      objc_msgSend(a1, "constrainedWidth");
    if (v11 <= v12)
      v12 = v11;
    if (v12 < v7)
      return (double)(int)v12;
  }
  return v7;
}

- (double)constrainedWidth
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  return v2;
}

- (uint64_t)imageScalingFlags
{
  const __CFData *v2;
  const __CFData *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;

  if (!objc_msgSend(a1, "isImageFile") || !objc_msgSend(a1, "isDataAvailableLocally"))
    return 0;
  objc_msgSend(a1, "fetchLocalData");
  v2 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = CGImageSourceCreateWithData(v2, 0), (v5 = v4) != 0))
  {
    if (CGImageSourceGetCount(v4) <= 1)
    {
      v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      v6 = (uint64_t)v7;
      if (v7)
      {
        objc_msgSend((id)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0CBD048]), "floatValue");
        v9 = v8;
        objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v6, (const void *)*MEMORY[0x1E0CBD040]), "floatValue");
        v11 = v10;
        CFRelease((CFTypeRef)v6);
        if ((unint64_t)-[__CFData length](v3, "length") <= 0x60000)
        {
          v6 = 0;
        }
        else
        {
          v12 = v9;
          if (v9 >= v11)
            v13 = v9;
          else
            v13 = v11;
          if (v9 >= v11)
            v12 = v11;
          if (v13 <= 1280.0 && v12 <= 960.0)
          {
            if (v13 <= 640.0 && v12 <= 480.0)
              v6 = v12 > 240.0 || v13 > 320.0;
            else
              v6 = 3;
          }
          else
          {
            v6 = 7;
          }
        }
      }
      if ((CGImageSourceIsColorOptimizedForSharing() & 1) == 0)
        objc_msgSend(a1, "setMetadataValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_MFImageNeedsColorspaceConversion"));
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)needsColorspaceConversion
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("_MFImageNeedsColorspaceConversion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_setImageScale:()Utilities
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:");

}

- (const)_imageScalingKeyForImageScale:()Utilities
{
  if (a3 > 4)
    return CFSTR("kFullScaleKey");
  else
    return off_1E5A659B0[a3];
}

- (uint64_t)scaledFileSizeForScale:()Utilities
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "_imageScalingKeyForImageScale:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "metadataValueForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      v7 = (id)objc_msgSend(a1, "scaledImageToFit:saveScaledImage:attachmentContextID:", a3, 0, 0);
  }
  objc_msgSend(a1, "metadataValueForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (id)scaledImageToFit:()Utilities saveScaledImage:attachmentContextID:
{
  char *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGImageSource *v14;
  id v15;
  const __CFString *v16;
  const __CFDictionary *v17;
  double v18;
  const __CFDictionary *v19;
  void *v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  CGDataConsumer *v36;
  const __CFDictionary *v37;
  CGImageDestination *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  int v52;
  void *context;
  MFHardwareJPEGScaler *v54;
  uint64_t v55;
  const __CFDictionary *v56;
  MFHardwareJPEGScaler *v57;
  __CFString *v58;
  id info;
  const __CFData *data;
  id v61;
  void *v62;
  uint8_t buf[16];
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  v61 = a5;
  v8 = a1;
  objc_msgSend(v8, "_imageScalingKeyForImageScale:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "needsColorspaceConversion");
  if (v9)
  {
    objc_msgSend(v8, "metadataValueForKey:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v62 = (void *)v11;
      if (!a4)
      {
        v62 = (void *)v11;
LABEL_21:
        v24 = v8;
        goto LABEL_73;
      }
    }
    else
    {
      v62 = 0;
    }
  }
  else
  {
    v62 = 0;
  }
  if (!objc_msgSend(v8, "isDisplayableImage"))
    goto LABEL_21;
  v12 = objc_msgSend(v8, "imageScalingFlags");
  if (!a3 || (v12 & a3) == 0)
  {
    v25 = objc_msgSend(v8, "decodedFileSize");
    if (v25)
    {
      if (!v9)
        goto LABEL_28;
    }
    else
    {
      objc_msgSend(v8, "fetchDataSynchronously:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v28, "length");

      if (!v9)
      {
LABEL_28:
        v26 = 0;
        v27 = 0;
        goto LABEL_68;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMetadataValue:forKey:", v29, v9);

    goto LABEL_28;
  }
  objc_msgSend(v8, "fetchDataSynchronously:", 0);
  data = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (data)
  {
    objc_msgSend(v8, "contentTypeIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0CBD2A8];
    v65[0] = v13;
    v58 = (__CFString *)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v56 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = CGImageSourceCreateWithData(data, v56);
    if (!v14)
    {
      v26 = 0;
      v27 = 0;
      v25 = 0xAAAAAAAAAAAAAAAALL;
LABEL_66:

      goto LABEL_67;
    }
    v54 = -[MFHardwareJPEGScaler initWithImageData:imageSource:]([MFHardwareJPEGScaler alloc], "initWithImageData:imageSource:", data, v14);
    v15 = objc_alloc_init(MEMORY[0x1E0D46068]);
    v57 = v54;
    info = v15;
    context = (void *)MEMORY[0x1AF432E70]();
    v16 = v58;
    v17 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
    v19 = v17;
    switch(a3)
    {
      case 1:
        v30 = 1134559232;
        break;
      case 2:
        v30 = 1142947840;
        break;
      case 4:
        if (!v17)
        {
          v33 = 0;
          goto LABEL_59;
        }
        CFDictionaryGetValue(v17, (const void *)*MEMORY[0x1E0CBD048]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E0CBD040]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v51;
        v22 = v21;
        if (objc_msgSend(v21, "compare:", v20, v51) == -1)
        {
          v22 = v20;

        }
        objc_msgSend(v22, "floatValue");
        *(float *)&v23 = *(float *)&v23 * 0.5;
        if (*(float *)&v23 < 1280.0)
          *(float *)&v23 = 1280.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
        v55 = objc_claimAutoreleasedReturnValue();

LABEL_35:
        CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E0CBCF70]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CA8]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v19);
        LODWORD(v19) = v32 != 0;

        v16 = v58;
LABEL_36:
        v33 = (void *)v55;
        if (v55)
        {
          if (((v10 | v19) & 1) != 0
            || !-[MFHardwareJPEGScaler scaleImageToFitLargestDimension:dataConsumer:](v57, "scaleImageToFitLargestDimension:dataConsumer:", v55, info))
          {
            if (v10)
            {
              MFLogGeneral();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1AB96A000, v35, OS_LOG_TYPE_INFO, "#Attachments doing color-conversion for wide-gamut image", buf, 2u);
              }

              v16 = v58;
            }
            v52 = (int)v19;
            *(_OWORD *)buf = xmmword_1E5A65980;
            v36 = CGDataConsumerCreate(info, (const CGDataConsumerCallbacks *)buf);
            if (v36)
            {
              v37 = CGImageSourceCopyProperties(v14, 0);
              v38 = CGImageDestinationCreateWithDataConsumer(v36, v16, 1uLL, v37);
              if (v37)
                CFRelease(v37);
              if (v38)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setObject:forKey:", v55, *MEMORY[0x1E0CBC778]);
                if (v10)
                  objc_msgSend(v39, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC7A0]);
                if (v52)
                  objc_msgSend(v39, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC7B0]);
                CGImageDestinationAddImageFromSource(v38, v14, 0, (CFDictionaryRef)v39);
                v40 = CGImageDestinationFinalize(v38);
                CFRelease(v38);

              }
              else
              {
                v40 = 0;
              }
              CGDataConsumerRelease(v36);
            }
            else
            {
              v40 = 0;
            }
            v34 = v40;
          }
          else
          {
            v34 = 1;
          }
          v33 = (void *)v55;
          goto LABEL_60;
        }
LABEL_59:
        v34 = 0;
LABEL_60:

        objc_autoreleasePoolPop(context);
        CFRelease(v14);
        objc_msgSend(info, "done");
        objc_msgSend(info, "data");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v41, "length");

        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setMetadataValue:forKey:", v42, v9);

        }
        if ((v34 & a4) == 1)
        {
          objc_msgSend(info, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(info, "data");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v43, "updateAttachment:withNewData:", v8, v44);

          objc_msgSend(v8, "_setImageScale:", a3);
        }
        else
        {
          v26 = 0;
          v27 = 0;
        }

        goto LABEL_66;
      default:
        v55 = 0;
LABEL_34:
        if (!v19)
          goto LABEL_36;
        goto LABEL_35;
    }
    LODWORD(v18) = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v55 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v26 = 0;
  v27 = 0;
  v25 = 0xAAAAAAAAAAAAAAAALL;
LABEL_67:

LABEL_68:
  if (!v61 || (v26 & 1) != 0)
  {
    v24 = v8;
  }
  else
  {
    v45 = *(void **)&v8[*MEMORY[0x1E0D4D628]];
    objc_msgSend(v8, "mimeType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "attachmentForData:mimeType:fileName:contentID:context:", v27, v46, v47, v48, v61);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMetadataValue:forKey:", v49, v9);

    objc_msgSend(v24, "_setImageScale:", a3);
  }

LABEL_73:
  return v24;
}

- (void)enqueueScaleAttachmentWithCompletionBlock:()Utilities
{
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id obj;
  NSObject *queue;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(*(id *)&a1[*MEMORY[0x1E0D4D628]], "imageScalingQueue");
  queue = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  objc_msgSend(a1, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "imageScalingFlags", v6);
  if ((v7 & 1) != 0)
  {
    v8 = &unk_1E5A9F2F8;
  }
  else if ((v7 & 2) != 0)
  {
    v8 = &unk_1E5A9F310;
  }
  else
  {
    if ((v7 & 4) == 0)
      goto LABEL_8;
    v8 = &unk_1E5A9F328;
  }
  objc_msgSend(v6, "addObject:", v8);
LABEL_8:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "unsignedIntegerValue");
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke;
        block[3] = &unk_1E5A65458;
        block[4] = a1;
        v23 = v5;
        v24 = v13;
        dispatch_group_async(v4, queue, block);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke_2;
  v19[3] = &unk_1E5A65940;
  v19[4] = a1;
  v20 = v5;
  v21 = v16;
  v14 = v16;
  v15 = v5;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], v19);

}

- (uint64_t)_imageScale
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("_MFImageScaleSelected"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)scaledFileSize
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "_imageScale");
  objc_msgSend(a1, "_imageScalingKeyForImageScale:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v2 & 1) != 0)
  {
    v4 = 1;
  }
  else if ((v2 & 2) != 0)
  {
    v4 = 2;
  }
  else
  {
    if ((v2 & 4) == 0)
      goto LABEL_8;
    v4 = 4;
  }
  objc_msgSend(a1, "_imageScalingKeyForImageScale:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v5;
LABEL_8:
  if (v3)
  {
    objc_msgSend(a1, "metadataValueForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (uint64_t)isBasicImageMimeType:()Utilities
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (isBasicImageMimeType__onceToken != -1)
    dispatch_once(&isBasicImageMimeType__onceToken, &__block_literal_global_3);
  v4 = objc_msgSend((id)isBasicImageMimeType__sBasicImageMIMETypes, "containsObject:", v3);

  return v4;
}

+ (BOOL)_isPDF:()Utilities
{
  id v3;
  _BOOL8 v4;

  v3 = a3;
  if (v3)
  {
    if (objc_msgSend(CFSTR("application/pdf"), "caseInsensitiveCompare:", v3))
      v4 = objc_msgSend(CFSTR("image/pdf"), "caseInsensitiveCompare:", v3) == 0;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)isBasicImage
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isBasicImageMimeType:", v3);

  return v4;
}

- (uint64_t)isDisplayableImage
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((objc_msgSend(a1, "isBasicImage") & 1) != 0)
    return 1;
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("image"));

  if (v4)
  {
    if ((objc_msgSend(a1, "isDisplayableByWebKit") & 1) != 0)
      return 1;
  }
  else
  {
    v2 = 1;
    if ((objc_msgSend(a1, "_isSinglePagePDFFileFetchLocalData:", 1) & 1) != 0)
      return v2;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0D46148]);
  objc_msgSend(a1, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPathExtension:", v7);

  objc_msgSend(a1, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilename:", v8);

  if (MFGetTypeInfo())
  {
    objc_msgSend(v5, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasPrefix:", CFSTR("image")))
    {
      +[MFWebKitMainThread sharedInstance](MFWebKitMainThread, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mimeType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v10, "dictValueForMimeType:", v11) & 1;

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)isDisplayableByWebKit
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(a1, "mimeType");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  +[MFWebKitMainThread sharedInstance](MFWebKitMainThread, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mimeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "dictValueForMimeType:", v5);

  if ((v6 & 1) != 0)
    return 1;
LABEL_3:
  objc_msgSend(a1, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9
     && objc_msgSend(v9, "length")
     && ((objc_msgSend(v9, "isEqualToString:", CFSTR("doc")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("xls")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("pdf")));

  return v10;
}

- (uint64_t)isDisplayableInsidePlugin
{
  return objc_msgSend(a1, "isDisplayableInline") ^ 1;
}

- (uint64_t)isDisplayableInline
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t result;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("MFAttachmentDisplayabilityCheckedKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(a1, "metadataValueForKey:", CFSTR("MFAttachmentIsDisplayableKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
LABEL_7:

    return v5;
  }
  if ((objc_msgSend(a1, "isDisplayableImage") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(a1, "mimeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("css"));

  if ((v7 & 1) != 0)
    goto LABEL_5;
  if ((objc_msgSend(a1, "isRestrictedMIMEType") & 1) != 0 || (objc_msgSend(a1, "isContentOpenable") & 1) != 0)
    goto LABEL_19;
  objc_msgSend(a1, "mimeType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("application")))
  {
    v10 = objc_msgSend(a1, "isDisplayableByWebKit");

    if ((v10 & 1) != 0)
      goto LABEL_5;
  }
  else
  {

  }
  v11 = objc_alloc_init(MEMORY[0x1E0D46148]);
  objc_msgSend(a1, "fileName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPathExtension:", v13);

  objc_msgSend(a1, "fileName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilename:", v14);

  if (!MFGetTypeInfo()
    || (objc_msgSend(v11, "mimeType"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
  {

    goto LABEL_19;
  }
  +[MFWebKitMainThread sharedInstance](MFWebKitMainThread, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mimeType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dictValueForMimeType:", v17);

  if ((v18 & 1) != 0)
  {
LABEL_5:
    v5 = 1;
LABEL_6:
    objc_msgSend(a1, "setMetadataValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MFAttachmentDisplayabilityCheckedKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setMetadataValue:forKey:", v4, CFSTR("MFAttachmentIsDisplayableKey"));
    goto LABEL_7;
  }
LABEL_19:
  v19 = objc_msgSend(a1, "isDataAvailableLocally");
  v5 = 0;
  result = 0;
  if (v19)
    goto LABEL_6;
  return result;
}

- (NSObject)filenameStrippingZipIfNeededUseApplications:()Utilities
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v18;
  char v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileName");
  v4 = objc_claimAutoreleasedReturnValue();
  -[NSObject pathExtension](v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("zip"));

  if (v7)
  {
    -[NSObject stringByDeletingPathExtension](v4, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", &stru_1E5A6A588) & 1) == 0)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:", v8, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(v10, "applicationsAvailableForOpeningWithError:", &v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        v13 = v12;
        if (v11 || !v12)
        {
          if (!objc_msgSend(v11, "count"))
          {
LABEL_12:

            goto LABEL_13;
          }
          v14 = v4;
          v4 = v8;
        }
        else
        {
          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "ef_publicDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFAttachment(Utilities) filenameStrippingZipIfNeededUseApplications:].cold.1((uint64_t)v8, v15, (uint64_t)v19);
          }
        }

        goto LABEL_12;
      }
      v16 = v8;

      v4 = v16;
    }
LABEL_13:

  }
  return v4;
}

- (id)markupStringForCompositionWithPrependedBlankLine:()Utilities imageScale:useAttachmentElement:
{
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  objc_msgSend(a1, "contentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MFCreateURLForContentID();

  if (a5 && (objc_msgSend(a1, "isDisplayableImage") & 1) == 0)
  {
    v27 = objc_msgSend(a1, "decodedFileSize");
    if (!v27)
      v27 = objc_msgSend(a1, "encodedFileSize");
    objc_msgSend(a1, "fileName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ef_stringByEscapingForXML");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "mimeType");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("<ATTACHMENT SRC=\"%@\" ID=\"%@\" TITLE=\"%@\" TYPE=\"%@\" SUBTITLE=\"%@\">"), v11, v9, v18, v19, v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "markupSizeForImageScale:", a4);
    v13 = v12;
    v15 = v14;
    if ((objc_msgSend(a1, "isDisplayableImage") & 1) != 0
      || (v13 == *MEMORY[0x1E0C9D820] ? (v16 = v15 == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v16 = 0), v16))
    {
      v18 = &stru_1E5A6A588;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" "));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v13 > 0.00000011920929)
        -[__CFString appendFormat:](v17, "appendFormat:", CFSTR("WIDTH=\"%d\" %@=\"\"), (int)v13, CFSTR("X-APPLE-ORIGINAL-WIDTH"));
      if (v15 > 0.00000011920929)
        -[__CFString appendFormat:](v18, "appendFormat:", CFSTR("HEIGHT=\"%d\" %@=\"\"), (int)v15, CFSTR("X-APPLE-ORIGINAL-HEIGHT"));
    }
    v19 = &stru_1E5A6A588;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    {
      objc_msgSend(a1, "mimeType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("application/pdf"));

      v22 = CFSTR(" background-color: white;");
      if (!v21)
        v22 = &stru_1E5A6A588;
      v23 = CFSTR(" max-width: 100%");
      if (!v21)
        v23 = &stru_1E5A6A588;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" STYLE=\"padding:0px 1px 1px 0px;%@%@\"), v22, v23);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "className");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("<IMG SRC=\"%@\" CLASS=\"%@\" ID=\"%@\"%@%@>"), v11, v25, v9, v18, v19);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v26;

  if (a3 && objc_msgSend(v30, "length"))
  {
    objc_msgSend(CFSTR("<BR><BR>"), "stringByAppendingString:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v31;
  }

  return v30;
}

- (id)markupStringForDisplayWithData:()Utilities allowAttachmentElement:
{
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "contentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "isDataAvailableLocally");
  v9 = objc_msgSend(a1, "isDisplayableInline");
  v10 = objc_msgSend(a1, "hasCalendarMetadata");
  if (v9)
  {
    v11 = a3 ? v8 : 0;
    if ((v11 | v10) == 1)
    {
      v12 = &stru_1E5A6A588;
      if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
      {
        objc_msgSend(a1, "mimeType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("application/pdf"));

        v15 = CFSTR(" background-color: white;");
        if (!v14)
          v15 = &stru_1E5A6A588;
        v16 = CFSTR(" max-width: 100%");
        if (!v14)
          v16 = &stru_1E5A6A588;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" STYLE=\"padding:1px 0px 1px 0px;%@%@\"),
          v15,
          v16);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)MFCreateURLForContentID();
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<img src=\"%@\" id=\"%@\"), v17, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v12, "length"))
        objc_msgSend(v18, "appendString:", v12);
      if (objc_msgSend(&stru_1E5A6A588, "length"))
        objc_msgSend(v18, "appendString:", &stru_1E5A6A588);
      objc_msgSend(v18, "appendString:", CFSTR(">"));

      goto LABEL_38;
    }
  }
  if (!a4)
  {
    v18 = 0;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "url");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attachmentForURL:error:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "filenameStrippingZipIfNeededUseApplications:", 1);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v7, CFSTR("id"));
  if (v22)
    v24 = v22;
  else
    v24 = CFSTR("---");
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("title"));
  objc_msgSend(a1, "attachmentContentTypeForFileName:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("type"));

  if (!objc_msgSend(v21, "isDataAvailableLocally") || !objc_msgSend(a1, "isPass"))
  {
    v26 = 0;
    goto LABEL_34;
  }
  v40 = 0;
  objc_msgSend(v21, "passWithError:", &v40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v40;
  if (v26)
  {
    objc_msgSend(v26, "localizedName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v26, "localizedName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("title"));

    }
    objc_msgSend(v26, "organizationName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_33;
    objc_msgSend(v26, "organizationName");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("subtitle"));
  }
  else
  {
    MFLogGeneral();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v27, "localizedDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v39;
      v43 = 2112;
      v44 = v38;
      _os_log_error_impl(&dword_1AB96A000, v31, OS_LOG_TYPE_ERROR, "#Attachments Error creating pass [%@] [%@]", buf, 0x16u);

    }
  }

LABEL_33:
LABEL_34:
  v32 = objc_msgSend(a1, "decodedFileSize");
  if (v32 || (v32 = objc_msgSend(a1, "encodedFileSize")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, CFSTR("subtitle"));

  }
  objc_msgSend((id)objc_opt_class(), "attachmentElementHTMLStringWithAttributes:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
  MFLogGeneral();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "fileName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v35;
    v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_1AB96A000, v34, OS_LOG_TYPE_INFO, "#Attachments Attachment %@ translates to HTML:\"%@\", buf, 0x16u);

  }
  return v18;
}

+ (id)attachmentElementHTMLStringWithAttributes:()Utilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v10[0] = CFSTR("---");
  v9[0] = CFSTR("action");
  v9[1] = CFSTR("_mf_downloadingStatus");
  MFLookupLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("_mf_downloadableStatus");
  MFLookupLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addEntriesFromDictionary:", v6);
  objc_msgSend(MEMORY[0x1E0D1EEC8], "htmlSnippetWithTag:includeTrailingTag:attributes:", CFSTR("attachment"), 1, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)filenameStrippingZipIfNeededUseApplications:()Utilities .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AB96A000, "#Attachments Error retriving applications for %@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end

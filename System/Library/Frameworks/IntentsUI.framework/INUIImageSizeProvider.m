@implementation INUIImageSizeProvider

+ (id)downscaledPNGImageForImage:(id)a3 size:(id)a4 error:(id *)a5
{
  double var1;
  double var0;
  id v8;
  void *v9;
  const __CFData *v10;
  const __CFURL *v11;
  void *v12;
  CGImageSourceRef v13;
  void *v14;
  uint64_t v15;
  id v16;
  CGImageSource *v17;
  void *v18;
  CFDictionaryRef v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  const __CFDictionary *v40;
  CGImage *ThumbnailAtIndex;
  __CFData *v42;
  __CFString *v43;
  CGImage *v44;
  CGImageDestination *v45;
  __CFData *v46;
  CGImage *v47;
  NSObject *v48;
  const __CFString *v49;
  __CFString *v51;
  CGImage *v52;
  CGImageDestination *v53;
  const __CFDictionary *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[3];

  var1 = a4.var1;
  var0 = a4.var0;
  v83[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (var0 != 0.0 && var1 != 0.0)
  {
    objc_msgSend(v8, "_imageData");
    v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_uri");
    v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v13 = CGImageSourceCreateWithData(v10, 0);
    }
    else
    {
      if (!v11)
      {
LABEL_19:
        if (a5)
        {
          v28 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *MEMORY[0x1E0CBD458];
          v80 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image is invalid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 6009, v20);
          v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

          goto LABEL_42;
        }
        v16 = 0;
LABEL_42:

        goto LABEL_43;
      }
      v13 = CGImageSourceCreateWithURL(v11, 0);
    }
    v17 = v13;
    if (v13)
    {
      v78 = *MEMORY[0x1E0CBD240];
      v79 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CGImageSourceCopyPropertiesAtIndex(v17, 0, (CFDictionaryRef)v18);
      v20 = v19;
      if (!v19)
      {
        CFRelease(v17);
        if (!a5)
        {
          v20 = 0;
          v16 = 0;
          goto LABEL_41;
        }
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CBD458];
        v76 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current image size unknown"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 6009);
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      -[__CFDictionary objectForKey:](v19, "objectForKey:", *MEMORY[0x1E0CBD048]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CBD040]);
      v22 = objc_claimAutoreleasedReturnValue();
      v57 = (void *)v22;
      if (!v21 || (v23 = (void *)v22) == 0)
      {
        CFRelease(v17);
        if (a5)
        {
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v33 = *MEMORY[0x1E0CBD458];
          v74 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current image size unknown"));
          v55 = v21;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 6009, v35);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v21 = v55;
        }
        v16 = 0;
        goto LABEL_40;
      }
      objc_msgSend(v21, "doubleValue");
      v25 = v24;
      objc_msgSend(v23, "doubleValue");
      if (var0 >= v25 || var1 >= v26)
      {
        CFRelease(v17);
        v16 = v9;
LABEL_40:

        goto LABEL_41;
      }
      v36 = v26;
      v56 = v21;
      v72[0] = *MEMORY[0x1E0CBD2A0];
      if (v25 <= v26)
        v37 = var1;
      else
        v37 = var0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = *MEMORY[0x1E0CBD178];
      v39 = *MEMORY[0x1E0C9AE50];
      v73[0] = v38;
      v73[1] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
      v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, v40);
      if (v10)
      {
        v54 = v40;
        v42 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v44 = ThumbnailAtIndex;
        v45 = CGImageDestinationCreateWithData(v42, v43, 1uLL, 0);

        v46 = v42;
        v47 = v44;
        CGImageDestinationAddImage(v45, v44, 0);
        CGImageDestinationFinalize(v45);
        objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v46);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v45)
          CFRelease(v45);

      }
      else
      {
        if (!v12)
        {
          v16 = 0;
          v21 = v56;
          goto LABEL_35;
        }
        v54 = v40;
        objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v52 = ThumbnailAtIndex;
        v53 = CGImageDestinationCreateWithURL((CFURLRef)v12, v51, 1uLL, 0);

        v47 = v52;
        CGImageDestinationAddImage(v53, v52, 0);
        CGImageDestinationFinalize(v53);
        objc_msgSend(MEMORY[0x1E0CBD958], "imageWithURL:", v12);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v53)
          CFRelease(v53);
      }
      ThumbnailAtIndex = v47;
      v40 = v54;
      v21 = v56;
LABEL_35:
      objc_msgSend(v16, "_setImageSize:", var0, var1);
      CGImageRelease(ThumbnailAtIndex);
      CFRelease(v17);
      v48 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        v49 = CFSTR("data");
        *(_DWORD *)buf = 136316674;
        v59 = "+[INUIImageSizeProvider downscaledPNGImageForImage:size:error:]";
        if (!v10)
          v49 = CFSTR("URL");
        v60 = 2112;
        v61 = v49;
        v62 = 2112;
        v63 = v9;
        v64 = 2048;
        v65 = v25;
        v66 = 2048;
        v67 = v36;
        v68 = 2048;
        v69 = var0;
        v70 = 2048;
        v71 = var1;
        _os_log_impl(&dword_1DC055000, v48, OS_LOG_TYPE_INFO, "%s Scaled %@ image %@ from size {%f, %f} to size {%f, %f}", buf, 0x48u);
      }

      goto LABEL_40;
    }
    goto LABEL_19;
  }
  if (a5)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CBD458];
    v82 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image size is zero"));
    v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v83[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 6009, v12);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  v16 = 0;
LABEL_43:

  return v16;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)imageSizeForImage:(id)a3
{
  id v3;
  const __CFData *v4;
  const __CFURL *v5;
  CGImageSourceRef v6;
  CGImageSource *v7;
  const __CFDictionary *v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  _QWORD v19[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_imageData");
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_uri");
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = CGImageSourceCreateWithData(v4, 0);
  }
  else
  {
    if (!v5)
    {
LABEL_8:
      v13 = 0.0;
      v15 = 0.0;
      goto LABEL_11;
    }
    v6 = CGImageSourceCreateWithURL(v5, 0);
  }
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  v18 = *MEMORY[0x1E0CBD240];
  v19[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v8);
  CFRelease(v7);
  if (v9)
  {
    -[__CFDictionary objectForKey:](v9, "objectForKey:", *MEMORY[0x1E0CBD048]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKey:](v9, "objectForKey:", *MEMORY[0x1E0CBD040]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
    objc_msgSend(v11, "doubleValue");
    v15 = v14;

  }
  else
  {
    v13 = 0.0;
    v15 = 0.0;
  }

LABEL_11:
  v16 = v13;
  v17 = v15;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

@end

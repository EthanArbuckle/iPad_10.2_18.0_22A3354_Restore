@implementation UIImage(Conversion)

+ (id)animatedImageWithHEICRepresentation:()Conversion
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)*MEMORY[0x1E0CEC508];
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)animatedImageWithHEICSRepresentation:()Conversion
{
  return objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", a3, CFSTR("public.heics"));
}

+ (id)animatedImageWithAPNGRepresentation:()Conversion
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)*MEMORY[0x1E0CEC580];
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (CGImageSource)avt_animatedImageWithDataRepresentation:()Conversion ofType:
{
  id v5;
  CGImageSource *v6;
  CGImageSource *v7;
  size_t Count;
  void *v9;
  size_t i;
  CGImageRef ImageAtIndex;
  CGImage *v12;
  void *v13;
  CFDictionaryRef v14;
  const __CFDictionary *v15;
  void *v16;
  int v17;
  const __CFDictionary *Value;
  const void *v19;
  void *v20;
  int v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFNumber *v24;
  float v25;
  unint64_t v26;
  float valuePtr;

  v5 = a4;
  v6 = CGImageSourceCreateWithData(a3, 0);
  v7 = v6;
  if (v6)
  {
    Count = CGImageSourceGetCount(v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, i, 0);
        if (ImageAtIndex)
        {
          v12 = ImageAtIndex;
          objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", ImageAtIndex);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13);

          CGImageRelease(v12);
        }
        else
        {
          NSLog(CFSTR("[AvatarKit] Animated Image couldn't get image at index: %ld"), i);
        }
      }
    }
    valuePtr = 0.016667;
    v14 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    if (!v14)
      goto LABEL_18;
    v15 = v14;
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "isEqualToString:", v16);

    if (v17)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CBD028]);
      v19 = (const void *)*MEMORY[0x1E0CBC820];
      goto LABEL_15;
    }
    objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "isEqualToString:", v20);

    if (v21)
    {
      valuePtr = 0.066667;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("public.heics")))
    {
      v22 = CGImageSourceCopyProperties(v7, 0);
      v23 = (const __CFDictionary *)CFDictionaryGetValue(v22, (const void *)*MEMORY[0x1E0CBCE80]);
      CFRelease(v22);
      v19 = (const void *)*MEMORY[0x1E0CBCE90];
      Value = v23;
LABEL_15:
      v24 = (const __CFNumber *)CFDictionaryGetValue(Value, v19);
      if (v24)
        CFNumberGetValue(v24, kCFNumberFloatType, &valuePtr);
    }
    CFRelease(v15);
LABEL_18:
    CFRelease(v7);
    v25 = 1.0 / valuePtr;
    v26 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0CEA638], "animatedImageWithImages:duration:", v9, (double)v26 / v25);
    v7 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (float)frameDelayInSeconds
{
  void *v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "images");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(unint64_t)objc_msgSend(v2, "count");
  objc_msgSend(a1, "duration");
  v5 = v3 / v4;

  return 1.0 / v5;
}

- (id)HEICRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)HEICSRepresentation
{
  return objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", CFSTR("public.heics"));
}

- (id)APNGRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFData)avt_dataRepresentationForTypeIdentifier:()Conversion
{
  __CFString *v4;
  __CFData *Mutable;
  int v6;
  int v7;
  void *v8;
  int v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  const __CFDictionary *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  size_t v45;
  CGImageDestination *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFData *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  void (*v60)(uint64_t, id);
  void *v61;
  id v62;
  CGImageDestination *v63;
  _BYTE v64[128];
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  uint64_t v75;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[3];
  _QWORD v80[5];

  v80[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Mutable = CFDataCreateMutable(0, 0);
  objc_msgSend(a1, "frameDelayInSeconds");
  v7 = v6;
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", v8);

  if (v9)
  {
    v54 = Mutable;
    v79[0] = *MEMORY[0x1E0CBD028];
    v11 = v79[0];
    v12 = *MEMORY[0x1E0CBC820];
    v77[0] = *MEMORY[0x1E0CBC818];
    v77[1] = v12;
    v78[0] = &unk_1EA655918;
    LODWORD(v10) = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v14;
    v79[1] = *MEMORY[0x1E0CBCA00];
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "scale");
    objc_msgSend(v15, "numberWithDouble:", v16 * 72.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v17;
    v79[2] = *MEMORY[0x1E0CBC9F8];
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "scale");
    objc_msgSend(v18, "numberWithDouble:", v19 * 72.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v75 = v11;
    v73[0] = *MEMORY[0x1E0CBC810];
    LODWORD(v22) = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v23;
    v73[1] = *MEMORY[0x1E0CBC780];
    LODWORD(v24) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    Mutable = v54;
    goto LABEL_7;
  }
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("public.heics")))
  {
    v54 = Mutable;
    objc_msgSend(a1, "size");
    v29 = v28;
    v31 = v30;
    v71[0] = *MEMORY[0x1E0CBCE80];
    v32 = v71[0];
    v69 = *MEMORY[0x1E0CBCE90];
    LODWORD(v28) = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v34;
    v71[1] = *MEMORY[0x1E0CBCE70];
    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "scale");
    objc_msgSend(v35, "numberWithDouble:", v29 * v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v37;
    v71[2] = *MEMORY[0x1E0CBCE68];
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "scale");
    objc_msgSend(v38, "numberWithDouble:", v31 * v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v67 = v32;
    v65 = *MEMORY[0x1E0CBCE78];
    LODWORD(v41) = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v21 = (const __CFDictionary *)MEMORY[0x1E0C9AA70];
  v27 = (void *)MEMORY[0x1E0C9AA70];
LABEL_7:
  objc_msgSend(a1, "images");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");
  v44 = v43;
  if (v43 <= 1)
    v45 = 1;
  else
    v45 = v43;
  v46 = CGImageDestinationCreateWithData(Mutable, v4, v45, 0);
  CGImageDestinationSetProperties(v46, v21);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v60 = __63__UIImage_Conversion__avt_dataRepresentationForTypeIdentifier___block_invoke;
  v61 = &unk_1EA61E180;
  v63 = v46;
  v47 = v27;
  v62 = v47;
  if (v44)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v48 = v42;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v56;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v56 != v51)
            objc_enumerationMutation(v48);
          v60((uint64_t)v59, *(id *)(*((_QWORD *)&v55 + 1) + 8 * v52++));
        }
        while (v50 != v52);
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v50);
    }

  }
  else
  {
    CGImageDestinationAddImage(v46, (CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"), (CFDictionaryRef)v47);
  }
  CGImageDestinationFinalize(v46);
  if (v46)
    CFRelease(v46);

  return Mutable;
}

- (uint64_t)copyByReorderingImagesWithFirstImageAtTime:()Conversion
{
  void *v4;
  float v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a1, "images");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 > 0.0)
  {
    objc_msgSend(a1, "frameDelayInSeconds");
    v6 = vcvtmd_s64_f64(a2 / v5);
    objc_msgSend(v4, "subarrayWithRange:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", v6, objc_msgSend(v4, "count") - v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  v10 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(a1, "duration");
  objc_msgSend(v10, "animatedImageWithImages:duration:", v4);
  v11 = objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

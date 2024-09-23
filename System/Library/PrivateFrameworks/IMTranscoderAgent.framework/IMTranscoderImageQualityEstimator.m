@implementation IMTranscoderImageQualityEstimator

+ (MLModel)imageQualityEstimatorModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = (void *)qword_2553B4020;
  if (!qword_2553B4020)
  {
    objc_msgSend_setImageQualityEstimatorModel_(IMTranscoderImageQualityEstimator, a2, 0, v2, v3, v4, v5);
    v6 = (void *)qword_2553B4020;
  }
  return (MLModel *)v6;
}

+ (void)setImageQualityEstimatorModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundlePath(v11, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("%@/%@"), v20, v21, v22, v23, v18, CFSTR("Image_Estimator_HEIF.mlmodelc"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v25, (uint64_t)v24, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend_modelWithContentsOfURL_error_(MEMORY[0x24BDBFFC8], v31, (uint64_t)v30, (uint64_t)&v38, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v38;
  if (v36)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v36;
        _os_log_impl(&dword_21DFB1000, v37, OS_LOG_TYPE_INFO, "Error happened when creating a compiled model instance: %@", buf, 0xCu);
      }
LABEL_11:

    }
  }
  else if (v35)
  {
    objc_storeStrong((id *)&qword_2553B4020, v35);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_21DFB1000, v37, OS_LOG_TYPE_INFO, "Failed to initialize model instance using model path %@", buf, 0xCu);
    }
    goto LABEL_11;
  }

}

+ (id)standardizeModelInputFeatures:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t v84[16];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_allKeys(v3, v4, v5, v6, v7, v8, v9);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v85, (uint64_t)v89, 16, v12, v13);
  if (v19)
  {
    v20 = *(_QWORD *)v86;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v86 != v20)
          objc_enumerationMutation(v10);
        v22 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v21);
        if ((objc_msgSend_isEqual_(v22, v14, (uint64_t)CFSTR("Input Quality Factor"), v15, v16, v17, v18) & 1) != 0
          || objc_msgSend_isEqual_(v22, v23, (uint64_t)CFSTR("Input Qf Square"), v24, v25, v26, v27))
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_12;
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v84 = 0;
            _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "These keys are not supported for HEIC model, therefore dont standardize.", v84, 2u);
          }
          goto LABEL_11;
        }
        objc_msgSend_objectForKey_(&unk_24E202E70, v28, (uint64_t)v22, v29, v30, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v34, v35, v36, v37, v38, v39, v40);
        v42 = v41;

        objc_msgSend_objectForKey_(&unk_24E202E98, v43, (uint64_t)v22, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v48, v49, v50, v51, v52, v53, v54);
        v56 = v55;

        objc_msgSend_objectForKey_(v3, v57, (uint64_t)v22, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v62, v63, v64, v65, v66, v67, v68);
        v70 = v69;

        if (v56 == 0.0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v84 = 0;
              _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "Do not standardize for this key.", v84, 2u);
            }
LABEL_11:

          }
        }
        else
        {
          objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v71, v72, v73, v74, v75, v76, (v70 - v42) / v56);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v3, v78, (uint64_t)v77, (uint64_t)v22, v79, v80, v81);

        }
LABEL_12:
        ++v21;
      }
      while (v19 != v21);
      v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v85, (uint64_t)v89, 16, v17, v18);
      v19 = v82;
    }
    while (v82);
  }

  return v3;
}

+ (id)oneHotEncodeTargetMaxDimFeature:(id)a3 suggestedMaxLength:(int)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a3;
  if (a4 <= 1599)
  {
    switch(a4)
    {
      case 800:
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v10, v28, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_800"), v29, v30, v31);
        goto LABEL_17;
      case 1024:
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v10, v36, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_1024"), v37, v38, v39);
        goto LABEL_17;
      case 1280:
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v10, v16, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_1280"), v17, v18, v19);
        goto LABEL_17;
    }
  }
  else if (a4 > 2999)
  {
    if (a4 == 3000)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v10, v32, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_3000"), v33, v34, v35);
      goto LABEL_17;
    }
    if (a4 == 4032)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_4032"), v21, v22, v23);
      goto LABEL_17;
    }
  }
  else
  {
    if (a4 == 1600)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v10, v24, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_1600"), v25, v26, v27);
      goto LABEL_17;
    }
    if (a4 == 2048)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v5, 1, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v10, v12, (uint64_t)v11, (uint64_t)CFSTR("Target Max Dimension_2048"), v13, v14, v15);
LABEL_17:

    }
  }
  return v10;
}

+ (double)getEntropyForImage:(CGImage *)a3
{
  CGColorSpace *ColorSpace;
  double v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  vImage_Error v11;
  double *v12;
  double *v13;
  double *v14;
  const double *v15;
  double *v16;
  uint64_t i;
  uint64_t j;
  long double v19;
  double __B;
  double __C;
  vImage_CGImageFormat format;
  vImage_Buffer buf;
  uint8_t v25[8];
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  memset(&buf, 0, sizeof(buf));
  LOBYTE(format.bitsPerComponent) = CGImageGetBitsPerComponent(a3);
  format.bitsPerComponent = LOBYTE(format.bitsPerComponent);
  LOBYTE(format.bitsPerPixel) = CGImageGetBitsPerPixel(a3);
  format.bitsPerPixel = LOBYTE(format.bitsPerPixel);
  ColorSpace = CGImageGetColorSpace(a3);
  format.colorSpace = CGColorSpaceRetain(ColorSpace);
  format.bitmapInfo = CGImageGetBitmapInfo(a3);
  memset(&format.version, 0, 20);
  if (vImageBuffer_InitWithCGImage(&buf, &format, 0, a3, 0))
  {
    free(buf.data);
    v5 = -1.0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21DFB1000, v6, OS_LOG_TYPE_INFO, "Error: Failed to create vImageBuffer using CGImageRef", v25, 2u);
      }

    }
  }
  else
  {
    v7 = malloc_type_malloc(0x800uLL, 0xCF2D719FuLL);
    v8 = malloc_type_malloc(0x800uLL, 0x619059E8uLL);
    v9 = malloc_type_malloc(0x800uLL, 0x40D07244uLL);
    v10 = malloc_type_malloc(0x800uLL, 0x207D27EAuLL);
    *(_QWORD *)v25 = v7;
    v26 = v8;
    v27 = v9;
    v28 = v10;
    v11 = vImageHistogramCalculation_ARGB8888(&buf, (vImagePixelCount **)v25, 0);
    if (v11)
    {
      NSLog(CFSTR("Error calculating histogram: %ld"), v11);
      free(buf.data);
      free(v7);
      free(v8);
      free(v9);
      free(v10);
      return -1.0;
    }
    else
    {
      v12 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      vDSP_vaddD((const double *)v7, 1, (const double *)v8, 1, v12, 1, 0x100uLL);
      vDSP_vaddD(v12, 1, (const double *)v9, 1, v12, 1, 0x100uLL);
      __C = 0.0;
      __B = (double)(3 * buf.height * buf.width);
      v13 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      v14 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      v15 = (const double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      v16 = (double *)v15;
      for (i = 0; i != 256; i += 2)
        *(float64x2_t *)&v15[i] = vcvtq_f64_u64(*(uint64x2_t *)&v12[i]);
      vDSP_vsdivD(v15, 1, &__B, v13, 1, 0x100uLL);
      for (j = 0; j != 256; ++j)
      {
        v19 = v13[j];
        if (v19 != 0.0)
          v14[j] = log2(v19);
      }
      vDSP_vnegD(v13, 1, v13, 1, 0x100uLL);
      vDSP_vmulD(v13, 1, v14, 1, v14, 1, 0x100uLL);
      vDSP_sveD(v14, 1, &__C, 0x100uLL);
      free(v14);
      free(v13);
      free(v7);
      free(v8);
      free(v9);
      free(v10);
      free(v12);
      free(v16);
      free(buf.data);
      return __C;
    }
  }
  return v5;
}

+ (double)_entropyForTranscodedImage:(CGImageSource *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  CGImage *ThumbnailAtIndex;
  __CFData *v24;
  const __CFData *v25;
  CGImageDestination *v26;
  CFDictionaryRef v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGImageSource *v67;
  CGImage *ImageAtIndex;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  CGImageSource *v76;
  void *v78;

  v5 = (void *)MEMORY[0x2207A8200](a1, a2);
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = *MEMORY[0x24BDBD270];
  v8 = *MEMORY[0x24BDD97C8];
  v9 = *MEMORY[0x24BDD9788];
  v10 = *MEMORY[0x24BDD9778];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v11, 1024, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v6, v17, v7, v18, v19, v20, v21, v8, v7, v9, v7, v10, v16, *MEMORY[0x24BDD9808], 0);
  v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, 0, v22);
  v24 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (v24)
  {
    v25 = v24;
    v26 = CGImageDestinationCreateWithData(v24, CFSTR("public.heic"), 1uLL, 0);
    v27 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v29, 1, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v28, v35, (uint64_t)v34, *MEMORY[0x24BDD9238], v36, v37, v38);

    v78 = v5;
    v39 = *MEMORY[0x24BDD9698];
    objc_msgSend_objectForKey_(v27, v40, *MEMORY[0x24BDD9698], v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v28, v46, (uint64_t)v45, v39, v47, v48, v49);
    objc_msgSend_addEntriesFromDictionary_(v28, v50, (uint64_t)v27, v51, v52, v53, v54);
    LODWORD(v55) = 0.75;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v56, v57, v58, v59, v60, v61, v55);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v28, v63, (uint64_t)v62, *MEMORY[0x24BDD9220], v64, v65, v66);

    CGImageDestinationAddImage(v26, ThumbnailAtIndex, (CFDictionaryRef)v28);
    CGImageDestinationFinalize(v26);
    v67 = CGImageSourceCreateWithData(v25, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v67, 0, 0);
    objc_msgSend_getEntropyForImage_(a1, v69, (uint64_t)ImageAtIndex, v70, v71, v72, v73);
    v75 = v74;
    CGImageRelease(ThumbnailAtIndex);
    CGImageRelease(ImageAtIndex);
    CFRelease(v26);
    v76 = v67;
    v5 = v78;
    CFRelease(v76);

  }
  else
  {
    CGImageRelease(ThumbnailAtIndex);
    v75 = -1.0;
  }

  objc_autoreleasePoolPop(v5);
  return v75;
}

+ (id)getInputImageFeatures:(CGImageSource *)a3
{
  CGImageRef ImageAtIndex;
  CGImage *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  NSObject *v73;
  id v74;
  long double v75;
  double v76;
  NSObject *v77;
  NSObject *v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  long double v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  long double v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v222;
  double v223;
  uint64_t v224;

  v224 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_21DFB1000, v73, OS_LOG_TYPE_INFO, "Error: Image source is NULL.", (uint8_t *)&v222, 2u);
      }
      goto LABEL_15;
    }
LABEL_16:
    v74 = 0;
    return v74;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (!ImageAtIndex)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_21DFB1000, v73, OS_LOG_TYPE_INFO, "Error: CGImage reference could not be created for the image source.", (uint8_t *)&v222, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v6 = ImageAtIndex;
  v7 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  v8 = CGImageSourceCopyProperties(a3, 0);
  v9 = CGImageSourceCopyProperties(a3, 0);
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("FileSize"), v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v23, (uint64_t)CFSTR("PixelWidth"), v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v28, v29, v30, v31, v32, v33, v34);
  v36 = v35;

  objc_msgSend_objectForKeyedSubscript_(v7, v37, (uint64_t)CFSTR("PixelHeight"), v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v42, v43, v44, v45, v46, v47, v48);
  v50 = v49;

  objc_msgSend_objectForKeyedSubscript_(v8, v51, (uint64_t)CFSTR("FileSize"), v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v56, v57, v58, v59, v60, v61, v62);
  v64 = v63;

  v70 = CACurrentMediaTime();
  if (v36 >= v50)
    v71 = v36;
  else
    v71 = v50;
  if (v71 >= 1024.0)
    objc_msgSend__entropyForTranscodedImage_(a1, v65, (uint64_t)a3, v66, v67, v68, v69);
  else
    objc_msgSend_getEntropyForImage_(a1, v65, (uint64_t)v6, v66, v67, v68, v69);
  v75 = v72;
  CGImageRelease(v6);
  v76 = CACurrentMediaTime();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      v222 = 134217984;
      v223 = v76 - v70;
      _os_log_impl(&dword_21DFB1000, v77, OS_LOG_TYPE_INFO, "Time taken for computing input Entropy: %lf", (uint8_t *)&v222, 0xCu);
    }

  }
  if (v75 >= 0.0)
  {
    v79 = exp(v75);
    v80 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_doubleValue(v15, v81, v82, v83, v84, v85, v86);
    objc_msgSend_numberWithDouble_(v80, v87, v88, v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v94, (uint64_t)v93, (uint64_t)CFSTR("Input File Size"), v95, v96, v97);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v98, v99, v100, v101, v102, v103, v50);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v105, (uint64_t)v104, (uint64_t)CFSTR("Input Height"), v106, v107, v108);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v109, v110, v111, v112, v113, v114, (double)v75);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v116, (uint64_t)v115, (uint64_t)CFSTR("Input Entropy"), v117, v118, v119);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v120, v121, v122, v123, v124, v125, v79);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v127, (uint64_t)v126, (uint64_t)CFSTR("Exponential Entropy"), v128, v129, v130);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v131, v132, v133, v134, v135, v136, v36 / v50);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v138, (uint64_t)v137, (uint64_t)CFSTR("Aspect Ratio"), v139, v140, v141);

    objc_msgSend_setObject_forKey_(v22, v142, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Width"), v143, v144, v145);
    objc_msgSend_setObject_forKey_(v22, v146, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Height"), v147, v148, v149);
    objc_msgSend_setObject_forKey_(v22, v150, (uint64_t)&unk_24E202E30, (uint64_t)CFSTR("Target File Size"), v151, v152, v153);
    objc_msgSend_setObject_forKey_(v22, v154, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_4032"), v155, v156, v157);
    objc_msgSend_setObject_forKey_(v22, v158, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_3000"), v159, v160, v161);
    objc_msgSend_setObject_forKey_(v22, v162, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_2048"), v163, v164, v165);
    objc_msgSend_setObject_forKey_(v22, v166, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_1600"), v167, v168, v169);
    objc_msgSend_setObject_forKey_(v22, v170, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_1280"), v171, v172, v173);
    objc_msgSend_setObject_forKey_(v22, v174, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_1024"), v175, v176, v177);
    objc_msgSend_setObject_forKey_(v22, v178, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Target Max Dimension_800"), v179, v180, v181);
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v182, v183, v184, v185, v186, v187, v64 / 358400.0);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v189, (uint64_t)v188, (uint64_t)CFSTR("Compression Ratio"), v190, v191, v192);

    v193 = v36 * v50;
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v194, (int)v193, v195, v196, v197, v198);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v200, (uint64_t)v199, (uint64_t)CFSTR("Input H x W (NumOfPixels)"), v201, v202, v203);

    v204 = (void *)MEMORY[0x24BDD16E0];
    v205 = log(v193);
    objc_msgSend_numberWithDouble_(v204, v206, v207, v208, v209, v210, v211, (double)v205);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v213, (uint64_t)v212, (uint64_t)CFSTR("Input log(NumOfPixels)"), v214, v215, v216);

    objc_msgSend_setObject_forKey_(v22, v217, (uint64_t)&unk_24E202988, (uint64_t)CFSTR("Ratio of NumOfPixels"), v218, v219, v220);
    v74 = v22;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_21DFB1000, v78, OS_LOG_TYPE_INFO, "Error: Failed to compute entropy of the input image", (uint8_t *)&v222, 2u);
      }

    }
    v74 = 0;
  }

  return v74;
}

+ (double)predictQualityFactor:(id)a3 suggestedMaxLength:(int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  double v159;
  double v160;
  int v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  NSObject *v169;
  NSObject *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  double v178;
  int v180;
  double v181;
  __int16 v182;
  double v183;
  __int16 v184;
  uint64_t v185;
  uint64_t v186;

  v4 = *(_QWORD *)&a4;
  v186 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageQualityEstimatorModel(IMTranscoderImageQualityEstimator, v14, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v6)
    {
      objc_msgSend_objectForKeyedSubscript_(v6, v21, (uint64_t)CFSTR("Aspect Ratio"), v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v26, v27, v28, v29, v30, v31, v32);
      v34 = v33;

      v46 = (void *)objc_msgSend_mutableCopy(v6, v35, v36, v37, v38, v39, v40);
      v47 = (double)(int)v4;
      if (v34 >= 1.0)
        v48 = v4;
      else
        v48 = (int)(v34 * (double)(int)v4);
      if (v34 >= 1.0)
        v49 = (int)((double)(int)v4 / v34);
      else
        v49 = v4;
      if (v34 >= 1.0)
        v50 = (int)((double)(int)v4 / v34);
      else
        v50 = (int)(v34 * (double)(int)v4);
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v41, v48, v42, v43, v44, v45);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v46, v52, (uint64_t)v51, (uint64_t)CFSTR("Target Width"), v53, v54, v55);

      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v56, v49, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v46, v62, (uint64_t)v61, (uint64_t)CFSTR("Target Height"), v63, v64, v65);

      objc_msgSend_valueForKey_(v46, v66, (uint64_t)CFSTR("Input H x W (NumOfPixels)"), v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v71, v72, v73, v74, v75, v76, v77);
      v79 = v78 / (double)(v50 * (int)v4);

      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v80, v81, v82, v83, v84, v85, v79);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v46, v87, (uint64_t)v86, (uint64_t)CFSTR("Ratio of NumOfPixels"), v88, v89, v90);

      objc_msgSend_oneHotEncodeTargetMaxDimFeature_suggestedMaxLength_(a1, v91, (uint64_t)v46, v4, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v96, v97, v98, v99, v100, v101, v34);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v95, v103, (uint64_t)v102, (uint64_t)CFSTR("Aspect Ratio"), v104, v105, v106);

      objc_msgSend_standardizeModelInputFeatures_(a1, v107, (uint64_t)v95, v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = objc_alloc(MEMORY[0x24BDBFF80]);
      v118 = (void *)objc_msgSend_initWithDictionary_error_(v113, v114, (uint64_t)v112, 0, v115, v116, v117);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v125 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_dictionary(v118, v126, v127, v128, v129, v130, v131);
          v132 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v180 = 138412290;
          v181 = v132;
          _os_log_impl(&dword_21DFB1000, v125, OS_LOG_TYPE_INFO, "Features set for image quality estimator model prediction: %@", (uint8_t *)&v180, 0xCu);

        }
      }
      objc_msgSend_imageQualityEstimatorModel(IMTranscoderImageQualityEstimator, v119, v120, v121, v122, v123, v124);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predictionFromFeatures_error_(v133, v134, (uint64_t)v118, 0, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v138)
      {
        v160 = -1.0;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v170 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
          {
            LOWORD(v180) = 0;
            _os_log_impl(&dword_21DFB1000, v170, OS_LOG_TYPE_INFO, "Failed to initialize features set using image quality estimator model instance", (uint8_t *)&v180, 2u);
          }
          goto LABEL_41;
        }
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend_dictionary(v138, v139, v140, v141, v142, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForKey_(v145, v146, (uint64_t)CFSTR("Target Quality Factor"), v147, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v151, v152, v153, v154, v155, v156, v157);
      v159 = v158;

      v160 = ceil(v159) / 100.0;
      v161 = IMOSLoggingEnabled();
      if (v160 >= 0.45)
      {
        if (!v161)
          goto LABEL_38;
        OSLogHandleForIMFoundationCategory();
        v168 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
        {
          v180 = 134217984;
          v181 = v160;
          _os_log_impl(&dword_21DFB1000, v168, OS_LOG_TYPE_INFO, "Quality factor is within the pivot limit %lf , Transcoding", (uint8_t *)&v180, 0xCu);
        }
      }
      else
      {
        if (!v161)
          goto LABEL_38;
        OSLogHandleForIMFoundationCategory();
        v168 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
        {
          v180 = 134218496;
          v181 = v47;
          v182 = 2048;
          v183 = v160;
          v184 = 2048;
          v185 = 0x3FDCCCCCCCCCCCCDLL;
          _os_log_impl(&dword_21DFB1000, v168, OS_LOG_TYPE_INFO, "For dimension %f, Quality Factor: %lf is less than Pivot value of %lf", (uint8_t *)&v180, 0x20u);
        }
      }

LABEL_38:
      objc_msgSend_date(MEMORY[0x24BDBCE60], v162, v163, v164, v165, v166, v167);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v171, v172, (uint64_t)v13, v173, v174, v175, v176);
      v178 = v177;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v170 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
        {
          v180 = 134217984;
          v181 = v178;
          _os_log_impl(&dword_21DFB1000, v170, OS_LOG_TYPE_INFO, "time for predicting quality factor: %lf", (uint8_t *)&v180, 0xCu);
        }
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_42;
    }
    v160 = -1.0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v169 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
      {
        LOWORD(v180) = 0;
        _os_log_impl(&dword_21DFB1000, v169, OS_LOG_TYPE_INFO, "Error: Input feature dictionary is nil.", (uint8_t *)&v180, 2u);
      }
LABEL_25:

    }
  }
  else
  {
    v160 = -1.0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v169 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
      {
        v180 = 67109120;
        LODWORD(v181) = v4;
        _os_log_impl(&dword_21DFB1000, v169, OS_LOG_TYPE_INFO, "Error: Model is not initialized for dimension %d", (uint8_t *)&v180, 8u);
      }
      goto LABEL_25;
    }
  }
LABEL_43:

  return v160;
}

@end

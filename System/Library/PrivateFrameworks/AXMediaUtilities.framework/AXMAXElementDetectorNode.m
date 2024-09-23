@implementation AXMAXElementDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("AXElement Detector");
}

- (id)mlModelClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)mobileAssetType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CF2D98], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelResourceNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (unint64_t)minSupportedFormatVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CF2D98], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minSupportedFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)maxSupportedFormatVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CF2D98], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxSupportedFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)contentVersionKey
{
  return CFSTR("_ContentVersion_v2");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMAXElementDetectorNode;
  v8 = -[AXMMobileAssetEvaluationNode evaluate:metrics:](&v13, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  AXMediaLogDiagnostics();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode", (const char *)&unk_1B0F134D6, v12, 2u);
  }

  -[AXMAXElementDetectorNode _evaluateANOD:metrics:](self, "_evaluateANOD:metrics:", v6, v7);
  AXMediaLogDiagnostics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode", (const char *)&unk_1B0F134D6, v12, 2u);
  }

  objc_autoreleasePoolPop(v9);
}

- (id)_imageByWipingTextFromRects:(id)a3 image:(id)a4 colorSpace:(CGColorSpace *)a5 ciContext:(id)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  void *context;
  uint64_t v62;
  id v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  int v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v59 = a4;
  v58 = a6;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v10)
  {
    v57 = *(_QWORD *)v71;
    v56 = *MEMORY[0x1E0C9E070];
    v55 = *MEMORY[0x1E0C9E1C0];
    do
    {
      v11 = 0;
      v67 = v9;
      v60 = v10;
      do
      {
        if (*(_QWORD *)v71 != v57)
          objc_enumerationMutation(obj);
        v62 = v11;
        v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v11);
        context = (void *)MEMORY[0x1B5E128FC]();
        objc_msgSend(v12, "rectValue");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v59, "imageByCroppingToRect:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "extent");
        v23 = v22;
        objc_msgSend(v21, "extent");
        v25 = v24;
        objc_msgSend(v21, "extent");
        v26 = vcvtd_n_u64_f64(v23, 2uLL);
        v28 = (unint64_t)v27;
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (unint64_t)v27 * v26);
        v65 = v21;
        v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = v21;
        v30 = objc_msgSend(v66, "mutableBytes");
        objc_msgSend(v29, "extent");
        objc_msgSend(v58, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v29, v30, v26, v56, a5);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_retainAutorelease(v66);
        v32 = objc_msgSend(v64, "bytes");
        if ((unint64_t)v25)
        {
          v33 = 0;
          v69 = 0;
          v34 = 0;
          v35 = 0;
          v36 = v32 + 3;
          do
          {
            v68 = v33;
            if (v28)
            {
              for (i = 0; i < v28; i += 8)
              {
                v38 = bswap32(*(_DWORD *)(v36 + v35 - 3));
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v39);
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = (void *)v40;
                v42 = &unk_1E62882A0;
                if (v40)
                  v42 = (void *)v40;
                v43 = v42;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "unsignedIntegerValue") + 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v44, v45);

                if (objc_msgSend(v44, "unsignedIntegerValue") > v34)
                {
                  v34 = objc_msgSend(v44, "unsignedIntegerValue");
                  v69 = v38;
                }

                v35 += 4;
              }
            }
            v33 = v68 + 8;
          }
          while (v68 + 8 < (unint64_t)v25);
        }
        else
        {
          v69 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:colorSpace:", a5, (double)HIBYTE(v69) / 255.0, (double)BYTE2(v69) / 255.0, (double)BYTE1(v69) / 255.0, (double)v69 / 255.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setValue:forKey:", v46, v55);
        objc_msgSend(v47, "outputImage");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setValue:forKey:", v48, CFSTR("inputImage"));
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v14, v16, v18, v20);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setValue:forKey:", v50, CFSTR("inputRectangle"));

        objc_msgSend(v49, "outputImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "imageByCompositingOverImage:", v67);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(context);
        v11 = v62 + 1;
        v67 = v9;
      }
      while (v62 + 1 != v60);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v10);
  }

  objc_msgSend(v9, "imageByCompositingOverImage:", v59);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)_screenEquivalenceToken:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGImage *v25;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *DeviceRGB;
  unsigned __int8 *v29;
  CGContext *v30;
  uint64_t v31;
  unint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unint64_t v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  CGAffineTransform v41;
  _OWORD v42[8];
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];
  CGRect v49;

  v48[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "extent");
  v5 = v4;
  objc_msgSend(v3, "extent");
  if (v5 <= v6)
  {
    objc_msgSend(v3, "extent");
    v8 = v9;
  }
  else
  {
    objc_msgSend(v3, "extent");
    v8 = v7;
  }
  v10 = (void *)MEMORY[0x1E0C9DDB8];
  v12 = *MEMORY[0x1E0C9E260];
  v47[0] = *MEMORY[0x1E0C9E1F8];
  v11 = v47[0];
  v47[1] = v12;
  v48[0] = v3;
  v48[1] = &unk_1E6288B28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filterWithName:withInputParameters:", CFSTR("CIColorControls"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 32.0 / v8, 32.0 / v8);
  v39 = v14;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v41, "{CGAffineTransform=dddddd}");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C9DDB8];
  v17 = *MEMORY[0x1E0C9E280];
  v45[1] = v11;
  v46[0] = v15;
  v45[0] = v17;
  v40 = (void *)v15;
  objc_msgSend(v14, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterWithName:withInputParameters:", CFSTR("CIAffineTransform"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v20;
  objc_msgSend(v20, "outputImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C9DD90];
  v43 = *MEMORY[0x1E0C9DF58];
  v44 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextWithOptions:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "extent");
  v25 = (CGImage *)objc_msgSend(v24, "createCGImage:fromRect:", v21);
  Width = CGImageGetWidth(v25);
  Height = CGImageGetHeight(v25);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v29 = (unsigned __int8 *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  v30 = CGBitmapContextCreate(v29, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v49.size.width = (double)Width;
  v49.size.height = (double)Height;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  CGContextDrawImage(v30, v49, v25);
  CGContextRelease(v30);
  CFRelease(v25);
  memset(v42, 0, sizeof(v42));
  if (Height)
  {
    v31 = 0;
    v32 = 0;
    v33 = v29 + 4;
    do
    {
      v34 = v33;
      v35 = Width - 1;
      if (Width != 1)
      {
        do
        {
          if (*(v34 - 4) < *v34)
            *(_QWORD *)((char *)v42 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
          v34 += 4;
          ++v32;
          --v35;
        }
        while (v35);
      }
      ++v31;
      v33 += 4 * Width;
    }
    while (v31 != Height);
  }
  free(v29);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v42, 128);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)_nonMaxSupression:(id)a3 iouThreshold:(double)a4
{
  void *v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v38 = (id)objc_opt_new();
  objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v41 = v38;
        v6 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v6)
        {
          v43 = *(_QWORD *)v45;
          while (2)
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v45 != v43)
                objc_enumerationMutation(v41);
              v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v8, "labels");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "firstObject");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "labels");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "firstObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v11, "isEqual:", v14) & 1) != 0)
                goto LABEL_29;
              +[AXMVisionFeature nameForUIClass:](AXMVisionFeature, "nameForUIClass:", 7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v11, "isEqualToString:", v15) & 1) != 0)
              {
                v16 = 1;
              }
              else
              {
                +[AXMVisionFeature nameForUIClass:](AXMVisionFeature, "nameForUIClass:", 7);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v14, "isEqualToString:", v17);

              }
              +[AXMVisionFeature nameForUIClass:](AXMVisionFeature, "nameForUIClass:", 5);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v11, "isEqualToString:", v18) & 1) != 0)
              {
                v19 = 1;
              }
              else
              {
                +[AXMVisionFeature nameForUIClass:](AXMVisionFeature, "nameForUIClass:", 5);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v14, "isEqualToString:", v20);

              }
              if ((v19 & v16 & 1) != 0)
              {
LABEL_29:
                objc_msgSend(v5, "boundingBox");
                v22 = v21;
                v24 = v23;
                v26 = v25;
                v28 = v27;
                objc_msgSend(v8, "boundingBox");
                -[AXMAXElementDetectorNode IoUForbb1:bb2:](self, "IoUForbb1:bb2:", v22, v24, v26, v28, v29, v30, v31, v32);
                if (v33 > a4)
                {

                  goto LABEL_24;
                }
              }

            }
            v6 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v6)
              continue;
            break;
          }
        }

        objc_msgSend(v41, "addObject:", v5);
LABEL_24:
        ;
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v39);
  }

  return v38;
}

uint64_t __59__AXMAXElementDetectorNode__nonMaxSupression_iouThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_initializeClickabilityModel
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_ERROR, "Clickability model does not exist: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_initializeMindNetDetector
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "MindNet detect had no base URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (double)IoUForbb1:(CGRect)a3 bb2:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v15 = CGRectIntersection(a3, a4);
  v13 = v15.size.height;
  v14 = v15.size.width;
  v15.origin.x = v11;
  v15.origin.y = v10;
  v15.size.width = v9;
  v15.size.height = v8;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v16 = CGRectUnion(v15, v17);
  return v14 * v13 / (v16.size.width * v16.size.height);
}

- (id)_performCrossClassNMSForDetections:(id)a3 iouThreshold:(double)a4
{
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v32 = (id)objc_opt_new();
  objc_msgSend(v29, "sortedArrayUsingComparator:", &__block_literal_global_112);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v31 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v9 = v32;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16, v29);
        if (v10)
        {
          v11 = *(_QWORD *)v34;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              v14 = objc_msgSend(v13, "label");
              if (v14 == objc_msgSend(v8, "label"))
              {
                objc_msgSend(v8, "box");
                v16 = v15;
                v18 = v17;
                v20 = v19;
                v22 = v21;
                objc_msgSend(v13, "box");
                -[AXMAXElementDetectorNode IoUForbb1:bb2:](self, "IoUForbb1:bb2:", v16, v18, v20, v22, v23, v24, v25, v26);
                if (v27 > a4)
                {

                  goto LABEL_17;
                }
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v10)
              continue;
            break;
          }
        }

        objc_msgSend(v9, "addObject:", v8);
LABEL_17:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v6);
  }

  return v32;
}

uint64_t __76__AXMAXElementDetectorNode__performCrossClassNMSForDetections_iouThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_initializeIconDetector
{
  AXMIconClassDetectorNode *v3;
  AXMIconClassDetectorNode *iconDetector;

  v3 = -[AXMMobileAssetEvaluationNode initWithIdentifier:]([AXMIconClassDetectorNode alloc], "initWithIdentifier:", CFSTR("ScreenRecognitionIconDetector"));
  iconDetector = self->_iconDetector;
  self->_iconDetector = v3;

  -[AXMIconClassDetectorNode setWriteDebugImage:](self->_iconDetector, "setWriteDebugImage:", 0);
}

- (void)_evaluateANOD:(id)a3 metrics:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  double v16;
  float v17;
  float v18;
  double Current;
  double v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  id v33;
  double v34;
  NSObject *v35;
  double v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  double width;
  double height;
  double v75;
  double v76;
  double v77;
  void *v78;
  BOOL v79;
  void *v80;
  void *v81;
  uint64_t v82;
  int v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  float v91;
  float v92;
  int v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  id v112;
  CGFloat v113;
  CGFloat v114;
  id v115;
  void *v116;
  float v117;
  float v118;
  double v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t k;
  void *v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  NSObject *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t m;
  void *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  void *v160;
  void *v161;
  void *v162;
  float v163;
  float v164;
  double v165;
  double v166;
  void *v167;
  NSObject *v168;
  void *v169;
  CFAbsoluteTime v170;
  CFAbsoluteTime v171;
  NSObject *v172;
  void *exception;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  float v179;
  float v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  NSObject *obj;
  NSObject *v190;
  void *v191;
  double MinY;
  void *v193;
  double v194;
  uint64_t v195;
  uint64_t v196;
  double v197;
  double v198;
  double v199;
  uint64_t i;
  void *v201;
  id v202;
  double v203;
  void *v204;
  AXMAXElementDetectorNode *v205;
  __CFString *v206;
  double v207;
  id v208;
  __CFString *v209;
  double MinX;
  void *v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _QWORD v220[4];
  id v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  id v230;
  _BYTE v231[128];
  uint8_t v232[128];
  _BYTE buf[24];
  void *v234;
  _QWORD v235[3];
  _QWORD v236[2];
  _QWORD v237[2];
  _BYTE v238[128];
  _BYTE v239[128];
  id v240;
  uint8_t v241[8];
  uint8_t *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  NSSize v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  NSRect v257;
  NSRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;

  v245 = *MEMORY[0x1E0C80C00];
  v202 = a3;
  v184 = a4;
  if (!self->_mindNetDetector)
    -[AXMAXElementDetectorNode _initializeMindNetDetector](self, "_initializeMindNetDetector");
  if (!self->_clickabilityDetector)
    -[AXMAXElementDetectorNode _initializeClickabilityModel](self, "_initializeClickabilityModel");
  if (!self->_iconDetector)
    -[AXMAXElementDetectorNode _initializeIconDetector](self, "_initializeIconDetector");
  v205 = self;
  if (self->_mindNetDetector)
  {
    objc_msgSend(v202, "sourceInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ciImage");
    v190 = objc_claimAutoreleasedReturnValue();

    AXMediaLogDiagnostics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-ScreenEquivalence", (const char *)&unk_1B0F134D6, buf, 2u);
    }

    -[AXMAXElementDetectorNode _screenEquivalenceToken:](self, "_screenEquivalenceToken:", v190);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEquivalenceToken:", v183);

    AXMediaLogDiagnostics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-ScreenEquivalence", (const char *)&unk_1B0F134D6, buf, 2u);
    }

    objc_msgSend(v202, "analysisOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "equivalenceToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v183, "isEqualToData:", v11);

    if (v12)
    {
      AXMediaLogElementVision();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.2();
    }
    else
    {
      AXMediaLogMLElement();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "Beginning element detection:", buf, 2u);
      }

      -[NSObject extent](v190, "extent");
      v17 = v16;
      v180 = v17;
      if (v17 == 0.0 || (v18 = v15, v179 = v18, v18 == 0.0))
      {
        AXMediaLogMLElement();
        v172 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
          -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.3();

        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1B5E124B8](exception, "esp error");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
      }
      Current = CFAbsoluteTimeGetCurrent();
      if (v205->_mindNetDetector)
      {
        v20 = Current;
        AXMediaLogDiagnostics();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-MindNet", (const char *)&unk_1B0F134D6, buf, 2u);
        }

        -[AXMindNetDetector detect:](v205->_mindNetDetector, "detect:", v190);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AXMediaLogDiagnostics();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B0E3B000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-MindNet", (const char *)&unk_1B0F134D6, buf, 2u);
        }

        AXMediaLogMLElement();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v170 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v170 - v20;
          _os_log_debug_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_DEBUG, "Time to mindnet: %f", buf, 0xCu);
        }

        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("boxes"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v26 = v179;
        *(float *)&v27 = v180;
        -[AXMindNetDetector processBoxes:withHeight:andWidth:](v205->_mindNetDetector, "processBoxes:withHeight:andWidth:", v25, v26, v27);
        v176 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[AXMAXElementDetectorNode _performCrossClassNMSForDetections:iouThreshold:](v205, "_performCrossClassNMSForDetections:iouThreshold:", 0, 0.2);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v202, "visionImageRequestHandler");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "analysisOptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textDetectionOptions");
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      +[AXMTextDetectorNode effectiveLanguagesFromOptions:](AXMTextDetectorNode, "effectiveLanguagesFromOptions:", v182);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      AXMediaLogElementVision();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.8();

      v30 = (void *)objc_msgSend(v181, "count");
      if (v30)
      {
        *(_QWORD *)v241 = 0;
        v242 = v241;
        v243 = 0x2050000000;
        v31 = (void *)getVNRecognizeTextRequestClass(void)::softClass;
        v244 = getVNRecognizeTextRequestClass(void)::softClass;
        if (!getVNRecognizeTextRequestClass(void)::softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ___ZL30getVNRecognizeTextRequestClassv_block_invoke;
          v234 = &unk_1E625D168;
          v235[0] = v241;
          ___ZL30getVNRecognizeTextRequestClassv_block_invoke((uint64_t)buf);
          v31 = (void *)*((_QWORD *)v242 + 3);
        }
        v32 = objc_retainAutorelease(v31);
        _Block_object_dispose(v241, 8);
        v33 = objc_alloc_init(v32);
        objc_msgSend(v33, "setRecognitionLevel:", +[AXMTextDetectorNode recognitionLevelFromOptions:](AXMTextDetectorNode, "recognitionLevelFromOptions:", v182));
        objc_msgSend(v33, "setRecognitionLanguages:", v181);
        objc_msgSend(v33, "setUsesLanguageCorrection:", objc_msgSend(v182, "usesLanguageCorrection"));
        objc_msgSend(v182, "normalizedMinimumTextHeightRatio");
        *(float *)&v34 = v34;
        objc_msgSend(v33, "setMinimumTextHeight:", v34);
        AXMediaLogElementVision();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.7(objc_msgSend(v33, "recognitionLevel"), (uint64_t)v181, v241, v35);

        v36 = CFAbsoluteTimeGetCurrent();
        v240 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v240, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = 0;
        objc_msgSend(v177, "performRequests:error:", v37, &v230);
        v38 = v230;

        AXMediaLogMLElement();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v171 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v171 - v36;
          _os_log_debug_impl(&dword_1B0E3B000, v39, OS_LOG_TYPE_DEBUG, "Time to OCR: %f", buf, 0xCu);
        }

        if (v38)
        {
          AXMediaLogMLElement();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v38;
            _os_log_impl(&dword_1B0E3B000, v40, OS_LOG_TYPE_DEFAULT, "OCR error: %@", buf, 0xCu);
          }

        }
        v30 = v33;
      }
      v201 = v30;
      objc_msgSend(v30, "results");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "indexesOfObjectsPassingTest:", &__block_literal_global_122);
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v201, "results");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectsAtIndexes:", v178);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = (void *)objc_msgSend(v43, "mutableCopy");

      AXMediaLogElementVision();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.6();

      -[AXMindNetDetector detect:](v205->_clickabilityDetector, "detect:", v190);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("boxes"));
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v45 = v179;
      *(float *)&v46 = v180;
      -[AXMindNetDetector processBoxes:withHeight:andWidth:](v205->_clickabilityDetector, "processBoxes:withHeight:andWidth:", v45, v46);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      AXMediaLogElementVision();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.5();

      v228 = 0u;
      v229 = 0u;
      v226 = 0u;
      v227 = 0u;
      obj = v176;
      v196 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v226, v239, 16);
      if (v196)
      {
        v195 = *(_QWORD *)v227;
        v194 = v180;
        v197 = v179;
        do
        {
          for (i = 0; i != v196; ++i)
          {
            if (*(_QWORD *)v227 != v195)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * i);
            objc_msgSend(v48, "box");
            v203 = v50 * v194;
            v52 = v51 * v197;
            v198 = v53 * v194;
            v199 = (1.0 - v49 - v51) * v197;
            if (objc_msgSend(v48, "label") == 11)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v206 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v224 = 0u;
              v225 = 0u;
              v222 = 0u;
              v223 = 0u;
              v54 = v188;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v222, v238, 16);
              if (v55)
              {
                v56 = *(_QWORD *)v223;
                v209 = &stru_1E6260C18;
                do
                {
                  for (j = 0; j != v55; ++j)
                  {
                    if (*(_QWORD *)v223 != v56)
                      objc_enumerationMutation(v54);
                    v58 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * j);
                    objc_msgSend(v58, "topCandidates:", 1);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "firstObject");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v58, "boundingBox");
                    v62 = v61;
                    v64 = v63;
                    v66 = v65;
                    v68 = v67;
                    objc_msgSend(v48, "box");
                    v261.origin.x = v69;
                    v261.origin.y = v70;
                    v261.size.width = v71;
                    v261.size.height = v72;
                    v247.origin.x = v62;
                    v247.origin.y = v64;
                    v247.size.width = v66;
                    v247.size.height = v68;
                    v248 = CGRectIntersection(v247, v261);
                    width = v248.size.width;
                    height = v248.size.height;
                    objc_msgSend(v58, "boundingBox", v248.origin.x, v248.origin.y);
                    v76 = v75;
                    objc_msgSend(v58, "boundingBox");
                    if (width * height / (v76 * v77) > 0.7225)
                    {
                      objc_msgSend(v60, "string");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      v79 = objc_msgSend(v78, "length") == 0;

                      if (!v79)
                      {
                        -[__CFString stringByAppendingString:](v209, "stringByAppendingString:", CFSTR(" "));
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "string");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v80, "stringByAppendingString:", v81);
                        v82 = objc_claimAutoreleasedReturnValue();

                        v209 = (__CFString *)v82;
                        -[__CFString addObject:](v206, "addObject:", v58);
                      }
                    }

                  }
                  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v222, v238, 16);
                }
                while (v55);
              }
              else
              {
                v209 = &stru_1E6260C18;
              }

              objc_msgSend(v54, "removeObjectsInArray:", v206);
              if (-[__CFString length](v209, "length"))
              {
                objc_msgSend(v48, "confidence");
                v92 = v91;
                v93 = objc_msgSend(v48, "label");
                objc_msgSend(v202, "size");
                +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", 0, v93, v209, v198, v199, v203, v52, v92, v94, v95);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v96 = 0;
              }
            }
            else
            {
              v83 = objc_msgSend(v48, "label");
              v206 = &stru_1E6260C18;
              if (v83 == 5)
              {
                v249.origin.x = v198;
                v249.origin.y = v199;
                v249.size.width = v203;
                v249.size.height = v52;
                MinX = CGRectGetMinX(v249);
                v250.origin.x = v198;
                v250.origin.y = v199;
                v250.size.width = v203;
                v250.size.height = v52;
                v207 = CGRectGetWidth(v250);
                v251.origin.x = v198;
                v251.origin.y = v199;
                v251.size.width = v203;
                v251.size.height = v52;
                MinY = CGRectGetMinY(v251);
                v252.origin.x = v198;
                v252.origin.y = v199;
                v252.size.width = v203;
                v252.size.height = v52;
                v186 = CGRectGetHeight(v252);
                v253.origin.x = v198;
                v253.origin.y = v199;
                v253.size.width = v203;
                v253.size.height = v52;
                v185 = CGRectGetWidth(v253);
                v254.origin.x = v198;
                v254.origin.y = v199;
                v254.size.width = v203;
                v254.size.height = v52;
                v84 = CGRectGetWidth(v254);
                v255.origin.x = v198;
                v255.origin.y = v199;
                v255.size.width = v203;
                v255.size.height = v52;
                v85 = CGRectGetHeight(v255);
                v256.origin.x = v198;
                v256.origin.y = v199;
                v256.size.width = v203;
                v256.size.height = v52;
                v86 = CGRectGetHeight(v256);
                v87 = MinX + v207 * -0.1;
                v88 = MinY + v186 * -0.1;
                v89 = v185 + (v84 + v84) * 0.1;
                v90 = v85 + (v86 + v86) * 0.1;
                if (v89 <= v90)
                {
                  v87 = v87 + (v90 - v89) * -0.5;
                  v89 = v90;
                }
                else
                {
                  v88 = v88 + (v89 - v90) * -0.5;
                }
                v97 = v197 - (v89 + v88);
                -[NSObject imageByCroppingToRect:](v190, "imageByCroppingToRect:", v87, v97, v89, v89);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAffineTransform"));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3478], "transform");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "translateXBy:yBy:", -v87, -v97);
                objc_msgSend(v99, "setValue:forKey:", v100, CFSTR("inputTransform"));
                objc_msgSend(v99, "setValue:forKey:", v98, CFSTR("inputImage"));
                objc_msgSend(v99, "valueForKey:", CFSTR("outputImage"));
                v193 = (void *)objc_claimAutoreleasedReturnValue();

                +[AXMPipelineContextInput inputWithCIImage:](AXMPipelineContextInput, "inputWithCIImage:", v193);
                v101 = objc_claimAutoreleasedReturnValue();
                v236[0] = CFSTR("input");
                v236[1] = CFSTR("diagnosticsEnabled");
                v187 = (void *)v101;
                v237[0] = v101;
                v237[1] = MEMORY[0x1E0C9AAA0];
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, v236, 2);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v102, v103);
                v211 = (void *)objc_claimAutoreleasedReturnValue();

                v220[0] = MEMORY[0x1E0C809B0];
                v220[1] = 3221225472;
                v220[2] = __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke_135;
                v220[3] = &unk_1E625DD60;
                v104 = v187;
                v221 = v104;
                objc_msgSend(v211, "produceImage:", v220);
                v105 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v97);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "stringWithFormat:", CFSTR("%@-image.png"), v106);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXMIconClassDetectorNode setLoggingName:](v205->_iconDetector, "setLoggingName:", v107);

                -[AXMIconClassDetectorNode evaluate:metrics:](v205->_iconDetector, "evaluate:metrics:", v211, v184);
                objc_msgSend(v211, "result");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "features");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "firstObject");
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v110, "value");
                v206 = (__CFString *)objc_claimAutoreleasedReturnValue();
                AXMediaLogMLElement();
                v111 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                {
                  v257.origin.x = v87;
                  v257.origin.y = v88;
                  v257.size.width = v89;
                  v257.size.height = v89;
                  NSStringFromRect(v257);
                  v112 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v193, "extent");
                  v246.width = v113;
                  v246.height = v114;
                  NSStringFromSize(v246);
                  v115 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "box");
                  NSStringFromRect(v258);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  *(_QWORD *)&buf[4] = v206;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v112;
                  *(_WORD *)&buf[22] = 2112;
                  v234 = v115;
                  LOWORD(v235[0]) = 2112;
                  *(_QWORD *)((char *)v235 + 2) = v116;
                  _os_log_impl(&dword_1B0E3B000, v111, OS_LOG_TYPE_INFO, "Icon detected: %@ for bounds %@ in image: %@ -> %@", buf, 0x2Au);

                }
              }
              objc_msgSend(v48, "confidence");
              v118 = v117;
              objc_msgSend(v202, "size");
              +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", 0, v83, v206, v198, v199, v203, v52, v118, v119, v120);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v209 = &stru_1E6260C18;
            }

            if (v96)
            {
              v218 = 0u;
              v219 = 0u;
              v216 = 0u;
              v217 = 0u;
              v208 = v191;
              v121 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v216, v232, 16);
              if (v121)
              {
                v122 = *(_QWORD *)v217;
                do
                {
                  for (k = 0; k != v121; ++k)
                  {
                    if (*(_QWORD *)v217 != v122)
                      objc_enumerationMutation(v208);
                    v124 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * k);
                    objc_msgSend(v48, "box");
                    v126 = v125;
                    v128 = v127;
                    v130 = v129;
                    v132 = v131;
                    objc_msgSend(v124, "box");
                    v262.origin.x = v133;
                    v262.origin.y = v134;
                    v262.size.width = v135;
                    v262.size.height = v136;
                    v259.origin.x = v126;
                    v259.origin.y = v128;
                    v259.size.width = v130;
                    v259.size.height = v132;
                    v260 = CGRectIntersection(v259, v262);
                    v137 = v260.size.width;
                    v138 = v260.size.height;
                    objc_msgSend(v124, "box", v260.origin.x, v260.origin.y);
                    v140 = v139;
                    objc_msgSend(v124, "box");
                    if (v137 * v138 / (v140 * v141) > 0.5)
                    {
                      v142 = -[AXMAXElementDetectorNode remapUIClassForClickability:andClass:](v205, "remapUIClassForClickability:andClass:", objc_msgSend(v124, "label"), objc_msgSend(v96, "uiClass"));
                      AXMediaLogMLElement();
                      v143 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v96, "uiClass"));
                        v204 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v142);
                        v144 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v124, "label"));
                        v145 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v96, "debugDescription");
                        v146 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138413058;
                        *(_QWORD *)&buf[4] = v204;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v144;
                        *(_WORD *)&buf[22] = 2112;
                        v234 = v145;
                        LOWORD(v235[0]) = 2112;
                        *(_QWORD *)((char *)v235 + 2) = v146;
                        _os_log_debug_impl(&dword_1B0E3B000, v143, OS_LOG_TYPE_DEBUG, "Remap class from %@ -> %@ for clickable (%@) %@", buf, 0x2Au);

                      }
                      objc_msgSend(v96, "setUiClass:", v142);
                    }
                  }
                  v121 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v216, v232, 16);
                }
                while (v121);
              }

              objc_msgSend(v202, "appendFeature:", v96);
            }

          }
          v196 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v226, v239, 16);
        }
        while (v196);
      }

      v214 = 0u;
      v215 = 0u;
      v212 = 0u;
      v213 = 0u;
      v147 = v188;
      v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v212, v231, 16);
      if (v148)
      {
        v149 = *(_QWORD *)v213;
        do
        {
          for (m = 0; m != v148; ++m)
          {
            if (*(_QWORD *)v213 != v149)
              objc_enumerationMutation(v147);
            v151 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * m);
            objc_msgSend(v151, "boundingBox");
            v153 = v152;
            v155 = v154;
            v157 = v156;
            v159 = v158;
            objc_msgSend(v151, "topCandidates:", 1);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "firstObject");
            v161 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v161, "string");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "confidence");
            v164 = v163;
            objc_msgSend(v202, "size");
            +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", v201, 11, v162, v153 * v180, (1.0 - v155 - v159) * v179, v157 * v180, v159 * v179, v164, v165, v166);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "appendFeature:", v167);

          }
          v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v212, v231, 16);
        }
        while (v148);
      }

      AXMediaLogElementVision();
      v168 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v202, "result");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.4(v169, (uint64_t)buf, v168);
      }

    }
    v13 = v190;
  }
  else
  {
    AXMediaLogMLElement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.1();
  }

}

BOOL __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  float v4;
  _BOOL8 v5;

  objc_msgSend(a2, "topCandidates:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "confidence");
  v5 = v4 >= 0.31;

  return v5;
}

id __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke_135(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)remapUIClassForClickability:(int)a3 andClass:(int64_t)a4
{
  int64_t v4;
  int64_t v5;
  int64_t v6;

  v4 = 17;
  if (a4 != 11)
    v4 = a4;
  v5 = 15;
  if (a4 != 7)
    v5 = a4;
  v6 = 16;
  if (a4 != 5)
    v6 = a4;
  if (a3 != 6)
    v6 = a4;
  if (a3 != 9)
    v5 = v6;
  if (a3 == 14)
    return v4;
  else
    return v5;
}

- (AXMindNetDetector)mindNetDetector
{
  return self->_mindNetDetector;
}

- (AXMindNetDetector)clickabilityDetector
{
  return self->_clickabilityDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickabilityDetector, 0);
  objc_storeStrong((id *)&self->_mindNetDetector, 0);
  objc_storeStrong((id *)&self->_iconDetector, 0);
}

- (void)_evaluateANOD:metrics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "No mindnet detector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_evaluateANOD:metrics:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_DEBUG, "Same equivalence token - no work to do", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_evaluateANOD:metrics:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "ERROR: zero image dimension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_evaluateANOD:(NSObject *)a3 metrics:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a3, (uint64_t)a3, "OCR: %@", (uint8_t *)a2);

}

- (void)_evaluateANOD:metrics:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, v0, v1, "Clickable Results: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_evaluateANOD:metrics:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, v0, v1, "OCR Results: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_evaluateANOD:(uint8_t *)buf metrics:(os_log_t)log .cold.7(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "Performing OCR: %d, %@", buf, 0x12u);
}

- (void)_evaluateANOD:metrics:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, v0, v1, "Effective text detect languages: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end

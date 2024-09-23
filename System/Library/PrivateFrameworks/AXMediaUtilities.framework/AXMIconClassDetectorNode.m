@implementation AXMIconClassDetectorNode

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
  return CFSTR("Icon Class Detector");
}

- (id)mlModelClasses
{
  uint64_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[AXMMobileAssetEvaluationNode formatVersion](self, "formatVersion") == 2)
  {
    v13[0] = objc_opt_class();
    v3 = v13;
  }
  else
  {
    AXMediaLogMLElement();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMIconClassDetectorNode mlModelClasses].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

    v12 = objc_opt_class();
    v3 = &v12;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mobileAssetType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CF2DA0], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelResourceNames
{
  return &unk_1E6289500;
}

- (unint64_t)minSupportedFormatVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CF2DA0], "policy");
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

  objc_msgSend(MEMORY[0x1E0CF2DA0], "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxSupportedFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)classLabelForIdx:(unint64_t)a3
{
  NSArray *iconClassLabels;
  NSArray *v5;
  void *v6;
  __CFString *v7;

  iconClassLabels = self->_iconClassLabels;
  if (iconClassLabels)
    v5 = iconClassLabels;
  else
    v5 = (NSArray *)&unk_1E6289518;
  v6 = (void *)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels;
  -[AXMIconClassDetectorNode classLabelForIdx:]::classLabels = (uint64_t)v5;

  if (objc_msgSend((id)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels, "count") <= a3)
  {
    v7 = CFSTR("unknown");
  }
  else
  {
    objc_msgSend((id)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels, "objectAtIndexedSubscript:", a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)_initializeClassLabels
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Icon Class detector had no base URL", v1, 2u);
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  iconclassificationInput *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  iconclassificationInput *v60;
  id v61;
  void *v62;
  id v63;
  CVPixelBufferRef pixelBufferOut;
  objc_super v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)AXMIconClassDetectorNode;
  -[AXMMobileAssetEvaluationNode evaluate:metrics:](&v65, sel_evaluate_metrics_, v6, v7);
  if (!self->_iconClassLabels)
    -[AXMIconClassDetectorNode _initializeClassLabels](self, "_initializeClassLabels");
  -[AXMMobileAssetEvaluationNode mlModels](self, "mlModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[AXMIconClassDetectorNode mlModelClasses](self, "mlModelClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v9 < objc_msgSend(v10, "count");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "generateImageRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extent");
    v13 = v12;
    objc_msgSend(v11, "extent");
    v15 = v14;
    objc_msgSend(v11, "extent");
    v17 = v16;
    objc_msgSend(v11, "extent");
    if (v17 <= v18)
    {
      objc_msgSend(v11, "extent");
      v20 = v21;
    }
    else
    {
      objc_msgSend(v11, "extent");
      v20 = v19;
    }
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v11, CFSTR("inputImage"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 256.0 / v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v23, CFSTR("inputScale"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (v13 / v15));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forKey:", v24, CFSTR("inputAspectRatio"));

    objc_msgSend(v22, "outputImage");
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v25;
    pixelBufferOut = 0;
    v27 = CVPixelBufferCreate(0, 0x100uLL, 0x100uLL, 0x42475241u, 0, &pixelBufferOut);
    if ((_DWORD)v27 || !pixelBufferOut)
    {
      if (pixelBufferOut)
      {
        CFRelease(pixelBufferOut);
        pixelBufferOut = 0;
      }
      AXMediaLogMLElement();
      v48 = objc_claimAutoreleasedReturnValue();
      v62 = v48;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[AXMIconClassDetectorNode evaluate:metrics:].cold.1(v27, v48, v49, v50, v51, v52, v53, v54);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "render:toCVPixelBuffer:", v25, pixelBufferOut);
      v28 = [iconclassificationInput alloc];
      v60 = -[iconclassificationInput initWithImage_Placeholder:](v28, "initWithImage_Placeholder:", pixelBufferOut);
      -[AXMMobileAssetEvaluationNode mlModels](self, "mlModels");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend(v30, "predictionFromFeatures:error:", v60, &v63);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v63;

      if (v61)
      {
        AXMediaLogMLElement();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[AXMIconClassDetectorNode evaluate:metrics:].cold.2((uint64_t)v61, v32, v33, v34, v35, v36, v37, v38);

      }
      v39 = 0;
      v40 = 0;
      v41 = 0.0;
      while (1)
      {
        objc_msgSend(v31, "leaf_leaf_predictions_probabilities");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v40 < objc_msgSend(v42, "count");

        if (!v43)
          break;
        objc_msgSend(v31, "leaf_leaf_predictions_probabilities");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "doubleValue");
        v47 = v46;

        if (v47 > v41)
        {
          v39 = v40;
          v41 = v47;
        }
        ++v40;
      }
      -[AXMIconClassDetectorNode classLabelForIdx:](self, "classLabelForIdx:", v39);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      AXMediaLogMLElement();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v55;
        v68 = 2112;
        v69 = v57;
        _os_log_impl(&dword_1B0E3B000, v56, OS_LOG_TYPE_INFO, "Determined label class for icon: %@ (%@)", buf, 0x16u);

      }
      if (v41 <= 0.9 || (objc_msgSend(v55, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
      {
        v58 = v55;
      }
      else
      {
        -[AXMIconClassDetectorNode _localizedClassForClass:](self, "_localizedClassForClass:", v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        +[AXMVisionFeature featureWithIconClass:confidence:](AXMVisionFeature, "featureWithIconClass:confidence:", v58, v41);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFeature:", v59);

      }
    }

  }
}

- (id)_localizedClassForClass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("icon.type."), "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)writeDebugImage
{
  return self->_writeDebugImage;
}

- (void)setWriteDebugImage:(BOOL)a3
{
  self->_writeDebugImage = a3;
}

- (NSString)loggingName
{
  return self->_loggingName;
}

- (void)setLoggingName:(id)a3
{
  objc_storeStrong((id *)&self->_loggingName, a3);
}

- (NSArray)iconClassLabels
{
  return self->_iconClassLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconClassLabels, 0);
  objc_storeStrong((id *)&self->_loggingName, 0);
}

- (void)mlModelClasses
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not find ml model classes, returning default: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not create cv pixel buffer: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error icon vision prediction: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

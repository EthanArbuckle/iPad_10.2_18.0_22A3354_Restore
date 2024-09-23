@implementation DeskCamSessionOptions

- (DeskCamSessionOptions)initWithDeviceType:(int)a3
{
  char *v4;
  DeskCamSessionOptions *v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DeskCamSessionOptions;
  v4 = -[DeskCamSessionOptions init](&v14, sel_init);
  v5 = (DeskCamSessionOptions *)v4;
  if (v4)
  {
    v6 = 1.0;
    if (a3 == 1)
    {
      v7 = 0x40000000C2B00000;
      v8 = 0x3F8000003F000000;
      v9 = 0;
      v10 = 1059481190;
      v11 = 1062836634;
    }
    else
    {
      if (a3 == 2)
      {
        v7 = 3266314240;
        v8 = 0x3F8666663F266666;
        v9 = 1061997773;
        v10 = 1063675494;
      }
      else
      {
        v7 = 0x40000000C2AA0000;
        v8 = 0x3F99999A3F266666;
        v9 = 1051931443;
        v10 = 1063675494;
        v6 = 1.085;
      }
      v11 = 1059481190;
    }
    *((_DWORD *)v4 + 3) = v11;
    *((_DWORD *)v4 + 4) = 1059481190;
    *(_QWORD *)(v4 + 20) = v8;
    *((float *)v4 + 7) = v6;
    *((_DWORD *)v4 + 12) = v10;
    *((_QWORD *)v4 + 4) = 0xC2DC0000C0000000;
    *((_QWORD *)v4 + 5) = v7;
    *(_QWORD *)(v4 + 52) = 0x3F7333333F847AE1;
    v4[8] = 1;
    *(_QWORD *)(v4 + 60) = 0x415000000000000FLL;
    *(_WORD *)(v4 + 9) = 257;
    *(_QWORD *)(v4 + 68) = 0x40A0000000000005;
    *((_DWORD *)v4 + 19) = v9;
    *((_QWORD *)v4 + 10) = 0x3F8CCCCD3FA66666;
    v12 = v4;
  }

  return v5;
}

- (DeskCamSessionOptions)initWithPlistPath:(id)a3 deviceType:(int)a4
{
  uint64_t v4;
  id v6;
  DeskCamSessionOptions *v7;
  DeskCamSessionOptions *v8;
  void *v9;
  DeskCamSessionOptions *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DeskCamSessionOptions;
  v7 = -[DeskCamSessionOptions init](&v12, sel_init);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DeskCamSessionOptions initWithPlist:deviceType:](v8, "initWithPlist:deviceType:", v9, v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (DeskCamSessionOptions)initWithPlist:(id)a3 deviceType:(int)a4
{
  id v6;
  DeskCamSessionOptions *v7;
  float v8;
  float v9;
  int v10;
  int v11;
  int v12;
  float v13;
  float v14;
  int v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  float v73;
  void *v74;
  void *v75;
  float v76;
  DeskCamSessionOptions *v77;
  objc_super v79;

  v6 = a3;
  v79.receiver = self;
  v79.super_class = (Class)DeskCamSessionOptions;
  v7 = -[DeskCamSessionOptions init](&v79, sel_init);
  if (v7)
  {
    v8 = 2.0;
    v9 = 1.0;
    if (a4 == 1)
    {
      v10 = 0;
      v14 = 0.5;
      v11 = 1059481190;
      v12 = -1028653056;
      v15 = 1062836634;
      v13 = 1.0;
    }
    else
    {
      if (a4 == 2)
      {
        v8 = 0.0;
        v10 = 1061997773;
        v11 = 1063675494;
        v12 = -1028653056;
        v13 = 1.05;
      }
      else
      {
        v10 = 1051931443;
        v11 = 1063675494;
        v12 = -1029046272;
        v9 = 1.085;
        v13 = 1.2;
      }
      v15 = 1059481190;
      v14 = 0.65;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierLandscape"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierLandscape"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v7->_viewportScaleMultiplierLandscape = v18;

    }
    else
    {
      LODWORD(v7->_viewportScaleMultiplierLandscape) = v15;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierPortrait"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierPortrait"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v7->_viewportScaleMultiplierPortrait = v21;

    }
    else
    {
      v7->_viewportScaleMultiplierPortrait = 0.65;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierMin"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewportScaleMultiplierMin"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v7->_viewportScaleMultiplierMin = v24;

    }
    else
    {
      v7->_viewportScaleMultiplierMin = v14;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("framingSpaceScalingFactor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("framingSpaceScalingFactor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      v7->_framingSpaceScalingFactor = v27;

    }
    else
    {
      v7->_framingSpaceScalingFactor = v13;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("framingSpaceExtendPercentage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("framingSpaceExtendPercentage"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      v7->_framingSpaceExtendPercentage = v30;

    }
    else
    {
      v7->_framingSpaceExtendPercentage = v9;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchDefaultAngleValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchDefaultAngleValue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v7->_pitchDefaultAngleValue = v33;

    }
    else
    {
      LODWORD(v7->_pitchDefaultAngleValue) = v12;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchRefinementValue"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchRefinementValue"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v7->_pitchRefinementValue = v36;

    }
    else
    {
      v7->_pitchRefinementValue = v8;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gravityVectorSmoothingAlpha"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gravityVectorSmoothingAlpha"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v7->_gravityVectorSmoothingAlpha = v39;

    }
    else
    {
      LODWORD(v7->_gravityVectorSmoothingAlpha) = v11;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchValueUpperThreshold"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchValueUpperThreshold"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v7->_pitchValueUpperThreshold = v42;

    }
    else
    {
      v7->_pitchValueUpperThreshold = -2.0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchValueLowerThreshold"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchValueLowerThreshold"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v7->_pitchValueLowerThreshold = v45;

    }
    else
    {
      v7->_pitchValueLowerThreshold = -110.0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlendingRadiusUpscaler"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlendingRadiusUpscaler"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v7->_imageBlendingRadiusUpscaler = v48;

    }
    else
    {
      v7->_imageBlendingRadiusUpscaler = 1.035;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlendingPercentage"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlendingPercentage"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      v7->_imageBlendingPercentage = v51;

    }
    else
    {
      v7->_imageBlendingPercentage = 0.95;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringEnabled"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringEnabled"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageBlurringEnabled = objc_msgSend(v53, "BOOLValue");

    }
    else
    {
      v7->_imageBlurringEnabled = 1;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringKernelSize"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringKernelSize"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageBlurringKernelSize = objc_msgSend(v55, "intValue");

    }
    else
    {
      v7->_imageBlurringKernelSize = 15;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringSigma"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageBlurringSigma"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      v7->_imageBlurringSigma = v58;

    }
    else
    {
      v7->_imageBlurringSigma = 13.0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningEnabled"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningEnabled"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageSharpeningEnabled = objc_msgSend(v60, "BOOLValue");

    }
    else
    {
      v7->_imageSharpeningEnabled = 1;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningKernelSize"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningKernelSize"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageSharpeningKernelSize = objc_msgSend(v62, "intValue");

    }
    else
    {
      v7->_imageSharpeningKernelSize = 5;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningSigma"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningSigma"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "floatValue");
      v7->_imageSharpeningSigma = v65;

    }
    else
    {
      v7->_imageSharpeningSigma = 5.0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningAmount"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageSharpeningAmount"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "floatValue");
      v7->_imageSharpeningAmount = v68;

    }
    else
    {
      LODWORD(v7->_imageSharpeningAmount) = v10;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingEnabled"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingEnabled"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_imageToneMappingEnabled = objc_msgSend(v70, "BOOLValue");

    }
    else
    {
      v7->_imageToneMappingEnabled = 1;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingExponent"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingExponent"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "floatValue");
      v7->_imageToneMappingExponent = v73;

    }
    else
    {
      v7->_imageToneMappingExponent = 1.3;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingScaler"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageToneMappingScaler"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "floatValue");
      v7->_imageToneMappingScaler = v76;

    }
    else
    {
      v7->_imageToneMappingScaler = 1.1;
    }

    v77 = v7;
  }

  return v7;
}

- (id)asDictionary
{
  double v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[22];
  _QWORD v45[24];

  v45[22] = *MEMORY[0x1E0C80C00];
  v44[0] = CFSTR("viewportScaleMultiplierLandscape");
  *(float *)&v2 = self->_viewportScaleMultiplierLandscape;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v43;
  v44[1] = CFSTR("viewportScaleMultiplierPortrait");
  *(float *)&v4 = self->_viewportScaleMultiplierPortrait;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v42;
  v44[2] = CFSTR("viewportScaleMultiplierMin");
  *(float *)&v5 = self->_viewportScaleMultiplierMin;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v41;
  v44[3] = CFSTR("framingSpaceScalingFactor");
  *(float *)&v6 = self->_framingSpaceScalingFactor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v40;
  v44[4] = CFSTR("framingSpaceExtendPercentage");
  *(float *)&v7 = self->_framingSpaceExtendPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v39;
  v44[5] = CFSTR("pitchDefaultAngleValue");
  *(float *)&v8 = self->_pitchDefaultAngleValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v38;
  v44[6] = CFSTR("pitchRefinementValue");
  *(float *)&v9 = self->_pitchRefinementValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v37;
  v44[7] = CFSTR("gravityVectorSmoothingAlpha");
  *(float *)&v10 = self->_gravityVectorSmoothingAlpha;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v36;
  v44[8] = CFSTR("pitchValueUpperThreshold");
  *(float *)&v11 = self->_pitchValueUpperThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v35;
  v44[9] = CFSTR("pitchValueLowerThreshold");
  *(float *)&v12 = self->_pitchValueLowerThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v34;
  v44[10] = CFSTR("imageBlendingRadiusUpscaler");
  *(float *)&v13 = self->_imageBlendingRadiusUpscaler;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v33;
  v44[11] = CFSTR("imageBlendingPercentage");
  *(float *)&v14 = self->_imageBlendingPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v32;
  v44[12] = CFSTR("imageBlurringEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_imageBlurringEnabled);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v31;
  v44[13] = CFSTR("imageBlurringKernelSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_imageBlurringKernelSize);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v15;
  v44[14] = CFSTR("imageBlurringSigma");
  *(float *)&v16 = self->_imageBlurringSigma;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v17;
  v44[15] = CFSTR("imageSharpeningEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_imageSharpeningEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v18;
  v44[16] = CFSTR("imageSharpeningKernelSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_imageSharpeningKernelSize);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v19;
  v44[17] = CFSTR("imageSharpeningSigma");
  *(float *)&v20 = self->_imageSharpeningSigma;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v21;
  v44[18] = CFSTR("imageSharpeningAmount");
  *(float *)&v22 = self->_imageSharpeningAmount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[18] = v23;
  v44[19] = CFSTR("imageToneMappingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_imageToneMappingEnabled);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[19] = v24;
  v44[20] = CFSTR("imageToneMappingExponent");
  *(float *)&v25 = self->_imageToneMappingExponent;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[20] = v26;
  v44[21] = CFSTR("imageToneMappingScaler");
  *(float *)&v27 = self->_imageToneMappingScaler;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[21] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (float)viewportScaleMultiplierLandscape
{
  return self->_viewportScaleMultiplierLandscape;
}

- (void)setViewportScaleMultiplierLandscape:(float)a3
{
  self->_viewportScaleMultiplierLandscape = a3;
}

- (float)viewportScaleMultiplierPortrait
{
  return self->_viewportScaleMultiplierPortrait;
}

- (void)setViewportScaleMultiplierPortrait:(float)a3
{
  self->_viewportScaleMultiplierPortrait = a3;
}

- (float)viewportScaleMultiplierMin
{
  return self->_viewportScaleMultiplierMin;
}

- (void)setViewportScaleMultiplierMin:(float)a3
{
  self->_viewportScaleMultiplierMin = a3;
}

- (float)framingSpaceScalingFactor
{
  return self->_framingSpaceScalingFactor;
}

- (void)setFramingSpaceScalingFactor:(float)a3
{
  self->_framingSpaceScalingFactor = a3;
}

- (float)framingSpaceExtendPercentage
{
  return self->_framingSpaceExtendPercentage;
}

- (void)setFramingSpaceExtendPercentage:(float)a3
{
  self->_framingSpaceExtendPercentage = a3;
}

- (float)pitchValueUpperThreshold
{
  return self->_pitchValueUpperThreshold;
}

- (void)setPitchValueUpperThreshold:(float)a3
{
  self->_pitchValueUpperThreshold = a3;
}

- (float)pitchValueLowerThreshold
{
  return self->_pitchValueLowerThreshold;
}

- (void)setPitchValueLowerThreshold:(float)a3
{
  self->_pitchValueLowerThreshold = a3;
}

- (float)pitchDefaultAngleValue
{
  return self->_pitchDefaultAngleValue;
}

- (void)setPitchDefaultAngleValue:(float)a3
{
  self->_pitchDefaultAngleValue = a3;
}

- (float)pitchRefinementValue
{
  return self->_pitchRefinementValue;
}

- (void)setPitchRefinementValue:(float)a3
{
  self->_pitchRefinementValue = a3;
}

- (float)gravityVectorSmoothingAlpha
{
  return self->_gravityVectorSmoothingAlpha;
}

- (void)setGravityVectorSmoothingAlpha:(float)a3
{
  self->_gravityVectorSmoothingAlpha = a3;
}

- (float)imageBlendingRadiusUpscaler
{
  return self->_imageBlendingRadiusUpscaler;
}

- (void)setImageBlendingRadiusUpscaler:(float)a3
{
  self->_imageBlendingRadiusUpscaler = a3;
}

- (float)imageBlendingPercentage
{
  return self->_imageBlendingPercentage;
}

- (void)setImageBlendingPercentage:(float)a3
{
  self->_imageBlendingPercentage = a3;
}

- (int)imageBlurringKernelSize
{
  return self->_imageBlurringKernelSize;
}

- (void)setImageBlurringKernelSize:(int)a3
{
  self->_imageBlurringKernelSize = a3;
}

- (float)imageBlurringSigma
{
  return self->_imageBlurringSigma;
}

- (void)setImageBlurringSigma:(float)a3
{
  self->_imageBlurringSigma = a3;
}

- (int)imageSharpeningKernelSize
{
  return self->_imageSharpeningKernelSize;
}

- (void)setImageSharpeningKernelSize:(int)a3
{
  self->_imageSharpeningKernelSize = a3;
}

- (float)imageSharpeningSigma
{
  return self->_imageSharpeningSigma;
}

- (void)setImageSharpeningSigma:(float)a3
{
  self->_imageSharpeningSigma = a3;
}

- (float)imageSharpeningAmount
{
  return self->_imageSharpeningAmount;
}

- (void)setImageSharpeningAmount:(float)a3
{
  self->_imageSharpeningAmount = a3;
}

- (float)imageToneMappingExponent
{
  return self->_imageToneMappingExponent;
}

- (void)setImageToneMappingExponent:(float)a3
{
  self->_imageToneMappingExponent = a3;
}

- (float)imageToneMappingScaler
{
  return self->_imageToneMappingScaler;
}

- (void)setImageToneMappingScaler:(float)a3
{
  self->_imageToneMappingScaler = a3;
}

- (BOOL)imageBlurringEnabled
{
  return self->_imageBlurringEnabled;
}

- (void)setImageBlurringEnabled:(BOOL)a3
{
  self->_imageBlurringEnabled = a3;
}

- (BOOL)imageSharpeningEnabled
{
  return self->_imageSharpeningEnabled;
}

- (void)setImageSharpeningEnabled:(BOOL)a3
{
  self->_imageSharpeningEnabled = a3;
}

- (BOOL)imageToneMappingEnabled
{
  return self->_imageToneMappingEnabled;
}

- (void)setImageToneMappingEnabled:(BOOL)a3
{
  self->_imageToneMappingEnabled = a3;
}

@end

@implementation HMISignificantActivityFcosDetector

- (HMISignificantActivityFcosDetector)initWithConfidenceThresholds:(id)a3 nmsConfiguration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HMISignificantActivityFcosDetector *v9;
  unint64_t v10;
  void *v11;
  float v12;
  NSString *inputFeatureValueName;
  NSArray *offsetsZeroFeatureValueNames;
  NSArray *offsetsOneFeatureValueNames;
  NSArray *scoresFeatureValueNames;
  NSArray *yawsFeatureValueNames;
  NSArray *rollsFeatureValueNames;
  float64x2_t v19;
  float64_t v20;
  uint64_t v21;
  float64x2_t v29;
  unint64_t v30;
  objc_super v32;
  _QWORD v33[17];

  v33[16] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HMISignificantActivityFcosDetector;
  v9 = -[HMISignificantActivityFcosDetector init](&v32, sel_init);
  if (v9)
  {
    if (objc_msgSend(v7, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v9->_confidenceThresholds[v10] = v12;

        ++v10;
      }
      while (objc_msgSend(v7, "count") > v10);
    }
    objc_storeStrong((id *)&v9->_nmsConfiguration, a4);
    v9->_inputDimensions = (CGSize)kHMISignificantActivityFcosInputSize;
    inputFeatureValueName = v9->_inputFeatureValueName;
    v9->_inputFeatureValueName = (NSString *)CFSTR("image_Placeholder");

    offsetsZeroFeatureValueNames = v9->_offsetsZeroFeatureValueNames;
    v9->_offsetsZeroFeatureValueNames = (NSArray *)&unk_24DC15080;

    offsetsOneFeatureValueNames = v9->_offsetsOneFeatureValueNames;
    v9->_offsetsOneFeatureValueNames = (NSArray *)&unk_24DC15098;

    scoresFeatureValueNames = v9->_scoresFeatureValueNames;
    v9->_scoresFeatureValueNames = (NSArray *)&unk_24DC150B0;

    yawsFeatureValueNames = v9->_yawsFeatureValueNames;
    v9->_yawsFeatureValueNames = (NSArray *)&unk_24DC150C8;

    rollsFeatureValueNames = v9->_rollsFeatureValueNames;
    v9->_rollsFeatureValueNames = (NSArray *)&unk_24DC150E0;

    -[HMISignificantActivityFcosDetector inputDimensions](v9, "inputDimensions");
    v21 = 0;
    v33[0] = *(_QWORD *)&v19.f64[0];
    *(float64_t *)&v33[1] = v20;
    __asm
    {
      FMOV            V2.2D, #-1.0
      FMOV            V3.2D, #0.5
      FMOV            V4.2S, #1.0
    }
    v29.f64[0] = v19.f64[0];
    do
    {
      *(_QWORD *)&v29.f64[1] = v33[v21 + 1];
      v29 = vcvtq_f64_f32(vadd_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vaddq_f64(v29, _Q2), _Q3))), _D4));
      *(float64x2_t *)&v33[v21 + 2] = v29;
      v21 += 2;
    }
    while (v21 != 14);
    v30 = 0;
    v19.f64[1] = v20;
    do
    {
      v9->_anchorStrides[v30 / 2] = (CGSize)vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v19, *(float64x2_t *)&v33[v30 + 6]))), v19)));
      v30 += 2;
    }
    while (v30 != 10);
  }

  return v9;
}

+ (HMIMLModel)sharedModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMISignificantActivityFcosDetector_sharedModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedModel_onceToken != -1)
    dispatch_once(&sharedModel_onceToken, block);
  return (HMIMLModel *)(id)sharedModel_model;
}

void __49__HMISignificantActivityFcosDetector_sharedModel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  HMIMLModel *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220735570]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_219D45000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing shared model", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  +[HMISignificantActivityFcosDetector defaultAssetPath](HMISignificantActivityFcosDetector, "defaultAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMIMLModel initWithModelURL:]([HMIMLModel alloc], "initWithModelURL:", v7);
    v9 = (void *)sharedModel_model;
    sharedModel_model = (uint64_t)v8;

    if (!sharedModel_model)
    {
      v10 = (void *)MEMORY[0x220735570]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v12;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to load model!", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x220735570]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@Model is not bundled into framework. Default model is stored in Git LFS. Make sure Git LFS is installed in your local system.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (BOOL)predict:(__CVBuffer *)a3 detectedObjects:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  HMISignpost *v16;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("SignificantActivityFcosDetector"));
  v14 = -[HMISignificantActivityFcosDetector _runNeuralNetworkOnPixelBuffer:offsetsZero:offsetsOne:scores:yaws:rolls:error:](self, "_runNeuralNetworkOnPixelBuffer:offsetsZero:offsetsOne:scores:yaws:rolls:error:", a3, v9, v10, v11, v12, v13, a5);
  if (v14)
    -[HMISignificantActivityFcosDetector _postProcessOffsetsZero:offsetsOne:scores:yaws:rolls:outputPredictions:](self, "_postProcessOffsetsZero:offsetsOne:scores:yaws:rolls:outputPredictions:", v9, v10, v11, v12, v13, v8);
  __HMISignpostScopeLeave(&v16);

  return v14;
}

- (BOOL)_runNeuralNetworkOnPixelBuffer:(__CVBuffer *)a3 offsetsZero:(id)a4 offsetsOne:(id)a5 scores:(id)a6 yaws:(id)a7 rolls:(id)a8 error:(id *)a9
{
  id *v15;
  void *v16;
  HMIVideoFrame *v17;
  HMIVideoFrame *v18;
  __CVBuffer *v19;
  HMIInputFeatureProvider *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  uint64_t v68;

  v15 = a9;
  v65 = a4;
  v64 = a5;
  v63 = a6;
  v62 = a7;
  v61 = a8;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v16, "BOOLPreferenceForKey:defaultValue:", CFSTR("showROI"), 0);

  if ((_DWORD)a7)
  {
    v17 = [HMIVideoFrame alloc];
    v67 = *MEMORY[0x24BDC0D88];
    v68 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v18 = -[HMIVideoFrame initWithPixelBuffer:presentationTimeStamp:](v17, "initWithPixelBuffer:presentationTimeStamp:", a3, &v67);
    -[HMIVideoFrame printWithScale:](v18, "printWithScale:", 1.0);

  }
  v19 = +[HMIVisionUtilities transferPixelBuffer:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:pixelFormat:options:error:", a3, 1111970369, 0, a9);
  v20 = [HMIInputFeatureProvider alloc];
  -[HMISignificantActivityFcosDetector inputFeatureValueName](self, "inputFeatureValueName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMIInputFeatureProvider initWithPixelBuffer:inputName:](v20, "initWithPixelBuffer:inputName:", v19, v21);

  CVPixelBufferRelease(v19);
  +[HMISignificantActivityFcosDetector sharedModel](HMISignificantActivityFcosDetector, "sharedModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v60 = (void *)v22;
  objc_msgSend(v23, "predictionFromFeatures:error:", v22, &v66);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v66;

  v59 = v25;
  if (!v24 || v25)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1019, v25);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v53;
    if (a9)
      *a9 = objc_retainAutorelease(v53);
    HMIErrorLog(self, v29);
  }
  else
  {
    v26 = 0;
    while (1)
    {
      -[HMISignificantActivityFcosDetector offsetsZeroFeatureValueNames](self, "offsetsZeroFeatureValueNames");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "featureValueForName:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29 || objc_msgSend(v29, "type") != 5)
        break;
      objc_msgSend(v29, "multiArrayValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v30);

      -[HMISignificantActivityFcosDetector offsetsOneFeatureValueNames](self, "offsetsOneFeatureValueNames");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "featureValueForName:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33 || objc_msgSend(v33, "type") != 5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1020, CFSTR("CoreML output nil or not of type MLFeatureTypeMultiArray"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v15)
          *v15 = objc_retainAutorelease(v56);
        HMIErrorLog(self, v57);

        goto LABEL_41;
      }
      objc_msgSend(v33, "multiArrayValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v34);

      -[HMISignificantActivityFcosDetector scoresFeatureValueNames](self, "scoresFeatureValueNames");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "featureValueForName:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37 && objc_msgSend(v37, "type") == 5)
      {
        objc_msgSend(v37, "multiArrayValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addObject:", v38);

        -[HMISignificantActivityFcosDetector yawsFeatureValueNames](self, "yawsFeatureValueNames");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectAtIndexedSubscript:", v26);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "featureValueForName:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41 && objc_msgSend(v41, "type") == 5)
        {
          objc_msgSend(v41, "multiArrayValue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v42);

          -[HMISignificantActivityFcosDetector rollsFeatureValueNames](self, "rollsFeatureValueNames");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndexedSubscript:", v26);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "featureValueForName:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45 && objc_msgSend(v45, "type") == 5)
          {
            objc_msgSend(v45, "multiArrayValue");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "addObject:", v46);
            v47 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1020, CFSTR("CoreML output nil or not of type MLFeatureTypeMultiArray"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v50;
            if (a9)
              *a9 = objc_retainAutorelease(v50);
            HMIErrorLog(self, v46);
            v47 = 1;
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1020, CFSTR("CoreML output nil or not of type MLFeatureTypeMultiArray"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v49;
          if (v15)
            *v15 = objc_retainAutorelease(v49);
          HMIErrorLog(self, v45);
          v47 = 1;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1020, CFSTR("CoreML output nil or not of type MLFeatureTypeMultiArray"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v48;
        if (v15)
          *v15 = objc_retainAutorelease(v48);
        HMIErrorLog(self, v41);
        v47 = 1;
      }

      v51 = v47 == 0;
      if (!v47)
      {
        v52 = v26++ == 4;
        v15 = a9;
        if (!v52)
          continue;
      }
      goto LABEL_42;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1020, CFSTR("CoreML output nil or not of type MLFeatureTypeMultiArray"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v15)
      *v15 = objc_retainAutorelease(v54);
    HMIErrorLog(self, v55);

  }
LABEL_41:

  v51 = 0;
LABEL_42:

  return v51;
}

- (void)_postProcessOffsetsZero:(id)a3 offsetsOne:(id)a4 scores:(id)a5 yaws:(id)a6 rolls:(id)a7 outputPredictions:(id)a8
{
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  float *v32;
  _DWORD *v33;
  uint64_t v34;
  _DWORD *v35;
  unint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  uint64_t j;
  float v41;
  float v42;
  CGSize *v43;
  float v44;
  float v45;
  uint64_t v46;
  float *v47;
  float v48;
  float v49;
  float v50;
  double v51;
  double v52;
  HMIObjectDetection *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  HMIObjectDetection *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double x;
  double y;
  double width;
  double height;
  HMIObjectDetection *v75;
  uint64_t v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  HMIObjectDetection *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  float *v100;
  void *v101;
  uint64_t v102;
  id v104;
  float *v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  uint64_t v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  v112 = *MEMORY[0x24BDAC8D0];
  v87 = a3;
  v86 = a4;
  v85 = a5;
  v84 = a6;
  v83 = a7;
  v82 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(v87, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectAtIndexedSubscript:", i);
    v104 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v19, "unsignedLongValue");

    objc_msgSend(v14, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedLongValue");

    objc_msgSend(v14, "strides");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v24, "unsignedLongValue");

    objc_msgSend(v14, "strides");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v26, "unsignedLongValue");

    objc_msgSend(v15, "strides");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedLongValue");

    objc_msgSend(v17, "strides");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v31, "unsignedLongValue");

    v92 = objc_retainAutorelease(v14);
    v106 = objc_msgSend(v92, "dataPointer");
    v91 = objc_retainAutorelease(v104);
    v105 = (float *)objc_msgSend(v91, "dataPointer");
    v90 = objc_retainAutorelease(v15);
    v32 = (float *)objc_msgSend(v90, "dataPointer");
    v89 = objc_retainAutorelease(v16);
    v33 = (_DWORD *)objc_msgSend(v89, "dataPointer");
    v88 = objc_retainAutorelease(v17);
    v34 = objc_msgSend(v88, "dataPointer");
    v93 = v22;
    if (v22)
    {
      v35 = (_DWORD *)v34;
      v36 = 0;
      v95 = v29;
      do
      {
        v94 = v36;
        if (v98)
        {
          v37 = 0;
          v38 = (float)v36 + 0.5;
          do
          {
            v99 = v37;
            v100 = v32;
            v39 = (float)v37 + 0.5;
            for (j = 1; j != 7; ++j)
            {
              v41 = self->_confidenceThresholds[j];
              if (v41 >= 0.0)
              {
                v42 = *v32;
                if (*v32 >= v41)
                {
                  v43 = &self->_anchorStrides[i];
                  v44 = v39 * v43->width;
                  v45 = v38 * v43->height;
                  v46 = i;
                  if (j == 5)
                    v47 = v105;
                  else
                    v47 = (float *)v106;
                  v48 = expf(*v47);
                  v49 = expf(v47[v102]);
                  v50 = expf(v47[2 * v102]);
                  v51 = (float)(v44 - v49);
                  v52 = (float)(v49 + expf(v47[3 * v102]));
                  v53 = [HMIObjectDetection alloc];
                  LODWORD(v54) = *v33;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v56) = *v35;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = -[HMIObjectDetection initWithLabelIndex:confidence:unclampedBoundingBox:yaw:roll:](v53, "initWithLabelIndex:confidence:unclampedBoundingBox:yaw:roll:", j, v55, v57, v42, v51, (float)(v45 - v48), v52, (float)(v48 + v50));

                  objc_msgSend(v101, "addObject:", v58);
                  i = v46;
                }
              }
              v32 += v102;
            }
            v32 = &v100[v95];
            v105 += v97;
            v106 += 4 * v97;
            v33 += v96;
            v37 = v99 + 1;
            v35 += v96;
          }
          while (v99 + 1 != v98);
        }
        v36 = v94 + 1;
      }
      while (v94 + 1 != v93);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMISignificantActivityFcosDetector nmsConfiguration](self, "nmsConfiguration");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIObjectDetectionUtils nmsMultiClass:output:nmsConfiguration:](HMIObjectDetectionUtils, "nmsMultiClass:output:nmsConfiguration:", v101, v59, v60);

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v61 = v59;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v108 != v64)
          objc_enumerationMutation(v61);
        v66 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
        objc_msgSend(v66, "boundingBox");
        v115.origin.x = v67;
        v115.origin.y = v68;
        v115.size.width = v69;
        v115.size.height = v70;
        v113.origin.x = 0.0;
        v113.origin.y = 0.0;
        v113.size.width = 1.0;
        v113.size.height = 1.0;
        v114 = CGRectIntersection(v113, v115);
        x = v114.origin.x;
        y = v114.origin.y;
        width = v114.size.width;
        height = v114.size.height;
        if (!CGRectIsEmpty(v114))
        {
          v75 = [HMIObjectDetection alloc];
          v76 = objc_msgSend(v66, "labelIndex");
          objc_msgSend(v66, "confidence");
          v78 = v77;
          objc_msgSend(v66, "yaw");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "roll");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v75, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v76, v79, v80, v78, x, y, width, height);

          objc_msgSend(v82, "addObject:", v81);
        }
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
    }
    while (v63);
  }

}

+ (id)defaultNMSConfiguration
{
  HMINMSConfiguration *v2;
  void *v3;
  HMINMSConfiguration *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = [HMINMSConfiguration alloc];
  v6[0] = &unk_24DC145A0;
  v6[1] = &unk_24DC145B8;
  v7[0] = &unk_24DC153E0;
  v7[1] = &unk_24DC153F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMINMSConfiguration initWithThresholdWithLabels:metricWithLabels:thresholdDefault:metricDefault:](v2, "initWithThresholdWithLabels:metricWithLabels:thresholdDefault:metricDefault:", v3, MEMORY[0x24BDBD1B8], &unk_24DC15400, &unk_24DC145D0);

  return v4;
}

+ (id)defaultAssetPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SignificantActivityFcos"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)inputDimensions
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inputDimensions, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)inputFeatureValueName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)offsetsZeroFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)offsetsOneFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)scoresFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)yawsFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSArray)rollsFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (HMINMSConfiguration)nmsConfiguration
{
  return (HMINMSConfiguration *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nmsConfiguration, 0);
  objc_storeStrong((id *)&self->_rollsFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_yawsFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_scoresFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_offsetsOneFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_offsetsZeroFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_inputFeatureValueName, 0);
}

@end

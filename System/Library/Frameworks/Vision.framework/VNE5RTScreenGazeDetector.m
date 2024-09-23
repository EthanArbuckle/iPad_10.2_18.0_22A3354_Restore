@implementation VNE5RTScreenGazeDetector

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VNE5RTScreenGazeDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v5, objc_opt_class(), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_13;
  if (objc_msgSend(v6, "requestRevision") == 2)
  {
    v11 = 0;
    if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v11, CFSTR("VNScreenGazeDetectorInitOption_ScreenSize"), v5, a4))
    {
      if (v11 == 1 || v11 == 2)
      {
        objc_opt_class();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (a4)
      {
        +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (!a4)
    goto LABEL_13;
  +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v9 = 0;
  *a4 = v8;
LABEL_14:

  return (Class)v9;
}

+ (NSString)modelInputImageName
{
  return (NSString *)CFSTR("facecrop");
}

+ (NSString)modelFunctionName
{
  return (NSString *)CFSTR("main");
}

+ (NSString)modelOutputXYName
{
  return (NSString *)CFSTR("xy");
}

+ (NSString)modelOutputDeviceGazeProbabilitiesName
{
  return (NSString *)CFSTR("devicegaze_probs");
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "modelFileName", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNEspressoHelpers pathForEspressoResourceWithFilename:error:](VNEspressoHelpers, "pathForEspressoResourceWithFilename:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t aBlock;
  uint64_t v19;
  id (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  aBlock = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __80__VNE5RTScreenGazeDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  v21 = &unk_1E4548D60;
  v23 = a1;
  v7 = v6;
  v22 = v7;
  v8 = _Block_copy(&aBlock);
  objc_msgSend(a1, "modelURLForConfigurationOptions:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "modelFileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@:%@"), v11, v12, aBlock, v19, v20, v21);

    +[VNFrameworkManager manager](VNFrameworkManager, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detectorDescriptorsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForIdentifier:creationBlock:error:", v13, v8, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allNeuralEngineComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "unalignedBoundingBox");
  v13 = CGRectInset(v12, v12.size.width * -0.200000048 * 0.5, v12.size.height * -0.200000048 * 0.5);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;

  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

id __80__VNE5RTScreenGazeDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "E5RTProgramLibraryForConfigurationOptions:error:", *(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "modelFunctionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "modelInputImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "modelOutputXYName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(*(id *)(a1 + 40), "modelOutputDeviceGazeProbabilitiesName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VisionCoreE5RTInferenceFunctionDescriptor descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:](VNE5RTScreenGazeDetectorFunctionDescriptor, "descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:", v4, v5, v6, v9, 0, 0, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __65__VNE5RTScreenGazeDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNE5RTScreenGazeDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNScreenGazeDetectorInitOption_ScreenSize"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)needsMetalContext
{
  return 0;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  float32x4_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  size_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  __int128 v55;
  void *v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  unint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  char *v76;
  char *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t i;
  _QWORD *v84;
  char *v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  float32x2_t v103;
  float32x4_t v104;
  float32x2_t v105;
  void *v106;
  void *v107;
  _BYTE *v108;
  _BYTE *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  void *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  int64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  uint64_t v139;
  char *v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  void *v146;
  _BYTE *v147;
  uint64_t v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  __int128 v155;
  id v156;
  __int128 v157;
  _QWORD v158[5];
  float32x4_t v159;
  BOOL (*v160)(uint64_t, void *, _QWORD *);
  void *v161;
  __int128 *v162;
  _QWORD v163[3];

  v163[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v156 = a5;
  v12 = a6;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNScreenGazeDetectorProcessOption_FaceObjectState"), v12, a7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_10;
  v157 = xmmword_1A15FB3F0;
  v14 = v11;
  if (!self)
    goto LABEL_9;
  objc_msgSend((id)objc_opt_class(), "modelOutputXYName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v159.i64[0] = MEMORY[0x1E0C809B0];
  v159.i64[1] = 3221225472;
  v160 = __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke;
  v161 = &__block_descriptor_40_e20_B24__0__NSData_8__16l;
  v162 = &v157;
  v17 = objc_msgSend(v14, "accessReadOnlyDataForName:usingBlock:error:", v15, &v159, a7);

  if ((v17 & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "modelOutputDeviceGazeProbabilitiesName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = v16;
  v158[1] = 3221225472;
  v158[2] = __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke_2;
  v158[3] = &__block_descriptor_40_e20_B24__0__NSData_8__16l;
  v158[4] = &v157;
  v19 = objc_msgSend(v14, "accessReadOnlyDataForName:usingBlock:error:", v18, v158, a7);

  if ((v19 & 1) == 0)
  {
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  v20 = *(_QWORD *)(v13 + 64);
  if (*(_BYTE *)(v20 + 4))
  {
    v21 = *(_QWORD *)(v20 + 64);
    if (v21 == *(_DWORD *)v20)
    {
      v22 = *(void ***)(v20 + 32);
      v23 = *(_QWORD *)(v20 + 56);
      *(float32x4_t *)(v20 + 8) = vsubq_f32(*(float32x4_t *)(v20 + 8), (*(float32x4_t **)((char *)v22 + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8)))[v23]);
      --v21;
      v24 = v23 + 1;
      *(_QWORD *)(v20 + 56) = v24;
      *(_QWORD *)(v20 + 64) = v21;
      if (v24 >= 0x200)
      {
        operator delete(*v22);
        *(_QWORD *)(v20 + 32) += 8;
        v21 = *(_QWORD *)(v20 + 64);
        v24 = *(_QWORD *)(v20 + 56) - 256;
        *(_QWORD *)(v20 + 56) = v24;
      }
    }
    else
    {
      v24 = *(_QWORD *)(v20 + 56);
    }
    v28 = *(char **)(v20 + 40);
    v29 = *(char **)(v20 + 32);
    v30 = 32 * (v28 - v29) - 1;
    v31 = v28 - v29;
    if (v28 == v29)
      v30 = 0;
    v32 = v21 + v24;
    if (v30 != v32)
      goto LABEL_82;
    if (v24 < 0x100)
    {
      v48 = v31 >> 3;
      v49 = *(char **)(v20 + 48);
      v50 = *(char **)(v20 + 24);
      if (v31 >> 3 >= (unint64_t)((v49 - v50) >> 3))
      {
        if (v49 == v50)
          v51 = 1;
        else
          v51 = (v49 - v50) >> 2;
        v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v51);
        v148 = v53;
        v54 = &v52[8 * v48];
        *(_QWORD *)&v55 = v52;
        *((_QWORD *)&v55 + 1) = v54;
        v152 = v55;
        v147 = v52;
        v56 = operator new(0x1000uLL);
        *(_QWORD *)&v57 = v54;
        *((_QWORD *)&v57 + 1) = &v147[8 * v148];
        if (v48 == v148)
        {
          v58 = v54 - v147;
          *(_QWORD *)&v59 = v152;
          if (v31 < 1)
          {
            v78 = v56;
            v79 = v58 >> 2;
            if (v28 == v29)
              v80 = 1;
            else
              v80 = v79;
            v81 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v80);
            v54 = &v81[8 * (v80 >> 2)];
            *(_QWORD *)&v59 = v81;
            *((_QWORD *)&v59 + 1) = v54;
            *(_QWORD *)&v57 = v54;
            *((_QWORD *)&v57 + 1) = &v81[8 * v82];
            if (v147)
            {
              v149 = v57;
              v153 = v59;
              operator delete(v147);
              v57 = v149;
              v59 = v153;
            }
            v56 = v78;
          }
          else
          {
            v60 = v58 >> 3;
            if (v60 >= -1)
              v61 = v60 + 1;
            else
              v61 = v60 + 2;
            v54 -= 8 * (v61 >> 1);
            *(_QWORD *)&v57 = v54;
            *((_QWORD *)&v59 + 1) = v54;
          }
        }
        else
        {
          v59 = v152;
        }
        *(_QWORD *)v54 = v56;
        *(_QWORD *)&v57 = v57 + 8;
        for (i = *(_QWORD *)(v20 + 40); i != *(_QWORD *)(v20 + 32); i -= 8)
        {
          v84 = (_QWORD *)*((_QWORD *)&v59 + 1);
          if (*((_QWORD *)&v59 + 1) == (_QWORD)v59)
          {
            v86 = (_BYTE *)v57;
            if ((unint64_t)v57 >= *((_QWORD *)&v57 + 1))
            {
              if (*((_QWORD *)&v57 + 1) == *((_QWORD *)&v59 + 1))
                v91 = 1;
              else
                v91 = (uint64_t)(*((_QWORD *)&v57 + 1) - *((_QWORD *)&v59 + 1)) >> 2;
              v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v91);
              v85 = &v92[(2 * v91 + 6) & 0xFFFFFFFFFFFFFFF8];
              v94 = v85;
              v95 = v86 - (_BYTE *)v84;
              if (v86 != (_BYTE *)v84)
              {
                v94 = &v85[v95 & 0xFFFFFFFFFFFFFFF8];
                v96 = 8 * (v95 >> 3);
                v97 = v85;
                v98 = v84;
                do
                {
                  v99 = *v98++;
                  *(_QWORD *)v97 = v99;
                  v97 += 8;
                  v96 -= 8;
                }
                while (v96);
              }
              *(_QWORD *)&v59 = v92;
              *((_QWORD *)&v59 + 1) = v85;
              *(_QWORD *)&v57 = v94;
              *((_QWORD *)&v57 + 1) = &v92[8 * v93];
              if (v84)
              {
                v150 = v57;
                v155 = v59;
                operator delete(v84);
                v57 = v150;
                v59 = v155;
              }
            }
            else
            {
              v87 = (uint64_t)(*((_QWORD *)&v57 + 1) - v57) >> 3;
              if (v87 >= -1)
                v88 = v87 + 1;
              else
                v88 = v87 + 2;
              v89 = v88 >> 1;
              v90 = v57 + 8 * (v88 >> 1);
              v85 = (char *)(v90 - (v57 - *((_QWORD *)&v59 + 1)));
              if ((_QWORD)v57 == *((_QWORD *)&v59 + 1))
              {
                v86 = (_BYTE *)*((_QWORD *)&v59 + 1);
              }
              else
              {
                v151 = *((_QWORD *)&v57 + 1);
                v154 = v59;
                memmove((void *)(v90 - (v57 - *((_QWORD *)&v59 + 1))), *((const void **)&v59 + 1), v57 - *((_QWORD *)&v59 + 1));
                *((_QWORD *)&v57 + 1) = v151;
                *(_QWORD *)&v59 = v154;
              }
              *((_QWORD *)&v59 + 1) = v85;
              *(_QWORD *)&v57 = &v86[8 * v89];
            }
          }
          else
          {
            v85 = (char *)*((_QWORD *)&v59 + 1);
          }
          v100 = *(_QWORD *)(i - 8);
          *((_QWORD *)v85 - 1) = v100;
          *((_QWORD *)&v59 + 1) -= 8;
        }
        v101 = *(void **)(v20 + 24);
        *(_OWORD *)(v20 + 24) = v59;
        *(_OWORD *)(v20 + 40) = v57;
        if (v101)
          operator delete(v101);
        goto LABEL_81;
      }
      if (v49 == v28)
      {
        v75 = operator new(0x1000uLL);
        v76 = *(char **)(v20 + 32);
        if (v76 == *(char **)(v20 + 24))
        {
          v108 = *(_BYTE **)(v20 + 40);
          v109 = *(_BYTE **)(v20 + 48);
          if (v108 >= v109)
          {
            if (v109 == v76)
              v113 = 1;
            else
              v113 = (v109 - v76) >> 2;
            v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v113);
            v77 = &v114[(2 * v113 + 6) & 0xFFFFFFFFFFFFFFF8];
            v116 = *(uint64_t **)(v20 + 32);
            v117 = v77;
            v118 = *(_QWORD *)(v20 + 40) - (_QWORD)v116;
            if (v118)
            {
              v117 = &v77[v118 & 0xFFFFFFFFFFFFFFF8];
              v119 = 8 * (v118 >> 3);
              v120 = v77;
              do
              {
                v121 = *v116++;
                *(_QWORD *)v120 = v121;
                v120 += 8;
                v119 -= 8;
              }
              while (v119);
            }
            v122 = *(void **)(v20 + 24);
            *(_QWORD *)(v20 + 24) = v114;
            *(_QWORD *)(v20 + 32) = v77;
            *(_QWORD *)(v20 + 40) = v117;
            *(_QWORD *)(v20 + 48) = &v114[8 * v115];
            if (v122)
            {
              operator delete(v122);
              v77 = *(char **)(v20 + 32);
            }
          }
          else
          {
            v110 = (v109 - v108) >> 3;
            if (v110 >= -1)
              v111 = v110 + 1;
            else
              v111 = v110 + 2;
            v112 = v111 >> 1;
            v77 = &v76[8 * (v111 >> 1)];
            if (v108 != v76)
            {
              memmove(&v76[8 * (v111 >> 1)], v76, v108 - v76);
              v76 = *(char **)(v20 + 40);
            }
            *(_QWORD *)(v20 + 32) = v77;
            *(_QWORD *)(v20 + 40) = &v76[8 * v112];
          }
        }
        else
        {
          v77 = *(char **)(v20 + 32);
        }
        *((_QWORD *)v77 - 1) = v75;
        v123 = *(char **)(v20 + 32);
        v124 = *(char **)(v20 + 40);
        *(_QWORD *)(v20 + 32) = v123 - 8;
        v125 = *((_QWORD *)v123 - 1);
        *(_QWORD *)(v20 + 32) = v123;
        if (v124 == *(char **)(v20 + 48))
        {
          v126 = *(_QWORD *)(v20 + 24);
          v127 = (uint64_t)&v123[-v126];
          if ((unint64_t)v123 <= v126)
          {
            v135 = (uint64_t)&v124[-v126];
            v62 = v135 == 0;
            v136 = v135 >> 2;
            if (v62)
              v137 = 1;
            else
              v137 = v136;
            v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v137);
            v140 = &v138[8 * (v137 >> 2)];
            v141 = *(uint64_t **)(v20 + 32);
            v124 = v140;
            v142 = *(_QWORD *)(v20 + 40) - (_QWORD)v141;
            if (v142)
            {
              v124 = &v140[v142 & 0xFFFFFFFFFFFFFFF8];
              v143 = 8 * (v142 >> 3);
              v144 = &v138[8 * (v137 >> 2)];
              do
              {
                v145 = *v141++;
                *(_QWORD *)v144 = v145;
                v144 += 8;
                v143 -= 8;
              }
              while (v143);
            }
            v146 = *(void **)(v20 + 24);
            *(_QWORD *)(v20 + 24) = v138;
            *(_QWORD *)(v20 + 32) = v140;
            *(_QWORD *)(v20 + 40) = v124;
            *(_QWORD *)(v20 + 48) = &v138[8 * v139];
            if (v146)
            {
              operator delete(v146);
              v124 = *(char **)(v20 + 40);
            }
          }
          else
          {
            v128 = v127 >> 3;
            v39 = v127 >> 3 < -1;
            v129 = (v127 >> 3) + 2;
            if (v39)
              v130 = v129;
            else
              v130 = v128 + 1;
            v131 = -(v130 >> 1);
            v132 = v130 >> 1;
            v133 = &v123[-8 * v132];
            v134 = v124 - v123;
            if (v124 != v123)
            {
              memmove(&v123[-8 * v132], v123, v124 - v123);
              v123 = *(char **)(v20 + 32);
            }
            v124 = &v133[v134];
            *(_QWORD *)(v20 + 32) = &v123[8 * v131];
            *(_QWORD *)(v20 + 40) = &v133[v134];
          }
        }
        *(_QWORD *)v124 = v125;
      }
      else
      {
        *(_QWORD *)v28 = operator new(0x1000uLL);
      }
    }
    else
    {
      *(_QWORD *)(v20 + 56) = v24 - 256;
      v35 = *(_QWORD *)v29;
      v33 = v29 + 8;
      v34 = v35;
      *(_QWORD *)(v20 + 32) = v33;
      if (*(char **)(v20 + 48) == v28)
      {
        v36 = *(_QWORD *)(v20 + 24);
        v37 = (uint64_t)&v33[-v36];
        if ((unint64_t)v33 <= v36)
        {
          v63 = (uint64_t)&v28[-v36];
          v62 = v63 == 0;
          v64 = v63 >> 2;
          if (v62)
            v65 = 1;
          else
            v65 = v64;
          v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v65);
          v68 = &v66[8 * (v65 >> 2)];
          v69 = *(uint64_t **)(v20 + 32);
          v28 = v68;
          v70 = *(_QWORD *)(v20 + 40) - (_QWORD)v69;
          if (v70)
          {
            v28 = &v68[v70 & 0xFFFFFFFFFFFFFFF8];
            v71 = 8 * (v70 >> 3);
            v72 = &v66[8 * (v65 >> 2)];
            do
            {
              v73 = *v69++;
              *(_QWORD *)v72 = v73;
              v72 += 8;
              v71 -= 8;
            }
            while (v71);
          }
          v74 = *(void **)(v20 + 24);
          *(_QWORD *)(v20 + 24) = v66;
          *(_QWORD *)(v20 + 32) = v68;
          *(_QWORD *)(v20 + 40) = v28;
          *(_QWORD *)(v20 + 48) = &v66[8 * v67];
          if (v74)
          {
            operator delete(v74);
            v28 = *(char **)(v20 + 40);
          }
        }
        else
        {
          v38 = v37 >> 3;
          v39 = v37 >> 3 < -1;
          v40 = (v37 >> 3) + 2;
          if (v39)
            v41 = v40;
          else
            v41 = v38 + 1;
          v42 = -(v41 >> 1);
          v43 = v41 >> 1;
          v44 = &v33[-8 * v43];
          v45 = v28 - v33;
          if (v28 == v33)
          {
            v47 = v28;
          }
          else
          {
            v46 = &v33[-8 * v43];
            memmove(v46, v33, v45);
            v44 = v46;
            v47 = *(char **)(v20 + 32);
          }
          v28 = &v44[v45];
          *(_QWORD *)(v20 + 32) = &v47[8 * v42];
          *(_QWORD *)(v20 + 40) = &v44[v45];
        }
      }
      *(_QWORD *)v28 = v34;
    }
    *(_QWORD *)(v20 + 40) += 8;
LABEL_81:
    v29 = *(char **)(v20 + 32);
    v32 = *(_QWORD *)(v20 + 64) + *(_QWORD *)(v20 + 56);
LABEL_82:
    *(_OWORD *)(*(_QWORD *)&v29[(v32 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v32) = v157;
    v102 = *(_QWORD *)(v20 + 64) + 1;
    *(_QWORD *)(v20 + 64) = v102;
    v103 = *(float32x2_t *)(v20 + 16);
    *(float32x2_t *)v104.f32 = vadd_f32(*(float32x2_t *)&v157, *(float32x2_t *)(v20 + 8));
    *(_QWORD *)(v20 + 8) = v104.i64[0];
    v105 = vadd_f32(*(float32x2_t *)((char *)&v157 + 8), (float32x2_t)vbsl_s8(vorr_s8((int8x8_t)vcltz_f32(v103), (int8x8_t)vcgez_f32(v103)), (int8x8_t)v103, (int8x8_t)0x8000000080000000));
    v103.f32[0] = (float)(int)v102;
    *(float32x2_t *)(v20 + 16) = v105;
    *(float32x2_t *)&v104.u32[2] = v105;
    v27 = vdivq_f32(v104, (float32x4_t)vdupq_lane_s32((int32x2_t)v103, 0));
    goto LABEL_83;
  }
  v27 = (float32x4_t)v157;
LABEL_83:
  v159 = v27;
  v106 = -[VNFaceScreenGaze initWithScreenGaze:originatingRequestSpecifier:]([VNFaceScreenGaze alloc], (float32x2_t *)&v159, v156);
  objc_msgSend(*(id *)(v13 + 8), "vn_cloneObject");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setUUID:", *(_QWORD *)(v13 + 40));
  objc_msgSend(v107, "setFaceScreenGaze:", v106);

  if (v107)
  {
    v163[0] = v107;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create screen gaze observation"));
    v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

LABEL_11:
  return v25;
}

BOOL __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  void *v9;

  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == 8)
  {
    v7 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v8 = *(_DWORD **)(a1 + 32);
    *v8 = *v7;
    v8[1] = v7[1];
  }
  else if (a3)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s size is %lu bytes instead of the expected %lu bytes \n"), "xy", objc_msgSend(v5, "length"), 8);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 8;
}

BOOL __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == 8)
  {
    v7 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v8 + 8) = *v7;
    *(_DWORD *)(v8 + 12) = v7[1];
  }
  else if (a3)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s size is %lu bytes instead of the expected %lu bytes \n"), "devicegaze_probs", objc_msgSend(v5, "length"), 12);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 8;
}

@end

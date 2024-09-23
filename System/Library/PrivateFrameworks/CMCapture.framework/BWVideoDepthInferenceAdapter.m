@implementation BWVideoDepthInferenceAdapter

id __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_2(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  BWInferenceVideoFormatRequirements *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", objc_msgSend(a2, "width"));
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", objc_msgSend(a2, "height"));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", 64);
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
  -[BWInferenceVideoFormatRequirements setRotationDegrees:](v3, "setRotationDegrees:", objc_msgSend(a2, "rotationDegrees"));
  v5 = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1));
}

- (BWVideoDepthInferenceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthInferenceAdapter;
  return -[BWVideoDepthInferenceAdapter init](&v3, sel_init);
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BWVideoDepthSampleBufferPropagator *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  BWInferenceVideoRequirement *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  BWInferenceVideoFormatRequirements *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BWRectificationInferenceProvider *v45;
  BWDisparityFilteringInferenceProvider *v46;
  id v47;
  id v48;
  void *v49;
  BWVideoDepthSampleBufferPropagator *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  BWInferenceVideoFormatRequirements *v59;
  id v60;
  BWInferenceVideoFormatRequirements *v61;
  id v62;
  BWInferenceVideoFormatRequirements *v63;
  id v64;
  BWInferenceVideoRequirement *v65;
  __CFString *v66;
  BWInferenceVideoRequirement *v67;
  BWDisparityPostProcessingInferenceProvider *v68;
  BWDisparityFilteringInferenceProvider *v69;
  id v70;
  BWInferenceVideoFormatRequirements *v71;
  BWInferenceVideoRequirement *v72;
  uint64_t v73;
  uint64_t v74;
  BWInferenceLazyVideoRequirement *v75;
  uint64_t v76;
  BWInferenceLazyVideoRequirement *v77;
  BWInferenceVideoScalingProvider *v78;
  BWInferenceVideoScalingProvider *v79;
  BWInferenceVideoFormatRequirements *v80;
  BWOpticalFlowInferenceProvider *v81;
  BWOpticalFlowInferenceProvider *v82;
  id v84;
  uint64_t v85;
  uint64_t v86;
  BWInferenceVideoRequirement *v87;
  BWInferenceVideoRequirement *v88;
  BWInferenceVideoRequirement *v89;
  void *v90;
  int *v91;
  int *v92;
  id v93;
  id v94;
  void *v95;
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[2];
  BWInferenceVideoRequirement *(*v102)(uint64_t, int, int, int, uint64_t, uint64_t, uint64_t);
  void *v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  int v113;
  BWInferenceVideoFormatRequirements *v114;
  BWInferenceVideoRequirement *v115;
  BWInferenceVideoFormatRequirements *v116;
  BWInferenceVideoFormatRequirements *v117;
  BWInferenceVideoFormatRequirements *v118;
  BWInferenceVideoFormatRequirements *v119;
  uint64_t v120;
  _BYTE v121[128];
  BWInferenceVideoFormatRequirements *v122;
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v10 = *(_QWORD *)&a4.var0;
  v125 = *MEMORY[0x1E0C80C00];
  v113 = 0;
  v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)v12;
  if (a3 == 109)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = a5;
    else
      v47 = 0;
    v48 = -[BWEspressoInferenceAdapter inferenceProviderForType:version:configuration:resourceProvider:status:](objc_alloc_init(BWEspressoInferenceAdapter), "inferenceProviderForType:version:configuration:resourceProvider:status:", 109, v10 & 0xFFFFFFFFFFFFLL, v47, a6, &v113);
    if (!v48 || v113)
    {
LABEL_105:
      fig_log_get_emitter();
      goto LABEL_96;
    }
    v49 = v48;
    v94 = a6;
    v95 = v13;
    if ((unint64_t)objc_msgSend(v47, "concurrencyWidth") >= 2)
    {
      v50 = -[BWVideoDepthSampleBufferPropagator initWithVideoRequirements:cloneRequirements:]([BWVideoDepthSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:", objc_msgSend(v49, "outputVideoRequirements"), objc_msgSend(v49, "cloneVideoRequirements"));
      objc_msgSend(v49, "setPropagatable:", v50);

    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v51 = (void *)objc_msgSend(v49, "inputVideoRequirements");
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    if (!v52)
      goto LABEL_99;
    v53 = v52;
    v92 = a7;
    v54 = 0;
    v55 = 0;
    v56 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v98 != v56)
          objc_enumerationMutation(v51);
        v58 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v58, "attachedMediaKey"), "isEqualToString:", 0x1E49514D8))
          v54 = v58;
        if (objc_msgSend((id)objc_msgSend(v58, "attachedMediaKey"), "isEqualToString:", 0x1E49515B8))
          v55 = v58;
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    }
    while (v53);
    a7 = v92;
    if (!v54 || !v55)
      goto LABEL_99;
    objc_msgSend(v95, "addObject:", v49);
    v89 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E49514F8, objc_msgSend(v54, "videoFormat"));
    v59 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v59, "setWidth:", (int)objc_msgSend(v47, "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v59, "setHeight:", objc_msgSend(v47, "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v59, "setBytesPerRowAlignment:", 64);
    v120 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v54, "videoFormat"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v59, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1));
    v119 = v59;
    v60 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1));
    v61 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v61, "setWidth:", objc_msgSend((id)objc_msgSend(v55, "videoFormat"), "width"));
    -[BWVideoFormatRequirements setHeight:](v61, "setHeight:", objc_msgSend((id)objc_msgSend(v55, "videoFormat"), "height"));
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v61, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v61, "setSupportedPixelFormats:", &unk_1E4A01688);
    v118 = v61;
    v62 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1));
    v63 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v63, "setWidth:", (int)objc_msgSend(v47, "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v63, "setHeight:", objc_msgSend(v47, "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v63, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v63, "setSupportedPixelFormats:", &unk_1E4A016A0);
    v117 = v63;
    v64 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1));
    v65 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E4951418, v62);
    v66 = objc_msgSend(v47, "requiresAppleDepthPostProcessing") ? CFSTR("UnscaledDepth") : CFSTR("Depth");
    v67 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", v66, v60);
    v68 = objc_autorelease(-[BWDisparityPostProcessingInferenceProvider initWithDisparityInputRequirement:displacementInputRequirement:stateInputRequirement:stateOutputRequirement:disparityOutputRequirement:portType:resourceProvider:configuration:]([BWDisparityPostProcessingInferenceProvider alloc], "initWithDisparityInputRequirement:displacementInputRequirement:stateInputRequirement:stateOutputRequirement:disparityOutputRequirement:portType:resourceProvider:configuration:", v89, v65, objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E4951518, v64)), objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E4951538, v64)), v67,
              objc_msgSend(v47, "portType"),
              v94,
              v47));
    if (!v68)
    {
LABEL_99:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_100;
    }
    v13 = v95;
    objc_msgSend(v95, "addObject:", v68);
    if (objc_msgSend(v47, "requiresAppleDepthPostProcessing"))
    {
      v69 = -[BWDisparityFilteringInferenceProvider initWithDisparityInputRequirement:disparityOutputRequirement:resourceProvider:configuration:isPreprocessing:]([BWDisparityFilteringInferenceProvider alloc], "initWithDisparityInputRequirement:disparityOutputRequirement:resourceProvider:configuration:isPreprocessing:", v67, -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", CFSTR("Depth"), v60), v94, v47, 0);
      if (!v69)
      {
LABEL_112:
        fig_log_get_emitter();
        goto LABEL_96;
      }
      objc_msgSend(v95, "addObject:", v69);
    }
    v46 = -[BWDisparityFilteringInferenceProvider initWithDisparityInputRequirement:disparityOutputRequirement:resourceProvider:configuration:isPreprocessing:]([BWDisparityFilteringInferenceProvider alloc], "initWithDisparityInputRequirement:disparityOutputRequirement:resourceProvider:configuration:isPreprocessing:", -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E4951458, 0x1E4951458, &__block_literal_global_118_0), v54, v94, v47, 1);
    if (v46)
      goto LABEL_75;
    goto LABEL_112;
  }
  if (a3 == 117)
  {
    v95 = (void *)v12;
    v91 = a7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v70 = a5;
    else
      v70 = 0;
    v71 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v71, "setWidth:", (int)objc_msgSend(v70, "inputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v71, "setHeight:", objc_msgSend(v70, "inputDimensions") >> 32);
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v71, "setSupportedColorSpaceProperties:", &unk_1E4A016B8);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v71, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v71, "setSupportedPixelFormats:", &unk_1E4A016D0);
    -[BWInferenceVideoFormatRequirements setRotationDegrees:](v71, "setRotationDegrees:", objc_msgSend(v70, "inputRotationAngle"));
    if (objc_msgSend(v70, "cropColorInputToPrimaryCaptureRect"))
      -[BWInferenceVideoFormatRequirements setCropDescriptor:](v71, "setCropDescriptor:", objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor));
    v116 = v71;
    v72 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", CFSTR("PrimaryFormat"), +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1)));
    v73 = objc_msgSend(v70, "forceIntermediateDimensions");
    v74 = objc_msgSend(v70, "inputDimensions");
    if ((int)v73 >= (int)v74
      && SHIDWORD(v73) >= SHIDWORD(v74)
      && ((int)v73 > (int)v74 || SHIDWORD(v73) > SHIDWORD(v74)))
    {
      v75 = [BWInferenceLazyVideoRequirement alloc];
      v76 = objc_msgSend(v70, "concurrencyWidth");
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_129;
      v96[3] = &__block_descriptor_40_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      v96[4] = v73;
      v77 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:count:videoFormatProvider:](v75, "initWithAttachedMediaKey:preparedByAttachedMediaKey:count:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v76, v96);
      v78 = [BWInferenceVideoScalingProvider alloc];
      v115 = v72;
      v79 = -[BWInferenceVideoScalingProvider initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:](v78, "initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:", v77, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1), 1);
      objc_msgSend(v95, "addObject:", v79);

    }
    v80 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v80, "setWidth:", (int)objc_msgSend(v70, "inputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v80, "setHeight:", objc_msgSend(v70, "inputDimensions") >> 32);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v80, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v80, "setSupportedPixelFormats:", &unk_1E4A01718);
    v114 = v80;
    v81 = -[BWOpticalFlowInferenceProvider initWithInputRequirement:outputRequirement:portType:resourceProvider:configuration:]([BWOpticalFlowInferenceProvider alloc], "initWithInputRequirement:outputRequirement:portType:resourceProvider:configuration:", v72, -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1E4951418, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1))), objc_msgSend(v70, "portType"), a6, v70);
    if (!v81)
    {
      fig_log_get_emitter();
LABEL_111:
      FigDebugAssert3();
      a7 = v91;
LABEL_100:
      v13 = v95;
      if (!a7)
        return v13;
      goto LABEL_97;
    }
    v82 = v81;
    v13 = v95;
    if (objc_msgSend(v70, "attachedMediaKeyForPropagatedColorInput"))
      -[BWOpticalFlowInferenceProvider bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:](v82, "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v72, objc_msgSend(v70, "attachedMediaKeyForPropagatedColorInput"));
    objc_msgSend(v95, "addObject:", v82);
LABEL_91:
    a7 = v91;
    if (!v91)
      return v13;
    goto LABEL_97;
  }
  if (a3 != 111)
  {
    v113 = -31710;
    if (!a7)
      return v13;
    goto LABEL_97;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = a5;
  else
    v14 = 0;
  v15 = -[BWEspressoInferenceAdapter inferenceProviderForType:version:configuration:resourceProvider:status:](objc_alloc_init(BWEspressoInferenceAdapter), "inferenceProviderForType:version:configuration:resourceProvider:status:", 111, v10 & 0xFFFFFFFFFFFFLL, a5, a6, &v113);
  if (!v15 || v113)
    goto LABEL_105;
  v16 = v15;
  v93 = a6;
  v90 = v14;
  if ((unint64_t)objc_msgSend(v14, "concurrencyWidth") >= 2)
  {
    v17 = -[BWVideoDepthSampleBufferPropagator initWithVideoRequirements:cloneRequirements:]([BWVideoDepthSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:", objc_msgSend(v16, "outputVideoRequirements"), objc_msgSend(v16, "cloneVideoRequirements"));
    objc_msgSend(v16, "setPropagatable:", v17);

  }
  objc_msgSend(v13, "addObject:", v16);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v18 = (void *)objc_msgSend(v16, "inputVideoRequirements");
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
  if (v19)
  {
    v20 = v19;
    v95 = v13;
    v91 = a7;
    v21 = 0;
    v22 = 0;
    v23 = *(_QWORD *)v110;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v110 != v23)
          objc_enumerationMutation(v18);
        v25 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v25, "attachedMediaKey"), "isEqualToString:", CFSTR("refInput")))v22 = v25;
        if (objc_msgSend((id)objc_msgSend(v25, "attachedMediaKey"), "isEqualToString:", CFSTR("auxInput")))v21 = v25;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
    }
    while (v20);
    a7 = v91;
    v13 = v95;
    if (v22)
    {
      if (v21)
      {
        v26 = (void *)objc_msgSend((id)objc_msgSend(v16, "outputVideoRequirements"), "firstObject");
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v27 = (void *)objc_msgSend(v16, "outputVideoRequirements");
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v106;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v106 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v32, "attachedMediaKey"), "isEqualToString:", CFSTR("espressoOutput")))v26 = v32;
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
          }
          while (v29);
        }
        if (v26)
        {
          objc_msgSend(v90, "inputDimensions");
          objc_msgSend(v90, "inputDimensions");
          objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "width");
          objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "height");
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v102 = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke;
          v103 = &unk_1E4925550;
          v104 = v90;
          v33 = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke((uint64_t)v101, 2304, 1296, 4, 1111970369, (uint64_t)CFSTR("PrimaryFormat"), (uint64_t)&unk_1E4A01658);
          v87 = __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke((uint64_t)v101, 2304, 1296, 4, 1111970369, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)&unk_1E4A01658);
          v86 = (uint64_t)v102((uint64_t)v101, 2304, 1296, 4, 875704438, (uint64_t)CFSTR("PrimaryFormat"), (uint64_t)&unk_1E4A01658);
          v85 = (uint64_t)v102((uint64_t)v101, 2304, 1296, 4, 875704438, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)&unk_1E4A01658);
          v34 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](v33, "videoFormat"), "width");
          if (v34 >= 0)
            v35 = v34;
          else
            v35 = v34 + 1;
          v36 = v35 >> 1;
          v88 = v33;
          v37 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](v33, "videoFormat"), "height");
          if (v37 >= 0)
            v38 = v37;
          else
            v38 = v37 + 1;
          v39 = v38 >> 1;
          v40 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          v41 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "width");
          v42 = (double)v36;
          if (v41 > (double)v36)
            v42 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat", v42, v41), "width");
          -[BWVideoFormatRequirements setWidth:](v40, "setWidth:", (int)v42);
          v43 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat"), "height");
          v44 = (double)v39;
          if (v43 > (double)v39)
            v44 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v22, "videoFormat", v44, v43), "height");
          -[BWVideoFormatRequirements setHeight:](v40, "setHeight:", (int)v44);
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v40, "setBytesPerRowAlignment:", 64);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v40, "setSupportedPixelFormats:", &unk_1E4A01670);
          v122 = v40;
          v84 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1));
          v45 = objc_autorelease(-[BWRectificationInferenceProvider initWithRefInputRequirement:auxInputRequirement:refKeypointsInputRequirement:auxKeypointsInputRequirement:refOutputRequirement:auxOutputRequirement:opticalFlowOutputRequirement:originalRefRequirement:originalAuxRequirement:resourceProvider:configuration:]([BWRectificationInferenceProvider alloc], "initWithRefInputRequirement:auxInputRequirement:refKeypointsInputRequirement:auxKeypointsInputRequirement:refOutputRequirement:auxOutputRequirement:opticalFlowOutputRequirement:originalRefRequirement:originalAuxRequirement:resourceProvider:configuration:", v88, v87, v86, v85, v22, v21, objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", 0x1E49514B8, v84, objc_msgSend(v90, "concurrencyWidth"))), objc_autorelease(
                      -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_88)), -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("SynchronizedSlaveFrame"), CFSTR("SynchronizedSlaveFrame"), &__block_literal_global_88), v93, v90));
          if (v45)
          {
            v13 = v95;
            objc_msgSend(v95, "addObject:", v45);
            v46 = objc_autorelease(-[BWDerectificationInferenceProvider initWithInputRequirement:opticalFlowInputRequirement:outputRequirement:resourceProvider:configuration:]([BWDerectificationInferenceProvider alloc], "initWithInputRequirement:opticalFlowInputRequirement:outputRequirement:resourceProvider:configuration:", objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", CFSTR("espressoOutput"), objc_msgSend(v26, "videoFormat"), objc_msgSend(v90, "concurrencyWidth"))), objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", 0x1E49514B8, v84, objc_msgSend(v90, "concurrencyWidth"))), objc_autorelease(-[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:](
                          [BWInferenceVideoRequirement alloc],
                          "initWithAttachedMediaKey:videoFormat:",
                          CFSTR("Depth"),
                          objc_msgSend(v26, "videoFormat"))),
                      v93,
                      v90));
            a7 = v91;
            if (!v46)
            {
              fig_log_get_emitter();
              goto LABEL_96;
            }
LABEL_75:
            objc_msgSend(v13, "addObject:", v46);
            if (!a7)
              return v13;
            goto LABEL_97;
          }
          fig_log_get_emitter();
          goto LABEL_111;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_91;
      }
    }
  }
  fig_log_get_emitter();
LABEL_96:
  FigDebugAssert3();
  if (a7)
LABEL_97:
    *a7 = v113;
  return v13;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWVideoDepthInferenceAdapter;
  -[BWVideoDepthInferenceAdapter dealloc](&v2, sel_dealloc);
}

BWInferenceVideoRequirement *__104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BWInferenceVideoFormatRequirements *v14;
  BWInferenceVideoFormatRequirements *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", a2 / a4);
  -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", a3 / a4);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v14, "setBytesPerRowAlignment:", 64);
  v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1));
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v14, "setSupportedColorSpaceProperties:", a7);
  v16 = v14;
  return -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", a6, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1)), objc_msgSend(*(id *)(a1 + 32), "concurrencyWidth"));
}

uint64_t __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_95(uint64_t a1, uint64_t a2)
{
  return a2;
}

id __104__BWVideoDepthInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke_129(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", a2);
  v5 = *(int *)(a1 + 32);
  if (objc_msgSend(a2, "width") <= v5)
    v6 = objc_msgSend(a2, "width");
  else
    v6 = *(int *)(a1 + 32);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", v6);
  v7 = *(int *)(a1 + 36);
  if (objc_msgSend(a2, "height") <= v7)
    v8 = objc_msgSend(a2, "height");
  else
    v8 = *(int *)(a1 + 36);
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", v8);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", &unk_1E4A016E8);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A01700);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", 0);
  v10[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
}

@end

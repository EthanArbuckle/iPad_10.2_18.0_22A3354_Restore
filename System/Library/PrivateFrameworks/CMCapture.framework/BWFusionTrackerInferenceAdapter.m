@implementation BWFusionTrackerInferenceAdapter

- (id)_inferenceProvidersForTrackingOperation:(void *)a3 meanPixelCalculator:(void *)a4 inputVideoRequirement:(void *)a5 inOutOrderBufferRequirement:(void *)a6 configuration:(void *)a7 resourceProvider:
{
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;
  BWFusionTrackerEspressoInferenceProvider *v21;
  uint64_t v22;
  BWFusionTrackerEspressoInferenceProvider *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  BWInferenceVideoFormatRequirements *v33;
  double v34;
  double v35;
  BWFusionTrackerEspressoInferenceProvider *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  BWFusionTrackerInferencePropagator *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void **v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  BWInferenceVideoFormatRequirements *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  if (a5)
  {
    v12 = *a5;
    if (*a5)
      v13 = 0;
    else
      v13 = a5;
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  v14 = objc_msgSend(a7, "espressoContextForExecutionTarget:", 3);
  v48 = v13;
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a2 == 3)
  {
    v16 = (void *)objc_msgSend((id)getFTTapToBoxClass(), "networkDescriptor");
    v17 = objc_msgSend((id)objc_msgSend(v16, "inputImages"), "objectAtIndexedSubscript:", 1);
  }
  else
  {
    if (a2 == 2)
    {
      v15 = (void *)objc_msgSend((id)getFTCinematicTrackerClass(), "highPriorityInstanceNetworkDescriptor");
    }
    else
    {
      if (a2 != 1)
      {
        v18 = 0;
        v16 = 0;
        goto LABEL_16;
      }
      v15 = (void *)objc_msgSend((id)getFTCinematicTrackerClass(), "highPriorityExemplarNetworkDescriptor");
    }
    v16 = v15;
    v17 = objc_msgSend(v15, "onlyImageInput");
  }
  v18 = (void *)v17;
LABEL_16:
  v19 = -[BWInferenceFusionTrackerScalingProvider initWithInputRequirement:orderBufferRequirement:descriptor:resourceProvider:meanPixelCalculator:operation:]([BWInferenceFusionTrackerScalingProvider alloc], a4, v12, v18, a7, a3, a2);
  v20 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", objc_msgSend(v16, "name"), 1);
  v21 = [BWFusionTrackerEspressoInferenceProvider alloc];
  v22 = objc_msgSend(a6, "priority");
  LODWORD(v45) = 0;
  v23 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v21, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 150, v20, 0, v14, 3, v22, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a7, v45, 1);
  -[BWFusionTrackerEspressoInferenceProvider setOperation:](v23, "setOperation:", a2);
  v47 = v19;
  v24 = (void *)objc_msgSend((id)objc_msgSend(v19, "outputVideoRequirements"), "firstObject");
  v46 = -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v23, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", objc_msgSend(v18, "name"), objc_msgSend(v24, "attachedMediaKey"), objc_msgSend(v24, "videoFormat"));
  v50 = a2;
  if (a2 == 3)
  {
    v32 = (void *)objc_msgSend((id)objc_msgSend(v16, "inputImages"), "objectAtIndexedSubscript:", 0);
    v33 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    objc_msgSend(v32, "size");
    -[BWVideoFormatRequirements setWidth:](v33, "setWidth:", (unint64_t)v34);
    objc_msgSend(v32, "size");
    -[BWVideoFormatRequirements setHeight:](v33, "setHeight:", (unint64_t)v35);
    v61 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1));
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v33, "setBytesPerRowAlignment:", 64);
    v60 = v33;
    -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v23, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", objc_msgSend(v32, "name"), CFSTR("PrimaryFormat"), +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1)));
  }
  else if (a2 == 2)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v25 = (void *)objc_msgSend(v16, "inputReferences");
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v56 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v31 = objc_msgSend(v30, "destinationInputName");
          v62 = objc_msgSend(v30, "sourceOutputName");
          -[BWEspressoInferenceProvider bindEspressoInput:fromMetadataUsingKeys:](v23, "bindEspressoInput:fromMetadataUsingKeys:", v31, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v27);
    }
  }
  v36 = v23;
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = v16;
  v39 = (void *)objc_msgSend(v16, "outputNames");
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v52 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(v37, "setObject:forKeyedSubscript:", -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v36, "bindEspressoOutput:asMetadataUsingKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWInferenceFusionTrackerOutput_%@_%@"), objc_msgSend(v38, "name"), *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j))), *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v41);
  }
  if (v48)
    *v48 = -[BWEspressoInferenceProvider bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:](v36, "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v46, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_OrderingClone"), objc_msgSend(v46, "attachedMediaKey")));
  v44 = -[BWFusionTrackerInferencePropagator initWithInputVideoRequirement:outputTensorRequirements:operation:]([BWFusionTrackerInferencePropagator alloc], "initWithInputVideoRequirement:outputTensorRequirements:operation:", v46, v37, v50);

  -[BWEspressoInferenceProvider setPropagatable:](v36, "setPropagatable:", v44);
  objc_msgSend(v49, "addObject:", v47);

  objc_msgSend(v49, "addObject:", v36);
  return v49;
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BWInferenceLazyVideoRequirement *v28;
  BWInferenceLazyVideoRequirement *v29;
  BWInferenceFusionTrackerMeanPixelCalculator *v30;
  id v34;
  void *v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42[0] = objc_msgSend((id)getFTTapToBoxClass(), "networkDescriptor");
  v42[1] = objc_msgSend((id)getFTCinematicTrackerClass(), "highPriorityExemplarNetworkDescriptor");
  v42[2] = objc_msgSend((id)getFTCinematicTrackerClass(), "highPriorityInstanceNetworkDescriptor");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v39;
    v14 = 0x7FFFFFFFLL;
    v15 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v17, "inputImages"), "count") == 1)
          v18 = (void *)objc_msgSend(v17, "onlyImageInput");
        else
          v18 = (void *)objc_msgSend((id)objc_msgSend(v17, "inputImages"), "objectAtIndexedSubscript:", 0);
        v19 = v18;
        objc_msgSend(v18, "size");
        if (v20 < (double)v15)
        {
          objc_msgSend(v19, "size");
          v15 = (unint64_t)v21;
        }
        objc_msgSend(v19, "size");
        if (v22 < (double)v14)
        {
          objc_msgSend(v19, "size");
          v14 = (unint64_t)v23;
        }
        objc_msgSend(v19, "size");
        if (v24 > (double)v11)
        {
          objc_msgSend(v19, "size");
          v11 = (unint64_t)v25;
        }
        objc_msgSend(v19, "size");
        if (v26 > (double)v12)
        {
          objc_msgSend(v19, "size");
          v12 = (unint64_t)v27;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }
  else
  {
    v14 = 0x7FFFFFFFLL;
    v15 = 0x7FFFFFFFLL;
  }
  v28 = [BWInferenceLazyVideoRequirement alloc];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __107__BWFusionTrackerInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke;
  v37[3] = &__block_descriptor_48_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
  v37[4] = 4 * v15;
  v37[5] = 4 * v14;
  v29 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:](v28, "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), v37);
  v30 = -[BWInferenceFusionTrackerMeanPixelCalculator initWithCommandQueue:]([BWInferenceFusionTrackerMeanPixelCalculator alloc], "initWithCommandQueue:", objc_msgSend((id)objc_msgSend(a6, "defaultDeviceMetalContext"), "commandQueue"));
  v36 = 0;
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 3, 0, v29, &v36, a5, a6));
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 1, v30, v29, &v36, a5, a6));
  objc_msgSend(v34, "addObjectsFromArray:", -[BWFusionTrackerInferenceAdapter _inferenceProvidersForTrackingOperation:meanPixelCalculator:inputVideoRequirement:inOutOrderBufferRequirement:configuration:resourceProvider:](self, 2, v30, v29, 0, a5, a6));

  *a7 = 0;
  return v34;
}

id __107__BWFusionTrackerInferenceAdapter_inferenceProvidersForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v4;
  float v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", a2);
  v5 = (float)(unint64_t)objc_msgSend(a2, "width") / (float)*(unint64_t *)(a1 + 32);
  v6 = objc_msgSend(a2, "height");
  v7 = *(_QWORD *)(a1 + 40);
  if (v5 <= (float)((float)v6 / (float)v7))
    v5 = (float)v6 / (float)v7;
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(a2, "width") / v5));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(a2, "height") / v5));
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", &unk_1E4A00758);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", &unk_1E4A00770);
  -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v4, "setIncludesInvalidContent:", 0);
  v9[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
}

@end

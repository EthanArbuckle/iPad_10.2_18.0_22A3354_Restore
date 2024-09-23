@implementation BWEspressoInferenceAdapter

+ (uint64_t)espressoNetworkURLForPlatformedResourceBaseName:(int)a3 embedPlatformOrDeviceID:(int)a4 e5Bundle:
{
  const __CFString *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  BOOL v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  if (espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__onceToken == -1)
  {
    if (a3)
      goto LABEL_4;
LABEL_28:
    v19 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL;
    v20 = a4 == 0;
    goto LABEL_29;
  }
  dispatch_once(&espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__onceToken, &__block_literal_global_83);
  if (!a3)
    goto LABEL_28;
LABEL_4:
  v23 = a4;
  if (a4)
    v7 = CFSTR(".E5.espresso.bundle");
  else
    v7 = CFSTR(".espresso.net");
  v8 = &espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForV1;
  if (a4)
    v8 = &espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForE5;
  v24 = (void *)*v8;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks;
  v10 = objc_msgSend((id)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
  {
LABEL_24:
    if (FigCapturePlatformIdentifier() == 4)
    {
      v19 = (void *)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL;
      v20 = v23 == 0;
LABEL_29:
      if (v20)
        v21 = CFSTR("espresso.net");
      else
        v21 = CFSTR("E5.espresso.bundle");
      v22 = (void *)objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(a2, "stringByAppendingPathExtension:", v21), 0);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v22, "path")))return (uint64_t)v22;
      else
        return 0;
    }
    return 0;
  }
  v11 = v10;
  v12 = *(_QWORD *)v26;
LABEL_11:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v12)
      objc_enumerationMutation(v9);
    v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
    v15 = (void *)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E4928818);
    v16 = objc_msgSend(v15, "length");
    if (v16 != objc_msgSend(v14, "length"))
    {
      v17 = objc_msgSend(v15, "rangeOfString:options:", CFSTR("."), 4);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        v15 = (void *)objc_msgSend(v15, "substringToIndex:", v17);
      if (objc_msgSend(v15, "isEqualToString:", a2)
        && objc_msgSend(v24, "numberOfMatchesInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length")))
      {
        break;
      }
    }
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  if (!v14)
    goto LABEL_24;
  return objc_msgSend((id)espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL, "URLByAppendingPathComponent:isDirectory:", v14, 0);
}

- (id)inferenceProvidersForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10;
  uint64_t v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *VNProcessingDescriptorClass;
  void *v19;
  char isKindOfClass;
  int v21;
  void *v22;
  BWInferenceVideoFormatRequirements *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  BWEspressoInferenceProvider *v28;
  uint64_t v29;
  BWEspressoInferenceProvider *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  BWInferenceVideoFormatRequirements *v40;
  _QWORD v41[2];

  v10 = *(_QWORD *)&a4.var0;
  v11 = *(_QWORD *)&a3;
  v41[1] = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((_DWORD)v11 != 161)
  {
    v16 = -[BWEspressoInferenceAdapter inferenceProviderForType:version:configuration:resourceProvider:status:](self, "inferenceProviderForType:version:configuration:resourceProvider:status:", v11, v10 & 0xFFFFFFFFFFFFLL, a5, a6, a7);
    if (v16)
      objc_msgSend(v38, "addObject:", v16);
    return v38;
  }
  v39 = 0;
  v13 = objc_alloc((Class)getVNResourceVersionClass());
  if ((unsigned __int16)v10 == 2)
  {
    v14 = 4;
    v15 = 0;
  }
  else
  {
    v14 = 3;
    v15 = 1;
  }
  v17 = (id)objc_msgSend(v13, "initWithMajor:minor:micro:", v14, v15, 0);
  VNProcessingDescriptorClass = (void *)getVNProcessingDescriptorClass();
  v19 = (void *)objc_msgSend(VNProcessingDescriptorClass, "descriptorForIdentifier:version:error:", getVNInferenceNetworkIdentifierFaceprint(), v17, &v39);
  v37 = objc_msgSend(v19, "ANESpecificURL");
  if (!v37)
  {
    v21 = -31701;
    if (!a7)
      return v38;
    goto LABEL_19;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v21 = -31701;
  if (!a5 || (isKindOfClass & 1) == 0)
    goto LABEL_18;
  v36 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
  v22 = (void *)objc_msgSend(v19, "onlyInputImage");
  v23 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v23, "setWidth:", objc_msgSend(v22, "pixelWidth"));
  -[BWVideoFormatRequirements setHeight:](v23, "setHeight:", objc_msgSend(v22, "pixelHeight"));
  v35 = v22;
  v41[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v22, "pixelFormatType"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v23, "setBytesPerRowAlignment:", 64);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v23, "setDeviceOriented:", 1);
  v24 = objc_msgSend(a5, "maximumNumberOfFaces");
  v25 = (void *)objc_msgSend(v19, "faceprintOutput");
  v34 = objc_msgSend(v25, "storageByteCount");
  v33 = (void *)objc_msgSend(v19, "confidencesOutput");
  if (!v24)
  {
    v21 = 0;
LABEL_18:
    if (!a7)
      return v38;
LABEL_19:
    *a7 = v21;
    return v38;
  }
  v26 = 0;
  while (1)
  {
    -[BWInferenceVideoFormatRequirements setCropDescriptor:](v23, "setCropDescriptor:", -[BWInferenceVisionFaceObservationsCropDescriptor initWithFaceIndex:]([BWInferenceVisionFaceObservationsCropDescriptor alloc], "initWithFaceIndex:", v26));
    v40 = v23;
    v27 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1));
    v28 = [BWEspressoInferenceProvider alloc];
    v29 = objc_msgSend(a5, "priority");
    LODWORD(v32) = 0;
    v30 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v28, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 161, v37, 0, v36, 3, v29, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v32, 1);
    if (!-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v30, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", objc_msgSend(v35, "name"), CFSTR("PrimaryFormat"), v27))break;
    -[BWEspressoInferenceProvider setPropagatable:](v30, "setPropagatable:", -[BWEspressoInferenceFaceprintPropagator initWithFaceprintRequirement:faceprintSizeBytes:confidenceRequirement:maxFaces:faceIndex:]([BWEspressoInferenceFaceprintPropagator alloc], "initWithFaceprintRequirement:faceprintSizeBytes:confidenceRequirement:maxFaces:faceIndex:", -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v30, "bindEspressoOutput:asMetadataUsingKey:", objc_msgSend(v25, "name"), 0x1E49516F8), v34, -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v30, "bindEspressoOutput:asMetadataUsingKey:", objc_msgSend(v33, "name"), 0x1E4951718), v24, v26));
    objc_msgSend(v38, "addObject:", v30);
    if (v24 == ++v26)
    {
      v21 = 0;
      goto LABEL_15;
    }
  }
  v21 = -31711;
LABEL_15:
  if (a7)
    goto LABEL_19;
  return v38;
}

uint64_t __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "bindEspressoOutput:asMetadataUsingKeys:", a2, a3);
}

+ (id)locateNetworkFileFromFormat:(id)a3 defaultOverrideKey:(id)a4 version:(id)a5 e5Bundle:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = *(_QWORD *)&a5.var0;
  v8 = a3;
  v9 = objc_msgSend(a3, "containsString:", CFSTR("PLATFORM"), a4);
  if (!v9)
    goto LABEL_6;
  if (objc_msgSend(v8, "hasSuffix:", CFSTR(".PLATFORM")))
  {
    v10 = objc_msgSend(v8, "rangeOfString:", CFSTR(".PLATFORM"));
    v12 = v11;
    if (v10 == objc_msgSend(v8, "length") - 9 && v12 == 9)
    {
      v8 = (id)objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 9);
LABEL_6:
      v13 = (void *)objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MAJOR"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)v7), "description"));
      v14 = (void *)objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MINOR"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", WORD1(v7)), "description"));
      return (id)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, (void *)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PATCH"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", WORD2(v7)), "description")), v9, v6);
    }
  }
  return 0;
}

uint64_t __111__BWEspressoInferenceAdapter_espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle___block_invoke()
{
  int Variant;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[18];

  v18[16] = *MEMORY[0x1E0C80C00];
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__imagingNetworksBaseURL = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", CFSTR("/System/Library/ImagingNetworks/"));
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID = (uint64_t)(id)FigCapturePlatformIdentifierString();
  Variant = FigCapturePlatformGetVariant();
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID = (uint64_t)(id)FigCaptureGetModelSpecificName();
  v1 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/System/Library/ImagingNetworks/"), &v17);
  if (v2)
  {
    v3 = v2;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v8, "hasSuffix:", CFSTR(".net")) & 1) != 0
            || objc_msgSend(v8, "hasSuffix:", CFSTR(".bundle")))
          {
            objc_msgSend(v1, "addObject:", v8);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v5);
    }
  }
  if (objc_msgSend(v1, "count"))
    v9 = v1;
  else
    v9 = 0;
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__availableImagingNetworks = (uint64_t)(id)objc_msgSend(v9, "copy");
  v18[0] = 0;
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^.+(\\.|_)(%@|%@)(\\.|_).+$"), espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID, espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID);
  v11 = v10;
  if (Variant == 3)
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^.+(\\.|_)(%@G|%@)(\\.|_).+$"), espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformID, espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__deviceID);
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForV1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v10, 1, v18);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v11, 1, v18);
  espressoNetworkURLForPlatformedResourceBaseName_embedPlatformOrDeviceID_e5Bundle__platformRegExpForE5 = result;
  return result;
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v10;
  int v13;
  BWEspressoInferenceProvider *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  id v20;
  uint64_t v21;
  BWE5InferenceProvider *v22;
  id v23;
  id v24;
  uint64_t v25;
  BWEspressoInferenceProvider *v26;
  BWInferenceVideoFormatRequirements *v27;
  id v28;
  BWInferenceHumanPosePropagator *v29;
  uint64_t v30;
  uint64_t v31;
  BWEspressoInferenceProvider *v32;
  uint64_t v33;
  BWInferenceVideoFormatRequirements *v34;
  id v35;
  BWInferenceVideoFormatRequirements *v36;
  id v37;
  BWInferenceVideoFormatRequirements *v38;
  id v39;
  const __CFString *v40;
  const __CFString *v41;
  unsigned int v42;
  uint64_t v43;
  BWE5InferenceProvider *v44;
  uint64_t v45;
  uint64_t v46;
  char isKindOfClass;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BWEspressoInferenceProvider *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  BWInferenceVideoFormatRequirements *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  BWInferenceVideoFormatRequirements *v65;
  id v66;
  char v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  int v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  int v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int v87;
  uint64_t v88;
  BWEspressoInferenceProvider *v89;
  uint64_t v90;
  BWInferenceVideoFormatRequirements *v91;
  id v92;
  BWInferenceVideoFormatRequirements *v93;
  id v94;
  BWInferenceVideoFormatRequirements *v95;
  id v96;
  char v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  _BOOL4 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BWEspressoInferenceProvider *v105;
  uint64_t v106;
  BWInferenceVideoFormatRequirements *v107;
  id v108;
  BWInferenceVideoFormatRequirements *v109;
  BWEspressoInferenceProvider *v110;
  id v111;
  unsigned int v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  void *v117;
  BWEspressoInferenceProvider *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  const __CFString *v126;
  double v127;
  double v128;
  const __CFString *v129;
  unsigned int v130;
  uint64_t v131;
  BWE5InferenceProvider *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  BWEspressoInferenceProvider *v136;
  uint64_t v137;
  BWInferenceVideoFormatRequirements *v138;
  id v139;
  BWInferenceVideoFormatRequirements *v140;
  id v141;
  void *v142;
  int v143;
  const __CFString *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  BWE5InferenceProvider *v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  id v152;
  const __CFString *v153;
  void *v154;
  BWEspressoInferenceProvider *v155;
  uint64_t v156;
  BWInferenceVideoFormatRequirements *v157;
  id v158;
  uint64_t v159;
  BWInferenceVideoFormatRequirements *v160;
  id v161;
  uint64_t v162;
  __CFString *v163;
  BWInferenceVideoFormatRequirements *v164;
  uint64_t v165;
  BWEspressoInferenceProvider *v166;
  uint64_t v167;
  BWInferenceVideoFormatRequirements *v168;
  BWInferenceVideoFormatRequirements *v169;
  id v170;
  BWInferenceVideoFormatRequirements *v171;
  id v172;
  BWEspressoInferenceProvider *v173;
  uint64_t v174;
  BWInferenceVideoFormatRequirements *v175;
  id v176;
  id v177;
  BWInferenceVideoFormatRequirements *v178;
  id v179;
  char v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unsigned int v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  BWEspressoInferenceProvider *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  _BOOL4 v205;
  const __CFString *v206;
  uint64_t v207;
  BWEspressoInferenceProvider *v208;
  uint64_t v209;
  id v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  BWInferenceSampleBufferPropagator *v217;
  uint64_t v219;
  const __CFString *v220;
  void *v221;
  uint64_t v222;
  char v223;
  int *v224;
  _QWORD v225[2];
  uint64_t (*v226)(uint64_t, void *, uint64_t, int, uint64_t, uint64_t, uint64_t);
  void *v227;
  uint64_t v228;
  uint64_t v229;
  _QWORD v230[5];
  BWInferenceVideoFormatRequirements *v231;
  BWInferenceVideoFormatRequirements *v232;
  BWInferenceVideoFormatRequirements *v233;
  BWInferenceVideoFormatRequirements *v234;
  BWInferenceVideoFormatRequirements *v235;
  uint64_t v236;
  BWInferenceVideoFormatRequirements *v237;
  uint64_t v238;
  BWInferenceVideoFormatRequirements *v239;
  uint64_t v240;
  BWInferenceVideoFormatRequirements *v241;
  uint64_t v242;
  BWInferenceVideoFormatRequirements *v243;
  uint64_t v244;
  id v245;
  BWInferenceVideoFormatRequirements *v246;
  BWInferenceVideoFormatRequirements *v247;
  BWInferenceVideoFormatRequirements *v248;
  BWInferenceVideoFormatRequirements *v249;
  BWInferenceVideoFormatRequirements *v250;
  BWInferenceVideoFormatRequirements *v251;
  BWInferenceVideoFormatRequirements *v252;
  BWInferenceVideoFormatRequirements *v253;
  BWInferenceVideoFormatRequirements *v254;
  BWInferenceVideoFormatRequirements *v255;
  BWInferenceVideoFormatRequirements *v256;
  uint64_t v257;
  BWInferenceVideoFormatRequirements *v258;
  _QWORD v259[3];

  v10 = *(_QWORD *)&a4.var0;
  v259[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = 0;
  v15 = objc_msgSend((id)objc_opt_class(), "allowE5ForInferenceType:", *(_QWORD *)&a3);
  switch(a3)
  {
    case 'e':
      v224 = a7;
      if (self)
      {
        if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
          v16 = 3;
        else
          v16 = 1;
      }
      else
      {
        v16 = 0;
      }
      v17 = objc_msgSend(a6, "espressoContextForExecutionTarget:", v16);
      v18 = 0;
      if (self && (_DWORD)v16 == 3)
        v18 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", 3);
      v19 = (*((id (**)(uint64_t, uint64_t, uint64_t))BWInferenceSmartCameraNetworkForVersion + 2))((uint64_t)BWInferenceSmartCameraNetworkForVersion, v10 & 0xFFFFFFFFFFFFLL, v15);
      if (!v19)
        goto LABEL_200;
      v20 = v19;
      v21 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("BlurryInputBuffer"), CFSTR("FilteredInputBuffer"), 0);
      LODWORD(v219) = v18;
      if ((_DWORD)v15)
        v22 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:]([BWE5InferenceProvider alloc], "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 101, v20, 0, v17, v16, objc_msgSend(a5, "priority"), v21, a6, v219);
      else
        v22 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:]([BWEspressoInferenceProvider alloc], "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 101, v20, 0, v17, v16, objc_msgSend(a5, "priority"), v21, a6, v219, 1);
      v14 = (BWEspressoInferenceProvider *)v22;
      v151 = +[BWInferenceVideoFormatRequirements defaultEspressoFormatRequirementsWithWidth:height:](BWInferenceVideoFormatRequirements, "defaultEspressoFormatRequirementsWithWidth:height:", 256, 256);
      objc_msgSend(v151, "setVideoContentMode:", 1);
      objc_msgSend(v151, "setCropDescriptor:", +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", CFSTR("SmartCam")));
      v259[0] = v151;
      v152 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v259, 1));
      a7 = v224;
      if (!v152)
        goto LABEL_210;
      if ((v10 & 0xFFFC) != 0)
        v153 = CFSTR("image");
      else
        v153 = CFSTR("data");
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v153, CFSTR("PrimaryFormat"), v152);
      v154 = BWInferenceSmartCameraOutputs(v10);
      v230[0] = MEMORY[0x1E0C809B0];
      v230[1] = 3221225472;
      v230[2] = __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke;
      v230[3] = &unk_1E49241D0;
      v230[4] = v14;
      objc_msgSend(v154, "enumerateKeysAndObjectsUsingBlock:", v230);
      goto LABEL_195;
    case 'f':
      v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", CFSTR("personsegmentation-u8"), 1);
      if (!v14)
        goto LABEL_204;
      v101 = +[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported");
      if (v101)
        v102 = 3;
      else
        v102 = 1;
      if (v101)
        v103 = 1278226536;
      else
        v103 = 1278226534;
      v104 = objc_msgSend(a6, "espressoContextForExecutionTarget:", v102);
      v105 = [BWEspressoInferenceProvider alloc];
      v106 = objc_msgSend(a5, "priority");
      LODWORD(v219) = 0;
      v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v105, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 102, v14, 0, v104, v102, v106, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
      v107 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v107, "setWidth:", 512);
      -[BWVideoFormatRequirements setHeight:](v107, "setHeight:", 384);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v107, "setSupportedPixelFormats:", &unk_1E4A01280);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v107, "setBytesPerRowAlignment:", 64);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v107, "setDeviceOriented:", 0);
      v258 = v107;
      v108 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1));

      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("rgb_float__0"), CFSTR("PrimaryFormat"), v108);
      v109 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v109, "setWidth:", 512);
      -[BWVideoFormatRequirements setHeight:](v109, "setHeight:", 384);
      v257 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v103);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v109, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1));
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v109, "setBytesPerRowAlignment:", 64);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v109, "setDeviceOriented:", 0);
      v256 = v109;
      v66 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v256, 1));

      v40 = CFSTR("LowResPersonSegmentationMask");
      v41 = CFSTR("test__output_float__0");
      goto LABEL_58;
    case 'g':
      v30 = v10 & 0xFFFF00000000;
      if ((unsigned __int16)v10 == 1 && WORD1(v10) == 1 && !v30)
      {
        v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", CFSTR("rgbbasedpersonsegmentation-u8"), 1);
        if (!v14)
          goto LABEL_204;
        v31 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
        v32 = [BWEspressoInferenceProvider alloc];
        v33 = objc_msgSend(a5, "priority");
        LODWORD(v219) = 0;
        v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v32, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 103, v14, 0, v31, 3, v33, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
        v34 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v34, "setWidth:", 256);
        -[BWVideoFormatRequirements setHeight:](v34, "setHeight:", 256);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v34, "setSupportedPixelFormats:", &unk_1E4A01298);
        -[BWInferenceVideoFormatRequirements setDeviceOriented:](v34, "setDeviceOriented:", 1);
        v255 = v34;
        v35 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v255, 1));

        -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_2__0"), CFSTR("PrimaryFormat"), v35);
        v36 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v36, "setWidth:", 256);
        -[BWVideoFormatRequirements setHeight:](v36, "setHeight:", 256);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v36, "setSupportedPixelFormats:", &unk_1E4A012B0);
        -[BWInferenceVideoFormatRequirements setDeviceOriented:](v36, "setDeviceOriented:", 1);
        v254 = v36;
        v37 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v254, 1));

        -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("lambda_1__strided_slice__0"), 0x1E495AFF8, v37);
        v38 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v38, "setWidth:", 256);
        -[BWVideoFormatRequirements setHeight:](v38, "setHeight:", 256);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v38, "setSupportedPixelFormats:", &unk_1E4A012C8);
        -[BWInferenceVideoFormatRequirements setDeviceOriented:](v38, "setDeviceOriented:", 1);
        v253 = v38;
        v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v253, 1));

        v40 = CFSTR("RGBBasedPersonSegmentationMaskConfidence");
        v41 = CFSTR("lambda_2__strided_slice__0");
LABEL_118:
        v110 = v14;
        v111 = v39;
        goto LABEL_119;
      }
      v13 = 0;
      v14 = 0;
      if ((unsigned __int16)v10 == 1 && !WORD1(v10) && !v30)
      {
        v14 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", CFSTR("rgbbasedpersonsegmentation-30-u8"), 0);
        if (!v14)
          goto LABEL_204;
        v135 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 1);
        v136 = [BWEspressoInferenceProvider alloc];
        v137 = objc_msgSend(a5, "priority");
        LODWORD(v219) = 0;
        v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v136, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 103, v14, 0, v135, 1, v137, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
        v138 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v138, "setWidth:", 256);
        -[BWVideoFormatRequirements setHeight:](v138, "setHeight:", 256);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v138, "setSupportedPixelFormats:", &unk_1E4A012E0);
        -[BWInferenceVideoFormatRequirements setDeviceOriented:](v138, "setDeviceOriented:", 1);
        v252 = v138;
        v139 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v252, 1));

        -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_6"), CFSTR("PrimaryFormat"), v139);
        v140 = objc_alloc_init(BWInferenceVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v140, "setWidth:", 256);
        -[BWVideoFormatRequirements setHeight:](v140, "setHeight:", 256);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v140, "setSupportedPixelFormats:", &unk_1E4A012F8);
        -[BWInferenceVideoFormatRequirements setDeviceOriented:](v140, "setDeviceOriented:", 1);
        v251 = v140;
        v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v251, 1));

        v40 = CFSTR("RGBBasedPersonSegmentationMask");
        v41 = CFSTR("flow0_plussigmoid/Sigmoid");
        goto LABEL_118;
      }
      goto LABEL_196;
    case 'h':
      if (!+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        goto LABEL_203;
      v42 = (unsigned __int16)v10;
      if ((unsigned __int16)v10 < 3u)
      {
        v14 = 0;
        v13 = -31702;
        goto LABEL_196;
      }
      v14 = (BWEspressoInferenceProvider *)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("personsemantics-u8-v%u"), (unsigned __int16)v10), 1, v15);
      if (v14)
      {
        v43 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
        if ((_DWORD)v15)
        {
          v44 = [BWE5InferenceProvider alloc];
          v45 = objc_msgSend(a5, "priority");
          LODWORD(v219) = 0;
          v46 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v44, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 104, v14, 0, v43, 3, v45, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219);
        }
        else
        {
          v173 = [BWEspressoInferenceProvider alloc];
          v174 = objc_msgSend(a5, "priority");
          LODWORD(v219) = 0;
          v46 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v173, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 104, v14, 0, v43, 3, v174, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
        }
        v14 = (BWEspressoInferenceProvider *)v46;
        if (a5)
        {
          v175 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v175, "setWidth:", 512);
          -[BWVideoFormatRequirements setHeight:](v175, "setHeight:", 384);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v175, "setSupportedPixelFormats:", &unk_1E4A01358);
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v175, "setBytesPerRowAlignment:", 64);
          -[BWInferenceVideoFormatRequirements setDeviceOriented:](v175, "setDeviceOriented:", 0);
          if (objc_msgSend(a5, "appliesFinalCropRect"))
            v176 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:](BWInferenceFinalRectCropDescriptor, "finalCropRectDescriptorWithName:", CFSTR("PersonSemantics"));
          else
            v176 = 0;
          -[BWInferenceVideoFormatRequirements setCropDescriptor:](v175, "setCropDescriptor:", v176);
          v247 = v175;
          v177 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 1));

          v178 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v178, "setWidth:", 512);
          -[BWVideoFormatRequirements setHeight:](v178, "setHeight:", 384);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v178, "setSupportedPixelFormats:", &unk_1E4A01370);
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v178, "setBytesPerRowAlignment:", 64);
          -[BWInferenceVideoFormatRequirements setDeviceOriented:](v178, "setDeviceOriented:", 0);
          v246 = v178;
          v179 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v246, 1));

          v180 = objc_msgSend(a5, "enabledSemantics");
          v181 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v182 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("image:0"), CFSTR("PrimaryFormat"), v177);
          v183 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("person:0"), 0x1E49511B8, v179);
          if ((v180 & 1) != 0)
            objc_msgSend(v181, "addObject:", v183);
          v184 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("hair:0"), 0x1E49511D8, v179);
          if ((v180 & 2) != 0)
            objc_msgSend(v181, "addObject:", v184);
          v185 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("skin:0"), 0x1E4951218, v179);
          if ((v180 & 8) != 0)
            objc_msgSend(v181, "addObject:", v185);
          v186 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("teeth:0"), 0x1E4951238, v179);
          if ((v180 & 0x10) != 0)
            objc_msgSend(v181, "addObject:", v186);
          if (v42 < 4)
          {
            if ((v180 & 0xE0) == 0)
              goto LABEL_193;
          }
          else
          {
            v187 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("semantics-estimator/split_channels_1__2"), 0x1E49511F8, v179);
            if ((v180 & 4) != 0)
              objc_msgSend(v181, "addObject:", v187);
            v188 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("glasses:0"), 0x1E4951258, v179);
            if ((v180 & 0x20) != 0)
              objc_msgSend(v181, "addObject:", v188);
            v189 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("sky:0"), 0x1E4951278, v179);
            if ((v180 & 0x40) != 0)
              objc_msgSend(v181, "addObject:", v189);
            if (v42 >= 5)
            {
              v221 = (void *)v182;
              v190 = 1;
              do
              {
                v191 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("person_instances_%d:0"), v190);
                v192 = -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v191, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), 0x1E4951318, v190), v179);
                if (v180 < 0)
                  objc_msgSend(v181, "addObject:", v192);
                v190 = (v190 + 1);
              }
              while (v190 <= 4);
              v182 = (uint64_t)v221;
              v216 = -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v14, "bindEspressoOutput:asMetadataUsingKey:", CFSTR("person_instance_confidences:0"), 0x1E4951338);
              if (v180 < 0)
              {
                objc_msgSend(v221, "addObject:", v216);
                objc_msgSend(v221, "addObject:", -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v14, "bindEspressoOutput:asMetadataUsingKey:", CFSTR("person_instance_boxes:0"), 0x1E4951358));
              }
              else
              {
                -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v14, "bindEspressoOutput:asMetadataUsingKey:", CFSTR("person_instance_boxes:0"), 0x1E4951358);
              }
LABEL_193:
              v217 = [BWInferenceSampleBufferPropagator alloc];
              v29 = -[BWInferenceSampleBufferPropagator initWithVideoRequirements:cloneRequirements:metadataRequirements:](v217, "initWithVideoRequirements:cloneRequirements:metadataRequirements:", v181, MEMORY[0x1E0C9AA60], v182);
              -[BWEspressoInferenceProvider setPropagatable:](v14, "setPropagatable:", v29);
LABEL_194:

              goto LABEL_195;
            }
            if ((v180 & 0x80) == 0)
              goto LABEL_193;
          }
          v13 = -31782;
          goto LABEL_196;
        }
      }
      goto LABEL_204;
    case 'i':
      if (self)
        v112 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", 3);
      else
        v112 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v141 = a5;
      else
        v141 = 0;
      v142 = (void *)MEMORY[0x1E0CB3940];
      v143 = objc_msgSend(v141, "useLowFrameRateOptimizedNetwork");
      v144 = &stru_1E4928818;
      if (v143)
        v144 = CFSTR("-lowfps");
      v145 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, (void *)objc_msgSend(v142, "stringWithFormat:", CFSTR("personsemantics-preview%@"), v144), 1, v15);
      if (!v145)
        goto LABEL_203;
      v146 = v145;
      v147 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      if ((_DWORD)v15)
      {
        v148 = [BWE5InferenceProvider alloc];
        v149 = objc_msgSend(a5, "priority");
        LODWORD(v219) = v112;
        v150 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v148, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 105, v146, 0, v147, 3, v149, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219);
      }
      else
      {
        v155 = [BWEspressoInferenceProvider alloc];
        v156 = objc_msgSend(a5, "priority");
        LODWORD(v219) = v112;
        v150 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v155, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 105, v146, 0, v147, 3, v156, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
      }
      v14 = (BWEspressoInferenceProvider *)v150;
      v157 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v157, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v157, "setHeight:", 192);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v157, "setSupportedPixelFormats:", &unk_1E4A01310);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v157, "setDeviceOriented:", 0);
      -[BWInferenceVideoFormatRequirements setRotationDegrees:](v157, "setRotationDegrees:", objc_msgSend(v141, "inputRotationAngle"));
      if (objc_msgSend(v141, "cropColorInputToPrimaryCaptureRect"))
        -[BWInferenceVideoFormatRequirements setCropDescriptor:](v157, "setCropDescriptor:", objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor));
      v250 = v157;
      v158 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v250, 1));

      v159 = -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("image__Placeholder__0"), CFSTR("PrimaryFormat"), v158);
      if (objc_msgSend(v141, "propagateColorInput"))
        -[BWEspressoInferenceProvider bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:](v14, "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v159, 0x1E49513D8);
      v160 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v160, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v160, "setHeight:", 192);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v160, "setSupportedPixelFormats:", &unk_1E4A01328);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v160, "setDeviceOriented:", 0);
      v249 = v160;
      v161 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v249, 1));

      v162 = objc_msgSend(v141, "alternativeStreamingPersonSegmentationMaskKey");
      if (v162)
        v163 = (__CFString *)v162;
      else
        v163 = CFSTR("StreamingPersonSegmentationMask");
      -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("person:0"), v163, v161);
      v164 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v164, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v164, "setHeight:", 192);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v164, "setSupportedPixelFormats:", &unk_1E4A01340);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v164, "setDeviceOriented:", 0);
      v248 = v164;
      v39 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v248, 1));

      v165 = objc_msgSend(v141, "alternativeStreamingSkinSegmentationMaskKey");
      if (v165)
        v40 = (const __CFString *)v165;
      else
        v40 = CFSTR("StreamingSkinSegmentationMask");
      v41 = CFSTR("skin:0");
      goto LABEL_118;
    case 'j':
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v14 = 0;
      v13 = -31701;
      if (!a5)
        goto LABEL_196;
      if ((isKindOfClass & 1) == 0)
        goto LABEL_196;
      v48 = objc_msgSend(a5, "depthPrioritization");
      v49 = (id)objc_msgSend(objc_alloc((Class)getADMonocularPipelineParametersClass()), "init");
      v50 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADMonocularPipelineClass()), "initWithInputPrioritization:andParameters:", v48, v49), "inferenceDescriptor");
      v14 = (BWEspressoInferenceProvider *)objc_msgSend(v50, "networkURL");
      if (!v14)
        goto LABEL_196;
      v51 = objc_msgSend(v50, "configurationNameForLayout:", 1);
      if (!v51)
      {
        v14 = 0;
        v13 = -31710;
        goto LABEL_196;
      }
      v52 = v51;
      v53 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      v54 = [BWEspressoInferenceProvider alloc];
      v55 = objc_msgSend(a5, "priority");
      LODWORD(v219) = 0;
      v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v54, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 106, v14, v52, v53, 3, v55, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v50, "colorInput"), "imageDescriptor"), "sizeForLayout:", 1);
      v57 = v56;
      v59 = v58;
      v60 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v60, "setWidth:", (unint64_t)v57);
      -[BWVideoFormatRequirements setHeight:](v60, "setHeight:", (unint64_t)v59);
      v244 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v50, "colorInput"), "imageDescriptor"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v60, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 1));
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v60, "setDeviceOriented:", 0);
      v243 = v60;
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", objc_msgSend((id)objc_msgSend(v50, "colorInput"), "name"), CFSTR("PrimaryFormat"), +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v243, 1)));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v50, "depthOutput"), "imageDescriptor"), "sizeForLayout:", 1);
      v62 = v61;
      v64 = v63;
      v65 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v65, "setWidth:", (unint64_t)v62);
      -[BWVideoFormatRequirements setHeight:](v65, "setHeight:", (unint64_t)v64);
      v242 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v50, "depthOutput"), "imageDescriptor"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v65, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 1));
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v65, "setDeviceOriented:", 0);
      v241 = v65;
      v66 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v241, 1));

      v41 = (const __CFString *)objc_msgSend((id)objc_msgSend(v50, "depthOutput"), "name");
      v40 = CFSTR("Depth");
LABEL_58:
      v110 = v14;
      v111 = v66;
LABEL_119:
      -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v110, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v41, v40, v111);
      goto LABEL_195;
    case 'k':
    case 'n':
    case 'p':
    case 'q':
    case 'r':
    case 's':
    case 'u':
      goto LABEL_196;
    case 'l':
      objc_opt_class();
      v67 = objc_opt_isKindOfClass();
      v14 = 0;
      v13 = -31701;
      if (!a5 || (v67 & 1) == 0)
        goto LABEL_196;
      if (!+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        goto LABEL_164;
      v224 = a7;
      v68 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoPipelineClass()), "initWithInputAlignment:andPrioritization:", (int)objc_msgSend(a5, "fsdNetStereoImagesAlignment"), objc_msgSend(a5, "disparityPrioritization")), "inferenceDescriptor");
      v69 = objc_msgSend(v68, "networkURL");
      if (v69)
      {
        v70 = v69;
        v71 = objc_msgSend((id)objc_msgSend(v68, "referenceInput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "referenceInput"), "imageDescriptor"), "sizeForLayout:", 255);
        v73 = v72;
        v75 = v74;
        v76 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "referenceInput"), "imageDescriptor"), "pixelFormat");
        v77 = objc_msgSend((id)objc_msgSend(v68, "auxiliaryInput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "auxiliaryInput"), "imageDescriptor"), "sizeForLayout:", 255);
        v79 = v78;
        v81 = v80;
        v82 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "auxiliaryInput"), "imageDescriptor"), "pixelFormat");
        v222 = objc_msgSend((id)objc_msgSend(v68, "disparityOutput"), "name");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", 255);
        v84 = v83;
        v86 = v85;
        v87 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "disparityOutput"), "imageDescriptor"), "pixelFormat");
        v14 = 0;
        v13 = -31711;
        if (v76 == 1380411457 && v82 == 1380411457)
        {
          a7 = v224;
          if (v87 != 1751411059)
            goto LABEL_196;
          v88 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
          v89 = [BWEspressoInferenceProvider alloc];
          v90 = objc_msgSend(a5, "priority");
          LODWORD(v219) = 0;
          v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v89, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 108, v70, 0, v88, 3, v90, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
          v91 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v91, "setWidth:", (unint64_t)v73);
          -[BWVideoFormatRequirements setHeight:](v91, "setHeight:", (unint64_t)v75);
          v240 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1380411457);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v91, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v240, 1));
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v91, "setBytesPerRowAlignment:", 64);
          -[BWInferenceVideoFormatRequirements setDeviceOriented:](v91, "setDeviceOriented:", 0);
          v239 = v91;
          v92 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v239, 1));

          v93 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v93, "setWidth:", (unint64_t)v79);
          -[BWVideoFormatRequirements setHeight:](v93, "setHeight:", (unint64_t)v81);
          v238 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1380411457);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v93, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v238, 1));
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v93, "setBytesPerRowAlignment:", 64);
          -[BWInferenceVideoFormatRequirements setDeviceOriented:](v93, "setDeviceOriented:", 0);
          v237 = v93;
          v94 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v237, 1));

          v95 = objc_alloc_init(BWInferenceVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v95, "setWidth:", (unint64_t)v84);
          -[BWVideoFormatRequirements setHeight:](v95, "setHeight:", (unint64_t)v86);
          v236 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751411059);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v95, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v236, 1));
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v95, "setBytesPerRowAlignment:", 64);
          -[BWInferenceVideoFormatRequirements setDeviceOriented:](v95, "setDeviceOriented:", 0);
          v235 = v95;
          v96 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v235, 1));

          if (-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v71, 0x1E4951378, v92))
          {
            v13 = -31711;
            if (-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v77, 0x1E4951398, v94))
            {
              if (-[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v222, 0x1E49513B8, v96))
              {
                v13 = 0;
              }
              else
              {
                v13 = -31711;
              }
            }
          }
          else
          {
            v13 = -31711;
          }
        }
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_44;
    case 'm':
      objc_opt_class();
      v97 = objc_opt_isKindOfClass();
      v14 = 0;
      v13 = -31701;
      if (!a5 || (v97 & 1) == 0)
        goto LABEL_196;
      v98 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      v99 = objc_msgSend(a5, "videoDepthLayout");
      if (v99 == 1)
      {
        v100 = 1;
      }
      else
      {
        if (v99)
          goto LABEL_164;
        v100 = 3;
      }
      v193 = objc_msgSend(a5, "videoDepthAlgorithm");
      if (v193 <= 3)
      {
        v194 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADPCEDisparityColorPipelineClass()), "initForInputSource:metalDevice:", qword_1A32B19C8[v193], 0), "inferenceDescriptor");
        v195 = objc_msgSend(v194, "networkURL");
        v196 = objc_msgSend(v194, "configurationNameForLayout:", v100);
        v197 = objc_msgSend(a5, "concurrencyWidth") + 1;
        v198 = [BWEspressoInferenceProvider alloc];
        v199 = objc_msgSend(a5, "priority");
        LODWORD(v219) = 0;
        v200 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v198, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 109, v195, v196, v98, 3, v199, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, v197);
        v14 = (BWEspressoInferenceProvider *)v200;
        if (!v195)
          goto LABEL_204;
        v225[0] = MEMORY[0x1E0C809B0];
        v225[1] = 3221225472;
        v226 = __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_156;
        v227 = &unk_1E49241F8;
        v228 = v200;
        v229 = v100;
        if (__101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_156((uint64_t)v225, (void *)objc_msgSend(v194, "disparityInput"), 1751411059, 1, 0x1E49514D8, 0, 0))
        {
          if (__101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_156((uint64_t)v225, (void *)objc_msgSend(v194, "prevDisparityInput"), 1751411059, 1, 0x1E4951498, 0, 0))
          {
            v201 = objc_msgSend(v194, "colorInput");
            if (v226((uint64_t)v225, (void *)v201, 1111970369, 1, 0x1E49515B8, 0, (uint64_t)&unk_1E4A013A0))
            {
              v202 = objc_msgSend(v194, "disparityOutput");
              if (v226((uint64_t)v225, (void *)v202, 1751411059, 0, 0x1E49514F8, 0x1E4951598, 0))
              {
                v203 = objc_msgSend(v194, "prevFeaturesInput");
                v13 = -31711;
                if (v226((uint64_t)v225, (void *)v203, 1278226536, 1, 0x1E49515D8, 0, 0))
                {
                  v204 = objc_msgSend(v194, "featuresOutput");
                  v121 = v226((uint64_t)v225, (void *)v204, 1278226536, 0, 0x1E49515F8, 0, 0);
LABEL_161:
                  if (v121)
                    v13 = 0;
                  else
                    v13 = -31711;
                }
                goto LABEL_196;
              }
            }
          }
        }
LABEL_210:
        v13 = -31711;
        goto LABEL_196;
      }
LABEL_164:
      v14 = 0;
      goto LABEL_196;
    case 'o':
      objc_opt_class();
      v113 = objc_opt_isKindOfClass();
      v14 = 0;
      v13 = -31701;
      if (!a5 || (v113 & 1) == 0)
        goto LABEL_196;
      v114 = objc_msgSend(a5, "concurrencyWidth") + 1;
      v115 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      v116 = (id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineParametersClass()), "init");
      v117 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineClass()), "initWithParameters:", v116), "inferenceDescriptor");
      v118 = [BWEspressoInferenceProvider alloc];
      v119 = objc_msgSend(v117, "networkURL");
      v120 = objc_msgSend(a5, "priority");
      LODWORD(v219) = 0;
      v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v118, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 109, v119, 0, v115, 3, v120, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, v114);
      if (!bweia_addRequirement((void *)objc_msgSend(v117, "referenceInput"), (uint64_t)CFSTR("refInput"), (uint64_t)&unk_1E4A01388, v14, objc_msgSend(a5, "concurrencyWidth"))|| !bweia_addRequirement((void *)objc_msgSend(v117, "auxiliaryInput"), (uint64_t)CFSTR("auxInput"), (uint64_t)&unk_1E4A01388, v14, objc_msgSend(a5, "concurrencyWidth"))|| !bweia_addRequirement((void *)objc_msgSend(v117, "prevColorFeaturesInput"), (uint64_t)CFSTR("colorFeaturesIn"), 0, v14, 1)|| !bweia_addRequirement((void *)objc_msgSend(v117, "colorFeaturesOutput"),
              (uint64_t)CFSTR("colorFeaturesOut"),
              0,
              v14,
              1)
        || !bweia_addRequirement((void *)objc_msgSend(v117, "prevDepthFeaturesInput"), (uint64_t)CFSTR("depthFeaturesIn"), 0, v14, 1)|| !bweia_addRequirement((void *)objc_msgSend(v117, "depthFeaturesOutput"), (uint64_t)CFSTR("depthFeaturesOut"), 0, v14, 1)|| !bweia_addRequirement((void *)objc_msgSend(v117, "disparityOutput"), (uint64_t)CFSTR("espressoOutput"), 0, v14, objc_msgSend(a5, "concurrencyWidth")))
      {
        goto LABEL_210;
      }
      v13 = -31711;
      if (!bweia_addRequirement((void *)objc_msgSend(v117, "temporalSmoothingCurrentFeaturesRatioMinInput"), (uint64_t)CFSTR("currentFeaturesMin"), 0, v14, 1))goto LABEL_196;
      v121 = bweia_addRequirement((void *)objc_msgSend(v117, "temporalSmoothingPreviousFeaturesRatioMinInput"), (uint64_t)CFSTR("previousFeaturesMin"), 0, v14, 1);
      goto LABEL_161;
    case 't':
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v224 = a7;
        if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        {
          v122 = (unsigned __int16)objc_msgSend(a5, "version");
          if (v122 != (unsigned __int16)v10
            || (v123 = objc_msgSend(a5, "version"), v124 = HIWORD(v123), HIWORD(v123) != WORD1(v10))
            || (v125 = v123, (unsigned __int16)((unint64_t)objc_msgSend(a5, "version") >> 32) != WORD2(v10)))
          {
            v14 = 0;
            v13 = 0;
LABEL_44:
            a7 = v224;
            goto LABEL_196;
          }
          v14 = (BWEspressoInferenceProvider *)(*((id (**)(uint64_t, uint64_t, uint64_t))BWInferenceTextLocalizationNetworkForVersion
                                                + 2))((uint64_t)BWInferenceTextLocalizationNetworkForVersion, v10 & 0xFFFFFFFFFFFFLL, v15);
          if (v14)
          {
            if (v122 == 1 && v125 < 0x10000)
            {
              v220 = 0;
              v126 = 0;
              v223 = 1;
              v127 = 384.0;
              v128 = 512.0;
              v129 = CFSTR("image");
              if (self)
              {
LABEL_81:
                v130 = +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:](BWInferenceEngine, "allowedBufferCompressionDirectionForExecutionTarget:", 3);
LABEL_180:
                v207 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
                v208 = [BWEspressoInferenceProvider alloc];
                v209 = objc_msgSend(a5, "priority");
                LODWORD(v219) = v130;
                v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v208, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 116, v14, 0, v207, 3, v209, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
                v210 = +[BWInferenceVideoFormatRequirements defaultEspressoFormatRequirementsWithWidth:height:](BWInferenceVideoFormatRequirements, "defaultEspressoFormatRequirementsWithWidth:height:", (uint64_t)v128, (uint64_t)v127);
                objc_msgSend(v210, "setVideoContentMode:", 0);
                objc_msgSend(v210, "setCropDescriptor:", objc_alloc_init(BWInferencePrimaryCaptureRectDescriptor));
                if (objc_msgSend(a5, "inferenceInputUsesPortraitOrientation"))
                  objc_msgSend(v210, "setRotationDegrees:", 90);
                objc_msgSend(v210, "setDeviceOriented:", 0);
                v245 = v210;
                v211 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v245, 1));
                a7 = v224;
                if (v211)
                {
                  -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v129, CFSTR("PrimaryFormat"), v211);
                  v212 = -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKeys:](v14, "bindEspressoOutput:asMetadataUsingKeys:", CFSTR("pred_boxes"), 0);
                  v213 = -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKeys:](v14, "bindEspressoOutput:asMetadataUsingKeys:", CFSTR("scores"), 0);
                  if (v126)
                    v214 = -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKeys:](v14, "bindEspressoOutput:asMetadataUsingKeys:", v126, 0);
                  else
                    v214 = 0;
                  if ((v223 & 1) != 0)
                    v215 = 0;
                  else
                    v215 = -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKeys:](v14, "bindEspressoOutput:asMetadataUsingKeys:", v220, 0);
                  -[BWEspressoInferenceProvider setPropagatable:](v14, "setPropagatable:", -[BWEspressoInferenceBoundingBoxPropagator initWithBoxRequirement:scoreRequirement:angularOffsetRequirement:fontSizeRequirement:configuration:toInferenceResultKey:]([BWEspressoInferenceBoundingBoxPropagator alloc], "initWithBoxRequirement:scoreRequirement:angularOffsetRequirement:fontSizeRequirement:configuration:toInferenceResultKey:", v212, v213, v214, v215, a5, 0x1E4951198));
LABEL_195:
                  v13 = 0;
                  goto LABEL_196;
                }
                fig_log_get_emitter();
                FigDebugAssert3();
                goto LABEL_210;
              }
            }
            else
            {
              if (v122 > 1 || v122 == 1 && (v124 == 3 || v125 >= 0x50000))
                v126 = CFSTR("P3rotation");
              else
                v126 = 0;
              v205 = v122 == 1;
              if ((v125 & 0xFFFC0000) == 0)
                v205 = 0;
              if (v122 > 1)
                v205 = 1;
              v223 = !v205;
              if (v205)
                v206 = CFSTR("P3font_size");
              else
                v206 = 0;
              v220 = v206;
              v129 = CFSTR("input_image");
              v127 = 448.0;
              v128 = 608.0;
              if (self)
                goto LABEL_81;
            }
            v130 = 0;
            goto LABEL_180;
          }
        }
        else
        {
LABEL_200:
          v14 = 0;
        }
        v13 = -31701;
        goto LABEL_44;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_203:
      v14 = 0;
LABEL_204:
      v13 = -31701;
LABEL_196:
      if (a7)
        *a7 = v13;
      return v14;
    case 'v':
      if (!+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        goto LABEL_203;
      v14 = (BWEspressoInferenceProvider *)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, CFSTR("anst_refiner256-v1.1"), 1, v15);
      if (!v14)
        goto LABEL_204;
      v131 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      if ((_DWORD)v15)
      {
        v132 = [BWE5InferenceProvider alloc];
        v133 = objc_msgSend(a5, "priority");
        LODWORD(v219) = 0;
        v134 = -[BWE5InferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:](v132, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:", 118, v14, 0, v131, 3, v133, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219);
      }
      else
      {
        v166 = [BWEspressoInferenceProvider alloc];
        v167 = objc_msgSend(a5, "priority");
        LODWORD(v219) = 0;
        v134 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v166, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 118, v14, 0, v131, 3, v167, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
      }
      v14 = (BWEspressoInferenceProvider *)v134;
      v168 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v168, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v168, "setHeight:", 192);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v168, "setSupportedPixelFormats:", &unk_1E4A013D0);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v168, "setBytesPerRowAlignment:", 64);
      -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v168, "setIncludesInvalidContent:", 1);
      v233 = v168;
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_image"), CFSTR("PrimaryFormat"), +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v233, 1)));
      v169 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v169, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v169, "setHeight:", 192);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v169, "setSupportedPixelFormats:", &unk_1E4A013E8);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v169, "setBytesPerRowAlignment:", 64);
      v232 = v169;
      v170 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v232, 1));
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_mask_person"), 0x1E4951738, v170);
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_mask_hair"), 0x1E4951758, v170);
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input_mask_skin"), 0x1E4951778, v170);
      -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("last_mask"), 0x1E4951738, v170);
      v171 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v171, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v171, "setHeight:", 192);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v169, "setBytesPerRowAlignment:", 64);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v171, "setSupportedPixelFormats:", &unk_1E4A01400);
      v231 = v171;
      v172 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 1));
      -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("person@output"), 0x1E4951798, v172);
      -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("hair@output"), 0x1E49517B8, v172);
      -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", CFSTR("skin@output"), 0x1E49517D8, v172);

      goto LABEL_195;
    default:
      if (a3 != 151)
        goto LABEL_196;
      if (!+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
        goto LABEL_203;
      v23 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", CFSTR("vcp_human_pose_lite_v2"), 1);
      if (!v23)
        goto LABEL_203;
      v24 = v23;
      v25 = objc_msgSend(a6, "espressoContextForExecutionTarget:", 3);
      v26 = [BWEspressoInferenceProvider alloc];
      LODWORD(v219) = 0;
      v14 = -[BWEspressoInferenceProvider initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:](v26, "initWithType:networkURL:networkConfiguration:context:executionTarget:schedulerPriority:preventionReasons:resourceProvider:allowedCompressionDirection:concurrentSubmissionLimit:", 151, v24, CFSTR("res_256x160"), v25, 3, 0, objc_msgSend(MEMORY[0x1E0C99E60], "set"), a6, v219, 1);
      v27 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v27, "setWidth:", 256);
      -[BWVideoFormatRequirements setHeight:](v27, "setHeight:", 160);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", &unk_1E4A013B8);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v27, "setBytesPerRowAlignment:", 64);
      -[BWInferenceVideoFormatRequirements setDeviceOriented:](v27, "setDeviceOriented:", 0);
      v234 = v27;
      v28 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v234, 1));

      if (!-[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:](v14, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", CFSTR("input"), CFSTR("PrimaryFormat"), v28))goto LABEL_210;
      v29 = -[BWInferenceHumanPosePropagator initWithOutputRequirement:]([BWInferenceHumanPosePropagator alloc], "initWithOutputRequirement:", -[BWEspressoInferenceProvider bindEspressoOutput:asMetadataUsingKey:](v14, "bindEspressoOutput:asMetadataUsingKey:", CFSTR("output"), 0x1E4951578));
      -[BWEspressoInferenceProvider setPropagatable:](v14, "setPropagatable:", v29);
      -[BWEspressoInferenceProvider setTensorMemoryProvider:](v14, "setTensorMemoryProvider:", v29);
      goto LABEL_194;
  }
}

+ (BOOL)allowE5ForInferenceType:(int)a3
{
  return ((a3 - 101) < 5) & (0x19u >> (a3 - 101));
}

+ (void)initialize
{
  objc_opt_class();
}

uint64_t __101__BWEspressoInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke_156(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BWInferenceVideoFormatRequirements *v21;
  id v22;
  void *v23;
  uint64_t v24;
  BWInferenceVideoFormatRequirements *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v14 = objc_msgSend((id)objc_msgSend(a2, "imageDescriptor"), "pixelFormat");
  v15 = objc_msgSend(a2, "name");
  if (v14 != (_DWORD)a3)
    return 0;
  v16 = v15;
  objc_msgSend((id)objc_msgSend(a2, "imageDescriptor"), "sizeForLayout:", *(_QWORD *)(a1 + 40));
  v18 = v17;
  v20 = v19;
  v21 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v21, "setWidth:", (unint64_t)v18);
  -[BWVideoFormatRequirements setHeight:](v21, "setHeight:", (unint64_t)v20);
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1));
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v21, "setSupportedColorSpaceProperties:", a7);
  -[BWInferenceVideoFormatRequirements setDeviceOriented:](v21, "setDeviceOriented:", 0);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v21, "setBytesPerRowAlignment:", 64);
  v26 = v21;
  v22 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1));
  v23 = *(void **)(a1 + 32);
  v24 = a4
      ? objc_msgSend(v23, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:", v16, a5, v22)
      : objc_msgSend(v23, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:", v16, a5, v22);
  if (!v24)
    return 0;
  if (a6)
    objc_msgSend(*(id *)(a1 + 32), "bindOutputByCloningInputRequirement:toAttachedMediaUsingKey:", v24, a6);
  return 1;
}

+ (id)espressoNetworkURLForPlatformedResourceBaseName:(id)a3 embedPlatformOrDeviceID:(BOOL)a4
{
  return (id)+[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:e5Bundle:]((uint64_t)BWEspressoInferenceAdapter, a3, a4, 0);
}

+ ($2ACC23B9A21F50F5CC728381CA870116)findAvailableVersion:(id)a3 defaultOverrideKey:(id)a4 versionLocator:(id)a5 e5Bundle:(BOOL)a6
{
  unsigned __int16 v7;
  int v8;
  uint64_t v9;
  int v11;
  unsigned __int16 v12;

  if (!objc_msgSend(a3, "count"))
  {
    fig_log_get_emitter();
LABEL_7:
    FigDebugAssert3();
    v9 = 0;
    v8 = 0;
    v7 = 0;
    return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(v7, v8, v9);
  }
  v12 = 0;
  v11 = 0;
  if ((BWVersionMakeWithObject(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), &v11) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_7;
  }
  v7 = v11;
  v8 = HIWORD(v11);
  v9 = v12;
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(v7, v8, v9);
}

@end

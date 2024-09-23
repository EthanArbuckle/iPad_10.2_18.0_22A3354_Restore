@implementation ARKitUserDefaults

+ (id)defaultValues
{
  if (defaultValues_onceToken != -1)
    dispatch_once(&defaultValues_onceToken, &__block_literal_global_12);
  return (id)defaultValues_defaultValues;
}

void __34__ARKitUserDefaults_defaultValues__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[110];
  _QWORD v9[112];

  v9[110] = *MEMORY[0x1E0C80C00];
  v0 = MGGetBoolAnswer();
  v1 = MEMORY[0x1E0C9AAB0];
  v2 = MEMORY[0x1E0C9AAA0];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = MEMORY[0x1E0C9AAA0];
  v9[2] = CFSTR("3");
  v9[3] = &unk_1E66CB110;
  v9[4] = &unk_1E66CB110;
  v9[5] = MEMORY[0x1E0C9AAA0];
  v9[6] = MEMORY[0x1E0C9AAB0];
  v9[7] = MEMORY[0x1E0C9AAB0];
  v9[8] = MEMORY[0x1E0C9AAB0];
  v9[9] = MEMORY[0x1E0C9AAB0];
  v9[10] = &unk_1E66CB110;
  v9[11] = MEMORY[0x1E0C9AAB0];
  v9[12] = MEMORY[0x1E0C9AAB0];
  v9[13] = MEMORY[0x1E0C9AAB0];
  v9[14] = &unk_1E66CB128;
  v9[15] = MEMORY[0x1E0C9AAB0];
  v9[16] = MEMORY[0x1E0C9AAA0];
  v9[17] = MEMORY[0x1E0C9AAB0];
  v9[18] = &unk_1E66CF090;
  v9[19] = &unk_1E66CF0A0;
  v9[20] = &unk_1E66CB128;
  v9[21] = MEMORY[0x1E0C9AAA0];
  v9[22] = &unk_1E66CB140;
  v9[23] = MEMORY[0x1E0C9AAA0];
  v9[24] = MEMORY[0x1E0C9AAA0];
  v9[25] = MEMORY[0x1E0C9AAA0];
  v9[26] = MEMORY[0x1E0C9AAB0];
  v9[27] = MEMORY[0x1E0C9AAB0];
  v9[28] = &unk_1E66CB158;
  v9[29] = MEMORY[0x1E0C9AAA0];
  v9[30] = &unk_1E66CB110;
  v9[31] = CFSTR("System Default");
  v9[32] = MEMORY[0x1E0C9AAA0];
  v9[33] = MEMORY[0x1E0C9AAA0];
  v9[34] = MEMORY[0x1E0C9AAB0];
  v9[35] = CFSTR("2");
  v9[36] = MEMORY[0x1E0C9AAB0];
  v9[37] = MEMORY[0x1E0C9AAA0];
  v9[38] = MEMORY[0x1E0C9AAB0];
  v9[39] = MEMORY[0x1E0C9AAA0];
  v9[40] = MEMORY[0x1E0C9AAB0];
  v9[41] = MEMORY[0x1E0C9AAB0];
  v9[42] = MEMORY[0x1E0C9AAA0];
  v9[43] = MEMORY[0x1E0C9AAB0];
  v9[44] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0, CFSTR("com.apple.arkit.useCacheForUserDefaults"), CFSTR("com.apple.arkit.daemonMetrics.disableReporting"), CFSTR("com.apple.arkit.session.featurePointAccumulationCount"), CFSTR("com.apple.arkit.session.useIOKit"), CFSTR("com.apple.arkit.session.cameraPosition"), CFSTR("com.apple.arkit.imagesensor.attemptfailurerecovery"), CFSTR("com.apple.arkit.imagesensor.attemptfailurerecoveryafterbackground"), CFSTR("com.apple.arkit.imagesensor.back.ultrawide.enabled"), CFSTR("com.apple.arkit.imagesensor.back.wide.videoBinned"), CFSTR("com.apple.arkit.imagesensor.back.wide.smoothAutoFocus"), CFSTR("com.apple.arkit.imagesensor.back.wide.photoQualityPrioritization"), CFSTR("com.apple.arkit.imagesensor.front.videoBinned"), CFSTR("com.apple.arkit.imagesensor.face.mirror"), CFSTR("com.apple.arkit.imagesensor.face.previousImageDataOnDrop"), CFSTR("com.apple.arkit.imagesensor.back.ultrawide.frameRate"), CFSTR("com.apple.arkit.imagesensor.back.ultrawide.videoBinned"),
    CFSTR("com.apple.arkit.imagesensor.back.ultrawide.geometricDistortionCorrection"),
    CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.enabled"),
    CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.negativeExposureTargetOffsetThreshold"),
    CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.positiveExposureTargetOffsetThreshold"),
    CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.maxDroppedFramesCount"),
    CFSTR("com.apple.arkit.imagesensor.calibrationData.alwaysDiscardsLateData"),
    CFSTR("com.apple.arkit.motionSensor.sampleRate"),
    CFSTR("com.apple.arkit.motionSensor.magnetometerEnabled"),
    CFSTR("com.apple.arkit.recordingTechnique.recordPearlDepthData"),
    CFSTR("com.apple.arkit.replaySensor.deterministicMode"),
    CFSTR("com.apple.arkit.replaySensor.replayVisionData"),
    CFSTR("com.apple.arkit.planeEstimation.mlOnANEDevices"),
    CFSTR("com.apple.arkit.planeEstimation.normalsKernelSize"),
    CFSTR("com.apple.arkit.planeEstimation.enableLowQosScheduling"),
    CFSTR("com.apple.arkit.sceneReconstruction.bucketsCount"),
    CFSTR("com.apple.arkit.planeEstimation.detectionMethod"),
    CFSTR("com.apple.arkit.planeEstimation.enableInverseDepthDetector"),
    CFSTR("com.apple.arkit.planeEstimation.anchorRotation"),
    CFSTR("com.apple.arkit.worldtracking.lineFeatures"),
    CFSTR("com.apple.arkit.worldtracking.minVergenceAngle"),
    CFSTR("com.apple.arkit.worldtracking.poseGraphUpdates"),
    CFSTR("com.apple.arkit.worldtracking.fixedIntrinsics"),
    CFSTR("com.apple.arkit.worldTracking.visionData"),
    CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection"),
    CFSTR("com.apple.arkit.worldTracking.useLACCIfAvailable"),
    CFSTR("com.apple.arkit.worldTracking.collaborativeMappingStatistics"),
    CFSTR("com.apple.arkit.worldTracking.forceDisableFrontCamera"),
    CFSTR("com.apple.arkit.worldTracking.participantAnchors"),
    CFSTR("com.apple.arkit.worldTracking.warningSounds"),
    CFSTR("com.apple.arkit.worldTracking.mlRelocalizationMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[45] = v3;
  v9[46] = v1;
  v8[46] = CFSTR("com.apple.arkit.worldTracking.accuratePlaneExtentCheck");
  v8[47] = CFSTR("com.apple.arkit.worldTracking.newCV3DApis");
  v9[47] = v1;
  v9[48] = v2;
  v8[48] = CFSTR("com.apple.arkit.worldTracking.enableMLCMRelocalization");
  v8[49] = CFSTR("com.apple.arkit.worldtracking.transformToExternalSubmap");
  v9[49] = v1;
  v9[50] = v2;
  v8[50] = CFSTR("com.apple.arkit.worldtracking.enableTempMappingDirectory");
  v8[51] = CFSTR("com.apple.arkit.geotracking.useclfusion");
  v9[51] = v1;
  v9[52] = v2;
  v8[52] = CFSTR("com.apple.arkit.geotracking.usecmfusion");
  v8[53] = CFSTR("com.apple.arkit.geotracking.usegradualcorrection");
  v9[53] = v1;
  v9[54] = v2;
  v8[54] = CFSTR("com.apple.arkit.geotracking.useVLTraceRecorder");
  v8[55] = CFSTR("com.apple.arkit.geotracking.bypassChecksForANE");
  v8[56] = CFSTR("com.apple.arkit.geotracking.bypassChecksForGPS");
  v8[57] = CFSTR("com.apple.arkit.geotracking.visualLocalizationCallInterval");
  v8[58] = CFSTR("com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval");
  v8[59] = CFSTR("com.apple.arkit.geotracking.visualLocalizationCallIntervalTimeThreshold");
  v9[55] = v2;
  v9[56] = v2;
  v9[59] = &unk_1E66CB128;
  v9[60] = CFSTR("8");
  v9[57] = &unk_1E66CF0A0;
  v9[58] = &unk_1E66CB170;
  v8[60] = CFSTR("com.apple.arkit.imagedetection.percentageThresholdPixels");
  v8[61] = CFSTR("com.apple.arkit.imageDetection.fixedPriorityProcessingQueue");
  v9[61] = v2;
  v9[62] = CFSTR("2");
  v8[62] = CFSTR("com.apple.arkit.environmentTexturing.minimumProbeUpdateInterval");
  v8[63] = CFSTR("com.apple.arkit.environmentTexturing.wantsHDR");
  v8[64] = CFSTR("com.apple.arkit.environmentTexturing.maxHDR");
  v9[63] = v1;
  v9[64] = CFSTR("10");
  v8[65] = CFSTR("com.apple.arkit.matting.erosionRadius");
  v9[65] = &unk_1E66CB188;
  v8[66] = CFSTR("com.apple.arkit.matting.uncertaintyRadius");
  v9[66] = &unk_1E66CB188;
  v8[67] = CFSTR("com.apple.arkit.matting.epsilon");
  v9[67] = &unk_1E66CF0B0;
  v8[68] = CFSTR("com.apple.arkit.matting.disableSoftEdges");
  v9[68] = v2;
  v8[69] = CFSTR("com.apple.arkit.matting.depthScale");
  v9[69] = &unk_1E66CB170;
  v8[70] = CFSTR("com.apple.arkit.matting.dilationRadius");
  v9[70] = &unk_1E66CB1A0;
  v8[71] = CFSTR("com.apple.arkit.matting.doubleMLResolutionForIPad");
  v9[71] = v1;
  v8[72] = CFSTR("com.apple.arkit.matting.useTemporalSmoothing");
  v9[72] = v2;
  v8[73] = CFSTR("com.apple.arkit.view.rendersCameraGrain");
  v9[73] = v1;
  v8[74] = CFSTR("com.apple.arkit.view.rendersMotionBlur");
  v9[74] = v2;
  v8[75] = CFSTR("com.apple.arkit.test.default");
  v9[75] = CFSTR("test");
  v8[76] = CFSTR("com.apple.arkit.multicam_mode.enabled");
  v9[76] = v1;
  v8[77] = CFSTR("com.apple.arkit.sceneReconstruction.voxelSize");
  v9[77] = &unk_1E66CF0C0;
  v8[78] = CFSTR("com.apple.arkit.sceneReconstruction.waitTillVIOIsStable");
  v9[78] = v1;
  v8[79] = CFSTR("com.apple.arkit.sceneReconstruction.enableLowQosScheduling");
  v9[79] = v2;
  v8[80] = CFSTR("com.apple.arkit.objctdetection.regionProposalModel");
  v9[80] = v1;
  v8[81] = CFSTR("com.apple.arkit.jasper.enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[82] = CFSTR("com.apple.arkit.jasper.timeOfFlightProjectorMode");
  v9[82] = &unk_1E66CB1B8;
  v9[81] = v4;
  v8[83] = CFSTR("com.apple.arkit.jasper.aggregationBankCount");
  v9[83] = &unk_1E66CB110;
  v8[84] = CFSTR("com.apple.arkit.appleDepth.useExpFilter");
  v9[84] = v1;
  v8[85] = CFSTR("com.apple.arkit.appleDepth.averageDepthBoundingBox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v0 ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[85] = v5;
  v8[86] = CFSTR("com.apple.arkit.appleDepth.temporalSmoothingMethod");
  v9[86] = &unk_1E66CB170;
  v8[87] = CFSTR("com.apple.arkit.appleDepth.temporalFilteringStoredFrames");
  v9[87] = &unk_1E66CB188;
  v8[88] = CFSTR("com.apple.arkit.appleDepth.computeNormals");
  v9[88] = v2;
  v8[89] = CFSTR("com.apple.arkit.appleDepthSPI.bundleID.approvedList");
  v9[89] = MEMORY[0x1E0C9AA60];
  v8[90] = CFSTR("com.apple.arkit.bodytracking.multipleBodyAnchors");
  v9[90] = v2;
  v8[91] = CFSTR("com.apple.arkit.personocclusion.skipFrameWhenBusy");
  v9[91] = v1;
  v8[92] = CFSTR("com.apple.arkit.distortionCorrection.computeCoefficientsForEveryFrame");
  v9[92] = v2;
  v8[93] = CFSTR("com.apple.arkit.scaling.useOptimalMSRCoeficients");
  v8[94] = CFSTR("com.apple.arkit.bodytracking.extrapolationTimeLimitSeconds");
  v9[93] = v2;
  v9[94] = &unk_1E66CF0D0;
  v8[95] = CFSTR("com.apple.arkit.view.attemptRenderSynchronizationARFrame");
  v9[95] = v1;
  v8[96] = CFSTR("com.apple.arkit.view.renderRawSceneUnderstandingImage");
  v9[96] = v2;
  v8[97] = CFSTR("com.apple.arkit.session.configuration.saveDotGraph");
  v9[97] = v2;
  v8[98] = CFSTR("com.apple.arkit.bodytracking.pushProjected3DSkeleton");
  v9[98] = v2;
  v8[99] = CFSTR("com.apple.arkit.bodyTracking.useSupport3DSkeleton");
  v9[99] = v1;
  v8[100] = CFSTR("com.apple.arkit.personDetectionTechnique.mergeLargelyOverlappingBoundingBoxes");
  v9[100] = v1;
  v8[101] = CFSTR("com.apple.arkit.personOcclusion.optimizationStrategy");
  v9[101] = &unk_1E66CB188;
  v8[102] = CFSTR("com.apple.arkit.faceTracking.rgbOnly.enabled");
  v9[102] = v1;
  v8[103] = CFSTR("com.apple.arkit.semanticSegmentation.uncertaintyThreshold");
  v9[103] = &unk_1E66CF0E0;
  v8[104] = CFSTR("com.apple.arkit.slamManager.cv3dLoggingLevel.api");
  v9[104] = &unk_1E66CB1D0;
  v8[105] = CFSTR("com.apple.arkit.slamManager.cv3dLoggingLevel.internal");
  v9[105] = &unk_1E66CB1D0;
  v8[106] = CFSTR("com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.api");
  v9[106] = &unk_1E66CB170;
  v8[107] = CFSTR("com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.internal");
  v9[107] = &unk_1E66CB188;
  v8[108] = CFSTR("com.apple.arkit.appClipCodeTracking.performanceTestMode");
  v9[108] = &unk_1E66CB1E8;
  v8[109] = CFSTR("com.apple.arkit.server.maximumConcurrentServicesPerClient");
  v9[109] = &unk_1E66CB200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 110);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultValues_defaultValues;
  defaultValues_defaultValues = v6;

}

+ (id)userDefaultsCache
{
  if (userDefaultsCache_onceToken != -1)
    dispatch_once(&userDefaultsCache_onceToken, &__block_literal_global_46);
  return (id)userDefaultsCache_defaultsCache;
}

void __38__ARKitUserDefaults_userDefaultsCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)userDefaultsCache_defaultsCache;
  userDefaultsCache_defaultsCache = v0;

}

+ (BOOL)shouldUseCache
{
  if (shouldUseCache_onceToken != -1)
    dispatch_once(&shouldUseCache_onceToken, &__block_literal_global_47_0);
  return objc_msgSend((id)shouldUseCache_shouldUseCache, "BOOLValue");
}

void __35__ARKitUserDefaults_shouldUseCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ARKitUserDefaults objectForKeySlow:](ARKitUserDefaults, "objectForKeySlow:", CFSTR("com.apple.arkit.useCacheForUserDefaults"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldUseCache_shouldUseCache;
  shouldUseCache_shouldUseCache = v0;

}

+ (id)cachedObjectForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v3 = a3;
  +[ARKitUserDefaults userDefaultsCache](ARKitUserDefaults, "userDefaultsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = v3;
  objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v8, 8, 0, 1, 0, 0, objc_msgSend(v6, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

  return v5;
}

+ (void)removeCachedObjectForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  +[ARKitUserDefaults userDefaultsCache](ARKitUserDefaults, "userDefaultsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  objc_msgSend(v4, "removeObjectForKey:", v3);
  v6 = 0;
  v5 = v3;
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v6, 8, 0, 1, 0, 0, objc_msgSend(v5, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

}

+ (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  +[ARKitUserDefaults userDefaultsCache](ARKitUserDefaults, "userDefaultsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

  }
  v10 = 0;
  v9 = v6;
  objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v10, 8, 0, 1, 0, 0, objc_msgSend(v9, "length"), 0);

  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

}

+ (void)clearUserDefaultsCache
{
  id v2;

  +[ARKitUserDefaults userDefaultsCache](ARKitUserDefaults, "userDefaultsCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  kdebug_trace();
  objc_msgSend(v2, "removeAllObjects");
  kdebug_trace();
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);

}

+ (id)keysApprovedForProcessEnvironmentOverride
{
  if (keysApprovedForProcessEnvironmentOverride_onceToken != -1)
    dispatch_once(&keysApprovedForProcessEnvironmentOverride_onceToken, &__block_literal_global_50_0);
  return (id)keysApprovedForProcessEnvironmentOverride_approvedKeys;
}

void __62__ARKitUserDefaults_keysApprovedForProcessEnvironmentOverride__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.arkit.session.replay.filepath");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keysApprovedForProcessEnvironmentOverride_approvedKeys;
  keysApprovedForProcessEnvironmentOverride_approvedKeys = v0;

}

+ (void)removeAllKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomainARKitKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

+ (void)removeObjectForKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ARKitUserDefaults removeCachedObjectForKey:](ARKitUserDefaults, "removeCachedObjectForKey:", v3);
  objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (id)objectForKeySlow:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "keysApprovedForProcessEnvironmentOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (!v6)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(a1, "defaultValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

+ (id)objectForKey:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldUseCache")
    && (+[ARKitUserDefaults cachedObjectForKey:](ARKitUserDefaults, "cachedObjectForKey:", v3),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (id)v4;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v7 = 0;
    }
    else
    {
      v5 = v5;
      v7 = v5;
    }
  }
  else
  {
    +[ARKitUserDefaults objectForKeySlow:](ARKitUserDefaults, "objectForKeySlow:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARKitUserDefaults cacheObject:forKey:](ARKitUserDefaults, "cacheObject:forKey:", v7, v3);
    v5 = 0;
  }

  return v7;
}

+ (id)objectForKey:(id)a3 useCache:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v6, "objectForKey:", v5);
  else
    objc_msgSend(v6, "objectForKeySlow:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)valueForKey:(id)a3
{
  return +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ARKitUserDefaults removeCachedObjectForKey:](ARKitUserDefaults, "removeCachedObjectForKey:", v5);
  objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

+ (void)setValue:(id)a3 forKey:(id)a4
{
  +[ARKitUserDefaults setObject:forKey:](ARKitUserDefaults, "setObject:forKey:", a3, a4);
}

+ (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  char v5;

  +[ARKitUserDefaults objectForKey:useCache:](ARKitUserDefaults, "objectForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[ARKitUserDefaults setObject:forKey:](ARKitUserDefaults, "setObject:forKey:", v7, v6);

}

+ (id)stringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "stringValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)numberForKey:(id)a3
{
  void *v3;
  void *v4;

  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARKitUserDefaults _numberForObject:](ARKitUserDefaults, "_numberForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)numberForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  void *v5;

  +[ARKitUserDefaults objectForKey:useCache:](ARKitUserDefaults, "objectForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARKitUserDefaults _numberForObject:](ARKitUserDefaults, "_numberForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_numberForObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1E0CB3780];
      v6 = v3;
      objc_msgSend(v5, "decimalDigitCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addCharactersInString:", CFSTR("-."));
      objc_msgSend(v7, "invertedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v11, "setDecimalSeparator:", CFSTR("."));
      objc_msgSend(v11, "setNumberStyle:", 1);
      objc_msgSend(v11, "numberFromString:", v10);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  int64_t v5;

  +[ARKitUserDefaults numberForKey:useCache:](ARKitUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

+ (float)floatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

+ (float)floatForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  float v5;
  float v6;

  +[ARKitUserDefaults numberForKey:useCache:](ARKitUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (double)doubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4
{
  void *v4;
  double v5;
  double v6;

  +[ARKitUserDefaults numberForKey:useCache:](ARKitUserDefaults, "numberForKey:useCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

+ (id)listForKey:(id)a3
{
  void *v3;
  void *v4;

  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)resolutionDictionaryForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("x"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") != 2)
    {
      v11 = 0;
      goto LABEL_8;
    }
    v18[0] = CFSTR("width");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v5, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("height");
    v19[0] = v7;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v8, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v16[0] = CFSTR("width");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = v3;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("width"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    objc_msgSend(v12, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("height");
    v17[0] = v6;
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "floatValue");
    objc_msgSend(v14, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
LABEL_10:

  return v11;
}

+ (void)synchronize
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "appleGlobalDomain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

}

@end

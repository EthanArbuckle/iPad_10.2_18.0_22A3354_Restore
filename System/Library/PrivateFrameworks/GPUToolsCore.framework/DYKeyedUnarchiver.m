@implementation DYKeyedUnarchiver

+ (NSSet)allClassSet
{
  if (allClassSet_onceToken != -1)
    dispatch_once(&allClassSet_onceToken, &__block_literal_global_12);
  return (NSSet *)allClassSet__allClassSet;
}

uint64_t __32__DYKeyedUnarchiver_allClassSet__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  allClassSet__allClassSet = (uint64_t)v0;
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v1 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v3, 13);
  objc_msgSend(v0, "addObjectsFromArray:", v1, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLDeviceProfile"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYDeviceInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYContextInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYRendererInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLShaderProfilerResult"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYStaticResourcesInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLCommandQueueInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLCaptureScopeInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYCAMetalLayerInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYBreakpoint"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYStaticResourcesInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYIntKeyedDictionary"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYExperiment"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYExperimentOverrideEnable"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderDiassemlyInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderInlineBlockInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderBinaryRangeInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderPerLineSourceInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderAnalyzerResult"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderProfilerShaderInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderProfilerProgramInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderProfilerDrawCallInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYShaderProfilerResult"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("ShaderBinaryInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYAnalyzerFinding"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLResourceUsageItem"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYResource"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLResource"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLVertexAttributes"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLPatchAttributes"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLComputeAttributes"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLMeshAttributes"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLBuffer"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLFramebuffer"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLFramebufferAttachment"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLLibrary"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLFunctionSource"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLSamplerState"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLTexture"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLCounterSampleBuffer"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLResourceObject"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGuestAppArgument"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGuestAppEnvironment"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGuestApp"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorCase"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorCaseConfigData"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorRecommendationSection"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorRecommendation"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorRecommendationInfo"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorRecommendationItem"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorStatistics"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYOverviewMeasurementsPerSample"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorDisplayLink"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYInvestigatorConfig"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertFinding"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertEvidence"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertStageTiming"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLOverviewMeasurements"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertAnalyzerFindingWrapper"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertPhase"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertConclusion"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertConclusionEvidence"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertRationale"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYGLExpertRationaleTranslation"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_DeltaGen"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_FrameStatistics"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_Attachments"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_CommandBuffer"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_CoalesceEncoders"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_NextDrawablePass1"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_NextDrawablePass2"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_EmptyEncoder"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_Performance"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_ResourceUsage"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_Shader"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_ShaderProfiler"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_UnusedEncoderOutput"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYPMTLAnalyzerHeuristic_MemoryResourceFindings"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("GTTelemetryRecordObject"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("GTTelemetryLayerObject"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("GTTelemetryQueueObject"), allClassSet__allClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("GTTelemetryDeviceObject"), allClassSet__allClassSet);
  return +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("GTTelemetryStatistics"), allClassSet__allClassSet);
}

+ (NSSet)captureArchiveClassSet
{
  if (captureArchiveClassSet_onceToken != -1)
    dispatch_once(&captureArchiveClassSet_onceToken, &__block_literal_global_177);
  return (NSSet *)captureArchiveClassSet__captureArchiveClassSet;
}

uint64_t __43__DYKeyedUnarchiver_captureArchiveClassSet__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  captureArchiveClassSet__captureArchiveClassSet = (uint64_t)v0;
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v1 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v3, 11);
  objc_msgSend(v0, "addObjectsFromArray:", v1, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLDeviceProfile"), captureArchiveClassSet__captureArchiveClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYDeviceInfo"), captureArchiveClassSet__captureArchiveClassSet);
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYContextInfo"), captureArchiveClassSet__captureArchiveClassSet);
  return +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYRendererInfo"), captureArchiveClassSet__captureArchiveClassSet);
}

+ (NSSet)graphicsAPIInfosClassSet
{
  if (graphicsAPIInfosClassSet_onceToken != -1)
    dispatch_once(&graphicsAPIInfosClassSet_onceToken, &__block_literal_global_179);
  return (NSSet *)graphicsAPIInfosClassSet__graphicsAPIInfosClassSet;
}

uint64_t __45__DYKeyedUnarchiver_graphicsAPIInfosClassSet__block_invoke()
{
  id v0;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  graphicsAPIInfosClassSet__graphicsAPIInfosClassSet = (uint64_t)v0;
  v2[0] = objc_opt_class();
  objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 1));
  +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYContextInfo"), graphicsAPIInfosClassSet__graphicsAPIInfosClassSet);
  return +[DYKeyedUnarchiver registerRuntimeClass:withSet:](DYKeyedUnarchiver, "registerRuntimeClass:withSet:", CFSTR("DYMTLDeviceProfile"), graphicsAPIInfosClassSet__graphicsAPIInfosClassSet);
}

+ (void)registerRuntimeClass:(id)a3 withSet:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class v9;
  Class v10;
  uint64_t v11;

  v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("DY"));
  v8 = v7;
  v9 = NSClassFromString((NSString *)a3);
  if (v9)
  {
    v10 = v9;
    if (!v6)
    {
      v11 = objc_msgSend(CFSTR("DYGT"), "stringByAppendingString:", objc_msgSend(a3, "substringFromIndex:", v8));
      objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", v10, v11);
    }
    objc_msgSend(a4, "addObject:", v10);
  }
}

+ (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  return +[DYKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](DYKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", a3, 0), a4, a5);
}

+ (id)unarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", a3, a4, a5);
}

@end

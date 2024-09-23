@implementation LTMCurvesCompute

- (LTMCurvesCompute)initWith:(sRefDriverInputs *)a3 HITH:(sCLRProcHITHStat *)a4 geometryData:(id)a5 statsObj:(id)a6 optimized:(BOOL)a7 digitalFlash:(BOOL)a8 computeHDRCurves:(BOOL)a9 computeCurvesWoFaceBoost:(BOOL)a10
{
  id v16;
  id v17;
  LTMCurvesCompute *v18;
  uint64_t v19;
  LTMComputeRef *computeLTM;
  uint64_t v21;
  LTMDriverRef *driverLTM;
  uint64_t v23;
  LTMGeometryData *geometryData;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  LTMCurvesCompute *v31;
  NSObject *v33;
  objc_super v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v16 = a5;
  v17 = a6;
  v34.receiver = self;
  v34.super_class = (Class)LTMCurvesCompute;
  v18 = -[LTMCurvesCompute init](&v34, sel_init);
  if (!v18)
    goto LABEL_6;
  v19 = objc_opt_new();
  computeLTM = v18->_computeLTM;
  v18->_computeLTM = (LTMComputeRef *)v19;

  if (!v18->_computeLTM)
    goto LABEL_6;
  v21 = objc_opt_new();
  driverLTM = v18->_driverLTM;
  v18->_driverLTM = (LTMDriverRef *)v21;

  if (v18->_driverLTM)
  {
    memcpy(&v18->_driverInputMetadata, a3, 0x6B0uLL);
    v18->_isDigitalFlash = a8;
    v18->_computeHDRCurves = a9;
    v18->_computeCurvesWoFaceBoost = a10;
    v23 = objc_msgSend(v16, "copy");
    geometryData = v18->_geometryData;
    v18->_geometryData = (LTMGeometryData *)v23;

    v25 = *(_OWORD *)&a4->thumbnailWindow;
    v26 = *(_OWORD *)&a4->thumbnailDownsampleX;
    v27 = *(_OWORD *)&a4->localHistBlockSizeX;
    *(_OWORD *)&v18->_procHITHStat.globalHistWindow = *(_OWORD *)&a4->globalHistWindow;
    v28 = *(_OWORD *)&a4->globalHistOffset;
    v29 = *(_OWORD *)&a4->localHistogramOriginalTilePixelCount;
    v30 = *(_OWORD *)&a4->localHistOffset;
    *(_OWORD *)&v18->_procHITHStat.thumbnailOffset = *(_OWORD *)&a4->thumbnailOffset;
    *(_OWORD *)&v18->_procHITHStat.localHistOffset = v30;
    *(_OWORD *)&v18->_procHITHStat.localHistBlockSizeX = v27;
    *(_OWORD *)&v18->_procHITHStat.thumbnailDownsampleX = v26;
    *(_OWORD *)&v18->_procHITHStat.thumbnailWindow = v25;
    *(_OWORD *)&v18->_procHITHStat.localHistogramOriginalTilePixelCount = v29;
    *(_OWORD *)&v18->_procHITHStat.globalHistOffset = v28;
    v18->_procHITHStat.thumbnailStat = v18->_thumbnailStat;
    v18->_procHITHStat.localHistStat = v18->_localHistStat;
    v18->_procHITHStat.globalHistStat = v18->_globalHistStat;
    objc_storeStrong((id *)&v18->_ltmStats, a6);
    v18->_optimized = a7;
    v31 = v18;
  }
  else
  {
LABEL_6:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v33 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v31 = 0;
  }

  return v31;
}

- (id)compute
{
  unsigned __int8 *p_optimized;
  void *v3;
  _DWORD *v5;
  id v6;

  p_optimized = (unsigned __int8 *)&self->_optimized;
  if (!self->_LTMIsReady)
  {
    -[LTMStats finishCalculateHITHStatistics:optimized:](self->_ltmStats, "finishCalculateHITHStatistics:optimized:", &self->_procHITHStat, *p_optimized);
    v5 = (_DWORD *)MEMORY[0x24BDC0B48];
    if (*MEMORY[0x24BDC0B48] == 1)
      kdebug_trace();
    if (-[LTMDriverRef computeLtmComputeInput:withMetadata:to:computeInputMetadata:](self->_driverLTM, "computeLtmComputeInput:withMetadata:to:computeInputMetadata:", &self->_procHITHStat, &self->_driverInputMetadata, &self->_computeInputs, &self->_computeInputsMetadata)|| -[LTMComputeRef computeLTM:withMetadata:to:](self->_computeLTM, "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput))
    {
      v6 = 0;
      v3 = 0;
      goto LABEL_19;
    }
    +[LTMMetadataWriter createLTMMetadataFromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "createLTMMetadataFromLTMOutput:statistics:driverInputMetadata:geometryData:", &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata, self->_geometryData);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_20;
    if (self->_computeHDRCurves)
    {
      self->_computeInputsMetadata.gammaCurve = 1;
      if (-[LTMComputeRef computeLTM:withMetadata:to:](self->_computeLTM, "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput))
      {
        goto LABEL_20;
      }
      +[LTMMetadataWriter addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:", v3, 1, &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata, self->_geometryData);
    }
    if (!self->_computeCurvesWoFaceBoost)
    {
LABEL_15:
      if (*v5 == 1)
        kdebug_trace();
      p_optimized[1] = 1;
      goto LABEL_18;
    }
    self->_driverInputMetadata.forceDisableFaceBoost = 1;
    self->_driverInputMetadata.faceExpRatioFiltered = 1.0;
    self->_driverInputMetadata.gammaCurve = 0;
    if (!-[LTMDriverRef computeLtmComputeInput:withMetadata:to:computeInputMetadata:](self->_driverLTM, "computeLtmComputeInput:withMetadata:to:computeInputMetadata:", &self->_procHITHStat, &self->_driverInputMetadata, &self->_computeInputs, &self->_computeInputsMetadata)&& !-[LTMComputeRef computeLTM:withMetadata:to:](self->_computeLTM, "computeLTM:withMetadata:to:", &self->_computeInputs, &self->_computeInputsMetadata, &self->_computeOutput))
    {
      +[LTMMetadataWriter addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:](LTMMetadataWriter, "addLTMMetadataTo:curvesType:fromLTMOutput:statistics:driverInputMetadata:geometryData:", v3, 2, &self->_computeOutput, &self->_procHITHStat, &self->_driverInputMetadata, self->_geometryData);
      goto LABEL_15;
    }
LABEL_20:
    v6 = 0;
    goto LABEL_19;
  }
  v3 = 0;
LABEL_18:
  v6 = v3;
  v3 = v6;
LABEL_19:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_ltmStats, 0);
  objc_storeStrong((id *)&self->_driverLTM, 0);
  objc_storeStrong((id *)&self->_computeLTM, 0);
}

@end

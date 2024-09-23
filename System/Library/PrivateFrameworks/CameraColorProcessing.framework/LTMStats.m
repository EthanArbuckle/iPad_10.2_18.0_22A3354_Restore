@implementation LTMStats

- (LTMStats)initWithMetalContext:(id)a3
{
  id v5;
  LTMStats *v6;
  LTMStats *v7;
  LTMStatsCompute *v8;
  LTMStatsCompute *computeLTMStats;
  LTMStats *v10;
  NSObject *v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTMStats;
  v6 = -[LTMStats init](&v13, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metalContext, a3), v7->_metalContext)
    && (v8 = -[LTMStatsCompute initWithMetalContext:]([LTMStatsCompute alloc], "initWithMetalContext:", v5), computeLTMStats = v7->_computeLTMStats, v7->_computeLTMStats = v8, computeLTMStats, v7->_computeLTMStats))
  {
    v10 = v7;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v12 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }

  return v10;
}

- (int)calculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 optimized:(BOOL)a5 enableAntiAliasing:(BOOL)a6 calcGlobalHistOnROI:(BOOL)a7 toDriverInputMetadata:(sRefDriverInputs *)a8 andProcHITHStat:(sCLRProcHITHStat *)a9
{
  _BOOL8 v9;
  int result;

  v9 = a5;
  result = -[LTMStats startCalculateHITHStatistics:ltmGeometry:inputDriverMetadata:optimized:enableAntiAliasing:calcGlobalHistOnROI:outputProcHITHStat:](self, "startCalculateHITHStatistics:ltmGeometry:inputDriverMetadata:optimized:enableAntiAliasing:calcGlobalHistOnROI:outputProcHITHStat:", a3, a4, a8, a5, a6, a7, a9);
  if (!result)
    return -[LTMStats finishCalculateHITHStatistics:optimized:](self, "finishCalculateHITHStatistics:optimized:", a9, v9);
  return result;
}

- (int)startCalculateHITHStatistics:(id)a3 ltmGeometry:(id)a4 inputDriverMetadata:(sRefDriverInputs *)a5 optimized:(BOOL)a6 enableAntiAliasing:(BOOL)a7 calcGlobalHistOnROI:(BOOL)a8 outputProcHITHStat:(sCLRProcHITHStat *)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  MTLBuffer *v20;
  MTLBuffer *localHistBuffer;
  void *v22;
  MTLBuffer *v23;
  MTLBuffer *globalHistBuffer;
  void *v25;
  MTLBuffer *v26;
  MTLBuffer *thumbnailBuffer;
  MTLBuffer *v28;
  MTLBuffer *v29;
  LTMStatsCompute *computeLTMStats;
  $B0D373BB522788E62608C23ABA1844AE *p_params;
  int v32;
  NSObject *v34;
  _BYTE __dst[296];
  uint64_t v36;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v36 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  if (!v15
    || (FigMetalIsValid() & 1) == 0
    || (-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v34 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    goto LABEL_15;
  }
  v18 = -[LTMStatsCompute computeInputParametersForImageWidth:calcGlobalHistOnROI:enableAntiAliasing:with:to:](self->_computeLTMStats, "computeInputParametersForImageWidth:calcGlobalHistOnROI:enableAntiAliasing:with:to:", v16, v9, v10, a5, &self->_params);
  if (!v18)
  {
    memcpy(__dst, &self->_params, sizeof(__dst));
    -[LTMStats fillProcHITHStat:with:](self, "fillProcHITHStat:with:", a9, __dst);
    -[FigMetalContext device](self->_metalContext, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (MTLBuffer *)objc_msgSend(v19, "newBufferWithLength:options:", 13056, 0);
    localHistBuffer = self->_localHistBuffer;
    self->_localHistBuffer = v20;

    if (self->_localHistBuffer)
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (MTLBuffer *)objc_msgSend(v22, "newBufferWithLength:options:", 4096, 0);
      globalHistBuffer = self->_globalHistBuffer;
      self->_globalHistBuffer = v23;

      if (self->_globalHistBuffer)
      {
        -[FigMetalContext device](self->_metalContext, "device");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (MTLBuffer *)objc_msgSend(v25, "newBufferWithLength:options:", 17680, 0);
        thumbnailBuffer = self->_thumbnailBuffer;
        self->_thumbnailBuffer = v26;

        if (self->_thumbnailBuffer)
        {
          v29 = self->_localHistBuffer;
          v28 = self->_globalHistBuffer;
          computeLTMStats = self->_computeLTMStats;
          p_params = &self->_params;
          if (v11)
            v18 = -[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:](computeLTMStats, "encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:", v15, p_params, v28, v29);
          else
            v18 = -[LTMStatsCompute encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:](computeLTMStats, "encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:", v15, p_params, v28, v29);
          goto LABEL_11;
        }
      }
    }
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v34 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
LABEL_15:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v32 = -1;
    goto LABEL_12;
  }
LABEL_11:
  v32 = v18;
LABEL_12:

  return v32;
}

- (int)finishCalculateHITHStatistics:(sCLRProcHITHStat *)a3 optimized:(BOOL)a4
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  MTLBuffer *globalHistBuffer;
  MTLBuffer *localHistBuffer;
  MTLBuffer *thumbnailBuffer;

  -[LTMStatsCompute waitUntilCompleted](self->_computeLTMStats, "waitUntilCompleted");
  if (a4)
  {
    for (i = 0; i != 4420; ++i)
      *((_WORD *)a3->thumbnailStat + i) = *(_DWORD *)(-[MTLBuffer contents](self->_thumbnailBuffer, "contents") + 4 * i);
  }
  else
  {
    for (j = 0; j != 4420; ++j)
      *((_WORD *)a3->thumbnailStat + j) = (self->_params.thumbnail.ThumbAvgRecipNumPix
                                         * (unint64_t)*(unsigned int *)(-[MTLBuffer contents](self->_thumbnailBuffer, "contents")+ 4 * j)) >> 32;
  }
  for (k = 0; k != 3264; ++k)
    *((_WORD *)a3->localHistStat + k) = *(_DWORD *)(-[MTLBuffer contents](self->_localHistBuffer, "contents") + 4 * k);
  for (m = 0; m != 4096; m += 4)
    *(_DWORD *)((char *)a3->globalHistStat + m) = *(_DWORD *)(-[MTLBuffer contents](self->_globalHistBuffer, "contents")
                                                            + m);
  globalHistBuffer = self->_globalHistBuffer;
  self->_globalHistBuffer = 0;

  localHistBuffer = self->_localHistBuffer;
  self->_localHistBuffer = 0;

  thumbnailBuffer = self->_thumbnailBuffer;
  self->_thumbnailBuffer = 0;

  return 0;
}

- (void)fillProcHITHStat:(sCLRProcHITHStat *)a3 with:(id *)a4
{
  unsigned int var3;
  unsigned int var4;
  unsigned int v6;
  unsigned int var10;
  int var9;
  int v9;
  unsigned int var8;
  unsigned int var5;
  unsigned int v12;
  unsigned int v13;
  unsigned int var2;

  a3->thumbnailWindow = a4->var3.var3 - a4->var3.var1 + ((a4->var3.var2 - a4->var3.var0) << 16);
  a3->thumbnailDownsampleX = a4->var3.var4;
  a3->thumbnailDownsampleY = a4->var3.var5;
  var3 = a4->var2.var3;
  var4 = a4->var2.var4;
  v6 = a4->var2.var6 - var4 + ((a4->var2.var5 - var3) << 16);
  a3->thumbnailTotal = 5;
  a3->localHistWindow = v6;
  *(_DWORD *)&a3->localHistEnable = 4456449;
  var10 = a4->var2.var10;
  var9 = (unsigned __int16)a4->var2.var9;
  a3->localHistBlockSizeX = a4->var2.var9;
  v9 = (unsigned __int16)var10;
  a3->localHistBlockSizeY = var10;
  var8 = a4->var2.var8;
  a3->localHistStrideX = a4->var2.var7;
  a3->localHistStrideY = var8;
  *(_DWORD *)&a3->localHistNumHorBlocks = 393224;
  a3->globalHistEnable = 1;
  var5 = a4->var1.var5;
  v12 = a4->var1.var3;
  v13 = a4->var1.var4 - a4->var1.var2;
  var2 = a4->var2.var2;
  a3->localHistCountBitShift = var2;
  a3->globalHistWindow = var5 - v12 + (v13 << 16);
  a3->gridOriginX = var3;
  a3->gridOriginY = var4;
  a3->localHistogramOriginalTilePixelCount = (v9 * var9) >> var2 >> 1;
  *(_QWORD *)&a3->localHistLowThreshold = *(_QWORD *)&a4->var2.var13;
}

- (int)allocateResources
{
  -[LTMStatsCompute allocateResources](self->_computeLTMStats, "allocateResources");
  return 0;
}

- (int)purgeResources
{
  -[LTMStatsCompute purgeResources](self->_computeLTMStats, "purgeResources");
  return 0;
}

- (int)prewarmShaders
{
  -[LTMStatsCompute prewarmShaders](self->_computeLTMStats, "prewarmShaders");
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailBuffer, 0);
  objc_storeStrong((id *)&self->_globalHistBuffer, 0);
  objc_storeStrong((id *)&self->_localHistBuffer, 0);
  objc_storeStrong((id *)&self->_computeLTMStats, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end

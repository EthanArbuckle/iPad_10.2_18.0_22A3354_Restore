@implementation LTMStatsCompute

- (LTMStatsCompute)initWithMetalContext:(id)a3
{
  id v5;
  LTMStatsCompute *v6;
  int64x2_t *v7;
  LTMStatsCompute *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LTMStatsCompute;
  v6 = -[LTMStatsCompute init](&v10, sel_init);
  v7 = (int64x2_t *)v6;
  if (!v6)
  {
    FigSignalErrorAt();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (-[int64x2_t createShaders:](v7, "createShaders:", v7->i64[1]))
  {
LABEL_6:
    v8 = 0;
    goto LABEL_4;
  }
  v7[4] = vdupq_n_s64(0x10uLL);
  v7[5].i64[0] = 1;
  v8 = v7;
LABEL_4:

  return v8;
}

- (int)createShaders:(id)a3
{
  id v4;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *localHistAndThumKernelPipelineState;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *globalHistKernelPipelineState;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *collectLocalHistKernelPipelineState;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *calcLTMStatisticsPipelineState;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *calcLocalHistogramShift;
  int v15;

  v4 = a3;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("SoftLTM::localHistAndThumbKernel"), 0);
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  localHistAndThumKernelPipelineState = self->_localHistAndThumKernelPipelineState;
  self->_localHistAndThumKernelPipelineState = v5;

  if (!self->_localHistAndThumKernelPipelineState)
    goto LABEL_8;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("SoftLTM::globalHistKernel"), 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  globalHistKernelPipelineState = self->_globalHistKernelPipelineState;
  self->_globalHistKernelPipelineState = v7;

  if (!self->_globalHistKernelPipelineState)
    goto LABEL_8;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("SoftLTM::collectLocalHistKernel"), 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  collectLocalHistKernelPipelineState = self->_collectLocalHistKernelPipelineState;
  self->_collectLocalHistKernelPipelineState = v9;

  if (!self->_collectLocalHistKernelPipelineState)
    goto LABEL_8;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("SoftLTM::ltmStatisticsKernel"), 0);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  calcLTMStatisticsPipelineState = self->_calcLTMStatisticsPipelineState;
  self->_calcLTMStatisticsPipelineState = v11;

  if (!self->_calcLTMStatisticsPipelineState)
    goto LABEL_8;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("SoftLTM::calcLocalHistogramShiftKernel"), 0);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  calcLocalHistogramShift = self->_calcLocalHistogramShift;
  self->_calcLocalHistogramShift = v13;

  if (self->_calcLocalHistogramShift)
    v15 = 0;
  else
LABEL_8:
    v15 = FigSignalErrorAt();

  return v15;
}

- (int)encodeLTMStatisticsCalculationOptimized:(id)a3 params:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MTLCommandBuffer *v20;
  MTLCommandBuffer *cmdBuf;
  MTLCommandBuffer *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  $E02964FDFD67EC2258E465940F8858E4 *p_var2;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  unsigned int v50;
  unsigned int v51;
  NSObject *v52;
  unsigned int v53;
  unsigned int v54;
  int *v55;
  uint64_t v56;
  id v57;
  id v58;
  _QWORD v59[3];
  __int128 v60;
  uint64_t v61;
  _QWORD v62[3];
  _QWORD v63[3];
  uint64_t v64;
  int64x2_t v65;
  __int128 v66;
  uint64_t v67;
  os_log_type_t type;
  unsigned int v69;
  id v70;
  int v71;
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v70 = 0;
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_26;
  if (!v14)
    goto LABEL_26;
  if (!v13)
    goto LABEL_26;
  if (!v15)
    goto LABEL_26;
  -[FigMetalContext device](self->_metalContext, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newBufferWithLength:options:", 240448, 0);
  v70 = v18;

  if (!v18)
    goto LABEL_26;
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commandBuffer");
  v20 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  cmdBuf = self->_cmdBuf;
  self->_cmdBuf = v20;

  v22 = self->_cmdBuf;
  if (!v22)
    goto LABEL_26;
  if (*MEMORY[0x24BDC0B48])
  {
    -[MTLCommandBuffer commandQueue](v22, "commandQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "commandBuffer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v24, "addCompletedHandler:", &__block_literal_global_1);
    objc_msgSend(v24, "commit");
    -[MTLCommandBuffer addCompletedHandler:](self->_cmdBuf, "addCompletedHandler:", &__block_literal_global_12);

    v22 = self->_cmdBuf;
  }
  -[MTLCommandBuffer blitCommandEncoder](v22, "blitCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
LABEL_26:
    v69 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v47 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v26 = 0;
LABEL_27:
    v41 = 0;
    v45 = -1;
    goto LABEL_25;
  }
  v26 = v25;
  objc_msgSend(v25, "fillBuffer:range:value:", v18, 0, objc_msgSend(v18, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v13, 0, objc_msgSend(v13, "length"), 0);
  objc_msgSend(v26, "fillBuffer:range:value:", v15, 0, objc_msgSend(v15, "length"), 0);
  objc_msgSend(v26, "endEncoding");
  -[MTLCommandBuffer computeCommandEncoder](self->_cmdBuf, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v69 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v48 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_27;
  }
  v28 = v27;
  v57 = v14;
  v58 = v13;
  objc_msgSend(v27, "setComputePipelineState:", self->_localHistAndThumKernelPipelineState);
  v29 = -[MTLComputePipelineState threadExecutionWidth](self->_localHistAndThumKernelPipelineState, "threadExecutionWidth");
  objc_msgSend(v28, "setTexture:atIndex:", v12, 0);
  p_var2 = &a4->var2;
  objc_msgSend(v28, "setBytes:length:atIndex:", &a4->var2, 172, 0);
  objc_msgSend(v28, "setBytes:length:atIndex:", &a4->var3, 40, 1);
  objc_msgSend(v28, "setBytes:length:atIndex:", a4, 32, 2);
  objc_msgSend(v28, "setBuffer:offset:atIndex:", v18, 0, 3);
  objc_msgSend(v28, "setBuffer:offset:atIndex:", v15, 0, 4);
  v67 = 1;
  v64 = v29;
  v65 = vdupq_n_s64(1uLL);
  v66 = xmmword_230931950;
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", &v66, &v64);
  objc_msgSend(v28, "endEncoding");
  -[MTLCommandBuffer computeCommandEncoder](self->_cmdBuf, "computeCommandEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "setComputePipelineState:", self->_globalHistKernelPipelineState);
    objc_msgSend(v31, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v31, "setBytes:length:atIndex:", &a4->var1, 52, 0);
    objc_msgSend(v31, "setBytes:length:atIndex:", a4, 32, 1);
    objc_msgSend(v31, "setBuffer:offset:atIndex:", v58, 0, 2);
    v32 = -[MTLComputePipelineState threadExecutionWidth](self->_globalHistKernelPipelineState, "threadExecutionWidth");
    v33 = objc_msgSend(v12, "width");
    if (v32 >= objc_msgSend(v12, "height") * v33)
    {
      v35 = objc_msgSend(v12, "width");
      v34 = objc_msgSend(v12, "height") * v35;
    }
    else
    {
      v34 = -[MTLComputePipelineState threadExecutionWidth](self->_globalHistKernelPipelineState, "threadExecutionWidth");
    }
    v36 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_globalHistKernelPipelineState, "maxTotalThreadsPerThreadgroup")/ v34;
    v37 = objc_msgSend(v12, "width");
    if (v36 >= objc_msgSend(v12, "height") * v37 / v34)
    {
      v39 = objc_msgSend(v12, "width");
      v38 = objc_msgSend(v12, "height") * v39;
    }
    else
    {
      v38 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_globalHistKernelPipelineState, "maxTotalThreadsPerThreadgroup");
    }
    v40 = v38 / v34;
    v63[0] = objc_msgSend(v12, "width");
    v63[1] = objc_msgSend(v12, "height");
    v63[2] = 1;
    v62[0] = v34;
    v62[1] = v40;
    v62[2] = 1;
    objc_msgSend(v31, "dispatchThreads:threadsPerThreadgroup:", v63, v62);
    objc_msgSend(v31, "endEncoding");
    -[MTLCommandBuffer computeCommandEncoder](self->_cmdBuf, "computeCommandEncoder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v41, "setComputePipelineState:", self->_collectLocalHistKernelPipelineState);
      objc_msgSend(v41, "setBuffer:offset:atIndex:", v18, 0, 0);
      objc_msgSend(v41, "setBytes:length:atIndex:", p_var2, 172, 1);
      v14 = v57;
      objc_msgSend(v41, "setBuffer:offset:atIndex:", v57, 0, 2);
      v13 = v58;
      if ((unint64_t)-[MTLComputePipelineState threadExecutionWidth](self->_collectLocalHistKernelPipelineState, "threadExecutionWidth") > 0x2F)v42 = 48;
      else
        v42 = -[MTLComputePipelineState threadExecutionWidth](self->_collectLocalHistKernelPipelineState, "threadExecutionWidth");
      v43 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_collectLocalHistKernelPipelineState, "maxTotalThreadsPerThreadgroup");
      v44 = 0x30 / v42;
      if (v43 / v42 < 0x30 / v42)
        v44 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_collectLocalHistKernelPipelineState, "maxTotalThreadsPerThreadgroup")/ v42;
      v60 = xmmword_230931960;
      v61 = 1;
      v59[0] = v42;
      v59[1] = v44;
      v59[2] = 1;
      objc_msgSend(v41, "dispatchThreads:threadsPerThreadgroup:", &v60, v59);
      v45 = 0;
    }
    else
    {
      v69 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v69;
      if (os_log_type_enabled(v52, type))
        v54 = v53;
      else
        v54 = v53 & 0xFFFFFFFE;
      v13 = v58;
      if (v54)
      {
        v71 = 136315138;
        v72 = "-[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:]";
        LODWORD(v56) = 12;
        v55 = &v71;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v41 = 0;
      v45 = -1;
      v14 = v57;
    }
  }
  else
  {
    v69 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v69;
    if (os_log_type_enabled(v49, type))
      v51 = v50;
    else
      v51 = v50 & 0xFFFFFFFE;
    if (v51)
    {
      v71 = 136315138;
      v72 = "-[LTMStatsCompute encodeLTMStatisticsCalculationOptimized:params:globalHistogram:localHistogram:thumbnail:]";
      LODWORD(v56) = 12;
      v55 = &v71;
      _os_log_send_and_compose_impl();
    }
    v13 = v58;
    v14 = v57;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v41 = 0;
    v45 = -1;
  }
LABEL_25:
  objc_msgSend(v41, "endEncoding", v55, v56);
  -[MTLCommandBuffer commit](self->_cmdBuf, "commit");
  FigMetalDecRef();

  return v45;
}

uint64_t __107__LTMStatsCompute_encodeLTMStatisticsCalculationOptimized_params_globalHistogram_localHistogram_thumbnail___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x24BDC0B48] == 1)
    return kdebug_trace();
  return result;
}

void __107__LTMStatsCompute_encodeLTMStatisticsCalculationOptimized_params_globalHistogram_localHistogram_thumbnail___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

}

- (int)encodeLTMStatisticsCalculationPrecise:(id)a3 paramsGlobalHist:(id *)a4 globalHistogram:(id)a5 localHistogram:(id)a6 thumbnail:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  MTLCommandBuffer *v18;
  MTLCommandBuffer *cmdBuf;
  MTLCommandBuffer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  $E02964FDFD67EC2258E465940F8858E4 *p_var2;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  unsigned int v48;
  unsigned int v49;
  int *v50;
  uint64_t v51;
  id v52;
  _QWORD v53[3];
  __int128 v54;
  uint64_t v55;
  _QWORD v56[3];
  _QWORD v57[3];
  os_log_type_t type;
  unsigned int v59;
  int v60;
  const char *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_24;
  if (!v13)
    goto LABEL_24;
  if (!v14)
    goto LABEL_24;
  if (!v15)
    goto LABEL_24;
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commandBuffer");
  v18 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  cmdBuf = self->_cmdBuf;
  self->_cmdBuf = v18;

  v20 = self->_cmdBuf;
  if (!v20)
    goto LABEL_24;
  if (*MEMORY[0x24BDC0B48])
  {
    -[MTLCommandBuffer commandQueue](v20, "commandQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "commandBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v22, "addCompletedHandler:", &__block_literal_global_13);
    objc_msgSend(v22, "commit");
    -[MTLCommandBuffer addCompletedHandler:](self->_cmdBuf, "addCompletedHandler:", &__block_literal_global_14);

    v20 = self->_cmdBuf;
  }
  -[MTLCommandBuffer blitCommandEncoder](v20, "blitCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v23, "fillBuffer:range:value:", v13, 0, objc_msgSend(v13, "length"), 0);
    objc_msgSend(v24, "fillBuffer:range:value:", v14, 0, objc_msgSend(v14, "length"), 0);
    objc_msgSend(v24, "fillBuffer:range:value:", v15, 0, objc_msgSend(v15, "length"), 0);
    objc_msgSend(v24, "endEncoding");
    -[MTLCommandBuffer computeCommandEncoder](self->_cmdBuf, "computeCommandEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = v25;
      objc_msgSend(v25, "setComputePipelineState:", self->_calcLTMStatisticsPipelineState);
      objc_msgSend(v26, "setTexture:atIndex:", v12, 0);
      objc_msgSend(v26, "setBytes:length:atIndex:", &a4->var1, 52, 0);
      p_var2 = &a4->var2;
      objc_msgSend(v26, "setBytes:length:atIndex:", &a4->var2, 172, 1);
      objc_msgSend(v26, "setBytes:length:atIndex:", &a4->var3, 40, 2);
      objc_msgSend(v26, "setBytes:length:atIndex:", a4, 32, 3);
      objc_msgSend(v26, "setBuffer:offset:atIndex:", v13, 0, 4);
      v28 = v14;
      objc_msgSend(v26, "setBuffer:offset:atIndex:", v14, 0, 5);
      v52 = v15;
      objc_msgSend(v26, "setBuffer:offset:atIndex:", v15, 0, 6);
      v29 = -[MTLComputePipelineState threadExecutionWidth](self->_calcLTMStatisticsPipelineState, "threadExecutionWidth");
      v30 = objc_msgSend(v12, "width");
      v31 = v13;
      if (v29 >= objc_msgSend(v12, "height") * v30)
      {
        v33 = objc_msgSend(v12, "width");
        v32 = objc_msgSend(v12, "height") * v33;
      }
      else
      {
        v32 = -[MTLComputePipelineState threadExecutionWidth](self->_calcLTMStatisticsPipelineState, "threadExecutionWidth");
      }
      v34 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_calcLTMStatisticsPipelineState, "maxTotalThreadsPerThreadgroup")/ v32;
      v35 = objc_msgSend(v12, "width");
      if (v34 >= objc_msgSend(v12, "height") * v35 / v32)
      {
        v37 = objc_msgSend(v12, "width");
        v36 = objc_msgSend(v12, "height") * v37;
      }
      else
      {
        v36 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_calcLTMStatisticsPipelineState, "maxTotalThreadsPerThreadgroup");
      }
      v38 = v36 / v32;
      v57[0] = objc_msgSend(v12, "width");
      v57[1] = objc_msgSend(v12, "height");
      v57[2] = 1;
      v56[0] = v32;
      v56[1] = v38;
      v56[2] = 1;
      objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v57, v56);
      objc_msgSend(v26, "endEncoding");
      -[MTLCommandBuffer computeCommandEncoder](self->_cmdBuf, "computeCommandEncoder");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v39, "setComputePipelineState:", self->_calcLocalHistogramShift);
        objc_msgSend(v39, "setBytes:length:atIndex:", p_var2, 172, 0);
        v14 = v28;
        objc_msgSend(v39, "setBuffer:offset:atIndex:", v28, 0, 1);
        if ((unint64_t)-[MTLComputePipelineState threadExecutionWidth](self->_calcLocalHistogramShift, "threadExecutionWidth") > 0xCBF)v40 = 3264;
        else
          v40 = -[MTLComputePipelineState threadExecutionWidth](self->_calcLocalHistogramShift, "threadExecutionWidth");
        v13 = v31;
        v41 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_calcLocalHistogramShift, "maxTotalThreadsPerThreadgroup");
        v42 = 0xCC0 / v40;
        v15 = v52;
        if (v41 / v40 < 0xCC0 / v40)
          v42 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_calcLocalHistogramShift, "maxTotalThreadsPerThreadgroup")/ v40;
        v54 = xmmword_230931970;
        v55 = 1;
        v53[0] = v40;
        v53[1] = v42;
        v53[2] = 1;
        objc_msgSend(v39, "dispatchThreads:threadsPerThreadgroup:", &v54, v53);
        v43 = 0;
      }
      else
      {
        v59 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v59;
        if (os_log_type_enabled(v47, type))
          v49 = v48;
        else
          v49 = v48 & 0xFFFFFFFE;
        v14 = v28;
        if (v49)
        {
          v60 = 136315138;
          v61 = "-[LTMStatsCompute encodeLTMStatisticsCalculationPrecise:paramsGlobalHist:globalHistogram:localHistogram:thumbnail:]";
          LODWORD(v51) = 12;
          v50 = &v60;
          _os_log_send_and_compose_impl();
        }
        v13 = v31;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v39 = 0;
        v43 = -1;
        v15 = v52;
      }
    }
    else
    {
      v59 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v46 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v39 = 0;
      v43 = -1;
    }
  }
  else
  {
LABEL_24:
    v59 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v45 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v24 = 0;
    v39 = 0;
    v43 = -1;
  }
  objc_msgSend(v39, "endEncoding", v50, v51);
  -[MTLCommandBuffer commit](self->_cmdBuf, "commit");

  return v43;
}

uint64_t __115__LTMStatsCompute_encodeLTMStatisticsCalculationPrecise_paramsGlobalHist_globalHistogram_localHistogram_thumbnail___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x24BDC0B48] == 1)
    return kdebug_trace();
  return result;
}

void __115__LTMStatsCompute_encodeLTMStatisticsCalculationPrecise_paramsGlobalHist_globalHistogram_localHistogram_thumbnail___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

}

- (int)waitUntilCompleted
{
  MTLCommandBuffer *cmdBuf;
  MTLCommandBuffer *v4;
  NSObject *v5;

  cmdBuf = self->_cmdBuf;
  if (cmdBuf)
  {
    -[MTLCommandBuffer waitUntilCompleted](cmdBuf, "waitUntilCompleted");
    v4 = self->_cmdBuf;
    self->_cmdBuf = 0;

  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  return 0;
}

- (int)computeInputParametersForImageWidth:(id)a3 calcGlobalHistOnROI:(BOOL)a4 enableAntiAliasing:(BOOL)a5 with:(sRefDriverInputs *)a6 to:(id *)a7
{
  id v12;
  void *v13;
  float hardIspDGain;
  uint64_t v15;
  unsigned int v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v23;
  float64x2_t v24;
  int32x4_t v30;
  uint64x2_t v31;
  float64_t v32;
  float64x2_t v33;
  int32x2_t v34;
  int32x4_t v35;
  unsigned int v36;
  unsigned int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  int32x2_t v47;
  uint64x2_t v48;
  float v49;
  float v50;
  int32x2_t v51;
  double v52;
  double v53;
  double v54;
  float v55;
  float v56;
  double v57;
  double v58;
  int v59;
  float v60;
  float v61;
  NSObject *v63;
  float64_t v64;
  float64x2_t v65;
  float64_t v66;
  float64_t v67;
  float64_t v68;
  uint64_t v69;
  float64_t v70;
  int32x2_t v71;
  float64_t v72;
  int32x2_t v73;
  unsigned int v74;

  v12 = a3;
  v13 = v12;
  a7->var0.var0 = 11;
  hardIspDGain = a6->hardIspDGain;
  if (hardIspDGain <= 0.0)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v63 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v59 = -1;
  }
  else
  {
    v15 = 0;
    v16 = vcvts_n_u32_f32(hardIspDGain, 0xBuLL);
    v17 = (float)(float)(hardIspDGain * 2048.0);
    *(uint32x2_t *)a7->var0.var1 = vcvt_u32_f32(vmul_n_f32((float32x2_t)0x3F370A3D3E5A1CACLL, v17));
    a7->var0.var1[2] = (float)(v17 * 0.072);
    do
      a7->var0.var2[v15++] = v16;
    while (v15 != 3);
    a7->var0.var3 = 0;
    objc_msgSend(v12, "cropRect");
    v70 = v18;
    objc_msgSend(v13, "cropRect");
    v64 = v19;
    objc_msgSend(v13, "cropRect");
    v72 = v20;
    objc_msgSend(v13, "cropRect");
    v66 = v21;
    objc_msgSend(v13, "cropRect");
    v68 = v22;
    objc_msgSend(v13, "cropRect");
    a7->var2.var0 = 1;
    a7->var2.var1 = 2;
    v23.f64[0] = v70;
    v24.f64[0] = v66;
    v23.f64[1] = v64;
    __asm { FMOV            V4.2D, #0.5 }
    v30 = (int32x4_t)vcvtq_n_u64_f64(vrndmq_f64(vmulq_f64(vmulq_f64(vdivq_f64(v23, (float64x2_t)xmmword_230931980), _Q4), _Q4)), 2uLL);
    v71 = vmovn_s64((int64x2_t)v30);
    *(int32x2_t *)&v23.f64[0] = vmul_s32(v71, (int32x2_t)0xD00000011);
    v31.i64[0] = LODWORD(v23.f64[0]);
    v31.i64[1] = HIDWORD(v23.f64[0]);
    v24.f64[1] = v32;
    v33.f64[0] = v72;
    v33.f64[1] = v68;
    v34 = vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64(vmulq_f64(vaddq_f64(v33, vmulq_f64(vsubq_f64(v24, vcvtq_f64_u64(v31)), _Q4)), _Q4)), 1uLL));
    *(int32x2_t *)&v33.f64[0] = vadd_s32(*(int32x2_t *)&v23.f64[0], v34);
    v73 = v34;
    *(int32x2_t *)&v23.f64[0] = v34;
    v65 = _Q4;
    v67 = v33.f64[0];
    v23.f64[1] = v33.f64[0];
    v35 = vmulq_s32(vuzp1q_s32(v30, v30), (int32x4_t)xmmword_230931990);
    *(float64x2_t *)&a7->var2.var3 = v23;
    *(int32x4_t *)&a7->var2.var7 = v35;
    v69 = v35.i64[0];
    *(_QWORD *)&a7->var2.var11 = 0x80000000000;
    a7->var2.var13 = 1;
    if (useLowerLocalHistogramThreshold())
      v36 = 65471;
    else
      v36 = 65472;
    a7->var2.var16 = 3;
    a7->var2.var14 = v36;
    a7->var2.var15 = a5;
    a7->var2.var17 = 1;
    AuxCompute_CalcAntiAliasingSettings(&a7->var2.var17, &a7->var2.var16, a7->var2.var18, a6);
    +[LTMStatsCompute rewriteAntiAliasingCoefficients:](LTMStatsCompute, "rewriteAntiAliasingCoefficients:", a7->var2.var18);
    a7->var2.var2 = ((a7->var2.var10 * a7->var2.var9) & 0xFFFE0000) != 0;
    a7->var1.var0 = 1;
    if (a4)
    {
      *(int32x2_t *)&a7->var1.var2 = v73;
      a7->var1.var4 = LODWORD(v67);
      v37 = HIDWORD(v67);
    }
    else
    {
      objc_msgSend(v13, "sourceRect");
      a7->var1.var2 = v38;
      objc_msgSend(v13, "sourceRect");
      a7->var1.var3 = v39;
      objc_msgSend(v13, "sourceRect");
      v41 = v40;
      objc_msgSend(v13, "sourceRect");
      a7->var1.var4 = (v41 + v42);
      objc_msgSend(v13, "sourceRect");
      v44 = v43;
      objc_msgSend(v13, "sourceRect");
      v37 = (v44 + v45);
    }
    a7->var1.var5 = v37;
    -[LTMStatsCompute calcExposureRatio:](self, "calcExposureRatio:", a6);
    *(_QWORD *)&a7->var1.var6[2] = 0;
    *(_QWORD *)a7->var1.var6 = 0;
    *(float *)v47.i32 = v46 * 256.0;
    *(int32x4_t *)a7->var1.var7 = vdupq_lane_s32(v47, 0);
    *(int32x2_t *)&a7->var3.var0 = v73;
    *(float64_t *)&a7->var3.var2 = v67;
    v48.i64[0] = v71.u32[0];
    v48.i64[1] = v71.u32[1];
    *(int32x2_t *)&a7->var3.var6 = vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64(vaddq_f64(vmulq_f64(vmulq_f64(vmulq_f64(vcvtq_f64_u64(v48), v65), v65), v65), v65)), 1uLL));
    a7->var3.var4 = (unsigned __int32)v71.i32[0] >> 1;
    a7->var3.var5 = (unsigned __int32)v71.i32[1] >> 1;
    a7->var3.var9 = vcvtms_u32_f32((float)(4295000000.0 / (float)((unsigned __int32)v71.i32[0] >> 1))/ (float)((unsigned __int32)v71.i32[1] >> 1));
    a7->var3.var8 = 1;
    objc_msgSend(v13, "inputTextureDownsampleRatio");
    a6->LTMGridConfigWidth = v49 * (float)v69;
    objc_msgSend(v13, "inputTextureDownsampleRatio");
    a6->LTMGridConfigHeight = v50 * (float)HIDWORD(v69);
    v51 = vadd_s32(v73, v71);
    v74 = v51.u32[1];
    v52 = (double)v51.u32[0];
    objc_msgSend(v13, "deepZoomOrigin");
    v54 = v53 + v52;
    objc_msgSend(v13, "inputTextureDownsampleRatio");
    v56 = v54 * v55;
    a6->LTMGridConfigX = v56;
    objc_msgSend(v13, "deepZoomOrigin");
    v58 = v57 + (double)v74;
    objc_msgSend(v13, "inputTextureDownsampleRatio");
    v59 = 0;
    v61 = v58 * v60;
    a6->LTMGridConfigY = v61;
  }

  return v59;
}

- (float)calcExposureRatio:(const sRefDriverInputs *)a3
{
  float result;
  NSObject *v4;

  if (a3->hdrRatio && a3->gainDigi && a3->ev0Ratio && a3->overflowDGain)
  {
    AuxCompute_CalcExposureRatio(a3);
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 1.0;
  }
  return result;
}

- (int)allocateResources
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)prewarmShaders
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdBuf, 0);
  objc_storeStrong((id *)&self->_collectLocalHistKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_globalHistKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_localHistAndThumKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_calcLocalHistogramShift, 0);
  objc_storeStrong((id *)&self->_calcLTMStatisticsPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end

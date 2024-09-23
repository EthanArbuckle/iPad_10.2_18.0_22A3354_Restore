@implementation CMIStyleEngineCoefficientsFilter

- (CMIStyleEngineCoefficientsFilter)initWithMetalContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  int CFPreferenceNumberWithDefault;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  CMIStyleEngineCoefficientsFilter *v22;
  objc_super v24;

  v5 = a3;
  +[CMISmartStyleCommonSettings configurationForVariant:](CMISmartStyleCommonSettings, "configurationForVariant:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMISmartStyleCommonSettings tuningParametersForVariant:](CMISmartStyleCommonSettings, "tuningParametersForVariant:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CMIStyleEngineCoefficientsFilter;
  v8 = -[CMIStyleEngineCoefficientsFilter init](&v24, sel_init);
  objc_storeStrong((id *)v8 + 2, a3);
  objc_msgSend(v5, "computePipelineStateFor:constants:", CFSTR("StyleEngineCoefficients::filterStep"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v9;

  if (!*((_QWORD *)v8 + 1))
    goto LABEL_9;
  objc_msgSend(*((id *)v8 + 2), "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "newBufferWithLength:options:", 20, 0);
  v13 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v12;

  if (!*((_QWORD *)v8 + 3))
    goto LABEL_9;
  objc_msgSend(v7, "coefficientsFilteringIIR1InitialHistoryFactor");
  *((_DWORD *)v8 + 8) = v14;
  objc_msgSend(v7, "coefficientsFilteringIIR1HistoryFactorRampUpStep");
  FigGetCFPreferenceDoubleWithDefault();
  *(float *)&v15 = v15;
  *((_DWORD *)v8 + 9) = LODWORD(v15);
  objc_msgSend(v7, "coefficientsFilteringIIR1MaxHistoryFactor");
  FigGetCFPreferenceDoubleWithDefault();
  *(float *)&v16 = v16;
  *((_DWORD *)v8 + 10) = LODWORD(v16);
  objc_msgSend(v7, "learningRate");
  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v18 = CFPreferenceNumberWithDefault <= 1 ? 1 : CFPreferenceNumberWithDefault;
  *((float *)v8 + 11) = 1.0
                      / (float)((float)(unint64_t)objc_msgSend(v6, "learningRateFramesPerSecond") / (float)v18);
  objc_msgSend(v7, "coefficientsFilteringGaussianScale");
  *((_DWORD *)v8 + 12) = v19;
  if (objc_msgSend(v7, "coefficientsFilteringIIR3"))
  {
    v20 = objc_msgSend(v7, "coefficientsFilteringIIR3");
    v21 = *(_DWORD *)(v20 + 16);
    *(_OWORD *)(v8 + 52) = *(_OWORD *)v20;
    *((_DWORD *)v8 + 17) = v21;
    v22 = v8;
  }
  else
  {
LABEL_9:
    FigDebugAssert3();
    v22 = 0;
  }

  return v22;
}

- (int)filterCoefficientsFIR:(id)a3 forPts:(double)a4 to:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  MTLBuffer *v20;
  MTLBuffer *filterBuf;
  MTLBuffer *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  int v32;
  int64x2_t v34;
  uint64_t v35;
  int64x2_t v36;
  unint64_t v37;
  int64x2_t v38;

  v8 = a3;
  v9 = a5;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blitCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_13;
  if (!v9)
    goto LABEL_13;
  objc_msgSend(v11, "fillBuffer:range:value:", v9, 0, objc_msgSend(v9, "length"), 0);
  objc_msgSend(v11, "endEncoding");
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", CFSTR("CoefficientsProcessor_filter"));

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "setComputePipelineState:", self->_filterPipeline);
    objc_msgSend(v8, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v17 = -[MTLBuffer length](self->_filterBuf, "length");

    if (v17 < 4 * v16)
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (MTLBuffer *)objc_msgSend(v18, "newBufferWithLength:options:", 4 * objc_msgSend(v19, "count"), 0);
      filterBuf = self->_filterBuf;
      self->_filterBuf = v20;

    }
    v22 = self->_filterBuf;
    if (!v22
      || -[CMIStyleEngineCoefficientsFilter _fillSymetricFIRFilterBuffer:forWindow:referenceFramePts:](self, "_fillSymetricFIRFilterBuffer:forWindow:referenceFramePts:", v22, v8, a4))
    {
      FigDebugAssert3();
      v32 = FigSignalErrorAt();

    }
    else
    {
      objc_msgSend(v8, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24)
      {
        v25 = 0;
        v26 = 0;
        v34 = vdupq_n_s64(1uLL);
        do
        {
          objc_msgSend(v8, "window");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "setBuffer:offset:atIndex:", v9, 0, 0);
          objc_msgSend(v28, "coefficients");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBuffer:offset:atIndex:", v29, 0, 1);

          objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_filterBuf, v25, 2);
          v37 = (unint64_t)objc_msgSend(v9, "length") >> 2;
          v38 = v34;
          v35 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_filterPipeline, "maxTotalThreadsPerThreadgroup");
          v36 = v34;
          objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v37, &v35);

          ++v26;
          objc_msgSend(v8, "window");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          v25 += 4;
        }
        while (v31 > v26);
      }
      objc_msgSend(v14, "endEncoding");
      -[FigMetalContext commit](self->_metalContext, "commit");

      v32 = 0;
    }
  }
  else
  {
LABEL_13:
    FigDebugAssert3();
    v32 = FigSignalErrorAt();
  }

  return v32;
}

- (int)filterCoefficientsIIR:(id)a3 filteredDataWindow:(id)a4 filterType:(unint64_t)a5 to:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  MTLBuffer *filterBuf;
  void *v21;
  MTLBuffer *v22;
  MTLBuffer *v23;
  MTLBuffer *v24;
  void *v25;
  double v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float iir1TargetHistoryFactor;
  MTLBuffer *v40;
  void *v41;
  MTLBuffer *v42;
  MTLBuffer *v43;
  MTLBuffer *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  char v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  id v61;
  id v62;
  int64x2_t v63;
  int64x2_t v64;
  uint64_t v65;
  int64x2_t v66;
  unint64_t v67;
  int64x2_t v68;
  uint64_t v69;
  int64x2_t v70;
  unint64_t v71;
  int64x2_t v72;
  uint64_t v73;
  int64x2_t v74;
  unint64_t v75;
  int64x2_t v76;
  uint64_t v77;
  int64x2_t v78;
  unint64_t v79;
  int64x2_t v80;

  v61 = a3;
  v10 = a4;
  v11 = a6;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blitCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
    v14 = v61;
    goto LABEL_32;
  }
  v14 = v61;
  if (!v11)
    goto LABEL_34;
  objc_msgSend(v13, "fillBuffer:range:value:", v11, 0, objc_msgSend(v11, "length"), 0);
  objc_msgSend(v13, "endEncoding");
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", CFSTR("CoefficientsProcessor_filter"));

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_34:
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
    goto LABEL_32;
  }
  objc_msgSend(v17, "setComputePipelineState:", self->_filterPipeline);
  v62 = v10;
  if (a5 == 3)
    goto LABEL_7;
  if (a5 != 4)
    goto LABEL_13;
  objc_msgSend(v10, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 <= 1)
  {
LABEL_7:
    filterBuf = self->_filterBuf;
    if (!filterBuf || (unint64_t)-[MTLBuffer length](filterBuf, "length") <= 7)
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (MTLBuffer *)objc_msgSend(v21, "newBufferWithLength:options:", 8, 0);
      v23 = self->_filterBuf;
      self->_filterBuf = v22;

    }
    v24 = self->_filterBuf;
    if (v24)
    {
      objc_msgSend(v10, "window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = objc_msgSend(v25, "count") ? LODWORD(self->_iir1HistoryFactor) : 0;
      v28 = -[CMIStyleEngineCoefficientsFilter _fillIIROrder1FilterBuffer:historyFactor:](self, "_fillIIROrder1FilterBuffer:historyFactor:", v24, v26);

      if (!v28)
      {
        v60 = v13;
        objc_msgSend(v61, "window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "window");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v30, "count") - 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setBuffer:offset:atIndex:", v11, 0, 0);
        objc_msgSend(v31, "coefficients");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBuffer:offset:atIndex:", v32, 0, 1);

        objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_filterBuf, 0, 2);
        v79 = (unint64_t)objc_msgSend(v11, "length") >> 2;
        v80 = vdupq_n_s64(1uLL);
        v77 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_filterPipeline, "maxTotalThreadsPerThreadgroup");
        v78 = v80;
        objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v79, &v77);
        objc_msgSend(v10, "window");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34)
        {
          objc_msgSend(v10, "window");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "window");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v36, "count") - 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v62;
          objc_msgSend(v17, "setBuffer:offset:atIndex:", v11, 0, 0);
          objc_msgSend(v37, "coefficients");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBuffer:offset:atIndex:", v38, 0, 1);

          objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_filterBuf, 4, 2);
          v75 = (unint64_t)objc_msgSend(v11, "length") >> 2;
          v76 = vdupq_n_s64(1uLL);
          v73 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_filterPipeline, "maxTotalThreadsPerThreadgroup");
          v74 = v76;
          objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v75, &v73);
          v31 = v37;
        }
        iir1TargetHistoryFactor = self->_iir1HistoryFactor + self->_iir1HistoryFactorRampUpStep;
        if (iir1TargetHistoryFactor >= self->_iir1TargetHistoryFactor)
          iir1TargetHistoryFactor = self->_iir1TargetHistoryFactor;
        self->_iir1HistoryFactor = iir1TargetHistoryFactor;
        goto LABEL_31;
      }
    }
  }
  else
  {
    v40 = self->_filterBuf;
    if (!v40 || (unint64_t)-[MTLBuffer length](v40, "length") <= 0x13)
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (MTLBuffer *)objc_msgSend(v41, "newBufferWithLength:options:", 20, 0);
      v43 = self->_filterBuf;
      self->_filterBuf = v42;

    }
    v44 = self->_filterBuf;
    if (v44
      && !-[CMIStyleEngineCoefficientsFilter _fillIIROrder3FilterBuffer:forNumOfFrames:](self, "_fillIIROrder3FilterBuffer:forNumOfFrames:", v44, 5))
    {
      v60 = v13;
      v45 = 0;
      v46 = 0;
      v47 = -3;
      v63 = vdupq_n_s64(1uLL);
      do
      {
        v48 = v46;
        objc_msgSend(v61, "window");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "window");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", objc_msgSend(v50, "count") + v47);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setBuffer:offset:atIndex:", v11, 0, 0);
        objc_msgSend(v46, "coefficients");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBuffer:offset:atIndex:", v51, 0, 1);

        objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_filterBuf, v45, 2);
        v71 = (unint64_t)objc_msgSend(v11, "length") >> 2;
        v72 = v63;
        v69 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_filterPipeline, "maxTotalThreadsPerThreadgroup");
        v70 = v63;
        objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v71, &v69);
        v45 += 4;
      }
      while (!__CFADD__(v47++, 1));
      v53 = 0;
      v54 = 1;
      v10 = v62;
      do
      {
        v55 = v54;
        objc_msgSend(v10, "window");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", (v53 | 0xFFFFFFFFFFFFFFFELL) + objc_msgSend(v57, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v62;
        objc_msgSend(v17, "setBuffer:offset:atIndex:", v11, 0, 0);
        objc_msgSend(v31, "coefficients");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBuffer:offset:atIndex:", v58, 0, 1);

        objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_filterBuf, 4 * v53 + 12, 2);
        v67 = (unint64_t)objc_msgSend(v11, "length") >> 2;
        v64 = vdupq_n_s64(1uLL);
        v68 = v64;
        v65 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_filterPipeline, "maxTotalThreadsPerThreadgroup");
        v66 = v64;
        objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v67, &v65);
        v54 = 0;
        v53 = 1;
        v46 = v31;
      }
      while ((v55 & 1) != 0);
LABEL_31:

      objc_msgSend(v17, "endEncoding");
      -[FigMetalContext commit](self->_metalContext, "commit");

      v27 = 0;
      v13 = v60;
      v14 = v61;
      goto LABEL_32;
    }
  }
LABEL_13:
  FigDebugAssert3();
  v27 = FigSignalErrorAt();

LABEL_32:
  return v27;
}

- (void)reset
{
  self->_iir1HistoryFactor = 0.0;
}

- (int)_fillSymetricFIRFilterBuffer:(id)a3 forWindow:(id)a4 referenceFramePts:(double)a5
{
  id v8;
  float *v9;
  void *v10;
  int v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float v15;
  void *v16;
  void *v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  float v26;

  v8 = a4;
  v9 = (float *)objc_msgSend(objc_retainAutorelease(a3), "contents");
  objc_msgSend(v8, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= 1)
  {
    v12 = 0;
    v13 = a5;
    v14 = v11;
    v15 = 0.0;
    do
    {
      objc_msgSend(v8, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "pts");
      v19 = v18;
      *(float *)&v18 = (float)(v19 - v13) / (float)((float)v11 / self->_gaussianScale);
      v20 = expf((float)(*(float *)&v18 * *(float *)&v18) * -0.5);
      v21 = 1.0 - (float)(vabds_f32(v13, v19) / self->_learningTime);
      v22 = 1.0 - v20;
      if (v21 >= 0.0)
        v23 = 1.0 - v21;
      else
        v23 = 1.0;
      v24 = 1.0 - (float)(v22 * v23);
      v9[v12] = v24;
      v15 = v15 + v24;

      ++v12;
    }
    while (v11 != v12);
    do
    {
      v25 = 1.0 / (double)v11;
      if (v15 > 0.00000011921)
        v25 = (float)(*v9 / v15);
      v26 = v25;
      *v9++ = v26;
      --v14;
    }
    while (v14);
  }

  return 0;
}

- (int)_fillIIROrder1FilterBuffer:(id)a3 historyFactor:(float)a4
{
  float *v5;

  v5 = (float *)objc_msgSend(objc_retainAutorelease(a3), "contents");
  *v5 = 1.0 - a4;
  v5[1] = a4;
  return 0;
}

- (int)_fillIIROrder3FilterBuffer:(id)a3 forNumOfFrames:(int)a4
{
  *($BAEEB071C8EBD08B0EE03522A6446772 *)objc_msgSend(objc_retainAutorelease(a3), "contents") = self->_iir3Coeffs;
  return 0;
}

- (int)_calculateGlobalRemixFactorForWindow:(id)a3 filteredWindow:(id)a4 remixFactor:(float *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  int v32;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= 0)
    {
      FigDebugAssert3();
      v32 = 0;
    }
    else
    {
      objc_msgSend(v9, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v17 = 0.0;
      v18 = 0.0;
      while (1)
      {
        objc_msgSend(v8, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          break;
        objc_msgSend(v20, "learnedRect");
        v22 = v21;
        v24 = v23;
        objc_msgSend(v20, "pts");
        v26 = v25;
        if (v14)
        {
          v27 = v25 - v17;
          v28 = -(v26 - v17);
          if (v26 - v17 >= 0.0)
            v28 = v26 - v17;
          if (v28 > 0.00000011920929)
            v18 = v18 + fabs((v22 * v24 - v16 * v15) / v27);
        }

        ++v14;
        v15 = v22;
        v16 = v24;
        v17 = v26;
        if (v11 == v14)
        {
          v29 = (v18 / (double)v11 + -0.05) * -100.0;
          v30 = (float)((float)(1.0 / (float)(expf(v29) + 1.0)) * (float)(1.0 - self->_iir1HistoryFactor));
          objc_msgSend(v13, "globalRemixFactor");
          *(float *)&v31 = v30 + v31 * self->_iir1HistoryFactor;
          *a5 = *(float *)&v31;

          v32 = 0;
          goto LABEL_12;
        }
      }
      FigDebugAssert3();

      v32 = -12780;
    }
  }
  else
  {
    FigDebugAssert3();
    v32 = -12780;
  }
LABEL_12:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterBuf, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_filterPipeline, 0);
}

@end

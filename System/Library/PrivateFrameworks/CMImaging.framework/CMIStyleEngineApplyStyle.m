@implementation CMIStyleEngineApplyStyle

- (id)_applyComputePipelineStateWithConstantsIsFast:(BOOL)a3 doManualInputYUVToRGBConversion:(BOOL)a4 doManualOutputRGBToYUVConversion:(BOOL)a5 isWithLumaGrad:(BOOL)a6 doGenerateSyntheticNoise:(BOOL)a7 applyDithering:(BOOL)a8
{
  return (id *)&self->_applyComputePipelineStates[(unint64_t)a3][(unint64_t)a4][(unint64_t)a5][a6][a7][a8];
}

- (CMIStyleEngineApplyStyle)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineApplyStyle *v5;
  CMIStyleEngineApplyStyle *v6;
  CMIStyleEngineApplyStyle *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIStyleEngineApplyStyle;
  v5 = -[CMIStyleEngineApplyStyle init](&v9, sel_init);
  v6 = v5;
  if (!v5 || -[CMIStyleEngineApplyStyle _compileShaders:](v5, "_compileShaders:", v4))
  {
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *v8;
  void *v9;
  void *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  unsigned __int8 v18;
  char v19;
  char v20;
  unsigned __int8 v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  unsigned __int8 v27;
  char v28;
  char v29;
  unsigned __int8 v30;
  char v31;
  char v32;
  id *v33;
  void **v34;
  uint64_t v35;
  void *v36;
  int v37;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  char v50;

  v4 = a3;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::FillLumaGradientHistogram"), 0);
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v6 = self->_nonApplyComputePipelineStates[1];
  self->_nonApplyComputePipelineStates[1] = v5;

  if (!self->_nonApplyComputePipelineStates[1])
    goto LABEL_23;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::FindMaxLumaGradient90ThPercentile"), 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_nonApplyComputePipelineStates[2];
  self->_nonApplyComputePipelineStates[2] = v7;

  if (!self->_nonApplyComputePipelineStates[2])
    goto LABEL_23;
  objc_msgSend(v4, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::CalculateResiduals"), v10);
    v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    v12 = self->_nonApplyComputePipelineStates[0];
    self->_nonApplyComputePipelineStates[0] = v11;

    if (self->_nonApplyComputePipelineStates[0])
    {
      v13 = v4;
      objc_msgSend(v4, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v14, "supportsFamily:", 1008);

      objc_msgSend(v10, "setConstantValue:type:withName:", &v50, 53, CFSTR("StyleEngine::simdShuffleFillSupported"));
      v15 = 0;
      v16 = 1;
      while (2)
      {
        v17 = 0;
        v39 = v16;
        v18 = v15 & 1;
        v19 = 1;
        do
        {
          v20 = 0;
          v40 = v19;
          v21 = v17 & 1;
          v22 = 1;
          while (2)
          {
            v23 = 0;
            v41 = v22;
            v24 = v20 & 1;
            v25 = 1;
            do
            {
              v26 = 0;
              v42 = v25;
              v27 = v23 & 1;
              v28 = 1;
              while (2)
              {
                v29 = 0;
                v43 = v28;
                v30 = v26 & 1;
                v31 = 1;
                do
                {
                  v32 = v31;
                  v49 = v27;
                  v48 = v21;
                  v47 = v24;
                  v46 = v18;
                  v45 = v30;
                  v44 = v29 & 1;
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v49, 53, CFSTR("StyleEngine::calculateLumaGradient"));
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v46, 53, CFSTR("StyleEngine::fastCoeffSampling"));
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v48, 53, CFSTR("StyleEngine::manualInputYUVToRGBConversion"));
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v47, 53, CFSTR("StyleEngine::manualOutputRGBToYUVConversion"));
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v45, 53, CFSTR("StyleEngine::applySyntheticNoise"));
                  objc_msgSend(v10, "setConstantValue:type:withName:", &v44, 53, CFSTR("StyleEngine::applyDithering"));
                  v33 = -[CMIStyleEngineApplyStyle _applyComputePipelineStateWithConstantsIsFast:doManualInputYUVToRGBConversion:doManualOutputRGBToYUVConversion:isWithLumaGrad:doGenerateSyntheticNoise:applyDithering:](self, "_applyComputePipelineStateWithConstantsIsFast:doManualInputYUVToRGBConversion:doManualOutputRGBToYUVConversion:isWithLumaGrad:doGenerateSyntheticNoise:applyDithering:", v46, v48, v47, v49, v45, v44);
                  if (!v33
                    || (v34 = v33,
                        objc_msgSend(v13, "computePipelineStateFor:constants:", CFSTR("StyleEngine::Apply"), v10),
                        v35 = objc_claimAutoreleasedReturnValue(),
                        v36 = *v34,
                        *v34 = (void *)v35,
                        v36,
                        !*v34))
                  {
                    FigDebugAssert3();
                    v37 = FigSignalErrorAt();

                    goto LABEL_21;
                  }
                  v31 = 0;
                  v29 = 1;
                }
                while ((v32 & 1) != 0);
                v28 = 0;
                v26 = 1;
                if ((v43 & 1) != 0)
                  continue;
                break;
              }
              v25 = 0;
              v23 = 1;
            }
            while ((v42 & 1) != 0);
            v22 = 0;
            v20 = 1;
            if ((v41 & 1) != 0)
              continue;
            break;
          }
          v19 = 0;
          v17 = 1;
        }
        while ((v40 & 1) != 0);
        v16 = 0;
        v15 = 1;
        if ((v39 & 1) != 0)
          continue;
        break;
      }

      v37 = 0;
LABEL_21:
      v4 = v13;
    }
    else
    {
      FigDebugAssert3();
      v37 = FigSignalErrorAt();

    }
  }
  else
  {
LABEL_23:
    FigDebugAssert3();
    v37 = FigSignalErrorAt();
  }

  return v37;
}

- (__n64)_ushort2FromCGSize:(double)a1
{
  __n64 result;

  result.n64_u32[0] = (int)a1;
  result.n64_u32[1] = (int)a2;
  return result;
}

- (__n64)_ushort2FromCGPoint:(double)a1
{
  __n64 result;

  result.n64_u32[0] = (int)a1;
  result.n64_u32[1] = (int)a2;
  return result;
}

- (__n64)_ushort2FromCGVector:(double)a1
{
  __n64 result;

  result.n64_u32[0] = (int)a1;
  result.n64_u32[1] = (int)a2;
  return result;
}

- (CGVector)_displacementFrom:(CGPoint)a3 to:(CGPoint)a4
{
  double v4;
  double v5;
  CGVector result;

  v4 = a4.x - a3.x;
  v5 = a4.y - a3.y;
  result.dy = v5;
  result.dx = v4;
  return result;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _BOOL8 v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  MTLBuffer **p_lumaGradientHistogramBuffer;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  float *p_inputReadNoiseVar;
  id v28;
  id v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  int32x2_t v36;
  __int16 v37;
  __int16 v38;
  int32x2_t v39;
  int32x2_t v40;
  MTLComputePipelineState *v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  id v51;
  float64x2_t *v52;
  uint64_t v53;
  _BOOL8 v54;
  MTLComputePipelineState *v55;
  id v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64x2_t v61;
  float64x2_t v62;
  MTLComputePipelineState *v68;
  id v69;
  uint64_t v70;
  _BOOL8 fastCoeffSampling;
  id v72;
  id *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  unint64_t v89;
  float *v90;
  int32x2_t v91;
  unsigned int v92;
  unsigned int v93;
  _BOOL4 v94;
  id v95;
  int64x2_t v96;
  uint64_t v97;
  int8x16_t v98;
  uint64_t v99;
  uint64_t v100;
  float inputSquaredNoiseVar;
  uint64_t v102;
  int64x2_t v103;
  int64x2_t v104;
  uint64_t v105;
  _QWORD v106[3];
  uint64x2_t v107;
  uint64_t v108;
  int v109;
  _QWORD v110[3];
  _QWORD v111[3];
  _WORD v112[2];
  _WORD v113[2];
  _WORD v114[2];
  _WORD v115[2];
  _WORD v116[2];
  _WORD v117[6];

  v95 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputLumaTexture);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_inputChromaTexture);
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  v7 = objc_loadWeakRetained((id *)&self->_outputLumaTexture);
  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_outputChromaTexture);
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  if ((v6 & 1) == 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_inputTexture);

    if (!v10)
      goto LABEL_18;
  }
  if (!v9)
  {
    v11 = objc_loadWeakRetained((id *)&self->_outputTexture);

    if (!v11)
      goto LABEL_18;
  }
  v12 = objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
  if (v12)
  {
    v13 = objc_loadWeakRetained((id *)&self->_targetThumbnailTexture);
    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)&self->_residualTexture);
      if (v14)
        v94 = self->_residualScaleFactor > 0.0;
      else
        v94 = 0;

    }
    else
    {
      v94 = 0;
    }

  }
  else
  {
    v94 = 0;
  }

  p_lumaGradientHistogramBuffer = &self->_lumaGradientHistogramBuffer;
  v17 = objc_loadWeakRetained((id *)&self->_lumaGradientHistogramBuffer);
  if (v17
    && (v18 = v17,
        v19 = objc_loadWeakRetained((id *)&self->_maxLumaGradient90thPercentileBuffer),
        v19,
        v18,
        v19))
  {
    v20 = objc_loadWeakRetained((id *)&self->_inputTexture);

    if (!v20)
      goto LABEL_18;
    objc_msgSend(v95, "blitCommandEncoder");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_18;
    v22 = (void *)v21;
    v23 = objc_loadWeakRetained((id *)&self->_lumaGradientHistogramBuffer);
    objc_msgSend(v22, "fillBuffer:range:value:", v23, 0, objc_msgSend(v23, "length"), 0);

    objc_msgSend(v22, "endEncoding");
    v24 = 1;
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v95, "computeCommandEncoder");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
LABEL_18:
    FigDebugAssert3();
    v15 = FigSignalErrorAt();
    goto LABEL_46;
  }
  v26 = (void *)v25;
  p_inputReadNoiseVar = &self->_inputReadNoiseVar;
  v28 = objc_loadWeakRetained((id *)&self->_linearSystemStatus);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", v28, 0, 9);

  v29 = objc_loadWeakRetained((id *)&self->_inputIntegratedCoefficientsTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v29, 8);

  objc_msgSend(v26, "setBytes:length:atIndex:", &self->_outputShouldBeLinear, 1, 2);
  -[CMIStyleEngineApplyStyle _ushort2FromCGPoint:](self, "_ushort2FromCGPoint:", self->_regionToRender.origin.x, self->_regionToRender.origin.y);
  v117[1] = v30;
  v117[0] = v31;
  -[CMIStyleEngineApplyStyle _displacementFrom:to:](self, "_displacementFrom:to:", self->_inputImageRect.origin.x, self->_inputImageRect.origin.y, self->_regionToRender.origin.x, self->_regionToRender.origin.y);
  -[CMIStyleEngineApplyStyle _ushort2FromCGVector:](self, "_ushort2FromCGVector:");
  v116[1] = v32;
  v116[0] = v33;
  -[CMIStyleEngineApplyStyle _displacementFrom:to:](self, "_displacementFrom:to:", self->_deltaImageRect.origin.x, self->_deltaImageRect.origin.y, self->_regionToRender.origin.x, self->_regionToRender.origin.y);
  -[CMIStyleEngineApplyStyle _ushort2FromCGVector:](self, "_ushort2FromCGVector:");
  v115[1] = v34;
  v115[0] = v35;
  -[CMIStyleEngineApplyStyle _displacementFrom:to:](self, "_displacementFrom:to:", self->_outputImageRect.origin.x, self->_outputImageRect.origin.y, self->_regionToRender.origin.x, self->_regionToRender.origin.y);
  -[CMIStyleEngineApplyStyle _ushort2FromCGVector:](self, "_ushort2FromCGVector:");
  v91 = v36;
  v114[1] = v36.i16[2];
  v114[0] = v36.i16[0];
  -[CMIStyleEngineApplyStyle _ushort2FromCGSize:](self, "_ushort2FromCGSize:", self->_imageSize.width, self->_imageSize.height);
  v113[1] = v37;
  v113[0] = v38;
  -[CMIStyleEngineApplyStyle _ushort2FromCGSize:](self, "_ushort2FromCGSize:", self->_regionToRender.size.width, self->_regionToRender.size.height);
  v40 = vadd_s32(v91, v39);
  v112[1] = v40.i16[2];
  v112[0] = v40.i16[0];
  objc_msgSend(v26, "setBytes:length:atIndex:", v117, 4, 6);
  objc_msgSend(v26, "setBytes:length:atIndex:", v116, 4, 3);
  objc_msgSend(v26, "setBytes:length:atIndex:", v115, 4, 4);
  objc_msgSend(v26, "setBytes:length:atIndex:", v114, 4, 5);
  objc_msgSend(v26, "setBytes:length:atIndex:", v113, 4, 7);
  objc_msgSend(v26, "setBytes:length:atIndex:", v112, 4, 8);
  if (v94)
  {
    v41 = self->_nonApplyComputePipelineStates[0];
    objc_msgSend(v26, "setComputePipelineState:", v41);
    v42 = -[MTLComputePipelineState threadExecutionWidth](v41, "threadExecutionWidth");
    v43 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v41, "maxTotalThreadsPerThreadgroup");
    v89 = v43 / -[MTLComputePipelineState threadExecutionWidth](v41, "threadExecutionWidth");
    objc_msgSend(v26, "setImageblockWidth:height:", v42);
    v92 = v6;
    v44 = objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v44, 0);

    v45 = objc_loadWeakRetained((id *)&self->_targetThumbnailTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v45, 3);

    v46 = objc_loadWeakRetained((id *)&self->_residualTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v46, 4);

    objc_msgSend(v26, "setBytes:length:atIndex:", &self->_inputThumbnailIsLinear, 1, 0);
    objc_msgSend(v26, "setBytes:length:atIndex:", &self->_targetThumbnailIsLinear, 1, 1);
    objc_msgSend(v26, "setBytes:length:atIndex:", &self->_residualScaleFactor, 4, 10);
    v47 = objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
    v48 = v24;
    v49 = v9;
    v50 = objc_msgSend(v47, "width");
    v51 = objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);

    v111[0] = v50;
    v111[1] = objc_msgSend(v51, "height");
    v9 = v49;
    v24 = v48;
    p_inputReadNoiseVar = &self->_inputReadNoiseVar;
    v111[2] = 1;
    v110[0] = v42;
    p_lumaGradientHistogramBuffer = &self->_lumaGradientHistogramBuffer;
    v110[1] = v89;
    v110[2] = 1;
    objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v111, v110);

    v6 = v92;
  }
  v52 = (float64x2_t *)(p_inputReadNoiseVar + 75);
  if ((_DWORD)v24)
  {
    v90 = p_inputReadNoiseVar;
    v93 = v24;
    v53 = v6;
    v54 = v9;
    v109 = 262148;
    v55 = self->_nonApplyComputePipelineStates[1];
    objc_msgSend(v26, "setComputePipelineState:", v55);
    v56 = objc_loadWeakRetained((id *)&self->_inputTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v56, 0);

    objc_msgSend(v26, "setBytes:length:atIndex:", &self->_inputIsLinear, 1, 0);
    objc_msgSend(v26, "setBytes:length:atIndex:", &v109, 4, 15);
    v57 = objc_loadWeakRetained((id *)p_lumaGradientHistogramBuffer);
    objc_msgSend(v26, "setBuffer:offset:atIndex:", v57, 0, 16);

    v58 = -[MTLComputePipelineState threadExecutionWidth](v55, "threadExecutionWidth");
    v59 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v55, "maxTotalThreadsPerThreadgroup");
    v60 = -[MTLComputePipelineState threadExecutionWidth](v55, "threadExecutionWidth");
    v61.i64[0] = (unsigned __int16)v109;
    v61.i64[1] = HIWORD(v109);
    v62 = vcvtq_f64_u64(v61);
    __asm { FMOV            V2.2D, #-1.0 }
    v107 = vcvtq_u64_f64(vdivq_f64(vaddq_f64(vaddq_f64(*v52, v62), _Q2), v62));
    v108 = 1;
    v106[0] = v58;
    v106[1] = v59 / v60;
    v106[2] = 1;
    objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", &v107, v106);
    v68 = self->_nonApplyComputePipelineStates[2];

    objc_msgSend(v26, "setComputePipelineState:", v68);
    v69 = objc_loadWeakRetained((id *)&self->_maxLumaGradient90thPercentileBuffer);
    objc_msgSend(v26, "setBuffer:offset:atIndex:", v69, 0, 17);

    v104 = vdupq_n_s64(1uLL);
    v105 = 1;
    if ((unint64_t)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v68, "maxTotalThreadsPerThreadgroup") > 0xFF)v70 = 256;
    else
      v70 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v68, "maxTotalThreadsPerThreadgroup");
    v102 = v70;
    v103 = vdupq_n_s64(1uLL);
    objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", &v104, &v102);
    v100 = *(_QWORD *)v90;
    inputSquaredNoiseVar = self->_inputSquaredNoiseVar;
    objc_msgSend(v26, "setBytes:length:atIndex:", &v100, 12, 18);

    v9 = v54;
    v6 = v53;
    v24 = v93;
  }
  fastCoeffSampling = self->_fastCoeffSampling;
  v72 = objc_loadWeakRetained((id *)&self->_outputLumaGradientTexture);
  v73 = -[CMIStyleEngineApplyStyle _applyComputePipelineStateWithConstantsIsFast:doManualInputYUVToRGBConversion:doManualOutputRGBToYUVConversion:isWithLumaGrad:doGenerateSyntheticNoise:applyDithering:](self, "_applyComputePipelineStateWithConstantsIsFast:doManualInputYUVToRGBConversion:doManualOutputRGBToYUVConversion:isWithLumaGrad:doGenerateSyntheticNoise:applyDithering:", fastCoeffSampling, v6, v9, v72 != 0, v24, self->_applyDithering);

  if (!v73 || !*v73)
  {
    FigDebugAssert3();
    v15 = FigSignalErrorAt();

    goto LABEL_46;
  }
  objc_msgSend(v26, "setComputePipelineState:");
  objc_msgSend(v26, "setImageblockWidth:height:", 32, 32);
  objc_msgSend(v26, "setBytes:length:atIndex:", &self->_inputIsLinear, 1, 0);
  if (!(_DWORD)v6)
  {
    v77 = objc_loadWeakRetained((id *)&self->_inputTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v77, 0);

    if (!v9)
      goto LABEL_40;
LABEL_42:
    v78 = objc_loadWeakRetained((id *)&self->_outputLumaTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v78, 6);

    v79 = objc_loadWeakRetained((id *)&self->_outputChromaTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v79, 7);

    objc_msgSend(v26, "setBytes:length:atIndex:", self->_anon_3b0, 64, 14);
    goto LABEL_43;
  }
  v74 = objc_loadWeakRetained((id *)&self->_inputLumaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v74, 1);

  v75 = objc_loadWeakRetained((id *)&self->_inputChromaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v75, 2);

  objc_msgSend(v26, "setBytes:length:atIndex:", self->_anon_370, 64, 11);
  if (v9)
    goto LABEL_42;
LABEL_40:
  v76 = objc_loadWeakRetained((id *)&self->_outputTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v76, 4);

LABEL_43:
  v80 = objc_loadWeakRetained((id *)&self->_inputDeltaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v80, 10);

  v81 = objc_loadWeakRetained((id *)&self->_inputDeltaLumaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v81, 11);

  v82 = objc_loadWeakRetained((id *)&self->_inputDeltaChromaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v82, 12);

  v83 = objc_loadWeakRetained((id *)&self->_inputOriginalTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v83, 13);

  v84 = objc_loadWeakRetained((id *)&self->_inputOriginalLumaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v84, 14);

  v85 = objc_loadWeakRetained((id *)&self->_inputOriginalChromaTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v85, 15);

  v86 = objc_loadWeakRetained((id *)&self->_outputLumaGradientTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v86, 5);

  objc_msgSend(v26, "setBytes:length:atIndex:", self->_anon_3f0, 64, 12);
  objc_msgSend(v26, "setBytes:length:atIndex:", &self[1], 64, 13);
  if (v94)
  {
    v87 = objc_loadWeakRetained((id *)&self->_residualTexture);
    objc_msgSend(v26, "setTexture:atIndex:", v87, 9);

  }
  v98 = vandq_s8((int8x16_t)vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), (uint64x2_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(*v52), vdupq_n_s64(1uLL)), 1uLL), (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFF0));
  v99 = 1;
  v96 = vdupq_n_s64(0x10uLL);
  v97 = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", &v98, &v96);
  objc_msgSend(v26, "endEncoding");

  v15 = 0;
LABEL_46:

  return v15;
}

- (BOOL)fastCoeffSampling
{
  return self->_fastCoeffSampling;
}

- (void)setFastCoeffSampling:(BOOL)a3
{
  self->_fastCoeffSampling = a3;
}

- (MTLTexture)inputLumaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputLumaTexture);
}

- (void)setInputLumaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputLumaTexture, a3);
}

- (MTLTexture)inputChromaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputChromaTexture);
}

- (void)setInputChromaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputChromaTexture, a3);
}

- (MTLTexture)outputLumaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputLumaTexture);
}

- (void)setOutputLumaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputLumaTexture, a3);
}

- (MTLTexture)outputChromaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputChromaTexture);
}

- (void)setOutputChromaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputChromaTexture, a3);
}

- (__n128)ccmYUVToRGB
{
  return a1[55];
}

- (__n128)setCcmYUVToRGB:(__n128)a3
{
  result[55] = a2;
  result[56] = a3;
  result[57] = a4;
  result[58] = a5;
  return result;
}

- (__n128)ccmRGBToYUV
{
  return a1[59];
}

- (__n128)setCcmRGBToYUV:(__n128)a3
{
  result[59] = a2;
  result[60] = a3;
  result[61] = a4;
  result[62] = a5;
  return result;
}

- (MTLTexture)inputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputTexture);
}

- (void)setInputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputTexture, a3);
}

- (BOOL)inputIsLinear
{
  return self->_inputIsLinear;
}

- (void)setInputIsLinear:(BOOL)a3
{
  self->_inputIsLinear = a3;
}

- (MTLTexture)inputIntegratedCoefficientsTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputIntegratedCoefficientsTexture);
}

- (void)setInputIntegratedCoefficientsTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputIntegratedCoefficientsTexture, a3);
}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputTexture);
}

- (void)setOutputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputTexture, a3);
}

- (BOOL)outputShouldBeLinear
{
  return self->_outputShouldBeLinear;
}

- (void)setOutputShouldBeLinear:(BOOL)a3
{
  self->_outputShouldBeLinear = a3;
}

- (MTLTexture)inputThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
}

- (void)setInputThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputThumbnailTexture, a3);
}

- (BOOL)inputThumbnailIsLinear
{
  return self->_inputThumbnailIsLinear;
}

- (void)setInputThumbnailIsLinear:(BOOL)a3
{
  self->_inputThumbnailIsLinear = a3;
}

- (MTLTexture)targetThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_targetThumbnailTexture);
}

- (void)setTargetThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_targetThumbnailTexture, a3);
}

- (BOOL)targetThumbnailIsLinear
{
  return self->_targetThumbnailIsLinear;
}

- (void)setTargetThumbnailIsLinear:(BOOL)a3
{
  self->_targetThumbnailIsLinear = a3;
}

- (MTLTexture)residualTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_residualTexture);
}

- (void)setResidualTexture:(id)a3
{
  objc_storeWeak((id *)&self->_residualTexture, a3);
}

- (float)residualScaleFactor
{
  return self->_residualScaleFactor;
}

- (void)setResidualScaleFactor:(float)a3
{
  self->_residualScaleFactor = a3;
}

- (MTLBuffer)linearSystemStatus
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_linearSystemStatus);
}

- (void)setLinearSystemStatus:(id)a3
{
  objc_storeWeak((id *)&self->_linearSystemStatus, a3);
}

- (MTLTexture)inputDeltaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputDeltaTexture);
}

- (void)setInputDeltaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputDeltaTexture, a3);
}

- (MTLTexture)inputDeltaLumaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputDeltaLumaTexture);
}

- (void)setInputDeltaLumaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputDeltaLumaTexture, a3);
}

- (MTLTexture)inputDeltaChromaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputDeltaChromaTexture);
}

- (void)setInputDeltaChromaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputDeltaChromaTexture, a3);
}

- (__n128)ccmYUVToRGBDelta
{
  return a1[63];
}

- (__n128)setCcmYUVToRGBDelta:(__n128)a3
{
  result[63] = a2;
  result[64] = a3;
  result[65] = a4;
  result[66] = a5;
  return result;
}

- (MTLTexture)inputOriginalTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputOriginalTexture);
}

- (void)setInputOriginalTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputOriginalTexture, a3);
}

- (MTLTexture)inputOriginalLumaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputOriginalLumaTexture);
}

- (void)setInputOriginalLumaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputOriginalLumaTexture, a3);
}

- (MTLTexture)inputOriginalChromaTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputOriginalChromaTexture);
}

- (void)setInputOriginalChromaTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputOriginalChromaTexture, a3);
}

- (__n128)ccmYUVToRGBOriginal
{
  return a1[67];
}

- (__n128)setCcmYUVToRGBOriginal:(__n128)a3
{
  result[67] = a2;
  result[68] = a3;
  result[69] = a4;
  result[70] = a5;
  return result;
}

- (MTLTexture)outputLumaGradientTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputLumaGradientTexture);
}

- (void)setOutputLumaGradientTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputLumaGradientTexture, a3);
}

- (MTLBuffer)lumaGradientHistogramBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_lumaGradientHistogramBuffer);
}

- (void)setLumaGradientHistogramBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_lumaGradientHistogramBuffer, a3);
}

- (MTLBuffer)maxLumaGradient90thPercentileBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_maxLumaGradient90thPercentileBuffer);
}

- (void)setMaxLumaGradient90thPercentileBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_maxLumaGradient90thPercentileBuffer, a3);
}

- (float)inputReadNoiseVar
{
  return self->_inputReadNoiseVar;
}

- (void)setInputReadNoiseVar:(float)a3
{
  self->_inputReadNoiseVar = a3;
}

- (float)inputShotNoiseVar
{
  return self->_inputShotNoiseVar;
}

- (void)setInputShotNoiseVar:(float)a3
{
  self->_inputShotNoiseVar = a3;
}

- (float)inputSquaredNoiseVar
{
  return self->_inputSquaredNoiseVar;
}

- (void)setInputSquaredNoiseVar:(float)a3
{
  self->_inputSquaredNoiseVar = a3;
}

- (BOOL)applyDithering
{
  return self->_applyDithering;
}

- (void)setApplyDithering:(BOOL)a3
{
  self->_applyDithering = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGRect)inputImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputImageRect.origin.x;
  y = self->_inputImageRect.origin.y;
  width = self->_inputImageRect.size.width;
  height = self->_inputImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputImageRect:(CGRect)a3
{
  self->_inputImageRect = a3;
}

- (CGRect)deltaImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_deltaImageRect.origin.x;
  y = self->_deltaImageRect.origin.y;
  width = self->_deltaImageRect.size.width;
  height = self->_deltaImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDeltaImageRect:(CGRect)a3
{
  self->_deltaImageRect = a3;
}

- (CGRect)outputImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outputImageRect.origin.x;
  y = self->_outputImageRect.origin.y;
  width = self->_outputImageRect.size.width;
  height = self->_outputImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOutputImageRect:(CGRect)a3
{
  self->_outputImageRect = a3;
}

- (CGRect)regionToRender
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionToRender.origin.x;
  y = self->_regionToRender.origin.y;
  width = self->_regionToRender.size.width;
  height = self->_regionToRender.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRegionToRender:(CGRect)a3
{
  self->_regionToRender = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_maxLumaGradient90thPercentileBuffer);
  objc_destroyWeak((id *)&self->_lumaGradientHistogramBuffer);
  objc_destroyWeak((id *)&self->_outputLumaGradientTexture);
  objc_destroyWeak((id *)&self->_inputOriginalChromaTexture);
  objc_destroyWeak((id *)&self->_inputOriginalLumaTexture);
  objc_destroyWeak((id *)&self->_inputOriginalTexture);
  objc_destroyWeak((id *)&self->_inputDeltaChromaTexture);
  objc_destroyWeak((id *)&self->_inputDeltaLumaTexture);
  objc_destroyWeak((id *)&self->_inputDeltaTexture);
  objc_destroyWeak((id *)&self->_linearSystemStatus);
  objc_destroyWeak((id *)&self->_residualTexture);
  objc_destroyWeak((id *)&self->_targetThumbnailTexture);
  objc_destroyWeak((id *)&self->_inputThumbnailTexture);
  objc_destroyWeak((id *)&self->_outputTexture);
  objc_destroyWeak((id *)&self->_inputIntegratedCoefficientsTexture);
  objc_destroyWeak((id *)&self->_inputTexture);
  objc_destroyWeak((id *)&self->_outputChromaTexture);
  objc_destroyWeak((id *)&self->_outputLumaTexture);
  objc_destroyWeak((id *)&self->_inputChromaTexture);
  objc_destroyWeak((id *)&self->_inputLumaTexture);
  for (i = 536; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end

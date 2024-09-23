@implementation CMIFFTEncode

- (CMIFFTEncode)initWithContext:(id)a3
{
  id v5;
  CMIFFTEncode *v6;
  CMIFFTEncode *v7;
  void *v8;
  void *v9;
  void *v10;
  CMIFFTEncode *v11;
  uint64_t v12;
  NSArray *supportedFactors;
  void *v14;
  MTLComputePipelineState *transpose2DBufferPipelineState;
  CMIFFTEncode *v16;
  void *v17;
  MTLComputePipelineState *transpose3DBufferPipelineState;
  CMIFFTEncode *v19;
  void *v20;
  MTLComputePipelineState *applyTwiddlesPipelineState;
  CMIFFTEncode *v22;
  void *v23;
  MTLComputePipelineState *unscrambleMixedRadixPipelineState;
  CMIFFTEncode *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CMIFFTEncode;
  v6 = -[CMIFFTEncode init](&v54, sel_init);
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (!v5 || !v6)
    goto LABEL_24;
  objc_storeStrong((id *)&v6->_context, a3);
  v9 = (void *)objc_opt_new();
  if (!v9)
  {
    v8 = 0;
    v10 = 0;
    goto LABEL_28;
  }
  v10 = (void *)objc_opt_new();
  if (!v10)
  {
    v8 = 0;
    goto LABEL_28;
  }
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v12 = objc_claimAutoreleasedReturnValue();
  supportedFactors = v7->_supportedFactors;
  v7->_supportedFactors = (NSArray *)v12;

  -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "computePipelineStateFor:constants:", CFSTR("CMIFFT::transposeBuffer2D"), 0);
  v11 = (CMIFFTEncode *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_25;
  transpose2DBufferPipelineState = v7->_transpose2DBufferPipelineState;
  v7->_transpose2DBufferPipelineState = (MTLComputePipelineState *)v11;
  v16 = v11;

  -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "computePipelineStateFor:constants:", CFSTR("CMIFFT::transposeBuffer3D"), 0);
  v11 = (CMIFFTEncode *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_25;
  transpose3DBufferPipelineState = v7->_transpose3DBufferPipelineState;
  v7->_transpose3DBufferPipelineState = (MTLComputePipelineState *)v11;
  v19 = v11;

  -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "computePipelineStateFor:constants:", CFSTR("CMIFFT::applyTwiddles"), 0);
  v11 = (CMIFFTEncode *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_25;
  applyTwiddlesPipelineState = v7->_applyTwiddlesPipelineState;
  v7->_applyTwiddlesPipelineState = (MTLComputePipelineState *)v11;
  v22 = v11;

  -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "computePipelineStateFor:constants:", CFSTR("CMIFFT::unscrambleMixedRadix"), 0);
  v11 = (CMIFFTEncode *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_25:
    v8 = 0;
    goto LABEL_24;
  }
  unscrambleMixedRadixPipelineState = v7->_unscrambleMixedRadixPipelineState;
  v7->_unscrambleMixedRadixPipelineState = (MTLComputePipelineState *)v11;
  v25 = v11;

  -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "computePipelineStateFor:constants:", CFSTR("CMIFFT::realToComplexShim"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_28:
    v11 = 0;
    goto LABEL_24;
  }
  v41 = v5;
  objc_storeStrong((id *)&v7->_realToComplexShimPipelineState, v8);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = objc_msgSend(&unk_1E9514210, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v45)
  {
    v43 = v9;
    v44 = *(_QWORD *)v51;
    v42 = v10;
    while (2)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(&unk_1E9514210);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v27);
        v49 = 0;
        v46 = v28;
        v47 = v27;
        v49 = (int)objc_msgSend(v28, "intValue");
        v29 = (void *)objc_opt_new();
        v30 = (void *)objc_opt_new();
        if (-[NSArray count](v7->_supportedFactors, "count"))
        {
          v31 = 0;
          while (1)
          {
            v48 = 0;
            -[NSArray objectAtIndexedSubscript:](v7->_supportedFactors, "objectAtIndexedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "intValue");

            v48 = v33;
            v34 = (void *)objc_opt_new();
            objc_msgSend(v34, "setConstantValue:type:atIndex:", &v48, 29, 0);
            objc_msgSend(v34, "setConstantValue:type:atIndex:", &v49, 29, 1);
            -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "computePipelineStateFor:constants:", CFSTR("CMIFFT::StockhamMetal1DBatched"), v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
              break;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, v37);

            -[CMIFFTContext figMetalContext](v7->_context, "figMetalContext");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "computePipelineStateFor:constants:", CFSTR("CMIFFT::StockhamMetal1DThreadgroup"), v34);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v8)
              break;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v8, v39);

            if (-[NSArray count](v7->_supportedFactors, "count") <= ++v31)
              goto LABEL_20;
          }

          v8 = 0;
          v11 = 0;
          v5 = v41;
          v10 = v42;
          v9 = v43;
          goto LABEL_24;
        }
LABEL_20:
        v9 = v43;
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v29, v46);
        v10 = v42;
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v30, v46);

        v27 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(&unk_1E9514210, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v45)
        continue;
      break;
    }
  }
  objc_storeStrong((id *)&v7->_transform1DGlobalPipelineStates, v9);
  objc_storeStrong((id *)&v7->_transform1DThreadgroupPipelineStates, v10);
  v11 = v7;
  v5 = v41;
LABEL_24:

  return v11;
}

- (id)_encode1DBatchedGlobalSingleRadixTransform:(id)a3 inputBuffer:(id)a4 scratchBuffer:(id)a5 batchSize:(unint64_t)a6 depthBatchSize:(unint64_t)a7 bufferOffset:(unint64_t)a8 config:(CMIFFTStockhamConfig *)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t var0;
  unint64_t var2;
  id v18;
  id v19;
  NSDictionary *transform1DGlobalPipelineStates;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t i;
  void *v36;
  id v37;
  id v38;
  id v39;
  unint64_t v42;
  int64x2_t v43;
  _QWORD v44[3];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  var0 = a9->var0;
  var2 = a9->var2;
  v18 = v14;
  v45[0] = v18;
  v19 = v15;
  v45[1] = v19;
  if (var2 < 2)
  {
    v33 = 0;
    v26 = 0;
    v24 = 0;
  }
  else
  {
    transform1DGlobalPipelineStates = self->_transform1DGlobalPipelineStates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](transform1DGlobalPipelineStates, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", var2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v13, "computeCommandEncoder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "setComputePipelineState:", v24);
        v27 = objc_msgSend(v24, "maxTotalThreadsPerThreadgroup");
        v28 = v18;
        if (a9->var1 >= 2)
        {
          v36 = v24;
          v37 = v19;
          v38 = v18;
          v39 = v13;
          v29 = v27;
          v30 = 1;
          v31 = 1;
          do
          {
            objc_msgSend(v26, "setBuffer:offset:atIndex:", v45[1 - v31], a8, 0, v36, v37, v38, v39);
            v28 = (void *)v45[v31];
            objc_msgSend(v26, "setBuffer:offset:atIndex:", v28, a8, 1);
            a9->var4 = v30;
            objc_msgSend(v26, "setBytes:length:atIndex:", a9, 64, 2);
            v32 = a9->var1 / a9->var2;
            v44[0] = v32;
            v44[1] = a6;
            v44[2] = a7;
            if (v32 >= v29)
              v32 = v29;
            v42 = v32;
            v43 = vdupq_n_s64(1uLL);
            objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v44, &v42);
            v30 = (int)v30 * (int)var2;
            v31 = 1 - v31;
          }
          while (v30 < a9->var1);
          v18 = v38;
          v13 = v39;
          v24 = v36;
          v19 = v37;
        }
        objc_msgSend(v26, "endEncoding");
        v33 = v28;
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
      v26 = 0;
    }
  }
  for (i = 1; i != -1; --i)

  return v33;
}

- (id)_encode1DBatchedThreadgroupSingleRadixTransform:(id)a3 inputBuffer:(id)a4 scratchBuffer:(id)a5 batchSize:(unint64_t)a6 depthBatchSize:(unint64_t)a7 bufferOffset:(unint64_t)a8 config:(CMIFFTStockhamConfig *)a9 typeStride:(unint64_t)a10
{
  id v16;
  id v17;
  unint64_t var2;
  NSDictionary *transform1DThreadgroupPipelineStates;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  unint64_t v30;
  id v31;
  unint64_t v32;
  int64x2_t v33;
  _QWORD v34[3];

  v31 = a3;
  v16 = a4;
  v17 = a5;
  var2 = a9->var2;
  if (var2 < 2)
  {
    v28 = 0;
    v26 = 0;
    v23 = 0;
  }
  else
  {
    v30 = a6;
    transform1DThreadgroupPipelineStates = self->_transform1DThreadgroupPipelineStates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a9->var0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](transform1DThreadgroupPipelineStates, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", var2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_msgSend(v23, "maxTotalThreadsPerThreadgroup");
      objc_msgSend(v31, "computeCommandEncoder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "setComputePipelineState:", v23);
        objc_msgSend(v26, "setBuffer:offset:atIndex:", v16, a8, 0);
        objc_msgSend(v26, "setBuffer:offset:atIndex:", v17, a8, 1);
        objc_msgSend(v26, "setThreadgroupMemoryLength:atIndex:", 2 * a10 * a9->var1, 0);
        objc_msgSend(v26, "setBytes:length:atIndex:", a9, 64, 2);
        v34[0] = 1;
        v34[1] = v30;
        v34[2] = a7;
        v27 = a9->var1 / a9->var2;
        if (v27 >= v24)
          v27 = v24;
        v32 = v27;
        v33 = vdupq_n_s64(1uLL);
        objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v34, &v32);
        objc_msgSend(v26, "endEncoding");
        v28 = v17;
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
      v26 = 0;
    }
  }

  return v28;
}

- (id)encode1DTransform:(id)a3 inputBuffer:(id)a4 scratchBuffer:(id)a5 batchSize:(unint64_t)a6 depthBatchSize:(unint64_t)a7 bufferOffset:(unint64_t)a8 config:(CMIFFTStockhamConfig *)a9
{
  id v13;
  id v14;
  id v15;
  NSDictionary *transform1DThreadgroupPipelineStates;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t var1;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  transform1DThreadgroupPipelineStates = self->_transform1DThreadgroupPipelineStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a9->var0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](transform1DThreadgroupPipelineStates, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a9->var2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_5;
  v21 = objc_msgSend(v20, "maxTotalThreadsPerThreadgroup");
  -[CMIFFTContext device](self->_context, "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "maxThreadgroupMemoryLength");

  if (a9->var0)
  {
    if (a9->var0 == 1)
    {
      v24 = 2;
      goto LABEL_7;
    }
LABEL_5:
    v25 = 0;
    goto LABEL_12;
  }
  v24 = 4;
LABEL_7:
  var1 = a9->var1;
  if (v21 <= var1 / a9->var2 || v23 <= 2 * v24 * var1)
  {
    v30 = *(_OWORD *)&a9->var2;
    v35 = *(_OWORD *)&a9->var0;
    v36 = v30;
    v31 = *(_OWORD *)&a9->var6;
    v37 = *(_OWORD *)&a9->var4;
    v38 = v31;
    -[CMIFFTEncode _encode1DBatchedGlobalSingleRadixTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](self, "_encode1DBatchedGlobalSingleRadixTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v13, v14, v15, a6, a7, a8, &v35);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = *(_OWORD *)&a9->var2;
    v35 = *(_OWORD *)&a9->var0;
    v36 = v27;
    v28 = *(_OWORD *)&a9->var6;
    v37 = *(_OWORD *)&a9->var4;
    v38 = v28;
    -[CMIFFTEncode _encode1DBatchedThreadgroupSingleRadixTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:typeStride:](self, "_encode1DBatchedThreadgroupSingleRadixTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:typeStride:", v13, v14, v15, a6, a7, a8, &v35, v24);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v29;
LABEL_12:

  return v25;
}

- (int64_t)encodeTransposeBuffer2D:(id)a3 inputBuffer:(id)a4 outputBuffer:(id)a5 bufferOffset:(unint64_t)a6 batchSize:(unint64_t)a7 config:(CMIFFTTransposeConfig *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  int8x16_t v18;
  int64_t v19;
  int8x16_t v21;
  uint64_t v22;
  uint64x2_t v23;
  unint64_t v24;

  v14 = a4;
  v15 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setComputePipelineState:", self->_transpose2DBufferPipelineState);
    objc_msgSend(v17, "setBuffer:offset:atIndex:", v14, a6, 0);
    objc_msgSend(v17, "setBuffer:offset:atIndex:", v15, a6, 1);
    objc_msgSend(v17, "setBytes:length:atIndex:", a8, 104, 2);
    v24 = a7;
    v23 = *(uint64x2_t *)a8->var4;
    v18 = (int8x16_t)vdupq_n_s64(0x10uLL);
    v21 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v18, v23), (int8x16_t)v23, v18);
    v22 = 1;
    objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", &v23, &v21);
    objc_msgSend(v17, "endEncoding");
    v19 = 0;
  }
  else
  {
    v19 = -73468;
  }

  return v19;
}

- (int64_t)encodeTransposeBuffer3D:(id)a3 inputBuffer:(id)a4 outputBuffer:(id)a5 bufferOffset:(unint64_t)a6 batchSize:(unint64_t)a7 config:(CMIFFTTransposeConfig *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int64_t v18;
  int64x2_t v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;

  v13 = a4;
  v14 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setComputePipelineState:", self->_transpose3DBufferPipelineState);
    objc_msgSend(v16, "setBuffer:offset:atIndex:", v13, a6, 0);
    objc_msgSend(v16, "setBuffer:offset:atIndex:", v14, a6, 1);
    objc_msgSend(v16, "setBytes:length:atIndex:", a8, 104, 2);
    v17 = a8->var4[2];
    v22 = *(_OWORD *)a8->var4;
    v23 = v17;
    v20 = vdupq_n_s64(0x10uLL);
    v21 = 4;
    objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", &v22, &v20);
    objc_msgSend(v16, "endEncoding");
    v18 = 0;
  }
  else
  {
    v18 = -73468;
  }

  return v18;
}

- (int64_t)encodeApplyTwiddles:(id)a3 inputBuffer:(id)a4 config:(CMIFFTTwiddleConfig *)a5 N1:(unint64_t)a6 N2:(unint64_t)a7 bufferOffset:(unint64_t)a8 batchSize:(unint64_t)a9
{
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v15 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setComputePipelineState:", self->_applyTwiddlesPipelineState);
    objc_msgSend(v17, "setBuffer:offset:atIndex:", v15, a8, 0);
    objc_msgSend(v17, "setBytes:length:atIndex:", a5, 24, 2);
    v23[0] = a6;
    v23[1] = a7;
    v23[2] = a9;
    v18 = 16;
    if (a6 >= 0x10)
      v19 = 16;
    else
      v19 = a6;
    if (a7 < 0x10)
      v18 = a7;
    v22[0] = v19;
    v22[1] = v18;
    v22[2] = 1;
    objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", v23, v22);
    objc_msgSend(v17, "endEncoding");
    v20 = 0;
  }
  else
  {
    v20 = -73468;
  }

  return v20;
}

- (int64_t)encodeUnscrambleMixedRadix:(id)a3 inputBuffer:(id)a4 outputBuffer:(id)a5 config:(CMIFFTUnscrambleConfig *)a6 sizes:(id)a7 bufferoffset:(unint64_t)a8 batchSize:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  _DWORD *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t var2;
  unint64_t v26;
  int64_t v27;
  CMIFFTEncode *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[3];

  v29 = self;
  v14 = a3;
  v31 = a4;
  v15 = a5;
  v16 = a7;
  v17 = malloc_type_malloc(4 * objc_msgSend(v16, "count"), 0x100004052888210uLL);
  if (objc_msgSend(v16, "count"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v18, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Size"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17[v18] = objc_msgSend(v20, "intValue");

      ++v18;
    }
    while (objc_msgSend(v16, "count") > v18);
  }
  v21 = v14;
  objc_msgSend(v14, "computeCommandEncoder", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "setComputePipelineState:", *(_QWORD *)(v30 + 56));
    v24 = v31;
    objc_msgSend(v23, "setBuffer:offset:atIndex:", v31, a8, 0);
    objc_msgSend(v23, "setBuffer:offset:atIndex:", v15, a8, 1);
    objc_msgSend(v23, "setBytes:length:atIndex:", a6, 32, 2);
    objc_msgSend(v23, "setBytes:length:atIndex:", v17, 4 * objc_msgSend(v16, "count"), 3);
    var2 = a6->var2;
    v33[0] = var2;
    v33[1] = a9;
    v33[2] = 1;
    v26 = 16;
    if ((int)var2 >= 16)
      LODWORD(var2) = 16;
    if (a9 < 0x10)
      v26 = a9;
    v32[0] = (int)var2;
    v32[1] = v26;
    v32[2] = 1;
    objc_msgSend(v23, "dispatchThreads:threadsPerThreadgroup:", v33, v32);
    objc_msgSend(v23, "endEncoding");
    v27 = 0;
  }
  else
  {
    v27 = -73468;
    v24 = v31;
  }
  free(v17);

  return v27;
}

- (int64_t)encodeRealToComplexShim:(id)a3 inputBuffer:(id)a4 outputBuffer:(id)a5 config:(CMIFFTRealToComplexConfig *)a6 sizes:
{
  int8x16_t *v6;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int8x16_t v15;
  int64_t v16;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t v23;

  v18 = v6[1];
  v19 = *v6;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setComputePipelineState:", self->_realToComplexShimPipelineState);
    objc_msgSend(v14, "setBuffer:offset:atIndex:", v11, 0, 0);
    objc_msgSend(v14, "setBuffer:offset:atIndex:", v12, 0, 1);
    objc_msgSend(v14, "setBytes:length:atIndex:", a6, 56, 2);
    v22 = v19;
    v23 = v18.i64[0];
    v15 = (int8x16_t)vdupq_n_s64(0x10uLL);
    v20 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v19), v19, v15);
    v21 = 1;
    objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", &v22, &v20);
    objc_msgSend(v14, "endEncoding");
    v16 = 0;
  }
  else
  {
    v16 = -73468;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFactors, 0);
  objc_storeStrong((id *)&self->_realToComplexShimPipelineState, 0);
  objc_storeStrong((id *)&self->_unscrambleMixedRadixPipelineState, 0);
  objc_storeStrong((id *)&self->_applyTwiddlesPipelineState, 0);
  objc_storeStrong((id *)&self->_transpose3DBufferPipelineState, 0);
  objc_storeStrong((id *)&self->_transpose2DBufferPipelineState, 0);
  objc_storeStrong((id *)&self->_transform1DThreadgroupPipelineStates, 0);
  objc_storeStrong((id *)&self->_transform1DGlobalPipelineStates, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

@implementation MLCGPUHelper

+ (unint64_t)mtlStorageMode
{
  return 0;
}

+ (unint64_t)mtlResourceOptions
{
  return 0;
}

+ (void)concatChannelsForwardWithParams:(ConcatImageParams)a3 sourceImageBatch:(id)a4 resultImageBatch:(id)a5 commandBuffer:(id)a6 device:(id)a7 deviceIndex:(unint64_t)a8
{
  uint64_t v11;
  char var2;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unsigned int v25;
  _BOOL4 v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  int var0;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *context;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  ConcatImageParams v49;

  v11 = *(_QWORD *)&a3.var0;
  v49 = a3;
  var2 = a3.var2;
  v13 = a4;
  v46 = a5;
  v14 = a6;
  v15 = a7;
  context = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "width");

  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "height");

  v41 = v17;
  v21 = v17 < 9 || v19 < 9;
  if (v21)
    v22 = 8;
  else
    v22 = 16;
  if (v21)
    v23 = 3;
  else
    v23 = 4;
  v24 = objc_msgSend(v13, "count");
  v25 = WORD2(v11);
  v27 = (v11 & 0x30000) == 0 && v24 != 1;
  v28 = (var2 & 3) == 0 && v27;
  v45 = v14;
  objc_msgSend(v14, "computeCommandEncoderWithDispatchType:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v15;
  if (v25 > 4)
    objc_msgSend(v15, "gpuPipelineStatesForwardConcat2DArray");
  else
    objc_msgSend(v15, "gpuPipelineStatesForwardConcat2D");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", a8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setComputePipelineState:", v31);

  objc_msgSend(v29, "memoryBarrierWithScope:", 2);
  if (objc_msgSend(v13, "count"))
  {
    v32 = 0;
    v33 = (v22 - 1 + v41) >> v23;
    v34 = (v22 - 1 + v19) >> v23;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "texture");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTexture:atIndex:", v36, 0);

      var0 = v49.var0;
      objc_msgSend(v46, "objectAtIndexedSubscript:", v32);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "texture");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (var0)
        v40 = 1;
      else
        v40 = 2;
      objc_msgSend(v29, "setTexture:atIndex:", v39, v40);

      objc_msgSend(v29, "setBytes:length:atIndex:", &v49, 6, 0);
      v48[0] = v33;
      v48[1] = v34;
      v48[2] = 1;
      v47[0] = v22;
      v47[1] = v22;
      v47[2] = 1;
      objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", v48, v47);
      ++v32;
    }
    while (v32 < objc_msgSend(v13, "count"));
  }
  objc_msgSend(v29, "endEncoding");
  GPU_clearTemporaryImageBatchReadCount(v13);

  objc_autoreleasePoolPop(context);
}

+ (void)copyMTLBufferToMPSImageBatch:(id)a3 commandBuffer:(id)a4 sourceMTLBuffer:(id)a5 destinationImageBatch:(id)a6 MLCDataType:(int)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8263D2C]();
  v15 = objc_msgSend(v13, "count");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "width");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "height") * v17;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 * objc_msgSend(v20, "featureChannels");

  GPU_CreateMPSMatrixDesc(v15, v21, 1, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v12, v22);
  objc_msgSend(v24, "encodeBatchToCommandBuffer:sourceMatrix:destinationImages:", v11, v23, v13);

  objc_autoreleasePoolPop(v14);
}

+ (void)copyMPSImageBatchToMTLBuffer:(id)a3 commandBuffer:(id)a4 sourceImageBatch:(id)a5 destinationMTLBuffer:(id)a6 MLCDataType:(int)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8263D2C]();
  v15 = objc_msgSend(v12, "count");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "width");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "height") * v17;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 * objc_msgSend(v20, "featureChannels");

  GPU_CreateMPSMatrixDesc(v15, v21, 1, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v13, v22);
  objc_msgSend(v24, "encodeBatchToCommandBuffer:sourceImages:destinationMatrix:", v11, v12, v23);

  objc_autoreleasePoolPop(v14);
}

+ (id)allocateTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6
{
  return (id)objc_msgSend(a1, "allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:", a3, a4, a5, a6, 0, 1);
}

+ (id)allocateMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6 heapAllocator:(id)a7 imageBatchIsTemporary:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v33 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(v13, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") != 1;

  objc_msgSend(v13, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  v36 = 0;
  v37 = v23;
  v35 = 0;
  GPU_GetTensorWidthAndHeight(v13, &v36, &v35);
  if (!a6)
    a6 = objc_msgSend(v13, "calculateBatchSizeToUse", v33);
  if (v23 > kMaxFeatureChannelMPSImage && (GPU_AdjustFeatureChannelBeyondMax(&v36, &v35, &v37, 0) & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[MLCGPUHelper allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:].cold.2(v33, v13, v27);
    goto LABEL_11;
  }
  objc_msgSend(v13, "descriptor", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "dataType");

  v26 = v25 - 1;
  if ((v25 - 1) >= 6 || ((0x2Du >> v26) & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[MLCGPUHelper allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:].cold.1(v34, v13, v27);
LABEL_11:
    v28 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CC6E38], "imageDescriptorWithChannelFormat:width:height:featureChannels:", qword_1D4AB8740[v26], v36, v35, v37);
  v27 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v30 = v16;
  }
  else
  {
    if (a8)
      v31 = (void *)MEMORY[0x1E0CC7230];
    else
      v31 = (void *)MEMORY[0x1E0CC6DF0];
    objc_msgSend(v31, "defaultAllocator");
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v30;
  objc_msgSend(v30, "imageBatchForCommandBuffer:imageDescriptor:kernel:count:", v14, v27, v15, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v28;
}

+ (id)allocateAndCopyToTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 batchSize:(unint64_t)a5 copyingKernel:(id)a6 sourceMTLBuffer:(id)a7 MLCDataType:(int)a8 heapAllocator:(id)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  void *v18;

  v9 = *(_QWORD *)&a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  objc_msgSend(a1, "allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:", a3, v17, v16, a5, a9, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "copyMTLBufferToMPSImageBatch:commandBuffer:sourceMTLBuffer:destinationImageBatch:MLCDataType:", v16, v17, v15, v18, v9);

  return v18;
}

+ (void)allocateMPSImageBatchForTensor:(NSObject *)a3 commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 1024;
  v11 = objc_msgSend(v6, "dataType");
  OUTLINED_FUNCTION_0(&dword_1D4999000, a3, v7, "%@: Illegal tensor data type:%d", (uint8_t *)&v8);

}

+ (void)allocateMPSImageBatchForTensor:(NSObject *)a3 commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v5;
  v12 = 1024;
  v13 = objc_msgSend(v8, "intValue");
  OUTLINED_FUNCTION_0(&dword_1D4999000, a3, v9, "%@: featureChannel = %d is not supported on GPU", (uint8_t *)&v10);

}

@end

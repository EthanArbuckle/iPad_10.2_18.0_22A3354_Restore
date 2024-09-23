@implementation VCPCNNPoolingBlockGPU

- (int)forward
{
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int result;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  int64x2_t v28;
  uint64_t v29;

  if (!*(_QWORD *)&self->super._chunk)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
    objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    v6 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(WeakRetained) = objc_msgSend(v7, "intValue");

    v8 = objc_alloc(MEMORY[0x1E0CC6DB0]);
    -[VCPCNNMetalContext device](self->super.super._context, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithDevice:kernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:", v9, *(int *)(&self->super.super._executedOnGPU + 3), self->super._px, *(int *)(&self->super.super._executedOnGPU + 3), self->super._px);
    v11 = *(void **)&self->super._chunk;
    *(_QWORD *)&self->super._chunk = v10;

    v12 = (int)WeakRetained / *(_DWORD *)(&self->super.super._executedOnGPU + 3);
    v13 = *(void **)&self->super._chunk;
    v14 = v5 / self->super._px;
    v28 = vdupq_n_s64(1uLL);
    v29 = 0;
    objc_msgSend(v13, "setOffset:", &v28);
    v15 = *(void **)&self->super._chunk;
    memset(v27, 0, 24);
    v27[3] = v12;
    v27[4] = v14;
    v27[5] = 1;
    objc_msgSend(v15, "setClipRect:", v27);
    objc_msgSend(*(id *)&self->super._chunk, "setEdgeMode:", 0);
  }
  if (!self->super.super._executedOnGPU
    || (result = -[VCPCNNData reallocGPUTemporalBuffers](self->super.super._output, "reallocGPUTemporalBuffers")) == 0)
  {
    -[VCPCNNMetalContext commandBuffer](self->super.super._context, "commandBuffer");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = objc_loadWeakRetained((id *)&self->super.super._input);
      objc_msgSend(v19, "mpsImg");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[VCPCNNData mpsImg](self->super.super._output, "mpsImg");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = *(void **)&self->super._chunk;
          -[VCPCNNMetalContext commandBuffer](self->super.super._context, "commandBuffer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_loadWeakRetained((id *)&self->super.super._input);
          objc_msgSend(v24, "mpsImg");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPCNNData mpsImg](self->super.super._output, "mpsImg");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "encodeToCommandBuffer:sourceImage:destinationImage:", v23, v25, v26);

          result = 0;
          self->super.super._executedOnGPU = 1;
          return result;
        }
      }
      else
      {

      }
    }
    return -108;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._chunk, 0);
}

@end

@implementation IndirectComputeCommandEncoderState

+ (id)saveEncoder:(id)a3 withDescriptor:(id)a4 player:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  IndirectComputeCommandEncoderState *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = objc_alloc_init(IndirectComputeCommandEncoderState);
  if ((objc_msgSend(v8, "inheritPipelineState") & 1) == 0)
  {
    objc_msgSend(v7, "computePipelineState");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v19[5];
    v12 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v10;

  }
  if ((objc_msgSend(v8, "inheritBuffers") & 1) == 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__IndirectComputeCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke;
    v15[3] = &unk_250D6F250;
    v16 = v9;
    v17 = &v18;
    objc_msgSend(v7, "enumerateBuffersUsingBlock:", v15);

  }
  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __72__IndirectComputeCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(void **)a2;
  if (!v6 && *(_QWORD *)(a2 + 8))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "computeBytesForKey:", +[DYMTLFunctionPlayer computeBytesKeyAtIndex:](DYMTLFunctionPlayer, "computeBytesKeyAtIndex:", a3));
    v11 = *(_QWORD *)(a1 + 40);
    v7 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) + 8 * a3 + 264) = v10;
    if (*(_QWORD *)a2)
    {
      v9 = 0;
      v8 = 760;
      goto LABEL_11;
    }
    v9 = *(_QWORD *)(a2 + 8);
    v8 = 760;
    if (!v9)
      goto LABEL_11;
LABEL_10:
    v9 = *(_QWORD *)(a2 + 16);
    goto LABEL_11;
  }
  v7 = a1 + 40;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 8 * a3 + 16), v6);
  if (!*(_QWORD *)a2)
  {
    v9 = 0;
    v8 = 512;
    goto LABEL_11;
  }
  v8 = 512;
  if (!*(_QWORD *)(a2 + 8))
    goto LABEL_10;
  v9 = 0;
LABEL_11:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40) + v8 + 8 * a3) = v9;
}

- (void)restoreEncoder:(id)a3 withDescriptor:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "inheritPipelineState") & 1) == 0 && self->_pipelineState)
    objc_msgSend(v12, "setComputePipelineState:");
  if ((objc_msgSend(v6, "inheritBuffers") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "maxKernelBufferBindCount");
    if (v7)
    {
      v8 = -v7;
      v9 = 64;
      do
      {
        v10 = v9 - 64;
        v11 = self->_kernelBytes[0];
        if (v11)
          objc_msgSend(v12, "setBytes:length:atIndex:", v11, self->_kernelBytesLength[0], v10);
        else
          objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_kernelBuffers[0], self->_kernelBufferOffsets[0], v10);
        ++v9;
        self = (IndirectComputeCommandEncoderState *)((char *)self + 8);
      }
      while (v8 + v9 != 64);
    }
  }

}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 256; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end

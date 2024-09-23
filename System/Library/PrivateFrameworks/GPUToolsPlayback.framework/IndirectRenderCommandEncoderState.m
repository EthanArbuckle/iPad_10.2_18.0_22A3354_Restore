@implementation IndirectRenderCommandEncoderState

+ (id)saveEncoder:(id)a3 withDescriptor:(id)a4 player:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  IndirectRenderCommandEncoderState *v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = objc_alloc_init(IndirectRenderCommandEncoderState);
  if ((objc_msgSend(v8, "inheritPipelineState") & 1) == 0)
  {
    objc_msgSend(v7, "renderPipelineState");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v24[5];
    v12 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v10;

  }
  if ((objc_msgSend(v8, "inheritBuffers") & 1) == 0)
  {
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke;
    v20[3] = &unk_250D6F250;
    v14 = v9;
    v21 = v14;
    v22 = &v23;
    objc_msgSend(v7, "enumerateVertexBuffersUsingBlock:", v20);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke_2;
    v17[3] = &unk_250D6F250;
    v18 = v14;
    v19 = &v23;
    objc_msgSend(v7, "enumerateFragmentBuffersUsingBlock:", v17);

  }
  v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = objc_msgSend(*(id *)(a1 + 32), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a3));
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

void __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = objc_msgSend(*(id *)(a1 + 32), "fragmentBytesForKey:", +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:](DYMTLFunctionPlayer, "fragmentBytesKeyAtIndex:", a3));
    v11 = *(_QWORD *)(a1 + 40);
    v7 = a1 + 40;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) + 8 * a3 + 1256) = v10;
    if (*(_QWORD *)a2)
    {
      v9 = 0;
      v8 = 1752;
      goto LABEL_11;
    }
    v9 = *(_QWORD *)(a2 + 8);
    v8 = 1752;
    if (!v9)
      goto LABEL_11;
LABEL_10:
    v9 = *(_QWORD *)(a2 + 16);
    goto LABEL_11;
  }
  v7 = a1 + 40;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 8 * a3 + 1008), v6);
  if (!*(_QWORD *)a2)
  {
    v9 = 0;
    v8 = 1504;
    goto LABEL_11;
  }
  v8 = 1504;
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
  IndirectRenderCommandEncoderState *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  MTLBuffer **fragmentBuffers;
  MTLBuffer *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "inheritPipelineState") & 1) == 0 && self->_pipelineState)
    objc_msgSend(v17, "setRenderPipelineState:");
  if ((objc_msgSend(v6, "inheritBuffers") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "maxVertexBufferBindCount");
    if (v7)
    {
      v8 = -v7;
      v9 = 64;
      v10 = self;
      do
      {
        v11 = v9 - 64;
        v12 = v10->_vertexBytes[0];
        if (v12)
          objc_msgSend(v17, "setVertexBytes:length:atIndex:", v12, v10->_vertexBytesLength[0], v11);
        else
          objc_msgSend(v17, "setVertexBuffer:offset:atIndex:", v10->_vertexBuffers[0], v10->_vertexBufferOffsets[0], v11);
        ++v9;
        v10 = (IndirectRenderCommandEncoderState *)((char *)v10 + 8);
      }
      while (v8 + v9 != 64);
    }
    v13 = objc_msgSend(v6, "maxFragmentBufferBindCount");
    if (v13)
    {
      v14 = 0;
      fragmentBuffers = self->_fragmentBuffers;
      do
      {
        v16 = fragmentBuffers[31];
        if (v16)
          objc_msgSend(v17, "setFragmentBytes:length:atIndex:", v16, fragmentBuffers[93], v14);
        else
          objc_msgSend(v17, "setFragmentBuffer:offset:atIndex:", *fragmentBuffers, fragmentBuffers[62], v14);
        ++v14;
        ++fragmentBuffers;
      }
      while (v13 != v14);
    }
  }

}

- (void).cxx_destruct
{
  uint64_t v3;
  MTLBuffer **v4;
  uint64_t i;

  v3 = 0;
  v4 = &self->_fragmentBuffers[30];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -31);
  for (i = 256; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end

@implementation PKMetalRenderState

- (id)initWithCommandQueue:(char)a3 liveRendering:(uint64_t)a4 defaultPipelineConfig:
{
  id v8;
  id *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  v8 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)PKMetalRenderState;
    v9 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v9;
    if (v9)
    {
      *((_BYTE *)v9 + 38) = a3;
      objc_storeStrong(v9 + 6, a2);
      a1[15] = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[1];
      a1[1] = (id)v10;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[3];
      a1[3] = (id)v12;

      v14 = MEMORY[0x1E0C9BAA8];
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)(a1 + 23) = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a1 + 25) = v15;
      *(_OWORD *)(a1 + 27) = *(_OWORD *)(v14 + 32);
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 8);
      v17 = a1[2];
      a1[2] = (id)v16;

      a1[18] = (id)1;
      *((_WORD *)a1 + 18) = WORD2(a4);
      *((_DWORD *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet allObjects](self->_purgeableFramebuffers, "allObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)PKMetalRenderState;
  -[PKMetalRenderState dealloc](&v7, sel_dealloc);
}

- (id)commandBufferCreateIfNecessary
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[7];
    if (!v2)
    {
      objc_msgSend(a1[6], "commandBuffer");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v1[7];
      v1[7] = (id)v3;

      objc_msgSend(v1[7], "setLabel:", CFSTR("Main render command buffer"));
      v2 = v1[7];
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (id)computeCommandBufferCreateIfNecessary
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[8];
    if (!v2)
    {
      objc_msgSend(a1[6], "commandBuffer");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v1[8];
      v1[8] = (id)v3;

      objc_msgSend(v1[8], "setLabel:", CFSTR("Compute command buffer"));
      v2 = v1[8];
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (id)maskCommandBufferCreateIfNecessary
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[9];
    if (!v2)
    {
      objc_msgSend(a1[6], "commandBuffer");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v1[9];
      v1[9] = (id)v3;

      objc_msgSend(v1[9], "setLabel:", CFSTR("Mask command buffer"));
      v2 = v1[9];
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (void)commitAndPurgeResourceSet:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(a1 + 80));
    v4 = *(void **)(a1 + 96);
    objc_msgSend(v4, "endEncoding");
    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    objc_msgSend(*(id *)(a1 + 72), "enqueue");
    objc_msgSend(*(id *)(a1 + 72), "commit");
    v6 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    objc_msgSend(*(id *)(a1 + 88), "endEncoding");
    v7 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    objc_msgSend(*(id *)(a1 + 64), "enqueue");
    objc_msgSend(*(id *)(a1 + 64), "commit");
    v8 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 80), "endEncoding");
    v9 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      objc_msgSend(*(id *)(a1 + 8), "lastObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(id *)(a1 + 56);
    }
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 16), "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__6;
    v33 = __Block_byref_object_dispose__6;
    v34 = (id)objc_msgSend(*(id *)(a1 + 24), "copy");
    objc_msgSend(*(id *)(a1 + 24), "removeAllObjects");
    if (objc_msgSend(v3, "count") || objc_msgSend(v12, "count") || objc_msgSend((id)v30[5], "count"))
    {
      v13 = (void *)objc_msgSend(v3, "copy");
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__PKMetalRenderState_commitAndPurgeResourceSet___block_invoke;
      v25[3] = &unk_1E7779030;
      v26 = v13;
      v27 = v12;
      v28 = &v29;
      v14 = v13;
      objc_msgSend(v11, "addCompletedHandler:", v25);

    }
    objc_msgSend(*(id *)(a1 + 56), "enqueue");
    objc_msgSend(*(id *)(a1 + 56), "commit");
    v15 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    *(_QWORD *)(a1 + 104) = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = *(id *)(a1 + 8);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v20, "enqueue", (_QWORD)v21);
          objc_msgSend(v20, "commit");
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    if (v4)
      objc_msgSend(v11, "waitUntilScheduled");
    if (*(_BYTE *)(a1 + 39))
      objc_msgSend(v11, "waitUntilCompleted");
    _Block_object_dispose(&v29, 8);

  }
}

void __48__PKMetalRenderState_commitAndPurgeResourceSet___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v5++), "unlock");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v3);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v7);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (void)addCommandBuffer:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 8), "addObject:", v3);
    }
    else
    {
      objc_msgSend(v3, "enqueue");
      objc_msgSend(v3, "commit");
      if (*(_BYTE *)(a1 + 39))
        objc_msgSend(v3, "waitUntilCompleted");
    }
  }

}

- (id)lastCommandBuffer
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[1], "count"))
    {
      objc_msgSend(v1[1], "lastObject");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = (id *)v1[7];
    }
  }
  return a1;
}

- (void)addPurgeableFramebuffer:(uint64_t)a1
{
  _BYTE *v3;
  _BYTE *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      if ((objc_msgSend(*(id *)(a1 + 16), "containsObject:", v3) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 16), "addObject:", v4);
        -[PKMetalFramebuffer incrementNonPurgeableCount](v4);
      }
    }
    else
    {
      v5 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_fault_impl(&dword_1BE213000, v5, OS_LOG_TYPE_FAULT, "Tried to add a nil framebuffer as a purgeable buffer", v6, 2u);
      }

    }
  }

}

- (void)extendLifetimeUntilCompleted:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(*(id *)(a1 + 24), "addObject:", v3);

}

- (void)pushDebugGroup:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(*(id *)(a1 + 80), "pushDebugGroup:", v3);

}

- (void)setRenderEncoder:(uint64_t)a1
{
  id v4;
  __int128 v5;
  _OWORD v6[2];

  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 80), a2);
    if (v4)
    {
      if (*(_QWORD *)(a1 + 168) && *(_QWORD *)(a1 + 176))
      {
        v5 = *(_OWORD *)(a1 + 168);
        v6[0] = *(_OWORD *)(a1 + 152);
        v6[1] = v5;
        objc_msgSend(v4, "setScissorRect:", v6);
      }
    }
  }

}

- (unint64_t)pipelineConfig
{
  size_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int __b;
  unsigned __int16 v6;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 43))
    {
      v6 = 0;
      __b = 0;
      v1 = 2 * *(_QWORD *)(a1 + 144);
      if (v1)
        memset(&__b, *(unsigned __int8 *)(a1 + 33), v1);
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 144);
      v3 = *(_DWORD *)(a1 + 32);
      v6 = *(_WORD *)(a1 + 36);
      __b = v3;
      if (v2 == 2)
      {
        LOBYTE(v6) = BYTE1(v3);
        HIBYTE(v6) = BYTE2(v3);
      }
    }
  }
  else
  {
    v6 = 0;
    __b = 0;
  }
  return __b | ((unint64_t)v6 << 32);
}

- (void)setComputeEncoder:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setMaskRenderEncoder:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setDestinationTexture:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (void)setSixChannelContentTexture:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixChannelContentTexture, 0);
  objc_storeStrong((id *)&self->_destinationTexture, 0);
  objc_storeStrong((id *)&self->_maskRenderEncoder, 0);
  objc_storeStrong((id *)&self->_computeEncoder, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
  objc_storeStrong((id *)&self->_maskCommandBuffer, 0);
  objc_storeStrong((id *)&self->_computeCommandBuffer, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_extendedLifetimeObjects, 0);
  objc_storeStrong((id *)&self->_purgeableFramebuffers, 0);
  objc_storeStrong((id *)&self->_commandBuffers, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 18) = 0;
  *((_DWORD *)self + 8) = 0;
  return self;
}

@end

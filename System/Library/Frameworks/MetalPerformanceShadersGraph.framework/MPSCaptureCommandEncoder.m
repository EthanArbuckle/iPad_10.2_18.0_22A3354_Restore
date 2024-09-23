@implementation MPSCaptureCommandEncoder

- (MPSCaptureCommandEncoder)initWithCommandEncoder:(id)a3 captureContext:(id)a4
{
  id v7;
  id v8;
  MPSCaptureCommandEncoder *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPSCaptureCommandEncoder;
  v9 = -[MPSCaptureCommandEncoder init](&v13, sel_init);
  v10 = (void *)MEMORY[0x186DA1C20]();
  objc_storeStrong((id *)&v9->_encoder, a3);
  objc_storeStrong((id *)&v9->_captureContext, a4);
  v11 = operator new();
  *(_QWORD *)(v11 + 48) = 0;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_OWORD *)(v11 + 32) = 0u;
  *(_OWORD *)v11 = 0u;
  v9->_encoderContext = (void *)v11;
  objc_autoreleasePoolPop(v10);

  return v9;
}

- (void)dealloc
{
  uint64_t *encoderContext;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  objc_super v9;

  encoderContext = (uint64_t *)self->_encoderContext;
  if (encoderContext)
  {
    v4 = (void *)encoderContext[4];
    if (v4)
    {
      encoderContext[5] = (uint64_t)v4;
      operator delete(v4);
    }

    v5 = (id *)*encoderContext;
    if (*encoderContext)
    {
      v6 = (id *)encoderContext[1];
      v7 = (void *)*encoderContext;
      if (v6 != v5)
      {
        do
        {

          v8 = *(v6 - 4);
          v6 -= 4;

        }
        while (v6 != v5);
        v7 = (void *)*encoderContext;
      }
      encoderContext[1] = (uint64_t)v5;
      operator delete(v7);
    }
    MEMORY[0x186DA1680](encoderContext, 0xB0C40D8961893);
  }
  self->_encoderContext = 0;
  v9.receiver = self;
  v9.super_class = (Class)MPSCaptureCommandEncoder;
  -[MPSCaptureCommandEncoder dealloc](&v9, sel_dealloc);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return self->_encoder;
  else
    return 0;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  void *v8;
  void *v9;
  id **encoderContext;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  -[MPSGraphCaptureContext constantBufferName:](self->_captureContext, "constantBufferName:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  encoderContext = (id **)self->_encoderContext;
  if (v8)
  {
    v11 = v8;
    MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
    v12 = (unint64_t)&(*encoderContext)[4 * a5];
    *(_BYTE *)(v12 + 16) = 1;
    v13 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v11;
    v14 = v11;

    *(_QWORD *)(v12 + 8) = a4;
  }
  else
  {
    v15 = v18;
    MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
    v16 = (*encoderContext)[4 * a5];
    (*encoderContext)[4 * a5] = v15;
    v14 = v15;

    v17 = (unint64_t)&(*encoderContext)[4 * a5];
    *(_QWORD *)(v17 + 8) = a4;
    *(_BYTE *)(v17 + 16) = 0;
  }

  -[MTLComputeCommandEncoder setBuffer:offset:atIndex:](self->_encoder, "setBuffer:offset:atIndex:", v18, a4, a5);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  abort();
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  abort();
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  void *v9;
  id **encoderContext;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;

  -[MPSGraphCaptureContext dataWithBytes:length:](self->_captureContext, "dataWithBytes:length:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  encoderContext = (id **)self->_encoderContext;
  v11 = v9;
  MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
  v12 = (unint64_t)&(*encoderContext)[4 * a5];
  *(_BYTE *)(v12 + 16) = 1;
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v11;
  v14 = v11;

  *(_QWORD *)(v12 + 8) = 0;
  -[MTLComputeCommandEncoder setBytes:length:atIndex:](self->_encoder, "setBytes:length:atIndex:", a3, a4, a5);

}

- (void)setComputePipelineState:(id)a3
{
  id v5;

  objc_storeStrong((id *)self->_encoderContext + 3, a3);
  v5 = a3;
  -[MTLComputeCommandEncoder setComputePipelineState:](self->_encoder, "setComputePipelineState:");

}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v4;

  v4 = a3;
  abort();
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  abort();
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4;

  v4 = a3;
  abort();
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  abort();
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v6;

  v6 = a3;
  abort();
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  abort();
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *encoderContext;
  char *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  __int128 *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;

  encoderContext = self->_encoderContext;
  v8 = (char *)*((_QWORD *)encoderContext + 4);
  v9 = (_BYTE *)*((_QWORD *)encoderContext + 5);
  v10 = v9 - v8;
  v11 = (v9 - v8) >> 3;
  if (v11 > a4)
  {
    v12 = (char *)*((_QWORD *)encoderContext + 4);
    goto LABEL_22;
  }
  v13 = a4 + 1;
  v14 = a4 + 1 - v11;
  if (a4 + 1 > v11)
  {
    v15 = *((_QWORD *)encoderContext + 6);
    if (v14 > (v15 - (uint64_t)v9) >> 3)
    {
      if (v13 >> 61)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v34 = v9 - v8;
      v16 = v15 - (_QWORD)v8;
      if (v16 >> 2 > v13)
        v13 = v16 >> 2;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      if (v13 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v32 = 8 * v13;
      v17 = (char *)operator new(8 * v13);
      v12 = &v17[8 * v11];
      v31 = v17;
      v33 = &v17[v32];
      v18 = 8 * v14;
      bzero(v12, v18);
      v19 = &v12[v18];
      if (v9 == v8)
      {
        v21 = v33;
        v10 = v9 - v8;
        goto LABEL_29;
      }
      v20 = v9 - v8 - 8;
      v10 = v9 - v8;
      if (v20 >= 0x58)
      {
        v21 = v33;
        if ((unint64_t)(v8 - v31) >= 0x20)
        {
          v23 = (v20 >> 3) + 1;
          v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
          v25 = &v9[-v24];
          v12 -= v24;
          v26 = &v31[8 * v11 - 16];
          v27 = (__int128 *)(v9 - 16);
          v28 = v23 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v29 = *v27;
            *((_OWORD *)v26 - 1) = *(v27 - 1);
            *(_OWORD *)v26 = v29;
            v26 -= 32;
            v27 -= 2;
            v28 -= 4;
          }
          while (v28);
          v9 = v25;
          if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_29:
            *((_QWORD *)encoderContext + 4) = v12;
            *((_QWORD *)encoderContext + 5) = v19;
            *((_QWORD *)encoderContext + 6) = v21;
            if (v8)
            {
              operator delete(v8);
              v10 = v34;
              v12 = (char *)*((_QWORD *)encoderContext + 4);
            }
            goto LABEL_19;
          }
        }
      }
      else
      {
        v21 = v33;
      }
      do
      {
        v30 = *((_QWORD *)v9 - 1);
        v9 -= 8;
        *((_QWORD *)v12 - 1) = v30;
        v12 -= 8;
      }
      while (v9 != v8);
      goto LABEL_29;
    }
    bzero(*((void **)encoderContext + 5), 8 * v14);
    v10 = v9 - v8;
    v22 = &v9[8 * v14];
    goto LABEL_17;
  }
  if (a4 + 1 < v11)
  {
    v22 = &v8[8 * v13];
LABEL_17:
    *((_QWORD *)encoderContext + 5) = v22;
  }
  v12 = v8;
LABEL_19:
  if (v11 < a4)
    bzero(&v12[v10], 8 * a4 - v10);
  *(_QWORD *)&v12[8 * a4] = 0;
LABEL_22:
  *(_QWORD *)&v12[8 * a4] = a3;
  -[MTLComputeCommandEncoder setThreadgroupMemoryLength:atIndex:](self->_encoder, "setThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)setStageInRegion:(id *)a3
{
  abort();
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  id v4;

  v4 = a3;
  abort();
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  MTLComputeCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("ThreadsPerThreadgroup");
  MTLSizeToNSArray((MTLSize *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("ThreadgroupsPerGrid");
  v14[0] = v7;
  MTLSizeToNSArray((MTLSize *)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraphCaptureContext createNodeWithDispatchInfo:encoderContext:](self->_captureContext, "createNodeWithDispatchInfo:encoderContext:", v9, self->_encoderContext);
  encoder = self->_encoder;
  v12 = *a3;
  v11 = *a4;
  -[MTLComputeCommandEncoder dispatchThreadgroups:threadsPerThreadgroup:](encoder, "dispatchThreadgroups:threadsPerThreadgroup:", &v12, &v11);

}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v5;

  v5 = a3;
  abort();
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  abort();
}

- (void)updateFence:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (void)waitForFence:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  id v4;

  v4 = a3;
  abort();
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  abort();
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  abort();
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureContext, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
}

@end

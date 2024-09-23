@implementation MPSGraphInternalCommandBuffer

- (MPSGraphInternalCommandBuffer)initWithMPSCommandBuffer:(id)a3 executableExecutionDescriptor:(id)a4
{
  id v7;
  id v8;
  MPSGraphInternalCommandBuffer *v9;
  MPSGraphInternalCommandBuffer *v10;
  MPSGraphInternalCommandBuffer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphInternalCommandBuffer;
  v9 = -[MPSCommandBuffer initWithCommandBuffer:](&v13, sel_initWithCommandBuffer_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_original, a3);
    objc_storeStrong((id *)&v10->_executableExecutionDescriptor, a4);
    v10->_commandBufferIndex = 0;
    v11 = v10;
  }

  return v10;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MPSGraphInternalCommandBuffer;
  return -[MPSCommandBuffer respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_original);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPSGraphInternalCommandBuffer;
    -[MPSGraphInternalCommandBuffer forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSGraphInternalCommandBuffer;
  -[MPSGraphInternalCommandBuffer methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MPSCommandBuffer methodSignatureForSelector:](self->_original, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)commitAndContinue
{
  unint64_t profilingBitmap;
  void *v4;
  unsigned int commandBufferIndex;
  void *v6;
  _QWORD v7[5];

  if (!self->_commandBufferIndex)
  {
    profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    if ((profilingBitmap & 4) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__MPSGraphInternalCommandBuffer_commitAndContinue__block_invoke;
      v7[3] = &unk_1E0E76B50;
      v7[4] = self;
      -[MPSGraphInternalCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v7);
      profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    }
    if ((profilingBitmap & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_executableExecutionDescriptor->_profilingDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"));

    }
  }
  -[MPSCommandBuffer commitAndContinue](self->_original, "commitAndContinue");
  commandBufferIndex = self->_commandBufferIndex;
  if (!commandBufferIndex)
  {
    if ((self->_executableExecutionDescriptor->_profilingBitmap & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_executableExecutionDescriptor->_profilingDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"));

      commandBufferIndex = self->_commandBufferIndex;
    }
    else
    {
      commandBufferIndex = 0;
    }
  }
  self->_commandBufferIndex = commandBufferIndex + 1;
}

void __50__MPSGraphInternalCommandBuffer_commitAndContinue__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 40), "setObject:forKeyedSubscript:");

}

- (void)commit
{
  unint64_t profilingBitmap;
  void *v4;
  unsigned int commandBufferIndex;
  void *v6;
  _QWORD v7[5];

  if (!self->_commandBufferIndex)
  {
    profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    if ((profilingBitmap & 4) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __39__MPSGraphInternalCommandBuffer_commit__block_invoke;
      v7[3] = &unk_1E0E76B50;
      v7[4] = self;
      -[MPSGraphInternalCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v7);
      profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    }
    if ((profilingBitmap & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_executableExecutionDescriptor->_profilingDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"));

    }
  }
  -[MPSCommandBuffer commit](self->_original, "commit");
  commandBufferIndex = self->_commandBufferIndex;
  if (!commandBufferIndex)
  {
    if ((self->_executableExecutionDescriptor->_profilingBitmap & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_executableExecutionDescriptor->_profilingDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"));

      commandBufferIndex = self->_commandBufferIndex;
    }
    else
    {
      commandBufferIndex = 0;
    }
  }
  self->_commandBufferIndex = commandBufferIndex + 1;
}

void __39__MPSGraphInternalCommandBuffer_commit__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 40), "setObject:forKeyedSubscript:");

}

- (MPSCommandBufferDescriptor)mpsCommandBufferDescriptor
{
  MPSCommandBufferDescriptor *result;

  result = (MPSCommandBufferDescriptor *)self->_original;
  if (result)
    return (MPSCommandBufferDescriptor *)-[MPSCommandBufferDescriptor mpsCommandBufferDescriptor](result, "mpsCommandBufferDescriptor");
  retstr->encoderCount = 0;
  retstr->producedValues = 0;
  retstr->numberOfCommitsMade = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableExecutionDescriptor, 0);
  objc_storeStrong((id *)&self->_original, 0);
}

@end

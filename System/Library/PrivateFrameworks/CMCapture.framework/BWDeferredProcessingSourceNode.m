@implementation BWDeferredProcessingSourceNode

- (NSDictionary)outputsByPortType
{
  return &self->_outputsByPortType->super;
}

- (BWDeferredProcessingSourceNode)initWithPortTypes:(id)a3 attributes:(id)a4 colorSpaceProperties:(int)a5
{
  uint64_t v5;
  BWDeferredProcessingSourceNode *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BWNodeOutput *v14;
  BWVideoFormatRequirements *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)BWDeferredProcessingSourceNode;
  v7 = -[BWNode init](&v22, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_emitSamplesDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.capture.deferredprocessorsourcenode.emit-samples-queue", v8);
    v7->_outputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(a3);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_outputsByPortType, "setObject:forKeyedSubscript:", v14, v13);
          v15 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", a4);
          v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v15, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1));
          -[BWNodeOutput setFormatRequirements:](v14, "setFormatRequirements:", v15);
          -[BWNodeOutput setProvidesPixelBufferPool:](v14, "setProvidesPixelBufferPool:", 0);
          -[BWNode addOutput:](v7, "addOutput:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v10);
    }
  }
  return v7;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessingSourceNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("DeferredProcessing");
}

- (id)portTypeForOutput:(id)a3
{
  NSMutableDictionary *outputsByPortType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  outputsByPortType = self->_outputsByPortType;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputsByPortType, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(outputsByPortType);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsByPortType, "objectForKeyedSubscript:", v10) == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputsByPortType, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)outputForPortType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsByPortType, "objectForKeyedSubscript:", a3);
}

- (BOOL)start:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BWDeferredProcessingSourceNode_start___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

_BYTE *__40__BWDeferredProcessingSourceNode_start___block_invoke(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (!result[112])
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_msgSend(result, "outputs", 0);
    result = (_BYTE *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6++), "makeConfiguredFormatLive");
        }
        while (v4 != v6);
        result = (_BYTE *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWDeferredProcessingSourceNode_stop___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __39__BWDeferredProcessingSourceNode_stop___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 112))
  {
    *(_BYTE *)(v1 + 112) = 0;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(result + 32), "outputs", 0);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "markEndOfLiveOutput");
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)processBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[7];

  v5 = -[BWDeferredProcessingSourceNode outputForPortType:](self, "outputForPortType:", objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BWDeferredProcessingSourceNode_processBuffer___block_invoke;
  block[3] = &unk_1E491EC68;
  block[4] = self;
  block[5] = v5;
  block[6] = a3;
  dispatch_sync(emitSamplesDispatchQueue, block);
}

uint64_t __48__BWDeferredProcessingSourceNode_processBuffer___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 112))
    return objc_msgSend(*(id *)(result + 40), "emitSampleBuffer:", *(_QWORD *)(result + 48));
  return result;
}

@end

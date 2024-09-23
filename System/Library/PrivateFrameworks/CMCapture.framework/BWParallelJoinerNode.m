@implementation BWParallelJoinerNode

- (BWParallelJoinerNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4
{
  BWParallelJoinerNode *v5;
  BWParallelJoinerNode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWParallelJoinerNode;
  v5 = -[BWFunnelNode initWithNumberOfInputs:mediaType:](&v8, sel_initWithNumberOfInputs_mediaType_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  v6 = v5;
  if (v5)
  {
    v5->_inputsCount = a3;
    v5->_receivedBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_sentErrorCountForID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWParallelJoinerNode;
  -[BWFunnelNode dealloc](&v3, sel_dealloc);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v6;
  const void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = CMGetAttachment(a3, CFSTR("ParallelSplitterInputBuffer"), 0);
    v7 = v6;
    if (v6)
      CFRetain(v6);
    CMRemoveAttachment(a3, CFSTR("ParallelSplitterInputBuffer"));
    v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
    v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_receivedBuffers, "objectForKeyedSubscript:", v8);
    if (!v9)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_inputsCount);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedBuffers, "setObject:forKeyedSubscript:", v9, v8);

    }
    objc_msgSend(v9, "addObject:", a3);
    if (objc_msgSend(v9, "count") == self->_inputsCount)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            v14 = *(const void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
            if (v14 != v7)
              CMPropagateAttachments(v14, v7);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_receivedBuffers, "removeObjectForKey:", v8);
      -[BWNodeOutput emitSampleBuffer:](self->super.super._output, "emitSampleBuffer:", v7);
    }
    if (v7)
      CFRelease(v7);
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super.super._output, "emitSampleBuffer:", 0, a4);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  void *v6;
  void *v7;

  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sentErrorCountForID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  }
  else
  {
    -[BWNodeOutput emitNodeError:](self->super.super._output, "emitNodeError:", a3);
    v7 = &unk_1E49FBA18;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sentErrorCountForID, "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (objc_msgSend(v7, "intValue") == self->_inputsCount)
    -[NSMutableDictionary removeObjectForKey:](self->_sentErrorCountForID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
}

@end

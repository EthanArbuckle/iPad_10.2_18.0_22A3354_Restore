@implementation AVAssetWriterFinishWritingHelper

- (AVAssetWriterFinishWritingHelper)initWithConfigurationState:(id)a3 finishWritingOperations:(id)a4 figAssetWriterCallbackContextToken:(void *)a5 figAssetWriter:(OpaqueFigAssetWriter *)a6
{
  AVWeakReference *v11;
  AVAssetWriterFinishWritingHelper *v12;
  AVWorkaroundNSBlockOperation *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OpaqueFigAssetWriter *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
  v25.receiver = self;
  v25.super_class = (Class)AVAssetWriterFinishWritingHelper;
  v12 = -[AVAssetWriterHelper initWithConfigurationState:](&v25, sel_initWithConfigurationState_, a3);
  if (v12)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __137__AVAssetWriterFinishWritingHelper_initWithConfigurationState_finishWritingOperations_figAssetWriterCallbackContextToken_figAssetWriter___block_invoke;
    v24[3] = &unk_1E302FA10;
    v24[4] = v11;
    v13 = +[NSBlockOperation blockOperationWithBlock:](AVWorkaroundNSBlockOperation, "blockOperationWithBlock:", v24);
    -[AVWorkaroundNSBlockOperation setName:](v13, "setName:", CFSTR("Transition to terminal status"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(a4);
          -[AVWorkaroundNSBlockOperation addDependency:](v13, "addDependency:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v15);
    }
    v12->_finishWritingOperations = (NSArray *)objc_msgSend(a4, "copy");
    v12->_transitionToTerminalStatusOperation = (NSOperation *)v13;
    v12->_figAssetWriterCallbackContextToken = a5;
    if (a6)
      v18 = (OpaqueFigAssetWriter *)CFRetain(a6);
    else
      v18 = 0;
    v12->_figAssetWriter = v18;
  }

  return v12;
}

uint64_t __137__AVAssetWriterFinishWritingHelper_initWithConfigurationState_finishWritingOperations_figAssetWriterCallbackContextToken_figAssetWriter___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_finishWritingOperationsDidFinish");
}

- (void)dealloc
{
  OpaqueFigAssetWriter *figAssetWriter;
  objc_super v4;

  if (self->_figAssetWriterCallbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_figAssetWriterCallbackContextToken);
    self->_figAssetWriterCallbackContextToken = 0;
  }
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter)
    CFRelease(figAssetWriter);
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterFinishWritingHelper;
  -[AVAssetWriterHelper dealloc](&v4, sel_dealloc);
}

- (void)_finishWritingOperationsDidFinish
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v3 = +[AVOperation statusOfOperations:error:](AVOperation, "statusOfOperations:error:", self->_finishWritingOperations, &v5);
  if (v3 == 4)
  {
    -[AVAssetWriterHelper transitionToFailedStatusWithError:](self, "transitionToFailedStatusWithError:", v5);
  }
  else if (v3 == 2)
  {
    -[AVAssetWriterHelper _transitionToClientInitiatedTerminalStatus:](self, "_transitionToClientInitiatedTerminalStatus:", 2);
  }
  else
  {
    -[AVAssetWriterHelper _transitionToClientInitiatedTerminalStatus:](self, "_transitionToClientInitiatedTerminalStatus:", 4);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", 0), "removeItemAtURL:error:", -[AVAssetWriterHelper outputURL](self, "outputURL"), &v4);
  }
}

- (void)cancelWriting
{
  NSArray *finishWritingOperations;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  finishWritingOperations = self->_finishWritingOperations;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](finishWritingOperations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(finishWritingOperations);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "cancel");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](finishWritingOperations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (int64_t)status
{
  return 1;
}

- (BOOL)_isDefunct
{
  OpaqueFigAssetWriter *figAssetWriter;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAssetWriter *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  figAssetWriter = self->_figAssetWriter;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAssetWriter *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(figAssetWriter, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

- (NSOperation)transitionToTerminalStatusOperation
{
  return self->_transitionToTerminalStatusOperation;
}

@end

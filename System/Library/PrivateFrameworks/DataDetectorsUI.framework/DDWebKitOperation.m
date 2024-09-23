@implementation DDWebKitOperation

- (void)cleanup
{
  WebThreadRun();
}

uint64_t __28__DDWebKitOperation_cleanup__block_invoke(uint64_t a1)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)DDWebKitOperation;
  objc_msgSendSuper2(&v3, sel_cleanup);
  objc_msgSend(*(id *)(a1 + 32), "setStartNode:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEndNode:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setResults:", 0);
}

- (BOOL)_containerReadyForDetection
{
  void *v2;
  char v3;

  -[DDOperation container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsLayout") ^ 1;

  return v3;
}

- (void)_applyContainerRestrictionsToTypes
{
  void *v3;
  char v4;
  objc_super v5;

  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTelephoneNumberParsingAllowed");

  if ((v4 & 1) == 0)
    -[DDOperation setDetectionTypes:](self, "setDetectionTypes:", -[DDOperation detectionTypes](self, "detectionTypes") & 0x7FFFFFFE);
  v5.receiver = self;
  v5.super_class = (Class)DDWebKitOperation;
  -[DDOperation _applyContainerRestrictionsToTypes](&v5, sel__applyContainerRestrictionsToTypes);
}

- (BOOL)_rangeValidForContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DOMDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDWebKitOperation startNode](self, "startNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ownerDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6 == v4;
  else
    v7 = 1;
  v8 = v7;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDWebKitOperation _rangeValidForContainer].cold.1((uint64_t)v6, (uint64_t)v4);

  return v8;
}

- (void)_updateGenerationNumber
{
  id v3;

  -[DDOperation container](self, "container");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DDOperation setGenerationNumber:](self, "setGenerationNumber:", objc_msgSend(v3, "layoutCount"));

}

- (__DDScanQuery)_createScanQueryForBackend
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __DDScanQuery *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;

  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DOMDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "createRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectNode:", v5);
  -[DDWebKitOperation startNode](self, "startNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DDWebKitOperation startNode](self, "startNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStart:offset:", v8, -[DDWebKitOperation startOffset](self, "startOffset"));

  }
  if (!v6 || (objc_msgSend(v6, "collapsed") & 1) != 0)
    goto LABEL_10;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF678]), "initWithRange:", v6);
  v16 = 0;
  v10 = (__DDScanQuery *)objc_msgSend(v9, "dd_newQueryStopRange:", &v16);
  v11 = v16;
  objc_msgSend(v6, "startContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDWebKitOperation setStartNode:](self, "setStartNode:", v12);

  -[DDWebKitOperation setStartOffset:](self, "setStartOffset:", objc_msgSend(v6, "startOffset"));
  if (v11)
  {
    objc_msgSend(v11, "endContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDWebKitOperation setEndNode:](self, "setEndNode:", v13);

    -[DDWebKitOperation setEndOffset:](self, "setEndOffset:", objc_msgSend(v11, "endOffset"));
    -[DDOperation setNeedContinuation:](self, "setNeedContinuation:", 1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[DDWebKitOperation _createScanQueryForBackend].cold.1(self);
  }
  else
  {
    objc_msgSend(v6, "endContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDWebKitOperation setEndNode:](self, "setEndNode:", v15);

    -[DDWebKitOperation setEndOffset:](self, "setEndOffset:", objc_msgSend(v6, "endOffset"));
    -[DDOperation setNeedContinuation:](self, "setNeedContinuation:", 0);
  }

LABEL_11:
  return v10;
}

- (BOOL)doURLificationOnDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __DDScanQuery *v9;
  void *v10;
  void *v11;
  id v12;
  char v14;

  v14 = 0;
  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DOMDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "createRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStart:offset:", self->_startNode, self->_startOffset);
  objc_msgSend(v5, "setEnd:offset:", self->_endNode, self->_endOffset);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF678]), "initWithRange:", v5);
  -[DDOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DDOperation context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ReferenceDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[DDOperation scanQuery](self, "scanQuery");
  -[DDOperation results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "urlificationBlockForTypes:", -[DDOperation detectionTypes](self, "detectionTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v6, "dd_doUrlificationForQuery:forResults:referenceDate:document:DOMWasModified:relevantResults:URLificationBlock:", v9, v10, v7, v4, &v14, 0, v11);

  LOBYTE(v11) = v14;
  return (char)v11;
}

- (BOOL)containerIsReady
{
  void *v2;
  BOOL v3;

  -[DDOperation container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "layoutCount") > 0;

  return v3;
}

- (BOOL)needsToStartOver
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutCount");
  if (v4 == -[DDOperation generationNumber](self, "generationNumber"))
  {
    -[DDOperation container](self, "container");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "needsLayout");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)newOperationForStartingOver
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DDWebKitOperation;
  v2 = -[DDOperation newOperationForStartingOver](&v4, sel_newOperationForStartingOver);
  objc_msgSend(v2, "setStartNode:", 0);
  objc_msgSend(v2, "setStartOffset:", 0);
  return v2;
}

- (id)newOperationForContinuation
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DDWebKitOperation;
  v3 = -[DDOperation newOperationForContinuation](&v6, sel_newOperationForContinuation);
  -[DDWebKitOperation endNode](self, "endNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStartNode:", v4);

  objc_msgSend(v3, "setStartOffset:", -[DDWebKitOperation endOffset](self, "endOffset"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDWebKitOperation newOperationForContinuation].cold.1((uint64_t)v3, self);
  return v3;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  dispatch_block_t block;

  block = a3;
  if (WebThreadIsEnabled())
    WebThreadRun();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (DOMNode)startNode
{
  return self->_startNode;
}

- (void)setStartNode:(id)a3
{
  objc_storeStrong((id *)&self->_startNode, a3);
}

- (int)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(int)a3
{
  self->_startOffset = a3;
}

- (DOMNode)endNode
{
  return self->_endNode;
}

- (void)setEndNode:(id)a3
{
  objc_storeStrong((id *)&self->_endNode, a3);
}

- (int)endOffset
{
  return self->_endOffset;
}

- (void)setEndOffset:(int)a3
{
  self->_endOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endNode, 0);
  objc_storeStrong((id *)&self->_startNode, 0);
}

- (void)_rangeValidForContainer
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The DOMDocument changed under our feet: %p != %p", (uint8_t *)&v2, 0x16u);
}

- (void)_createScanQueryForBackend
{
  void *v2;
  void *v3;
  __int16 v4;
  uint64_t v5;
  uint8_t v6[14];
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  v7 = a1;
  v8 = v4;
  v9 = v5;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Will need to register a continuation for frame %@ (once I, %@, am done; I'll stop at %@)",
    v6,
    0x20u);

  OUTLINED_FUNCTION_0_1();
}

- (void)newOperationForContinuation
{
  void *v3;
  int v4;
  uint8_t v5[14];
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "endNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "endOffset");
  OUTLINED_FUNCTION_11();
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Creating continuation %@. The new start node is %@, the start offset is %d", v5, 0x1Cu);

  OUTLINED_FUNCTION_0_1();
}

@end

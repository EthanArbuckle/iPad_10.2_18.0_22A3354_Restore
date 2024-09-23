@implementation LiveFSVolumeSearchResultConnector

- (id)initForToken:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7
{
  id v13;
  id v14;
  LiveFSVolumeSearchResultConnector *v15;
  LiveFSVolumeSearchResultConnector *v16;
  uint64_t v17;
  NSCondition *condVar;
  uint64_t v19;
  NSMutableData *pendingAttributes;
  uint64_t v21;
  NSMutableArray *pendingPaths;
  uint64_t v23;
  NSMutableArray *pendingXAttrs;
  uint64_t v25;
  NSDate *nextReplyDeadline;
  LiveFSVolumeSearchResultConnector *v27;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v29.receiver = self;
  v29.super_class = (Class)LiveFSVolumeSearchResultConnector;
  v15 = -[LiveFSVolumeSearchResultConnector init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    *(_QWORD *)&v15->pendingAttributesValidSize = 0x2E0000000000;
    v17 = objc_opt_new();
    condVar = v16->condVar;
    v16->condVar = (NSCondition *)v17;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v16->pendingAttributesSize);
    v19 = objc_claimAutoreleasedReturnValue();
    pendingAttributes = v16->pendingAttributes;
    v16->pendingAttributes = (NSMutableData *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 32);
    v21 = objc_claimAutoreleasedReturnValue();
    pendingPaths = v16->pendingPaths;
    v16->pendingPaths = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 32);
    v23 = objc_claimAutoreleasedReturnValue();
    pendingXAttrs = v16->pendingXAttrs;
    v16->pendingXAttrs = (NSMutableArray *)v23;

    if (!v16->condVar || !v16->pendingAttributes || !v16->pendingPaths || !v16->pendingXAttrs)
    {
      v27 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v16->_conn, a4);
    objc_storeStrong((id *)&v16->_ourToken, a3);
    v16->_maxData = a5;
    v16->pendingData = 0;
    v16->_maxDelay = a6;
    if (a6 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a6);
      v25 = objc_claimAutoreleasedReturnValue();
      nextReplyDeadline = v16->nextReplyDeadline;
      v16->nextReplyDeadline = (NSDate *)v25;

    }
    v16->_currentCredits = a7;
    v16->_throttlingActive = a7 != 0;
    v16->waiter = 0;
    v16->_active = 1;
  }
  v27 = v16;
LABEL_11:

  return v27;
}

+ (id)newSearchConnector:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForToken:connection:maxData:maxDelay:initialCredits:", v13, v12, v9, v7, a6);

  return v14;
}

- (void)replenishCredits:(unsigned int)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  _BOOL4 waiter;
  id v9;

  v6 = a4;
  v9 = v6;
  if (a3)
  {
    if (__CFADD__(a3, self->_currentCredits))
    {
      v7 = 34;
    }
    else
    {
      -[NSCondition lock](self->condVar, "lock");
      waiter = self->waiter;
      self->_currentCredits += a3;
      -[NSCondition unlock](self->condVar, "unlock");
      if (waiter)
        -[NSCondition broadcast](self->condVar, "broadcast");
      v7 = 0;
      v6 = v9;
    }
  }
  else
  {
    v7 = 22;
  }
  (*((void (**)(id, uint64_t))v6 + 2))(v6, v7);

}

- (int)grabACredit
{
  unsigned int currentCredits;
  int result;

  if (!self->_throttlingActive)
    return 0;
  currentCredits = self->_currentCredits;
  if (currentCredits)
  {
LABEL_5:
    if (self->_active)
    {
      result = 0;
      self->_currentCredits = currentCredits - 1;
      return result;
    }
  }
  else
  {
    while (self->_active)
    {
      self->waiter = 1;
      -[NSCondition wait](self->condVar, "wait");
      self->waiter = 0;
      currentCredits = self->_currentCredits;
      if (currentCredits)
        goto LABEL_5;
    }
  }
  return 4;
}

- (int)flushBufferedResults:(id)a3
{
  NSMutableArray *v4;
  NSObject *v5;
  int v6;
  void *v7;
  NSObject *v8;
  NSMutableArray *pendingPaths;
  NSMutableData *pendingAttributes;
  unsigned int pendingAttributesValidSize;
  NSMutableData *v12;
  NSMutableData *v13;
  NSMutableArray *pendingXAttrs;
  int v16;
  NSMutableArray *v17;
  __int16 v18;
  NSMutableData *v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (NSMutableArray *)a3;
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_22BD61000, v5, OS_LOG_TYPE_DEFAULT, "Flushing, from resume point %@", (uint8_t *)&v16, 0xCu);
  }

  v6 = -[LiveFSVolumeSearchResultConnector grabACredit](self, "grabACredit");
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      pendingPaths = self->pendingPaths;
      pendingAttributes = self->pendingAttributes;
      pendingAttributesValidSize = self->pendingAttributesValidSize;
      v16 = 138412802;
      v17 = pendingPaths;
      v18 = 2048;
      v19 = pendingAttributes;
      v20 = 1024;
      v21 = pendingAttributesValidSize;
      _os_log_impl(&dword_22BD61000, v8, OS_LOG_TYPE_DEFAULT, "About to send paths %@, pendingAttr %p, valid sz %u", (uint8_t *)&v16, 0x1Cu);
    }

    -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchResults:paths:attributes:attributeSize:xAttrs:resumePath:", self->_ourToken, self->pendingPaths, self->pendingAttributes, 184, self->pendingXAttrs, v4);
    -[NSMutableArray removeAllObjects](self->pendingPaths, "removeAllObjects");
    self->pendingAttributesValidSize = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", self->pendingAttributesSize);
    v12 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    v13 = self->pendingAttributes;
    self->pendingAttributes = v12;

    pendingXAttrs = self->pendingXAttrs;
    if (pendingXAttrs)
      -[NSMutableArray removeAllObjects](pendingXAttrs, "removeAllObjects");
  }

  return v6;
}

- (void)tokenDone:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_22BD61000, v5, OS_LOG_TYPE_DEFAULT, "Done: got code %d", (uint8_t *)v7, 8u);
  }

  -[NSCondition lock](self->condVar, "lock");
  if ((_DWORD)v3)
  {
    if (self->waiter)
      -[NSCondition broadcast](self->condVar, "broadcast");
  }
  else
  {
    -[LiveFSVolumeSearchResultConnector flushBufferedResults:](self, "flushBufferedResults:", 0);
  }
  self->_active = 0;
  -[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokenDone:result:", self->_ourToken, v3);
  -[NSCondition unlock](self->condVar, "unlock");

}

- (void)addSearchResult:(id)a3 attributes:(_LIFileAttributes *)a4 attributeSize:(unsigned int)a5 xAttrs:(id)a6
{
  id v10;
  id v11;
  int v12;
  NSMutableArray *pendingXAttrs;
  NSDate *nextReplyDeadline;
  void *v15;
  uint64_t v16;
  NSMutableArray *v17;
  id v18;
  NSDate *v19;
  NSDate *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v10 = a3;
  v11 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v12 = objc_msgSend(v10, "length");
  *((_DWORD *)v23 + 6) = 2 * v12 + 16;
  pendingXAttrs = self->pendingXAttrs;
  if (pendingXAttrs)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke;
    v21[3] = &unk_24F64C6E8;
    v21[4] = &v22;
    -[NSMutableArray enumerateObjectsUsingBlock:](pendingXAttrs, "enumerateObjectsUsingBlock:", v21);
  }
  -[NSCondition lock](self->condVar, "lock");
  if (self->pendingData <= self->_maxData - *((_DWORD *)v23 + 6))
  {
    nextReplyDeadline = self->nextReplyDeadline;
    if (!nextReplyDeadline)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSDate compare:](nextReplyDeadline, "compare:", v15);

    if (v16 != -1)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", self->_maxDelay);
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v20 = self->nextReplyDeadline;
    self->nextReplyDeadline = v19;

  }
  if (-[NSMutableArray count](self->pendingPaths, "count"))
    -[LiveFSVolumeSearchResultConnector flushBufferedResults:](self, "flushBufferedResults:", v10);
LABEL_8:
  -[NSMutableArray addObject:](self->pendingPaths, "addObject:", v10);
  -[NSMutableData appendBytes:length:](self->pendingAttributes, "appendBytes:length:", a4, a5);
  self->pendingAttributesValidSize += a5;
  v17 = self->pendingXAttrs;
  if (v17)
  {
    if (v11)
      v18 = v11;
    else
      v18 = (id)MEMORY[0x24BDBD1B8];
    -[NSMutableArray addObject:](v17, "addObject:", v18);
  }
  -[NSCondition unlock](self->condVar, "unlock");
  _Block_object_dispose(&v22, 8);

}

uint64_t __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke_2;
  v3[3] = &unk_24F64C6C0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;

  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "length");
  v6 = objc_msgSend(v5, "length");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6 + 2 * (_DWORD)a2 + 32;
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)ourToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOurToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unsigned)maxData
{
  return self->_maxData;
}

- (void)setMaxData:(unsigned int)a3
{
  self->_maxData = a3;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (BOOL)throttlingActive
{
  return self->_throttlingActive;
}

- (void)setThrottlingActive:(BOOL)a3
{
  self->_throttlingActive = a3;
}

- (unsigned)currentCredits
{
  return self->_currentCredits;
}

- (void)setCurrentCredits:(unsigned int)a3
{
  self->_currentCredits = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourToken, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->pendingXAttrs, 0);
  objc_storeStrong((id *)&self->pendingAttributes, 0);
  objc_storeStrong((id *)&self->pendingPaths, 0);
  objc_storeStrong((id *)&self->condVar, 0);
  objc_storeStrong((id *)&self->nextReplyDeadline, 0);
}

@end

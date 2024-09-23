@implementation DTXProxyRequestHandler

- (DTXProxyRequestHandler)initWithPublishedProtocol:(id)a3 publishedProtocolName:(id)a4 peerProtocol:(id)a5 peerProtocolName:(id)a6 handlerBlock:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  DTXProxyRequestHandler *v21;
  DTXProxyRequestHandler *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *publishedProtocolName;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *peerProtocolName;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id handlerBlock;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  objc_super v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v20 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v18, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publishedProtocol != NULL"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v18, v19);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publishedProtocolName != nil"));

LABEL_3:
  if ((v16 == 0) == (v17 == 0))
  {
    if (v20)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v18, v19);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(peerProtocol == NULL) == (peerProtocolName == nil)"));

    if (v20)
      goto LABEL_5;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v18, v19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handlerBlock != NULL"));

LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)DTXProxyRequestHandler;
  v21 = -[DTXProxyRequestHandler init](&v44, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_publishedProtocol, a3);
    v25 = objc_msgSend_copy(v15, v23, v24);
    publishedProtocolName = v22->_publishedProtocolName;
    v22->_publishedProtocolName = (NSString *)v25;

    objc_storeStrong((id *)&v22->_peerProtocol, a5);
    v29 = objc_msgSend_copy(v17, v27, v28);
    peerProtocolName = v22->_peerProtocolName;
    v22->_peerProtocolName = (NSString *)v29;

    v33 = objc_msgSend_copy(v20, v31, v32);
    handlerBlock = v22->_handlerBlock;
    v22->_handlerBlock = (id)v33;

  }
  return v22;
}

- (NSString)channelIdentifier
{
  uint64_t v2;
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend_publishedProtocolName(self, a2, v2);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_peerProtocolName(self, v5, v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("*");
  if (v4)
    v10 = v4;
  else
    v10 = CFSTR("*");
  if (v8)
    v9 = v8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@:%@:%@"), CFSTR("dtxproxy"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)matchesPublishedProtocolName:(id)a3 peerProtocolName:(id)a4
{
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isEqualToString;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  const char *v20;

  v6 = (uint64_t)a4;
  v7 = a3;
  objc_msgSend_publishedProtocolName(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)v7);

  if (isEqualToString)
  {
    objc_msgSend_peerProtocolName(self, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v6 | v17)
    {
      objc_msgSend_peerProtocolName(self, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_isEqualToString_(v19, v20, v6);

    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (Protocol)publishedProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)publishedProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (Protocol)peerProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)peerProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)handlerBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_peerProtocolName, 0);
  objc_storeStrong((id *)&self->_peerProtocol, 0);
  objc_storeStrong((id *)&self->_publishedProtocolName, 0);
  objc_storeStrong((id *)&self->_publishedProtocol, 0);
}

@end

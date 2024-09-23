@implementation IDSSocketPairMessage

+ (unsigned)headerDataSize
{
  return 5;
}

+ (unsigned)dataLengthFromHeaderData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  unsigned int v11;

  v11 = 0;
  v3 = a3;
  v7 = objc_msgSend_length(v3, v4, v5, v6);
  objc_msgSend_getBytes_range_(v3, v8, (uint64_t)&v11, v9, v7 - 4, 4);

  return bswap32(v11);
}

+ (id)messageWithData:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  unsigned int v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  unsigned __int8 v26;

  v26 = -86;
  v4 = a3;
  objc_msgSend_getBytes_range_(v4, v5, (uint64_t)&v26, v6, 0, 1);
  v10 = objc_msgSend_headerDataSize(a1, v7, v8, v9);
  v14 = objc_msgSend_length(v4, v11, v12, v13);
  v18 = objc_msgSend_headerDataSize(a1, v15, v16, v17);
  objc_msgSend_subdataWithRangeNoCopy_(v4, v19, v10, v20, v14 - v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_messageWithCommand_data_(a1, v22, v26, v23, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)messageWithHeaderData:(id)a3 data:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  unsigned __int8 v13;

  v13 = -86;
  v6 = a4;
  objc_msgSend_getBytes_range_(a3, v7, (uint64_t)&v13, v8, 0, 1);
  objc_msgSend_messageWithCommand_data_(a1, v9, v13, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)messageWithCommand:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v4 > 0x34
    || ((0x1FFEFFFFFFFFFFuLL >> v4) & 1) == 0
    || (v6 = objc_alloc(*off_1E3C20D28[(char)v4]),
        (v9 = (void *)objc_msgSend_initWithCommand_underlyingData_(v6, v7, v4, v8, v5)) == 0))
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v4;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Got unhandled socket pair command %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    v9 = 0;
  }

  return v9;
}

- (IDSSocketPairMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  id v7;
  IDSSocketPairMessage *v8;
  IDSSocketPairMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSSocketPairMessage;
  v8 = -[IDSSocketPairMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_underlyingData, a4);
    v9->_command = a3;
  }

  return v9;
}

- (id)_nonHeaderData
{
  return 0;
}

- (unint64_t)underlyingDataLength
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_underlyingData(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_length(v4, v5, v6, v7);

  return v8;
}

- (id)_existingUnderlyingData
{
  return self->_underlyingData;
}

- (NSData)underlyingData
{
  NSData *underlyingData;
  NSData **p_underlyingData;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  NSData *v25;
  unsigned int v26;
  char v27;

  p_underlyingData = &self->_underlyingData;
  underlyingData = self->_underlyingData;
  if (underlyingData)
    return underlyingData;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = v6;
  v27 = objc_msgSend_command(self, v8, v9, v10);
  objc_msgSend_appendBytes_length_(v7, v11, (uint64_t)&v27, v12, 1);
  objc_msgSend__nonHeaderData(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_length(v16, v17, v18, v19);
  v26 = bswap32(v20);
  objc_msgSend_appendBytes_length_(v7, v21, (uint64_t)&v26, v22, 4);
  if (v20)
    objc_msgSend_appendData_(v7, v23, (uint64_t)v16, v24);
  objc_storeStrong((id *)p_underlyingData, v6);
  v25 = *p_underlyingData;

  return v25;
}

- (unsigned)command
{
  return self->_command;
}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (BOOL)useDynamicServiceName
{
  return self->_useDynamicServiceName;
}

- (void)setUseDynamicServiceName:(BOOL)a3
{
  self->_useDynamicServiceName = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)wasWrittenToConnection
{
  return self->_wasWrittenToConnection;
}

- (void)setWasWrittenToConnection:(BOOL)a3
{
  self->_wasWrittenToConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_underlyingData, 0);
}

@end

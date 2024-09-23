@implementation EDPreviouslyDownloadedMessageData

- (EDPreviouslyDownloadedMessageData)initWithHeadersOnlyData:(id)a3 partialMessageData:(id)a4 hasFullMessageData:(BOOL)a5 hasPartialMessageData:(BOOL)a6 mimeParts:(id)a7
{
  id v13;
  id v14;
  id v15;
  EDPreviouslyDownloadedMessageData *v16;
  EDPreviouslyDownloadedMessageData *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)EDPreviouslyDownloadedMessageData;
  v16 = -[EDPreviouslyDownloadedMessageData init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_headersOnlyData, a3);
    objc_storeStrong((id *)&v17->_partialMessageData, a4);
    v17->_hasFullMessageData = a5;
    v17->_hasPartialMessageData = a6;
    v18 = objc_msgSend(v15, "copy");
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v17->_mimeParts, v20);

  }
  return v17;
}

- (OS_dispatch_data)headersOnlyData
{
  return self->_headersOnlyData;
}

- (OS_dispatch_data)partialMessageData
{
  return self->_partialMessageData;
}

- (BOOL)hasFullMessageData
{
  return self->_hasFullMessageData;
}

- (BOOL)hasPartialMessageData
{
  return self->_hasPartialMessageData;
}

- (NSArray)mimeParts
{
  return self->_mimeParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeParts, 0);
  objc_storeStrong((id *)&self->_partialMessageData, 0);
  objc_storeStrong((id *)&self->_headersOnlyData, 0);
}

@end

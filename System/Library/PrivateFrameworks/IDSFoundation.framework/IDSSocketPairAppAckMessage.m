@implementation IDSSocketPairAppAckMessage

- (IDSSocketPairAppAckMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairAppAckMessage *v7;
  void *v8;
  const char *v9;
  double v10;
  unint64_t offset;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  int v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  double v23;
  uint64_t v24;
  NSString *peerResponseIdentifier;
  const char *v26;
  unint64_t v27;
  double v28;
  const char *v29;
  double v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  uint64_t v42;
  unsigned __int16 v43;
  unsigned int v44;
  objc_super v45;

  v4 = a3;
  v6 = a4;
  v45.receiver = self;
  v45.super_class = (Class)IDSSocketPairAppAckMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v45, sel_initWithCommand_underlyingData_, v4, v6);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1A1AC8274]();
    v7->_offset = 0;
    v44 = -1431655766;
    objc_msgSend_getBytes_range_(v6, v9, (uint64_t)&v44, v10, 0, 4);
    offset = v7->_offset;
    v44 = bswap32(v44);
    v7->_offset = offset + 4;
    v43 = -21846;
    objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v43, v13);
    v43 = bswap32(v43) >> 16;
    v7->_offset += 2;
    HIDWORD(v42) = -1431655766;
    objc_msgSend_getBytes_range_(v6, v14, (uint64_t)&v42 + 4, v15);
    v18 = HIDWORD(v42);
    HIDWORD(v42) = bswap32(HIDWORD(v42));
    v19 = v7->_offset + 4;
    v7->_offset = v19;
    if (v18)
    {
      objc_msgSend_subdataWithRange_(v6, v16, v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_offset += HIDWORD(v42);
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      v24 = objc_msgSend_initWithData_encoding_(v21, v22, (uint64_t)v20, v23, 4);
      peerResponseIdentifier = v7->_peerResponseIdentifier;
      v7->_peerResponseIdentifier = (NSString *)v24;

    }
    LODWORD(v42) = -1431655766;
    v27 = objc_msgSend_length(v6, v16, v19, v17, v42) - v7->_offset;
    if (v27 >= 4)
    {
      objc_msgSend_getBytes_range_(v6, v26, (uint64_t)&v42, v28);
      v31 = v42;
      v32 = bswap32(v42);
      LODWORD(v42) = v32;
      v33 = v7->_offset + 4;
      v7->_offset = v33;
      if (v31)
      {
        if (v27 - v33 >= v32)
        {
          objc_msgSend_subdataWithRange_(v6, v29, v33, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v7->_offset += v42;
          v35 = objc_alloc(MEMORY[0x1E0CB3940]);
          v38 = (void *)objc_msgSend_initWithData_encoding_(v35, v36, (uint64_t)v34, v37, 4);
          objc_msgSend_setTopic_(v7, v39, (uint64_t)v38, v40);

        }
      }
    }
    v7->_sequenceNumber = v44;
    v7->_streamID = v43;
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (IDSSocketPairAppAckMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 peerResponseIdentifier:(id)a5
{
  id v9;
  IDSSocketPairAppAckMessage *v10;
  IDSSocketPairAppAckMessage *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IDSSocketPairAppAckMessage;
  v10 = -[IDSSocketPairAppAckMessage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_sequenceNumber = a3;
    v10->_streamID = a4;
    objc_storeStrong((id *)&v10->_peerResponseIdentifier, a5);
  }

  return v11;
}

- (unsigned)command
{
  return 7;
}

- (id)_nonHeaderData
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  unsigned int v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v49 = bswap32(objc_msgSend_sequenceNumber(self, v4, v5, v6));
  objc_msgSend_appendBytes_length_(v3, v7, (uint64_t)&v49, v8, 4);
  v48 = __rev16(objc_msgSend_streamID(self, v9, v10, v11));
  objc_msgSend_appendBytes_length_(v3, v12, (uint64_t)&v48, v13, 2);
  objc_msgSend_dataUsingEncoding_(self->_peerResponseIdentifier, v14, 4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = bswap32(objc_msgSend_length(v16, v17, v18, v19));
  objc_msgSend_appendBytes_length_(v3, v20, (uint64_t)&v47, v21, 4);
  if (v47)
    objc_msgSend_appendData_(v3, v22, (uint64_t)v16, v24);
  objc_msgSend_topic(self, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v29 = (void *)v25;
    v30 = objc_msgSend_useDynamicServiceName(self, v26, v27, v28);

    if (v30)
    {
      objc_msgSend_topic(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataUsingEncoding_(v34, v35, 4, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = bswap32(objc_msgSend_length(v37, v38, v39, v40));
      objc_msgSend_appendBytes_length_(v3, v41, (uint64_t)&v46, v42, 4);
      if (v46)
        objc_msgSend_appendData_(v3, v43, (uint64_t)v37, v44);

    }
  }

  return v3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
}

@end

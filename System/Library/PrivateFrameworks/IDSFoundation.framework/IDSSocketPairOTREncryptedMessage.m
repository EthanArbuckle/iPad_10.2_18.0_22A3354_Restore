@implementation IDSSocketPairOTREncryptedMessage

- (IDSSocketPairOTREncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairOTREncryptedMessage *v7;
  const char *v8;
  double v9;
  IDSSocketPairOTREncryptedMessage *v10;
  unsigned int v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  char v21;
  unsigned int v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int8 v25;
  objc_super v26;

  v4 = a3;
  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)IDSSocketPairOTREncryptedMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v26, sel_initWithCommand_underlyingData_, v4, v6);
  v10 = v7;
  if (v7)
  {
    v7->_offset = 0;
    v25 = 0;
    v24 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    objc_msgSend_getBytes_range_(v6, v8, (uint64_t)&v25, v9, 0, 1);
    v11 = v25;
    v10->_versionNumber = v25 & 0x7F;
    v10->_encrypted = v11 >> 7;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v21, v13);
    v10->_fileXfer = v21 != 0;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v14, (uint64_t)&v24, v15);
    v24 = bswap32(v24) >> 16;
    v10->_streamID = v24;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v16, (uint64_t)&v23, v17);
    v23 = bswap32(v23) >> 16;
    v10->_priority = v23;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v18, (uint64_t)&v22, v19);
    v10->_sequenceNumber = bswap32(v22);
    v10->_offset += 4;
  }

  return v10;
}

- (IDSSocketPairOTREncryptedMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 streamID:(unsigned __int16)a5 priority:(unsigned __int16)a6 sequenceNumber:(unsigned int)a7 fileXfer:(BOOL)a8 data:(id)a9
{
  id v16;
  IDSSocketPairOTREncryptedMessage *v17;
  IDSSocketPairOTREncryptedMessage *v18;
  objc_super v20;

  v16 = a9;
  v20.receiver = self;
  v20.super_class = (Class)IDSSocketPairOTREncryptedMessage;
  v17 = -[IDSSocketPairOTREncryptedMessage init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a9);
    v18->_versionNumber = a3;
    v18->_encrypted = a4;
    v18->_fileXfer = a8;
    v18->_streamID = a5;
    v18->_priority = a6;
    v18->_sequenceNumber = a7;
  }

  return v18;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("OTREncryptedMessage: version %u streamID %u priority %u sequenceNumber %u fileXfer %u"), v2, self->_versionNumber, self->_streamID, self->_priority, self->_sequenceNumber, self->_fileXfer);
}

- (unsigned)command
{
  return 23;
}

- (NSData)data
{
  uint64_t v2;
  double v3;
  NSData *data;
  NSData *v5;
  void *v7;
  unint64_t offset;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;

  data = self->_data;
  if (data)
  {
    v5 = data;
  }
  else
  {
    objc_msgSend_underlyingData(self, a2, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    offset = self->_offset;
    objc_msgSend__existingUnderlyingData(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_length(v12, v13, v14, v15);
    objc_msgSend_subdataWithRangeNoCopy_(v7, v17, offset, v18, v16 - self->_offset);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_nonHeaderData
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  unsigned __int8 versionNumber;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  char v31;
  __int16 v32;
  unsigned int v33;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v6 = v3;
  versionNumber = self->_versionNumber;
  v31 = versionNumber;
  if (self->_encrypted)
    v31 = versionNumber | 0x80;
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v31, v5, 1);
  objc_msgSend_appendBytes_length_(v6, v8, (uint64_t)&self->_fileXfer, v9, 1);
  v32 = bswap32(self->_streamID) >> 16;
  objc_msgSend_appendBytes_length_(v6, v10, (uint64_t)&v32, v11, 2);
  v32 = bswap32(self->_priority) >> 16;
  objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v32, v13, 2);
  v33 = bswap32(self->_sequenceNumber);
  objc_msgSend_appendBytes_length_(v6, v14, (uint64_t)&v33, v15, 4);
  objc_msgSend_data(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_length(v19, v20, v21, v22);

  if (v23)
  {
    objc_msgSend_data(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v6, v28, (uint64_t)v27, v29);

  }
  return v6;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (BOOL)fileXfer
{
  return self->_fileXfer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

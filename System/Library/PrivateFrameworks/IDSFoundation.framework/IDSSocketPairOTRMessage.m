@implementation IDSSocketPairOTRMessage

- (IDSSocketPairOTRMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairOTRMessage *v7;
  const char *v8;
  double v9;
  IDSSocketPairOTRMessage *v10;
  unsigned __int8 v11;
  const char *v12;
  double v13;
  unsigned int v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  unsigned int v20;
  unsigned __int16 v21;
  unsigned __int8 v22;
  objc_super v23;

  v4 = a3;
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IDSSocketPairOTRMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v23, sel_initWithCommand_underlyingData_, v4, v6);
  v10 = v7;
  if (v7)
  {
    v7->_offset = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    objc_msgSend_getBytes_range_(v6, v8, (uint64_t)&v22, v9, 0, 1);
    v11 = v22;
    v10->_encrypted = v22 >> 7;
    v10->_shouldEncrypt = (v11 & 0x40) != 0;
    v10->_versionNumber = v11 & 0xF;
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v22, v13);
    v14 = v22;
    v10->_protectionClass = v22 & 3;
    v10->_priority = 100 * (v14 >> 6);
    ++v10->_offset;
    objc_msgSend_getBytes_range_(v6, v15, (uint64_t)&v21, v16);
    v21 = bswap32(v21) >> 16;
    v10->_streamID = v21;
    v10->_offset += 2;
    objc_msgSend_getBytes_range_(v6, v17, (uint64_t)&v20, v18);
    v10->_sequenceNumber = bswap32(v20);
    v10->_offset += 4;
  }

  return v10;
}

- (IDSSocketPairOTRMessage)initWithVersion:(unsigned __int8)a3 encrypted:(BOOL)a4 shouldEncrypt:(BOOL)a5 protectionClass:(unsigned __int8)a6 streamID:(unsigned __int16)a7 priority:(unsigned __int16)a8 sequenceNumber:(unsigned int)a9 data:(id)a10
{
  id v17;
  IDSSocketPairOTRMessage *v18;
  IDSSocketPairOTRMessage *v19;
  objc_super v21;

  v17 = a10;
  v21.receiver = self;
  v21.super_class = (Class)IDSSocketPairOTRMessage;
  v18 = -[IDSSocketPairOTRMessage init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a10);
    v19->_versionNumber = a3;
    v19->_encrypted = a4;
    v19->_shouldEncrypt = a5;
    v19->_protectionClass = a6;
    v19->_streamID = a7;
    v19->_priority = a8;
    v19->_sequenceNumber = a9;
  }

  return v19;
}

- (id)description
{
  double v2;
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("YES");
  if (self->_encrypted)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (!self->_shouldEncrypt)
    v3 = CFSTR("NO");
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("OTRMessage: encrypted %@ shouldEncrypt %@ version %u streamID %u protectionClass %u priority %u sequenceNumber %u"), v2, v4, v3, self->_versionNumber, self->_streamID, self->_protectionClass, self->_priority, self->_sequenceNumber);
}

- (unsigned)command
{
  return 24;
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
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  char v29;
  __int16 v30;
  unsigned int v31;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v6 = v3;
  versionNumber = self->_versionNumber;
  v29 = versionNumber;
  if (self->_encrypted)
  {
    versionNumber |= 0x80u;
    v29 = versionNumber;
  }
  if (self->_shouldEncrypt)
    v29 = versionNumber | 0x40;
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v29, v5, 1);
  v29 = ((5243 * (self->_priority >> 2)) >> 11) & 0xC0 | self->_protectionClass;
  objc_msgSend_appendBytes_length_(v6, v8, (uint64_t)&v29, v9, 1);
  v30 = bswap32(self->_streamID) >> 16;
  objc_msgSend_appendBytes_length_(v6, v10, (uint64_t)&v30, v11, 2);
  v31 = bswap32(self->_sequenceNumber);
  objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v31, v13, 4);
  objc_msgSend_data(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_length(v17, v18, v19, v20);

  if (v21)
  {
    objc_msgSend_data(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v6, v26, (uint64_t)v25, v27);

  }
  return v6;
}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

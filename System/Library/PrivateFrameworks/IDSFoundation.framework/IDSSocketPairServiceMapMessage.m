@implementation IDSSocketPairServiceMapMessage

- (IDSSocketPairServiceMapMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairServiceMapMessage *v7;
  __int128 v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  void *v22;
  BOOL *v23;
  NSObject *v24;
  _OWORD v26[2];
  unint64_t v27;
  unsigned __int16 v28;
  BOOL *v29;
  unsigned __int8 v30;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)IDSSocketPairServiceMapMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v31, sel_initWithCommand_underlyingData_, v4, v6);
  if (v7)
  {
    v30 = -86;
    v29 = (BOOL *)0xAAAAAAAAAAAAAAAALL;
    v28 = -21846;
    v27 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26[0] = v8;
    v26[1] = v8;
    v9 = objc_retainAutorelease(v6);
    v13 = objc_msgSend_bytes(v9, v10, v11, v12);
    v17 = objc_msgSend_length(v9, v14, v15, v16);
    IDSByteBufferInitForRead((uint64_t)v26, v13, v17);
    while (IDSByteBufferReadField((uint64_t)v26, &v30, &v29, &v28))
    {
      switch(v30)
      {
        case 3u:
          if (v28)
          {
            v18 = objc_alloc(MEMORY[0x1E0CB3940]);
            v21 = objc_msgSend_initWithBytes_length_encoding_(v18, v19, (uint64_t)v29, v20, v28, 4);
            v22 = *(void **)&v7->_reason;
            *(_QWORD *)&v7->_reason = v21;

          }
          break;
        case 2u:
          if (v28 == 2)
          {
            v23 = v29 + 2;
            *((_WORD *)&v7->super._wasWrittenToConnection + 1) = bswap32(*(unsigned __int16 *)v29) >> 16;
            v29 = v23;
          }
          break;
        case 1u:
          if (v28 == 1)
            *(&v7->super._wasWrittenToConnection + 1) = *v29;
          break;
        default:
          OSLogHandleForIDSCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v33 = v30;
            _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "IDSSocketPairServiceMapMessage: Unknown field type: %u", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
              MarcoLog();
            if (IMShouldLog())
              IMLogString();
          }
          break;
      }
    }
    IDSByteBufferRelease((uint64_t)v26);
  }

  return v7;
}

- (IDSSocketPairServiceMapMessage)initWithReason:(unsigned __int8)a3 mappedStreamID:(unsigned __int16)a4 serviceName:(id)a5
{
  id v8;
  IDSSocketPairServiceMapMessage *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  IDSSocketPairServiceMapMessage *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSSocketPairServiceMapMessage;
  v9 = -[IDSSocketPairServiceMapMessage init](&v17, sel_init);
  v13 = v9;
  if (v9)
  {
    *(&v9->super._wasWrittenToConnection + 1) = a3;
    *((_WORD *)&v9->super._wasWrittenToConnection + 1) = a4;
    v14 = objc_msgSend_copy(v8, v10, v11, v12);
    v15 = *(void **)&v13->_reason;
    *(_QWORD *)&v13->_reason = v14;

  }
  return v13;
}

- (unsigned)command
{
  return 39;
}

- (id)_nonHeaderData
{
  id *v3;
  __int128 v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  unsigned __int16 v15;
  uint64_t v16;
  id v17;
  const char *v18;
  void *v19;
  _QWORD v21[5];
  __int16 __src;
  __int128 v23;
  __int128 v24;
  unint64_t v25;

  v3 = _IDSLinkPacketBufferCreate();
  v25 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v4;
  v24 = v4;
  IDSByteBufferInitForWriteWithAllocatedSpace((uint64_t)&v23, (uint64_t)v3 + 1282, (uint64_t)v3[1]);
  IDSByteBufferWriteField((uint64_t)&v23, 1, &self->super._wasWrittenToConnection + 1, 1uLL);
  __src = bswap32(*((unsigned __int16 *)&self->super._wasWrittenToConnection + 1)) >> 16;
  IDSByteBufferWriteField((uint64_t)&v23, 2, &__src, 2uLL);
  objc_msgSend_dataUsingEncoding_(*(void **)&self->_reason, v5, 4, v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (void *)objc_msgSend_bytes(v7, v8, v9, v10);
  v15 = objc_msgSend_length(v7, v12, v13, v14);
  IDSByteBufferWriteField((uint64_t)&v23, 3, v11, v15);
  v16 = v24 - ((_QWORD)v3 + 1282);
  IDSByteBufferRelease((uint64_t)&v23);
  v17 = objc_alloc(MEMORY[0x1E0C99D50]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_19BA57E28;
  v21[3] = &unk_1E3C20D08;
  v21[4] = v3;
  v19 = (void *)objc_msgSend_initWithBytesNoCopy_length_deallocator_(v17, v18, (uint64_t)v3 + 1282, COERCE_DOUBLE(3221225472), v16, v21);

  return v19;
}

- (unsigned)reason
{
  return *(&self->super._wasWrittenToConnection + 1);
}

- (unsigned)mappedStreamID
{
  return *((_WORD *)&self->super._wasWrittenToConnection + 1);
}

- (NSString)serviceName
{
  return *(NSString **)&self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

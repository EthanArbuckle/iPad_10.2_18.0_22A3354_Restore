@implementation IDSSocketPairResourceTransferMessage

- (unsigned)command
{
  return 22;
}

- (unsigned)type
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  unsigned __int8 *v21;

  objc_msgSend_data(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v5, v6, v7, v8);

  if (!v9)
  {
    v14 = isRunningTests(v13, v10, v11, v12);
    if ((_DWORD)v14)
      throwsIDSAbortException(v16, v14, v15);
    abort();
  }
  objc_msgSend_data(self, v11, v12, v13);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (unsigned __int8 *)objc_msgSend_bytes(v17, v18, v19, v20);

  return *v21;
}

- (unint64_t)byteOffset
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  int v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  NSObject *v25;
  id v27;
  const char *v28;
  uint64_t v29;
  double v30;
  unsigned __int8 *v31;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend_type(self, a2, v2, v3);
  if ((v7 | 2) == 2)
  {
    objc_msgSend_data(self, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_length(v9, v10, v11, v12);

    if (v13 <= 7)
    {
      OSLogHandleForIDSCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v7;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferMessage: resource transfer type %d does not have enought bytes for byteOffset", buf, 8u);
      }

      v18 = os_log_shim_legacy_logging_enabled();
      if ((_DWORD)v18)
      {
        if (MarcoShouldLog())
          MarcoLog();
        v18 = IMShouldLog();
        if ((_DWORD)v18)
          v18 = IMLogString();
      }
      v22 = isRunningTests(v21, v18, v19, v20);
      if ((_DWORD)v22)
        throwsIDSAbortException(v24, v22, v23);
      abort();
    }
    objc_msgSend_data(self, v14, v15, v16);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = (unsigned __int8 *)objc_msgSend_bytes(v27, v28, v29, v30);

    return ((unint64_t)v31[1] << 48) | ((unint64_t)v31[2] << 40) | ((unint64_t)v31[3] << 32) | ((unint64_t)v31[4] << 24) | ((unint64_t)v31[5] << 16) | ((unint64_t)v31[6] << 8) | v31[7];
  }
  else
  {
    OSLogHandleForIDSCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v33 = v7;
      _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferMessage: resource transfer type %d does not support byteOffset", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    return 0;
  }
}

- (unsigned)cancelReason
{
  uint64_t v2;
  double v3;
  int v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_type(self, a2, v2, v3);
  if (v5 == 3)
  {
    objc_msgSend_data(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_length(v9, v10, v11, v12);

    if (v13 > 1)
    {
      objc_msgSend_data(self, v14, v15, v16);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = objc_msgSend_bytes(v21, v22, v23, v24);

      LOBYTE(v18) = *(_BYTE *)(v25 + 1);
      return v18;
    }
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferMessage: resource transfer cancel message does not have enought bytes for reason", buf, 2u);
    }

    v18 = os_log_shim_legacy_logging_enabled();
    if (v18)
    {
      if (MarcoShouldLog())
        MarcoLog();
      v18 = IMShouldLog();
      if (v18)
        goto LABEL_16;
    }
  }
  else
  {
    v19 = v5;
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v19;
      _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferMessage: resource transfer type %d does not support cancelReason", buf, 8u);
    }

    v18 = os_log_shim_legacy_logging_enabled();
    if (v18)
    {
      if (MarcoShouldLog())
        MarcoLog();
      v18 = IMShouldLog();
      if (v18)
      {
LABEL_16:
        IMLogString();
        LOBYTE(v18) = 0;
      }
    }
  }
  return v18;
}

+ (id)resumeMessageWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 messageUUID:(id)a5 nextByteOffset:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  IDSSocketPairResourceTransferMessage *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  BYTE1(v17) = BYTE6(a6);
  BYTE2(v17) = BYTE5(a6);
  BYTE3(v17) = BYTE4(a6);
  BYTE4(v17) = BYTE3(a6);
  BYTE5(v17) = BYTE2(a6);
  BYTE6(v17) = BYTE1(a6);
  HIBYTE(v17) = a6;
  LOBYTE(v17) = 2;
  v8 = a5;
  v9 = [IDSSocketPairResourceTransferMessage alloc];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)&v17, v11, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v9, v13, v7, v14, v6, 0, 0, 0, 0, 0, v8, v12, 0, v17, v18);

  return v15;
}

+ (id)cancelMessageWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 messageUUID:(id)a5 cancelReason:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  IDSSocketPairResourceTransferMessage *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  _BYTE v17[2];

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v17[0] = 3;
  v17[1] = a6;
  v8 = a5;
  v9 = [IDSSocketPairResourceTransferMessage alloc];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)v17, v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v9, v13, v7, v14, v6, 0, 0, 0, 0, 0, v8, v12, 0);

  return v15;
}

@end

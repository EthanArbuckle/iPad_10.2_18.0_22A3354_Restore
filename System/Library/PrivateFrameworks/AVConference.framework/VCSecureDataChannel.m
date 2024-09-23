@implementation VCSecureDataChannel

- (VCSecureDataChannel)initWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 isCaller:(BOOL)a5 sharedSecret:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  VCSecureDataChannel *v12;
  VCSecureDataChannel *v13;
  uint64_t v14;
  VCTransport *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  _QWORD v37[5];
  objc_super v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  VCSecureDataChannel *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v9 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)VCSecureDataChannel;
  v12 = -[VCSecureDataChannel init](&v38, sel_init);
  v13 = v12;
  if (!v12)
    return v13;
  v12->_localCallID = a3;
  v12->_remoteCallID = a4;
  v12->_maxUDPPayloadSize = (int)VCMaxUDPPayloadSize(1280, 1);
  if (-[VCSecureDataChannel setupWithSharedSecret:isCaller:error:](v13, "setupWithSharedSecret:isCaller:error:", a6, v9, a7) < 0)
  {

    return 0;
  }
  v14 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v13);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke;
  v37[3] = &unk_1E9E57878;
  v37[4] = v14;
  v15 = +[VCTransport sharedInstance](VCTransport, "sharedInstance");
  v13->_transport = v15;
  -[VCTransport registerDataReceivedHandler:forCallID:](v15, "registerDataReceivedHandler:forCallID:", v37, v13->_localCallID);
  if (v13->tlsRecord)
  {
    if ((VCSecureDataChannel *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = -[VCSecureDataChannel maxEncryptedDataSize](v13, "maxEncryptedDataSize");
          *(_DWORD *)buf = 136315906;
          v40 = v17;
          v41 = 2080;
          v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
          v43 = 1024;
          v44 = 74;
          v45 = 2048;
          v46 = v19;
          v20 = " [%s] %s:%d maxEncryptedDataSize = %ld";
          v21 = v18;
          v22 = 38;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCSecureDataChannel performSelector:](v13, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v25 = -[VCSecureDataChannel maxEncryptedDataSize](v13, "maxEncryptedDataSize");
          *(_DWORD *)buf = 136316418;
          v40 = v23;
          v41 = 2080;
          v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
          v43 = 1024;
          v44 = 74;
          v45 = 2112;
          v46 = (uint64_t)v16;
          v47 = 2048;
          v48 = v13;
          v49 = 2048;
          v50 = v25;
          v20 = " [%s] %s:%d %@(%p) maxEncryptedDataSize = %ld";
          v21 = v24;
          v22 = 58;
          goto LABEL_15;
        }
      }
    }
  }
  if ((VCSecureDataChannel *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = -[VCSecureDataChannel maxUnencryptedDataSize](v13, "maxUnencryptedDataSize");
        *(_DWORD *)buf = 136315906;
        v40 = v27;
        v41 = 2080;
        v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
        v43 = 1024;
        v44 = 76;
        v45 = 2048;
        v46 = v29;
        v30 = " [%s] %s:%d maxUnencryptedDataSize = %ld";
        v31 = v28;
        v32 = 38;
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCSecureDataChannel performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v35 = -[VCSecureDataChannel maxUnencryptedDataSize](v13, "maxUnencryptedDataSize");
        *(_DWORD *)buf = 136316418;
        v40 = v33;
        v41 = 2080;
        v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
        v43 = 1024;
        v44 = 76;
        v45 = 2112;
        v46 = (uint64_t)v26;
        v47 = 2048;
        v48 = v13;
        v49 = 2048;
        v50 = v35;
        v30 = " [%s] %s:%d %@(%p) maxUnencryptedDataSize = %ld";
        v31 = v34;
        v32 = 58;
        goto LABEL_26;
      }
    }
  }
  return v13;
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v13 = 0;
  if (v7)
  {
    v8 = v7;
    if (a4 == 2)
    {
      v9 = 1;
LABEL_6:
      if ((objc_msgSend(v7, "convertEncryptedData:toData:encrypted:", a2, &v13, a3) & 0x80000000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_2();
        }
      }
      else
      {
        v10 = (void *)objc_msgSend(v8, "delegate");
        objc_msgSend(v10, "vcSecureDataChannel:messageType:receivedData:", v8, v9, v13);
      }
      goto LABEL_11;
    }
    if (a4 == 6)
    {
      v9 = 2;
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]_block_invoke";
      v18 = 1024;
      v19 = 57;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Packet handler called after secure data channel was released!", buf, 0x1Cu);
    }
  }
LABEL_11:

}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  -[VCTransport registerDataReceivedHandler:forCallID:](self->_transport, "registerDataReceivedHandler:forCallID:", 0, self->_localCallID);

  if (self->tlsRecord)
    tls_record_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VCSecureDataChannel;
  -[VCSecureDataChannel dealloc](&v3, sel_dealloc);
}

- (int)setupWithSharedSecret:(id)a3 isCaller:(BOOL)a4 error:(id *)a5
{
  int v8;
  uint64_t v9;
  NSObject *v10;

  if (a3)
  {
    if ((unint64_t)objc_msgSend(a3, "length") <= 0x9F)
    {
      v8 = -2144993279;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:].cold.1(v9, a3, v10);
      }
      goto LABEL_20;
    }
    ccDRBGGetRngState();
    self->tlsRecord = (_tls_record_s *)tls_record_create();
    tls_record_set_protocol_version();
    objc_msgSend(a3, "bytes");
    objc_msgSend(a3, "length");
    if (tls_record_init_pending_ciphers())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:].cold.4();
      }
LABEL_19:
      tls_record_destroy();
      self->tlsRecord = 0;
      v8 = -2144993228;
LABEL_20:
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a5, 32024, 800, v8, 0, CFSTR("Could not setup secure data channel"), 0);
      return v8;
    }
    if (tls_record_advance_read_cipher())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:].cold.3();
      }
      goto LABEL_19;
    }
    v8 = tls_record_advance_write_cipher();
    if (v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:].cold.2();
      }
      goto LABEL_19;
    }
  }
  else
  {
    v8 = 0;
    self->tlsRecord = 0;
  }
  return v8;
}

- (int)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v21;
  NSObject *v22;
  id v23[2];

  v5 = a5;
  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  v23[0] = 0;
  if (a5)
    v9 = -[VCSecureDataChannel maxEncryptedDataSize](self, "maxEncryptedDataSize");
  else
    v9 = -[VCSecureDataChannel maxUnencryptedDataSize](self, "maxUnencryptedDataSize");
  if (objc_msgSend(a3, "length") > v9)
  {
    v19 = -2144993277;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSecureDataChannel sendData:messageType:encrypted:].cold.2(v21, a3, v22);
    }
  }
  else
  {
    v10 = -[VCSecureDataChannel convertData:toEncryptedData:encrypted:](self, "convertData:toEncryptedData:encrypted:", a3, v23, v5);
    if (v10 < 0)
    {
      v19 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSecureDataChannel sendData:messageType:encrypted:].cold.3();
      }
    }
    else
    {
      if (a4 == 1)
      {
        v17 = 2;
        goto LABEL_12;
      }
      if (a4 == 2)
      {
        v17 = 6;
        goto LABEL_12;
      }
      v18 = VCSignalErrorAt(2149974017, "Signalled error at %s: Invalid message type %d", v11, v12, v13, v14, v15, v16, (char)"getOFTTypeForSecureDataMessageType");
      if ((v18 & 0x80000000) == 0)
      {
        v17 = 0;
LABEL_12:
        v19 = -[VCTransport sendData:localCallID:remoteCallID:encrypted:OFTType:](self->_transport, "sendData:localCallID:remoteCallID:encrypted:OFTType:", v23[0], self->_localCallID, self->_remoteCallID, v5, v17);
        if (!v19)
          goto LABEL_16;
        goto LABEL_13;
      }
      v19 = v18;
    }
  }
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSecureDataChannel sendData:messageType:encrypted:].cold.1();
  }
LABEL_16:

  return v19;
}

- (int)convertEncryptedData:(id)a3 toData:(id *)a4 encrypted:(BOOL)a5
{
  void *v7;
  int v8;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[17];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(v14, 170, sizeof(v14));
  if (a3 && a4)
  {
    if (!a5)
    {
      v8 = 0;
      *a4 = a3;
      return v8;
    }
    if (self->tlsRecord)
    {
      objc_msgSend(a3, "length");
      objc_msgSend(a3, "bytes");
      *(_QWORD *)&v14[1] = tls_record_decrypted_size();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", *(_QWORD *)&v14[1]);
      *(_QWORD *)&v14[9] = objc_msgSend(v7, "bytes");
      if (tls_record_decrypt())
      {
        v8 = -2144993228;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSecureDataChannel convertEncryptedData:toData:encrypted:].cold.3();
        }
      }
      else if (v14[0] == 23)
      {
        objc_msgSend(v7, "setLength:", *(_QWORD *)&v14[1]);
        v8 = 0;
        *a4 = v7;
      }
      else
      {
        v8 = -2144993228;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSecureDataChannel convertEncryptedData:toData:encrypted:].cold.2(v12, (uint64_t)v14, v13);
        }
      }
      goto LABEL_8;
    }
    v8 = -2144993228;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSecureDataChannel convertEncryptedData:toData:encrypted:].cold.1();
    }
  }
  else
  {
    v8 = -2144993279;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
        v19 = 1024;
        v20 = 189;
        v21 = 2080;
        v22 = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid encrypted data passed to %s.", buf, 0x26u);
      }
    }
  }
  v7 = 0;
LABEL_8:

  return v8;
}

- (int)convertData:(id)a3 toEncryptedData:(id *)a4 encrypted:(BOOL)a5
{
  int v7;
  void *v8;
  void *v9;

  if (a3 && a4)
  {
    if (!a5)
    {
      v7 = 0;
      *a4 = a3;
      return v7;
    }
    v7 = -2144993228;
    if (self->tlsRecord)
    {
      objc_msgSend(a3, "bytes");
      objc_msgSend(a3, "length");
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", tls_record_encrypted_size());
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "bytes");
        if (!tls_record_encrypt())
        {
          v7 = 0;
          *a4 = v9;
        }
      }
      else
      {
        v7 = -2144993277;
      }
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSecureDataChannel convertData:toEncryptedData:encrypted:].cold.2();
    }
  }
  else
  {
    v7 = -2144993279;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSecureDataChannel convertData:toEncryptedData:encrypted:].cold.1();
    }
  }
  v9 = 0;
LABEL_8:

  return v7;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (VCSecureDataChannelDelegate)delegate
{
  return (VCSecureDataChannelDelegate *)objc_loadWeak(&self->_delegate);
}

- (int64_t)maxEncryptedDataSize
{
  int64_t v2;

  v2 = -[VCSecureDataChannel maxUnencryptedDataSize](self, "maxUnencryptedDataSize");
  return v2 - tls_record_encrypted_size();
}

- (int64_t)maxUnencryptedDataSize
{
  return self->_maxUDPPayloadSize - 10;
}

- (unint64_t)maxUDPPayloadSize
{
  return self->_maxUDPPayloadSize;
}

- (void)setMaxUDPPayloadSize:(unint64_t)a3
{
  self->_maxUDPPayloadSize = a3;
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid OFT Type %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decrypt the data. (%X)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupWithSharedSecret:(uint64_t)a1 isCaller:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "length");
  v8 = 136316418;
  v9 = a1;
  v10 = 2080;
  OUTLINED_FUNCTION_4_0();
  v11 = 105;
  v12 = 2048;
  v13 = a2;
  v14 = v6;
  v15 = 160;
  v16 = v6;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d sharedSecret (%p) invalid: requiredSize = %d, passedSize = %d", (uint8_t *)&v8, 0x32u);
}

- (void)setupWithSharedSecret:isCaller:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d tls_record_advance_write_cipher failed with error 0x%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupWithSharedSecret:isCaller:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d tls_record_advance_read_cipher failed with error 0x%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupWithSharedSecret:isCaller:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d tls_record_init_pending_ciphers failed with error 0x%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:messageType:encrypted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed with status: %X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:(uint64_t)a1 messageType:(void *)a2 encrypted:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "length");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_4_0();
  v10 = 163;
  v11 = v5;
  v12 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Data is too large (%d)", (uint8_t *)&v7, 0x22u);
}

- (void)sendData:messageType:encrypted:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to encrypt the client data (%X)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)convertEncryptedData:toData:encrypted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d need sharedSecret for encrypted data", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)convertEncryptedData:(uint64_t)a1 toData:(uint64_t)a2 encrypted:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d tls_record_decrypt returned contentType = %d != tls_record_type_AppData", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]" >> 16, 207);
  OUTLINED_FUNCTION_3();
}

- (void)convertEncryptedData:toData:encrypted:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d tls_record_decrypt failed with error 0x%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)convertData:toEncryptedData:encrypted:.cold.1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCSecureDataChannel convertData:toEncryptedData:encrypted:]";
  v4 = 1024;
  v5 = 222;
  v6 = v0;
  v7 = "-[VCSecureDataChannel convertData:toEncryptedData:encrypted:]";
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid secure data passed to %s.", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)convertData:toEncryptedData:encrypted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d need sharedSecret for encrypted data", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end

@implementation VCControlChannelMultiWay

- (void)initializeEncryption
{
  self->_isEncryptionEnabled = !-[VCDefaults forceDisableMessageEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMessageEncryption");
  self->_cryptors = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (void)finalizeEncryption
{
  VCMediaKeyIndex_Release((const void **)&self->_currentSendMKI);
  VCMediaKeyIndex_Release((const void **)&self->_currentReceiveMKI);

}

- (void)initializeSRTPInfo:(tagSRTPINFO *)a3
{
  *(_OWORD *)&a3->policy.cipherMode = xmmword_1D910ACF0;
  *(_QWORD *)&a3->policy.authenticationMode = 1;
  a3->policy.sessionAuthenticationTagLength = 4;
  a3->operatingMode = 2;
  *(_QWORD *)&a3->mediaKeyLength = 0x1000000010;
}

- (void)updateEncryptionWithEncryptionMaterial:(id *)a3
{
  int var5;
  int var4;
  int v7;
  _OWORD v8[8];
  __int128 v9;
  void *v10;
  _QWORD v11[2];
  _OWORD v12[8];
  __int128 v13;
  const void *v14[2];

  v14[1] = *(const void **)MEMORY[0x1E0C80C00];
  var5 = a3->var5;
  if (a3->var4 >= 32)
    var4 = 32;
  else
    var4 = a3->var4;
  v14[0] = 0;
  if (var5 >= 32)
    v7 = 32;
  else
    v7 = var5;
  v13 = 0u;
  memset(v12, 0, sizeof(v12));
  DWORD1(v12[4]) = ByteToHex((unint64_t)v12, 65, (unsigned __int8 *)a3, var4);
  HIDWORD(v13) = ByteToHex((unint64_t)&v12[4] + 8, 65, (unsigned __int8 *)a3->var0.var1, 14);
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "getUUIDBytes:", v11);
  VCMediaKeyIndex_ReleaseAndCopyNewValue(v14, +[VCMediaKeyIndex newMKIWithBytes:bufferSize:](VCMediaKeyIndex, "newMKIWithBytes:bufferSize:", v11, 16));
  if (-[VCControlChannelMultiWay updateEncryption:derivedSSRC:](self, "updateEncryption:derivedSSRC:", v12, a3->var1) < 0)
  {
    SRTPClearKeyDerivationInfo((uint64_t)v12);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:].cold.1();
    }
  }
  else
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", v14[0]))
    {
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentSendMKI, (void *)v14[0]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:].cold.4();
    }
    VCMediaKeyIndex_Release(v14);
    v10 = 0;
    v9 = 0u;
    memset(v8, 0, sizeof(v8));
    DWORD1(v8[4]) = ByteToHex((unint64_t)v8, 65, (unsigned __int8 *)&a3->var2, v7);
    HIDWORD(v9) = ByteToHex((unint64_t)&v8[4] + 8, 65, (unsigned __int8 *)a3->var2.var1, 14);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "getUUIDBytes:", v11);
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&v10, +[VCMediaKeyIndex newMKIWithBytes:bufferSize:](VCMediaKeyIndex, "newMKIWithBytes:bufferSize:", v11, 16));
    if (-[VCControlChannelMultiWay updateEncryption:derivedSSRC:](self, "updateEncryption:derivedSSRC:", v8, a3->var3) < 0)
    {
      SRTPClearKeyDerivationInfo((uint64_t)v12);
      SRTPClearKeyDerivationInfo((uint64_t)v8);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:].cold.2();
      }
    }
    else
    {
      if (-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", v10))
      {
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentReceiveMKI, v10);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:].cold.3();
      }
      SRTPClearKeyDerivationInfo((uint64_t)v12);
      SRTPClearKeyDerivationInfo((uint64_t)v8);
    }
  }
}

- (void)updateEncryptionWithKeyMaterial:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  double v9;
  unsigned int v10;
  uint8_t buf[48];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 146;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MKI '%@' has already been configured for this session. Ignoring duplicate", buf, 0x26u);
      }
    }
  }
  else
  {
    v18 = 0;
    v17 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    memset(buf, 0, sizeof(buf));
    v10 = 0;
    if (-[VCControlChannelMultiWay getKeyDerivationCryptoSet:withKeyMaterial:derivedSSRC:](self, "getKeyDerivationCryptoSet:withKeyMaterial:derivedSSRC:", buf, a3, &v10) < 0)
    {
      SRTPClearKeyDerivationInfo((uint64_t)buf);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:].cold.1();
      }
    }
    else
    {
      v8 = -[VCControlChannelMultiWay updateEncryption:derivedSSRC:](self, "updateEncryption:derivedSSRC:", buf, v10);
      v9 = SRTPClearKeyDerivationInfo((uint64_t)buf);
      if (v8 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:].cold.2();
        }
      }
      else if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated"), v9), "BOOLValue"))
      {
        -[VCControlChannelMultiWay setCurrentSendMKIWithKeyMaterial:](self, "setCurrentSendMKIWithKeyMaterial:", a3);
      }
    }
  }
}

- (void)setCurrentSendMKIWithKeyMaterial:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
  if (v4)
  {
    v5 = (void *)v4;
    if (!VCMediaKeyIndex_isEqual((uint64_t)self->_currentSendMKI, v4))
    {
      if (-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", v5))
      {
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentSendMKI, v5);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelMultiWay(Encryption) setCurrentSendMKIWithKeyMaterial:].cold.2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCControlChannelMultiWay(Encryption) setCurrentSendMKIWithKeyMaterial:].cold.1();
  }
}

- (int)getKeyDerivationCryptoSet:(id *)a3 withKeyMaterial:(id)a4 derivedSSRC:(unsigned int *)a5
{
  int v5;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = -2145255423;
  if (a3)
  {
    v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("SecurityKey"));
    v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("SecuritySalt"));
    if (v9 && v10 != 0)
    {
      v12 = (void *)v10;
      v13 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
      v22[0] = 0xAAAAAAAAAAAAAAAALL;
      v22[1] = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend(v13, "fullKeyBytes:", v22);
      *a5 = v22[0];
      v14 = objc_msgSend(v9, "length");
      v15 = 32;
      if (v14 >= 0x20)
        v16 = 32;
      else
        v16 = v14;
      v17 = objc_msgSend(v12, "length");
      if (v17 < 0x20)
        v15 = v17;
      v18 = ((_BYTE)v16 + 15) & 0x70;
      v19 = (unsigned __int8 *)&v22[-1] - v18;
      if (v16)
        memset((char *)&v22[-1] - v18, 170, v16);
      if (v15)
        memset((char *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v15);
      objc_msgSend(v9, "getBytes:length:", v19, v16);
      objc_msgSend(v12, "getBytes:length:", (char *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
      a3->var1 = ByteToHex((unint64_t)a3, 65, v19, v16);
      a3->var3 = ByteToHex((unint64_t)a3->var2, 65, (unsigned __int8 *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&a3->var4, v13);
      return 0;
    }
  }
  return v5;
}

- (int)updateEncryption:(id *)a3 derivedSSRC:(unsigned int)a4
{
  void **p_var4;
  int v8;
  int v9;
  VCCryptoInfo *v10;
  VCCryptoInfo *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _OWORD v19[7];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[6];
  const void *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  p_var4 = &a3->var4;
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", a3->var4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      v9 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v9;
      v18 = *p_var4;
      *(_DWORD *)buf = 136315906;
      v44 = v16;
      v45 = 2080;
      v46 = "-[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:]";
      v47 = 1024;
      v48 = 234;
      v49 = 2112;
      v50 = v18;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MKI=%@ has already been configured. Ignoring duplicate", buf, 0x26u);
    }
    return 0;
  }
  v42 = 0;
  memset(v41, 0, sizeof(v41));
  memset(v19, 0, sizeof(v19));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0;
  -[VCControlChannelMultiWay initializeSRTPInfo:](self, "initializeSRTPInfo:", v19);
  DWORD2(v20) = a4;
  SRTPDeriveMediaKeyInfo((uint64_t)v19, (unint64_t)v41, (uint64_t)a3);
  if (v8)
  {
    v9 = v8;
    SRTPClearExchangeInfo((uint64_t)v41);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:].cold.3();
    }
    return v9;
  }
  v9 = SRTPUpdateEncryptionInfo((uint64_t)v19, (uint64_t)v41, 1);
  VCMediaKeyIndex_Release(&v42);
  if (v9)
  {
    SRTPClearExchangeInfo((uint64_t)v41);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:].cold.2();
    }
    return v9;
  }
  LODWORD(v19[0]) |= 6u;
  v10 = -[VCCryptoInfo initWithSRTPInfo:]([VCCryptoInfo alloc], "initWithSRTPInfo:", v19);
  if (v10)
  {
    v11 = v10;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cryptors, "setObject:forKeyedSubscript:", v10, *p_var4);

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *p_var4;
        *(_DWORD *)buf = 136315906;
        v44 = v12;
        v45 = 2080;
        v46 = "-[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:]";
        v47 = 1024;
        v48 = 264;
        v49 = 2112;
        v50 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cryptor for keyIndex:%@ is updated", buf, 0x26u);
      }
    }
    SRTPClearExchangeInfo((uint64_t)v41);
    return 0;
  }
  v9 = -2145255420;
  SRTPClearExchangeInfo((uint64_t)v41);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:].cold.1();
  }
  return v9;
}

- (BOOL)encryptData:(char *)a3 size:(int)a4 sequenceNumber:(unsigned __int16)a5
{
  int v5;
  void **p_currentSendMKI;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  p_currentSendMKI = &self->_currentSendMKI;
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", self->_currentSendMKI);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *p_currentSendMKI;
        v15 = 136316162;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:]";
        v19 = 1024;
        v20 = 278;
        v21 = 2112;
        v22 = v11;
        v23 = 1024;
        v24 = v5;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encryptData: with currentSendMKI='%@', sequenceNumber=%d", (uint8_t *)&v15, 0x2Cu);
        if (!v7)
          goto LABEL_10;
LABEL_8:
        LOBYTE(v12) = SRTPEncryptData(objc_msgSend(v7, "state")) == 0;
        return v12;
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = *p_currentSendMKI;
      v15 = 136316162;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:]";
      v19 = 1024;
      v20 = 278;
      v21 = 2112;
      v22 = v13;
      v23 = 1024;
      v24 = v5;
      _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d encryptData: with currentSendMKI='%@', sequenceNumber=%d", (uint8_t *)&v15, 0x2Cu);
      if (v7)
        goto LABEL_8;
      goto LABEL_10;
    }
  }
  if (v7)
    goto LABEL_8;
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_13:
    LOBYTE(v12) = 0;
    return v12;
  }
  VRTraceErrorLogLevelToCSTR();
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    -[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:].cold.1();
    goto LABEL_13;
  }
  return v12;
}

- (BOOL)decryptWithMKI:(void *)a3 data:(char *)a4 size:(int)a5 sequenceNumber:(unsigned __int16)a6
{
  int v6;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *currentReceiveMKI;
  _BOOL4 v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:");
  if (!v8)
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:", self->_currentReceiveMKI);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v11 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        currentReceiveMKI = self->_currentReceiveMKI;
        v16 = 136316162;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:]";
        v20 = 1024;
        v21 = 293;
        v22 = 2112;
        v23 = currentReceiveMKI;
        v24 = 1024;
        v25 = v6;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d decryptWithMKI: currentReceiveMKI='%@', sequenceNumber=%d", (uint8_t *)&v16, 0x2Cu);
        if (!v8)
          goto LABEL_12;
LABEL_10:
        LOBYTE(v13) = SRTPEncryptData(objc_msgSend(v8, "state")) == 0;
        return v13;
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = self->_currentReceiveMKI;
      v16 = 136316162;
      v17 = v9;
      v18 = 2080;
      v19 = "-[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:]";
      v20 = 1024;
      v21 = 293;
      v22 = 2112;
      v23 = v14;
      v24 = 1024;
      v25 = v6;
      _os_log_debug_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d decryptWithMKI: currentReceiveMKI='%@', sequenceNumber=%d", (uint8_t *)&v16, 0x2Cu);
      if (v8)
        goto LABEL_10;
      goto LABEL_12;
    }
  }
  if (v8)
    goto LABEL_10;
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_15:
    LOBYTE(v13) = 0;
    return v13;
  }
  VRTraceErrorLogLevelToCSTR();
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    -[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:].cold.1();
    goto LABEL_15;
  }
  return v13;
}

- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4 mode:(int)a5
{
  int v9;
  int v10;
  VCControlChannelMultiWay *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int transportSessionID;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  NSObject *CustomRootQueue;
  uint64_t v24;
  NSObject *v25;
  unsigned int v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCControlChannelMultiWay *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
  v9 = VTP_SocketForIDS();
  if (v9 != -1)
  {
    v10 = v9;
    v28.receiver = self;
    v28.super_class = (Class)VCControlChannelMultiWay;
    v11 = -[VCControlChannel init](&v28, sel_init);
    if (!v11)
      goto LABEL_21;
    v11->_activeParticipants = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 32);
    v11->_transportSessionID = a3;
    v11->_vfdMessage = v10;
    v11->_dialogs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    VTP_SetSocketMode(v11->_vfdMessage, 2);
    VTP_SetPktType(v11->_vfdMessage, 0x10000);
    VTP_SetTransportSessionID(v11->_vfdMessage, v11->_transportSessionID);
    v11->super.super._reportingAgent = a4;
    -[VCControlChannelMultiWay flushReportingStats](v11, "flushReportingStats");
    -[VCControlChannelMultiWay registerPeriodicTask](v11, "registerPeriodicTask");
    if ((VCControlChannelMultiWay *)objc_opt_class() == v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_20;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      transportSessionID = v11->_transportSessionID;
      *(_DWORD *)buf = 136315906;
      v30 = v14;
      v31 = 2080;
      v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
      v33 = 1024;
      v34 = 207;
      v35 = 1024;
      LODWORD(v36) = transportSessionID;
      v17 = " [%s] %s:%d Created VCControlChannelMultiWay object for sessionID '%d'";
      v18 = v15;
      v19 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](v11, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_20;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v22 = v11->_transportSessionID;
      *(_DWORD *)buf = 136316418;
      v30 = v20;
      v31 = 2080;
      v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
      v33 = 1024;
      v34 = 207;
      v35 = 2112;
      v36 = v12;
      v37 = 2048;
      v38 = v11;
      v39 = 1024;
      v40 = v22;
      v17 = " [%s] %s:%d %@(%p) Created VCControlChannelMultiWay object for sessionID '%d'";
      v18 = v21;
      v19 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_20:
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v11->_sequentialKeyMaterialQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCControlChannelMultiWay.sequentialKeyMaterialQueue", 0, CustomRootQueue);
LABEL_21:
    if (!a5)
      -[VCControlChannelMultiWay initializeEncryption](v11, "initializeEncryption");
    return v11;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        v30 = v24;
        v31 = 2080;
        v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
        v33 = 1024;
        v34 = 188;
        v35 = 2112;
        v36 = v13;
        v37 = 2048;
        v38 = self;
        v39 = 1024;
        v40 = -1;
        v41 = 1024;
        v42 = v27;
        _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create VTP socket for MW control channel (%08X) for sessionID '%d'", buf, 0x3Cu);
      }
    }
  }
  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  return 0;
}

- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  return -[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:](self, "initWithTransportSessionID:reportingAgent:mode:", *(_QWORD *)&a3, a4, 0);
}

- (void)dealloc
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay object has been dealloced while its thread is still running. [VCControlChannelMultiWay stop] should have been invoked for sessionID='%d'!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)start
{
  NSObject *sequentialKeyMaterialQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VCControlChannelMultiWay_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(sequentialKeyMaterialQueue, v3);
}

void __33__VCControlChannelMultiWay_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  const __CFString *v3;
  void *v4;
  __int128 v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  int v29;
  id v30;
  int v31;
  sched_param v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  pthread_attr_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 268))
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *((_DWORD *)*v2 + 64);
          LODWORD(v45.__sig) = 136315906;
          *(uint64_t *)((char *)&v45.__sig + 4) = v7;
          *(_WORD *)&v45.__opaque[4] = 2080;
          *(_QWORD *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
          *(_WORD *)&v45.__opaque[14] = 1024;
          *(_DWORD *)&v45.__opaque[16] = 267;
          *(_WORD *)&v45.__opaque[20] = 1024;
          *(_DWORD *)&v45.__opaque[22] = v9;
          v10 = " [%s] %s:%d MW control channel already stopped for sessionID='%d'";
          v11 = v8;
          v12 = 34;
LABEL_16:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v45, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *v2;
          v16 = *((_DWORD *)*v2 + 64);
          LODWORD(v45.__sig) = 136316418;
          *(uint64_t *)((char *)&v45.__sig + 4) = v13;
          *(_WORD *)&v45.__opaque[4] = 2080;
          *(_QWORD *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
          *(_WORD *)&v45.__opaque[14] = 1024;
          *(_DWORD *)&v45.__opaque[16] = 267;
          *(_WORD *)&v45.__opaque[20] = 2112;
          *(_QWORD *)&v45.__opaque[22] = v3;
          *(_WORD *)&v45.__opaque[30] = 2048;
          *(_QWORD *)&v45.__opaque[32] = v15;
          *(_WORD *)&v45.__opaque[40] = 1024;
          *(_DWORD *)&v45.__opaque[42] = v16;
          v10 = " [%s] %s:%d %@(%p) MW control channel already stopped for sessionID='%d'";
          v11 = v14;
          v12 = 54;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    *(_BYTE *)(v1 + 268) = 1;
    *((_DWORD *)*v2 + 66) = VTP_Socket(2, 1, 6);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", *v2);
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v45.__opaque[24] = v5;
    *(_OWORD *)&v45.__opaque[40] = v5;
    *(_OWORD *)&v45.__sig = v5;
    *(_OWORD *)&v45.__opaque[8] = v5;
    v32 = (sched_param)0xAAAAAAAAAAAAAAAALL;
    pthread_attr_init(&v45);
    pthread_attr_getschedparam(&v45, &v32);
    v32.sched_priority = 58;
    pthread_attr_setschedparam(&v45, &v32);
    pthread_attr_setschedpolicy(&v45, 4);
    if (pthread_create((pthread_t *)*v2 + 34, &v45, (void *(__cdecl *)(void *))receiveProc, v4))
    {
      if ((id)objc_opt_class() == *v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __33__VCControlChannelMultiWay_start__block_invoke_cold_1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v30 = *v2;
            v31 = *((_DWORD *)*v2 + 64);
            *(_DWORD *)buf = 136316418;
            v34 = v17;
            v35 = 2080;
            v36 = "-[VCControlChannelMultiWay start]_block_invoke";
            v37 = 1024;
            v38 = 263;
            v39 = 2112;
            v40 = v6;
            v41 = 2048;
            v42 = v30;
            v43 = 1024;
            v44 = v31;
            _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create receiveProc for MW control channel for sessionID='%d'", buf, 0x36u);
          }
        }
      }
    }
    pthread_attr_destroy(&v45);
  }
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = *((_DWORD *)*v2 + 64);
        LODWORD(v45.__sig) = 136315906;
        *(uint64_t *)((char *)&v45.__sig + 4) = v20;
        *(_WORD *)&v45.__opaque[4] = 2080;
        *(_QWORD *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
        *(_WORD *)&v45.__opaque[14] = 1024;
        *(_DWORD *)&v45.__opaque[16] = 269;
        *(_WORD *)&v45.__opaque[20] = 1024;
        *(_DWORD *)&v45.__opaque[22] = v22;
        v23 = " [%s] %s:%d Started MW control channel for sessionID='%d'";
        v24 = v21;
        v25 = 34;
LABEL_35:
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v45, v25);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v28 = *v2;
        v29 = *((_DWORD *)*v2 + 64);
        LODWORD(v45.__sig) = 136316418;
        *(uint64_t *)((char *)&v45.__sig + 4) = v26;
        *(_WORD *)&v45.__opaque[4] = 2080;
        *(_QWORD *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
        *(_WORD *)&v45.__opaque[14] = 1024;
        *(_DWORD *)&v45.__opaque[16] = 269;
        *(_WORD *)&v45.__opaque[20] = 2112;
        *(_QWORD *)&v45.__opaque[22] = v19;
        *(_WORD *)&v45.__opaque[30] = 2048;
        *(_QWORD *)&v45.__opaque[32] = v28;
        *(_WORD *)&v45.__opaque[40] = 1024;
        *(_DWORD *)&v45.__opaque[42] = v29;
        v23 = " [%s] %s:%d %@(%p) Started MW control channel for sessionID='%d'";
        v24 = v27;
        v25 = 54;
        goto LABEL_35;
      }
    }
  }
}

- (void)stop
{
  NSObject *sequentialKeyMaterialQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__VCControlChannelMultiWay_stop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(sequentialKeyMaterialQueue, v3);
}

void __32__VCControlChannelMultiWay_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _opaque_pthread_t *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 268))
  {
    *(_BYTE *)(v2 + 268) = 0;
    VTP_Close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 264));
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (_opaque_pthread_t *)v3[34];
    if (!v4)
    {
LABEL_21:
      objc_msgSend(v3, "flushActiveMessages");
      return;
    }
    v27 = 0;
    pthread_join(v4, &v27);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = 0;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_20;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 256);
      *(_DWORD *)buf = 136315906;
      v29 = v7;
      v30 = 2080;
      v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
      v32 = 1024;
      v33 = 284;
      v34 = 1024;
      LODWORD(v35) = v9;
      v10 = " [%s] %s:%d Stopped MW control channel for sessionID='%d'";
      v11 = v8;
      v12 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_20;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(_DWORD *)(v21 + 256);
      *(_DWORD *)buf = 136316418;
      v29 = v19;
      v30 = 2080;
      v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
      v32 = 1024;
      v33 = 284;
      v34 = 2112;
      v35 = v5;
      v36 = 2048;
      v37 = v21;
      v38 = 1024;
      v39 = v22;
      v10 = " [%s] %s:%d %@(%p) Stopped MW control channel for sessionID='%d'";
      v11 = v20;
      v12 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_20:
    v3 = *(_QWORD **)(a1 + 32);
    goto LABEL_21;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 256);
        *(_DWORD *)buf = 136315906;
        v29 = v13;
        v30 = 2080;
        v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
        v32 = 1024;
        v33 = 289;
        v34 = 1024;
        LODWORD(v35) = v15;
        v16 = " [%s] %s:%d MW control channel already stopped for sessionID='%d'";
        v17 = v14;
        v18 = 34;
LABEL_27:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_DWORD *)(v25 + 256);
        *(_DWORD *)buf = 136316418;
        v29 = v23;
        v30 = 2080;
        v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
        v32 = 1024;
        v33 = 289;
        v34 = 2112;
        v35 = v6;
        v36 = 2048;
        v37 = v25;
        v38 = 1024;
        v39 = v26;
        v16 = " [%s] %s:%d %@(%p) MW control channel already stopped for sessionID='%d'";
        v17 = v24;
        v18 = 54;
        goto LABEL_27;
      }
    }
  }
}

+ (id)allocPayoadDataFromVTPPacket:(VCBlockBuffer_t *)a3 vpktFlags:(tagVPKTFLAG *)a4 channelDataFormat:(tagVCIDSChannelDataFormat *)a5
{
  char *var2;
  id result;
  tagVCIDSChannelDataFormat *p_var19;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.1();
    }
    return 0;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.2();
    }
    return 0;
  }
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.3();
    }
    return 0;
  }
  var2 = a3->var2;
  if (!var2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.4();
    }
    return 0;
  }
  if ((*var2 & 0xC0) != 0x40)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.7();
    }
    return 0;
  }
  if ((*var2 & 3) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.6();
    }
    return 0;
  }
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3->var2 + 1, a3->var1 - 1);
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.5();
    }
    return 0;
  }
  p_var19 = &a4->var19;
  if (!a4->var19.participantIDIsSet)
    p_var19 = 0;
  *a5 = p_var19;
  return result;
}

- (void)flushActiveMessages
{
  NSMutableDictionary *dialogs;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  dialogs = self->_dialogs;
  self->_dialogs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_sync_exit(self);
  if (dialogs)
  {
    v4 = (void *)-[NSMutableDictionary allKeys](dialogs, "allKeys");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dialogs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++)), "flushActiveTransactions");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      }
      while (v5);
    }

  }
  -[VCControlChannelMultiWay flushReportingStats](self, "flushReportingStats");
}

- (id)remoteParticipantIDFromChannelDataFormat:(tagVCIDSChannelDataFormat *)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->participantID);
  else
    v4 = &unk_1E9EF63E0;
  objc_sync_enter(self);
  if (-[VCDefaults supportsOneToOneMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "supportsOneToOneMode"))
  {
    if (objc_msgSend(v4, "isEqualToNumber:", &unk_1E9EF63E0))
    {
      if (objc_msgSend((id)-[NSMutableDictionary allKeys](self->_activeParticipants, "allKeys"), "count") == 1)
      {
        v4 = (void *)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_activeParticipants, "allKeys"), "objectAtIndexedSubscript:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v8 = 136315906;
            v9 = v5;
            v10 = 2080;
            v11 = "-[VCControlChannelMultiWay remoteParticipantIDFromChannelDataFormat:]";
            v12 = 1024;
            v13 = 348;
            v14 = 2112;
            v15 = v4;
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Zero-valued participantID updated to: %@, when there is only one remote participant", (uint8_t *)&v8, 0x26u);
          }
        }
      }
    }
  }
  objc_sync_exit(self);
  return v4;
}

- (void)messageReceived:(id)a3 participantInfo:(tagVCIDSChannelDataFormat *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *asyncProcessingQueue;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int transportSessionID;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[9];
  char v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[34];
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = -[VCControlChannelMultiWay remoteParticipantIDFromChannelDataFormat:](self, "remoteParticipantIDFromChannelDataFormat:", a4);
  v28 = 0;
  v26 = 0;
  v27 = 0;
  v25 = 1;
  v7 = -[VCControlChannelMultiWay copyDialogForParticipantID:](self, "copyDialogForParticipantID:", v6);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:", a3, v6, &v26, &v27, &v28, &v25);

    if (!v25)
    {
      asyncProcessingQueue = self->super._asyncProcessingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__VCControlChannelMultiWay_messageReceived_participantInfo___block_invoke;
      block[3] = &unk_1E9E54D48;
      block[4] = v26;
      block[5] = self;
      block[6] = v9;
      block[7] = v27;
      block[8] = v6;
      dispatch_async(asyncProcessingQueue, block);
    }
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          transportSessionID = self->_transportSessionID;
          *(_DWORD *)buf = 136317186;
          v30 = v12;
          v31 = 2080;
          v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
          v33 = 1024;
          v34 = 384;
          v35 = 1024;
          *(_DWORD *)v36 = transportSessionID;
          *(_WORD *)&v36[4] = 2112;
          *(_QWORD *)&v36[6] = v26;
          *(_WORD *)&v36[14] = 2112;
          *(_QWORD *)&v36[16] = v9;
          *(_WORD *)&v36[24] = 2112;
          *(_QWORD *)&v36[26] = v6;
          v37 = 2112;
          v38 = v27;
          v39 = 1024;
          LODWORD(v40) = v28;
          v15 = " [%s] %s:%d messageReceived finished for sessionID='%d': topic='%@', message='%@', participantID='%@', s"
                "equenceNumber='%@', status='%d'";
          v16 = v13;
          v17 = 80;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_transportSessionID;
          *(_DWORD *)buf = 136317698;
          v30 = v18;
          v31 = 2080;
          v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
          v33 = 1024;
          v34 = 384;
          v35 = 2112;
          *(_QWORD *)v36 = v11;
          *(_WORD *)&v36[8] = 2048;
          *(_QWORD *)&v36[10] = self;
          *(_WORD *)&v36[18] = 1024;
          *(_DWORD *)&v36[20] = v20;
          *(_WORD *)&v36[24] = 2112;
          *(_QWORD *)&v36[26] = v26;
          v37 = 2112;
          v38 = v9;
          v39 = 2112;
          v40 = v6;
          v41 = 2112;
          v42 = v27;
          v43 = 1024;
          v44 = v28;
          v15 = " [%s] %s:%d %@(%p) messageReceived finished for sessionID='%d': topic='%@', message='%@', participantID="
                "'%@', sequenceNumber='%@', status='%d'";
          v16 = v19;
          v17 = 100;
          goto LABEL_14;
        }
      }
    }
  }
  else if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay messageReceived:participantInfo:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v30 = v22;
        v31 = 2080;
        v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
        v33 = 1024;
        v34 = 363;
        v35 = 2112;
        *(_QWORD *)v36 = v21;
        *(_WORD *)&v36[8] = 2048;
        *(_QWORD *)&v36[10] = self;
        *(_WORD *)&v36[18] = 2112;
        *(_QWORD *)&v36[20] = v6;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%@'", buf, 0x3Au);
      }
    }
  }
}

void __60__VCControlChannelMultiWay_messageReceived_participantInfo___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("VCExternalClientDataTopic"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = (void *)MEMORY[0x1DF086F1C](v3 + 176);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "controlChannel:receivedData:transactionID:fromParticipant:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "unsignedLongValue"), *(_QWORD *)(a1 + 64));
    if (v4)
      goto LABEL_5;
  }
  else
  {
    v4 = (void *)MEMORY[0x1DF086F1C](v3 + 168);
    objc_msgSend(v4, "controlChannel:topic:payload:transactionID:fromParticipant:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "unsignedLongValue"), *(_QWORD *)(a1 + 64));
    if (v4)
LABEL_5:
      CFRelease(v4);
  }
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  return -[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:](self, "sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:", a3, a4, a5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCControlChannel reliableMessageResendInterval](self, "reliableMessageResendInterval")), 0);
}

- (id)copyDialogForParticipantID:(id)a3
{
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  VCControlChannelMultiWay *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dialogs, "objectForKeyedSubscript:", objc_msgSend(a3, "stringValue"));
  if (v5)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_38;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136316418;
          v24 = v12;
          v25 = 2080;
          v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
          v27 = 1024;
          v28 = 398;
          v29 = 2112;
          v30 = (id)v6;
          v31 = 2048;
          v32 = self;
          v33 = 2112;
          v34 = a3;
          v11 = " [%s] %s:%d %@(%p) sendMessage: found existing dialog for participantID='%@'";
LABEL_27:
          v17 = v13;
          v18 = 58;
          goto LABEL_28;
        }
        goto LABEL_38;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_38;
      v23 = 136316418;
      v24 = v12;
      v25 = 2080;
      v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
      v27 = 1024;
      v28 = 398;
      v29 = 2112;
      v30 = (id)v6;
      v31 = 2048;
      v32 = self;
      v33 = 2112;
      v34 = a3;
      v21 = " [%s] %s:%d %@(%p) sendMessage: found existing dialog for participantID='%@'";
LABEL_35:
      _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v23, 0x3Au);
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_38;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[VCControlChannelMultiWay copyDialogForParticipantID:].cold.2();
      goto LABEL_38;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    v23 = 136315906;
    v24 = v8;
    v25 = 2080;
    v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    v27 = 1024;
    v28 = 398;
    v29 = 2112;
    v30 = a3;
    v11 = " [%s] %s:%d sendMessage: found existing dialog for participantID='%@'";
LABEL_21:
    v17 = v9;
    v18 = 38;
LABEL_28:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, v18);
    goto LABEL_38;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_38;
    v15 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v16 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[VCControlChannelMultiWay copyDialogForParticipantID:].cold.1();
      goto LABEL_38;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    v23 = 136315906;
    v24 = v15;
    v25 = 2080;
    v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    v27 = 1024;
    v28 = 400;
    v29 = 2112;
    v30 = a3;
    v11 = " [%s] %s:%d sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_21;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_38;
  v19 = VRTraceErrorLogLevelToCSTR();
  v13 = *MEMORY[0x1E0CF2758];
  v20 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_38;
    v23 = 136316418;
    v24 = v19;
    v25 = 2080;
    v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    v27 = 1024;
    v28 = 400;
    v29 = 2112;
    v30 = (id)v7;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = a3;
    v21 = " [%s] %s:%d %@(%p) sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_35;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136316418;
    v24 = v19;
    v25 = 2080;
    v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    v27 = 1024;
    v28 = 400;
    v29 = 2112;
    v30 = (id)v7;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = a3;
    v11 = " [%s] %s:%d %@(%p) sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_27;
  }
LABEL_38:
  objc_sync_exit(self);
  return v5;
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(id)a6 withOptions:(id)a7
{
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int transportSessionID;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  _BOOL4 v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  _BYTE v52[44];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        v44 = v14;
        v45 = 2080;
        v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
        v47 = 1024;
        v48 = 407;
        v49 = 2112;
        v50 = a3;
        v51 = 1024;
        *(_DWORD *)v52 = transportSessionID;
        *(_WORD *)&v52[4] = 2048;
        *(_QWORD *)&v52[6] = a5;
        *(_WORD *)&v52[14] = 2112;
        *(_QWORD *)&v52[16] = a6;
        v17 = " [%s] %s:%d VCControlChannelMultiWay: sendReliableMessageAndWait: message '%@' for sessionID '%d', partici"
              "pantID '%llu', timeout '%@'";
        v18 = v15;
        v19 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_transportSessionID;
        *(_DWORD *)buf = 136317186;
        v44 = v20;
        v45 = 2080;
        v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
        v47 = 1024;
        v48 = 407;
        v49 = 2112;
        v50 = (id)v13;
        v51 = 2048;
        *(_QWORD *)v52 = self;
        *(_WORD *)&v52[8] = 2112;
        *(_QWORD *)&v52[10] = a3;
        *(_WORD *)&v52[18] = 1024;
        *(_DWORD *)&v52[20] = v22;
        *(_WORD *)&v52[24] = 2048;
        *(_QWORD *)&v52[26] = a5;
        *(_WORD *)&v52[34] = 2112;
        *(_QWORD *)&v52[36] = a6;
        v17 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendReliableMessageAndWait: message '%@' for sessionID '%d', "
              "participantID '%llu', timeout '%@'";
        v18 = v21;
        v19 = 84;
        goto LABEL_11;
      }
    }
  }
  if (!self->_isRunning)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v29 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_18;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      *(_DWORD *)buf = 136316930;
      v44 = v35;
      v45 = 2080;
      v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      v47 = 1024;
      v48 = 410;
      v49 = 2112;
      v50 = (id)v29;
      v51 = 2048;
      *(_QWORD *)v52 = self;
      *(_WORD *)&v52[8] = 2112;
      *(_QWORD *)&v52[10] = a3;
      *(_WORD *)&v52[18] = 2112;
      *(_QWORD *)&v52[20] = a4;
      *(_WORD *)&v52[28] = 2048;
      *(_QWORD *)&v52[30] = a5;
      v33 = " [%s] %s:%d %@(%p) Attempt to send reliable message=%@ with topic=%@ to participantID=%llu when Control Chan"
            "nel is not started. Ignoring...";
      v34 = v36;
      v37 = 78;
      goto LABEL_42;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      *(_DWORD *)buf = 136316418;
      v44 = v31;
      v45 = 2080;
      v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      v47 = 1024;
      v48 = 410;
      v49 = 2112;
      v50 = a3;
      v51 = 2112;
      *(_QWORD *)v52 = a4;
      *(_WORD *)&v52[8] = 2048;
      *(_QWORD *)&v52[10] = a5;
      v33 = " [%s] %s:%d Attempt to send reliable message=%@ with topic=%@ to participantID=%llu when Control Channel is "
            "not started. Ignoring...";
      v34 = v32;
      goto LABEL_41;
    }
LABEL_18:
    LOBYTE(v27) = 0;
    return v27;
  }
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v24 = -[VCControlChannelMultiWay copyDialogForParticipantID:](self, "copyDialogForParticipantID:", v23);
  v25 = v24;
  if (!v24)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v27)
          return v27;
        -[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:].cold.1();
      }
      goto LABEL_18;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      *(_DWORD *)buf = 136316418;
      v44 = v38;
      v45 = 2080;
      v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      v47 = 1024;
      v48 = 413;
      v49 = 2112;
      v50 = (id)v30;
      v51 = 2048;
      *(_QWORD *)v52 = self;
      *(_WORD *)&v52[8] = 2048;
      *(_QWORD *)&v52[10] = a5;
      v33 = " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%llu'";
      v34 = v39;
LABEL_41:
      v37 = 58;
LABEL_42:
      _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v33, buf, v37);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v26 = objc_msgSend(v24, "sendReliableMessage:withTopic:timeout:withOptions:", a3, a4, a6, a7);

  if ((v26 & 1) == 0)
  {
    objc_sync_enter(self);
    v28 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", v23);
    objc_sync_exit(self);
    if (v28 && !self->_didSubmitCCReliableDataNotReceivedSymptom)
    {
      -[VCObject reportingAgent](self, "reportingAgent");
      v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5, CFSTR("SymptomReporterOptionalKeyParticipantID"));
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      reportingSymptom();
      LOBYTE(v27) = 0;
      self->_didSubmitCCReliableDataNotReceivedSymptom = 1;
      return v27;
    }
    goto LABEL_18;
  }
  LOBYTE(v27) = 1;
  return v27;
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7
{
  return -[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:](self, "sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:", a3, a4, a5, *(_QWORD *)&a6, 0, a7);
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8
{
  NSObject *asyncProcessingQueue;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[10];
  unsigned int v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCControlChannelMultiWay *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a8)
  {
    asyncProcessingQueue = self->super._asyncProcessingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID_timeout_withOptions_completion___block_invoke;
    block[3] = &unk_1E9E572F8;
    block[4] = self;
    block[5] = a3;
    v16 = a6;
    block[6] = a4;
    block[7] = a7;
    block[8] = a8;
    block[9] = a5;
    dispatch_async(asyncProcessingQueue, block);
  }
  else if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:]";
        v21 = 1024;
        v22 = 437;
        v23 = 2112;
        v24 = v12;
        v25 = 2048;
        v26 = self;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) completion should not be nil", buf, 0x30u);
      }
    }
  }
  return a8 != 0;
}

uint64_t __103__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID_timeout_withOptions_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80)), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int transportSessionID;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  NSObject *asyncProcessingQueue;
  _QWORD v20[8];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BYTE v30[18];
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:]";
        v25 = 1024;
        v26 = 449;
        v27 = 2112;
        v28 = a3;
        v29 = 1024;
        *(_DWORD *)v30 = transportSessionID;
        *(_WORD *)&v30[4] = 2048;
        *(_QWORD *)&v30[6] = a5;
        v13 = " [%s] %s:%d VCControlChannelMultiWay: sendReliableMessage: message '%@' for sessionID '%d', participantID '%llu's";
        v14 = v11;
        v15 = 54;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_transportSessionID;
        *(_DWORD *)buf = 136316930;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:]";
        v25 = 1024;
        v26 = 449;
        v27 = 2112;
        v28 = (id)v9;
        v29 = 2048;
        *(_QWORD *)v30 = self;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = a3;
        v31 = 1024;
        v32 = v18;
        v33 = 2048;
        v34 = a5;
        v13 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendReliableMessage: message '%@' for sessionID '%d', participantID '%llu's";
        v14 = v17;
        v15 = 74;
        goto LABEL_11;
      }
    }
  }
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID___block_invoke;
  v20[3] = &unk_1E9E54B40;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  dispatch_async(asyncProcessingQueue, v20);
}

uint64_t __72__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id Weak;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "sendReliableMessageAndWait:withTopic:participantID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "VCCCPayloadKey"), "isEqualToString:", CFSTR("EncryptedMessage"));
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    Weak = objc_loadWeak((id *)(v4 + 168));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "VCCCString");
    return objc_msgSend(Weak, "controlChannel:sendReliableMessage:didSucceed:toParticipant:", v6, v7, v2, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)));
  }
  else
  {
    v9 = objc_loadWeak((id *)(v4 + 176));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = objc_msgSend(*(id *)(a1 + 40), "VCCCData");
      return objc_msgSend(v9, "controlChannel:sendReliableData:didSucceed:toParticipant:", v10, v11, v2, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)));
    }
  }
  return result;
}

- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int transportSessionID;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  NSObject *asyncProcessingQueue;
  _QWORD v20[8];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BYTE v30[18];
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]";
        v25 = 1024;
        v26 = 465;
        v27 = 2112;
        v28 = a3;
        v29 = 1024;
        *(_DWORD *)v30 = transportSessionID;
        *(_WORD *)&v30[4] = 2048;
        *(_QWORD *)&v30[6] = a5;
        v13 = " [%s] %s:%d VCControlChannelMultiWay: sendUnreliableMessage: message '%@' for sessionID '%d', participantID '%llu'";
        v14 = v11;
        v15 = 54;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_transportSessionID;
        *(_DWORD *)buf = 136316930;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]";
        v25 = 1024;
        v26 = 465;
        v27 = 2112;
        v28 = (id)v9;
        v29 = 2048;
        *(_QWORD *)v30 = self;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = a3;
        v31 = 1024;
        v32 = v18;
        v33 = 2048;
        v34 = a5;
        v13 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendUnreliableMessage: message '%@' for sessionID '%d', participantID '%llu'";
        v14 = v17;
        v15 = 74;
        goto LABEL_11;
      }
    }
  }
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke;
  v20[3] = &unk_1E9E54B40;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  dispatch_async(asyncProcessingQueue, v20);
}

void __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "copyDialogForParticipantID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)));
  if (v7)
  {
    objc_msgSend(v7, "sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 256), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)), *(_QWORD *)(a1 + 32));

  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136316418;
        v9 = v3;
        v10 = 2080;
        v11 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]_block_invoke";
        v12 = 1024;
        v13 = 468;
        v14 = 2112;
        v15 = v2;
        v16 = 2048;
        v17 = v5;
        v18 = 2048;
        v19 = v6;
        _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%llu'", buf, 0x3Au);
      }
    }
  }
}

- (BOOL)addActiveParticipant:(unint64_t)a3 participantUUID:(id)a4 withConfiguration:(id *)a5
{
  uint64_t var0;
  VCControlChannelDialogV1 *v10;
  VCControlChannelDialogV2 *v11;
  VCControlChannelDialogV2 *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int transportSessionID;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  BOOL v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  VCControlChannelMultiWay *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unsigned int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    objc_sync_enter(self);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3)))
    {
      if ((VCControlChannelMultiWay *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_30;
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v42 = 136315906;
        v43 = v36;
        v44 = 2080;
        v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        v46 = 1024;
        v47 = 484;
        v48 = 2048;
        v49 = a3;
        v28 = " [%s] %s:%d API misuse! Participant '%llu' has alrady been added to the list of active participants! Ignoring...";
        v29 = v37;
        v30 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v35 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v35 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_30;
        v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x1E0CF2758];
        v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v42 = 136316418;
        v43 = v40;
        v44 = 2080;
        v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        v46 = 1024;
        v47 = 484;
        v48 = 2112;
        v49 = (unint64_t)v35;
        v50 = 2048;
        v51 = self;
        v52 = 2048;
        v53 = a3;
        v28 = " [%s] %s:%d %@(%p) API misuse! Participant '%llu' has alrady been added to the list of active participants! Ignoring...";
        v29 = v41;
        v30 = 58;
      }
    }
    else
    {
      var0 = a5->var0;
      if ((_DWORD)var0 == 2)
      {
        v12 = [VCControlChannelDialogV2 alloc];
        v11 = -[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:](v12, "initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:", self->_transportSessionID, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), a4, a5, self);
LABEL_7:
        -[VCObject setReportingAgent:](v11, "setReportingAgent:", self->super.super._reportingAgent);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dialogs, "setObject:forKeyedSubscript:", v11, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), "stringValue"));

        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", var0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeParticipants, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
        if ((VCControlChannelMultiWay *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_21;
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          transportSessionID = self->_transportSessionID;
          v42 = 136316162;
          v43 = v16;
          v44 = 2080;
          v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
          v46 = 1024;
          v47 = 502;
          v48 = 2048;
          v49 = a3;
          v50 = 1024;
          LODWORD(v51) = transportSessionID;
          v19 = " [%s] %s:%d addActiveParticipant:'%llu' for sessionID '%d'";
          v20 = v17;
          v21 = 44;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v14 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v14 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_21;
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          v24 = self->_transportSessionID;
          v42 = 136316674;
          v43 = v22;
          v44 = 2080;
          v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
          v46 = 1024;
          v47 = 502;
          v48 = 2112;
          v49 = (unint64_t)v14;
          v50 = 2048;
          v51 = self;
          v52 = 2048;
          v53 = a3;
          v54 = 1024;
          v55 = v24;
          v19 = " [%s] %s:%d %@(%p) addActiveParticipant:'%llu' for sessionID '%d'";
          v20 = v23;
          v21 = 64;
        }
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v42, v21);
LABEL_21:
        v25 = 1;
LABEL_31:
        objc_sync_exit(self);
        return v25;
      }
      if ((_DWORD)var0 == 1)
      {
        v10 = [VCControlChannelDialogV1 alloc];
        v11 = -[VCControlChannelDialogV1 initWithSessionID:participantID:participantUUID:optionalTopics:participantConfig:transactionDelegate:](v10, "initWithSessionID:participantID:participantUUID:optionalTopics:participantConfig:transactionDelegate:", self->_transportSessionID, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), a4, self->super._optionalTopics, a5, self);
        goto LABEL_7;
      }
      if ((VCControlChannelMultiWay *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        {
LABEL_30:
          v25 = 0;
          goto LABEL_31;
        }
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v42 = 136315906;
        v43 = v26;
        v44 = 2080;
        v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        v46 = 1024;
        v47 = 495;
        v48 = 1024;
        LODWORD(v49) = var0;
        v28 = " [%s] %s:%d Wrong version of protocol supplied '%u'. Ignoring...";
        v29 = v27;
        v30 = 34;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v15 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_30;
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v42 = 136316418;
        v43 = v31;
        v44 = 2080;
        v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        v46 = 1024;
        v47 = 495;
        v48 = 2112;
        v49 = (unint64_t)v15;
        v50 = 2048;
        v51 = self;
        v52 = 1024;
        LODWORD(v53) = var0;
        v28 = " [%s] %s:%d %@(%p) Wrong version of protocol supplied '%u'. Ignoring...";
        v29 = v32;
        v30 = 54;
      }
    }
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v42, v30);
    goto LABEL_30;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v42 = 136316162;
        v43 = v38;
        v44 = 2080;
        v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        v46 = 1024;
        v47 = 481;
        v48 = 2112;
        v49 = (unint64_t)v34;
        v50 = 2048;
        v51 = self;
        _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) participantConfig must not be nil", (uint8_t *)&v42, 0x30u);
      }
    }
  }
  return 0;
}

- (void)processParticipantRemoval:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_activeParticipants, "removeObjectForKey:");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dialogs, "objectForKeyedSubscript:", objc_msgSend(a3, "stringValue")), "flushActiveTransactions");
  -[NSMutableDictionary removeObjectForKey:](self->_dialogs, "removeObjectForKey:", objc_msgSend(a3, "stringValue"));
}

- (void)removeActiveParticipant:(unint64_t)a3
{
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int transportSessionID;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  NSObject *asyncProcessingQueue;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  VCControlChannelMultiWay *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  objc_sync_enter(self);
  -[VCControlChannelMultiWay processParticipantRemoval:](self, "processParticipantRemoval:", v5);
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316162;
        v19 = v7;
        v20 = 2080;
        v21 = "-[VCControlChannelMultiWay removeActiveParticipant:]";
        v22 = 1024;
        v23 = 522;
        v24 = 2048;
        v25 = a3;
        v26 = 1024;
        LODWORD(v27) = transportSessionID;
        v10 = " [%s] %s:%d removeActiveParticipant:Removed participant '%llu' for sessionID '%d'";
        v11 = v8;
        v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCControlChannelMultiWay removeActiveParticipant:]";
        v22 = 1024;
        v23 = 522;
        v24 = 2112;
        v25 = (unint64_t)v6;
        v26 = 2048;
        v27 = self;
        v28 = 2048;
        v29 = a3;
        v30 = 1024;
        v31 = v15;
        v10 = " [%s] %s:%d %@(%p) removeActiveParticipant:Removed participant '%llu' for sessionID '%d'";
        v11 = v14;
        v12 = 64;
        goto LABEL_11;
      }
    }
  }
  objc_sync_exit(self);
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__VCControlChannelMultiWay_removeActiveParticipant___block_invoke;
  v17[3] = &unk_1E9E52238;
  v17[4] = self;
  v17[5] = v5;
  dispatch_async(asyncProcessingQueue, v17);
}

uint64_t __52__VCControlChannelMultiWay_removeActiveParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 168)), "controlChannel:clearTransactionCacheForParticipant:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)removeAllActiveParticipants
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int transportSessionID;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCControlChannelMultiWay *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  unsigned int v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v3 = (void *)-[NSMutableDictionary allKeys](self->_activeParticipants, "allKeys");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v36;
    *(_QWORD *)&v5 = 136316162;
    v19 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v8 = *(const __CFString **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[VCControlChannelMultiWay processParticipantRemoval:](self, "processParticipantRemoval:", v8, v19);
        if ((VCControlChannelMultiWay *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              transportSessionID = self->_transportSessionID;
              *(_DWORD *)buf = v19;
              v21 = v16;
              v22 = 2080;
              v23 = "-[VCControlChannelMultiWay removeAllActiveParticipants]";
              v24 = 1024;
              v25 = 535;
              v26 = 2112;
              v27 = v8;
              v28 = 1024;
              LODWORD(v29) = transportSessionID;
              v13 = v17;
              v14 = " [%s] %s:%d Removed participant '%@' for sessionID '%d'";
              v15 = 44;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v9 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v12 = self->_transportSessionID;
              *(_DWORD *)buf = 136316674;
              v21 = v10;
              v22 = 2080;
              v23 = "-[VCControlChannelMultiWay removeAllActiveParticipants]";
              v24 = 1024;
              v25 = 535;
              v26 = 2112;
              v27 = v9;
              v28 = 2048;
              v29 = self;
              v30 = 2112;
              v31 = v8;
              v32 = 1024;
              v33 = v12;
              v13 = v11;
              v14 = " [%s] %s:%d %@(%p) Removed participant '%@' for sessionID '%d'";
              v15 = 64;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              continue;
            }
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v4);
  }
  objc_sync_exit(self);
}

- (void)scheduleAfter:(unsigned int)a3 block:(id)a4
{
  dispatch_time_t v6;
  NSObject *asyncProcessingQueue;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = dispatch_time(0, 1000000000 * a3);
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__VCControlChannelMultiWay_scheduleAfter_block___block_invoke;
  v8[3] = &unk_1E9E55D00;
  v8[4] = a4;
  dispatch_after(v6, asyncProcessingQueue, v8);
}

uint64_t __48__VCControlChannelMultiWay_scheduleAfter_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateTransactionIDWithKeyMaterial:(id)a3
{
  unint64_t *p_transactionID;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  VCControlChannelMultiWay *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated")), "BOOLValue"))return;
  if (self->_currentSendMKI)
  {
    if (VCMediaKeyIndex_isEqual((uint64_t)self->_currentSendMKI, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"))))
    {
      return;
    }
    p_transactionID = (unint64_t *)&self->_transactionID;
LABEL_5:
    v6 = *p_transactionID;
    v7 = (*p_transactionID & 0xFFFFFFFFFFFF0000) + 0x10000;
    do
    {
      v8 = __ldxr(p_transactionID);
      if (v8 != v6)
      {
        __clrex();
        goto LABEL_5;
      }
    }
    while (__stxr(v7, p_transactionID));
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v26 = 136316418;
          v27 = v24;
          v28 = 2080;
          v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
          v30 = 1024;
          v31 = 568;
          v32 = 2112;
          v33 = (unint64_t)v15;
          v34 = 2048;
          v35 = self;
          v36 = 2048;
          v37 = v7;
          v18 = " [%s] %s:%d %@(%p) Reset transactionID=%llu";
          v21 = v25;
          goto LABEL_37;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v22 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v26 = 136315906;
    v27 = v22;
    v28 = 2080;
    v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
    v30 = 1024;
    v31 = 568;
    v32 = 2048;
    v33 = v7;
    v18 = " [%s] %s:%d Reset transactionID=%llu";
LABEL_32:
    v21 = v17;
    v23 = 38;
LABEL_38:
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v26, v23);
    return;
  }
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityMaxSequenceNumber")), "unsignedLongLongValue");
  v10 = v9;
  v11 = (unint64_t *)&self->_transactionID;
LABEL_11:
  v12 = *v11;
  do
  {
    v13 = __ldxr(v11);
    if (v13 != v12)
    {
      __clrex();
      goto LABEL_11;
    }
  }
  while (__stxr(v9, v11));
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v26 = 136315906;
    v27 = v16;
    v28 = 2080;
    v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
    v30 = 1024;
    v31 = 556;
    v32 = 2048;
    v33 = v10;
    v18 = " [%s] %s:%d Initialized transactionID=%llu";
    goto LABEL_32;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v14 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136316418;
      v27 = v19;
      v28 = 2080;
      v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
      v30 = 1024;
      v31 = 556;
      v32 = 2112;
      v33 = (unint64_t)v14;
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = v10;
      v18 = " [%s] %s:%d %@(%p) Initialized transactionID=%llu";
      v21 = v20;
LABEL_37:
      v23 = 58;
      goto LABEL_38;
    }
  }
}

- (void)addNewKeyMaterial:(id)a3
{
  NSObject *sequentialKeyMaterialQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (self->_isEncryptionEnabled)
  {
    sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__VCControlChannelMultiWay_addNewKeyMaterial___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(sequentialKeyMaterialQueue, block);
  }
}

uint64_t __46__VCControlChannelMultiWay_addNewKeyMaterial___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateTransactionIDWithKeyMaterial:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateEncryptionWithKeyMaterial:", *(_QWORD *)(a1 + 40));
}

- (void)setEncryptionWithEncryptionMaterial:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  NSObject *sequentialKeyMaterialQueue;
  _QWORD v11[6];
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_isEncryptionEnabled)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x10810000000;
    v12[3] = "";
    v3 = *(_OWORD *)&a3->var2.var2;
    v25 = *(_OWORD *)&a3->var2.var1[15];
    v26 = v3;
    v27 = *(_QWORD *)&a3->var5;
    v4 = *(_OWORD *)&a3->var2.var0[32];
    v21 = *(_OWORD *)&a3->var2.var0[16];
    v22 = v4;
    v5 = *(_OWORD *)&a3->var2.var0[64];
    v23 = *(_OWORD *)&a3->var2.var0[48];
    v24 = v5;
    v6 = *(_OWORD *)&a3->var0.var1[15];
    v17 = *(_OWORD *)&a3->var0.var0[64];
    v18 = v6;
    v7 = *(_OWORD *)a3->var2.var0;
    v19 = *(_OWORD *)&a3->var0.var2;
    v20 = v7;
    v8 = *(_OWORD *)&a3->var0.var0[16];
    v13 = *(_OWORD *)a3->var0.var0;
    v14 = v8;
    v9 = *(_OWORD *)&a3->var0.var0[48];
    v15 = *(_OWORD *)&a3->var0.var0[32];
    v16 = v9;
    sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__VCControlChannelMultiWay_setEncryptionWithEncryptionMaterial___block_invoke;
    v11[3] = &unk_1E9E522B0;
    v11[4] = self;
    v11[5] = v12;
    dispatch_async(sequentialKeyMaterialQueue, v11);
    _Block_object_dispose(v12, 8);
  }
}

uint64_t __64__VCControlChannelMultiWay_setEncryptionWithEncryptionMaterial___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateEncryptionWithEncryptionMaterial:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
}

- (void)addToSentStats:(int)a3
{
  int *p_bytesSent;
  unsigned int v4;

  p_bytesSent = &self->super._bytesSent;
  do
    v4 = __ldxr((unsigned int *)p_bytesSent);
  while (__stxr(v4 + a3, (unsigned int *)p_bytesSent));
}

- (void)addToReceivedStats:(int)a3
{
  int *p_bytesReceived;
  unsigned int v4;

  p_bytesReceived = &self->super._bytesReceived;
  do
    v4 = __ldxr((unsigned int *)p_bytesReceived);
  while (__stxr(v4 + a3, (unsigned int *)p_bytesReceived));
}

- (BOOL)isParticipantActive:(unint64_t)a3
{
  BOOL v5;

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3)) != 0;
  objc_sync_exit(self);
  return v5;
}

- (id)lastUsedMKIBytes
{
  void *currentSendMKI;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BYTE v8[22];
  __int16 v9;
  int v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  VCControlChannelMultiWay *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentSendMKI = self->_currentSendMKI;
  if (currentSendMKI)
  {
    *(_QWORD *)v8 = 0;
    *(_QWORD *)&v8[8] = 0;
    VCMediaKeyIndex_FullKeyBytes(currentSendMKI, v8);
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 16);
  }
  else
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCControlChannelMultiWay lastUsedMKIBytes].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCControlChannelMultiWay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v8 = 136316162;
          *(_QWORD *)&v8[4] = v6;
          *(_WORD *)&v8[12] = 2080;
          *(_QWORD *)&v8[14] = "-[VCControlChannelMultiWay lastUsedMKIBytes]";
          v9 = 1024;
          v10 = 611;
          v11 = 2112;
          v12 = v5;
          v13 = 2048;
          v14 = self;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) currentSendMKI is nil", v8, 0x30u);
        }
      }
    }
    return 0;
  }
}

- (int)protocolVersionforParticipantID:(id)a3
{
  void *v5;

  objc_sync_enter(self);
  if (a3)
  {
    v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", a3);
    if (v5)
      LODWORD(a3) = objc_msgSend(v5, "unsignedIntValue");
    else
      LODWORD(a3) = 0;
  }
  objc_sync_exit(self);
  return (int)a3;
}

- (void)reportSignificantHandshakeDelaySymptomForParticipantID:(id)a3
{
  NSObject *sequentialKeyMaterialQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__VCControlChannelMultiWay_reportSignificantHandshakeDelaySymptomForParticipantID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sequentialKeyMaterialQueue, block);
}

_BYTE *__83__VCControlChannelMultiWay_reportSignificantHandshakeDelaySymptomForParticipantID___block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (result[268])
  {
    objc_msgSend(result, "reportingAgent");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = CFSTR("SymptomReporterOptionalKeyParticipantID");
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    return (_BYTE *)reportingSymptom();
  }
  return result;
}

- (unint64_t)nextTransactionID
{
  int64_t *p_transactionID;
  unint64_t v3;
  unint64_t result;

  p_transactionID = &self->_transactionID;
  do
  {
    v3 = __ldxr((unint64_t *)p_transactionID);
    result = v3 + 1;
  }
  while (__stxr(v3 + 1, (unint64_t *)p_transactionID));
  return result;
}

- (void)periodicTask:(void *)a3
{
  double v5;
  double v6;
  int *p_bytesSent;
  unsigned int v8;
  int v9;
  double v10;
  double maxSentRate;
  int minSentRate;
  int v13;
  int *p_bytesReceived;
  unsigned int v15;
  int v16;
  double v17;
  double maxReceivedRate;
  int minReceivedRate;
  int v20;

  v5 = micro();
  v6 = v5 - self->super._lastUpdateTimestamp;
  self->super._lastUpdateTimestamp = v5;
  p_bytesSent = &self->super._bytesSent;
  do
    v8 = __ldxr((unsigned int *)p_bytesSent);
  while (__stxr(v8, (unsigned int *)p_bytesSent));
  v9 = v8 - self->super._lastProcessedBytesSent;
  self->super._lastProcessedBytesSent = v8;
  if (v6 == 0.0)
  {
    v13 = 0;
    self->super._maxSentRate = 0;
  }
  else
  {
    v10 = (double)v9 / v6;
    maxSentRate = (double)self->super._maxSentRate;
    if (v10 > maxSentRate)
      maxSentRate = (double)v9 / v6;
    self->super._maxSentRate = (int)maxSentRate;
    minSentRate = self->super._minSentRate;
    if (v10 > (double)minSentRate)
      v10 = (double)minSentRate;
    v13 = (int)v10;
  }
  self->super._minSentRate = v13;
  self->super._bytesSentToReport += v9;
  p_bytesReceived = &self->super._bytesReceived;
  do
    v15 = __ldxr((unsigned int *)p_bytesReceived);
  while (__stxr(v15, (unsigned int *)p_bytesReceived));
  v16 = v15 - self->super._lastProcessedBytesReceived;
  self->super._lastProcessedBytesReceived = v15;
  if (v6 == 0.0)
  {
    v20 = 0;
    self->super._maxReceivedRate = 0;
  }
  else
  {
    v17 = (double)v16 / v6;
    maxReceivedRate = (double)self->super._maxReceivedRate;
    if (v17 > maxReceivedRate)
      maxReceivedRate = v17;
    self->super._maxReceivedRate = (int)maxReceivedRate;
    minReceivedRate = self->super._minReceivedRate;
    if (v17 > (double)minReceivedRate)
      v17 = (double)minReceivedRate;
    v20 = (int)v17;
  }
  self->super._minReceivedRate = v20;
  self->super._bytesReceivedToReport += v16;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._minSentRate), CFSTR("CCMinBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._maxSentRate), CFSTR("CCMaxBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._bytesSentToReport), CFSTR("CCRawBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._minReceivedRate), CFSTR("CCMinBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._maxReceivedRate), CFSTR("CCMaxBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._bytesReceivedToReport), CFSTR("CCRawBytesReceived"));
    -[VCControlChannelMultiWay flushRealTimeReportingStats](self, "flushRealTimeReportingStats");
  }
}

- (void)registerPeriodicTask
{
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __48__VCControlChannelMultiWay_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)deregisterPeriodicTask
{
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingUnregisterPeriodicTask();
}

- (void)flushRealTimeReportingStats
{
  self->super._minSentRate = 0x7FFFFFFF;
  self->super._minReceivedRate = 0x7FFFFFFF;
  self->super._maxSentRate = 0;
  self->super._maxReceivedRate = 0;
  self->super._bytesSentToReport = 0;
  self->super._bytesReceivedToReport = 0;
}

- (void)flushReportingStats
{
  int *p_bytesSent;
  int *p_bytesReceived;

  p_bytesSent = &self->super._bytesSent;
  do
    __ldxr((unsigned int *)p_bytesSent);
  while (__stxr(0, (unsigned int *)p_bytesSent));
  p_bytesReceived = &self->super._bytesReceived;
  do
    __ldxr((unsigned int *)p_bytesReceived);
  while (__stxr(0, (unsigned int *)p_bytesReceived));
  self->super._lastProcessedBytesReceived = 0;
  self->super._lastProcessedBytesSent = 0;
  -[VCControlChannelMultiWay flushRealTimeReportingStats](self, "flushRealTimeReportingStats");
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (void)setTransportSessionID:(unsigned int)a3
{
  self->_transportSessionID = a3;
}

- (int)vfdMessage
{
  return self->_vfdMessage;
}

- (void)setVfdMessage:(int)a3
{
  self->_vfdMessage = a3;
}

- (int)vfdCancel
{
  return self->_vfdCancel;
}

- (void)setVfdCancel:(int)a3
{
  self->_vfdCancel = a3;
}

- (NSMutableDictionary)dialogs
{
  return self->_dialogs;
}

- (BOOL)isEncryptionEnabled
{
  return self->_isEncryptionEnabled;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)initWithTransportSessionID:reportingAgent:mode:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v4 = 188;
  v5 = v0;
  v6 = -1;
  v7 = v0;
  v8 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not create VTP socket for MW control channel (%08X) for sessionID '%d'", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

void __33__VCControlChannelMultiWay_start__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create receiveProc for MW control channel for sessionID='%d'", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d inData must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d vpktFlags must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d channelDataFormat must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Raw data header must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create payloadData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay: receiveProc unrecognized version of control channel messaging protocol '%d'. Ignoring the message...", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay: receiveProc unrecognized packet type '%d' received", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)messageReceived:participantInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create dialog for unknown participantID='%@'");
  OUTLINED_FUNCTION_3();
}

- (void)copyDialogForParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendMessage: could not find existing dialog for participantID='%@'");
  OUTLINED_FUNCTION_3();
}

- (void)copyDialogForParticipantID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d sendMessage: found existing dialog for participantID='%@'");
  OUTLINED_FUNCTION_3();
}

- (void)sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
  OUTLINED_FUNCTION_4();
  LODWORD(v4) = 413;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create dialog for unknown participantID='%llu'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d completion should not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 468;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d Could not create dialog for unknown participantID='%llu'", v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addActiveParticipant:participantUUID:withConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d participantConfig must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)lastUsedMKIBytes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d currentSendMKI is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

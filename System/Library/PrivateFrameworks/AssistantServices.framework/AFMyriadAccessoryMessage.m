@implementation AFMyriadAccessoryMessage

- (void)_copyRawBytesFromSource:(const void *)a3 toDest:(void *)a4 length:(unint64_t)a5
{
  memcpy(a4, a3, a5);
}

- (void)_initializeMessageObj:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  myrAccessoryMessage *p_message;
  AFMyriadAccessoryMessage *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned __int8 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_serializedProtocol = 1;
  if (v4)
  {
    if (objc_msgSend(v4, "length"))
    {
      v14 = 0;
      objc_msgSend(v5, "getBytes:range:", &v14, 0, 1);
      if (v14)
      {
        v6 = objc_msgSend(v5, "length");
        v7 = v6;
        v8 = v14;
        if (v14 && v6 >= 0x30)
        {
          v9 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
          p_message = &self->_message;
          v11 = self;
          v12 = 48;
        }
        else
        {
          if (v14 || v6 > 0x2F)
          {
            self->_isSane = 0;
            v13 = AFSiriLogContextMyriad;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v16 = "-[AFMyriadAccessoryMessage _initializeMessageObj:]";
              v17 = 1024;
              v18 = v8;
              v19 = 2048;
              v20 = v7;
              _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s Wedged message received with version: %hhu and message length: %zu", buf, 0x1Cu);
            }
            goto LABEL_13;
          }
          v9 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
          p_message = &self->_message;
          v11 = self;
          v12 = v7;
        }
        -[AFMyriadAccessoryMessage _copyRawBytesFromSource:toDest:length:](v11, "_copyRawBytesFromSource:toDest:length:", v9, p_message, v12);
        self->_isSane = 1;
LABEL_13:
        -[AFMyriadAccessoryMessage _initWithMessage:](self, "_initWithMessage:", &self->_message);
      }
    }
  }

}

- (void)_initializeMessageObjFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUUID *v13;
  id v14;
  NSObject *v15;
  NSUUID *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  NSUUID *accessoryId;
  myrAccessoryMessage *p_message;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  NSUUID *v31;
  __int16 v32;
  NSUUID *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AFMyriadAccessoryMessage acknowledgeRequestKey](AFMyriadAccessoryMessage, "acknowledgeRequestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AFMyriadAccessoryMessage sessionIdKey](AFMyriadAccessoryMessage, "sessionIdKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  +[AFMyriadAccessoryMessage requestTypeKey](AFMyriadAccessoryMessage, "requestTypeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[AFMyriadAccessoryMessage messageKey](AFMyriadAccessoryMessage, "messageKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFMyriadAccessoryMessage _initializeMessageObj:](self, "_initializeMessageObj:", v12);
      goto LABEL_31;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      v14 = v10;
      self->_serializedProtocol = 0;
      self->_message.requestType = objc_msgSend(v14, "unsignedLongValue");
      self->_message.session = -[NSUUID unsignedLongValue](v13, "unsignedLongValue");
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v6, "unsignedIntValue"))
          {
            self->_message.ack = 1;
            self->_isSane = 1;
LABEL_30:

            goto LABEL_31;
          }
        }
      }
      if (v14)
      {
        v17 = objc_msgSend(v14, "intValue");
        switch(v17)
        {
          case 10:
            p_message = &self->_message;
            self->_isSane = 1;
            +[AFMyriadAccessoryMessage electionDecisionKey](AFMyriadAccessoryMessage, "electionDecisionKey");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              v21 = objc_msgSend(v20, "unsignedIntValue");
            else
              v21 = 0;
            self->_message.electionDecision = v21;
            break;
          case 9:
            p_message = &self->_message;
            self->_isSane = 1;
            +[AFMyriadAccessoryMessage emergencyHandledKey](AFMyriadAccessoryMessage, "emergencyHandledKey");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              v23 = objc_msgSend(v20, "unsignedIntValue");
            else
              v23 = 0;
            self->_message.emergencyHandled = v23;
            break;
          case 8:
            self->_isSane = 1;
            -[AFMyriadAccessoryMessage _initWithMessage:](self, "_initWithMessage:", &self->_message);
            goto LABEL_30;
          default:
            goto LABEL_18;
        }
        -[AFMyriadAccessoryMessage _initWithMessage:](self, "_initWithMessage:", p_message);

        goto LABEL_30;
      }
LABEL_18:
      v18 = AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEBUG))
      {
        accessoryId = self->_accessoryId;
        *(_DWORD *)buf = 136315650;
        v27 = "-[AFMyriadAccessoryMessage _initializeMessageObjFromDictionary:]";
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = accessoryId;
        _os_log_debug_impl(&dword_19AF50000, v18, OS_LOG_TYPE_DEBUG, "%s Unknown request type %@ for accessory id: %@, Ignoring.", buf, 0x20u);
      }
      self->_isSane = 0;
      goto LABEL_30;
    }
  }
  v15 = AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
  {
    v16 = self->_accessoryId;
    *(_DWORD *)buf = 136315906;
    v27 = "-[AFMyriadAccessoryMessage _initializeMessageObjFromDictionary:]";
    v28 = 2112;
    v29 = v4;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s Received a payload %@ with session id %@ for accessory id: %@, Ignoring.", buf, 0x2Au);
  }
  self->_isSane = 0;
LABEL_31:

}

- (void)_initWithMessage:(const myrAccessoryMessage *)a3
{
  if (a3)
  {
    self->_version = a3->version;
    self->_requestType = a3->requestType;
    self->_session = a3->session;
    self->_voiceTriggerEndTime = a3->voiceTriggerEndTime;
    self->_audioHash = a3->audioHash;
    self->_goodnessScore = a3->goodnessScore;
    self->_userConfidenceScore = a3->userConfidenceScore;
    self->_tieBreaker = a3->tieBreaker;
    self->_deviceClass = a3->deviceClass;
    self->_deviceGroup = a3->deviceGroup;
    self->_productType = a3->productType;
    self->_electionDecision = a3->electionDecision;
    self->_emergencyHandled = a3->emergencyHandled;
    self->_ack = a3->ack;
  }
}

- (AFMyriadAccessoryMessage)initWithRequestType:(unint64_t)a3 session:(unint64_t)a4 voiceTriggerEndTime:(double)a5 audioHash:(unsigned __int16)a6 goodnessScore:(unsigned __int8)a7 userConfidenceScore:(unsigned __int8)a8 tieBreaker:(unsigned __int8)a9 deviceClass:(unsigned __int8)a10 deviceGroup:(unsigned __int8)a11 productType:(unsigned __int8)a12 electionDecision:(unsigned __int8)a13 emergencyHandled:(unsigned __int8)a14 ack:(unsigned __int8)a15 accessoryId:(id)a16
{
  id v24;
  char *v25;
  char *v26;
  objc_super v28;

  v24 = a16;
  v28.receiver = self;
  v28.super_class = (Class)AFMyriadAccessoryMessage;
  v25 = -[AFMyriadAccessoryMessage init](&v28, sel_init);
  v26 = v25;
  if (v25)
  {
    *(_OWORD *)(v25 + 9) = 0u;
    *(_OWORD *)(v25 + 25) = 0u;
    *(_OWORD *)(v25 + 40) = 0u;
    v25[8] = 1;
    *((_QWORD *)v25 + 2) = a3;
    *((_QWORD *)v25 + 3) = a4;
    *((double *)v25 + 4) = a5;
    *((_WORD *)v25 + 20) = a6;
    v25[42] = a7;
    v25[43] = a8;
    v25[44] = a9;
    v25[45] = a10;
    v25[46] = a11;
    v25[47] = a12;
    v25[48] = a13;
    v25[49] = a14;
    v25[50] = a15;
    objc_storeStrong((id *)v25 + 12, a16);
    *((_WORD *)v26 + 33) = 257;
    objc_msgSend(v26, "_initWithMessage:", v26 + 8);
  }

  return (AFMyriadAccessoryMessage *)v26;
}

- (id)initPreheatMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4
{
  id v7;
  char *v8;
  _WORD *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = -[AFMyriadAccessoryMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 9) = 0u;
    *(_OWORD *)(v8 + 25) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    v8[8] = 1;
    *((_QWORD *)v8 + 2) = 6;
    *((_QWORD *)v8 + 3) = a3;
    objc_storeStrong((id *)v8 + 12, a4);
    v9[33] = 257;
    objc_msgSend(v9, "_initWithMessage:", v9 + 4);
  }

  return v9;
}

- (id)initElectionDecisionMessageWithSessionId:(unint64_t)a3 decision:(BOOL)a4 accessoryId:(id)a5
{
  id v9;
  char *v10;
  _WORD *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AFMyriadAccessoryMessage;
  v10 = -[AFMyriadAccessoryMessage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    *(_OWORD *)(v10 + 9) = 0u;
    *(_OWORD *)(v10 + 25) = 0u;
    v10[8] = 1;
    *(_OWORD *)(v10 + 40) = 0u;
    *((_QWORD *)v10 + 2) = 10;
    *((_QWORD *)v10 + 3) = a3;
    v10[48] = a4;
    objc_storeStrong((id *)v10 + 12, a5);
    v11[33] = 257;
    objc_msgSend(v11, "_initWithMessage:", v11 + 4);
  }

  return v11;
}

- (id)initResetMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4
{
  id v7;
  char *v8;
  _WORD *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = -[AFMyriadAccessoryMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 9) = 0u;
    *(_OWORD *)(v8 + 25) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    v8[8] = 1;
    *((_QWORD *)v8 + 2) = 1;
    *((_QWORD *)v8 + 3) = a3;
    objc_storeStrong((id *)v8 + 12, a4);
    v9[33] = 257;
    objc_msgSend(v9, "_initWithMessage:", v9 + 4);
  }

  return v9;
}

- (AFMyriadAccessoryMessage)initWithAccessoryMessage:(id)a3 accessoryId:(id)a4
{
  id v6;
  id v7;
  AFMyriadAccessoryMessage *v8;
  AFMyriadAccessoryMessage *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = -[AFMyriadAccessoryMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryId, a4);
    *(_OWORD *)&v9->_message.audioHash = 0u;
    *(_OWORD *)&v9->_message.session = 0u;
    *(_OWORD *)&v9->_message.version = 0u;
    -[AFMyriadAccessoryMessage _initializeMessageObj:](v9, "_initializeMessageObj:", v6);
  }

  return v9;
}

- (AFMyriadAccessoryMessage)initWithAccessoryMessageAsDictionary:(id)a3 accessoryId:(id)a4
{
  id v6;
  id v7;
  AFMyriadAccessoryMessage *v8;
  AFMyriadAccessoryMessage *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = -[AFMyriadAccessoryMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryId, a4);
    *(_OWORD *)&v9->_message.audioHash = 0u;
    *(_OWORD *)&v9->_message.session = 0u;
    *(_OWORD *)&v9->_message.version = 0u;
    -[AFMyriadAccessoryMessage _initializeMessageObjFromDictionary:](v9, "_initializeMessageObjFromDictionary:", v6);
  }

  return v9;
}

- (id)messageAsData
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v3, "appendBytes:length:", &self->_message, 48);
  return v3;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  unint64_t requestType;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int ack;
  void *v26;
  _QWORD v27[16];
  _QWORD v28[18];

  v28[16] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("iSane");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSane);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  v27[1] = CFSTR("ACK");
  ack = self->_message.ack;
  if (self->_message.ack)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1 (ACKNOWLEDGEMENT)"));
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("0");
  }
  v18 = (__CFString *)v3;
  v28[1] = v3;
  v27[2] = CFSTR("usesSerializedProtocol");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_serializedProtocol);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v24;
  v27[3] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.version);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v23;
  v27[4] = CFSTR("RequestType");
  v4 = (void *)MEMORY[0x1E0CB3940];
  requestType = self->_message.requestType;
  +[AFMyriadAccessoryMessage myriadRequestTypeAsString:](AFMyriadAccessoryMessage, "myriadRequestTypeAsString:", requestType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%llu (%@)"), requestType, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v21;
  v27[5] = CFSTR("Session");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_message.session);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v20;
  v27[6] = CFSTR("VoiceTrigger endtime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_message.voiceTriggerEndTime);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v19;
  v27[7] = CFSTR("AudioHash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hash=%#04x"), self->_message.audioHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v6;
  v27[8] = CFSTR("GoodnessScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.goodnessScore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v7;
  v27[9] = CFSTR("UserConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.userConfidenceScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v8;
  v27[10] = CFSTR("TieBreaker");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.tieBreaker);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v9;
  v27[11] = CFSTR("DeviceClass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.deviceClass);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v10;
  v27[12] = CFSTR("DeviceGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.deviceGroup);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v11;
  v27[13] = CFSTR("ProductType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.productType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[13] = v12;
  v27[14] = CFSTR("ElectionDecision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.electionDecision);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[14] = v13;
  v27[15] = CFSTR("EmergencyHandled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_message.emergencyHandled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[15] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (ack)
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)session
{
  return self->_session;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (unsigned)audioHash
{
  return self->_audioHash;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)userConfidenceScore
{
  return self->_userConfidenceScore;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)electionWon
{
  return self->_electionDecision;
}

- (unsigned)isEmergencyHandled
{
  return self->_emergencyHandled;
}

- (unsigned)isAcknowledgement
{
  return self->_ack;
}

- (NSUUID)accessoryId
{
  return self->_accessoryId;
}

- (BOOL)isSane
{
  return self->_isSane;
}

- (BOOL)usesSerializedProtocol
{
  return self->_serializedProtocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryId, 0);
}

+ (id)protocolName
{
  return CFSTR("com.apple.deviceArbitration");
}

+ (id)acknowledgeRequestKey
{
  return CFSTR("ack");
}

+ (id)audioDataKey
{
  return CFSTR("aData");
}

+ (id)deviceInfoKey
{
  return CFSTR("dInfo");
}

+ (id)electionDecisionKey
{
  return CFSTR("eDecision");
}

+ (id)emergencyHandledKey
{
  return CFSTR("emergencyHandled");
}

+ (id)sessionIdKey
{
  return CFSTR("sid");
}

+ (id)requestTypeKey
{
  return CFSTR("reqType");
}

+ (id)messageKey
{
  return CFSTR("message");
}

+ (BOOL)isMyriadRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[AFMyriadAccessoryMessage acknowledgeRequestKey](AFMyriadAccessoryMessage, "acknowledgeRequestKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    +[AFMyriadAccessoryMessage requestTypeKey](AFMyriadAccessoryMessage, "requestTypeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = 1;
    }
    else
    {
      +[AFMyriadAccessoryMessage messageKey](AFMyriadAccessoryMessage, "messageKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10 != 0;

    }
  }

  return v6;
}

+ (id)myriadRequestTypeAsString:(unint64_t)a3
{
  if (a3 - 1 > 9)
    return CFSTR("myrRequestTypeUnknown");
  else
    return off_1E3A33018[a3 - 1];
}

@end

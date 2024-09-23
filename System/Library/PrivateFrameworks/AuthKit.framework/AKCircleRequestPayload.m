@implementation AKCircleRequestPayload

+ (id)payloadWithMessage:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 11, a3);
  objc_msgSend(v4, "userInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[12];
  v5[12] = (id)v6;

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("idmsdata"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v5[2];
  v5[2] = (id)v9;

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ec"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = (id)objc_msgSend(v12, "integerValue");

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("atxnid"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v5[6];
  v5[6] = (id)v14;

  objc_msgSend(v4, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("step"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5[13] = (id)objc_msgSend(v17, "integerValue");

  objc_msgSend(v4, "altDSID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v5[5];
  v5[5] = (id)v18;

  *((_BYTE *)v5 + 9) = objc_msgSend(v4, "piggybackingIDMSFallbackApproved");
  v20 = v5[13];
  if (v20 == (id)3)
  {
    *((_BYTE *)v5 + 8) = objc_msgSend(v4, "piggybackingPresenceMode") != 0;
    v5[8] = (id)objc_msgSend(v4, "piggybackingPresenceMode");
  }
  else
  {
    if (v20 == (id)2)
    {
      v21 = objc_msgSend(v4, "piggybackingAcceptorSupportsPresence");
      goto LABEL_7;
    }
    if (v20 == (id)1)
    {
      v21 = objc_msgSend(v4, "piggybackingRequestorUsesPresence");
LABEL_7:
      *((_BYTE *)v5 + 8) = v21;
      objc_msgSend(v4, "piggybackingRequestorPresenceSID");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v5[7];
      v5[7] = (id)v22;

    }
  }

  return v5;
}

+ (id)payloadWithResponseData:(id)a3 forCircleStep:(unint64_t)a4
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AKCircleRequestPayload *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUUID *presenceSID;

  +[AKCircleRequestPayload _dictionaryWithPlistData:](AKCircleRequestPayload, "_dictionaryWithPlistData:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:].cold.4((uint64_t)v5, v7);

    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cmd"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v18 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ec"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    v21 = objc_msgSend(v20, "integerValue");
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("txnid"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v22;
    else
      v7 = 0;

    if (v18 != 700 || !v7)
    {
      _AKLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:].cold.2((uint64_t)v5, v24, v27, v28, v29, v30, v31, v32);
      v17 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v24)
      {
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v24);
        v26 = v24;
        goto LABEL_26;
      }
    }
    else
    {

    }
    v25 = 0;
    v26 = 0;
    if (!v24)
    {
LABEL_30:
      v17 = objc_alloc_init(AKCircleRequestPayload);
      v17->_circleStep = a4;
      v17->_clientErrorCode = v21;
      objc_storeStrong((id *)&v17->_transactionId, v7);
      presenceSID = v17->_presenceSID;
      v17->_presenceSID = (NSUUID *)v25;

      v17->_URLResponse = 1;
LABEL_31:

      goto LABEL_32;
    }
LABEL_26:
    if (!v25)
    {
      _AKLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:].cold.3((uint64_t)v24, v33, v34, v35, v36, v37, v38, v39);

    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);
  v17 = 0;
LABEL_32:

  return v17;
}

+ (id)_dictionaryWithPlistData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if (v6)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v5;
      _os_log_error_impl(&dword_19202F000, v15, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Failed to parse plist (%@) from plist data (%@) with error (%@)", buf, 0x20u);
    }

    v7 = 0;
    goto LABEL_12;
  }
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[AKCircleRequestPayload _dictionaryWithPlistData:].cold.1(v5, v8, v9, v10, v11, v12, v13, v14);
  v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)isRequestingPayload
{
  return (self->_circleStep < 7) & (0x54u >> self->_circleStep);
}

- (BOOL)isAcceptingPayload
{
  return (self->_circleStep < 6) & self->_circleStep;
}

- (NSData)clientInfo
{
  void *v3;
  void *v4;
  NSData *v5;
  NSData *clientInfo;

  if (!self->_clientInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_responseInfo, "objectForKeyedSubscript:", CFSTR("pake"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_responseInfo, "objectForKeyedSubscript:", CFSTR("pake"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
      clientInfo = self->_clientInfo;
      self->_clientInfo = v5;

    }
  }
  return self->_clientInfo;
}

- (id)replyPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = (void *)objc_opt_new();
  -[AKCircleRequestPayload transactionId](self, "transactionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionId:", v4);

  -[AKCircleRequestPayload altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v5);

  -[AKCircleRequestPayload serverInfo](self, "serverInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServerInfo:", v6);

  v7 = -[AKCircleRequestPayload clientErrorCode](self, "clientErrorCode");
  v8 = -[AKCircleRequestPayload circleStep](self, "circleStep");
  if (v7)
    v9 = v8 - 2;
  else
    v9 = v8;
  objc_msgSend(v3, "setCircleStep:", v9);
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> transaction: %@, step: %ld, errorCode: %ld"), objc_opt_class(), self, self->_transactionId, self->_circleStep, self->_clientErrorCode);
}

- (AKCircleRequestPayload)initWithCoder:(id)a3
{
  id v4;
  AKCircleRequestPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *responseInfo;
  uint64_t v11;
  NSString *serverInfo;
  uint64_t v13;
  NSData *clientInfo;
  uint64_t v15;
  NSString *altDSID;
  uint64_t v17;
  NSString *transactionId;
  uint64_t v19;
  NSUUID *presenceSID;
  uint64_t v21;
  NSNumber *presenceCheckPassed;
  uint64_t v23;
  NSNumber *localPresenceFound;
  objc_super v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKCircleRequestPayload;
  v5 = -[AKCircleRequestPayload init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_responseInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    responseInfo = v5->_responseInfo;
    v5->_responseInfo = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    serverInfo = v5->_serverInfo;
    v5->_serverInfo = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v15 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionId"));
    v17 = objc_claimAutoreleasedReturnValue();
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v17;

    v5->_clientErrorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_clientErrorCode"));
    v5->_circleStep = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_circleStep"));
    v5->_supportsPresence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsPresence"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_presenceSID"));
    v19 = objc_claimAutoreleasedReturnValue();
    presenceSID = v5->_presenceSID;
    v5->_presenceSID = (NSUUID *)v19;

    v5->_presenceMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_presenceMode"));
    v5->_presenceFallbackApproved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_presenceFallbackApproved"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_presenceCheckPassed"));
    v21 = objc_claimAutoreleasedReturnValue();
    presenceCheckPassed = v5->_presenceCheckPassed;
    v5->_presenceCheckPassed = (NSNumber *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localPresenceFound"));
    v23 = objc_claimAutoreleasedReturnValue();
    localPresenceFound = v5->_localPresenceFound;
    v5->_localPresenceFound = (NSNumber *)v23;

    v5->_URLResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_URLResponse"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *responseInfo;
  id v5;

  responseInfo = self->_responseInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseInfo, CFSTR("_responseInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverInfo, CFSTR("_serverInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientInfo, CFSTR("_clientInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionId, CFSTR("_transactionId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_clientErrorCode, CFSTR("_clientErrorCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_circleStep, CFSTR("_circleStep"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsPresence, CFSTR("_supportsPresence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presenceSID, CFSTR("_presenceSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presenceMode, CFSTR("_presenceMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_presenceFallbackApproved, CFSTR("_presenceFallbackApproved"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presenceCheckPassed, CFSTR("_presenceCheckPassed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localPresenceFound, CFSTR("_localPresenceFound"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_URLResponse, CFSTR("_URLResponse"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serverInfo, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (int64_t)clientErrorCode
{
  return self->_clientErrorCode;
}

- (void)setClientErrorCode:(int64_t)a3
{
  self->_clientErrorCode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (BOOL)supportsPresence
{
  return self->_supportsPresence;
}

- (void)setSupportsPresence:(BOOL)a3
{
  self->_supportsPresence = a3;
}

- (NSUUID)presenceSID
{
  return self->_presenceSID;
}

- (void)setPresenceSID:(id)a3
{
  objc_storeStrong((id *)&self->_presenceSID, a3);
}

- (int64_t)presenceMode
{
  return self->_presenceMode;
}

- (void)setPresenceMode:(int64_t)a3
{
  self->_presenceMode = a3;
}

- (BOOL)presenceFallbackApproved
{
  return self->_presenceFallbackApproved;
}

- (void)setPresenceFallbackApproved:(BOOL)a3
{
  self->_presenceFallbackApproved = a3;
}

- (NSNumber)presenceCheckPassed
{
  return self->_presenceCheckPassed;
}

- (void)setPresenceCheckPassed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)localPresenceFound
{
  return self->_localPresenceFound;
}

- (void)setLocalPresenceFound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AKPushMessage)responseMessage
{
  return self->_responseMessage;
}

- (void)setResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_responseMessage, a3);
}

- (NSDictionary)responseInfo
{
  return self->_responseInfo;
}

- (void)setResponseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_responseInfo, a3);
}

- (unint64_t)circleStep
{
  return self->_circleStep;
}

- (void)setCircleStep:(unint64_t)a3
{
  self->_circleStep = a3;
}

- (unint64_t)piggybackingContext
{
  return self->_piggybackingContext;
}

- (void)setPiggybackingContext:(unint64_t)a3
{
  self->_piggybackingContext = a3;
}

- (BOOL)isURLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(BOOL)a3
{
  self->_URLResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseInfo, 0);
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_localPresenceFound, 0);
  objc_storeStrong((id *)&self->_presenceCheckPassed, 0);
  objc_storeStrong((id *)&self->_presenceSID, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_serverInfo, 0);
}

+ (void)payloadWithResponseData:(uint64_t)a3 forCircleStep:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "AKCircleRequestPayload: Unable to parse payload from invalid response", a5, a6, a7, a8, 0);
}

+ (void)payloadWithResponseData:(uint64_t)a3 forCircleStep:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "AKCircleRequestPayload: Unable to parse response dictionary (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)payloadWithResponseData:(uint64_t)a3 forCircleStep:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "AKCircleRequestPayload: Unable to parse presence SID (%@) as valid UUIDv4", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)payloadWithResponseData:(uint64_t)a1 forCircleStep:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "AKCircleRequestPayload: Processing parsed response dictionary (%@)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)_dictionaryWithPlistData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "AKCircleRequestPayload: Unable to parse plistData (nil)", a5, a6, a7, a8, 0);
}

@end

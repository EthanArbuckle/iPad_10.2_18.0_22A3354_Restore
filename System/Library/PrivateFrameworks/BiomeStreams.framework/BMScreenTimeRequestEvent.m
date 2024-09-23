@implementation BMScreenTimeRequestEvent

- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:].cold.2((uint64_t)v6, v11, v18, v19, v20, v21, v22, v23);
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:](self, "initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a7, a8, a9, a6, a10, a11, v12);
}

- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(BOOL)a12
{
  id v19;
  id v20;
  BMScreenTimeRequestEvent *v21;
  BMScreenTimeRequestEvent *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  BMScreenTimeRequestEvent *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BMScreenTimeRequestEvent *v41;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v45 = a8;
  v19 = a9;
  v44 = a10;
  v20 = a11;
  v47.receiver = self;
  v47.super_class = (Class)BMScreenTimeRequestEvent;
  v21 = -[BMEventBase init](&v47, sel_init);
  v22 = v21;
  if (!v21)
    goto LABEL_20;
  if ((a5 - 2) >= 2)
  {
    if (!a5)
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
      goto LABEL_8;
    }
  }
  else if (!-[BMScreenTimeRequestEvent validNonOptionalProperty:propertyName:](v21, "validNonOptionalProperty:propertyName:", v19, CFSTR("responderDSID")))
  {
    goto LABEL_21;
  }
  if (!-[BMScreenTimeRequestEvent validNonOptionalProperty:propertyName:](v22, "validNonOptionalProperty:propertyName:", v46, CFSTR("requestID"))|| !-[BMScreenTimeRequestEvent validNonOptionalProperty:propertyName:](v22, "validNonOptionalProperty:propertyName:", v45, CFSTR("requesterDSID")))
  {
    goto LABEL_21;
  }
  switch(a4)
  {
    case 0:
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:].cold.1(v23, v34, v35, v36, v37, v38, v39, v40);
LABEL_8:

      goto LABEL_21;
    case 1:
      v31 = CFSTR("websitePath");
      v32 = v22;
      v33 = v44;
LABEL_18:
      if (-[BMScreenTimeRequestEvent validNonOptionalProperty:propertyName:](v32, "validNonOptionalProperty:propertyName:", v33, v31))
      {
        break;
      }
LABEL_21:
      v41 = 0;
      goto LABEL_22;
    case 2:
      v31 = CFSTR("bundleID");
      v32 = v22;
      v33 = v20;
      goto LABEL_18;
  }
  objc_storeStrong((id *)&v22->_requestID, a3);
  v22->_kind = a4;
  v22->_status = a5;
  v22->_eventTime = a6;
  v22->_approvalTime = a7;
  objc_storeStrong((id *)&v22->_requesterDSID, a8);
  objc_storeStrong((id *)&v22->_responderDSID, a9);
  objc_storeStrong((id *)&v22->_websitePath, a10);
  objc_storeStrong((id *)&v22->_bundleID, a11);
  v22->_isActionUserDevice = a12;
LABEL_20:
  v41 = v22;
LABEL_22:

  return v41;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMScreenTimeRequestEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMScreenTimeRequestEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMScreenTimeRequestEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBScreenTimeRequestEvent *v5;
  BMScreenTimeRequestEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBScreenTimeRequestEvent initWithData:]([BMPBScreenTimeRequestEvent alloc], "initWithData:", v4);

    self = -[BMScreenTimeRequestEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMScreenTimeRequestEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BMScreenTimeRequestEvent *v19;
  NSObject *v20;
  uint64_t v22;
  unsigned int v23;

  v4 = a3;
  if (!v4)
  {
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BMScreenTimeRequestEvent initWithProto:].cold.1((uint64_t)self, v20);

    goto LABEL_16;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "status");
  if (v6 - 1 >= 3)
    v7 = 0;
  else
    v7 = v6;
  v23 = v7;
  v8 = objc_msgSend(v5, "kind");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2 * (v8 == 2);
  v10 = objc_msgSend(v5, "approvalTime");
  if (v10 - 1 >= 3)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(v5, "requestID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventTime");
  v14 = v13;
  objc_msgSend(v5, "requesterDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responderDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "websitePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_msgSend(v5, "isActionUserDevice");
  self = -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:](self, "initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:", v12, v9, v23, v11, v15, v16, v14, v17, v18, v22);

  v19 = self;
LABEL_17:

  return v19;
}

- (id)proto
{
  unsigned int status;
  uint64_t v4;
  int kind;
  unsigned int approvalTime;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  status = self->_status;
  if (status - 1 >= 3)
    v4 = 0;
  else
    v4 = status;
  kind = self->_kind;
  approvalTime = self->_approvalTime;
  if (approvalTime - 1 >= 3)
    v7 = 0;
  else
    v7 = approvalTime;
  if (kind == 1)
    v8 = 1;
  else
    v8 = 2 * (kind == 2);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRequestID:", self->_requestID);
  objc_msgSend(v9, "setKind:", v8);
  objc_msgSend(v9, "setStatus:", v4);
  objc_msgSend(v9, "setEventTime:", self->_eventTime);
  objc_msgSend(v9, "setApprovalTime:", v7);
  objc_msgSend(v9, "setRequesterDSID:", self->_requesterDSID);
  objc_msgSend(v9, "setResponderDSID:", self->_responderDSID);
  objc_msgSend(v9, "setWebsitePath:", self->_websitePath);
  objc_msgSend(v9, "setBundleID:", self->_bundleID);
  objc_msgSend(v9, "setIsActionUserDevice:", self->_isActionUserDevice);
  return v9;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_kind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kind"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_approvalTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("approvalTime"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requesterDSID, CFSTR("requesterDSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_responderDSID, CFSTR("responderDSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_websitePath, CFSTR("websitePath"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActionUserDevice);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isActionUserDevice"));

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMScreenTimeRequestEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMAskToBuyEvent json].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_requestID, "hash");
  return -[NSString hash](self->_requesterDSID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMScreenTimeRequestEvent eventTime](self, "eventTime");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longValue");

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "eventTime");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longValue");

    -[BMScreenTimeRequestEvent requestID](self, "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    LODWORD(v12) = -[BMScreenTimeRequestEvent status](self, "status");
    if ((_DWORD)v12 == objc_msgSend(v5, "status"))
      v15 = v14;
    else
      v15 = 0;
    v16 = -[BMScreenTimeRequestEvent kind](self, "kind");
    if (v16 == objc_msgSend(v5, "kind"))
      v17 = v15;
    else
      v17 = 0;
    if (v8 == v11)
      v18 = v17;
    else
      v18 = 0;
    v19 = -[BMScreenTimeRequestEvent approvalTime](self, "approvalTime");
    if (v19 == objc_msgSend(v5, "approvalTime"))
      v20 = v18;
    else
      v20 = 0;
    -[BMScreenTimeRequestEvent requesterDSID](self, "requesterDSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requesterDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20 & objc_msgSend(v21, "isEqualToString:", v22);

    -[BMScreenTimeRequestEvent responderDSID](self, "responderDSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

    }
    else
    {
      objc_msgSend(v5, "responderDSID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_19;
    }
    -[BMScreenTimeRequestEvent responderDSID](self, "responderDSID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responderDSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23 &= objc_msgSend(v27, "isEqualToString:", v28);

LABEL_19:
    -[BMScreenTimeRequestEvent websitePath](self, "websitePath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {

    }
    else
    {
      objc_msgSend(v5, "websitePath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_23;
    }
    -[BMScreenTimeRequestEvent websitePath](self, "websitePath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "websitePath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v23 &= objc_msgSend(v31, "isEqualToString:", v32);

LABEL_23:
    -[BMScreenTimeRequestEvent bundleID](self, "bundleID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {

    }
    else
    {
      objc_msgSend(v5, "bundleID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
LABEL_27:
        v37 = -[BMScreenTimeRequestEvent isActionUserDevice](self, "isActionUserDevice");
        v25 = v23 & (v37 ^ objc_msgSend(v5, "isActionUserDevice") ^ 1);

        goto LABEL_28;
      }
    }
    -[BMScreenTimeRequestEvent bundleID](self, "bundleID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v23 &= objc_msgSend(v35, "isEqualToString:", v36);

    goto LABEL_27;
  }
  LOBYTE(v25) = 0;
LABEL_28:

  return v25;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(double)a3
{
  self->_eventTime = a3;
}

- (int)approvalTime
{
  return self->_approvalTime;
}

- (void)setApprovalTime:(int)a3
{
  self->_approvalTime = a3;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (void)setResponderDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (void)setWebsitePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  self->_isActionUserDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)initWithRequestID:(uint64_t)a3 kind:(uint64_t)a4 status:(uint64_t)a5 eventTime:(uint64_t)a6 approvalTime:(uint64_t)a7 requesterDSID:(uint64_t)a8 responderDSID:websitePath:bundleID:isActionUserDevice:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Invalid request kind", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRequestID:(uint64_t)a3 kind:(uint64_t)a4 status:(uint64_t)a5 eventTime:(uint64_t)a6 approvalTime:(uint64_t)a7 requesterDSID:(uint64_t)a8 responderDSID:websitePath:bundleID:isActionUserDevice:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Invalid request status", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMScreenTimeRequestEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBScreenTimeRequestEvent proto", (uint8_t *)&v5, 0xCu);

}

@end

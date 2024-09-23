@implementation DRSTaskingSystemMessage

+ (BOOL)isJSONDictForClass:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "messageType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_versionFromJSONDict:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("version"));
}

- (BOOL)_versionIsSupported:(id)a3
{
  return 0;
}

- (DRSTaskingSystemMessage)initWithJSONDict:(id)a3
{

  return 0;
}

+ (id)messageType
{
  return &stru_1EA3D37D0;
}

- (NSString)messageType
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "messageType");
}

- (id)_mutableJSONDictRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("version");
  -[DRSTaskingSystemMessage version](self, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = CFSTR("type");
  objc_msgSend((id)objc_opt_class(), "messageType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = kDRSTaskingSystemMessage_messageUUIDKey;
  -[DRSTaskingSystemMessage messageUUID](self, "messageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = kDRSTaskingSystemMessage_DateReceivedKey;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSTaskingSystemMessage dateReceived](self, "dateReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v9;
  v16[4] = kDRSTaskingSystemMessage_DateBroadcastKey;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSTaskingSystemMessage dateBroadcast](self, "dateBroadcast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  return v14;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[DRSTaskingSystemMessage jsonDictRepresentation](self, "jsonDictRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DRSTaskingSystemMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DRSTaskingSystemMessage *v15;
  id *p_isa;
  DRSTaskingSystemMessage *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    DPLogHandle_TaskingMessageError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v18))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v19 = "nil UUID";
LABEL_18:
    v20 = v18;
    v21 = 2;
    goto LABEL_19;
  }
  if (!v11)
  {
    DPLogHandle_TaskingMessageError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v18))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v19 = "nil version";
    goto LABEL_18;
  }
  if (!-[DRSTaskingSystemMessage _versionIsSupported:](self, "_versionIsSupported:", v11))
  {
    DPLogHandle_TaskingMessageError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      v19 = "Unsupported version %{public}@";
      v20 = v18;
      v21 = 12;
LABEL_19:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingSystemMessageFailedInit", v19, buf, v21);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!v13)
  {
    DPLogHandle_TaskingMessageError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      v19 = "nil dateBroadcast";
      goto LABEL_18;
    }
LABEL_20:

    v17 = 0;
    goto LABEL_21;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23.receiver = self;
  v23.super_class = (Class)DRSTaskingSystemMessage;
  v15 = -[DRSTaskingSystemMessage init](&v23, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 3, v14);
  }
  self = p_isa;
  v17 = self;
LABEL_21:

  return v17;
}

- (BOOL)_isEqualToMessage:(id)a3
{
  DRSTaskingSystemMessage *v4;
  DRSTaskingSystemMessage *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (DRSTaskingSystemMessage *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v18 = 1;
    goto LABEL_7;
  }
  -[DRSTaskingSystemMessage dateBroadcast](self, "dateBroadcast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  -[DRSTaskingSystemMessage dateBroadcast](v5, "dateBroadcast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  if (v8 != v11)
    goto LABEL_5;
  -[DRSTaskingSystemMessage dateReceived](self, "dateReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;
  -[DRSTaskingSystemMessage dateReceived](v5, "dateReceived");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = v16;

  if (v14 == v17)
  {
    -[DRSTaskingSystemMessage version](self, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingSystemMessage version](v5, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", v21))
    {
      -[DRSTaskingSystemMessage messageUUID](self, "messageUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTaskingSystemMessage messageUUID](v5, "messageUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v22, "isEqual:", v23);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
LABEL_5:
    v18 = 0;
  }
LABEL_7:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[DRSTaskingSystemMessage _isEqualToMessage:](self, "_isEqualToMessage:", v4);

  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateBroadcast
{
  return self->_dateBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBroadcast, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end

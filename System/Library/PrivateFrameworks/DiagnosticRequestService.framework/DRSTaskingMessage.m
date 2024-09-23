@implementation DRSTaskingMessage

- (BOOL)_versionIsSupported:(id)a3
{
  return objc_msgSend(CFSTR("1.0"), "isEqualToString:", a3);
}

+ (id)messageType
{
  return CFSTR("TaskingMessage");
}

- (DRSTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 teamTaskings:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  DRSTaskingMessage *v18;
  NSObject *v19;
  const char *v20;
  DRSTaskingMessage *v21;
  DRSTaskingMessage *v22;
  objc_super v24;
  _QWORD v25[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  char v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v13)
  {
    DPLogHandle_TaskingMessageError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v19))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v20 = "nil taskingMessageUUID";
LABEL_12:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingMessageFailedInit", v20, buf, 2u);
    goto LABEL_13;
  }
  if (!v16)
  {
    DPLogHandle_TaskingMessageError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v19))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v20 = "nil teamTaskings";
    goto LABEL_12;
  }
  if (!objc_msgSend(v16, "count"))
  {
    DPLogHandle_TaskingMessageError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      v20 = "Empty teamTaskings";
      goto LABEL_12;
    }
LABEL_13:

    v18 = 0;
    goto LABEL_18;
  }
  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x2020000000;
  v29 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__DRSTaskingMessage_initWithVersion_messageUUID_dateBroadcast_dateReceived_teamTaskings___block_invoke;
  v25[3] = &unk_1EA3D29A8;
  v25[4] = buf;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v25);
  if (v27[24])
  {
    v18 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)DRSTaskingMessage;
    v21 = -[DRSTaskingSystemMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:](&v24, sel_initWithVersion_messageUUID_dateBroadcast_dateReceived_, v12, v13, v14, v15);
    v22 = v21;
    if (v21)
      objc_storeStrong((id *)&v21->_teamTaskings, a7);
    self = v22;
    v18 = self;
  }
  _Block_object_dispose(buf, 8);
LABEL_18:

  return v18;
}

void __89__DRSTaskingMessage_initWithVersion_messageUUID_dateBroadcast_dateReceived_teamTaskings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "teamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    DPLogHandle_TaskingMessageError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v6, "teamID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingMessageFailedInit", "Malformed team tasking dict (key: %{public}@, value: %{public}@)", (uint8_t *)&v11, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (BOOL)_isEqualToMessage:(id)a3
{
  id v4;
  id v5;
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
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DRSTaskingMessage;
  if (-[DRSTaskingSystemMessage _isEqualToMessage:](&v22, sel__isEqualToMessage_, v4))
  {
    v5 = v4;
    -[DRSTaskingSystemMessage dateBroadcast](self, "dateBroadcast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    objc_msgSend(v5, "dateBroadcast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;

    if (v8 != v11)
      goto LABEL_4;
    -[DRSTaskingSystemMessage dateReceived](self, "dateReceived");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v5, "dateReceived");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;

    if (v14 == v17)
    {
      -[DRSTaskingMessage teamTaskings](self, "teamTaskings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "teamTaskings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "isEqualToDictionary:", v21);

    }
    else
    {
LABEL_4:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)jsonDictRepresentation
{
  void *v3;
  void *v4;
  id v5;
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
  objc_super v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTaskingMessage teamTaskings](self, "teamTaskings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__DRSTaskingMessage_jsonDictRepresentation__block_invoke;
  v18[3] = &unk_1EA3D29D0;
  v19 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);

  v20[0] = kDRSTaskingSystemMessage_messageUUIDKey;
  -[DRSTaskingSystemMessage messageUUID](self, "messageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v20[1] = kDRSTaskingSystemMessage_DateReceivedKey;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSTaskingSystemMessage dateReceived](self, "dateReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v20[2] = kDRSTaskingSystemMessage_DateBroadcastKey;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSTaskingSystemMessage dateBroadcast](self, "dateBroadcast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = kDRSTaskingMessage_TeamTaskingsKey;
  v21[2] = v13;
  v21[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)DRSTaskingMessage;
  -[DRSTaskingSystemMessage _mutableJSONDictRepresentation](&v17, sel__mutableJSONDictRepresentation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v14);

  return v15;
}

void __43__DRSTaskingMessage_jsonDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (DRSTaskingMessage)initWithJSONDict:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  DRSTaskingMessage *v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isJSONDictForClass:", v4) & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSTaskingSystemMessage_messageUUIDKey);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid taskingMessageUUID", buf, 2u);
      }
      v13 = 0;
      v6 = v5;
      goto LABEL_21;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);

    _dateFromJSONDict(v4, kDRSTaskingSystemMessage_DateReceivedKey);
    v7 = objc_claimAutoreleasedReturnValue();
    _dateFromJSONDict(v4, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSTaskingMessage_TeamTaskingsKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        v21 = buf;
        v22 = 0x2020000000;
        v23 = 0;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __38__DRSTaskingMessage_initWithJSONDict___block_invoke;
        v16[3] = &unk_1EA3D29F8;
        v19 = buf;
        v17 = v7;
        v11 = v10;
        v18 = v11;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
        v12 = v21[24];

        _Block_object_dispose(buf, 8);
        if (!v12)
          goto LABEL_15;
      }
      else
      {
        DPLogHandle_TaskingMessageError();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTaskingsDict", buf, 2u);
        }

        v11 = 0;
      }
      v13 = 0;
      goto LABEL_20;
    }
    v11 = 0;
LABEL_15:

    -[DRSTaskingSystemMessage _versionFromJSONDict:](self, "_versionFromJSONDict:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[DRSTaskingMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:teamTaskings:](self, "initWithVersion:messageUUID:dateBroadcast:dateReceived:teamTaskings:", v9, v6, v8, v7, v11);
    v13 = self;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  DPLogHandle_TaskingMessageError();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "JSON dictionary of wrong type", buf, 2u);
  }
  v13 = 0;
LABEL_22:

  return v13;
}

void __38__DRSTaskingMessage_initWithJSONDict___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  DRSTeamTasking *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[DRSTeamTasking initWithJSONDict:receivedDate:]([DRSTeamTasking alloc], "initWithJSONDict:receivedDate:", v8, *(_QWORD *)(a1 + 32));
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTasking value", v12, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
  else
  {
    DPLogHandle_TaskingMessageError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTaskingsDict class", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (NSDictionary)teamTaskings
{
  return self->_teamTaskings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamTaskings, 0);
}

@end

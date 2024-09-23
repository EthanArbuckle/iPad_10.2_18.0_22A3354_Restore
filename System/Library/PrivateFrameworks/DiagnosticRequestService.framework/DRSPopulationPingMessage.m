@implementation DRSPopulationPingMessage

- (BOOL)_versionIsSupported:(id)a3
{
  return objc_msgSend(CFSTR("1.0"), "isEqualToString:", a3);
}

+ (id)messageType
{
  return CFSTR("PopulationPingMessage");
}

- (DRSPopulationPingMessage)initWithJSONDict:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  DRSPopulationPingMessage *v10;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isJSONDictForClass:", v4) & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSTaskingSystemMessage_messageUUIDKey);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);

      _dateFromJSONDict(v4, kDRSTaskingSystemMessage_DateReceivedKey);
      v7 = objc_claimAutoreleasedReturnValue();
      _dateFromJSONDict(v4, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTaskingSystemMessage _versionFromJSONDict:](self, "_versionFromJSONDict:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12.receiver = self;
      v12.super_class = (Class)DRSPopulationPingMessage;
      self = -[DRSTaskingSystemMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:](&v12, sel_initWithVersion_messageUUID_dateBroadcast_dateReceived_, v9, v6, v8, v7);

      v5 = v6;
      v10 = self;
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid pingUUID", buf, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    DPLogHandle_TaskingMessageError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PopulationPingJSONInitError", "JSON dictionary of wrong type", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (DRSPopulationPingMessage)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  DRSPopulationPingMessage *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = kDRSPopulationPingMessageCurrentVersion;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DRSTaskingSystemMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:](self, "initWithVersion:messageUUID:dateBroadcast:dateReceived:", v4, v5, v3, v3);

  return v6;
}

@end

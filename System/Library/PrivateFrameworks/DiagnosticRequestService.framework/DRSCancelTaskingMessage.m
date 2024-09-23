@implementation DRSCancelTaskingMessage

- (BOOL)_versionIsSupported:(id)a3
{
  return objc_msgSend((id)kDRSCancelTaskingMessageCurrentVersion, "isEqualToString:", a3);
}

+ (id)messageType
{
  return CFSTR("CancelTaskingMessage");
}

- (DRSCancelTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 perTeamCancelledConfigUUIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  DRSCancelTaskingMessage *v17;
  DRSCancelTaskingMessage *v18;
  DRSCancelTaskingMessage *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (_checkCancelNonNil((uint64_t)v12, (uint64_t)"version")
    && _checkCancelNonNil((uint64_t)v13, (uint64_t)"cancelTaskingUUID")
    && _checkCancelNonNil((uint64_t)v16, (uint64_t)"perTeamCancelledConfigUUIDs"))
  {
    v21.receiver = self;
    v21.super_class = (Class)DRSCancelTaskingMessage;
    v17 = -[DRSTaskingSystemMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:](&v21, sel_initWithVersion_messageUUID_dateBroadcast_dateReceived_, v12, v13, v14, v15);
    v18 = v17;
    if (v17)
      objc_storeStrong((id *)&v17->_perTeamCancelledConfigUUIDs, a7);
    self = v18;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_isEqualToMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSCancelTaskingMessage;
  if (-[DRSTaskingSystemMessage _isEqualToMessage:](&v10, sel__isEqualToMessage_, v4))
  {
    v5 = v4;
    -[DRSCancelTaskingMessage perTeamCancelledConfigUUIDs](self, "perTeamCancelledConfigUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "perTeamCancelledConfigUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonDictRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSCancelTaskingMessage perTeamCancelledConfigUUIDs](self, "perTeamCancelledConfigUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__DRSCancelTaskingMessage_jsonDictRepresentation__block_invoke;
  v10[3] = &unk_1EA3D2A20;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v12 = kDRSCancelTaskingMessage_perTeamCancelledConfigUUIDsKey;
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DRSCancelTaskingMessage;
  -[DRSTaskingSystemMessage _mutableJSONDictRepresentation](&v9, sel__mutableJSONDictRepresentation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  return v7;
}

void __49__DRSCancelTaskingMessage_jsonDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "UUIDString", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
}

- (DRSCancelTaskingMessage)initWithJSONDict:(id)a3
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
  DRSCancelTaskingMessage *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

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
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid cancelTaskingUUID", buf, 2u);
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
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSCancelTaskingMessage_perTeamCancelledConfigUUIDsKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        v20 = buf;
        v21 = 0x2020000000;
        v22 = 0;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __44__DRSCancelTaskingMessage_initWithJSONDict___block_invoke;
        v16[3] = &unk_1EA3D2A48;
        v18 = buf;
        v11 = v10;
        v17 = v11;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
        v12 = v20[24];

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
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid perTeamCancelledUUIDStringsDict", buf, 2u);
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
    self = -[DRSCancelTaskingMessage initWithVersion:messageUUID:dateBroadcast:dateReceived:perTeamCancelledConfigUUIDs:](self, "initWithVersion:messageUUID:dateBroadcast:dateReceived:perTeamCancelledConfigUUIDs:", v9, v6, v8, v7, v11);
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
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "JSON dictionary of wrong type", buf, 2u);
  }
  v13 = 0;
LABEL_22:

  return v13;
}

void __44__DRSCancelTaskingMessage_initWithJSONDict___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v23 = a1;
      v24 = v7;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
        if (!v16)
        {
          DPLogHandle_TaskingMessageError();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v19))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v15;
            v20 = "Invalid UUID string (%{public}@)";
            v21 = v19;
            v22 = 12;
LABEL_19:
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", v20, buf, v22);
          }
          goto LABEL_20;
        }
        v17 = (void *)v16;
        objc_msgSend(v9, "addObject:", v16);

        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          a1 = v23;
          v7 = v24;
          if (v12)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      DPLogHandle_TaskingMessageError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        v20 = "Invalid UUID string class";
        v21 = v19;
        v22 = 2;
        goto LABEL_19;
      }
LABEL_20:
      v7 = v24;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v23 + 40) + 8) + 24) = 1;
      *a4 = 1;

      goto LABEL_21;
    }
LABEL_11:

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
LABEL_21:

  }
  else
  {
    DPLogHandle_TaskingMessageError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid perTeamCancelledUUIDStringsDict class", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (NSDictionary)perTeamCancelledConfigUUIDs
{
  return self->_perTeamCancelledConfigUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perTeamCancelledConfigUUIDs, 0);
}

@end

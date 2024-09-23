@implementation IMDDatabaseClient

- (id)loadRecoverableMessagesMetadataGroupedByChatGUID
{
  xpc_object_t empty;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = sub_1ABBBDE1C;
    v11 = sub_1ABBBDE2C;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABB69C34;
    v6[3] = &unk_1E5AB1D30;
    v6[4] = self;
    v6[5] = &v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 161, v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  xpc_object_t v15;
  _QWORD v16[5];
  id v17;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = xpc_dictionary_create(0, 0, 0);
  if (v15)
  {
    if (v12)
      IMInsertCodableObjectsToXPCDictionary();
    xpc_dictionary_set_BOOL(v15, "ascending", a4);
    if (v13)
      IMInsertCodableObjectsToXPCDictionary();
    xpc_dictionary_set_int64(v15, "limit", a6);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1ABB69F44;
    v16[3] = &unk_1E5AB1D08;
    v16[4] = self;
    v17 = v14;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v15, 147, v16);

  }
}

- (void)_sendSyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  void (**v7)(void);
  id v8;

  v7 = (void (**)(void))a5;
  v8 = a3;
  xpc_dictionary_set_int64(v8, "__xpc__event_code__", a4);
  __XPCIMDMessageStoreSendXPCMessage(v8, v7, 0);

}

- (void)_sendAsyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  void (**v7)(void);
  id v8;

  v7 = (void (**)(void))a5;
  v8 = a3;
  xpc_dictionary_set_int64(v8, "__xpc__event_code__", a4);
  __XPCIMDMessageStoreSendXPCMessage(v8, v7, 1);

}

- (id)chatRecordsFilteredByPredicate:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1ABBBDE1C;
  v16 = sub_1ABBBDE2C;
  v17 = 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      v9 = v4;
      v10 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBDE34;
    v11[3] = &unk_1E5AB1D30;
    v11[4] = self;
    v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 145, v11, v9, v10);
  }
  v6 = (void *)v13[5];
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10)
      IMInsertCodableObjectsToXPCDictionary();
    if (v11)
    {
      -[IMDDatabaseLegacyXPCBridge _xpcArrayWithCodableObjects:](self, "_xpcArrayWithCodableObjects:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);

    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1ABBBDFDC;
    v15[3] = &unk_1E5AB1D08;
    v15[4] = self;
    v16 = v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v13, 146, v15);

  }
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  -[IMDDatabaseClient fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:completionHandler:](self, "fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:completionHandler:", a3, a4, 0, a5, a6);
}

- (id)chatRecordsWithIdentifier:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1ABBBDE1C;
  v16 = sub_1ABBBDE2C;
  v17 = 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      v9 = v4;
      v10 = 0;
      IMInsertNSStringsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBE1A8;
    v11[3] = &unk_1E5AB1D30;
    v11[4] = self;
    v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 148, v11, v9, v10);
  }
  v6 = (void *)v13[5];
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchChatRecordsWithPinningIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    if (v6)
      IMInsertNSStringsToXPCDictionary();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBBE2E8;
    v9[3] = &unk_1E5AB1D08;
    v9[4] = self;
    v10 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 150, v9);

  }
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  return -[IMDDatabaseClient chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:](self, "chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:", a3, a4, a5, a6, a7, 0);
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8
{
  _BOOL4 v8;
  unsigned int v9;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1ABBBDE1C;
  v27 = sub_1ABBBDE2C;
  v28 = 0;
  v18 = xpc_dictionary_create(0, 0, 0);
  if (v18)
  {
    if (v14)
      IMInsertArraysToXPCDictionary();
    if (v15)
      IMInsertNSStringsToXPCDictionary();
    if (v16)
      IMInsertNSStringsToXPCDictionary();
    if (v17)
      IMInsertNSStringsToXPCDictionary();
    if (v8)
      IMInsertBoolsToXPCDictionary();
    xpc_dictionary_set_int64(v18, "style", v9);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1ABBBE56C;
    v22[3] = &unk_1E5AB1D30;
    v22[4] = self;
    v22[5] = &v23;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v18, 143, v22);
  }
  v19 = (void *)v24[5];
  if (!v19)
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  _Block_object_dispose(&v23, 8);
  return v20;
}

- (void)fetchChatRecordsWithAtLeastHandles:(id)a3 serviceName:(id)a4 style:(unsigned __int8)a5 completionHandler:(id)a6
{
  unsigned int v7;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10)
      IMInsertArraysToXPCDictionary();
    if (v11)
      IMInsertNSStringsToXPCDictionary();
    xpc_dictionary_set_int64(v13, "style", v7);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABBBE6F4;
    v14[3] = &unk_1E5AB1D08;
    v14[4] = self;
    v15 = v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v13, 144, v14);

  }
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_1ABBBDE1C;
  v12[4] = sub_1ABBBDE2C;
  v13 = 0;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    if (v6)
      IMInsertArraysToXPCDictionary();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBBE8B0;
    v9[3] = &unk_1E5AB7AE8;
    v11 = v12;
    v9[4] = self;
    v10 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 154, v9);

  }
  _Block_object_dispose(v12, 8);

}

- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3
{
  xpc_object_t empty;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1ABBBDE1C;
  v14 = sub_1ABBBDE2C;
  v15 = 0;
  empty = xpc_dictionary_create_empty();
  v6 = empty;
  if (empty)
  {
    xpc_dictionary_set_int64(empty, "limit", a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBBEA54;
    v9[3] = &unk_1E5AB1D30;
    v9[4] = self;
    v9[5] = &v10;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v6, 153, v9);
  }
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)resolveInconsistentGUIDForChatRecordWithGUID:(id)a3 newGUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t empty;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8)
      IMInsertNSStringsToXPCDictionary();
    if (v9)
      IMInsertNSStringsToXPCDictionary();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1ABBBEBB4;
    v12[3] = &unk_1E5AB7B10;
    v13 = v10;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 155, v12);

  }
}

- (void)fetchLastMessageRecordForChatRecordWithRowID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  xpc_object_t empty;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  empty = xpc_dictionary_create_empty();
  v8 = empty;
  if (empty)
  {
    xpc_dictionary_set_int64(empty, "chatRowID", a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBBECB4;
    v9[3] = &unk_1E5AB1D08;
    v9[4] = self;
    v10 = v6;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 48, v9);

  }
}

- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t empty;
  void *v19;
  _QWORD v20[5];
  id v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v14)
      IMInsertNSStringsToXPCDictionary();
    if (v15)
      IMInsertCodableObjectsToXPCDictionary();
    if (v16)
    {
      -[IMDDatabaseLegacyXPCBridge _xpcArrayWithCodableObjects:](self, "_xpcArrayWithCodableObjects:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(empty, "sortDescriptors", v19);

    }
    xpc_dictionary_set_int64(empty, "limit", a7);
    xpc_dictionary_set_BOOL(empty, "parentedOnly", a6);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1ABBBEEC0;
    v20[3] = &unk_1E5AB1D08;
    v20[4] = self;
    v21 = v17;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 59, v20);

  }
}

- (void)fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  xpc_object_t empty;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  v9 = a5;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8)
      IMInsertCodableObjectsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBF034;
    v11[3] = &unk_1E5AB1D08;
    v11[4] = self;
    v12 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 85, v11, a4, 0);

  }
}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 parentedOnly:(BOOL)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchMessageRecordWithGUID:(id)a3 excludeRecoverableMessages:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  xpc_object_t empty;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  empty = xpc_dictionary_create_empty();
  v11 = empty;
  if (v9 && v8 && empty)
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABBBF2AC;
    v14[3] = &unk_1E5AB1D08;
    v14[4] = self;
    v15 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v11, 60, v14, v6, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = _Block_copy(v9);
      *(_DWORD *)buf = 138412802;
      v17 = v11;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "IMDDatabaseClient | One or more invalid required parameters: xpc_object_t message: %@, messageGUID: %@, completionHandler: %@", buf, 0x20u);

    }
  }

}

- (void)updateAttachmentSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  xpc_object_t v6;
  id v7;

  v7 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7)
      IMInsertNSStringsToXPCDictionary();
    xpc_dictionary_set_BOOL(v6, "shouldHideFromSyndication", a4);
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v6, 225, &unk_1E5AAF1A8);
  }

}

- (void)updateMessageSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  xpc_object_t v6;
  id v7;

  v7 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7)
      IMInsertNSStringsToXPCDictionary();
    xpc_dictionary_set_BOOL(v6, "shouldHideFromSyndication", a4);
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 235, &unk_1E5AAE918);
  }

}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t empty;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  empty = xpc_dictionary_create_empty();
  v15 = empty;
  if (v12 && v11 && v10 && empty)
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    v17 = v12;
    IMInsertNSStringsToXPCDictionary();
    if (v13)
    {
      v17 = v13;
      IMInsertNSStringsToXPCDictionary();
    }
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v15, 234, &unk_1E5AB7B30, v17, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v19 = v15;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Not sending XPC message for SharePlay notification because message (%@), chatGUID (%@), faceTimeConversationUUID (%@), or handleIdentifier (%@) were nil", buf, 0x2Au);
    }

  }
}

- (void)notifyFirstUnlockComplete
{
  id v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v3, 241, &unk_1E5AAEC08);

}

- (id)handleRecordsFilteredByPredicate:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1ABBBDE1C;
  v16 = sub_1ABBBDE2C;
  v17 = 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      v9 = v4;
      v10 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBF878;
    v11[3] = &unk_1E5AB1D30;
    v11[4] = self;
    v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 245, v11, v9, v10);
  }
  v6 = (void *)v13[5];
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchHandleRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10)
      IMInsertCodableObjectsToXPCDictionary();
    if (v11)
    {
      -[IMDDatabaseLegacyXPCBridge _xpcArrayWithCodableObjects:](self, "_xpcArrayWithCodableObjects:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);

    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1ABBBFA20;
    v15[3] = &unk_1E5AB1D08;
    v15[4] = self;
    v16 = v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v13, 246, v15);

  }
}

- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4
{
  xpc_object_t v6;
  id v7;

  v7 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7)
      IMInsertArraysToXPCDictionary();
    xpc_dictionary_set_int64(v6, "reason", a4);
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 134, &unk_1E5AAE698);
  }

}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  xpc_object_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    if (v7)
    {
      v5 = v7;
      v6 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v4, 32, &unk_1E5AAE6B8, v5, v6);
  }

}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  v9 = a5;
  v10 = xpc_dictionary_create(0, 0, 0);
  if (v10)
  {
    if (v8)
      IMInsertCodableObjectsToXPCDictionary();
    xpc_dictionary_set_int64(v10, "limit", a4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBFCCC;
    v11[3] = &unk_1E5AB1D08;
    v11[4] = self;
    v12 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v10, 33, v11);

  }
}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10)
      IMInsertCodableObjectsToXPCDictionary();
    if (v11)
    {
      -[IMDDatabaseLegacyXPCBridge _xpcArrayWithCodableObjects:](self, "_xpcArrayWithCodableObjects:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);

    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1ABBBFE90;
    v15[3] = &unk_1E5AB1D08;
    v15[4] = self;
    v16 = v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v13, 34, v15);

  }
}

- (void)fetchDataForKey:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (*v8[4])(void);
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  v6 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1ABBBDE1C;
  v11[4] = sub_1ABBBDE2C;
  v12 = 0;
  v8[0] = (void (*)(void))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(void))3221225472;
  v8[2] = (void (*)(void))sub_1ABBBFFFC;
  v8[3] = (void (*)(void))&unk_1E5AB7B58;
  v10 = v11;
  v7 = v6;
  v9 = v7;
  __syncXPCIMDKVValueForKey_IPCAction(v8, (uint64_t)v5);

  _Block_object_dispose(v11, 8);
}

- (void)fetchInteger64ForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t empty;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v6)
      IMInsertNSStringsToXPCDictionary();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBC0128;
    v9[3] = &unk_1E5AB7B10;
    v10 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 211, v9);

  }
}

- (void)storeData:(id)a3 forKey:(id)a4
{
  __syncXPCIMDKVPersistValueForKey_IPCAction(0, (uint64_t)a4, (uint64_t)a3);
}

- (void)moveMessageRecordsToRecoveryForMessageGUIDs:(id)a3 deleteDate:(id)a4
{
  id v6;
  xpc_object_t empty;
  id v8;

  v8 = a3;
  v6 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty && objc_msgSend(v8, "count"))
  {
    IMInsertArraysToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 226, &unk_1E5AB7B78, v6, 0);
  }

}

- (void)moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:(id)a3 deleteDate:(id)a4
{
  id v6;
  xpc_object_t empty;
  id v8;

  v8 = a3;
  v6 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty && objc_msgSend(v8, "count"))
  {
    IMInsertArraysToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 158, &unk_1E5AAEC28, v6, 0);
  }

}

- (void)recoverMessageRecordsForChatRecordsWithGUIDs:(id)a3
{
  xpc_object_t empty;
  id v5;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty && objc_msgSend(v5, "count"))
  {
    IMInsertArraysToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 159, &unk_1E5AAE738, v5, 0);
  }

}

- (void)updateChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  xpc_object_t empty;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 168, &unk_1E5AAECA8, a3, 0);

  }
}

- (void)updateMessagesSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  xpc_object_t empty;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 200, &unk_1E5AB7B98, a3, 0);

  }
}

- (void)updateMessagesSyncedSyndicationRangesForGUIDs:(id)a3 toStatus:(int64_t)a4
{
  xpc_object_t empty;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 201, &unk_1E5AAEAA0, a4, 0);

  }
}

- (void)updateAttachmentsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  xpc_object_t empty;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 207, &unk_1E5AB7BB8, a3, 0);

  }
}

- (void)deleteRecoverableMessagesOlderThanDays:(int64_t)a3
{
  xpc_object_t empty;
  id v6;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6 = empty;
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 227, &unk_1E5AAEC68, a3, 0);
    empty = v6;
  }

}

- (void)deleteJunkMessagesOlderThanDays:(int64_t)a3
{
  xpc_object_t empty;
  id v6;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6 = empty;
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 238, &unk_1E5AB7BD8, a3, 0);
    empty = v6;
  }

}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  xpc_object_t empty;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty && objc_msgSend(v6, "count"))
  {
    IMInsertArraysToXPCDictionary();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBC074C;
    v9[3] = &unk_1E5AB1D08;
    v9[4] = self;
    v10 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 160, v9, v6, 0);

  }
}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(int64_t)a3
{
  xpc_object_t empty;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1ABBBDE1C;
    v13 = sub_1ABBBDE2C;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1ABBC08E4;
    v8[3] = &unk_1E5AB1D30;
    v8[4] = self;
    v8[5] = &v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 229, v8, a3, 0);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  xpc_object_t empty;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1ABBBDE1C;
    v13 = sub_1ABBBDE2C;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1ABBC0A74;
    v8[3] = &unk_1E5AB1D30;
    v8[4] = self;
    v8[5] = &v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 232, v8, a3, 0);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)clearRecoverableMessageTombStones
{
  xpc_object_t empty;
  NSObject *v4;
  uint8_t v5[16];

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 233, &unk_1E5AB7BF8);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Could not create xpc message. Not clearing message tombstones", v5, 2u);
    }

  }
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  xpc_object_t empty;
  id v8;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v8 = empty;
    IMInsertIntsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 230, &unk_1E5AAE798, a5, 0);
    empty = v8;
  }

}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageGUIDs:(id)a4
{
  id v6;
  xpc_object_t empty;
  _QWORD v8[5];

  v6 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    IMInsertArraysToXPCDictionary();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1ABBC0D08;
    v8[3] = &unk_1E5AB7C18;
    v8[4] = a3;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 240, v8, v6, 0);
  }

}

- (void)storeRecoverableMessagePartWithBody:(id)a3 forMessageWithGUID:(id)a4 deleteDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t empty;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  empty = xpc_dictionary_create_empty();
  if (v9 && objc_msgSend(v9, "length"))
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 231, &unk_1E5AAE9D8, v8, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "IMDDatabaseClient | Early return: Recently Deleted:storeRecoverableMessagePartWithBody given messageGUID: %@", buf, 0xCu);
    }

  }
}

- (void)fetchCountOfRecordType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  xpc_object_t empty;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  empty = xpc_dictionary_create_empty();
  v8 = empty;
  if (empty)
  {
    xpc_dictionary_set_uint64(empty, "recordType", a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1ABBC1094;
    v10[3] = &unk_1E5AB7B10;
    v11 = v6;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 244, v10);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Failed to create XPC dictionary", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)fetchScheduledMessageRecordsForChatRecordWithGUID:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  xpc_object_t empty;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  v9 = a5;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8)
      IMInsertNSStringsToXPCDictionary();
    xpc_dictionary_set_int64(empty, "limit", a4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBC11B4;
    v11[3] = &unk_1E5AB1D08;
    v11[4] = self;
    v12 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 71, v11);

  }
}

- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  xpc_object_t empty;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1ABBBDE1C;
    v13 = sub_1ABBBDE2C;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1ABBC1344;
    v8[3] = &unk_1E5AB1D30;
    v8[4] = self;
    v8[5] = &v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 72, v8, a3, 0);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4
{
  id v6;
  id v7;
  xpc_object_t empty;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  if (empty && objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABBC14BC;
    v9[3] = &unk_1E5AB7C40;
    v10 = v6;
    v11 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 73, v9, v7, 0);

  }
}

- (void)deleteTombstonedScheduledMessagesWithRecordIDs:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (objc_msgSend(v4, "count"))
      IMInsertArraysToXPCDictionary();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC1660;
    v6[3] = &unk_1E5AB7C68;
    v7 = v4;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 74, v6);

  }
}

- (void)markMessageRecordsAsReadWithGUIDs:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertArraysToXPCDictionary();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC17EC;
    v6[3] = &unk_1E5AB7C68;
    v7 = v4;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 247, v6, v4, 0);

  }
}

- (void)sendLegacyXPCCommandWithObject:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("IMDDatabaseClient should not fulfill this method, should use proxy directly!"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)checkSpotlightIndexCountWithCompletion:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC19C0;
    v6[3] = &unk_1E5AB7B10;
    v7 = v4;
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 135, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)validateSpotlightClientStateWithCompletion:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC1AAC;
    v6[3] = &unk_1E5AB7B10;
    v7 = v4;
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 136, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)fetchSpotlightClientStateWithCompletion:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC1BE4;
    v6[3] = &unk_1E5AB7B10;
    v7 = v4;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 137, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)invalidateSpotlightClientStateVersioningWithCompletion:(id)a3
{
  id v4;
  xpc_object_t empty;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABBC1D38;
    v6[3] = &unk_1E5AB7B10;
    v7 = v4;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 138, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

@end

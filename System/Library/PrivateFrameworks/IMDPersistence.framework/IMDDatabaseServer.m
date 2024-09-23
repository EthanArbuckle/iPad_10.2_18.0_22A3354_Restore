@implementation IMDDatabaseServer

- (void)handleIMDChatRecordLoadRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a5;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB69E0C;
  v12[3] = &unk_1E5AB1E20;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDChatRecordCopyChatsSortedByLastMessageDateAndFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB69CC8;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (IMDRemoteDatabaseProtocol)database
{
  return +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
}

- (void)_syncPersistenceBlock:(id)a3
{
  IMDPersistencePerformBlock(a3, 1);
}

- (void)_respondWithChatRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  xpc_object_t xdict;

  xdict = a4;
  v8 = (void (**)(_QWORD))a5;
  -[IMDDatabaseLegacyXPCBridge _xpcArrayWithChatRecords:](self, "_xpcArrayWithChatRecords:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && v9)
    xpc_dictionary_set_value(xdict, "array_result", v9);
  if (v8)
    v8[2](v8);

}

+ (id)sharedServer
{
  if (qword_1ED0D37C0 != -1)
    dispatch_once(&qword_1ED0D37C0, &unk_1E5AAEFC8);
  return (id)qword_1ED0D37C8;
}

- (void)_asyncPersistenceBlock:(id)a3
{
  IMDPersistencePerformBlock(a3, 0);
}

- (void)_respondWithMessageRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  xpc_object_t xdict;

  xdict = a4;
  v8 = (void (**)(_QWORD))a5;
  -[IMDDatabaseLegacyXPCBridge _xpcArrayWithMessageRecords:](self, "_xpcArrayWithMessageRecords:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && v9)
    xpc_dictionary_set_value(xdict, "array_result", v9);
  if (v8)
    v8[2](v8);

}

- (void)_respondWithAttachmentRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  xpc_object_t xdict;

  xdict = a4;
  v8 = (void (**)(_QWORD))a5;
  -[IMDDatabaseLegacyXPCBridge _xpcArrayWithAttachmentRecords:](self, "_xpcArrayWithAttachmentRecords:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && v9)
    xpc_dictionary_set_value(xdict, "array_result", v9);
  if (v8)
    v8[2](v8);

}

- (void)_respondWithHandleRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  xpc_object_t xdict;

  xdict = a4;
  v8 = (void (**)(_QWORD))a5;
  -[IMDDatabaseLegacyXPCBridge _xpcArrayWithHandleRecords:](self, "_xpcArrayWithHandleRecords:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && v9)
    xpc_dictionary_set_value(xdict, "array_result", v9);
  if (v8)
    v8[2](v8);

}

- (void)_authorizeOutgoingSandboxedResource:(id)a3 connection:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "authorizeForPID:", xpc_connection_get_pid((xpc_connection_t)a4));

}

- (void)handleIMDChatRecordCopyChatsFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB89644;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopySortedChatsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8979C;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopyChatsWithIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB899B4;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopyChatsWithPinningIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB89AF8;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopyChatsWithHandlesOnServiceWithDisplayNameGroupIDStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB89C94;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopyChatsWithAtLeastHandlesOnServiceWithStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB89E78;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordCopyGroupPhotoPaths_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  IMDDatabaseServer *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1ABB8A080;
  v18[3] = &unk_1E5AB1DF8;
  v19 = v11;
  v20 = self;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v18);

}

- (void)handleIMDChatRecordCopyDuplicateGroupChatRecords_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8A2F0;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDChatRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8A40C;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDChatRecordResolveInconsistentGUID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8A55C;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8A728;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordsUpdateSyncedSyndicationRangesForGUIDsToStatus_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8A858;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordCopyLastMessageForChatWithRowID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8A9A8;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8ABF4;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordCopyAllUnreadMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8AE2C;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordCopyMessageWithGUIDExcludingRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8AFF4;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordUpdateAttachmentSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8B21C;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordUpdateMessagesSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8B34C;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordCopyScheduledMessagesForChatGUIDToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8B49C;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordCopyScheduledMessagesToDeleteFromCloudKitToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8B650;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordAddScheduledMessageGUIDandCKRecordToDeleteFromCloudKit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8B7A0;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageDeleteTombstonedScheduledMessagesWithRecordIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8B8D8;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordMarkGUIDsAsRead_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8B9E8;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordMoveToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8BAF8;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDChatRecordMoveMessagesToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8BC44;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDChatRecordRecoverMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8BD90;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordDeleteRecoverableMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8BEA0;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordDeleteJunkMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8BFB4;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDChatRecordPermanentlyDeleteRecoverableMessagesInChatsWithGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8C0E8;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitUpdate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8C2F4;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitDelete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8C464;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v15);

}

- (void)handleIMDMessageRecordClearUnsyncedRemovedRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABB8C588;
  v9[3] = &unk_1E5AB1E98;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v9);

}

- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8C678;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncStateForMessageGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8C7C8;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDMessageRecordStoreRecoverableMessagePartBody_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8C8F8;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDNotificationsPostSharePlayNotification_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  IMDDatabaseServer *v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABB8CA4C;
  v9[3] = &unk_1E5AAF5B8;
  v10 = v7;
  v11 = self;
  v8 = v7;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v9);

}

- (void)notifyFirstUnlockComplete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(void);
  NSObject *v12;
  id v13;
  uint8_t buf[16];

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(void))a6;
  v11[2]();
  if ((IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase() & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Database told that first unlock is complete - exiting.", buf, 2u);
      }

    }
    exit(0);
  }

}

- (void)handleIMDCountOfRecordType_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8CCBC;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDHandleRecordCopyHandlesFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8CE70;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDHandleRecordCopySortedHandlesFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8CFC8;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDAttachmentRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8D1C0;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v12);

}

- (void)handleIMDCoreSpotlightDeleteAttachment_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8D2F0;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleDeleteAttachmentsDirectWithPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabaseServer *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB8D420;
  v12[3] = &unk_1E5AB1E20;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[IMDDatabaseServer _asyncPersistenceBlock:](self, "_asyncPersistenceBlock:", v12);

}

- (void)handleIMDAttachmentRecordCopyFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8D564;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDAttachmentRecordCopySortedAttachmentsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8D72C;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDKVIntegerForKey_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMDDatabaseServer *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABB8D944;
  v15[3] = &unk_1E5AB1D58;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[IMDDatabaseServer _syncPersistenceBlock:](self, "_syncPersistenceBlock:", v15);

}

- (void)handleIMDCoreSpotlightCheckIndexCount_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v8 = a6;
  sub_1ABBD6DB4();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  xpc_dictionary_handoff_reply();

}

- (void)handleIMDCoreSpotlightValidateClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v8 = a6;
  sub_1ABBD6DB4();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  xpc_dictionary_handoff_reply();

}

- (void)handleIMDCoreSpotlightFetchClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v8 = a6;
  dispatch_get_global_queue(2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  xpc_dictionary_handoff_reply();

}

- (void)handleIMDCoreSpotlightInvalidateSpotlightClientStateVersioning_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v8 = a6;
  sub_1ABBD6DB4();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v8;
  v11 = v7;
  xpc_dictionary_handoff_reply();

}

@end

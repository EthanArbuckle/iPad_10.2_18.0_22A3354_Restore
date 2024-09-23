@implementation ASAccountActor

- (ASAccountActor)initWithDAAccount:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  ASAccountActor *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!ExchangeSyncLibraryCore_frameworkLibrary_1)
  {
    v14 = xmmword_1E68CBC28;
    v15 = 0;
    ExchangeSyncLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (ExchangeSyncLibraryCore_frameworkLibrary_1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)getESAccountActorClass_softClass;
    v13 = getESAccountActorClass_softClass;
    if (!getESAccountActorClass_softClass)
    {
      *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __getESAccountActorClass_block_invoke;
      v16 = &unk_1E68CB4F0;
      v17 = &v10;
      __getESAccountActorClass_block_invoke((uint64_t)&v14);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    v7 = [v6 alloc];
    v8 = (ASAccountActor *)objc_msgSend(v7, "initWithDAAccount:", v4, v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)startup
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 325, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)mailboxes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 25, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)inboxFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 303, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)sentItemsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 309, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)deletedItemsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 315, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)mailNumberOfPastDaysToSync
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 32, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsMailboxSearch
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 38, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsEmailFlagging
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 43, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsConversations
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 48, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsDraftFolderSync
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 53, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsSmartForwardReply
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 58, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsUniqueServerId
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 63, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)generatesBulletins
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 68, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setGeneratesBulletins:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 73, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)signingIdentityPersistentReference
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 77, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setSigningIdentityPersistentReference:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 82, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)encryptionIdentityPersistentReference
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 86, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 91, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)customSignature
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 95, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setCustomSignature:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 100, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)setMailNumberOfPastDaysToSync:(int)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 105, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)monitorFoldersForUpdates:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 110, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)monitorFoldersForUpdates:(id)a3 persistent:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 115, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)stopMonitoringFoldersForUpdates:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 120, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)stopMonitoringAllFolders
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 125, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)foldersTag
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 129, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutWithTag:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 135, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutForDataclasses:(int64_t)a3 withTag:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 141, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 147, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 153, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 158, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)sendMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 useSmartTasksIfPossible:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 173, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)sendSmartMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 replaceOriginalMime:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 188, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7
{
  return -[ASAccountActor performMailboxRequest:mailbox:previousTag:clientWinsOnSyncConflict:isUserRequested:consumer:](self, "performMailboxRequest:mailbox:previousTag:clientWinsOnSyncConflict:isUserRequested:consumer:", a3, a4, a5, 0, a6, a7);
}

- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7
{
  return -[ASAccountActor performMailboxRequests:mailbox:previousTag:clientWinsOnSyncConflict:isUserRequested:consumer:](self, "performMailboxRequests:mailbox:previousTag:clientWinsOnSyncConflict:isUserRequested:consumer:", a3, a4, a5, 0, a6, a7);
}

- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8
{
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 229, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8
{
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 240, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performMoveRequests:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 247, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performFetchAttachmentRequest:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 254, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performFetchMessageSearchResultRequests:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 260, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performResolveRecipientsRequest:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 266, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)performFolderChange:(id)a3 isUserRequested:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 271, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelTaskWithID:(int)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 276, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)performSearchQuery:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 282, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelSearchQuery:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 287, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelAllSearchQueries
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 292, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (BOOL)searchQueriesRunning
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 297, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)draftsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 321, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setAccount:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 329, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)shutdown
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 333, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_daemonDiedNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 340, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_folderUpdatedNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 345, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_newASPolicyKeyNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 349, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_folderHierarchyChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 353, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_foldersThatExternalClientsCareAboutChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 357, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_accountPasswordChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 361, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

@end

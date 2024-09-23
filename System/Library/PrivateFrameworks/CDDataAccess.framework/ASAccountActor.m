@implementation ASAccountActor

- (ASAccountActor)initWithDAAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASAccountActor *v8;

  v4 = a3;
  +[DAAccountLoader sharedInstance](DAAccountLoader, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedDAAccountStore();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F080]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadFrameworkForACAccountType:", v7);

  v8 = (ASAccountActor *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("ASConcreteAccountActor"))), "initWithDAAccount:", v4);
  return v8;
}

- (void)startup
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 317, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)mailboxes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 17, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)inboxFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 295, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)sentItemsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 301, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)deletedItemsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 307, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)mailNumberOfPastDaysToSync
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 24, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsMailboxSearch
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 30, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsEmailFlagging
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 35, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsConversations
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 40, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsDraftFolderSync
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 45, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsSmartForwardReply
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 50, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)supportsUniqueServerId
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 55, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)generatesBulletins
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 60, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setGeneratesBulletins:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 65, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)signingIdentityPersistentReference
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 69, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setSigningIdentityPersistentReference:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 74, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)encryptionIdentityPersistentReference
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 78, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 83, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)customSignature
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 87, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setCustomSignature:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 92, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)setMailNumberOfPastDaysToSync:(int)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 97, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)monitorFoldersForUpdates:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 102, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)monitorFoldersForUpdates:(id)a3 persistent:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 107, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)stopMonitoringFoldersForUpdates:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 112, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)stopMonitoringAllFolders
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 117, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (id)foldersTag
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 121, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutWithTag:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 127, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutForDataclasses:(int64_t)a3 withTag:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 133, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 139, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 145, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 150, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)sendMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 useSmartTasksIfPossible:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 165, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)sendSmartMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 replaceOriginalMime:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 180, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

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
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 221, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8
{
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 232, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performMoveRequests:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 239, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performFetchAttachmentRequest:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 246, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performFetchMessageSearchResultRequests:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 252, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (int)performResolveRecipientsRequest:(id)a3 consumer:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 258, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)performFolderChange:(id)a3 isUserRequested:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 263, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelTaskWithID:(int)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 268, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)performSearchQuery:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 274, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelSearchQuery:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 279, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)cancelAllSearchQueries
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 284, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (BOOL)searchQueriesRunning
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 289, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (id)draftsFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 313, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

  return 0;
}

- (void)setAccount:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 321, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)shutdown
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 325, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_daemonDiedNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 332, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_folderUpdatedNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 337, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_newASPolicyKeyNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 341, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_folderHierarchyChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 345, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_foldersThatExternalClientsCareAboutChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 349, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

- (void)_accountPasswordChanged
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAccountActor.m"), 353, CFSTR("Must be called on subclass: %s"), sel_getName(a2));

}

@end

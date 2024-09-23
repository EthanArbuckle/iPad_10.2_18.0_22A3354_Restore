@implementation IMDaemonCoreBridgeImpl

+ (void)updateChatUsingSyncData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateChatUsingSyncData:", v3);

}

+ (BOOL)shouldStoreMessageForItem:(id)a3
{
  return objc_msgSend(a3, "shouldStoreMessage");
}

+ (BOOL)isCompatibleWithMiCForItem:(id)a3
{
  return objc_msgSend(a3, "isCompatibleWithMiC");
}

+ (BOOL)isBackwardCompatibilityForItem:(id)a3 parentChatID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;

  v5 = a3;
  v6 = a4;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_lookupChatUsingParentChatID:service:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v9) = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    v10 = v5;
    +[IMDBackwardCompatibilityMessageIdentifier sharedIdentifier](IMDBackwardCompatibilityMessageIdentifier, "sharedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v11, "isIgnorableBackwardCompatibilityMessage:inChat:", v10, v8);
    if ((_DWORD)v9 && _IMWillLog())
    {
      objc_msgSend(v10, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
  }

  return (char)v9;
}

+ (id)chatIdentitiesForMessageWithGUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatIdentitiesForMessageWithGUIDs:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isExpectedChatIDForItem:(id)a3 chatID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatsForMessageGUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "cloudKitChatID", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (void)setSortIDForItem:(id)a3 parentChatID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_lookupChatUsingParentChatID:service:", v5, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSortIDOnIncomingMessage:forChat:", v6, v10);

}

+ (void)addItem:(id)a3 toParentChatID:(id)a4 updatedLastMessageCount:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v7 = a3;
  v8 = a4;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chatForMessageGUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_lookupChatUsingParentChatID:service:", v8, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_addItemToParentChatIfNotLocationItem:parentChat:updatedLastMessageCount:", v7, v11, a5);

    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_1D166BE5C((uint64_t)v8, v7, v15);

      v11 = 0;
    }
  }

}

+ (void)removeTransferFromBackup:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_removeTransferFromiCloudBackupWithGuid:", v3);

}

+ (void)updateTemporaryTransferGUIDsIfNeeded:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTemporaryTransferGUIDsOnMessageIfNeeded:", v3);

}

+ (id)fileTransferWithGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)storeAttachmentWithTransfer:(id)a3 withMessageGUID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeAttachment:associateWithMessageWithGUID:", v6, v5);

}

+ (BOOL)storeAttachmentWithTransfer:(id)a3 withChatGUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:", v6, 0, v5, 1);

  return v8;
}

+ (void)reloadDatabase
{
  id v2;

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_forceReloadChats:", 1);

}

+ (void)storeAttachmentsForMessage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_storeAttachmentsForMessage:", v3);

}

+ (id)createMessageItemWithRecordRef:(_IMDMessageRecordStruct *)a3 handle:(id)a4
{
  return (id)IMDCreateIMMessageItemFromIMDMessageRecordRef((uint64_t)a3, a4);
}

+ (void)updateStamp
{
  id v2;

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStamp");

}

+ (id)fileTransferForGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferForGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)addTransfer:(id)a3 forGUID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTransfer:forGUID:", v6, v5);

}

+ (BOOL)registerGuid:(id)a3 forLocalURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "registerGUID:forNewOutgoingTransferWithLocalURL:", v6, v5);

  return v8;
}

+ (void)updateTransfer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTransfer:", v3);

}

+ (void)moveMessagePartForGUID:(id)a3 deleteDate:(id)a4 partBody:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMDCKRecoverableMessageSyncController sharedInstance](IMDCKRecoverableMessageSyncController, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_onRecoverableMessagePartRecordReadWithDeleteDate:messageGUID:partBody:", v8, v9, v7);

}

+ (BOOL)hasFinishedAssetDownloadSync
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  +[IMDCKSyncController sharedInstance](IMDCKSyncController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAnalyticSyncDatesObjectForKey:", *MEMORY[0x1E0D378F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "intValue"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)primaryAccountCountryCode
{
  void *v2;
  void *v3;

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_primaryAccountCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ckRecordWithT1Info:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D398B8];
  v4 = a3;
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "createCKRecordForUpdateT1:zoneID:salt:", v4, v6, v8);

  return v9;
}

+ (id)ckRecordWithT2Info:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D398B8];
  v4 = a3;
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "createCKRecordForUpdateT2:zoneID:salt:", v4, v6, v8);

  return v9;
}

+ (id)ckRecordWithT3Info:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D398B8];
  v4 = a3;
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "createCKRecordForUpdateT3:zoneID:salt:", v4, v6, v8);

  return v9;
}

+ (void)handleMessageUpdateWithCKRecord:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleMessageUpdate:", v3);

}

@end

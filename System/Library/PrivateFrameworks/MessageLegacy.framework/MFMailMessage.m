@implementation MFMailMessage

+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\n%@"), MFLookupLocalizedString((uint64_t)CFSTR("FORWARDED_MESSAGE_PREFIX"), (uint64_t)CFSTR("Begin forwarded message:\n\n"), CFSTR("Delayed")));
  else
    return (id)MFLookupLocalizedString((uint64_t)CFSTR("FORWARDED_MESSAGE_PREFIX"), (uint64_t)CFSTR("Begin forwarded message:\n\n"), CFSTR("Delayed"));
}

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

- (id)messageStore
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailMessage;
  return -[MFMailMessage messageStore](&v3, sel_messageStore);
}

- (id)mailMessageStore
{
  id v2;

  v2 = -[MFMailMessage messageStore](self, "messageStore");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (unint64_t)modSequenceNumber
{
  unint64_t modSequenceNumber;

  -[MFMailMessage mf_lock](self, "mf_lock");
  modSequenceNumber = self->_modSequenceNumber;
  -[MFMailMessage mf_unlock](self, "mf_unlock");
  return modSequenceNumber;
}

- (void)setModSequenceNumber:(unint64_t)a3
{
  -[MFMailMessage mf_lock](self, "mf_lock");
  self->_modSequenceNumber = a3;
  -[MFMailMessage mf_unlock](self, "mf_unlock");
}

- (unint64_t)messageFlags
{
  unint64_t messageFlags;

  -[MFMailMessage mf_lock](self, "mf_lock");
  messageFlags = self->_messageFlags;
  -[MFMailMessage mf_unlock](self, "mf_unlock");
  return messageFlags;
}

- (void)setMessageFlags:(unint64_t)a3
{
  self->_messageFlags = a3;
}

+ (unsigned)validatePriority:(int)a3
{
  if ((a3 - 6) >= 0xFFFFFFFB)
    return a3;
  else
    return 3;
}

+ (unsigned)displayablePriorityForPriority:(int)a3
{
  unsigned int v3;
  unsigned int v4;

  v3 = objc_msgSend(a1, "validatePriority:", *(_QWORD *)&a3);
  if (v3 == 4)
    v4 = 5;
  else
    v4 = v3;
  if (v3 == 2)
    return 1;
  else
    return v4;
}

- (void)setPriorityFromHeaders:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "firstHeaderForKey:", *MEMORY[0x1E0D1E628]);
  if (v4)
    v5 = (objc_msgSend((id)objc_opt_class(), "validatePriority:", objc_msgSend(v4, "intValue")) & 7) << 16;
  else
    v5 = 196608;
  -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", self->_messageFlags & 0xFFFFFFFFFFF8FFFFLL | v5);
}

- (int)priority
{
  __int16 v2;
  uint64_t v3;

  v2 = WORD1(self->_messageFlags);
  v3 = v2 & 7;
  if ((v2 & 7) == 0)
    -[MFMailMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "headersForMessage:fetchIfNotAvailable:", self, 0));
  return objc_msgSend((id)objc_opt_class(), "validatePriority:", v3);
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailMessage;
  -[MFMailMessage loadCachedHeaderValuesFromHeaders:](&v7, sel_loadCachedHeaderValuesFromHeaders_);
  _MFLockGlobalLock();
  v5 = self->_messageFlags & 0x70000;
  v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D46178]);
  _MFUnlockGlobalLock();
  if (v5)
  {
    if (v6)
      return;
LABEL_5:
    objc_msgSend(a3, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
    -[MFMailMessage setMessageIDHash:](self, "setMessageIDHash:", MFStringHashForMessageIDHeader());
    return;
  }
  -[MFMailMessage setPriorityFromHeaders:](self, "setPriorityFromHeaders:", a3);
  if (!v6)
    goto LABEL_5;
}

- (void)markAsViewed
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) == 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") | 1);
}

- (void)markAsNotViewed
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 1) != 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") & 0xFFFFFFFFFFFFFFFELL);
}

- (void)markAsReplied
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 4) == 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") | 4);
}

- (void)markAsForwarded
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x100) == 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") | 0x100);
}

- (void)markAsFlagged
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) == 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") | 0x10);
}

- (void)markAsNotFlagged
{
  if ((-[MFMailMessage messageFlags](self, "messageFlags") & 0x10) != 0)
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", -[MFMailMessage messageFlags](self, "messageFlags") & 0xFFFFFFFFFFFFFFEFLL);
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "mailboxUid");
}

- (id)loadMeetingExternalID
{
  return (id)objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "loadMeetingExternalIDForMessage:", self);
}

- (id)loadMeetingData
{
  return (id)objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "loadMeetingDataForMessage:", self);
}

- (id)loadMeetingMetadata
{
  return (id)objc_msgSend(-[MFMailMessage mailMessageStore](self, "mailMessageStore"), "loadMeetingMetadataForMessage:", self);
}

- (id)_privacySafeDescription
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  _MFLockGlobalLock();
  v3 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D46178]);
  _MFUnlockGlobalLock();
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", -[MFMailMessage conversationID](self, "conversationID"));
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithHash:", v3);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "ef_publicDescription");
  v9 = objc_msgSend(v5, "ef_publicDescription");
  LODWORD(v10) = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D46170]);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p> conversationID=%@ messageID=%@ received=%@"), v7, self, v8, v9, objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v10));
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"))
    return -[MFMailMessage description](self, "description");
  else
    return (NSString *)-[MFMailMessage _privacySafeDescription](self, "_privacySafeDescription");
}

- (id)account
{
  return (id)objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "account");
}

- (id)remoteMailboxURL
{
  return 0;
}

- (unint64_t)conversationFlags
{
  return 0;
}

- (id)originalMailboxURL
{
  return -[MFMailboxUid URLString](-[MFMailMessage mailbox](self, "mailbox"), "URLString");
}

- (id)URL
{
  return (id)objc_msgSend(-[MFMailMessage account](self, "account"), "URLForMessage:", self);
}

- (id)globalMessageURL
{
  void *v3;
  id v4;

  if (!self->_globalMessageURL)
  {
    v3 = (void *)-[MFMailMessage messageIDHeader](self, "messageIDHeader");
    if (objc_msgSend(v3, "length"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v4, "setScheme:", CFSTR("message"));
      objc_msgSend(v4, "setPath:", v3);
      self->_globalMessageURL = (NSURL *)objc_msgSend((id)objc_msgSend(v4, "URL"), "copy");

    }
  }
  return self->_globalMessageURL;
}

- (unint64_t)numberOfAttachments
{
  unsigned int v2;

  v2 = (unsigned __int16)-[MFMailMessage messageFlags](self, "messageFlags") >> 10;
  if (v2 == 63)
    return 0;
  else
    return v2;
}

- (void)setMutableInfoFromMessage:(id)a3
{
  -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", objc_msgSend(a3, "messageFlags"));
}

- (void)setSummary:(id)a3
{
  uint64_t v5;
  id v6;

  _MFLockGlobalLock();
  v5 = (int)*MEMORY[0x1E0D46180];
  v6 = *(Class *)((char *)&self->super.super.isa + v5);
  if (v6 != a3)
  {

    *(Class *)((char *)&self->super.super.isa + v5) = (Class)a3;
  }
  _MFUnlockGlobalLock();
}

- (BOOL)shouldSetSummary
{
  int v3;

  v3 = objc_msgSend(-[MFMailMessage messageStore](self, "messageStore"), "shouldSetSummaryForMessage:", self);
  if (v3)
    LOBYTE(v3) = -[MFMailMessage summary](self, "summary") == 0;
  return v3;
}

- (id)copyMessageInfo
{
  MFMessageInfo *info;
  double v4;
  double v5;
  int messageFlags;
  _BOOL8 v7;

  info = self->_info;
  if (!info)
  {
    info = objc_alloc_init(MFMessageInfo);
    self->_info = info;
  }
  -[MFMessageInfo setUid:](info, "setUid:", self);
  -[MFMailMessage dateReceivedAsTimeIntervalSince1970](self, "dateReceivedAsTimeIntervalSince1970");
  -[MFMessageInfo setDateReceivedInterval:](self->_info, "setDateReceivedInterval:", v4);
  -[MFMailMessage dateSentAsTimeIntervalSince1970](self, "dateSentAsTimeIntervalSince1970");
  -[MFMessageInfo setDateSentInterval:](self->_info, "setDateSentInterval:", v5);
  -[MFMessageInfo setUidIsLibraryID:](self->_info, "setUidIsLibraryID:", 0);
  -[MFMessageInfo setConversationHash:](self->_info, "setConversationHash:", -[MFMailMessage conversationID](self, "conversationID"));
  -[MFMessageInfo setMessageIDHash:](self->_info, "setMessageIDHash:", -[MFMailMessage messageIDHash](self, "messageIDHash"));
  -[MFMessageInfo setIsVIP:](self->_info, "setIsVIP:", (self->_messageFlags >> 24) & 1);
  -[MFMessageInfo setRead:](self->_info, "setRead:", self->_messageFlags & 1);
  -[MFMessageInfo setFlagged:](self->_info, "setFlagged:", (self->_messageFlags >> 4) & 1);
  messageFlags = self->_messageFlags;
  if ((unsigned __int16)messageFlags >> 10)
    v7 = (unsigned __int16)messageFlags >> 10 != 63;
  else
    v7 = 0;
  -[MFMessageInfo setKnownToHaveAttachments:](self->_info, "setKnownToHaveAttachments:", v7);
  return self->_info;
}

- (id)externalConversationID
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailMessage;
  -[MFMailMessage dealloc](&v3, sel_dealloc);
}

- (id)bestAlternativePart
{
  return -[MFMailMessage bestAlternativePart:](self, "bestAlternativePart:", 0);
}

- (id)bestAlternativePart:(BOOL *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v5 = (void *)-[MFMailMessage messageBodyIfAvailableUpdatingFlags:](self, "messageBodyIfAvailableUpdatingFlags:", 0);
  if (v5)
  {
    v6 = objc_msgSend(v5, "topLevelPart");
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 1;
    do
    {
      if (!v10)
      {
        v7 = (void *)objc_msgSend(v9, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", 1, &v28, 0, 1, a3);
        v8 = v9;
      }
      v11 = -[MFMailMessage bestAlternativeInPart:](self, "bestAlternativeInPart:", v6);
      v9 = (void *)v11;
      v10 = v11 == 0;
    }
    while (!v11 || (void *)v11 != v8);
  }
  else
  {
    v7 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v25 != v15)
        objc_enumerationMutation(v7);
      v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v17, "htmlData"))
      {
        v18 = objc_msgSend(v17, "preferredEncoding");
        v19 = MFCreateStringWithData();
        v20 = (void *)v19;
        if (v18 != -1 && v19 == 0)
          v20 = (void *)MFCreateStringWithData();
        if (v20)
        {
          if (v14)
            v22 = (id)objc_msgSend(v14, "stringByAppendingString:", v20);
          else
            v22 = v20;
          v14 = v22;

        }
      }
    }
    v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  }
  while (v13);
  return v14;
}

- (BOOL)isSearchResultWithBogusRemoteId
{
  return (~-[MFMailMessage messageFlags](self, "messageFlags") & 0x100000080) == 0;
}

+ (id)externalDataTypeIdentifiers
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mail.email"));
  objc_msgSend(v2, "addObject:", *MEMORY[0x1E0CA5B40]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0CB3B10], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99E98], "writableTypeIdentifiersForItemProvider"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0CB3498], "performSelector:", sel_writableTypeIdentifiersForItemProvider));
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0CB3940], "writableTypeIdentifiersForItemProvider"));
  return v2;
}

- (BOOL)shouldUseMailDrop
{
  return self->_shouldUseMailDrop;
}

- (void)setShouldUseMailDrop:(BOOL)a3
{
  self->_shouldUseMailDrop = a3;
}

- (id)listUnsubscribe
{
  return (id)objc_msgSend((id)-[MFMailMessage headers](self, "headers"), "listUnsubscribeCommands");
}

- (BOOL)flagged
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 4) & 1;
}

- (BOOL)read
{
  return -[MFMailMessage messageFlags](self, "messageFlags") & 1;
}

- (BOOL)answered
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 2) & 1;
}

- (BOOL)junk
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 21) & 1;
}

- (BOOL)senderVIP
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 24) & 1;
}

- (BOOL)conversationVIP
{
  return -[MFMailMessage conversationFlags](self, "conversationFlags") & 1;
}

- (BOOL)conversationMuted
{
  return (-[MFMailMessage conversationFlags](self, "conversationFlags") >> 1) & 1;
}

- (BOOL)deleted
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 1) & 1;
}

- (BOOL)isKnownToHaveAttachments
{
  unsigned __int16 v2;

  v2 = -[MFMailMessage messageFlags](self, "messageFlags");
  return v2 >> 10 && v2 >> 10 != 63;
}

- (unsigned)libraryID
{
  return -1;
}

@end

@implementation MFMailMessage

+ (id)forwardedMessagePrefixWithSpacer:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("FORWARDED_MESSAGE_PREFIX"), CFSTR("Begin forwarded message:\n\n"), CFSTR("Delayed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("\n\n%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MFLookupLocalizedString(CFSTR("FORWARDED_MESSAGE_PREFIX"), CFSTR("Begin forwarded message:\n\n"), CFSTR("Delayed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

- (MFMailMessageStore)messageStore
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailMessage;
  -[MFMailMessage messageStore](&v3, sel_messageStore);
  return (MFMailMessageStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)mailMessageStore
{
  void *v2;
  void *v3;
  id v4;

  -[MFMailMessage messageStore](self, "messageStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
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

- (BOOL)isServerSearchResult
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 7) & 1;
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
  char v4;
  id v5;

  objc_msgSend(a3, "firstHeaderForKey:", *MEMORY[0x1E0D1E628]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4 = objc_msgSend((id)objc_opt_class(), "validatePriority:", objc_msgSend(v5, "intValue"));
  else
    v4 = 3;
  -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", self->_messageFlags & 0xFFFFFFFFFFF8FFFFLL | ((v4 & 7) << 16));

}

- (int64_t)priority
{
  __int16 v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = WORD1(self->_messageFlags);
  v4 = v3 & 7;
  if ((v3 & 7) == 0)
  {
    -[MFMailMessage messageStore](self, "messageStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headersForMessage:fetchIfNotAvailable:", self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessage loadCachedHeaderValuesFromHeaders:](self, "loadCachedHeaderValuesFromHeaders:", v6);

  }
  return objc_msgSend((id)objc_opt_class(), "validatePriority:", v4);
}

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4;
  unint64_t messageFlags;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMailMessage;
  -[MFMailMessage loadCachedHeaderValuesFromHeaders:](&v8, sel_loadCachedHeaderValuesFromHeaders_, v4);
  _MFLockGlobalLock();
  messageFlags = self->_messageFlags;
  v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D46178]);
  _MFUnlockGlobalLock();
  if ((messageFlags & 0x70000) == 0)
    -[MFMailMessage setPriorityFromHeaders:](self, "setPriorityFromHeaders:", v4);
  if (!v6)
  {
    objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessage setMessageIDHash:](self, "setMessageIDHash:", MFStringHashForMessageIDHeader());

  }
}

- (void)setIsServerSearchResult:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (-[MFMailMessage isServerSearchResult](self, "isServerSearchResult") != a3)
  {
    v5 = -[MFMailMessage messageFlags](self, "messageFlags") & 0xFFFFFFFFFFFFFF7FLL;
    v6 = 128;
    if (!v3)
      v6 = 0;
    -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", v5 | v6);
  }
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
  void *v2;
  void *v3;

  -[MFMailMessage messageStore](self, "messageStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailbox");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFMailboxUid *)v3;
}

- (id)preferredAccountToUseForReplying
{
  void *v2;
  void *v3;

  -[MFMailMessage mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredEmailAddressToReplyWith
{
  void *v3;
  __objc2_class **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[MFMailMessage preferredAccountToUseForReplying](self, "preferredAccountToUseForReplying");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = off_1E4E59000;
  +[MailAccount addressesThatReceivedMessage:](MailAccount, "addressesThatReceivedMessage:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstEmailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_20;
  if (!objc_msgSend(v5, "count") || (objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
  {
    v7 = v6;
    goto LABEL_29;
  }
  objc_msgSend(v3, "emailAddressesAndAliasesList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_map:", &__block_literal_global_14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v6);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v12)
  {
    v17 = v11;
    v7 = v6;
    goto LABEL_27;
  }
  v13 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      if (objc_msgSend(v5, "containsObject:", v15, (_QWORD)v32))
      {
        v4 = off_1E4E59000;
        if (objc_msgSend(v11, "containsObject:", v15))
        {
          v16 = v15;
        }
        else
        {
          objc_msgSend(v3, "defaultEmailAddress");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v7 = v16;

        goto LABEL_19;
      }
    }
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
      continue;
    break;
  }
  v7 = v6;
  v4 = off_1E4E59000;
LABEL_19:

  if (!v7)
  {
LABEL_20:
    -[MFMailMessage mailbox](self, "mailbox");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isOutgoingMailboxUid"))
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_28;
    }
    -[MFMailMessage senders](self, "senders");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
LABEL_27:

LABEL_28:
  }
LABEL_29:
  v18 = v7;
  objc_msgSend(v18, "emailAddressValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v18, "stringValue");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  v24 = objc_msgSend(v18, "isEqualToString:", v23);
  if (v24)
  {
    -[__objc2_class accountContainingEmailAddress:](v4[81], "accountContainingEmailAddress:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fullUserName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0D1E6C0];
      objc_msgSend(v18, "emailAddressValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsWithEmailAddress:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "setDisplayName:", v26);
      objc_msgSend(v29, "stringValue");
      v30 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v30;
    }

  }
  return v18;
}

id __49__MFMailMessage_preferredEmailAddressToReplyWith__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)loadMeetingExternalID
{
  void *v3;
  void *v4;

  -[MFMailMessage mailMessageStore](self, "mailMessageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMeetingExternalIDForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadMeetingData
{
  void *v3;
  void *v4;

  -[MFMailMessage mailMessageStore](self, "mailMessageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMeetingDataForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadMeetingMetadata
{
  void *v3;
  void *v4;

  -[MFMailMessage mailMessageStore](self, "mailMessageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMeetingMetadataForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MailAccount)account
{
  void *v2;
  void *v3;

  -[MFMailMessage messageStore](self, "messageStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MailAccount *)v3;
}

- (BOOL)sourceIsManaged
{
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (self->_useInternalSourceIsManaged)
    return self->_sourceIsManaged;
  -[MFMailMessage account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocalAccount");

  if (v5)
  {
    -[MFMailMessage mailbox](self, "mailbox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "sourceIsManaged");

  }
  else
  {
    -[MFMailMessage account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "sourceIsManaged");
  }

  return v3;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
  self->_useInternalSourceIsManaged = 1;
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
  void *v2;
  void *v3;

  -[MFMailMessage mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)URL
{
  void *v3;
  void *v4;

  -[MFMailMessage account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForMessage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)globalMessageURL
{
  NSURL **p_globalMessageURL;
  NSURL *v4;
  void *v5;
  void *v6;

  _MFLockGlobalLock();
  p_globalMessageURL = &self->_globalMessageURL;
  v4 = self->_globalMessageURL;
  _MFUnlockGlobalLock();
  if (!v4)
  {
    v5 = (void *)objc_opt_class();
    -[MFMailMessage messageIDHeader](self, "messageIDHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globalMessageURLWithMessageIDHeader:", v6);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _MFLockGlobalLock();
      objc_storeStrong((id *)p_globalMessageURL, v4);
      _MFUnlockGlobalLock();
    }
  }
  return v4;
}

+ (id)globalMessageURLWithMessageIDHeader:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", *MEMORY[0x1E0D1DCE0]);
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeCharactersInString:", CFSTR("/"));
    objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPercentEncodedPath:", v7);

    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  id v4;

  v4 = a3;
  -[MFMailMessage setMessageFlags:](self, "setMessageFlags:", objc_msgSend(v4, "messageFlags"));

}

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11
{
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFMailMessage;
  -[MFMailMessage setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:withOptions:](&v12, sel_setSubject_to_cc_bcc_sender_dateReceived_dateSent_summary_withOptions_, a3, a4, a5, a6, a7, a10, a8, a9, a11);
}

- (void)setSummary:(id)a3
{
  id v5;

  v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D46180]), a3);
  _MFUnlockGlobalLock();

}

- (BOOL)shouldSetSummary
{
  void *v2;
  BOOL v3;

  -[MFMailMessage summary](self, "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)externalConversationID
{
  return 0;
}

- (id)bestAlternativePart
{
  return -[MFMailMessage bestAlternativePart:](self, "bestAlternativePart:", 0);
}

- (id)bestAlternativePart:(BOOL *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MFMailMessage _bestAlternativePartContent:](self, "_bestAlternativePartContent:", a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "isVisuallyEmpty", (_QWORD)v13) & 1) == 0)
        {
          objc_msgSend(v8, "htmlData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = objc_msgSend(v8, "preferredEncoding");
            v11 = (void *)MFCreateStringWithData();
            if (!v11 && v10 != -1)
              v11 = (void *)MFCreateStringWithData();
            if (v11)
            {
              if (v4)
              {
                objc_msgSend(v4, "appendString:", v11);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v11);
                v4 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)_bestAlternativePartContent:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v16 = 0;
  -[MFMailMessage messageBodyIfAvailableUpdatingFlags:](self, "messageBodyIfAvailableUpdatingFlags:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "topLevelPart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 1;
    while (1)
    {
      if (!v11)
      {
        objc_msgSend(v9, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", 1, &v16, 0, 1, a3);
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = v9;
        v10 = (void *)v12;
        v8 = v13;
      }
      -[MFMailMessage bestAlternativeInPart:](self, "bestAlternativeInPart:", v7);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = v14 == 0;
      v9 = (void *)v14;
      if (v14)
      {
        v9 = (void *)v14;
        if ((void *)v14 == v8)
          break;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  _QWORD v16[4];
  id v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD aBlock[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MFMailMessage _bestAlternativePartContent:](self, "_bestAlternativePartContent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke;
  aBlock[3] = &unk_1E4E89E48;
  aBlock[4] = &v24;
  aBlock[5] = a4;
  v6 = _Block_copy(aBlock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isVisuallyEmpty") & 1) == 0)
        {
          objc_msgSend(v11, "htmlData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = objc_msgSend(v11, "preferredEncoding");
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke_2;
            v16[3] = &unk_1E4E89E70;
            v17 = v6;
            v18 = v13;
            objc_msgSend(v12, "ef_enumerateSubdataOfSize:usingBlock:", 0x80000, v16);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v8);
  }

  v14 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = (void *)MEMORY[0x1A85B0E24]();
  v7 = MFCreateStringWithBytes();
  v8 = (void *)v7;
  if (a4 != -1 && !v7)
    v8 = (void *)MFCreateStringWithBytes();
  if (v8)
  {
    objc_msgSend(v8, "mf_dataUsingEncoding:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v10)
    {
      objc_msgSend(v10, "appendData:", v9);
    }
    else
    {
      v11 = objc_msgSend(v9, "mutableCopy");
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }

  objc_autoreleasePoolPop(v6);
}

void __57__MFMailMessage_bestAlternativePartAsData_usingEncoding___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_retainAutorelease(v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), *(unsigned int *)(a1 + 40));

}

- (BOOL)isSearchResultWithBogusRemoteId
{
  return (~-[MFMailMessage messageFlags](self, "messageFlags") & 0x100000080) == 0;
}

- (id)storageLocationForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMailMessage messageStore](self, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageLocationForAttachment:withMessage:", v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)listUnsubscribe
{
  void *v2;
  void *v3;

  -[MFMailMessage headers](self, "headers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listUnsubscribeCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)MFFlagsObjectForFlags(-[MFMailMessage messageFlags](self, "messageFlags"));
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

- (BOOL)conversationVIP
{
  return -[MFMailMessage conversationFlags](self, "conversationFlags") & 1;
}

- (BOOL)conversationMuted
{
  return (-[MFMailMessage conversationFlags](self, "conversationFlags") >> 2) & 1;
}

- (BOOL)isPartOfExistingThread
{
  void *v3;
  char v4;
  char v5;
  void *v6;

  -[MFMailMessage headersIfAvailable](self, "headersIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasHeaderForKey:", *MEMORY[0x1E0D1E588]);

  if ((v4 & 1) != 0)
    return 1;
  -[MFMailMessage subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "hasReplyPrefix");

  return v5;
}

- (ECMimeBody)mimeBody
{
  return 0;
}

- (NSDictionary)headersDictionary
{
  void *v2;
  void *v3;

  -[MFMailMessage headersIfAvailable](self, "headersIfAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headersDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSArray)references
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFMailMessage headersIfAvailable](self, "headersIfAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(v2, "references");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    objc_msgSend(v2, "headersForKey:", *MEMORY[0x1E0D1E588]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "addObjectsFromArray:", v5);
    objc_msgSend(v3, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSSet)labels
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)deleted
{
  return (-[MFMailMessage messageFlags](self, "messageFlags") >> 1) & 1;
}

- (int64_t)libraryID
{
  return *MEMORY[0x1E0D1DC08];
}

- (id)readLater
{
  return 0;
}

- (id)sendLaterDate
{
  return 0;
}

- (id)followUp
{
  return 0;
}

- (BOOL)shouldUseMailDrop
{
  return self->_shouldUseMailDrop;
}

- (void)setShouldUseMailDrop:(BOOL)a3
{
  self->_shouldUseMailDrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalMessageURL, 0);
}

@end

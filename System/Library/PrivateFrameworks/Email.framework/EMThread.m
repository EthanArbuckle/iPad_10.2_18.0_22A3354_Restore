@implementation EMThread

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingQuery, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayMessageItemID, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxTypeResolver, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EMThread;
  -[EMQueryingCollection encodeWithCoder:](&v25, sel_encodeWithCoder_, v4);
  -[EMThread originatingQuery](self, "originatingQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_originatingQuery"));

  -[EMThread date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_date"));

  -[EMThread displayDate](self, "displayDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_displayDate"));

  -[EMThread readLater](self, "readLater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_readLater"));

  -[EMThread sendLaterDate](self, "sendLaterDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_sendLaterDate"));

  -[EMThread followUp](self, "followUp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_followUp"));

  -[EMThread category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_category"));

  -[EMThread groupedSenderMessageListItems](self, "groupedSenderMessageListItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_groupedSenderMessageListItems"));

  -[EMThread subject](self, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_subject"));

  -[EMThread summary](self, "summary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_summary"));

  -[EMThread generatedSummary](self, "generatedSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("EFPropertyKey_generatedSummary"));

  -[EMThread senderList](self, "senderList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("EFPropertyKey_senderList"));

  -[EMThread toList](self, "toList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("EFPropertyKey_toList"));

  -[EMThread ccList](self, "ccList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("EFPropertyKey_ccList"));

  -[EMThread flags](self, "flags");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("EFPropertyKey_flags"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread hasUnflagged](self, "hasUnflagged"), CFSTR("EFPropertyKey_hasUnflagged"));
  -[EMThread flagColors](self, "flagColors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("EFPropertyKey_flagColors"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isVIP](self, "isVIP"), CFSTR("EFPropertyKey_isVIP"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isBlocked](self, "isBlocked"), CFSTR("EFPropertyKey_isBlocked"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMThread unsubscribeType](self, "unsubscribeType"), CFSTR("EFPropertyKey_unsubscribeType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isToMe](self, "isToMe"), CFSTR("EFPropertyKey_isToMe"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isCCMe](self, "isCCMe"), CFSTR("EFPropertyKey_isCCMe"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread hasAttachments](self, "hasAttachments"), CFSTR("EFPropertyKey_hasAttachments"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isAuthenticated](self, "isAuthenticated"), CFSTR("EFPropertyKey_isAuthenticated"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EMThread conversationNotificationLevel](self, "conversationNotificationLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("EFPropertyKey_conversationNotificationLevel"));

  -[EMThread brandIndicatorLocation](self, "brandIndicatorLocation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("EFPropertyKey_brandIndicatorLocation"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMThread count](self, "count"), CFSTR("EFPropertyKey_count"));
  -[EMThread mailboxObjectIDs](self, "mailboxObjectIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("EFPropertyKey_mailboxObjectIDs"));

  -[EMThread displayMessageItemID](self, "displayMessageItemID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("EFPropertyKey_displayMessageItemID"));

}

- (EMFollowUp)followUp
{
  return (EMFollowUp *)objc_getProperty(self, a2, 312, 1);
}

- (ECSubject)subject
{
  return (ECSubject *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)senderList
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 296, 1);
}

- (EMQuery)originatingQuery
{
  return self->_originatingQuery;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (NSIndexSet)flagColors
{
  return (NSIndexSet *)objc_getProperty(self, a2, 248, 1);
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSArray)toList
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (NSArray)mailboxObjectIDs
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxObjectIDs;
  os_unfair_lock_unlock(p_mailboxesLock);
  return v4;
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (BOOL)hasUnflagged
{
  return self->_hasUnflagged;
}

- (EMObjectID)displayMessageObjectID
{
  void *v4;
  EMMessageObjectID *v5;
  void *v6;
  EMMessageObjectID *v7;
  void *v9;

  -[EMThread displayMessageItemID](self, "displayMessageItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMThread.m"), 548, CFSTR("displayMessageItemID is not an EMMessageCollectionItemID"));

  }
  v5 = [EMMessageObjectID alloc];
  -[EMThread mailboxScope](self, "mailboxScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:](v5, "initWithCollectionItemID:mailboxScope:", v4, v6);

  return (EMObjectID *)v7;
}

- (EMCollectionItemID)displayMessageItemID
{
  return (EMCollectionItemID *)objc_getProperty(self, a2, 288, 1);
}

- (EMMailboxScope)mailboxScope
{
  void *v3;
  os_unfair_lock_s *p_mailboxScopeLock;
  EMMailboxScope *mailboxScope;
  BOOL v6;
  void *v7;
  void *v8;
  EMMailboxScope *v9;
  EMMailboxScope *v10;
  EMMailboxScope *v11;
  EMMailboxScope *v12;
  EMMailboxScope *v13;

  -[EMThread mailboxTypeResolver](self, "mailboxTypeResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_mailboxScopeLock = &self->_mailboxScopeLock;
  os_unfair_lock_lock(&self->_mailboxScopeLock);
  mailboxScope = self->_mailboxScope;
  if (mailboxScope)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    -[EMThread originatingQuery](self, "originatingQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", v8, v3);
    v9 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();
    v10 = self->_mailboxScope;
    self->_mailboxScope = v9;

    mailboxScope = self->_mailboxScope;
  }
  v11 = mailboxScope;
  os_unfair_lock_unlock(p_mailboxScopeLock);
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    +[EMMailboxScope noMailboxesScope](EMMailboxScope, "noMailboxesScope");
    v12 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (EMMailboxTypeResolver)mailboxTypeResolver
{
  os_unfair_lock_s *p_mailboxTypeResolverLock;
  EMMailboxTypeResolver *v4;
  void *v5;

  p_mailboxTypeResolverLock = &self->_mailboxTypeResolverLock;
  os_unfair_lock_lock(&self->_mailboxTypeResolverLock);
  v4 = self->_mailboxTypeResolver;
  os_unfair_lock_unlock(p_mailboxTypeResolverLock);
  if (!v4)
  {
    -[EMThread repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxRepository");
    v4 = (EMMailboxTypeResolver *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSArray)ccList
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)brandIndicatorLocation
{
  return self->_brandIndicatorLocation;
}

- (EMCollectionItemID)itemID
{
  void *v2;
  void *v3;

  -[EMObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionItemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMCollectionItemID *)v3;
}

- (EMMessageRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMThread;
  -[EMRepositoryObject repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMThread.m"), 29, CFSTR("Wrong repository type"));

    }
  }
  return (EMMessageRepository *)v4;
}

- (void)setRepository:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMThread.m"), 29, CFSTR("Wrong repository type"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMThread;
  -[EMRepositoryObject setRepository:](&v7, sel_setRepository_, v5);

}

void __26__EMThread_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDisplayDate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_readLater"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setReadLater:", v5);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sendLaterDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSendLaterDate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_followUp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFollowUp:", v7);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCategory:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v12, CFSTR("EFPropertyKey_groupedSenderMessageListItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setGroupedSenderMessageListItems:", v13);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSubject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_summary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSummary:", v15);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_generatedSummary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setGeneratedSummary:", v16);

  v17 = *(void **)(a1 + 32);
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "decodeObjectOfClasses:forKey:", v21, CFSTR("EFPropertyKey_senderList"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSenderList:", v22);

  v23 = *(void **)(a1 + 32);
  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decodeObjectOfClasses:forKey:", v27, CFSTR("EFPropertyKey_toList"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setToList:", v28);

  v29 = *(void **)(a1 + 32);
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "decodeObjectOfClasses:forKey:", v33, CFSTR("EFPropertyKey_ccList"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCcList:", v34);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flags"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFlags:", v35);

  objc_msgSend(v47, "setHasUnflagged:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_hasUnflagged")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flagColors"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFlagColors:", v36);

  objc_msgSend(v47, "setIsVIP:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isVIP")));
  objc_msgSend(v47, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isBlocked")));
  objc_msgSend(v47, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_unsubscribeType")));
  objc_msgSend(v47, "setIsToMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isToMe")));
  objc_msgSend(v47, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isCCMe")));
  objc_msgSend(v47, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_hasAttachments")));
  objc_msgSend(v47, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_isAuthenticated")));
  v37 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "decodeObjectOfClasses:forKey:", v38, CFSTR("EFPropertyKey_conversationNotificationLevel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setConversationNotificationLevel:", objc_msgSend(v39, "integerValue"));

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_brandIndicatorLocation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBrandIndicatorLocation:", v40);

  objc_msgSend(v47, "setCount:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_count")));
  v41 = *(void **)(a1 + 32);
  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "decodeObjectOfClasses:forKey:", v44, CFSTR("EFPropertyKey_mailboxObjectIDs"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setMailboxObjectIDs:", v45);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayMessageItemID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDisplayMessageItemID:", v46);

}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (void)setToList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (void)setSummary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (void)setHasUnflagged:(BOOL)a3
{
  self->_hasUnflagged = a3;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (void)setFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (void)setDisplayMessageItemID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (void)setCcList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void)setSendLaterDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void)setReadLater:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void)setMailboxObjectIDs:(id)a3
{
  NSArray *v4;
  NSArray *mailboxObjectIDs;
  NSArray *mailboxes;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  if ((EFArraysAreEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v4;

    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    self->_isEditable = 0;
  }
  os_unfair_lock_unlock(&self->_mailboxesLock);

}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (void)setFollowUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void)setBrandIndicatorLocation:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorLocation, a3);
}

- (NSString)ef_publicDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  int64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  int64_t v21;
  const __CFString *v22;
  int64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  objc_super v47;
  objc_super v48;

  -[EMThread mailboxesIfAvailable](self, "mailboxesIfAvailable");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v40, "count");
  objc_msgSend(v40, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EMThread supportsArchiving](self, "supportsArchiving");
    NSStringFromBOOL();
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      -[EMThread shouldArchiveByDefault](self, "shouldArchiveByDefault");
      NSStringFromBOOL();
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v45 = CFSTR("?");
    if (v5)
      goto LABEL_3;
  }
  v44 = CFSTR("?");
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInternal");

  if (v7)
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 2);
    v28 = (void *)MEMORY[0x1E0CB3940];
    v48.receiver = self;
    v48.super_class = (Class)EMThread;
    -[EMObject ef_publicDescription](&v48, sel_ef_publicDescription);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread conversationID](self, "conversationID");
    EFStringWithInt64();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread subject](self, "subject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread senderList](self, "senderList");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringFromEmailAddressList:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread toList](self, "toList");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringFromEmailAddressList:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread ccList](self, "ccList");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringFromEmailAddressList:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D1EF48];
    -[EMThread summary](self, "summary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ec_partiallyRedactedStringForSubjectOrSummary:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread generatedSummary](self, "generatedSummary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ef_publicDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread flags](self, "flags");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EMThread conversationNotificationLevel](self, "conversationNotificationLevel");
    -[EMThread category](self, "category");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    EMShortStringForCategory(v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EMThread isVIP](self, "isVIP"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (-[EMThread isBlocked](self, "isBlocked"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = -[EMThread unsubscribeType](self, "unsubscribeType");
    -[EMThread date](self, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread displayDate](self, "displayDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread mailboxObjectIDs](self, "mailboxObjectIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[EMThread count](self, "count");
    -[EMThread displayMessageItemID](self, "displayMessageItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@\n\tConversationID:%@\n\tSubject:%@\n\tSenderList:%@\n\tToList:%@\n\tCCList:%@\n\tSummary:%@\n\tGenerated Summary:%@\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tCategory:%@\n\tIsVIP:%@\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tDisplayDate:%@\n\tMailboxes:%@\n\tCount:%lu\n\tSupportsArchiving:%@ \n\tShouldArchive:%@\n\tdisplayMessageItemID:%@"), v41, v43, v42, v37, v35, v33, v31, v27, v39, v9, v10, v11, v12, v13, v14, v15,
      v25,
      v16,
      v45,
      v44,
      v17);
    v29 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v29;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v47.receiver = self;
    v47.super_class = (Class)EMThread;
    -[EMObject ef_publicDescription](&v47, sel_ef_publicDescription);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[EMThread conversationID](self, "conversationID");
    -[EMThread flags](self, "flags");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "ef_publicDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[EMThread conversationNotificationLevel](self, "conversationNotificationLevel");
    if (-[EMThread isBlocked](self, "isBlocked"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = -[EMThread unsubscribeType](self, "unsubscribeType");
    -[EMThread date](self, "date");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@\n\tConversationID:%lld\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tCount:%lu\n\tSupportsArchiving:%@ \n\tShouldArchive:%@"), v46, v20, v43, v21, v22, v23, v42, -[EMThread count](self, "count"), v45, v44);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v18;
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)objc_getProperty(self, a2, 240, 1);
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (BOOL)supportsArchiving
{
  void *v2;
  BOOL v3;

  -[EMThread mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[EMMailbox supportsArchivingForMailboxes:](EMMailbox, "supportsArchivingForMailboxes:", v2);

  return v3;
}

- (NSArray)mailboxes
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    -[EMThread repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D1EEC0];
      -[EMThread repository](self, "repository");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailboxRepository");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMThread mailboxObjectIDs](self, "mailboxObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxesForObjectIDs:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "combine:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "result:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_filter:", *MEMORY[0x1E0D1ED88]);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[EMThread log](EMThread, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[EMBaseMessageListItem mailboxes].cold.1(v14);

      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v4;
}

- (NSArray)mailboxesIfAvailable
{
  os_unfair_lock_s *p_mailboxesLock;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    -[EMThread repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EMThread mailboxObjectIDs](self, "mailboxObjectIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mailboxesIfAvailableForObjectIDs:", v7);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[EMThread log](EMThread, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[EMBaseMessageListItem mailboxesIfAvailable].cold.1(v8);

      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v4;
}

- (int64_t)conversationID
{
  void *v2;
  int64_t v3;

  -[EMObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conversationID");

  return v3;
}

- (void)setMailboxTypeResolver:(id)a3
{
  EMMailboxTypeResolver *v4;
  EMMailboxTypeResolver *mailboxTypeResolver;

  v4 = (EMMailboxTypeResolver *)a3;
  os_unfair_lock_lock(&self->_mailboxTypeResolverLock);
  mailboxTypeResolver = self->_mailboxTypeResolver;
  self->_mailboxTypeResolver = v4;

  os_unfair_lock_unlock(&self->_mailboxTypeResolverLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMThread)initWithObjectID:(id)a3 originatingQuery:(id)a4 builder:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMThread *v12;
  EMThread *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMThread.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v16.receiver = self;
  v16.super_class = (Class)EMThread;
  v12 = -[EMQueryingCollection initWithObjectID:query:](&v16, sel_initWithObjectID_query_, v9, 0);
  v13 = v12;
  if (v12)
    -[EMThread _commonInitWithOriginatingQuery:builder:](v12, "_commonInitWithOriginatingQuery:builder:", v10, v11);

  return v13;
}

- (EMThread)initWithCoder:(id)a3
{
  id v4;
  EMThread *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMThread;
  v5 = -[EMQueryingCollection initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_originatingQuery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __26__EMThread_initWithCoder___block_invoke;
    v8[3] = &unk_1E70F6298;
    v9 = v4;
    -[EMThread _commonInitWithOriginatingQuery:builder:](v5, "_commonInitWithOriginatingQuery:builder:", v6, v8);

  }
  return v5;
}

- (void)_commonInitWithOriginatingQuery:(id)a3 builder:(id)a4
{
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_originatingQuery, a3);
  v6 = a4;
  self->_mailboxScopeLock._os_unfair_lock_opaque = 0;
  self->_mailboxTypeResolverLock._os_unfair_lock_opaque = 0;
  self->_mailboxesLock._os_unfair_lock_opaque = 0;
  v7 = v6;
  (*((void (**)(id, EMThread *))v6 + 2))(v6, self);

}

- (void)setMailboxes:(id)a3
{
  NSArray *v4;
  NSArray *mailboxes;
  NSArray *v6;
  NSArray *mailboxObjectIDs;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  v4 = (NSArray *)objc_msgSend(v8, "copy");
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;

  self->_isEditable = 0;
  os_unfair_lock_unlock(&self->_mailboxesLock);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __15__EMThread_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_39 != -1)
    dispatch_once(&log_onceToken_39, block);
  return (OS_os_log *)(id)log_log_39;
}

void __15__EMThread_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_39;
  log_log_39 = (uint64_t)v1;

}

- (id)changeFrom:(id)a3
{
  +[EMMessageListItemChange changeFrom:to:](EMMessageListItemChange, "changeFrom:to:", a3, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)debugDescription
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v32.receiver = self;
  v32.super_class = (Class)EMThread;
  -[EMObject debugDescription](&v32, sel_debugDescription);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread conversationID](self, "conversationID");
  EFStringWithInt64();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread subject](self, "subject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "debugDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread senderList](self, "senderList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "debugDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread toList](self, "toList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "debugDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread ccList](self, "ccList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "debugDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread summary](self, "summary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread generatedSummary](self, "generatedSummary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "debugDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread flags](self, "flags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  v13 = -[EMThread conversationNotificationLevel](self, "conversationNotificationLevel");
  -[EMThread category](self, "category");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EMThread isVIP](self, "isVIP"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v11 = v4;
  if (-[EMThread isBlocked](self, "isBlocked"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v10 = v5;
  v9 = -[EMThread unsubscribeType](self, "unsubscribeType");
  -[EMThread date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread displayDate](self, "displayDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread mailboxObjectIDs](self, "mailboxObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@\n\tConversationID:%@\n\tSubject:%@\n\tSenderList:%@\n\tToList:%@\n\tCCList:%@\n\tSummary:%@\n\tGenerated Summary:%@\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tCategory:%@\n\tIsVIP:%@\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tDisplayDate:%@\n\tMailboxes:%@\n\tCount:%lu"), v31, v30, v29, v28, v24, v22, v21, v20, v18, v13, v17, v11, v10, v9, v16, v12,
    v7,
    -[EMThread count](self, "count"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)query
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v12[24];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesInConversation:](EMMessageListItemPredicates, "predicateForMessagesInConversation:", -[EMThread conversationID](self, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3528]);
  -[EMQuery predicate](self->_originatingQuery, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithType:subpredicates:", 1, v6);

  +[EMThread log](EMThread, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[EMObject objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThread query].cold.1(v9, (uint64_t)v7, v12, v8);
  }

  -[EMQuery queryWithTargetClass:predicate:](self->_originatingQuery, "queryWithTargetClass:predicate:", objc_opt_class(), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)objectIDForItemID:(id)a3
{
  id v4;
  EMMessageObjectID *v5;
  void *v6;
  EMMessageObjectID *v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [EMMessageObjectID alloc];
    -[EMThread mailboxScope](self, "mailboxScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:](v5, "initWithCollectionItemID:mailboxScope:", v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)itemIDForObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMThread.m"), 459, CFSTR("Object ID of unrecognized type"));

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "collectionItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[EMThread mailboxScope](self, "mailboxScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setConversationID:(int64_t)a3
{
  -[EMThread doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMThread setConversationID:]", "EMThread.m", 483, "0");
}

- (EFFuture)displayMessage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  -[EMThread displayMessageObjectID](self, "displayMessageObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThread repository](self, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageForObjectID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __26__EMThread_displayMessage__block_invoke;
  v14[3] = &unk_1E70F62C0;
  v14[4] = self;
  v7 = v3;
  v15 = v7;
  objc_msgSend(v5, "recover:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __26__EMThread_displayMessage__block_invoke_133;
  v12[3] = &unk_1E70F62E8;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "then:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v10;
}

id __26__EMThread_displayMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayMessageObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "em_isItemNotFoundError") || *(void **)(a1 + 40) == v4)
  {
    +[EMThread log](EMThread, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "displayMessageObjectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "displayMessageItemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_error_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithError:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EMThread log](EMThread, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v4;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@\nre-trying request for displayMessage: objectID: %{public}@, updatedObjectID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "displayMessage");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

id __26__EMThread_displayMessage__block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EMThread log](EMThread, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "displayMessageObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "displayMessageItemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, message isNull", (uint8_t *)&v12, 0x20u);

    }
    v5 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)deleteMovesToTrash
{
  void *v2;
  BOOL v3;

  -[EMThread mailboxes](self, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v2);

  return v3;
}

- (BOOL)shouldArchiveByDefault
{
  void *v3;
  BOOL v4;

  if (!-[EMThread supportsArchiving](self, "supportsArchiving"))
    return 0;
  -[EMThread mailboxes](self, "mailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[EMMailbox shouldArchiveByDefaultForMailboxes:](EMMailbox, "shouldArchiveByDefaultForMailboxes:", v3);

  return v4;
}

- (BOOL)isEditable
{
  unint64_t isEditable;
  void *v4;
  int v5;

  isEditable = self->_isEditable;
  if (!isEditable)
  {
    -[EMThread mailboxes](self, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_52);

    isEditable = 1;
    if (v5)
      isEditable = 2;
    self->_isEditable = isEditable;
  }
  return isEditable == 2;
}

BOOL __22__EMThread_isEditable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 5 || objc_msgSend(v2, "type") == 6;

  return v3;
}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
{
  +[EMMessageListChangeObserverHelper collection:notifyChangeObserversAboutChangedItemIDs:extraInfo:](EMMessageListChangeObserverHelper, "collection:notifyChangeObserversAboutChangedItemIDs:extraInfo:", self, a3, a4);
}

- (NSArray)groupedSenderMessageListItems
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (EMGeneratedSummary)generatedSummary
{
  return (EMGeneratedSummary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setGeneratedSummary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (EMCategory)category
{
  return (EMCategory *)objc_getProperty(self, a2, 320, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (void)query
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1B99BB000, log, OS_LOG_TYPE_DEBUG, "Predicate for Thread ObjectID %@: %@", buf, 0x16u);

}

@end

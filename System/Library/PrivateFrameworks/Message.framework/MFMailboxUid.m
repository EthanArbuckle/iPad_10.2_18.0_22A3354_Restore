@implementation MFMailboxUid

- (BOOL)setChildren:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  if (-[MFMailboxUid isValid](self, "isValid"))
    v4 = -[MFMailboxUid mutableCopyOfChildren](self, "mutableCopyOfChildren");
  else
    v4 = 0;
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects");
  if (objc_msgSend(v23, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = v23;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v5);
          bindParentAndChild(self, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v6);
    }

    if (!v4 || (objc_msgSend(v4, "isEqualToArray:", v5) & 1) == 0)
    {
      v9 = 1;
LABEL_17:
      v22 = v9;
      goto LABEL_19;
    }
  }
  else if (v4)
  {
    v9 = objc_msgSend(v4, "count") != 0;
    goto LABEL_17;
  }
  v22 = 0;
LABEL_19:
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "arrayByApplyingSelector:", sel_URLStringNonNil);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByApplyingSelector:", sel_fullPathNonNil);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(v4, "count");
    -[MFMailboxUid account](self, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 0;
      v13 = (void *)*MEMORY[0x1E0C9B0D0];
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 != v13)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("URLString"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("MailboxUidDidBecomeInvalidNotification"), v14, v16);

          if (objc_msgSend(v14, "isStore"))
          {
            objc_msgSend(v27, "mailboxUidForURL:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (!v18 || (objc_msgSend(v18, "isValid") & 1) == 0)
            {
              objc_msgSend(v26, "addObject:", v15);
              objc_msgSend(v24, "objectAtIndex:", v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v20);

            }
          }

        }
        ++v12;
      }
      while (v11 != v12);
    }
    if (objc_msgSend(v26, "count"))
      objc_msgSend(v27, "_mailboxesWereRemovedFromTree:withFileSystemPaths:", v26, v25);

  }
  return v22;
}

- (BOOL)isStore
{
  return (self->_attributes & 2) == 0;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[MFMailboxUid rootMailbox](self, "rootMailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)URLStringNonNil
{
  id v2;

  -[MFMailboxUid URLString](self, "URLString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (id)*MEMORY[0x1E0C9B0D0];
  return v2;
}

- (NSString)URLString
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMailboxUid criterion](self, "criterion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "criterionType") == 23)
  {
    objc_msgSend(v2, "expression");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)criterion
{
  MFMessageCriterion *criterion;
  MFMessageCriterion **p_criterion;
  MFMessageCriterion *v5;
  void *v6;
  void *v7;
  void *v8;
  MFMessageCriterion *v9;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  p_criterion = &self->_criterion;
  criterion = self->_criterion;
  if (criterion)
    v5 = criterion;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  if (!criterion)
  {
    -[MFMailboxUid ancestralAccount](self, "ancestralAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailboxUid URLWithAccount:](self, "URLWithAccount:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMailboxUid mf_lock](self, "mf_lock");
    if (*p_criterion || !v8)
    {
      criterion = *p_criterion;
    }
    else
    {
      +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v8);
      v9 = (MFMessageCriterion *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_criterion, v9);
      criterion = v9;
    }
    -[MFMailboxUid mf_unlock](self, "mf_unlock");

  }
  return criterion;
}

+ (id)fullPathForAccount:(id)a3 mailbox:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mailboxPathPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mf_lock");
  _stringByAppendingPathComponents(v6, v5, 0, v7, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mf_unlock");

  return v10;
}

- (id)childWithName:(id)a3
{
  _MFChildWithPredicate(self, (unsigned int (*)(void *, uint64_t))mailboxHasName, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  int64_t mailboxID;
  uint64_t v6;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mailboxID = self->_mailboxID;
    v6 = v4[2];
    if (mailboxID == *MEMORY[0x1E0D1DC08] || v6 == *MEMORY[0x1E0D1DC08])
    {
      -[MFMailboxUid URL](self, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = mailboxID == v6;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSURL)URL
{
  void *v3;
  void *v4;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid URLWithAccount:](self, "URLWithAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)URLWithAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v4, CFSTR("Account"), v6, CFSTR("RelativePath"), 0);

  +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)accountRelativePath
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mailboxPathPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid mf_lock](self, "mf_lock");
  _stringByAppendingPathComponents(self, v3, 0, &stru_1E4F1C8F8, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

  return (NSString *)v5;
}

- (id)topMailbox
{
  MFMailboxUid *i;
  void *v3;
  MFMailboxUid *v4;

  for (i = self; ; i = v4)
  {
    -[MFMailboxUid parent](i, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    v4 = v3;

  }
  return i;
}

- (MFMailboxUid)parent
{
  return (MFMailboxUid *)-[MFWeakReferenceHolder reference](self->_parent, "reference");
}

- (MailAccount)account
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  -[MFMailboxUid rootMailbox](self, "rootMailbox");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  else
    WeakRetained = 0;

  return (MailAccount *)WeakRetained;
}

- (id)rootMailbox
{
  _BYTE *v2;

  -[MFMailboxUid topMailbox](self, "topMailbox");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if ((v2[144] & 0x10) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (int64_t)mailboxType
{
  return (int)atomic_load((unsigned int *)&self->_type);
}

- (NSString)name
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  MFWeakReferenceHolder *parent;

  if ((self->_attributes & 0x10) != 0)
  {
    -[MFMailboxUid account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)-[MFWeakReferenceHolder retainedReference](self->_parent, "retainedReference");
    if (!v3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("*** Orphaned mailbox %@"), v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      parent = self->_parent;
      self->_parent = 0;

      goto LABEL_6;
    }
    -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_6:

  return (NSString *)v5;
}

- (void)addToPostOrderTraversal:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "addToPostOrderTraversal:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  objc_msgSend(v4, "addObject:", self);

}

- (id)childWithExtraAttribute:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    _MFChildWithPredicate(self, (unsigned int (*)(void *, uint64_t))mailboxHasExtraAttribute, (uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyOfChildren
{
  void *v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (void *)-[NSMutableArray mutableCopy](self->_children, "mutableCopy");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (NSArray)extraAttributes
{
  return self->_extraAttributes;
}

- (id)uniqueId
{
  return self->uniqueId;
}

- (id)fullPathNonNil
{
  id v2;

  -[MFMailboxUid fullPath](self, "fullPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (id)*MEMORY[0x1E0C9B0D0];
  return v2;
}

- (id)fullPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MFMailboxUid account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullPathForAccount:mailbox:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSEnumerator)childEnumerator
{
  return (NSEnumerator *)-[MFMailboxUid childEnumeratorIncludingHiddenChildren:](self, "childEnumeratorIncludingHiddenChildren:", 1);
}

- (void)setMailboxType:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = -[MFMailboxUid mailboxType](self, "mailboxType");
  if (!a3 && v5 == 7)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailboxUid setMailboxType:].cold.1(v7, v8, v6);
    }

  }
  atomic_store(a3, (unsigned int *)&self->_type);
}

- (id)descendantWithExtraAttribute:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    _MFDescendantWithPredicate(self, (uint64_t (*)(void *, uint64_t))mailboxHasExtraAttribute, (uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isContainer
{
  return (self->_attributes & 1) == 0;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  -[MFMailboxUid _privacySafeDescription](self, "_privacySafeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0D1EF48];
    -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partiallyRedactedStringForString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" relativePath=%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (BOOL)hasChildren
{
  unint64_t v3;
  BOOL v4;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  if ((self->_attributes & 0x10) != 0)
    v3 = self->_attributes & 0x10;
  else
    v3 = -[NSMutableArray count](self->_children, "count");
  v4 = v3 != 0;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v4;
}

- (id)_privacySafeDescription
{
  void *v3;
  uint64_t v4;
  int64_t mailboxID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  mailboxID = self->_mailboxID;
  NSStringFromMailboxUidType(-[MFMailboxUid mailboxType](self, "mailboxType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> ID=%lld type=%@ attributes=%lu"), v4, self, mailboxID, v6, -[MFMailboxUid attributes](self, "attributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ancestralAccount
{
  MFMailboxUid *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  do
  {
    if ((-[MFMailboxUid attributes](v2, "attributes") & 0x10) != 0)
      break;
    -[MFMailboxUid parent](v2, "parent");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (MFMailboxUid *)v3;
  }
  while (v3);
  -[MFMailboxUid account](v2, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6 type:(int64_t)a7
{
  unsigned int v7;
  id v12;
  id v13;
  id v14;
  MFMailboxUid *v15;
  uint64_t v16;
  NSArray *extraAttributes;
  MFMailboxUid *v18;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = -[MFMailboxUid _initWithName:attributes:forAccount:](self, "_initWithName:attributes:forAccount:", v12, a4, v13);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    extraAttributes = v15->_extraAttributes;
    v15->_extraAttributes = (NSArray *)v16;

    atomic_store(v7, (unsigned int *)&v15->_type);
    v18 = v15;
  }

  return v15;
}

- (id)_initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5
{
  id v8;
  id v9;
  MFMailboxUid *v10;
  uint64_t v11;
  NSString *pathComponent;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = -[MFMailboxUid init](self, "init");
    if (v10)
    {
      v11 = objc_msgSend(v8, "copy");
      pathComponent = v10->_pathComponent;
      v10->_pathComponent = (NSString *)v11;

LABEL_5:
      v10->_attributes = a4;
    }
  }
  else
  {
    v10 = -[MFMailboxUid initWithAccount:](self, "initWithAccount:", v9);
    if (v10)
      goto LABEL_5;
  }

  return v10;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6
{
  return -[MFMailboxUid initWithName:attributes:forAccount:extraAttributes:type:](self, "initWithName:attributes:forAccount:extraAttributes:type:", a3, a4, a5, a6, 0);
}

- (MFMailboxUid)init
{
  MFMailboxUid *v2;
  void *v3;
  uint64_t v4;
  NSString *uniqueId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailboxUid;
  v2 = -[MFMailboxUid init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uniqueId = v2->uniqueId;
    v2->uniqueId = (NSString *)v4;

    v2->_mailboxID = *MEMORY[0x1E0D1DC08];
    atomic_store(0, (unsigned int *)&v2->_type);
    atomic_store(0, &v2->_isSendLater);
    v2->_ivarLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (MFMailboxUid)initWithAccount:(id)a3
{
  id v4;
  MFMailboxUid *v5;
  MFMailboxUid *v6;

  v4 = a3;
  v5 = -[MFMailboxUid init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_account, v4);
    v6->_attributes = 18;
  }

  return v6;
}

- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3
{
  return -[_MFMailboxUidChildrenEnumerator _initWithMailbox:includeHiddenChildren:]([_MFMailboxUidChildrenEnumerator alloc], "_initWithMailbox:includeHiddenChildren:", self, a3);
}

- (int64_t)type
{
  return ECMailboxTypeFromMailboxUidType(-[MFMailboxUid mailboxType](self, "mailboxType"));
}

- (id)_mutableChildren
{
  void *v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (void *)-[NSMutableArray mutableCopy](self->_children, "mutableCopy");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)representedAccount
{
  MailAccount *representedAccount;
  MailAccount *v4;
  MailAccount *v5;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  representedAccount = self->_representedAccount;
  if (representedAccount)
  {
    v4 = representedAccount;
  }
  else
  {
    -[MFMailboxUid account](self, "account");
    v4 = (MailAccount *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (EMMailboxObjectID)objectID
{
  os_unfair_lock_s *p_ivarLock;
  EMMailboxObjectID *objectID;
  EMMailboxObjectID **p_objectID;
  EMMailboxObjectID *v6;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  p_objectID = &self->_objectID;
  objectID = self->_objectID;
  if (objectID)
  {
    v6 = objectID;
    os_unfair_lock_unlock(p_ivarLock);
    return v6;
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
    -[MFMailboxUid URLString](self, "URLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v9);
      os_unfair_lock_lock(p_ivarLock);
      objc_storeStrong((id *)p_objectID, v10);
      os_unfair_lock_unlock(p_ivarLock);

    }
    else
    {
      +[MFMailboxUid log](MFMailboxUid, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[MFMailboxUid account](self, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ef_publicDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailboxUid ef_publicDescription](self, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "No URL for mailbox. Account: %@ Mailbox: %@", (uint8_t *)&v15, 0x16u);

      }
      v10 = 0;
    }

    return (EMMailboxObjectID *)v10;
  }
}

- (id)displayNameUsingSpecialNames
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[MFMailboxUid mailboxType](self, "mailboxType");
  -[MFMailboxUid account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameUsingSpecialNamesForMailboxUid:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "specialNameForType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[MFMailboxUid displayName](self, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[MailAccount displayName](self->_representedAccount, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
  {
    v7 = v3;
  }
  else
  {
    -[MFMailboxUid account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((self->_attributes & 0x10) != 0)
    {
      objc_msgSend(v4, "displayName");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
      {
        -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_pathComponentForUidName:", v6);
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("*** Orphaned mailbox %@"), v6);
      }
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v7;
}

+ (id)specialNameForType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  switch(a3)
  {
    case 1:
      v3 = CFSTR("JUNK_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Junk");
      goto LABEL_11;
    case 2:
      v3 = CFSTR("ARCHIVE_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Archive");
      goto LABEL_11;
    case 3:
      v3 = CFSTR("TRASH_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Trash");
      goto LABEL_11;
    case 4:
      v3 = CFSTR("SENT_MESSAGES_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Sent");
      goto LABEL_11;
    case 5:
      v3 = CFSTR("DRAFTS_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Drafts");
      goto LABEL_11;
    case 6:
      v3 = CFSTR("OUTBOX_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Outbox");
      goto LABEL_11;
    case 7:
      v3 = CFSTR("INBOX_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Inbox");
LABEL_11:
      MFLookupLocalizedString(v3, v4, CFSTR("Message"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isSendLaterMailbox
{
  unint64_t v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = atomic_load(&self->_isSendLater);
  if (!v2)
  {
    +[LocalAccount localAccount](LocalAccount, "localAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailboxUid account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v5)
    {
      objc_msgSend(v5, "sendLaterFolderShouldCreate:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailboxUid URL](self, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
        v2 = 2;
      else
        v2 = 1;

    }
    else
    {
      v2 = 1;
    }
    atomic_store(v2, &self->_isSendLater);

  }
  return v2 == 2;
}

- (id)store
{
  void *v3;
  void *v4;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storeForMailboxUid:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[MFLibraryStore storeWithMailbox:](MFLibraryStore, "storeWithMailbox:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSEnumerator)depthFirstEnumerator
{
  void *v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (void *)objc_msgSend(objc_allocWithZone((Class)_MFMailboxUidEnumerator), "initWithMailbox:", self);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return (NSEnumerator *)v3;
}

- (id)redactedName:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[MFMailboxUid isStandardizedMailboxUid](self, "isStandardizedMailboxUid"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isStandardizedMailboxUid
{
  return +[MFMailboxUid isStandardizedMailboxUidType:](MFMailboxUid, "isStandardizedMailboxUidType:", -[MFMailboxUid mailboxType](self, "mailboxType"));
}

+ (BOOL)isStandardizedMailboxUidType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 7;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__MFMailboxUid_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (id)log_log_5;
}

void __19__MFMailboxUid_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

+ (id)defaultScheduler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MFMailboxUid_defaultScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultScheduler_onceToken != -1)
    dispatch_once(&defaultScheduler_onceToken, block);
  return (id)defaultScheduler_scheduler;
}

void __32__MFMailboxUid_defaultScheduler__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0D1F070];
  NSStringFromClass(*(Class *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serialDispatchQueueSchedulerWithName:qualityOfService:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultScheduler_scheduler;
  defaultScheduler_scheduler = v2;

}

+ (id)fileURLForMailboxURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dictionaryRepresentation
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[MFMailboxUid attributes](self, "attributes");
  v4 = (void *)MEMORY[0x1E0C99E08];
  -[MFMailboxUid name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("MailboxName"), v6, CFSTR("MailboxAttributes"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v3 & 1) == 0)
  {
    -[MFMailboxUid children](self, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "dictionaryRepresentation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MailboxChildren"));
    }

  }
  -[MFMailboxUid extraAttributes](self, "extraAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("MailboxExtraAttributes"));

  return v7;
}

- (id)pathComponent
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 35;
    os_unfair_lock_lock(a1 + 35);
    v1 = (id *)objc_msgSend(v1[4], "copy");
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (NSString)decodedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((self->_attributes & 0x10) != 0)
  {
    objc_msgSend(v3, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_pathComponentForUidName:", v5);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("*** Orphaned mailbox %@"), v5);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (BOOL)isRootMailbox
{
  return (LOBYTE(self->_attributes) >> 4) & 1;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *pathComponent;
  NSString *realFullPath;
  void *v7;
  MFMessageCriterion *criterion;
  id v9;

  v9 = a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  os_unfair_lock_lock(&self->_ivarLock);
  if ((objc_msgSend(v9, "isEqual:", self->_pathComponent) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    pathComponent = self->_pathComponent;
    self->_pathComponent = v4;

    realFullPath = self->_realFullPath;
    self->_realFullPath = 0;

    os_unfair_lock_unlock(&self->_ivarLock);
    -[MFMailboxUid URLString](self, "URLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      criterion = self->_criterion;
      self->_criterion = 0;

    }
  }
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

}

- (id)accountDisplayName
{
  void *v2;
  void *v3;

  -[MFMailboxUid representedAccount](self, "representedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid URLString](self, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "serverUnreadOnlyOnServerCountForMailbox:", v5);

  return v6;
}

- (unint64_t)unreadCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid URLString](self, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "unreadCountForMailbox:", v5);

  return v6;
}

- (void)updateMostRecentStatusCount:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  objc_msgSend((id)objc_opt_class(), "defaultScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MFMailboxUid_updateMostRecentStatusCount___block_invoke;
  v6[3] = &unk_1E4E89DD0;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

void __44__MFMailboxUid_updateMostRecentStatusCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "library");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "mostRecentStatusCountForMailbox:", v3) != *(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setMostRecentStatusCount:forMailbox:");

}

- (BOOL)shouldUseNonDeletedForUnreadCount
{
  int64_t v2;

  v2 = -[MFMailboxUid mailboxType](self, "mailboxType");
  return (unint64_t)(v2 - 5) < 2 || (unint64_t)(v2 - 105) < 2;
}

- (unint64_t)numberOfChildren
{
  unint64_t v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = -[NSMutableArray count](self->_children, "count");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (unint64_t)numberOfDescendants
{
  NSMutableArray *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_children;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "numberOfDescendants", (_QWORD)v9) + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v4;
}

- (id)childAtIndex:(unint64_t)a3
{
  void *v5;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (unint64_t)indexOfChild:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v5 = -[NSMutableArray indexOfObject:](self->_children, "indexOfObject:", v4);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

  return v5;
}

- (void)sortChildren
{
  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[NSMutableArray sortUsingFunction:context:](self->_children, "sortUsingFunction:context:", MFCompareMailboxUids, -[MFMailboxUid account](self, "account"));
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)removeChild:(id)a3
{
  id v4;

  v4 = a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[NSMutableArray removeObject:](self->_children, "removeObject:", v4);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  MFMessageCriterion *criterion;
  id v7;

  v7 = a3;
  -[MFMailboxUid parent](self, "parent");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    bindParentAndChild(v7, self);
    -[MFMailboxUid mf_lock](self, "mf_lock");
    -[MFMailboxUid URLString](self, "URLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      criterion = self->_criterion;
      self->_criterion = 0;

    }
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }

}

- (void)flushCriteria
{
  MFMessageCriterion *criterion;
  EMMailboxObjectID *objectID;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  criterion = self->_criterion;
  self->_criterion = 0;

  objectID = self->_objectID;
  self->_objectID = 0;

  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)setRepresentedAccount:(id)a3
{
  MailAccount *v5;

  v5 = (MailAccount *)a3;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  if (self->_representedAccount != v5)
    objc_storeStrong((id *)&self->_representedAccount, a3);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MFMailboxUid *v7;

  -[MFMailboxUid rootMailbox](self, "rootMailbox");
  v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    objc_storeWeak((id *)&self->_account, 0);
    self->_attributes &= ~0x10uLL;
  }
  -[MFMailboxUid parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChild:", self);

  if (v7)
  {
    -[MFMailboxUid URLString](self, "URLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("URLString"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MailboxUidDidBecomeInvalidNotification"), self, v5);

  }
}

- (BOOL)isSpecialMailboxUid
{
  MFMailboxUid *v2;
  void *v3;

  v2 = self;
  -[MFMailboxUid account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isSpecialMailbox:", v2);

  return (char)v2;
}

- (BOOL)isSentMailboxUid
{
  return objc_msgSend((id)objc_opt_class(), "isSentMailboxType:", -[MFMailboxUid mailboxType](self, "mailboxType"));
}

+ (BOOL)isOutgoingMailboxType:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 3 || (unint64_t)(a3 - 104) < 3;
}

+ (BOOL)isDraftsMailboxType:(int64_t)a3
{
  return a3 == 5 || a3 == 105;
}

+ (BOOL)isSentMailboxType:(int64_t)a3
{
  return a3 == 4 || a3 == 104;
}

+ (BOOL)typeIsValidTransferDestination:(int64_t)a3
{
  char v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_opt_class(), "isOutgoingMailboxType:", a3);
  v5 = a3 != 8;
  if (a3 == -100)
    v5 = 0;
  if (a3 == -500)
    v5 = 0;
  return (v4 & 1) == 0 && v5;
}

- (BOOL)isOutgoingMailboxUid
{
  return objc_msgSend((id)objc_opt_class(), "isOutgoingMailboxType:", -[MFMailboxUid mailboxType](self, "mailboxType"));
}

- (BOOL)isNotesMailboxUid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[MFMailboxUid name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Notes")))
  {
    -[MFMailboxUid parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailboxUid account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootMailbox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  EFAtomicSetOnceObjectRelease();
  v3.receiver = self;
  v3.super_class = (Class)MFMailboxUid;
  -[MFMailboxUid dealloc](&v3, sel_dealloc);
}

- (MFMailboxUserInfo)userInfo
{
  void *v2;

  if ((-[MFMailboxUid attributes](self, "attributes") & 0x10) != 0)
  {
    v2 = 0;
  }
  else
  {
    EFAtomicSetOnceObjectLoad();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MFMailboxUserInfo *)v2;
}

MFMailboxUserInfo *__24__MFMailboxUid_userInfo__block_invoke(uint64_t a1)
{
  MFMailboxUserInfo *v2;
  void *v3;
  MFMailboxUserInfo *v4;

  v2 = [MFMailboxUserInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "userInfoFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFMailboxUserInfo initWithFileURL:](v2, "initWithFileURL:", v3);

  return v4;
}

- (id)userInfoFileURL
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMailboxUid fullPath](self, "fullPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)realFullPath
{
  NSString *realFullPath;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  realFullPath = self->_realFullPath;
  if (!realFullPath)
  {
    -[MFMailboxUid fullPath](self, "fullPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mf_betterStringByResolvingSymlinksInPath");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_realFullPath;
    self->_realFullPath = v5;

    realFullPath = self->_realFullPath;
  }
  v7 = realFullPath;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v7;
}

- (id)pathRelativeToMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[MFMailboxUid account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _stringByAppendingPathComponents(self, v5, v4, &stru_1E4F1C8F8, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pathRelativeToMailboxForDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[MFMailboxUid account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v5, v4, &stru_1E4F1C8F8, 0, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)oldURLString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[MFMailboxUid ancestralAccount](self, "ancestralAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("Account"), v5, CFSTR("RelativePath"), v6, CFSTR("IncludeDefaultSecurePortNumber"), 0);

  +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)databaseID
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;

  result = self->_mailboxID;
  if (result == *MEMORY[0x1E0D1DC08])
  {
    -[MFMailboxUid URLString](self, "URLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[MFMailboxUid account](self, "account");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "library");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_mailboxID = objc_msgSend(v6, "mailboxIDForURLString:", v4);

    }
    return self->_mailboxID;
  }
  return result;
}

- (NSString)persistentID
{
  -[MFMailboxUid databaseID](self, "databaseID");
  return (NSString *)EFStringWithInt64();
}

- (int64_t)compareWithMailboxUid:(id)a3
{
  return MFCompareMailboxUids(self, a3, 0);
}

- (BOOL)isDescendantOfMailbox:(id)a3
{
  MFMailboxUid *v4;
  MFMailboxUid *v5;
  MFMailboxUid *v6;
  MFMailboxUid *v7;
  BOOL v8;

  v4 = (MFMailboxUid *)a3;
  v5 = self;
  if (v5)
  {
    v6 = v5;
    do
    {
      -[MFMailboxUid parent](v6, "parent");
      v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue();

      v8 = v6 == v4;
      if (v6 == v4)
        break;
      v6 = v7;
    }
    while (v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMailboxUid _privacySafeDescription](self, "_privacySafeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" relativePath=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isVisible
{
  return -[MFMailboxUid mailboxType](self, "mailboxType") == 0;
}

- (id)userInfoObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMailboxUid userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6;
  int *p_isChangingUserInfo;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_isChangingUserInfo = &self->_isChangingUserInfo;
  do
    v8 = __ldaxr((unsigned int *)p_isChangingUserInfo);
  while (__stlxr(v8 + 1, (unsigned int *)p_isChangingUserInfo));
  -[MFMailboxUid userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v6);

  if (!v8)
    -[MFMailboxUid didChangeUserInfo](self, "didChangeUserInfo");
  do
    v10 = __ldaxr((unsigned int *)p_isChangingUserInfo);
  while (__stlxr(v10 - 1, (unsigned int *)p_isChangingUserInfo));

}

- (BOOL)userInfoBoolForKey:(id)a3
{
  void *v3;
  char v4;

  -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v6, v7);

}

- (BOOL)isShared
{
  return LOBYTE(self->_attributes) >> 7;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  void *v2;
  char v3;

  -[MFMailboxUid account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRestoreMessagesAfterFailedDelete");

  return v3;
}

- (BOOL)alwaysWriteFullMessageFile
{
  return -[MFMailboxUid isSendLaterMailbox](self, "isSendLaterMailbox")
      || -[MFMailboxUid mailboxType](self, "mailboxType") == 6;
}

- (unint64_t)suggestionsLostMessageSearchResultCount
{
  void *v2;
  unint64_t v3;

  -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("suggestionsLostMessageSearchResultCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)suggestionsLostMessageSearchTimestamp
{
  void *v2;
  double v3;
  double v4;

  -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("suggestionsLostMessageSearchTimestamp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");

}

- (void)setExtraAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extraAttributes, a3);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return (EDMailboxPersistence *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_pendingLevel, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_realFullPath, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_representedAccount, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_pathComponent, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->uniqueId, 0);
}

- (MFInvocationQueue)attachmentDownloadQueue
{
  MFInvocationQueue *v3;

  objc_getAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue);
  v3 = (MFInvocationQueue *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MFInvocationQueue);
    objc_setAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue, v3, (void *)0x301);
  }
  return v3;
}

- (void)setMailboxType:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "change in mailbox type [Inbox -> Generic]: %@", buf, 0xCu);

}

@end

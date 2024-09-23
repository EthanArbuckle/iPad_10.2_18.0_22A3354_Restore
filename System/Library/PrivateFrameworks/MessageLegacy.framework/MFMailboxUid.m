@implementation MFMailboxUid

- (NSArray)extraAttributes
{
  return self->_extraAttributes;
}

- (id)URLStringNonNil
{
  id result;

  result = -[MFMailboxUid URLString](self, "URLString");
  if (!result)
    return (id)*MEMORY[0x1E0C9B0D0];
  return result;
}

- (id)URLString
{
  id v2;
  void *v3;

  v2 = -[MFMailboxUid criterion](self, "criterion");
  if (objc_msgSend(v2, "criterionType") == 22)
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "expression"), "copy");
  else
    v3 = 0;
  return v3;
}

- (id)criterion
{
  MFMessageCriterion *criterion;
  MFMessageCriterion *v4;
  id v5;
  MFMessageCriterion *v6;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  criterion = self->_criterion;
  if (criterion)
  {
    v4 = criterion;
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
    if (v4)
      return v4;
  }
  else
  {
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }
  v5 = -[MFMailboxUid URLStringWithAccount:](self, "URLStringWithAccount:", -[MFMailboxUid ancestralAccount](self, "ancestralAccount"));
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v6 = self->_criterion;
  if (v6 || !v5)
  {
    v4 = v6;
  }
  else
  {
    v4 = +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v5);
    self->_criterion = v4;
  }
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v4;
}

- (id)ancestralAccount
{
  do
  {
    if ((-[MFMailboxUid attributes](self, "attributes") & 0x10) != 0)
      break;
    self = -[MFMailboxUid parent](self, "parent");
  }
  while (self);
  return -[MFMailboxUid account](self, "account");
}

- (unsigned)attributes
{
  return self->_attributes;
}

- (id)childWithName:(id)a3
{
  return (id)_MFChildWithPredicate(self, (uint64_t (*)(uint64_t, uint64_t))mailboxHasName, (uint64_t)a3);
}

- (id)childWithExtraAttribute:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "length");
  if (result)
    return (id)_MFChildWithPredicate(self, (uint64_t (*)(uint64_t, uint64_t))mailboxHasExtraAttribute, (uint64_t)a3);
  return result;
}

- (id)displayNameUsingSpecialNames
{
  uint64_t v3;
  id result;

  v3 = -[MFMailboxUid type](self, "type");
  result = (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "displayNameUsingSpecialNamesForMailboxUid:", self);
  if (!result)
  {
    result = (id)objc_msgSend((id)objc_opt_class(), "specialNameForType:", v3);
    if (!result)
      return -[MFMailboxUid displayName](self, "displayName");
  }
  return result;
}

- (id)displayName
{
  id v3;
  id v4;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = -[MailAccount displayName](self->_representedAccount, "displayName");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  if (v3 && !objc_msgSend(v3, "isEqualToString:", &stru_1E81CBE50))
    return v3;
  v4 = -[MFMailboxUid account](self, "account");
  if ((self->_attributes & 0x10) != 0)
    return (id)objc_msgSend(v4, "displayName");
  if (v4)
    return (id)objc_msgSend(v4, "_pathComponentForUidName:", self->_pathComponent);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Orphaned mailbox %@"), self->_pathComponent);
}

+ (id)specialNameForType:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id result;

  switch(a3)
  {
    case 1:
      v3 = CFSTR("JUNK_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Junk");
      goto LABEL_10;
    case 2:
      v3 = CFSTR("ARCHIVE_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Archive");
      goto LABEL_10;
    case 3:
      v3 = CFSTR("TRASH_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Trash");
      goto LABEL_10;
    case 4:
      v3 = CFSTR("SENT_MESSAGES_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Sent");
      goto LABEL_10;
    case 5:
      v3 = CFSTR("DRAFTS_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Drafts");
      goto LABEL_10;
    case 6:
      v3 = CFSTR("OUTBOX_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Outbox");
      goto LABEL_10;
    case 7:
      v3 = CFSTR("INBOX_SPECIAL_MAILBOX_NAME");
      v4 = CFSTR("Inbox");
LABEL_10:
      result = (id)MFLookupLocalizedString((uint64_t)v3, (uint64_t)v4, 0);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)representedAccount
{
  MailAccount *representedAccount;
  MailAccount *v4;
  MailAccount *v5;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  representedAccount = self->_representedAccount;
  if (representedAccount)
    v4 = representedAccount;
  else
    v4 = -[MFMailboxUid account](self, "account");
  v5 = v4;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)accountRelativePath
{
  id v3;
  void *v4;
  id v5;

  v3 = -[MFMailboxUid account](self, "account");
  v4 = (void *)objc_msgSend(v3, "_mailboxPathPrefix");
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v5 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, &stru_1E81CBE50, v4, 0, 0);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)fullPathNonNil
{
  id result;

  result = -[MFMailboxUid fullPath](self, "fullPath");
  if (!result)
    return (id)*MEMORY[0x1E0C9B0D0];
  return result;
}

- (id)fullPath
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[MFMailboxUid account](self, "account");
  v4 = (void *)objc_msgSend(v3, "path");
  v5 = objc_msgSend(v3, "mailboxPathExtension");
  v6 = (void *)objc_msgSend(v3, "_mailboxPathPrefix");
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v7 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, v4, v6, v5, 0);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v7;
}

- (BOOL)setChildren:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  BOOL v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MFMailboxUid mf_lock](self, "mf_lock");
  if (-[MFMailboxUid isValid](self, "isValid"))
    v5 = -[MFMailboxUid mutableCopyOfChildren](self, "mutableCopyOfChildren");
  else
    v5 = 0;
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects");
  if (objc_msgSend(a3, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(a3);
          bindParentAndChild(self, *(id **)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }
    if (!v5 || (objc_msgSend(v5, "isEqualToArray:", a3) & 1) == 0)
    {
      v10 = 1;
      goto LABEL_18;
    }
  }
  else if (v5)
  {
    v10 = objc_msgSend(v5, "count") != 0;
    goto LABEL_18;
  }
  v10 = 0;
LABEL_18:
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  if (objc_msgSend(v5, "count"))
  {
    v23 = v10;
    v11 = (void *)objc_msgSend(v5, "arrayByApplyingSelector:", sel_URLStringNonNil);
    v24 = (void *)objc_msgSend(v5, "arrayByApplyingSelector:", sel_fullPathNonNil);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend(v5, "count");
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *MEMORY[0x1E0C9B0D0];
      do
      {
        v17 = (void *)objc_msgSend(v5, "objectAtIndex:", v15);
        if (!objc_msgSend(v17, "parent"))
        {
          v18 = objc_msgSend(v11, "objectAtIndex:", v15);
          if (v18 != v16)
          {
            v19 = v18;
            v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v18, CFSTR("URLString"));
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailboxUidDidBecomeInvalidNotification"), v17, v20);
            if (objc_msgSend(v17, "isStore"))
            {
              v21 = +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v19);
              if (!v21 || (objc_msgSend(v21, "isValid") & 1) == 0)
              {
                objc_msgSend(v12, "addObject:", v19);
                objc_msgSend(v25, "addObject:", objc_msgSend(v24, "objectAtIndex:", v15));
              }
            }
          }
        }
        ++v15;
      }
      while (v14 != v15);
    }
    if (objc_msgSend(v12, "count"))
      objc_msgSend(-[MFMailboxUid account](self, "account"), "_mailboxesWereRemovedFromTree:withFileSystemPaths:", v12, v25);

    v10 = v23;
  }

  return v10;
}

- (BOOL)isValid
{
  return -[MFMailboxUid rootMailbox](self, "rootMailbox") != 0;
}

- (id)account
{
  id result;

  result = -[MFMailboxUid rootMailbox](self, "rootMailbox");
  if (result)
    return (id)objc_msgSend(*((id *)result + 3), "reference");
  return result;
}

- (id)rootMailbox
{
  id result;

  result = -[MFMailboxUid topMailbox](self, "topMailbox");
  if ((*((_BYTE *)result + 40) & 0x10) == 0)
    return 0;
  return result;
}

- (id)topMailbox
{
  MFMailboxUid *v2;

  do
  {
    v2 = self;
    self = -[MFMailboxUid parent](self, "parent");
  }
  while (self);
  return v2;
}

- (id)parent
{
  return (id)-[MFWeakReferenceHolder reference](self->_parent, "reference");
}

- (BOOL)isStore
{
  return (self->_attributes & 2) == 0;
}

- (id)name
{
  void *v3;
  NSString *pathComponent;
  void *v6;

  if ((self->_attributes & 0x10) != 0)
    return (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "displayName");
  v3 = (void *)-[MFWeakReferenceHolder retainedReference](self->_parent, "retainedReference");
  if (v3)
  {
    pathComponent = self->_pathComponent;

    return pathComponent;
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Orphaned mailbox %@"), self->_pathComponent);

    self->_parent = 0;
    return v6;
  }
}

- (id)mutableCopyOfChildren
{
  void *v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (void *)-[NSMutableArray mutableCopy](self->_children, "mutableCopy");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)depthFirstEnumerator
{
  id v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (id)objc_msgSend(objc_allocWithZone((Class)_MFMailboxUidEnumerator), "initWithMailbox:", self);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)addToPostOrderTraversal:(id)a3
{
  NSMutableArray *children;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  children = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "addToPostOrderTraversal:", a3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  objc_msgSend(a3, "addObject:", self);
}

- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3
{
  return -[_MFMailboxUidChildrenEnumerator _initWithMailbox:includeHiddenChildren:]([_MFMailboxUidChildrenEnumerator alloc], "_initWithMailbox:includeHiddenChildren:", self, a3);
}

- (id)_mutableChildren
{
  id v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (id)-[NSMutableArray copy](self->_children, "copy");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)_initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5
{
  MFMailboxUid *v7;

  if (a3)
  {
    v7 = -[MFMailboxUid init](self, "init", a3, *(_QWORD *)&a4, a5);
    if (v7)
    {
      v7->_pathComponent = (NSString *)objc_msgSend(a3, "copy");
LABEL_5:
      v7->_attributes = a4;
    }
  }
  else
  {
    v7 = -[MFMailboxUid initWithAccount:](self, "initWithAccount:", a5);
    if (v7)
      goto LABEL_5;
  }
  return v7;
}

- (MFMailboxUid)init
{
  MFMailboxUid *v2;
  const __CFAllocator *v3;
  const __CFUUID *v4;
  CFStringRef v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailboxUid;
  v2 = -[MFMailboxUid init](&v7, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v5 = CFUUIDCreateString(v3, v4);

    v2->uniqueId = &v5->isa;
    v2->_mailboxID = -1;
  }
  return v2;
}

- (BOOL)hasChildren
{
  BOOL v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (self->_attributes & 0x10) != 0 || -[NSMutableArray count](self->_children, "count") != 0;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5 extraAttributes:(id)a6
{
  MFMailboxUid *v7;

  v7 = -[MFMailboxUid _initWithName:attributes:forAccount:](self, "_initWithName:attributes:forAccount:", a3, *(_QWORD *)&a4, a5);
  if (v7)
    v7->_extraAttributes = (NSArray *)objc_msgSend(a6, "copy");
  return v7;
}

- (void)setAttributes:(unsigned int)a3
{
  self->_attributes = a3;
}

- (BOOL)isContainer
{
  return (self->_attributes & 1) == 0;
}

+ (id)fileURLForMailboxURL:(id)a3
{
  MailAccount *v4;
  id result;

  v4 = +[MailAccount accountWithURL:](MailAccount, "accountWithURL:");
  result = (id)objc_msgSend((id)objc_msgSend(-[MailAccount path](v4, "path"), "stringByAppendingPathComponent:", objc_msgSend(a3, "path")), "stringByAppendingPathExtension:", -[MailAccount mailboxPathExtension](v4, "mailboxPathExtension"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", result);
  return result;
}

- (void)dealloc
{
  NSString *pathComponent;
  objc_super v5;

  pathComponent = self->_pathComponent;
  if (pathComponent && self->_account)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxUid.m"), 162, CFSTR("should not have a path component and a account on the same mailboxuid."));
    pathComponent = self->_pathComponent;
  }

  v5.receiver = self;
  v5.super_class = (Class)MFMailboxUid;
  -[MFMailboxUid dealloc](&v5, sel_dealloc);
}

- (MFMailboxUid)initWithAccount:(id)a3
{
  MFMailboxUid *v4;

  v4 = -[MFMailboxUid init](self, "init");
  if (v4)
  {
    v4->_account = (MFWeakReferenceHolder *)(id)objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", a3);
    v4->_attributes = 18;
  }
  return v4;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[MFMailboxUid attributes](self, "attributes");
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = -[MFMailboxUid name](self, "name");
  v6 = (void *)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("MailboxName"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), CFSTR("MailboxAttributes"), 0);
  if ((v3 & 1) == 0)
  {
    v7 = -[MFMailboxUid children](self, "children");
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v7);
            objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "dictionaryRepresentation"));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("MailboxChildren"));

    }
  }
  v14 = -[MFMailboxUid extraAttributes](self, "extraAttributes");
  if (v14)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("MailboxExtraAttributes"));
  return v6;
}

- (id)uniqueId
{
  return self->uniqueId;
}

- (void)setName:(id)a3
{
  if ((objc_msgSend(a3, "isEqual:", self->_pathComponent) & 1) == 0)
  {
    -[MFMailboxUid mf_lock](self, "mf_lock");

    self->_pathComponent = (NSString *)a3;
    self->_realFullPath = 0;
    if (-[MFMailboxUid URLString](self, "URLString"))
    {

      self->_criterion = 0;
    }
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }
}

- (id)accountDisplayName
{
  return (id)objc_msgSend(-[MFMailboxUid representedAccount](self, "representedAccount"), "displayName");
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "serverUnreadOnlyOnServerCountForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (unint64_t)unreadCount
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "unreadCountForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "unreadCountForMailbox:matchingCriterion:", -[MFMailboxUid URLString](self, "URLString"), a3);
}

- (unint64_t)nonDeletedCount
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "nonDeletedCountForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (int64_t)statusCountDelta
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "statusCountDeltaForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (void)updateMostRecentStatusCount:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(-[MFMailboxUid account](self, "account"), "library");
  v6 = -[MFMailboxUid URLString](self, "URLString");
  if (objc_msgSend(v5, "mostRecentStatusCountForMailbox:", v6) != a3)
  {
    objc_msgSend(v5, "setMostRecentStatusCount:forMailbox:", a3, v6);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MailboxUserInfoDidChange"), self);
  }
}

- (BOOL)shouldUseNonDeletedForUnreadCount
{
  int v2;

  v2 = -[MFMailboxUid type](self, "type");
  return (v2 - 5) < 2 || (v2 - 105) < 2;
}

- (id)childEnumerator
{
  return -[MFMailboxUid childEnumeratorIncludingHiddenChildren:](self, "childEnumeratorIncludingHiddenChildren:", 1);
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
  NSMutableArray *children;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  children = self->_children;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(children);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "numberOfDescendants") + 1;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v6;
}

- (id)childAtIndex:(unint64_t)a3
{
  void *v5;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v5 = (void *)-[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", a3);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (unint64_t)indexOfChild:(id)a3
{
  unint64_t v5;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v5 = -[NSMutableArray indexOfObject:](self->_children, "indexOfObject:", a3);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)descendantWithExtraAttribute:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (!objc_msgSend(a3, "length"))
    return 0;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v5 = -[MFMailboxUid depthFirstEnumerator](self, "depthFirstEnumerator");
  do
  {
    v6 = (void *)objc_msgSend(v5, "nextObject");
    v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "extraAttributes"), "containsObject:", a3));
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v7;
}

- (void)sortChildren
{
  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[NSMutableArray sortUsingFunction:context:](self->_children, "sortUsingFunction:context:", _MFCompareMailboxUidsNS, -[MFMailboxUid account](self, "account"));
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)removeChild:(id)a3
{
  -[MFMailboxUid mf_lock](self, "mf_lock");
  -[NSMutableArray removeObject:](self->_children, "removeObject:", a3);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)setParent:(id)a3
{
  if (-[MFMailboxUid parent](self, "parent") != a3)
  {
    bindParentAndChild(a3, (id *)&self->super.isa);
    -[MFMailboxUid mf_lock](self, "mf_lock");
    if (-[MFMailboxUid URLString](self, "URLString"))
    {

      self->_criterion = 0;
    }
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }
}

- (void)flushCriteria
{
  -[MFMailboxUid mf_lock](self, "mf_lock");

  self->_criterion = 0;
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)setRepresentedAccount:(id)a3
{
  MailAccount *representedAccount;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  representedAccount = self->_representedAccount;
  if (representedAccount != a3)
  {

    self->_representedAccount = (MailAccount *)a3;
  }
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (void)invalidate
{
  MFMailboxUid *v3;
  id v4;
  uint64_t v5;

  v3 = -[MFMailboxUid rootMailbox](self, "rootMailbox");
  -[MFMailboxUid saveUserInfo](self, "saveUserInfo");
  if (v3 == self)
  {

    self->_account = 0;
    self->_attributes &= ~0x10u;
  }
  objc_msgSend(-[MFMailboxUid parent](self, "parent"), "removeChild:", self);
  if (v3)
  {
    v4 = -[MFMailboxUid URLString](self, "URLString");
    if (v4)
      v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("URLString"));
    else
      v5 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MailboxUidDidBecomeInvalidNotification"), self, v5);
  }
}

+ (BOOL)isStandardizedMailboxUidType:(int)a3
{
  return (a3 - 1) < 7;
}

- (BOOL)isStandardizedMailboxUid
{
  return +[MFMailboxUid isStandardizedMailboxUidType:](MFMailboxUid, "isStandardizedMailboxUidType:", -[MFMailboxUid type](self, "type"));
}

- (BOOL)isSpecialMailboxUid
{
  return objc_msgSend(-[MFMailboxUid account](self, "account"), "isSpecialMailbox:", self);
}

- (BOOL)isSentMailboxUid
{
  return objc_msgSend((id)objc_opt_class(), "isSentMailboxType:", -[MFMailboxUid type](self, "type"));
}

+ (BOOL)isOutgoingMailboxType:(int)a3
{
  return (a3 - 4) < 3 || (a3 - 104) < 3;
}

+ (BOOL)isDraftsMailboxType:(int)a3
{
  return a3 == 5 || a3 == 105;
}

+ (BOOL)isSentMailboxType:(int)a3
{
  return a3 == 4 || a3 == 104;
}

+ (BOOL)typeIsValidTransferDestination:(int)a3
{
  char v4;
  BOOL v5;

  v4 = objc_msgSend((id)objc_opt_class(), "isOutgoingMailboxType:", *(_QWORD *)&a3);
  v5 = a3 != 8;
  if (a3 == -100)
    v5 = 0;
  if (a3 == -500)
    v5 = 0;
  return (v4 & 1) == 0 && v5;
}

- (BOOL)isOutgoingMailboxUid
{
  return objc_msgSend((id)objc_opt_class(), "isOutgoingMailboxType:", -[MFMailboxUid type](self, "type"));
}

- (BOOL)isNotesMailboxUid
{
  int v3;
  id v4;

  v3 = objc_msgSend(-[MFMailboxUid name](self, "name"), "isEqualToString:", CFSTR("Notes"));
  if (v3)
  {
    v4 = -[MFMailboxUid parent](self, "parent");
    LOBYTE(v3) = v4 == (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "rootMailboxUid");
  }
  return v3;
}

- (id)realFullPath
{
  NSString *realFullPath;
  void *v4;

  realFullPath = self->_realFullPath;
  if (!realFullPath)
  {
    v4 = (void *)objc_msgSend(-[MFMailboxUid fullPath](self, "fullPath"), "mf_betterStringByResolvingSymlinksInPath");
    -[MFMailboxUid mf_lock](self, "mf_lock");
    if (!self->_realFullPath)
      self->_realFullPath = (NSString *)v4;
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
    realFullPath = self->_realFullPath;
  }
  return realFullPath;
}

- (id)tildeAbbreviatedPath
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[MFMailboxUid account](self, "account");
  v4 = (void *)objc_msgSend(v3, "tildeAbbreviatedPath");
  v5 = objc_msgSend(v3, "mailboxPathExtension");
  v6 = (void *)objc_msgSend(v3, "_mailboxPathPrefix");
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v7 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, v4, v6, v5, 0);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v7;
}

- (id)pathRelativeToMailbox:(id)a3
{
  if (a3)
    return _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, -[MFMailboxUid account](self, "account"), (uint64_t)a3, &stru_1E81CBE50, 0, 0, 0);
  else
    return 0;
}

- (id)pathRelativeToMailboxForDisplay:(id)a3
{
  if (a3)
    return _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, -[MFMailboxUid account](self, "account"), (uint64_t)a3, &stru_1E81CBE50, 0, 0, 1);
  else
    return 0;
}

- (id)URL
{
  id v3;
  id v4;

  v3 = -[MFMailboxUid account](self, "account");
  v4 = -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
  return +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, CFSTR("Account"), v4, CFSTR("RelativePath"), 0));
}

- (id)URLStringWithAccount:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("Account"), -[MFMailboxUid accountRelativePath](self, "accountRelativePath"), CFSTR("RelativePath"), 0);
  v4 = +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v3);

  return (id)objc_msgSend(v4, "absoluteString");
}

- (id)oldURLString
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = -[MFMailboxUid ancestralAccount](self, "ancestralAccount");
  v5 = -[MFMailboxUid accountRelativePath](self, "accountRelativePath");
  v6 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("Account"), v5, CFSTR("RelativePath"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("IncludeDefaultSecurePortNumber"), 0);
  v7 = +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v6);

  return (id)objc_msgSend(v7, "absoluteString");
}

- (unsigned)mailboxID
{
  unsigned int result;
  id v4;

  result = self->_mailboxID;
  if (result == -1)
  {
    v4 = -[MFMailboxUid URLString](self, "URLString");
    if (objc_msgSend(v4, "length"))
    {
      result = objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "mailboxIDForURLString:", v4);
      self->_mailboxID = result;
    }
    else
    {
      return self->_mailboxID;
    }
  }
  return result;
}

- (int64_t)compareWithMailboxUid:(id)a3
{
  return (int)_MFCompareMailboxUidsWithResultCodes((uint64_t)self, (uint64_t)a3, 0, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

- (int64_t)indexToInsertChildMailboxUid:(id)a3
{
  id v6;
  void *v7;
  CFIndex v8;
  CFRange v9;

  if (-[MFMailboxUid childWithName:](self, "childWithName:", objc_msgSend(a3, "displayName")))
    return -1;
  v6 = -[MFMailboxUid mutableCopyOfChildren](self, "mutableCopyOfChildren");
  if (!v6)
    return -1;
  v7 = v6;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v9.length = objc_msgSend(v7, "count");
  v9.location = 0;
  v8 = CFArrayBSearchValues((CFArrayRef)v7, v9, a3, (CFComparatorFunction)_MFCompareMailboxUids, 0);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");

  return v8;
}

- (BOOL)isDescendantOfMailbox:(id)a3
{
  MFMailboxUid *v4;
  uint64_t v5;

  if (self)
  {
    v4 = self;
    do
    {
      v5 = -[MFMailboxUid parent](v4, "parent");
      LOBYTE(self) = v4 == a3;
      if (v4 == a3)
        break;
      v4 = (MFMailboxUid *)v5;
    }
    while (v5);
  }
  return (char)self;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(-[MFMailboxUid _privacySafeDescription](self, "_privacySafeDescription"), "stringByAppendingFormat:", CFSTR(" relativePath=%@"), -[MFMailboxUid accountRelativePath](self, "accountRelativePath"));
}

- (id)_privacySafeDescription
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> ID=%u type=%@ attributes=%d"), v4, self, self->_mailboxID, NSStringFromMailboxUidType(-[MFMailboxUid type](self, "type")), -[MFMailboxUid attributes](self, "attributes"));
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"))
    return -[MFMailboxUid description](self, "description");
  else
    return (NSString *)-[MFMailboxUid _privacySafeDescription](self, "_privacySafeDescription");
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isVisible
{
  return -[MFMailboxUid type](self, "type") == 0;
}

- (id)_loadUserInfo
{
  id result;

  result = (id)objc_msgSend(-[MFMailboxUid fullPath](self, "fullPath"), "stringByAppendingPathComponent:", CFSTR("Info.plist"));
  if (result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", result);
    if (!result)
      return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  return result;
}

- (id)userInfoObjectForKey:(id)a3
{
  NSMutableDictionary *userInfo;
  id v6;
  void *v7;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
    v6 = -[MFMailboxUid _loadUserInfo](self, "_loadUserInfo");
    if (v6 && -[MFMailboxUid mergeWithUserInfo:](self, "mergeWithUserInfo:", v6))
      objc_msgSend(v6, "setObject:forKey:", CFSTR("YES"), CFSTR("IsDirty"));
    -[MFMailboxUid mf_lock](self, "mf_lock");
    userInfo = self->_userInfo;
    if (!userInfo)
    {
      userInfo = (NSMutableDictionary *)v6;
      self->_userInfo = userInfo;
    }
  }
  v7 = (void *)-[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", a3);
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v7;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *userInfo;
  _BOOL4 v8;
  id v9;
  void *v10;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  userInfo = self->_userInfo;
  if (userInfo)
  {
    v8 = 0;
  }
  else
  {
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
    v9 = -[MFMailboxUid _loadUserInfo](self, "_loadUserInfo");
    v8 = -[MFMailboxUid mergeWithUserInfo:](self, "mergeWithUserInfo:", v9);
    -[MFMailboxUid mf_lock](self, "mf_lock");
    userInfo = self->_userInfo;
    if (!userInfo)
    {
      userInfo = (NSMutableDictionary *)v9;
      self->_userInfo = userInfo;
    }
  }
  v10 = (void *)-[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", a4);
  if (v10 && (objc_msgSend(v10, "isEqual:", a3) & 1) != 0)
  {
    if (!v8)
      goto LABEL_11;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_userInfo, "setObject:forKey:", a3, a4);
  }
  -[NSMutableDictionary setObject:forKey:](self->_userInfo, "setObject:forKey:", CFSTR("YES"), CFSTR("IsDirty"));
LABEL_11:
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
}

- (BOOL)userInfoBoolForKey:(id)a3
{
  id v3;

  v3 = -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", a3);
  if (v3)
    LOBYTE(v3) = NSBOOLFromString();
  return (char)v3;
}

- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4
{
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", NSStringFromBOOL(), a4);
}

- (void)saveUserInfo
{
  id v3;
  void *v4;
  void *v5;

  if (-[MFMailboxUid type](self, "type") != 8)
  {
    -[MFMailboxUid mf_lock](self, "mf_lock");
    if (-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("IsDirty")))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_userInfo, "removeObjectForKey:", CFSTR("IsDirty"));
      v3 = -[MFMailboxUid fullPath](self, "fullPath");
      if (v3)
      {
        v4 = v3;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
          objc_msgSend(v4, "mf_makeDirectoryWithMode:", 448);
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_userInfo, 100, 0, 0);
        if (v5)
          objc_msgSend(v5, "writeToFile:options:error:", objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Info.plist")), 1073741825, 0);
      }
    }
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }
}

- (BOOL)mergeWithUserInfo:(id)a3
{
  return 0;
}

- (id)userInfoDictionary
{
  id v3;

  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (id)-[NSMutableDictionary copy](self->_userInfo, "copy");
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setUserInfoWithDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend(a3, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", objc_msgSend(a3, "objectForKey:", v7), v7);
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
}

- (id)userInfoForSerialization
{
  id v3;

  if (-[MFMailboxUid type](self, "type") == 8)
    return 0;
  -[MFMailboxUid mf_lock](self, "mf_lock");
  v3 = (id)-[NSMutableDictionary mutableCopy](self->_userInfo, "mutableCopy");
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("IsDirty"));
  -[MFMailboxUid mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setCriterion:(id)a3
{
  if (self->_criterion != a3)
  {
    -[MFMailboxUid mf_lock](self, "mf_lock");

    self->_criterion = (MFMessageCriterion *)a3;
    -[MFMailboxUid mf_unlock](self, "mf_unlock");
  }
}

- (id)store
{
  id result;

  result = (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "storeForMailboxUid:", self);
  if (!result)
    return +[MFLibraryStore storeWithMailbox:](MFLibraryStore, "storeWithMailbox:", self);
  return result;
}

- (BOOL)isShared
{
  return LOBYTE(self->_attributes) >> 7;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return objc_msgSend(-[MFMailboxUid account](self, "account"), "shouldRestoreMessagesAfterFailedDelete");
}

- (BOOL)alwaysWriteFullMessageFile
{
  return self->_type == 6;
}

- (id)lastViewedMessageID
{
  return -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("LastViewedMessageInMailbox"));
}

- (id)lastViewedMessageDate
{
  return -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("LastViewedMessageInMailboxDate"));
}

- (void)setLastViewedMessageID:(id)a3
{
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", a3, CFSTR("LastViewedMessageInMailbox"));
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("LastViewedMessageInMailboxDate"));
}

- (unint64_t)suggestionsLostMessageSearchResultCount
{
  return objc_msgSend(-[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("suggestionsLostMessageSearchResultCount")), "unsignedIntegerValue");
}

- (double)suggestionsLostMessageSearchTimestamp
{
  double result;

  objc_msgSend(-[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("suggestionsLostMessageSearchTimestamp")), "doubleValue");
  return result;
}

- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3
{
  void *v4;

  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("suggestionsLostMessageSearchResultCount"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", objc_msgSend(v4, "numberWithDouble:"), CFSTR("suggestionsLostMessageSearchTimestamp"));
  -[MFMailboxUid saveUserInfo](self, "saveUserInfo");
}

- (void)setExtraAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (MFInvocationQueue)attachmentDownloadQueue
{
  MFInvocationQueue *AssociatedObject;

  AssociatedObject = (MFInvocationQueue *)objc_getAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue);
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(MFInvocationQueue);
    objc_setAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue, AssociatedObject, (void *)0x301);
  }
  return AssociatedObject;
}

@end

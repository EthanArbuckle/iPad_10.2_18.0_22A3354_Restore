@implementation EMMailbox

- (EMMailbox)initWithObjectID:(id)a3 repository:(id)a4 name:(id)a5 accountIdentifier:(id)a6 type:(int64_t)a7 builder:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EMMailbox *v20;
  EMMailbox *v21;
  void *v23;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailbox.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v24.receiver = self;
  v24.super_class = (Class)EMMailbox;
  v20 = -[EMObject initWithObjectID:](&v24, sel_initWithObjectID_, v15);
  v21 = v20;
  if (v20)
  {
    -[EMMailbox setRepository:](v20, "setRepository:", v16);
    -[EMMailbox _commonInitName:accountIdentifier:type:canContainMessages:children:parentID:builder:](v21, "_commonInitName:accountIdentifier:type:canContainMessages:children:parentID:builder:", v17, v18, a7, 0, 0, 0, v19);
  }

  return v21;
}

- (void)setRepository:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailbox.m"), 89, CFSTR("Wrong repository type"));

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EMMailbox;
  -[EMRepositoryObject setRepository:](&v8, sel_setRepository_, v5);
  -[EMMailbox children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRepository:", v5);

}

- (EMMailboxCollection)children
{
  return self->_children;
}

- (void)_commonInitName:(id)a3 accountIdentifier:(id)a4 type:(int64_t)a5 canContainMessages:(BOOL)a6 children:(id)a7 parentID:(id)a8 builder:(id)a9
{
  id v16;
  id v17;
  void (**v18)(id, EMMailbox *);
  EMMailboxCollection **p_children;
  EMMailboxCollection *v20;
  void *v21;
  uint64_t v22;
  EMMailboxCollection *v23;
  id v24;
  id v25;

  v25 = a3;
  v24 = a4;
  v16 = a7;
  v17 = a8;
  v18 = (void (**)(id, EMMailbox *))a9;
  objc_storeStrong((id *)&self->_name, a3);
  objc_storeStrong((id *)&self->_accountIdentifier, a4);
  self->_type = a5;
  self->_canContainMessages = a6;
  self->_canArchive = -[EMMailbox _canArchiveForMailboxType:](self, "_canArchiveForMailboxType:", a5);
  p_children = &self->_children;
  objc_storeStrong((id *)&self->_children, a7);
  objc_storeStrong((id *)&self->_parentID, a8);
  v18[2](v18, self);
  if (!self->_children)
  {
    v20 = [EMMailboxCollection alloc];
    -[EMMailbox repository](self, "repository", v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[EMMailboxCollection initWithMailbox:repository:](v20, "initWithMailbox:repository:", self, v21);
    v23 = *p_children;
    *p_children = (EMMailboxCollection *)v22;

  }
}

- (BOOL)_canArchiveForMailboxType:(int64_t)a3
{
  return ((unint64_t)a3 > 5) | (0x11u >> a3) & 1;
}

- (EMMailboxRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMMailbox;
  -[EMRepositoryObject repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailbox.m"), 84, CFSTR("Wrong repository type"));

    }
  }
  return (EMMailboxRepository *)v4;
}

+ (id)predicateForMailboxChildren:(id)a3
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
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("parent.objectID.url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v3, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v9, 0, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCanContainMessages:(BOOL)a3
{
  self->_canContainMessages = a3;
}

+ (BOOL)supportsArchivingForMailboxes:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "ef_any:", &__block_literal_global_1);
  else
    v4 = 0;

  return v4;
}

- (void)setParentFromMailboxes:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EMMailboxObjectID *parentID;
  void *v10;
  id v11;

  v11 = a3;
  -[EMMailbox parentID](self, "parentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (v5)
    {
      objc_msgSend(v11, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailbox setParent:](self, "setParent:", v7);

      -[EMMailbox parent](self, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailbox.m"), 114, CFSTR("failed to set parent mailbox with id:%@"), v5);

      }
    }
  }
  parentID = self->_parentID;
  self->_parentID = 0;

}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (EMMailboxObjectID)parentID
{
  void *v3;
  void *v4;
  EMMailboxObjectID *v5;
  EMMailboxObjectID *v6;

  -[EMMailbox parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectID");
    v5 = (EMMailboxObjectID *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_parentID;
  }
  v6 = v5;

  return v6;
}

- (EMMailbox)parent
{
  return (EMMailbox *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMailbox;
  -[EMObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[EMMailbox name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_name"));

  -[EMMailbox accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_accountIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMailbox type](self, "type"), CFSTR("EFPropertyKey_type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailbox canContainMessages](self, "canContainMessages"), CFSTR("EFPropertyKey_canContainMessages"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailbox canArchive](self, "canArchive"), CFSTR("EFPropertyKey_canArchive"));
  -[EMMailbox children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_children"));

  -[EMMailbox parentID](self, "parentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_parentID"));

}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)canArchive
{
  return self->_canArchive;
}

- (EMObjectID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)canContainMessages
{
  return self->_canContainMessages;
}

uint64_t __62__EMMailbox_TriageInteraction__supportsArchivingForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canArchive");
}

- (NSString)ef_publicDescription
{
  _BOOL4 v3;
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

  v3 = -[EMMailbox descriptionUsesRealName](self, "descriptionUsesRealName");
  -[EMObject objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMMailbox name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D1EF48];
    -[EMMailbox name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullyOrPartiallyRedactedStringForString:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  -[EMMailbox type](self, "type");
  ECNSStringFromMailboxMailboxType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox canArchive](self, "canArchive");
  NSStringFromBOOL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox _shouldArchiveByDefaultString](self, "_shouldArchiveByDefaultString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p> ObjectID:%@ Name:%@ Type:%@ CanArchive:%@ ShouldArchive:%@"), v11, self, v6, v7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)descriptionUsesRealName
{
  void *v3;
  char v4;
  BOOL result;

  result = self->_descriptionUsesRealName
        || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D1ED40]),
            v3,
            (v4 & 1) != 0)
        || (unint64_t)(-[EMMailbox type](self, "type") - 1) < 7;
  return result;
}

- (id)_shouldArchiveByDefaultString
{
  _BOOL4 v3;
  _BOOL4 v4;
  __CFString *v5;

  v3 = -[EMMailbox _canArchiveForMailboxType:](self, "_canArchiveForMailboxType:", -[EMMailbox type](self, "type"));
  v4 = -[EMMailbox _hasFetchedAccount](self, "_hasFetchedAccount");
  v5 = CFSTR("?");
  if (v3 && v4)
  {
    -[EMMailbox shouldArchiveByDefault](self, "shouldArchiveByDefault");
    NSStringFromBOOL();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_hasFetchedAccount
{
  return self->_account != 0;
}

- (EMMailbox)initWithObjectID:(id)a3 name:(id)a4 accountIdentifier:(id)a5 type:(int64_t)a6 builder:(id)a7
{
  return -[EMMailbox initWithObjectID:repository:name:accountIdentifier:type:builder:](self, "initWithObjectID:repository:name:accountIdentifier:type:builder:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)isSmartMailbox
{
  return 0;
}

- (EMReceivingAccount)accountIfAvailable
{
  return self->_account;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailbox)initWithCoder:(id)a3
{
  id v4;
  EMMailbox *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMMailbox;
  v5 = -[EMObject initWithCoder:](&v16, sel_initWithCoder_, v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_name"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E70F6E90;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_accountIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_type"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_canContainMessages"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_children"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_parentID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox _commonInitName:accountIdentifier:type:canContainMessages:children:parentID:builder:](v5, "_commonInitName:accountIdentifier:type:canContainMessages:children:parentID:builder:", v9, v10, v11, v12, v13, v14, &__block_literal_global_24);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (EMReceivingAccount)account
{
  EMReceivingAccount **p_account;
  EMReceivingAccount *account;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_account = &self->_account;
  account = self->_account;
  if (!account)
  {
    -[EMMailbox repository](self, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountRepository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMailbox accountIdentifier](self, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    objc_storeStrong((id *)p_account, v9);

    account = *p_account;
  }
  return account;
}

- (BOOL)isSentMailbox
{
  return -[EMMailbox type](self, "type") == 4;
}

- (BOOL)isOutgoingMailbox
{
  return +[EMMailbox _isOutgoingMailboxType:](EMMailbox, "_isOutgoingMailboxType:", -[EMMailbox type](self, "type"))|| -[EMMailbox isSendLaterMailbox](self, "isSendLaterMailbox");
}

+ (BOOL)_isOutgoingMailboxType:(int64_t)a3
{
  return a3 == 6 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)isSendLaterMailbox
{
  void *v2;
  char v3;

  -[EMMailbox name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x-apple-send-later"));

  return v3;
}

+ (BOOL)deleteMovesToTrashForMailboxes:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "ef_all:", &__block_literal_global_23);
  else
    v4 = 0;

  return v4;
}

BOOL __63__EMMailbox_TriageInteraction__deleteMovesToTrashForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") != 3 && objc_msgSend(v2, "type") != 1;

  return v3;
}

+ (BOOL)shouldArchiveByDefaultForMailboxes:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "ef_any:", &__block_literal_global_2_0);
  else
    v4 = 0;

  return v4;
}

uint64_t __67__EMMailbox_TriageInteraction__shouldArchiveByDefaultForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldArchiveByDefault");
}

+ (BOOL)supportsSelectAllForMailboxes:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "ef_all:", &__block_literal_global_3_0);
  else
    v4 = 0;

  return v4;
}

uint64_t __62__EMMailbox_TriageInteraction__supportsSelectAllForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsSelectAll");
}

- (EMMailbox)initWithObjectID:(id)a3
{
  id v5;

  v5 = a3;
  -[EMMailbox doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMailbox initWithObjectID:]", "EMMailbox.m", 45, "0");
}

- (BOOL)isTopLevelMailbox
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EMMailbox parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type") == 8;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isCoreSpotlightMailbox
{
  return 0;
}

- (BOOL)isInboxMailbox
{
  return -[EMMailbox type](self, "type") == 7;
}

- (BOOL)isDraftsMailbox
{
  return -[EMMailbox type](self, "type") == 5;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

+ (BOOL)typeIsValidTransferDestination:(int64_t)a3
{
  char v4;
  BOOL v5;

  v4 = objc_msgSend(a1, "_isOutgoingMailboxType:");
  v5 = a3 != 8;
  if (a3 == -100)
    v5 = 0;
  if (a3 == -500)
    v5 = 0;
  return (v4 & 1) == 0 && v5;
}

- (void)setDescriptionUsesRealName:(BOOL)a3
{
  self->_descriptionUsesRealName = a3;
}

- (NSURL)externalURL
{
  EMMailbox *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = self;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v2)
  {
    v4 = v2;
    do
    {
      if (objc_msgSend(v4, "type") == 8)
        break;
      objc_msgSend(v4, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertObject:atIndex:", v5, 0);

      objc_msgSend(v4, "parent");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v3, "count"))
  {
    -[EMMailbox account](v2, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityEmailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v9, "setScheme:", CFSTR("x-apple-mail-mailbox"));
    objc_msgSend(v8, "localPart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUser:", v10);

    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHost:", v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", v13);

    objc_msgSend(v9, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return (NSURL *)v14;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMObject objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox type](self, "type");
  ECNSStringFromMailboxMailboxType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox canArchive](self, "canArchive");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailbox _shouldArchiveByDefaultString](self, "_shouldArchiveByDefaultString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ObjectID:%@ Name:%@ Type:%@ CanArchive:%@ ShouldArchive:%@"), v4, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)shouldArchiveByDefault
{
  unint64_t v3;

  v3 = -[EMMailbox type](self, "type") - 1;
  return (v3 >= 5 || ((0x17u >> v3) & 1) == 0) && -[EMMailbox _shouldArchiveByDefault](self, "_shouldArchiveByDefault");
}

- (BOOL)_shouldArchiveByDefault
{
  void *v2;
  char v3;

  -[EMMailbox account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldArchiveByDefault");

  return v3;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)redactedName
{
  return self->_redactedName;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setCanArchive:(BOOL)a3
{
  self->_canArchive = a3;
}

+ (id)predicateForMailboxName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMailboxType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForMailboxAccount:(id)a3
{
  objc_msgSend(a1, "predicateForMailboxAccount:topLevelOnly:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMailboxAccount:(id)a3 topLevelOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  uint64_t v17;
  _QWORD v19[3];

  v4 = a4;
  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("account.objectID.representedObjectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v6, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "representedObjectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionForConstantValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v12, 0, 4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v14 = (void *)MEMORY[0x1E0CB3528];
    v19[0] = v13;
    objc_msgSend(a1, "predicateForTopLevelMailboxes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }

  return v13;
}

+ (id)predicateForMailboxAccountIdentifier:(id)a3 topLevelOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("account.objectID.representedObjectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, 0, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v10;
    objc_msgSend(a1, "predicateForTopLevelMailboxes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }

  return v10;
}

+ (id)predicateForPrimaryMailboxWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "predicateForMailboxAccount:topLevelOnly:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForMailboxType:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForTopLevelMailboxes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("isTopLevelMailbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSmartMailboxes
{
  return (id)objc_msgSend(a1, "_predicateForSmartMailboxes:", 1);
}

+ (id)predicateForRegularMailboxes
{
  return (id)objc_msgSend(a1, "_predicateForSmartMailboxes:", 0);
}

+ (id)_predicateForSmartMailboxes:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("isSmartMailbox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sortDescriptorForNameAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D1F078], "sortDescriptorWithKey:ascending:", CFSTR("name"), a3);
}

+ (id)sortDescriptorForDisplayOrder
{
  return (id)objc_msgSend(MEMORY[0x1E0D1F078], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_25);
}

uint64_t __60__EMMailbox_EMQueryAdditions__sortDescriptorForDisplayOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  _BOOL4 v29;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;

  v4 = a2;
  v35 = a3;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v5;
  if (v5)
  {
    do
    {
      objc_msgSend(v6, "insertObject:atIndex:", v5, 0);
      objc_msgSend(v5, "parent");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    while (v7);
  }
  v8 = v35;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    do
    {
      objc_msgSend(v9, "insertObject:atIndex:", v10, 0);
      objc_msgSend(v10, "parent");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    while (v11);
  }
  v12 = objc_msgSend(v6, "count");
  v34 = v8;
  v13 = objc_msgSend(v9, "count");
  v32 = v13;
  v33 = v12;
  if (v12 >= v13)
    v14 = v13;
  else
    v14 = v12;
  if (v14)
  {
    v15 = 1;
    v37 = v6;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v15 - 1, v32, v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15 - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v17;
      v20 = objc_msgSend(v18, "type");
      v21 = objc_msgSend(v19, "type");
      if (v20 == v21)
      {
        objc_msgSend(v18, "name");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "localizedStandardCompare:", v23);

      }
      else
      {
        if (_mailboxTypeOrder_onceToken != -1)
          dispatch_once(&_mailboxTypeOrder_onceToken, &__block_literal_global_35);
        v22 = (id)_mailboxTypeOrder_order;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "indexOfObject:", v25);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v22, "indexOfObject:", v27);

        if (v26 < v28)
          v24 = -1;
        else
          v24 = 1;
        v6 = v37;
      }

      v29 = v24 == 0;
      if (v24)
        break;
    }
    while (v15++ < v14);
  }
  else
  {
    v24 = 0;
    v29 = 1;
  }
  if (v29 && v33 != v32)
  {
    if (v33 >= v32)
    {
      if (v33 > v32)
        v24 = 1;
    }
    else
    {
      v24 = -1;
    }
  }

  return v24;
}

@end

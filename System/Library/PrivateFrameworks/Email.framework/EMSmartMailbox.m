@implementation EMSmartMailbox

- (EMSmartMailbox)initWithType:(int64_t)a3 mailboxType:(int64_t)a4 name:(id)a5 mailboxScope:(id)a6 predicateGenerator:(id)a7
{
  id v12;
  id v13;
  id v14;
  EMMailboxObjectID *v15;
  EMSmartMailbox *v16;
  EMSmartMailbox *v17;
  uint64_t v18;
  id predicateGenerator;
  objc_super v21;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(EMMailboxObjectID);
  v21.receiver = self;
  v21.super_class = (Class)EMSmartMailbox;
  v16 = -[EMMailbox initWithObjectID:name:accountIdentifier:type:builder:](&v21, sel_initWithObjectID_name_accountIdentifier_type_builder_, v15, v12, 0, a4, &__block_literal_global_50);
  v17 = v16;
  if (v16)
  {
    v16->_smartMailboxType = a3;
    objc_storeStrong((id *)&v16->_mailboxScope, a6);
    v18 = objc_msgSend(v14, "copy");
    predicateGenerator = v17->_predicateGenerator;
    v17->_predicateGenerator = (id)v18;

  }
  return v17;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (id)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMMailbox name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Name:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)todayMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__EMSmartMailbox_todayMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 6, 0, v4, v3, v8);

  return v9;
}

+ (id)includesMeMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__EMSmartMailbox_includesMeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 3, 0, v4, v3, v8);

  return v9;
}

+ (id)followUpMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__EMSmartMailbox_followUpMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 10, 0, v4, v3, v8);

  return v9;
}

+ (id)flaggedMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__EMSmartMailbox_flaggedMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)yellowMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_yellowMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)vipMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__EMSmartMailbox_vipMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 0, 0, v4, v3, v8);

  return v9;
}

+ (id)hasAttachmentsMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__EMSmartMailbox_hasAttachmentsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 4, 0, v4, v3, v8);

  return v9;
}

+ (id)unreadMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_unreadMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 2, 0, v4, v3, v8);

  return v9;
}

+ (id)grayMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__EMSmartMailbox_grayMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)readLaterMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__EMSmartMailbox_readLaterMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 9, 0, v4, v3, v8);

  return v9;
}

+ (id)redMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__EMSmartMailbox_redMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)notifyThreadsMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__EMSmartMailbox_notifyThreadsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 5, 0, v4, v3, v8);

  return v9;
}

+ (id)purpleMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_purpleMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)muteThreadsMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__EMSmartMailbox_muteThreadsMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 7, 0, v4, v3, v8);

  return v9;
}

+ (id)orangeMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EMSmartMailbox_orangeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)sendLaterMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__EMSmartMailbox_sendLaterMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 11, 0, v4, v3, v8);

  return v9;
}

+ (id)blueMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__EMSmartMailbox_blueMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (id)greenMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__EMSmartMailbox_greenMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 1, 0, v4, v3, v8);

  return v9;
}

+ (EMMailboxScope)em_defaultExcludedMailboxesScope
{
  +[EMMailboxScope mailboxScopeForMailboxTypes:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxTypes:forExclusion:", &unk_1E711F700, 1);
  return (EMMailboxScope *)(id)objc_claimAutoreleasedReturnValue();
}

+ (EMMailboxScope)em_inboxMailboxScope
{
  return (EMMailboxScope *)+[EMMailboxScope mailboxScopeForMailboxType:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxType:forExclusion:", 7, 0);
}

+ (EMSmartMailbox)em_flaggedMailbox
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "em_defaultExcludedMailboxesScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSmartMailbox flaggedMailboxWithMailboxScope:](EMSmartMailbox, "flaggedMailboxWithMailboxScope:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSmartMailbox *)v3;
}

+ (EMSmartMailbox)em_followUpMailbox
{
  void *v2;
  void *v3;

  +[EMMailboxScope mailboxScopeForMailboxTypes:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxTypes:forExclusion:", &unk_1E711F718, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSmartMailbox followUpMailboxWithMailboxScope:](EMSmartMailbox, "followUpMailboxWithMailboxScope:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSmartMailbox *)v3;
}

+ (EMSmartMailbox)em_readLaterMailbox
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "em_defaultExcludedMailboxesScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSmartMailbox readLaterMailboxWithMailboxScope:](EMSmartMailbox, "readLaterMailboxWithMailboxScope:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSmartMailbox *)v3;
}

+ (EMSmartMailbox)em_VIPMailbox
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "em_inboxMailboxScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSmartMailbox vipMailboxWithMailboxScope:](EMSmartMailbox, "vipMailboxWithMailboxScope:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMSmartMailbox *)v3;
}

+ (id)em_scopedSendLaterMailboxWithMailboxURL:(id)a3
{
  id v3;
  EMMailboxObjectID *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[EMMailboxObjectID initWithURL:]([EMMailboxObjectID alloc], "initWithURL:", v3);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[EMSmartMailbox sendLaterMailboxWithMailboxScope:](EMSmartMailbox, "sendLaterMailboxWithMailboxScope:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __45__EMSmartMailbox_vipMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForIsVIP:](EMMessageListItemPredicates, "predicateForIsVIP:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __49__EMSmartMailbox_flaggedMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlaggedMessages](EMMessageListItemPredicates, "predicateForFlaggedMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_orangeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __45__EMSmartMailbox_redMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_purpleMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __46__EMSmartMailbox_blueMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_yellowMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __47__EMSmartMailbox_greenMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __46__EMSmartMailbox_grayMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForFlagColor:](EMMessageListItemPredicates, "predicateForFlagColor:", 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __48__EMSmartMailbox_unreadMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForUnreadMessages](EMMessageListItemPredicates, "predicateForUnreadMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __56__EMSmartMailbox_hasAttachmentsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesWithAttachments](EMMessageListItemPredicates, "predicateForMessagesWithAttachments");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __55__EMSmartMailbox_notifyThreadsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForNotifyMessages](EMMessageListItemPredicates, "predicateForNotifyMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __47__EMSmartMailbox_todayMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForTodayMessages](EMMessageListItemPredicates, "predicateForTodayMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __53__EMSmartMailbox_muteThreadsMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMuteMessages](EMMessageListItemPredicates, "predicateForMuteMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __52__EMSmartMailbox_includesMeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForIncludesMeMessages](EMMessageListItemPredicates, "predicateForIncludesMeMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __51__EMSmartMailbox_readLaterMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForReadLaterSmartMailbox](EMMessageListItemPredicates, "predicateForReadLaterSmartMailbox");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __50__EMSmartMailbox_followUpMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesWithUnfiredFollowUp](EMMessageListItemPredicates, "predicateForMessagesWithUnfiredFollowUp");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

id __51__EMSmartMailbox_sendLaterMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForSendLaterMessages](EMMessageListItemPredicates, "predicateForSendLaterMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

+ (id)unsubscribeMailboxWithMailboxScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  EMSmartMailbox *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:](EMMessageListItemPredicates, "predicateForMessagesWithMailboxScope:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__EMSmartMailbox_unsubscribeMailboxWithMailboxScope___block_invoke;
  v11[3] = &unk_1E70F2600;
  v7 = v6;
  v12 = v7;
  v8 = (void *)MEMORY[0x1BCCC8C10](v11);
  v9 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:]([EMSmartMailbox alloc], "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 12, 0, v4, v3, v8);

  return v9;
}

id __53__EMSmartMailbox_unsubscribeMailboxWithMailboxScope___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForUnsubscribableMessages](EMMessageListItemPredicates, "predicateForUnsubscribableMessages");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4
{
  objc_msgSend(a1, "unifiedMailboxOfType:name:additionalPredicate:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)unifiedMailboxOfType:(int64_t)a3 name:(id)a4 additionalPredicate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  EMSmartMailbox *v10;
  EMSmartMailbox *v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v7 = a4;
  v8 = a5;
  if ((unint64_t)(a3 - 1) < 5 || a3 == 7)
  {
    +[EMMailboxScope mailboxScopeForMailboxType:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxType:forExclusion:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [EMSmartMailbox alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__EMSmartMailbox_unifiedMailboxOfType_name_additionalPredicate___block_invoke;
    v13[3] = &unk_1E70F61B0;
    v15 = a3;
    v14 = v8;
    v11 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:](v10, "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 8, a3, v7, v9, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __64__EMSmartMailbox_unifiedMailboxOfType_name_additionalPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesInMailboxWithType:](EMMessageListItemPredicates, "predicateForMessagesInMailboxWithType:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

+ (id)vipMailboxWithName:(id)a3 additionalPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  EMSmartMailbox *v8;
  id v9;
  EMSmartMailbox *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  +[EMMailboxScope mailboxScopeForMailboxType:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxType:forExclusion:", 7, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EMSmartMailbox alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__EMSmartMailbox_vipMailboxWithName_additionalPredicate___block_invoke;
  v12[3] = &unk_1E70F2600;
  v9 = v6;
  v13 = v9;
  v10 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:](v8, "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 0, 0, v5, v7, v12);

  return v10;
}

id __57__EMSmartMailbox_vipMailboxWithName_additionalPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesInMailboxWithType:](EMMessageListItemPredicates, "predicateForMessagesInMailboxWithType:", 7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v2;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

+ (id)coreSpotlightMailboxWithName:(id)a3 queryString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  EMSmartMailbox *v8;
  id v9;
  EMSmartMailbox *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [EMSmartMailbox alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__EMSmartMailbox_coreSpotlightMailboxWithName_queryString___block_invoke;
  v12[3] = &unk_1E70F2600;
  v9 = v6;
  v13 = v9;
  v10 = -[EMSmartMailbox initWithType:mailboxType:name:mailboxScope:predicateGenerator:](v8, "initWithType:mailboxType:name:mailboxScope:predicateGenerator:", 13, 0, v5, v7, v12);

  return v10;
}

id __59__EMSmartMailbox_coreSpotlightMailboxWithName_queryString___block_invoke(uint64_t a1)
{
  return +[EMMessageListItemSearchPredicates spotlightQueryPredicateForString:](EMMessageListItemSearchPredicates, "spotlightQueryPredicateForString:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isSmartMailbox
{
  return 1;
}

- (BOOL)isCoreSpotlightMailbox
{
  return -[EMSmartMailbox smartMailboxType](self, "smartMailboxType") == 13;
}

- (BOOL)isSendLaterMailbox
{
  return -[EMSmartMailbox smartMailboxType](self, "smartMailboxType") == 11;
}

- (BOOL)supportsSelectAll
{
  return -[EMSmartMailbox smartMailboxType](self, "smartMailboxType") == 8;
}

- (id)makePredicate
{
  return (id)(*((uint64_t (**)(void))self->_predicateGenerator + 2))();
}

- (BOOL)isEqual:(id)a3
{
  EMSmartMailbox *v4;
  EMSmartMailbox *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (EMSmartMailbox *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if ((-[EMSmartMailbox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMSmartMailbox smartMailboxType](self, "smartMailboxType");
    if (v6 == -[EMSmartMailbox smartMailboxType](v5, "smartMailboxType")
      && (v7 = -[EMMailbox type](self, "type"), v7 == -[EMMailbox type](v5, "type")))
    {
      -[EMMailbox name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailbox name](v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "ef_caseInsensitiveIsEqualToString:", v9))
      {
        -[EMSmartMailbox mailboxScope](self, "mailboxScope");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMSmartMailbox mailboxScope](v5, "mailboxScope");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = EFObjectsAreEqual();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = -[EMSmartMailbox smartMailboxType](self, "smartMailboxType");
  v4 = -[EMMailbox type](self, "type");
  -[EMMailbox name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 33 * (33 * v3 + v4) + objc_msgSend(v6, "hash") + 35937;

  return v7;
}

- (BOOL)_shouldArchiveByDefault
{
  void *v2;
  void *v3;
  void *v4;

  -[EMMailbox repository](self, "repository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receivingAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "ef_all:", &__block_literal_global_71_1);
  return (char)v2;
}

uint64_t __41__EMSmartMailbox__shouldArchiveByDefault__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldArchiveByDefault");
}

- (int64_t)smartMailboxType
{
  return self->_smartMailboxType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong(&self->_predicateGenerator, 0);
}

@end

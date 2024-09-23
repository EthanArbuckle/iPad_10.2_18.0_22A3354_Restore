@implementation EMMailboxCollection

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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailboxCollection.m"), 18, CFSTR("Wrong repository type"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMMailboxCollection;
  -[EMRepositoryObject setRepository:](&v7, sel_setRepository_, v5);

}

- (EMMailboxCollection)initWithMailbox:(id)a3 repository:(id)a4
{
  id v6;
  id v7;
  EMQuery *v8;
  uint64_t v9;
  void *v10;
  EMQuery *v11;
  EMMailboxCollection *v12;
  EMMailboxCollection *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = [EMQuery alloc];
  v9 = objc_opt_class();
  +[EMMailbox predicateForMailboxChildren:](EMMailbox, "predicateForMailboxChildren:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:](v8, "initWithTargetClass:predicate:sortDescriptors:", v9, v10, MEMORY[0x1E0C9AA60]);

  v15.receiver = self;
  v15.super_class = (Class)EMMailboxCollection;
  v12 = -[EMQueryingCollection initWithObjectID:query:](&v15, sel_initWithObjectID_query_, 0, v11);
  v13 = v12;
  if (v12)
    -[EMMailboxCollection setRepository:](v12, "setRepository:", v7);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMMailboxCollection;
  -[EMQueryingCollection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailboxCollection)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EMMailboxCollection;
  return -[EMQueryingCollection initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (EMMailboxRepository)repository
{
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMMailboxCollection;
  -[EMRepositoryObject repository](&v7, sel_repository);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMailboxCollection.m"), 18, CFSTR("Wrong repository type"));

    }
  }
  return (EMMailboxRepository *)v4;
}

- (EMMailboxCollection)initWithObjectID:(id)a3 query:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EMMailboxCollection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMailboxCollection initWithObjectID:query:]", "EMMailboxCollection.m", 25, "0");
}

- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4
{
  return -[EMMailboxCollection initWithAccount:topLevelOnly:repository:](self, "initWithAccount:topLevelOnly:repository:", a3, a4, 0);
}

- (EMMailboxCollection)initWithAccount:(id)a3 topLevelOnly:(BOOL)a4 repository:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  EMQuery *v10;
  uint64_t v11;
  void *v12;
  EMQuery *v13;
  EMMailboxCollection *v14;
  EMMailboxCollection *v15;
  objc_super v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = [EMQuery alloc];
  v11 = objc_opt_class();
  +[EMMailbox predicateForMailboxAccount:topLevelOnly:](EMMailbox, "predicateForMailboxAccount:topLevelOnly:", v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EMQuery initWithTargetClass:predicate:sortDescriptors:](v10, "initWithTargetClass:predicate:sortDescriptors:", v11, v12, MEMORY[0x1E0C9AA60]);

  v17.receiver = self;
  v17.super_class = (Class)EMMailboxCollection;
  v14 = -[EMQueryingCollection initWithObjectID:query:](&v17, sel_initWithObjectID_query_, 0, v13);
  v15 = v14;
  if (v14)
    -[EMMailboxCollection setRepository:](v14, "setRepository:", v9);

  return v15;
}

- (EMMailboxCollection)initWithMailbox:(id)a3
{
  return -[EMMailboxCollection initWithMailbox:repository:](self, "initWithMailbox:repository:", a3, 0);
}

@end

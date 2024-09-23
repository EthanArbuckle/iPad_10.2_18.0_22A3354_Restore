@implementation MSDeleteTriageAction

- (id)_changeAction
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelectAll");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D1E208]);
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mailboxes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MSTriageAction origin](self, "origin");
    v9 = -[MSTriageAction actor](self, "actor");
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageListItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithMailboxes:origin:actor:messageListItemsToExclude:", v7, v8, v9, v11);

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0D1E200]);
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageListItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithMessageListItems:origin:actor:", v7, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
  }

  return v12;
}

- (BOOL)isUndoSupported
{
  return 0;
}

@end

@implementation MSFlagChangeTriageAction

- (MSFlagChangeTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  MSFlagChangeTriageAction *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSFlagChangeTriageAction;
  result = -[MSTriageAction initWithQuery:origin:actor:delegate:](&v9, sel_initWithQuery_origin_actor_delegate_, a3, a4, a5, a6);
  if (result)
    result->_reason = a7;
  return result;
}

- (MSFlagChangeTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  MSFlagChangeTriageAction *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSFlagChangeTriageAction;
  result = -[MSTriageAction initWithMessageListSelection:origin:actor:delegate:](&v9, sel_initWithMessageListSelection_origin_actor_delegate_, a3, a4, a5, a6);
  if (result)
    result->_reason = a7;
  return result;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v5;

  v5 = a3;
  -[MSFlagChangeTriageAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MSFlagChangeTriageAction _toggleFlagWithBuilder:]", "MSFlagChangeTriageAction.m", 38, "0");
}

- (BOOL)flagState
{
  -[MSFlagChangeTriageAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MSFlagChangeTriageAction flagState]", "MSFlagChangeTriageAction.m", 42, "0");
}

- (ECMessageFlags)messageFlags
{
  -[MSFlagChangeTriageAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MSFlagChangeTriageAction messageFlags]", "MSFlagChangeTriageAction.m", 46, "0");
}

- (BOOL)shouldOverrideFlagState
{
  void *v2;
  char v3;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelectAll");

  return v3;
}

- (id)_changeAction
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];

  v3 = objc_alloc(MEMORY[0x1E0D1E778]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__MSFlagChangeTriageAction__changeAction__block_invoke;
  v17[3] = &unk_1E716DD28;
  v17[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithBuilder:", v17);
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSelectAll");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D1E218]);
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailboxes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageListItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithMailboxes:messageListItemsToExclude:flagChange:origin:actor:", v9, v11, v4, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));

LABEL_6:
    goto LABEL_7;
  }
  -[MSTriageAction query](self, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v15 = objc_alloc(MEMORY[0x1E0D1E210]);
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageListItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v15, "initWithMessageListItems:origin:actor:flagChange:", v9, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
    goto LABEL_6;
  }
  v14 = objc_alloc(MEMORY[0x1E0D1E210]);
  -[MSTriageAction query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithQuery:origin:actor:flagChange:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
LABEL_7:

  return v12;
}

void __41__MSFlagChangeTriageAction__changeAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setReason:", objc_msgSend(*(id *)(a1 + 32), "reason"));
  objc_msgSend(*(id *)(a1 + 32), "_toggleFlagWithBuilder:", v3);

}

- (int64_t)reason
{
  return self->_reason;
}

@end

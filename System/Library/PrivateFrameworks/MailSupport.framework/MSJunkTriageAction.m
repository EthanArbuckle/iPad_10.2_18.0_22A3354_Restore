@implementation MSJunkTriageAction

- (MSJunkTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MSJunkTriageAction *v15;
  char v17;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  if (objc_msgSend((id)objc_opt_class(), "hasNonJunkMessagesInSelection:", v10))
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_5);
    v13 = 1;
  }
  else
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_1);
    v13 = 7;
  }
  v14 = (void *)v12;
  v18.receiver = self;
  v18.super_class = (Class)MSJunkTriageAction;
  v17 = 0;
  v15 = -[MSMoveTriageAction initWithMessageListSelection:origin:actor:delegate:destinationMailboxType:flagChange:copyMessages:](&v18, sel_initWithMessageListSelection_origin_actor_delegate_destinationMailboxType_flagChange_copyMessages_, v10, a4, a5, v11, v13, v12, v17);

  return v15;
}

uint64_t __73__MSJunkTriageAction_initWithMessageListSelection_origin_actor_delegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesJunkLevelTo:", 1);
}

uint64_t __73__MSJunkTriageAction_initWithMessageListSelection_origin_actor_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesJunkLevelTo:", 2);
}

- (BOOL)hasNonJunkMessages
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "hasNonJunkMessagesInSelection:", v4);

  return (char)v3;
}

+ (BOOL)hasNonJunkMessagesInSelection:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isSelectAll"))
  {
    objc_msgSend(v3, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_3);
  }
  else
  {
    objc_msgSend(v3, "messageListItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_5);
  }
  v6 = v5;

  return v6;
}

BOOL __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

uint64_t __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "mailboxes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_6);

  return v3;
}

BOOL __52__MSJunkTriageAction_hasNonJunkMessagesInSelection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

@end

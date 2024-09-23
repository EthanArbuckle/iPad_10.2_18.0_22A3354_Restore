@implementation MSConversationFlagChangeTriageAction

+ (int64_t)conversationNotificationLevel
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[MSConversationFlagChangeTriageAction conversationNotificationLevel]", "MSConversationFlagChangeTriageAction.m", 24, "0");
}

- (MSConversationFlagChangeTriageAction)initWithReferenceMessage:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 reason:(int64_t)a7
{
  id v12;
  id v13;
  MSMessageListItemSelection *v14;
  void *v15;
  MSMessageListItemSelection *v16;
  MSConversationFlagChangeTriageAction *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = [MSMessageListItemSelection alloc];
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MSMessageListItemSelection initWithMessageListItems:](v14, "initWithMessageListItems:", v15);

  v19.receiver = self;
  v19.super_class = (Class)MSConversationFlagChangeTriageAction;
  v17 = -[MSFlagChangeTriageAction initWithMessageListSelection:origin:actor:delegate:reason:](&v19, sel_initWithMessageListSelection_origin_actor_delegate_reason_, v16, a4, a5, v13, a7);

  return v17;
}

- (EMMessage)referenceMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageListItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMMessage *)v6;
}

- (id)messageFlags
{
  void *v2;
  void *v3;

  -[MSConversationFlagChangeTriageAction referenceMessage](self, "referenceMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_changeAction
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

  -[MSConversationFlagChangeTriageAction referenceMessage](self, "referenceMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conversationNotificationLevel"))
    v4 = 0;
  else
    v4 = objc_msgSend((id)objc_opt_class(), "conversationNotificationLevelToSet");

  v5 = (void *)MEMORY[0x1E0C99E60];
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageListItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F8]), "initWithConversationIDs:origin:actor:conversationNotificationLevel:", v10, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), v4);
  return v11;
}

id __53__MSConversationFlagChangeTriageAction__changeAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "conversationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "em_messageListItemTotalCount");

  if (v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSConversationFlagChangeTriageAction.m"), 51, CFSTR("This action only expects a single reference message"));

  }
}

@end

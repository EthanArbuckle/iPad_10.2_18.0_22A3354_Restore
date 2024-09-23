@implementation SGTextMessageConversationTracker

- (SGTextMessageConversationTracker)init
{
  SGTextMessageConversationTracker *v2;
  uint64_t v3;
  SGConversationTracker *conversationTracker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGTextMessageConversationTracker;
  v2 = -[SGTextMessageConversationTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    conversationTracker = v2->_conversationTracker;
    v2->_conversationTracker = (SGConversationTracker *)v3;

  }
  return v2;
}

- (id)conversationForIdentifier:(id)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v9;

  -[SGConversationTracker conversationForSenderID:](self->_conversationTracker, "conversationForSenderID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextMessageConversationTracker.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[result.firstObject isKindOfClass:[SGTextMessageItem class]]"));

  }
  return v5;
}

- (id)addTextMessageItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  SGConversationHistory *v10;
  void *v12;

  v5 = a3;
  -[SGConversationTracker addMessage:](self->_conversationTracker, "addMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextMessageConversationTracker.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[conversation.firstObject isKindOfClass:[SGTextMessageItem class]]"));

  }
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v10 = -[SGConversationHistory initWithMessages:]([SGConversationHistory alloc], "initWithMessages:", v6);
  objc_autoreleasePoolPop(v9);

  return v10;
}

- (void)clear
{
  -[SGConversationTracker clear](self->_conversationTracker, "clear");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationTracker, 0);
}

+ (id)instance
{
  if (instance__pasOnceToken2 != -1)
    dispatch_once(&instance__pasOnceToken2, &__block_literal_global_10727);
  return (id)instance__pasExprOnceResult;
}

+ (id)getMergedPrompt:(id)a3 withParams:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[16];

  v5 = a4;
  objc_msgSend(a3, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v31 = v5;
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    -[NSObject message](v9, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    objc_msgSend(v10, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v14, "isEqualToString:", v18);

    if ((_DWORD)v10)
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v5 = v31;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "Quick responses: Most recent message is not a response to a prompt", buf, 2u);
      }

      v8 = 0;
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __63__SGTextMessageConversationTracker_getMergedPrompt_withParams___block_invoke;
      v32[3] = &unk_1E7DAB8F0;
      v33 = v6;
      objc_msgSend(v33, "_pas_mappedArrayWithIndexedTransform:", v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D19EB8];
      objc_msgSend(v20, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v31;
      v24 = objc_msgSend(v31, "maxPromptLength");
      objc_msgSend(v31, "maxPromptWindowSeconds");
      v26 = v25;
      objc_msgSend(v31, "promptJoiningString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "getMergedPromptForMessage:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:", v23, v20, v24, v27, v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = v30;

  }
  else
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Quick responses: A conversation must have more than 2 messages for a prompt; returning prompt as nil",
        buf,
        2u);
    }
    v8 = 0;
  }

  return v8;
}

id __63__SGTextMessageConversationTracker_getMergedPrompt_withParams___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 <= a3)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D197C0]);
    objc_msgSend(v5, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithText:senderID:timestamp:", v11, v9, v12);

  }
  return v13;
}

void __44__SGTextMessageConversationTracker_instance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)instance__pasExprOnceResult;
  instance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end

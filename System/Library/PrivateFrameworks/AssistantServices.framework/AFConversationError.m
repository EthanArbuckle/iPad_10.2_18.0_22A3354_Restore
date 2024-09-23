@implementation AFConversationError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:userInfo:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:localizedFailureReason:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

- (AFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return -[AFConversationError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("com.apple.assistant.conversation.ErrorDomain"), a3, a4);
}

- (AFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  AFConversationError *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CB2D68];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFConversationError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, v8);
  return v9;
}

- (AFConversationError)initWithCode:(int64_t)a3
{
  return -[AFConversationError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, 0);
}

@end

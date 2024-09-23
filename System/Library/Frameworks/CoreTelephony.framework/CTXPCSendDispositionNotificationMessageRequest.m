@implementation CTXPCSendDispositionNotificationMessageRequest

- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 notificationType:(int64_t)a6 notificationMessageID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  CTXPCSendDispositionNotificationMessageRequest *v18;
  objc_super v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21[0] = CFSTR("destination");
  v21[1] = CFSTR("messageID");
  v22[0] = v13;
  v22[1] = v14;
  v21[2] = CFSTR("notificationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = CFSTR("notificationMessageID");
  v22[2] = v16;
  v22[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)CTXPCSendDispositionNotificationMessageRequest;
  v18 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v20, sel_initWithContext_namedArguments_, v12, v17);

  return v18;
}

- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 groupChatURI:(id)a4 destination:(id)a5 messageID:(id)a6 notificationType:(int64_t)a7 notificationMessageID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  CTXPCSendDispositionNotificationMessageRequest *v21;
  objc_super v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v24[0] = CFSTR("groupChatURI");
  v24[1] = CFSTR("destination");
  v25[0] = v15;
  v25[1] = v16;
  v25[2] = v17;
  v24[2] = CFSTR("messageID");
  v24[3] = CFSTR("notificationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = CFSTR("notificationMessageID");
  v25[3] = v19;
  v25[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)CTXPCSendDispositionNotificationMessageRequest;
  v21 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v23, sel_initWithContext_namedArguments_, v14, v20);

  return v21;
}

- (CTLazuliDestination)destination
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("destination"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliDestination>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliDestination *)v4;
}

- (CTLazuliGroupChatUri)groupChatURI
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("groupChatURI"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTLazuliGroupChatUri *)v4;
}

- (CTLazuliMessageID)messageID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("messageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliMessageID>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliMessageID *)v4;
}

- (int64_t)notificationType
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("notificationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (CTLazuliMessageID)notificationMessageID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("notificationMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliMessageID>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliMessageID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendDispositionNotificationMessageRequest messageID](self, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CTXPCSendDispositionNotificationMessageRequest notificationType](self, "notificationType");
  -[CTXPCSendDispositionNotificationMessageRequest notificationMessageID](self, "notificationMessageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendDispositionNotificationMessageRequest destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendDispositionNotificationMessageRequest groupChatURI](self, "groupChatURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke;
    v17[3] = &unk_1E152DA48;
    v14 = &v18;
    v18 = v7;
    objc_msgSend(v6, "sendGroupDispositionNotificationMessage:toGroup:to:withMessageID:withDisposition:forMessageID:completion:", v8, v13, v12, v9, v10, v11, v17);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v15[3] = &unk_1E152DA48;
    v14 = &v16;
    v16 = v7;
    objc_msgSend(v6, "sendDispositionNotificationMessage:to:withMessageID:withDisposition:forMessageID:completion:", v8, v12, v9, v10, v11, v15);
  }

}

uint64_t __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendDispositionNotificationMessageRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

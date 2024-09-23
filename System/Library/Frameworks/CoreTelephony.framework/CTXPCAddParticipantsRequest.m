@implementation CTXPCAddParticipantsRequest

- (CTXPCAddParticipantsRequest)initWithContext:(id)a3 groupChatURI:(id)a4 participants:(id)a5 operationID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCAddParticipantsRequest *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = CFSTR("groupChatURI");
  v18[1] = CFSTR("participants");
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = CFSTR("operationID");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCAddParticipantsRequest;
  v15 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v17, sel_initWithContext_namedArguments_, v10, v14);

  return v15;
}

- (CTLazuliGroupChatUri)groupChatURI
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("groupChatURI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliGroupChatUri>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliGroupChatUri *)v4;
}

- (CTLazuliGroupChatParticipantList)participants
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("participants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliGroupChatParticipantList>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliGroupChatParticipantList *)v4;
}

- (CTLazuliOperationID)operationID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("operationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliOperationID>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliOperationID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCAddParticipantsRequest groupChatURI](self, "groupChatURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCAddParticipantsRequest participants](self, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCAddParticipantsRequest operationID](self, "operationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__CTXPCAddParticipantsRequest_performRequestWithHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E152DA48;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v6, "addParticipants:toGroupChat:withParticipantsToAdd:withOperationID:completion:", v8, v9, v10, v11, v13);

}

uint64_t __75__CTXPCAddParticipantsRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCAddParticipantsRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

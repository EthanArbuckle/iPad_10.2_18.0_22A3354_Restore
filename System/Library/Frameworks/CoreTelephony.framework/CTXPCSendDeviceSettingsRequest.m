@implementation CTXPCSendDeviceSettingsRequest

- (CTXPCSendDeviceSettingsRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 settings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCSendDeviceSettingsRequest *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = CFSTR("destination");
  v18[1] = CFSTR("messageID");
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = CFSTR("settings");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendDeviceSettingsRequest;
  v15 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v17, sel_initWithContext_namedArguments_, v10, v14);

  return v15;
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

- (CTLazuliSuggestedActionSettings)settings
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliSuggestedActionSettings>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliSuggestedActionSettings *)v4;
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
  -[CTXPCSendDeviceSettingsRequest destination](self, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendDeviceSettingsRequest messageID](self, "messageID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendDeviceSettingsRequest settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__CTXPCSendDeviceSettingsRequest_performRequestWithHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E152DA48;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v6, "sendDeviceSettings:to:withMessageID:withSetting:completion:", v8, v9, v10, v11, v13);

}

uint64_t __78__CTXPCSendDeviceSettingsRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendDeviceSettingsRequest;
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

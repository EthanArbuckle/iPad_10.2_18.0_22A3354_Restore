@implementation FARequestConfigurator(FamilyCircleUI)

- (id)urlProvider
{
  return (id)objc_opt_new();
}

- (void)requestForContext:()FamilyCircleUI withCompletion:
{
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, void *, _QWORD);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD aBlock[4];
  id v18;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__FARequestConfigurator_FamilyCircleUI__requestForContext_withCompletion___block_invoke;
  aBlock[3] = &unk_24C88BEA8;
  v18 = v7;
  v8 = v7;
  v9 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v6, "urlForContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Context has url override", v16, 2u);
    }

    objc_msgSend(v6, "urlForContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12, 0);
  }
  else
  {
    objc_msgSend(v6, "urlEndpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _FALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEFAULT, "Context has urlEndpoint override.", v16, 2u);
      }

      objc_msgSend(a1, "urlProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "urlEndpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLForEndpoint:withCompletion:", v15, v9);

    }
    else
    {
      objc_msgSend(v6, "eventType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_urlForEventType:withCompletion:", v12, v9);
    }
  }

}

- (void)_urlForEventType:()FamilyCircleUI withCompletion:
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_urlEndpointForEventType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Desired enpoint %@ for event type %@", (uint8_t *)&v11, 0x16u);
  }

  if (v8)
  {
    objc_msgSend(a1, "urlProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForEndpoint:withCompletion:", v8, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1008);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (id)_urlEndpointForEventType:()FamilyCircleUI
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _urlEndpointForEventType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_urlEndpointForEventType__onceToken, &__block_literal_global_5);
  objc_msgSend((id)_urlEndpointForEventType__eventTypeToEndpointMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)addMessageEligibilityToPayload:()FamilyCircleUI
{
  const __CFString *v3;
  id v4;

  v4 = a3;
  if (+[FAMessagesInviteConfigurationController isAvailable](FAMessagesInviteConfigurationController, "isAvailable"))
  {
    v3 = CFSTR("1");
  }
  else
  {
    v3 = CFSTR("0");
  }
  objc_msgSend(v4, "setValue:forKey:", v3, *MEMORY[0x24BE308F8]);

}

@end

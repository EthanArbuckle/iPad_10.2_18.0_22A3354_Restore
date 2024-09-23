@implementation NSPersonNameComponents(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "namePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("prefix"));

  objc_msgSend(a1, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("given"));

  objc_msgSend(a1, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("middle"));

  objc_msgSend(a1, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("family"));

  objc_msgSend(a1, "nameSuffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("suffix"));

  objc_msgSend(a1, "nickname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("nick"));

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1730];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNamePrefix:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("given"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGivenName:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("middle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMiddleName:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("family"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFamilyName:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suffix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNameSuffix:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nick"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setNickname:", v11);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end

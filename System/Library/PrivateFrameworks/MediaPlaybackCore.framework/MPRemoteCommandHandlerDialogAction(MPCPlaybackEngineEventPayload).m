@implementation MPRemoteCommandHandlerDialogAction(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("title"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(a1, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mpc_jsonValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("event"));

  return v2;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDDCB68];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadValueFromJSONValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "actionWithTitle:type:commandEvent:", v8, objc_msgSend(v9, "integerValue"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

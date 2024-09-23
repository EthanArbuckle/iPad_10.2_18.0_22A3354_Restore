@implementation MPRemoteCommandStatus(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "statusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("code"));

  v5 = objc_msgSend(a1, "type");
  switch(v5)
  {
    case 999:
      objc_msgSend(a1, "customData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mpc_jsonValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("data"));

      objc_msgSend(a1, "customDataType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("dataType"));
LABEL_8:

      return v2;
    case 3:
      objc_msgSend(a1, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mpc_jsonValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("error");
      goto LABEL_7;
    case 2:
      objc_msgSend(a1, "dialog");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mpc_jsonValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("dialog");
LABEL_7:
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v8);

      goto LABEL_8;
  }
  return v2;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = 0;
  if (v8 > 2)
  {
    if (v8 == 3)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "payloadValueFromJSONValue:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "statusWithCode:error:", v6, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v8 == 999)
    {
      v14 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "payloadValueFromJSONValue:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "statusWithCode:customData:type:", v6, v16, v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (v8 == 1)
  {
    objc_msgSend(a1, "statusWithCode:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v8 == 2)
  {
    v10 = (void *)MEMORY[0x24BDDCB70];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "payloadValueFromJSONValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "statusWithCode:dialog:", v6, v12);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (void *)v13;

  }
  return v9;
}

@end

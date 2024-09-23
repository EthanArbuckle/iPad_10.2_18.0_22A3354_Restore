@implementation MPRemoteCommandEvent(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("mrCommand");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "mediaRemoteCommandType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("options");
  v9[0] = v2;
  objc_msgSend(a1, "mediaRemoteOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1B8];
  _coerceJSONValueFromValue(v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mrCommand"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCB58]), "initWithMediaRemoteCommandType:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = *MEMORY[0x24BE659D8];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE659D8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "payloadValueFromJSONValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v10);

    }
    _coercePayloadFromJSONValue(v9, &stru_24CABB5D0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "eventWithCommand:mediaRemoteType:options:", v7, v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end

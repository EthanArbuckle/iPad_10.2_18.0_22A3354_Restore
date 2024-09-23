@implementation ICLiveLinkIdentity(MPCPlaybackEngineEventPayload)

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "serverID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("serverID"));

  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  objc_msgSend(a1, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("externalID"));

  objc_msgSend(a1, "nameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("nameComponents"));

  objc_msgSend(a1, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("imageURL"));

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__ICLiveLinkIdentity_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke;
  v9[3] = &unk_24CAB8AA8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "_initWithBlock:", v9);

  return v7;
}

@end

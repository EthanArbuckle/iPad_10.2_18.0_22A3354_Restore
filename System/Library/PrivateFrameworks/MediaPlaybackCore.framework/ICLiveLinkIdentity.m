@implementation ICLiveLinkIdentity

void __79__ICLiveLinkIdentity_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("serverID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setServerID:", objc_msgSend(v3, "integerValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
    objc_msgSend(v15, "setIdentifier:", v7);

  }
  else
  {
    objc_msgSend(v15, "setIdentifier:", 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("externalID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExternalIdentifier:", v8);

  v9 = (void *)MEMORY[0x24BDD1730];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("nameComponents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadValueFromJSONValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNameComponents:", v11);

  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("imageURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadValueFromJSONValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImageURL:", v14);

}

@end

@implementation MPCSharedSessionParticipant

- (id)mpc_jsonValue
{
  id v3;
  int64_t sessionType;
  void *v5;
  void *v6;
  NSString *expanseIdentifier;
  NSString *v8;
  NSString *liveLinkIdentifier;
  NSString *v10;
  void *v11;
  NSString *mediaRemoteGroupSessionIdentifier;
  NSString *v13;
  NSString *mediaRemoteUserIdentityIdentifier;
  NSString *v15;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self)
    sessionType = self->_sessionType;
  else
    sessionType = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", sessionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sessionType"));

  if (self)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_local);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isLocal"));

    expanseIdentifier = self->_expanseIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isLocal"));

    expanseIdentifier = 0;
  }
  v8 = expanseIdentifier;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expanseID"));

  if (self)
    liveLinkIdentifier = self->_liveLinkIdentifier;
  else
    liveLinkIdentifier = 0;
  v10 = liveLinkIdentifier;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("liveLinkID"));

  if (self)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_liveLinkServiceIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("liveLinkServerID"));

    mediaRemoteGroupSessionIdentifier = self->_mediaRemoteGroupSessionIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("liveLinkServerID"));

    mediaRemoteGroupSessionIdentifier = 0;
  }
  v13 = mediaRemoteGroupSessionIdentifier;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("mrGroupSessionID"));

  if (self)
    mediaRemoteUserIdentityIdentifier = self->_mediaRemoteUserIdentityIdentifier;
  else
    mediaRemoteUserIdentityIdentifier = 0;
  v15 = mediaRemoteUserIdentityIdentifier;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mrUserIdentityID"));

  return v3;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  MPCSharedSessionParticipant *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  objc_super v22;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sessionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = [MPCSharedSessionParticipant alloc];
  if (v6)
  {
    v22.receiver = v6;
    v22.super_class = (Class)MPCSharedSessionParticipant;
    v7 = objc_msgSendSuper2(&v22, sel_init);
    v8 = v7;
    if (v7)
      v7[2] = v5;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isLocal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");
  if (v8)
    *((_BYTE *)v8 + 8) = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expanseID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v11, v12, 24);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("liveLinkID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v13, v14, 32);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("liveLinkServerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");
  if (v8)
    v8[5] = v16;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mrGroupSessionID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v17, v18, 48);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mrUserIdentityID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_setProperty_nonatomic_copy(v8, v20, v19, 56);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteUserIdentityIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteGroupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_liveLinkIdentifier, 0);
  objc_storeStrong((id *)&self->_expanseIdentifier, 0);
}

- (id)humanDescription
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(v1 + 24), "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expanseID=%@"), *(_QWORD *)(v1 + 24));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v3);

    }
    if (objc_msgSend(*(id *)(v1 + 32), "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("liveLinkID=%@"), *(_QWORD *)(v1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

    }
    if (*(_QWORD *)(v1 + 40))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("liveLinkServerID=%ld"), *(_QWORD *)(v1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
    if (objc_msgSend(*(id *)(v1 + 48), "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mrGroupSessionID=%@"), *(_QWORD *)(v1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
    if (objc_msgSend(*(id *)(v1 + 56), "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mrUserIdentityID=%@"), *(_QWORD *)(v1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v7);

    }
    if (*(_BYTE *)(v1 + 8))
      objc_msgSend(v2, "addObject:", CFSTR("isLocal"));
    objc_msgSend(v2, "msv_compactDescription");
    v1 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v1;
}

@end

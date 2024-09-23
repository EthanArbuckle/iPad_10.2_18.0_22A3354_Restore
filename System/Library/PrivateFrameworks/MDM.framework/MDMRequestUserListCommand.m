@implementation MDMRequestUserListCommand

+ (id)requestType
{
  return CFSTR("UserList");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestUserListCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestUserListCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a4;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allUsers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v31 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v6, "currentUser");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v10)
    {
      v11 = v10;
      v33 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          v13 = v9;
          if (*(_QWORD *)v36 != v33)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v39[0] = CFSTR("UserName");
          objc_msgSend(v14, "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = v15;
          v39[1] = CFSTR("HasDataToSync");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "hasDataToSync"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v40[1] = v16;
          v39[2] = CFSTR("IsLoggedIn");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "isEqualToUser:", v34));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v40[2] = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          v20 = objc_msgSend(v14, "dataQuota");
          v21 = objc_msgSend(v14, "dataUsed");
          if (v20)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("DataQuota"));

          }
          if (v21)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("DataUsed"));

          }
          v9 = v13;
          objc_msgSend(v13, "addObject:", v19);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v11);
    }

    v24 = v31;
    objc_msgSend(v31, "setObject:forKey:", v9, CFSTR("Users"));
    v4[2](v4, v31);

    v8 = v29;
    v6 = v30;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:errorType:", v26, 12070, v27, *MEMORY[0x24BE2A588], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v9;
      _os_log_impl(&dword_222CB9000, v28, OS_LOG_TYPE_ERROR, "Failed to retrieve user list with error %{public}@", buf, 0xCu);
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v24);
  }

}

@end

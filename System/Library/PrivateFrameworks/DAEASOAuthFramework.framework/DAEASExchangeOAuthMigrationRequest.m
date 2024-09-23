@implementation DAEASExchangeOAuthMigrationRequest

+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 tokenRequestURI:(id)a4 password:(id)a5 scope:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;

  v9 = (void *)MEMORY[0x24BDBCF48];
  v10 = a6;
  v41 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "URLWithString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("/common");
  v17 = objc_msgSend(v15, "hasPrefix:", CFSTR("/common"));

  if ((v17 & 1) != 0
    || (objc_msgSend(v13, "path"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = CFSTR("/consumers"),
        v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("/consumers")),
        v18,
        v19))
  {
    v20 = objc_msgSend(v14, "rangeOfString:", v16);
    objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v20, v21, CFSTR("/organizations"));
    v22 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v22;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v11);

  objc_msgSend(v23, "setPath:", v14);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("response_type"), CFSTR("code"));
  objc_msgSend(v24, "addObject:", v25);

  v26 = objc_alloc(MEMORY[0x24BDD1838]);
  +[DAEASOAuthClient clientIDForOAuthType:](DAEASOAuthClient, "clientIDForOAuthType:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("client_id"), v27);
  objc_msgSend(v24, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("grant_type"), CFSTR("password"));
  objc_msgSend(v24, "addObject:", v29);

  v30 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("scope"), v31);
  objc_msgSend(v24, "addObject:", v32);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("username"), v12);
  objc_msgSend(v24, "addObject:", v33);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("password"), v41);
  objc_msgSend(v24, "addObject:", v34);

  objc_msgSend(v23, "setQueryItems:", v24);
  v35 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v23, "URL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "requestWithURL:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "percentEncodedQuery");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dataUsingEncoding:", 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHTTPBody:", v39);

  objc_msgSend(v37, "setCachePolicy:", 1);
  objc_msgSend(v37, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v37, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v37;
}

@end

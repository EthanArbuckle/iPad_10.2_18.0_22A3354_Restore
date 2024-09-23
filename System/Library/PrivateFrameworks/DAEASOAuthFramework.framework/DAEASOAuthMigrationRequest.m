@implementation DAEASOAuthMigrationRequest

+ (id)urlRequestForOAuthTokenFromUsername:(id)a3 password:(id)a4 scope:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCF48];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "URLWithString:", CFSTR("https://login.live.com/oauth20_token.srf"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = CFSTR("response_type=code");
  v13 = (void *)MEMORY[0x24BDD17C8];
  +[DAEASOAuthClient clientIDForOAuthType:](DAEASOAuthClient, "clientIDForOAuthType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("client_id=%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("grant_type=%@"), CFSTR("password"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scope=%@"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("username=%@"), v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26[4] = v18;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("password=%@"), v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[5] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("&"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHTTPBody:", v23);

  objc_msgSend(v11, "setCachePolicy:", 1);
  objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v11;
}

@end

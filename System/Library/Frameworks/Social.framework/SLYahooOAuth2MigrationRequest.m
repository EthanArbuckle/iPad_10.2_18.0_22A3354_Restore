@implementation SLYahooOAuth2MigrationRequest

+ (id)urlRequestForOAuthTokenFromLoginToken:(id)a3 clientID:(id)a4 clientSecret:(id)a5 src:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;

  v9 = (void *)MEMORY[0x1E0C99E98];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "URLWithString:", CFSTR("https://api.login.yahoo.com/oauth2/exchange_token"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSince1970");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("legacytokentype=tokenlogin&legacysrc=%@&client_id=%@&client_secret=%@&oauth_timestamp=%u&legacytoken=%@"), v10, v12, v11, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPBody:", v22);

  objc_msgSend(v15, "setCachePolicy:", 1);
  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));

  return v15;
}

@end

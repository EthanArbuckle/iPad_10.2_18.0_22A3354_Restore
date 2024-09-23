@implementation SLYahooLoginTokenRequest

+ (id)urlRequestForLoginTokenFromUsername:(id)a3 password:(id)a4 src:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://login.yahoo.com/config/pwtoken_get?login=%@&passwd=%@&src=%@"), a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCachePolicy:", 1);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));

  return v8;
}

@end

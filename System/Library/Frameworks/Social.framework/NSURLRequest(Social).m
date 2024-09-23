@implementation NSURLRequest(Social)

+ (id)sl_urlRequestWithToken:()Social forURLString:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37A8];
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(v6, "URLWithString:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCachePolicy:", 1);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("Authorization"));
  return v9;
}

@end

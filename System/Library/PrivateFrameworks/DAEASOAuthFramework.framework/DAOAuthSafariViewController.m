@implementation DAOAuthSafariViewController

+ (id)authenticationSessionWithURL:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("http")))
  {

  }
  else
  {
    objc_msgSend(v5, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("https"));

    if (!v9)
    {
      v12 = 0;
      goto LABEL_6;
    }
  }
  v10 = objc_alloc(MEMORY[0x24BDB7178]);
  objc_msgSend(v5, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithURL:callbackURLScheme:completionHandler:", v5, v11, v6);

LABEL_6:
  return v12;
}

@end

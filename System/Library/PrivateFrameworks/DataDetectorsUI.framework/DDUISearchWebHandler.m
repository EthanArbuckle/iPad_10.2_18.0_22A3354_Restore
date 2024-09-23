@implementation DDUISearchWebHandler

+ (id)webSearchURLForQueryString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CD57A0];
    v4 = a3;
    objc_msgSend(v3, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSearchEngines");

    objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultSearchEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchURLForUserTypedString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end

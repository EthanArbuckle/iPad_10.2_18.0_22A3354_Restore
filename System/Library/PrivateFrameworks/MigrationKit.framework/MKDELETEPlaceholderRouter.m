@implementation MKDELETEPlaceholderRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  MKPlaceholder *v8;
  id v9;

  objc_msgSend(a4, "headers", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/")))
  {

    v7 = 0;
  }
  v8 = -[MKPlaceholder initWithBundleIdentifier:]([MKPlaceholder alloc], "initWithBundleIdentifier:", v7);
  -[MKPlaceholder uninstall](v8, "uninstall");

}

@end

@implementation NUApplicationURLHandler

- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = (void *)MEMORY[0x24BDF6800];
  v9 = a4;
  objc_msgSend(v8, "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("urlWasOpenedFromNews"));
  if (objc_msgSend(v14, "fc_isNewsURL")
    && (objc_msgSend(v10, "delegate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "application:openURL:options:", v10, v14, v11),
        v12,
        v13))
  {
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    objc_msgSend(v10, "openURL:options:completionHandler:", v14, v11, v7);
  }

}

@end

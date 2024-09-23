@implementation NSURLRequest(FCAdditions)

+ (id)fcRequestWithURL:()FCAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C92C28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(MEMORY[0x1E0C92C80], "overrideUserAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v7, CFSTR("User-Agent"));

  if (objc_opt_class() == a1)
    v8 = v6;
  else
    v8 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCFURLRequest:", objc_msgSend(objc_retainAutorelease(v6), "_CFURLRequest"));
  v9 = v8;

  return v9;
}

+ (void)setupFeldsparUserAgent
{
  objc_class *v0;
  objc_class *v1;

  v0 = (objc_class *)objc_opt_class();
  FCSwizzleClassMethods(v0, sel_fcRequestWithURL_, sel_requestWithURL_);
  v1 = (objc_class *)objc_opt_class();
  FCSwizzleClassMethods(v1, sel_fcRequestWithURL_cachePolicy_timeoutInterval_, sel_requestWithURL_cachePolicy_timeoutInterval_);
}

+ (id)fcRequestWithURL:()FCAdditions cachePolicy:timeoutInterval:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0C92C28];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithURL:cachePolicy:timeoutInterval:", v9, a5, a2);

  objc_msgSend(MEMORY[0x1E0C92C80], "overrideUserAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("User-Agent"));

  if (objc_opt_class() == a1)
    v12 = v10;
  else
    v12 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCFURLRequest:", objc_msgSend(objc_retainAutorelease(v10), "_CFURLRequest"));
  v13 = v12;

  return v13;
}

@end

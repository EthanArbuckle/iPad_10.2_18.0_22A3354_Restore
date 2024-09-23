@implementation AMSLookupDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v4;
  AMSLookupResult *v5;
  void *v6;
  AMSLookupResult *v7;
  void *v8;
  double v9;
  void *v10;

  v4 = a3;
  v5 = [AMSLookupResult alloc];
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSLookupResult initWithResult:dictionary:](v5, "initWithResult:dictionary:", v4, v6);

  objc_msgSend(v4, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "ams_expirationInterval");
    if (v9 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSLookupResult setExpirationDate:](v7, "setExpirationDate:", v10);

    }
  }

  return v7;
}

@end

@implementation SKOneErrorEvent

- (id)eventName
{
  return CFSTR("com.apple.storekit.skoneerrorencountered");
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKOneErrorEvent;
  -[SKBaseErrorEvent createPayload](&v12, sel_createPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (v4)
  {
    -[SKBaseErrorEvent mappedError](self, "mappedError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SKErrorDomain"));

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[SKBaseErrorEvent mappedError](self, "mappedError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "code"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, 0x1E5B2EAE0);

    }
  }
  return v4;
}

@end

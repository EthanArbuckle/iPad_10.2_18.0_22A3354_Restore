@implementation AMSNilBagValueFilteringProxy

+ (id)proxyWithBag:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBag:", v4);

  return v5;
}

- (AMSNilBagValueFilteringProxy)initWithBag:(id)a3
{
  id v5;
  AMSNilBagValueFilteringProxy *v6;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_wrappedBag, a3);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AMSBagProtocol)wrappedBag
{
  return self->_wrappedBag;
}

- (id)_substituteNilIfNeededWithValue:(id)a3 key:(id)a4 valueType:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = a4;
    AMSError(204, CFSTR("Bag Value Missing"), CFSTR("The underlying bag returned nil instead of an AMSBagValue instance."), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagValue failingBagValueWithKey:valueType:error:](AMSBagValue, "failingBagValueWithKey:valueType:error:", v10, a5, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedBag, 0);
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)integerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v6, v4, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:account:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSNilBagValueFilteringProxy _substituteNilIfNeededWithValue:key:valueType:](self, "_substituteNilIfNeededWithValue:key:valueType:", v9, v7, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeWithTarget:", v5);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[AMSNilBagValueFilteringProxy wrappedBag](self, "wrappedBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

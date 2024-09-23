@implementation LKLogKeychainItemAdditionEvent

+ (id)eventFromLKLogEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProcess:", v6);

  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDate:", v8);

  objc_msgSend(v3, "senderImagePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSenderImagePath:", v10);

  objc_msgSend(v4, "setActivityIdentifier:", objc_msgSend(v3, "activityIdentifier"));
  objc_msgSend(v3, "composedMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setComposedMessage:", v12);

  return v4;
}

- (void)setKeychainItemAdded:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_keychainItemAdded != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_keychainItemAdded, a3);
    v5 = v6;
  }

}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LKLogKeychainItemAdditionEvent;
  -[LKLogEvent dictionary](&v9, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[LKLogKeychainItemAdditionEvent keychainItemAdded](self, "keychainItemAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("keychainItemAdded"));
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("keychainItemAdded"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSString)keychainItemAdded
{
  return self->_keychainItemAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainItemAdded, 0);
}

@end

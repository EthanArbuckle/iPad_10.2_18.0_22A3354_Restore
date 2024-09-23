@implementation DIIdentityIntentToStore

- (DIIdentityIntentToStore)initWithIdentifier:(id)a3
{
  NSString *v4;
  DIIdentityIntentToStore *v5;
  NSString *identifier;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIdentityIntentToStore;
  v5 = -[DIIdentityIntentToStore init](&v8, sel_init);
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

+ (DIIdentityIntentToStore)willNotStoreIntent
{
  DIIdentityIntentToStore *v2;
  void *v3;
  DIIdentityIntentToStore *v4;

  v2 = [DIIdentityIntentToStore alloc];
  +[IdentityIntentToStoreRawValueKeys willNotStore](_TtC7CoreIDV33IdentityIntentToStoreRawValueKeys, "willNotStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityIntentToStore initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityIntentToStore)mayStoreIntent
{
  DIIdentityIntentToStore *v2;
  void *v3;
  DIIdentityIntentToStore *v4;

  v2 = [DIIdentityIntentToStore alloc];
  +[IdentityIntentToStoreRawValueKeys mayStore](_TtC7CoreIDV33IdentityIntentToStoreRawValueKeys, "mayStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityIntentToStore initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (id)mayStoreIntentForDays:(int64_t)a3
{
  DIIdentityIntentToStore *v4;
  void *v5;
  DIIdentityIntentToStore *v6;

  v4 = [DIIdentityIntentToStore alloc];
  +[IdentityIntentToStoreRawValueKeys mayStoreForDays:](_TtC7CoreIDV33IdentityIntentToStoreRawValueKeys, "mayStoreForDays:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DIIdentityIntentToStore initWithIdentifier:](v4, "initWithIdentifier:", v5);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

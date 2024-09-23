@implementation INMediaUserContext

- (INMediaUserContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INMediaUserContext;
  return (INMediaUserContext *)-[INUserContext _init](&v3, sel__init);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t subscriptionStatus;
  id v5;
  id v6;

  subscriptionStatus = self->_subscriptionStatus;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", subscriptionStatus, CFSTR("SubscriptionStatus"));
  -[INMediaUserContext safeLibraryItems](self, "safeLibraryItems");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("NumberOfLibraryItems"));

}

- (INMediaUserContext)initWithCoder:(id)a3
{
  id v4;
  INMediaUserContext *v5;
  uint64_t v6;
  NSNumber *numberOfLibraryItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INMediaUserContext;
  v5 = -[INUserContext _init](&v9, sel__init);
  if (v5)
  {
    v5->_subscriptionStatus = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("SubscriptionStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NumberOfLibraryItems"));
    v6 = objc_claimAutoreleasedReturnValue();
    numberOfLibraryItems = v5->_numberOfLibraryItems;
    v5->_numberOfLibraryItems = (NSNumber *)v6;

  }
  return v5;
}

- (id)safeLibraryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[INMediaUserContext numberOfLibraryItems](self, "numberOfLibraryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[INMediaUserContext _sharedFormatter](INMediaUserContext, "_sharedFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", self->_numberOfLibraryItems);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[INMediaUserContext _sharedFormatter](INMediaUserContext, "_sharedFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberFromString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (INMediaUserContextSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(INMediaUserContextSubscriptionStatus)subscriptionStatus
{
  self->_subscriptionStatus = subscriptionStatus;
}

- (NSNumber)numberOfLibraryItems
{
  return self->_numberOfLibraryItems;
}

- (void)setNumberOfLibraryItems:(NSNumber *)numberOfLibraryItems
{
  objc_setProperty_nonatomic_copy(self, a2, numberOfLibraryItems, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfLibraryItems, 0);
}

+ (int64_t)_type
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_sharedFormatter
{
  if (_sharedFormatter_onceToken != -1)
    dispatch_once(&_sharedFormatter_onceToken, &__block_literal_global_6932);
  return (id)_sharedFormatter_sharedFormatter;
}

uint64_t __38__INMediaUserContext__sharedFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_sharedFormatter_sharedFormatter;
  _sharedFormatter_sharedFormatter = (uint64_t)v0;

  objc_msgSend((id)_sharedFormatter_sharedFormatter, "setUsesSignificantDigits:", 1);
  objc_msgSend((id)_sharedFormatter_sharedFormatter, "setMaximumSignificantDigits:", 2);
  objc_msgSend((id)_sharedFormatter_sharedFormatter, "setMaximumFractionDigits:", 0);
  return objc_msgSend((id)_sharedFormatter_sharedFormatter, "setGeneratesDecimalNumbers:", 0);
}

@end

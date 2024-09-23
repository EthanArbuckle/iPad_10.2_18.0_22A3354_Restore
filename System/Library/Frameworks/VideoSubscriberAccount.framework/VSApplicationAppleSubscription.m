@implementation VSApplicationAppleSubscription

- (VSApplicationAppleSubscription)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSApplicationAppleSubscription;
  return -[VSApplicationAppleSubscription init](&v3, sel_init);
}

- (VSApplicationAppleSubscription)initWithAppleSubscription:(id)a3
{
  id v4;
  VSApplicationAppleSubscription *v5;
  void *v6;
  uint64_t v7;
  NSString *customerID;
  void *v9;
  uint64_t v10;
  NSArray *productCodes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSApplicationAppleSubscription;
  v5 = -[VSApplicationAppleSubscription init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "customerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    customerID = v5->_customerID;
    v5->_customerID = (NSString *)v7;

    objc_msgSend(v4, "productCodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    productCodes = v5->_productCodes;
    v5->_productCodes = (NSArray *)v10;

  }
  return v5;
}

- (id)appleSubscription
{
  VSAppleSubscription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VSAppleSubscription *v10;

  v3 = [VSAppleSubscription alloc];
  -[VSApplicationAppleSubscription customerID](self, "customerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self customerID] parameter must not be nil."));
  -[VSApplicationAppleSubscription customerID](self, "customerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[VSApplicationAppleSubscription productCodes](self, "productCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self productCodes] parameter must not be nil."));
  -[VSApplicationAppleSubscription productCodes](self, "productCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = -[VSAppleSubscription initWithCustomerID:productCodes:](v3, "initWithCustomerID:productCodes:", v6, v9);

  return v10;
}

+ (id)appleSubscriptionsFromApplicationAppleSubscriptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "appleSubscription", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)applicationAppleSubscriptionsFromAppleSubscriptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc((Class)objc_opt_class());
        v12 = (void *)objc_msgSend(v11, "initWithAppleSubscription:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)customerID
{
  return self->_customerID;
}

- (void)setCustomerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)productCodes
{
  return self->_productCodes;
}

- (void)setProductCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCodes, 0);
  objc_storeStrong((id *)&self->_customerID, 0);
}

@end

@implementation ABSAddressBookSettings

- (ABSAddressBookSettings)init
{
  _BOOL8 v3;

  v3 = !CNLinkedOnOrAfter() && !ABAddressBookForceNullDatabaseForAccessDeniedIsEnabled();
  return -[ABSAddressBookSettings initWithOptions:policy:](self, "initWithOptions:policy:", 0, v3);
}

- (ABSAddressBookSettings)initWithOptions:(id)a3
{
  return -[ABSAddressBookSettings initWithOptions:policy:](self, "initWithOptions:policy:", a3, 0);
}

- (ABSAddressBookSettings)initWithContactStoreFuture:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ABSAddressBookSettings *v7;

  v4 = (void *)MEMORY[0x24BE192D0];
  v5 = a3;
  objc_msgSend(v4, "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ABSAddressBookSettings initWithOptions:policy:contactStoreFuture:schedulerProvider:](self, "initWithOptions:policy:contactStoreFuture:schedulerProvider:", 0, 0, v5, v6);

  return v7;
}

- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ABSAddressBookSettings *v10;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x24BE19280];
  v7 = a3;
  objc_msgSend(v6, "lazyFutureWithBlock:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE192D0], "defaultProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ABSAddressBookSettings initWithOptions:policy:contactStoreFuture:schedulerProvider:](self, "initWithOptions:policy:contactStoreFuture:schedulerProvider:", v7, v4, v8, v9);

  return v10;
}

id __49__ABSAddressBookSettings_initWithOptions_policy___block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BDBACF8]);
}

- (ABSAddressBookSettings)initWithOptions:(id)a3 policy:(int)a4 contactStoreFuture:(id)a5 schedulerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  ABSAddressBookSettings *v13;
  ABSAddressBookSettings *v14;
  uint64_t v15;
  NSDictionary *options;
  ABSAddressBookSettings *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ABSAddressBookSettings;
  v13 = -[ABSAddressBookSettings init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contactStoreFuture, a5);
    v15 = objc_msgSend(v10, "copy");
    options = v14->_options;
    v14->_options = (NSDictionary *)v15;

    v14->_policy = a4;
    objc_storeStrong((id *)&v14->_schedulerProvider, a6);
    v17 = v14;
  }

  return v14;
}

- (id)newFaultHandlerWithStorage:(id)a3
{
  id v4;
  ABSBulkFaultHandler *v5;
  void *v6;
  void *v7;
  ABSBulkFaultHandler *v8;

  v4 = a3;
  v5 = [ABSBulkFaultHandler alloc];
  -[ABSAddressBookSettings contactStoreFuture](self, "contactStoreFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBookSettings schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ABSBulkFaultHandler initWithStorage:contactStoreFuture:schedulerProvider:](v5, "initWithStorage:contactStoreFuture:schedulerProvider:", v4, v6, v7);

  return v8;
}

- (CNFuture)contactStoreFuture
{
  return self->_contactStoreFuture;
}

- (NSDictionary)options
{
  return self->_options;
}

- (int)policy
{
  return self->_policy;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_contactStoreFuture, 0);
}

@end

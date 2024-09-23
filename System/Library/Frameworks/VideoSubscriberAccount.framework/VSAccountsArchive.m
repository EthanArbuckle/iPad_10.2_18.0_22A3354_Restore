@implementation VSAccountsArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAccountsArchive)init
{
  VSAccountsArchive *v2;
  VSAccountsArchive *v3;
  NSArray *accounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAccountsArchive;
  v2 = -[VSAccountsArchive init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    accounts = v2->_accounts;
    v2->_accounts = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (VSAccountsArchive)initWithCoder:(id)a3
{
  id v4;
  VSAccountsArchive *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *accounts;
  void *v12;
  void *v13;
  _QWORD v15[4];
  VSAccountsArchive *v16;
  objc_super v17;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v17.receiver = self;
  v17.super_class = (Class)VSAccountsArchive;
  v5 = -[VSAccountsArchive init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("accounts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v9, "copy");
      accounts = v5->_accounts;
      v5->_accounts = (NSArray *)v10;
    }
    else
    {
      accounts = v5->_accounts;
      v5->_accounts = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channels"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[VSAccountChannels deserializationResultWithData:](VSAccountChannels, "deserializationResultWithData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __35__VSAccountsArchive_initWithCoder___block_invoke;
      v15[3] = &unk_1E93A02C8;
      v16 = v5;
      objc_msgSend(v13, "unwrapObject:error:", v15, &__block_literal_global_30);

    }
  }

  return v5;
}

void __35__VSAccountsArchive_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

}

void __35__VSAccountsArchive_initWithCoder___block_invoke_2()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __35__VSAccountsArchive_initWithCoder___block_invoke_2_cold_1(v0);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  -[VSAccountsArchive accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accounts"));

  -[VSAccountsArchive channels](self, "channels");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serializationResultWithFormat:", 200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("channels"));

}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VSAccountChannels)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __35__VSAccountsArchive_initWithCoder___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Error deserializing account channels: error", v1, 2u);
}

@end

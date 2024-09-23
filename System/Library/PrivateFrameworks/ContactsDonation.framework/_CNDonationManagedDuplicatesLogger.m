@implementation _CNDonationManagedDuplicatesLogger

- (_CNDonationManagedDuplicatesLogger)init
{
  _CNDonationManagedDuplicatesLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationManagedDuplicatesLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationManagedDuplicatesLogger;
  v2 = -[_CNDonationManagedDuplicatesLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "deduplication");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)managedDuplicateServiceCheckingIn
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "managed duplicate service checking in", v3, 2u);
  }

}

- (void)managedDuplicateServiceCriteria:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "managed duplicate service has criteria %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)willRefreshDuplicates
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Will refresh duplicates", v3, 2u);
  }

}

- (void)didRefreshDuplicates
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Did refresh duplicates", v3, 2u);
  }

}

- (void)didSkipRefreshDuplicates:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Skipping refresh of duplicates due to recent failure. Previous refresh attempted at %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)didFailRefreshingDuplicates:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationManagedDuplicatesLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Failed to refresh duplicates. %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_t, 0);
}

@end

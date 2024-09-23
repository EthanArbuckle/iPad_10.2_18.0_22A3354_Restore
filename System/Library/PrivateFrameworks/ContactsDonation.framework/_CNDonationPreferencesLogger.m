@implementation _CNDonationPreferencesLogger

- (_CNDonationPreferencesLogger)init
{
  _CNDonationPreferencesLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationPreferencesLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationPreferencesLogger;
  v2 = -[_CNDonationPreferencesLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "preferences");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)isDonationsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationPreferencesLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_INFO, "-isDonationsEnabled: %d", (uint8_t *)v5, 8u);
  }

}

- (void)setDonationsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationPreferencesLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_INFO, "-setDonationsEnabled: %d", (uint8_t *)v5, 8u);
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

@implementation _CNDonationAccountLogger

- (_CNDonationAccountLogger)init
{
  _CNDonationAccountLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationAccountLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationAccountLogger;
  v2 = -[_CNDonationAccountLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "accounts");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)pluginLoaded
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAccountLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Plugin loaded", v3, 2u);
  }

}

- (void)pluginUnloaded
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAccountLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_DEFAULT, "Plugin unloaded", v3, 2u);
  }

}

- (void)accountAdded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Account added: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)accountChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Account changed: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)accountRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Account removed: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)donating:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Creating donation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)removing:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Removing donation with identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)donationFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAccountLogger donationFailedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)removalFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[_CNDonationAccountLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNDonationAccountLogger removalFailedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)accountsDidNotChange
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNDonationAccountLogger log_t](self, "log_t");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_209C22000, v2, OS_LOG_TYPE_INFO, "Ignoring account changes (no relevant changes)", v3, 2u);
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

- (void)donationFailedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209C22000, a2, a3, "Could not donate contact information: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)removalFailedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209C22000, a2, a3, "Could not remove donated values: %{public}@", a5, a6, a7, a8, 2u);
}

@end

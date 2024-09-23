@implementation _CNDonationExtensionLogger

- (_CNDonationExtensionLogger)init
{
  _CNDonationExtensionLogger *v2;
  os_log_t v3;
  OS_os_log *log_t;
  _CNDonationExtensionLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNDonationExtensionLogger;
  v2 = -[_CNDonationExtensionLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.donation", "extensions");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)loadedDonorExtension:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_209C22000, v8, OS_LOG_TYPE_DEFAULT, "Loaded extension for donor '%{public}@': %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)couldNotLoadDonorExtensionForIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNDonationExtensionLogger couldNotLoadDonorExtensionForIdentifier:error:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

}

- (void)willRenewDonation:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_209C22000, v5, OS_LOG_TYPE_DEFAULT, "Will renew donation %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)didRenewDonation:(id)a3 untilDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_209C22000, v8, OS_LOG_TYPE_DEFAULT, "Donation %{public}@ renewed until %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)didExpireDonation:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_209C22000, v8, OS_LOG_TYPE_DEFAULT, "Will not renew donation %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)couldNotRenewDonation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_CNDonationExtensionLogger couldNotRenewDonation:error:].cold.1();

}

- (void)willRedonateValuesWithReason:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Will redonate values (reason %{public}@)", (uint8_t *)&v6, 0xCu);

  }
}

- (void)didRedonateValuesWithReason:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_209C22000, v4, OS_LOG_TYPE_DEFAULT, "Did redonate values (reason %{public}@)", (uint8_t *)&v6, 0xCu);

  }
}

- (void)couldNotRedonateValuesWithReason:(unint64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  -[_CNDonationExtensionLogger log_t](self, "log_t");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[_CNDonationExtensionLogger couldNotRedonateValuesWithReason:error:].cold.1(a3, (uint64_t)v6, v7);

}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_t, 0);
}

- (void)couldNotLoadDonorExtensionForIdentifier:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_1(&dword_209C22000, a3, (uint64_t)a3, "Could not load extension for donor '%{public}@' : %@", (uint8_t *)&v3);
}

- (void)couldNotRenewDonation:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_209C22000, v1, (uint64_t)v1, "Could not renew donation %{public}@: %{public}@", v2);
}

- (void)couldNotRedonateValuesWithReason:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v8 = a2;
  OUTLINED_FUNCTION_0_1(&dword_209C22000, a3, v6, "Could not redonate values (reason %{public}@): %{public}@", v7);

}

@end

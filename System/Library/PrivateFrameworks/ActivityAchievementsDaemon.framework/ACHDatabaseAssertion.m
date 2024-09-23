@implementation ACHDatabaseAssertion

+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 error:(id *)a5
{
  return +[ACHDatabaseAssertion assertionWithDatabase:identifier:timeout:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:timeout:error:", a3, a4, a5, 15.0);
}

+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  ACHDatabaseAssertion *v12;
  NSObject *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v16 = 0;
  objc_msgSend(a3, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v9, &v16, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v10)
  {
    v12 = -[ACHDatabaseAssertion initWithHDAssertion:]([ACHDatabaseAssertion alloc], "initWithHDAssertion:", v10);
  }
  else
  {
    ACHLogDatabase();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v18 = v9;
      v19 = 2048;
      v20 = a5;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion for %{public}@ with %lf second timeout with error %{public}@", buf, 0x20u);
    }

    v14 = v11;
    if (v14)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v12 = 0;
  }

  return v12;
}

- (ACHDatabaseAssertion)initWithHDAssertion:(id)a3
{
  id v5;
  ACHDatabaseAssertion *v6;
  ACHDatabaseAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHDatabaseAssertion;
  v6 = -[ACHDatabaseAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assertion, a3);

  return v7;
}

- (void)invalidate
{
  id v2;

  -[ACHDatabaseAssertion assertion](self, "assertion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)dealloc
{
  objc_super v3;

  -[ACHDatabaseAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ACHDatabaseAssertion;
  -[ACHDatabaseAssertion dealloc](&v3, sel_dealloc);
}

- (HDAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end

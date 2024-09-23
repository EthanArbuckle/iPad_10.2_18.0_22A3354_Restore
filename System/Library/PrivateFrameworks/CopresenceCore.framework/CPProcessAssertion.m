@implementation CPProcessAssertion

- (CPProcessAssertion)initWithBundleIdentifier:(id)a3
{
  id v5;
  CPProcessAssertion *v6;
  CPProcessAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPProcessAssertion;
  v6 = -[CPProcessAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_processAssertion)
  {
    CPDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CPProcessAssertion bundleIdentifier](self, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v7 = "-[CPProcessAssertion dealloc]";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1ACCCC000, v3, OS_LOG_TYPE_INFO, "%s Invalidating process assertion for %@", buf, 0x16u);

    }
    -[BKSProcessAssertion invalidate](self->_processAssertion, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)CPProcessAssertion;
  -[CPProcessAssertion dealloc](&v5, sel_dealloc);
}

- (void)acquireWithCompletionHandler:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CFE308];
  v5 = a3;
  v6 = [v4 alloc];
  -[CPProcessAssertion bundleIdentifier](self, "bundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CPProcessAssertion name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:flags:reason:name:withHandler:", v9, 11, 10008, v7, v5);

  -[CPProcessAssertion setProcessAssertion:](self, "setProcessAssertion:", v8);
}

+ (id)processAssertionWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CFE308];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "processAssertionNameForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:flags:reason:name:", v5, 11, 10008, v7);

  return v8;
}

+ (id)processAssertionNameForBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CPProcessAssertion bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processAssertionNameForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPProcessAssertion bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CPProcessAssertion bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

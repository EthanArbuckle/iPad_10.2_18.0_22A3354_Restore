@implementation LNDaemonRecord

- (LNDaemonRecord)initWithBundleIdentifier:(id)a3
{
  id v5;
  LNDaemonRecord *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  LNDaemonRecord *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDaemonRecord.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNDaemonRecord;
  v6 = -[LNDaemonRecord init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (LNDaemonRecord)initWithDaemonRecord:(id)a3
{
  void *v4;
  LNDaemonRecord *v5;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNDaemonRecord initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v4);

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (id)enumerated
{
  void *v2;
  void *v3;

  +[swift_DaemonRecord enumerated](swift_DaemonRecord, "enumerated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_5199);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)daemonRecordWithBundleIdentifier:(id)a3
{
  void *v3;
  LNDaemonRecord *v4;

  +[swift_DaemonRecord fromBundleIdentifier:](swift_DaemonRecord, "fromBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[LNDaemonRecord initWithDaemonRecord:]([LNDaemonRecord alloc], "initWithDaemonRecord:", v3);
  else
    v4 = 0;

  return v4;
}

LNDaemonRecord *__28__LNDaemonRecord_enumerated__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  LNDaemonRecord *v3;

  v2 = a2;
  v3 = -[LNDaemonRecord initWithDaemonRecord:]([LNDaemonRecord alloc], "initWithDaemonRecord:", v2);

  return v3;
}

@end

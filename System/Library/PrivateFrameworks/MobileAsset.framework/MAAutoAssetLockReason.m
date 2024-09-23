@implementation MAAutoAssetLockReason

- (id)initForClientName:(id)a3 forLockReason:(id)a4
{
  id v7;
  id v8;
  MAAutoAssetLockReason *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetLockReason;
  v9 = -[MAAutoAssetLockReason init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autoAssetClientName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MAAutoAssetLockReason)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetLockReason *v5;
  uint64_t v6;
  NSString *autoAssetClientName;
  uint64_t v8;
  NSString *lockReason;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetLockReason;
  v5 = -[MAAutoAssetLockReason init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAssetClientName"));
    v6 = objc_claimAutoreleasedReturnValue();
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockReason"));
    v8 = objc_claimAutoreleasedReturnValue();
    lockReason = v5->_lockReason;
    v5->_lockReason = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MAAutoAssetLockReason autoAssetClientName](self, "autoAssetClientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("autoAssetClientName"));

  -[MAAutoAssetLockReason lockReason](self, "lockReason");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lockReason"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MAAutoAssetLockReason autoAssetClientName](self, "autoAssetClientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoAssetClientName:", v5);

  -[MAAutoAssetLockReason lockReason](self, "lockReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockReason:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetLockReason autoAssetClientName](self, "autoAssetClientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockReason lockReason](self, "lockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("client:%@|reason:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAAutoAssetLockReason autoAssetClientName](self, "autoAssetClientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("autoAssetClientName"));

  -[MAAutoAssetLockReason lockReason](self, "lockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("lockReason"));

  return v3;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (void)setAutoAssetClientName:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetClientName, a3);
}

- (NSString)lockReason
{
  return self->_lockReason;
}

- (void)setLockReason:(id)a3
{
  objc_storeStrong((id *)&self->_lockReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReason, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end

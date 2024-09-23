@implementation MAAutoAssetSetInfoEnd

- (MAAutoAssetSetInfoEnd)initWithLockReason:(id)a3 endingLockCount:(int64_t)a4
{
  id v7;
  MAAutoAssetSetInfoEnd *v8;
  MAAutoAssetSetInfoEnd *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetSetInfoEnd;
  v8 = -[MAAutoAssetSetInfoEnd init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endLockReason, a3);
    v9->_endLockCount = a4;
  }

  return v9;
}

- (MAAutoAssetSetInfoEnd)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInfoEnd *v5;
  uint64_t v6;
  NSString *endLockReason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetSetInfoEnd;
  v5 = -[MAAutoAssetSetInfoEnd init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endLockReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    endLockReason = v5->_endLockReason;
    v5->_endLockReason = (NSString *)v6;

    v5->_endLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endLockCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MAAutoAssetSetInfoEnd endLockReason](self, "endLockReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("endLockReason"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount"), CFSTR("endLockCount"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount"));
  if (-[MAAutoAssetSetInfoEnd endLockCount](self, "endLockCount") == -1)
  {

    v3 = CFSTR("ALL");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInfoEnd endLockReason](self, "endLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("endLockReason:%@|endLockCount:%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)endLockReason
{
  return self->_endLockReason;
}

- (int64_t)endLockCount
{
  return self->_endLockCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endLockReason, 0);
}

@end

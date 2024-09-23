@implementation HKStatisticsCollectionCacheSettings

- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3
{
  return -[HKStatisticsCollectionCacheSettings initWithIdentifier:mode:](self, "initWithIdentifier:mode:", a3, 0);
}

- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3 mode:(int64_t)a4
{
  id v7;
  HKStatisticsCollectionCacheSettings *v8;
  uint64_t v9;
  NSString *identifier;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStatisticsCollectionQuery.m"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKStatisticsCollectionCacheSettings;
  v8 = -[HKStatisticsCollectionCacheSettings init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_mode = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKStatisticsCollectionCacheSettings)initWithCoder:(id)a3
{
  id v4;
  HKStatisticsCollectionCacheSettings *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKStatisticsCollectionCacheSettings;
  v5 = -[HKStatisticsCollectionCacheSettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

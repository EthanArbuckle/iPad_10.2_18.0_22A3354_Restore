@implementation HKSleepDaySummaryCacheSettings

- (HKSleepDaySummaryCacheSettings)initWithIdentifier:(id)a3 mode:(int64_t)a4
{
  id v7;
  HKSleepDaySummaryCacheSettings *v8;
  uint64_t v9;
  NSString *identifier;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepDaySummaryQuery.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKSleepDaySummaryCacheSettings;
  v8 = -[HKSleepDaySummaryCacheSettings init](&v13, sel_init);
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

- (HKSleepDaySummaryCacheSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKSleepDaySummaryCacheSettings *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));

  v7 = -[HKSleepDaySummaryCacheSettings initWithIdentifier:mode:](self, "initWithIdentifier:mode:", v5, v6);
  return v7;
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

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  int64_t mode;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)HKSleepDaySummaryCacheSettings;
  -[HKSleepDaySummaryCacheSettings description](&v11, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  mode = self->_mode;
  v7 = CFSTR("-");
  if (mode == 1)
    v7 = CFSTR("user interactive");
  if (mode)
    v8 = v7;
  else
    v8 = CFSTR("default");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ Cache Settings - identifier: %@, mode: %@>"), v4, self->_identifier, v8);

  return v9;
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

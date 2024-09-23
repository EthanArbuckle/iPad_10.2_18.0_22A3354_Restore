@implementation MLTransactionContext

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("MLTransactionContextPathKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priorityLevel, CFSTR("MLTransactionContextPriorityLevelKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("MLTransactionContextOptionsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyContext, CFSTR("MLTransactionContextPrivacyContextKey"));

}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)options
{
  return self->_options;
}

- (MLTransactionContext)initWithCoder:(id)a3
{
  id v4;
  MLTransactionContext *v5;
  uint64_t v6;
  NSString *path;
  uint64_t v8;
  ML3DatabasePrivacyContext *privacyContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLTransactionContext;
  v5 = -[MLTransactionContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MLTransactionContextPathKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_priorityLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MLTransactionContextPriorityLevelKey"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MLTransactionContextOptionsKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MLTransactionContextPrivacyContextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    privacyContext = v5->_privacyContext;
    v5->_privacyContext = (ML3DatabasePrivacyContext *)v8;

  }
  return v5;
}

- (MLTransactionContext)initWithPrivacyContext:(id)a3 path:(id)a4 priorityLevel:(unint64_t)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  MLTransactionContext *v13;
  MLTransactionContext *v14;
  uint64_t v15;
  NSString *path;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MLTransactionContext;
  v13 = -[MLTransactionContext init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_privacyContext, a3);
    v15 = objc_msgSend(v12, "copy");
    path = v14->_path;
    v14->_path = (NSString *)v15;

    v14->_priorityLevel = a5;
    v14->_options = a6;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

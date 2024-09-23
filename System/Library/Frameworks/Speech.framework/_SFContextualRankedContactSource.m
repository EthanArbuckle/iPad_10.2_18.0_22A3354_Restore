@implementation _SFContextualRankedContactSource

- (_SFContextualRankedContactSource)initWithSourceApplication:(id)a3 rankDate:(id)a4 contactOnly:(BOOL)a5 limit:(int64_t)a6
{
  id v10;
  id v11;
  _SFContextualRankedContactSource *v12;
  uint64_t v13;
  NSString *sourceApplication;
  uint64_t v15;
  NSDate *rankDate;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFContextualRankedContactSource;
  v12 = -[_SFContextualRankedContactSource init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    sourceApplication = v12->_sourceApplication;
    v12->_sourceApplication = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    rankDate = v12->_rankDate;
    v12->_rankDate = (NSDate *)v15;

    v12->_contactOnly = a5;
    v12->_limit = a6;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceApplication;
  id v5;

  sourceApplication = self->_sourceApplication;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceApplication, CFSTR("_sourceApplication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rankDate, CFSTR("_rankDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_contactOnly, CFSTR("_contactOnly"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limit, CFSTR("_limit"));

}

- (_SFContextualRankedContactSource)initWithCoder:(id)a3
{
  id v4;
  _SFContextualRankedContactSource *v5;
  uint64_t v6;
  NSString *sourceApplication;
  uint64_t v8;
  NSDate *rankDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFContextualRankedContactSource;
  v5 = -[_SFContextualRankedContactSource init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceApplication"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceApplication = v5->_sourceApplication;
    v5->_sourceApplication = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rankDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    rankDate = v5->_rankDate;
    v5->_rankDate = (NSDate *)v8;

    v5->_contactOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_contactOnly"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_limit"));
  }

  return v5;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSDate)rankDate
{
  return self->_rankDate;
}

- (BOOL)contactOnly
{
  return self->_contactOnly;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankDate, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

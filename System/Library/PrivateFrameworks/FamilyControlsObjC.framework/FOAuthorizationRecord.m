@implementation FOAuthorizationRecord

- (FOAuthorizationRecord)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 recordIdentifier:(id)a5 status:(int64_t)a6 type:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  FOAuthorizationRecord *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  NSString *teamIdentifier;
  uint64_t v19;
  NSUUID *recordIdentifier;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FOAuthorizationRecord;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[FOAuthorizationRecord init](&v22, sel_init);
  v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  bundleIdentifier = v14->_bundleIdentifier;
  v14->_bundleIdentifier = (NSString *)v15;

  v17 = objc_msgSend(v12, "copy");
  teamIdentifier = v14->_teamIdentifier;
  v14->_teamIdentifier = (NSString *)v17;

  v19 = objc_msgSend(v11, "copy");
  recordIdentifier = v14->_recordIdentifier;
  v14->_recordIdentifier = (NSUUID *)v19;

  v14->_status = a6;
  v14->_type = a7;
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  FOAuthorizationRecord *v4;
  FOAuthorizationRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  BOOL v14;

  v4 = (FOAuthorizationRecord *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[FOAuthorizationRecord bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FOAuthorizationRecord bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[FOAuthorizationRecord teamIdentifier](self, "teamIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FOAuthorizationRecord teamIdentifier](v5, "teamIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[FOAuthorizationRecord recordIdentifier](self, "recordIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[FOAuthorizationRecord recordIdentifier](v5, "recordIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v11)
            && (v12 = -[FOAuthorizationRecord status](self, "status"),
                v12 == -[FOAuthorizationRecord status](v5, "status")))
          {
            v13 = -[FOAuthorizationRecord type](self, "type");
            v14 = v13 == -[FOAuthorizationRecord type](v5, "type");
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;

  -[FOAuthorizationRecord bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FOAuthorizationRecord teamIdentifier](self, "teamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FOAuthorizationRecord recordIdentifier](self, "recordIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = -[FOAuthorizationRecord status](self, "status");
  v10 = v6 ^ (v9 + -[FOAuthorizationRecord type](self, "type") + v8);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("teamIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordIdentifier, CFSTR("recordIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (FOAuthorizationRecord)initWithCoder:(id)a3
{
  id v4;
  FOAuthorizationRecord *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *teamIdentifier;
  uint64_t v10;
  NSUUID *recordIdentifier;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FOAuthorizationRecord;
  v5 = -[FOAuthorizationRecord init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordIdentifier = v5->_recordIdentifier;
    v5->_recordIdentifier = (NSUUID *)v10;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
      v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    else
      v12 = 0;
    v5->_type = v12;
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)recordIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

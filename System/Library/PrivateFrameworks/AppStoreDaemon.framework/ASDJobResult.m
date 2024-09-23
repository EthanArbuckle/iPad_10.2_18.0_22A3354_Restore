@implementation ASDJobResult

+ (id)resultWithExistingActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 506, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultWithPersistentID:bundleID:status:error:", v8, v6, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)resultWithInvalidActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 507, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultWithPersistentID:bundleID:status:error:", v8, v6, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)resultWithRestrictedActivity:(int64_t)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 502, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultWithPersistentID:bundleID:status:error:", v8, v6, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)resultWithValidActivity:(int64_t)a3 bundleID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultWithPersistentID:bundleID:status:error:", v8, v7, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobResult *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  NSNumber *persistentID;

  v5 = -[ASDJobResult init](+[ASDJobResult allocWithZone:](ASDJobResult, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v8 = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  error = v5->_error;
  v5->_error = (NSError *)v8;

  v10 = -[NSNumber copyWithZone:](self->_persistentID, "copyWithZone:", a3);
  persistentID = v5->_persistentID;
  v5->_persistentID = (NSNumber *)v10;

  v5->_status = self->_status;
  return v5;
}

- (id)description
{
  unint64_t status;
  __CFString *v3;

  status = self->_status;
  if (status > 2)
    v3 = 0;
  else
    v3 = off_1E37BF9E8[status];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v3, self->_persistentID, self->_bundleID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobResult)initWithCoder:(id)a3
{
  id v4;
  ASDJobResult *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  NSNumber *persistentID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDJobResult;
  v5 = -[ASDJobResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentID"));
    v10 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v10;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  error = self->_error;
  if (error)
  {
    ASDErrorWithSafeUserInfo(error);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("error"));

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_persistentID, CFSTR("persistentID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

+ (id)resultWithPersistentID:(id)a3 bundleID:(id)a4 status:(int64_t)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (_QWORD *)objc_opt_new();
  v13 = (void *)v12[3];
  v12[3] = v9;
  v14 = v9;

  v15 = (void *)v12[1];
  v12[1] = v10;
  v16 = v10;

  v12[4] = a5;
  v17 = (void *)v12[2];
  v12[2] = v11;

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

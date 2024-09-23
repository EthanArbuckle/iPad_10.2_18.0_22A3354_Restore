@implementation DMFUser

- (DMFUser)initWithUsername:(id)a3 dataQuota:(unint64_t)a4 dataUsed:(unint64_t)a5 hasDataToSync:(BOOL)a6 isCurrentUser:(BOOL)a7
{
  id v12;
  DMFUser *v13;
  uint64_t v14;
  NSString *username;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFUser;
  v13 = -[DMFUser init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    username = v13->_username;
    v13->_username = (NSString *)v14;

    v13->_dataQuota = a4;
    v13->_dataUsed = a5;
    v13->_hasDataToSync = a6;
    v13->_isCurrentUser = a7;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFUser username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUsername:dataQuota:dataUsed:hasDataToSync:isCurrentUser:", v5, -[DMFUser dataQuota](self, "dataQuota"), -[DMFUser dataUsed](self, "dataUsed"), -[DMFUser hasDataToSync](self, "hasDataToSync"), -[DMFUser isCurrentUser](self, "isCurrentUser"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFUser)initWithCoder:(id)a3
{
  id v4;
  DMFUser *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFUser;
  v5 = -[DMFUser init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("username"));
    v7 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataQuota"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataQuota = objc_msgSend(v9, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataUsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataUsed = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasDataToSync"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasDataToSync = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCurrentUser"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCurrentUser = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DMFUser username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DMFUser dataQuota](self, "dataQuota"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dataQuota"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DMFUser dataUsed](self, "dataUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dataUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFUser hasDataToSync](self, "hasDataToSync"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("hasDataToSync"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFUser isCurrentUser](self, "isCurrentUser"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("isCurrentUser"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[DMFUser username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DMFUser dataQuota](self, "dataQuota");
  v6 = v5 ^ -[DMFUser dataUsed](self, "dataUsed") ^ v4;
  v7 = v6 ^ -[DMFUser hasDataToSync](self, "hasDataToSync");
  v8 = v7 ^ -[DMFUser isCurrentUser](self, "isCurrentUser");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  DMFUser *v4;
  DMFUser *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v16;

  v4 = (DMFUser *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFUser username](self, "username");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFUser username](v5, "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if ((!(v8 | v9) || (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, v10))
        && (v11 = -[DMFUser dataQuota](self, "dataQuota"), v11 == -[DMFUser dataQuota](v5, "dataQuota"))
        && (v12 = -[DMFUser dataUsed](self, "dataUsed"), v12 == -[DMFUser dataUsed](v5, "dataUsed"))
        && (v13 = -[DMFUser hasDataToSync](self, "hasDataToSync"), v13 == -[DMFUser hasDataToSync](v5, "hasDataToSync")))
      {
        v16 = -[DMFUser isCurrentUser](self, "isCurrentUser");
        v14 = v16 ^ -[DMFUser isCurrentUser](v5, "isCurrentUser") ^ 1;
      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFUser username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[DMFUser username](self, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tUsername         : “%@”\n"), v6);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\tData Quota       : %llu\n"), -[DMFUser dataQuota](self, "dataQuota"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tData Used        : %llu\n"), -[DMFUser dataUsed](self, "dataUsed"));
  if (-[DMFUser hasDataToSync](self, "hasDataToSync"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tHas Data to Sync : %@\n"), v7);
  if (-[DMFUser isCurrentUser](self, "isCurrentUser"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Current User  : %@\n"), v8);
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (NSString)username
{
  return self->_username;
}

- (unint64_t)dataQuota
{
  return self->_dataQuota;
}

- (unint64_t)dataUsed
{
  return self->_dataUsed;
}

- (BOOL)hasDataToSync
{
  return self->_hasDataToSync;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
}

@end

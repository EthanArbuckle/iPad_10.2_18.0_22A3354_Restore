@implementation CXJoinCallActivity

- (CXJoinCallActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 activityIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CXJoinCallActivity *v15;
  NSUUID *v16;
  NSUUID *UUID;
  uint64_t v18;
  NSDate *timestamp;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CXJoinCallActivity;
  v15 = -[CXJoinCallActivity init](&v21, sel_init);
  if (v15)
  {
    v16 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    UUID = v15->_UUID;
    v15->_UUID = v16;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = objc_claimAutoreleasedReturnValue();
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v15->_applicationContext, a5);
    objc_storeStrong((id *)&v15->_metadata, a4);
    objc_storeStrong((id *)&v15->_activityIdentifier, a6);
    v15->_startWhenStaged = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallActivity UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifierUUIDString=%@"), v4);

  -[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" bundleIdentifier=%@"), v5);

  -[CXJoinCallActivity timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" timestamp=%@"), v6);

  v7 = -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" startWhenStaged=%@"), v8);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXJoinCallActivity isEqualToJoinCallActivity:](self, "isEqualToJoinCallActivity:", v4);

  return v5;
}

- (BOOL)isEqualToJoinCallActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  int v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[CXJoinCallActivity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CXJoinCallActivity applicationContext](self, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[CXJoinCallActivity metadata](self, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[CXJoinCallActivity timestamp](self, "timestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v22 = v11;
          -[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundleIdentifier");
          v23 = v13;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:"))
          {
            -[CXJoinCallActivity activityIdentifier](self, "activityIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "metadata");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v14;
            v15 = objc_msgSend(v14, "isEqual:");
            v11 = v22;
            if (v15)
            {
              v16 = -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged");
              v17 = v16 ^ objc_msgSend(v4, "startWhenStaged") ^ 1;
            }
            else
            {
              LOBYTE(v17) = 0;
            }

          }
          else
          {
            LOBYTE(v17) = 0;
            v11 = v22;
          }

        }
        else
        {
          LOBYTE(v17) = 0;
        }

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  unint64_t v17;

  -[CXJoinCallActivity UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CXJoinCallActivity applicationContext](self, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CXJoinCallActivity timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[CXJoinCallActivity activityIdentifier](self, "activityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[CXJoinCallActivity metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged");
  v16 = 1237;
  if (v15)
    v16 = 1231;
  v17 = v10 ^ v14 ^ v16;

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallActivity metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallActivity applicationContext](self, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallActivity activityIdentifier](self, "activityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:metadata:applicationContext:activityIdentifier:", v5, v6, v7, v8);

  -[CXJoinCallActivity UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUUID:", v10);

  -[CXJoinCallActivity timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimestamp:", v11);

  objc_msgSend(v9, "setStartWhenStaged:", -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged"));
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallActivity)initWithCoder:(id)a3
{
  id v4;
  CXJoinCallActivity *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *UUID;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *applicationContext;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDate *timestamp;
  void *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  void *v21;
  uint64_t v22;
  NSString *activityIdentifier;
  void *v24;
  uint64_t v25;
  NSData *metadata;
  void *v27;

  v4 = a3;
  v5 = -[CXJoinCallActivity init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_applicationContext);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    applicationContext = v5->_applicationContext;
    v5->_applicationContext = (NSData *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    NSStringFromSelector(sel_bundleIdentifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v19;

    NSStringFromSelector(sel_activityIdentifier);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v22;

    NSStringFromSelector(sel_metadata);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v25;

    NSStringFromSelector(sel_startWhenStaged);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startWhenStaged = objc_msgSend(v4, "decodeBoolForKey:", v27);

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v4 = a3;
  -[CXJoinCallActivity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXJoinCallActivity applicationContext](self, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXJoinCallActivity timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXJoinCallActivity bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[CXJoinCallActivity activityIdentifier](self, "activityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[CXJoinCallActivity metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged");
  NSStringFromSelector(sel_startWhenStaged);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activityIdentifier, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)startWhenStaged
{
  return self->_startWhenStaged;
}

- (void)setStartWhenStaged:(BOOL)a3
{
  self->_startWhenStaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end

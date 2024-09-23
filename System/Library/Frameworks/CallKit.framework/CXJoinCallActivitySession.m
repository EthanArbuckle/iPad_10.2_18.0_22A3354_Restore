@implementation CXJoinCallActivitySession

- (CXJoinCallActivitySession)initWithActivity:(id)a3
{
  id v5;
  CXJoinCallActivitySession *v6;
  uint64_t v7;
  NSDate *timestamp;
  NSUUID *v9;
  NSUUID *UUID;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXJoinCallActivitySession;
  v6 = -[CXJoinCallActivitySession init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v7;

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    UUID = v6->_UUID;
    v6->_UUID = v9;

    objc_storeStrong((id *)&v6->_activity, a3);
    v6->_state = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXJoinCallActivitySession UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifierUUIDString=%@"), v4);

  -[CXJoinCallActivitySession activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activity=%@"), v5);

  -[CXJoinCallActivitySession timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" timestamp=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%lu"), -[CXJoinCallActivitySession state](self, "state"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXJoinCallActivitySession isEqualToJoinCallActivitySession:](self, "isEqualToJoinCallActivitySession:", v4);

  return v5;
}

- (BOOL)isEqualToJoinCallActivitySession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;

  v4 = a3;
  -[CXJoinCallActivitySession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CXJoinCallActivitySession activity](self, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToJoinCallActivity:", v8))
    {
      -[CXJoinCallActivitySession timestamp](self, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {
        v12 = -[CXJoinCallActivitySession state](self, "state");
        v11 = v12 == objc_msgSend(v4, "state");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[CXJoinCallActivitySession UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXJoinCallActivitySession activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CXJoinCallActivitySession timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[CXJoinCallActivitySession state](self, "state");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXJoinCallActivitySession activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithActivity:", v5);

  -[CXJoinCallActivitySession UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUUID:", v7);

  -[CXJoinCallActivitySession timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimestamp:", v8);

  objc_msgSend(v6, "setState:", -[CXJoinCallActivitySession state](self, "state"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallActivitySession)initWithCoder:(id)a3
{
  id v4;
  CXJoinCallActivitySession *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *UUID;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CXJoinCallActivity *activity;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDate *timestamp;
  void *v18;

  v4 = a3;
  v5 = -[CXJoinCallActivitySession init](self, "init");
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
    NSStringFromSelector(sel_activity);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    activity = v5->_activity;
    v5->_activity = (CXJoinCallActivity *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    NSStringFromSelector(sel_state);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v18);

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
  unint64_t v11;
  id v12;

  v4 = a3;
  -[CXJoinCallActivitySession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXJoinCallActivitySession activity](self, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXJoinCallActivitySession timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[CXJoinCallActivitySession state](self, "state");
  NSStringFromSelector(sel_state);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

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

- (CXJoinCallActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end

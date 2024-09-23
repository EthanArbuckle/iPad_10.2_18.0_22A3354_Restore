@implementation CXAction

- (CXAction)init
{
  CXAction *v2;
  uint64_t v3;
  NSUUID *UUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXAction;
  v2 = -[CXAction init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAction UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v5);

  v6 = -[CXAction originator](self, "originator");
  if (v6)
  {
    v7 = v6;
    NSStringFromSelector(sel_originator);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (v7 > 4)
      v9 = 0;
    else
      v9 = off_1E4B88B08[v7 - 1];
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v8, v9);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%ld"), -[CXAction state](self, "state"));
  -[CXAction commitDate](self, "commitDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" commitDate=%@"), v10);

  if (-[CXAction state](self, "state") == 2)
    objc_msgSend(v3, "appendFormat:", CFSTR(" failureReason=%ld"), -[CXAction failureReason](self, "failureReason"));
  -[CXAction customDescription](self, "customDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSMutableString)customDescription
{
  return (NSMutableString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
}

+ (double)timeout
{
  return 5.0;
}

- (NSDate)timeoutDate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend((id)objc_opt_class(), "timeout");
  v5 = v4;
  -[CXAction commitDate](self, "commitDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "dateWithTimeInterval:sinceDate:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateWithTimeInterval:sinceDate:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v7;
}

- (BOOL)isComplete
{
  return -[CXAction state](self, "state") != 0;
}

- (void)fulfill
{
  void *v2;
  id v3;

  v3 = (id)-[CXAction copy](self, "copy");
  objc_msgSend(v3, "updateAsFulfilled");
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionCompleted:", v3);

}

- (void)fail
{
  void *v2;
  id v3;

  v3 = (id)-[CXAction copy](self, "copy");
  objc_msgSend(v3, "updateAsFailedWithReason:", 1);
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionCompleted:", v3);

}

- (BOOL)shouldTimeout
{
  return 1;
}

- (void)updateAsFulfilled
{
  -[CXAction setState:](self, "setState:", 1);
}

- (void)updateAsFailedWithReason:(int64_t)a3
{
  -[CXAction setState:](self, "setState:", 2);
  -[CXAction setFailureReason:](self, "setFailureReason:", a3);
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[CXAction UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUUID:", v6);

  -[CXAction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v7);

  objc_msgSend(v5, "setOriginator:", -[CXAction originator](self, "originator"));
  objc_msgSend(v5, "setState:", -[CXAction state](self, "state"));
  objc_msgSend(v5, "setFailureReason:", -[CXAction failureReason](self, "failureReason"));
  -[CXAction commitDate](self, "commitDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCommitDate:", v8);

}

- (id)sanitizedCopy
{
  return -[CXAction sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXAction updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXAction updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *UUID;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDate *commitDate;
  objc_super v18;

  v4 = aDecoder;
  v18.receiver = self;
  v18.super_class = (Class)CXAction;
  v5 = -[CXAction init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    NSStringFromSelector(sel_originator);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_originator = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v10);

    NSStringFromSelector(sel_state);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v11);

    NSStringFromSelector(sel_failureReason);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_failureReason = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v12);

    v13 = objc_opt_class();
    NSStringFromSelector(sel_commitDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    commitDate = v5->_commitDate;
    v5->_commitDate = (NSDate *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[CXAction UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXAction originator](self, "originator");
  NSStringFromSelector(sel_originator);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[CXAction state](self, "state");
  NSStringFromSelector(sel_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  v11 = -[CXAction failureReason](self, "failureReason");
  NSStringFromSelector(sel_failureReason);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  -[CXAction commitDate](self, "commitDate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_commitDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)originator
{
  return self->_originator;
}

- (void)setOriginator:(int64_t)a3
{
  self->_originator = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int64_t)a3
{
  self->_failureReason = a3;
}

- (NSDate)commitDate
{
  return self->_commitDate;
}

- (void)setCommitDate:(id)a3
{
  objc_storeStrong((id *)&self->_commitDate, a3);
}

- (CXActionDelegate)delegate
{
  return (CXActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commitDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end

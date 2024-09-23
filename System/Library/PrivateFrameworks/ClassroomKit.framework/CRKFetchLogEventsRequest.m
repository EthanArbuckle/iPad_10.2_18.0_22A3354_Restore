@implementation CRKFetchLogEventsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLogEventsRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchLogEventsRequest *v5;
  void *v6;
  uint64_t v7;
  NSDate *cursorDate;
  void *v9;
  uint64_t v10;
  NSString *sessionToken;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchLogEventsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("cursorDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    cursorDate = v5->_cursorDate;
    v5->_cursorDate = (NSDate *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sessionToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchLogEventsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchLogEventsRequest cursorDate](self, "cursorDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cursorDate"));

  -[CRKFetchLogEventsRequest sessionToken](self, "sessionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sessionToken"));

}

- (NSDate)cursorDate
{
  return self->_cursorDate;
}

- (void)setCursorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_cursorDate, 0);
}

@end

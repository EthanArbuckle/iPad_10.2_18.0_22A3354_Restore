@implementation CRKFetchSignInHistoryResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSignInHistoryResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchSignInHistoryResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *history;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *ownerAppleID;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKFetchSignInHistoryResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("history"));
    v9 = objc_claimAutoreleasedReturnValue();
    history = v5->_history;
    v5->_history = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isTruncated"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isTruncated = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_limit = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historyVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_historyVersion = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("ownerAppleID"));
    v15 = objc_claimAutoreleasedReturnValue();
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v15;

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKFetchSignInHistoryResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CRKFetchSignInHistoryResultObject history](self, "history", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("history"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKFetchSignInHistoryResultObject isTruncated](self, "isTruncated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("isTruncated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFetchSignInHistoryResultObject limit](self, "limit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("limit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFetchSignInHistoryResultObject historyVersion](self, "historyVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("historyVersion"));

  -[CRKFetchSignInHistoryResultObject ownerAppleID](self, "ownerAppleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ownerAppleID"));

}

- (NSArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (void)setIsTruncated:(BOOL)a3
{
  self->_isTruncated = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)historyVersion
{
  return self->_historyVersion;
}

- (void)setHistoryVersion:(unint64_t)a3
{
  self->_historyVersion = a3;
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

@end

@implementation CRXFUserInfo

- (CRXFUserInfo)initWithUserID:(id)a3 firstName:(id)a4
{
  id v7;
  id v8;
  CRXFUserInfo *v9;
  CRXFUserInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRXFUserInfo;
  v9 = -[CRXFUserInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userID, a3);
    objc_storeStrong((id *)&v10->_firstName, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRXFUserInfo userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRXFUserInfo firstName](self, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> userID:%@, firstName:%@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end

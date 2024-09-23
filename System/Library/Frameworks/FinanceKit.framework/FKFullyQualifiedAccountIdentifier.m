@implementation FKFullyQualifiedAccountIdentifier

- (FKFullyQualifiedAccountIdentifier)initWithAccountID:(id)a3 institutionID:(id)a4
{
  id v6;
  id v7;
  FKFullyQualifiedAccountIdentifier *v8;
  uint64_t v9;
  NSString *accountID;
  uint64_t v11;
  NSString *institutionID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKFullyQualifiedAccountIdentifier;
  v8 = -[FKFullyQualifiedAccountIdentifier init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountID = v8->_accountID;
    v8->_accountID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    institutionID = v8->_institutionID;
    v8->_institutionID = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FKFullyQualifiedAccountIdentifier initWithAccountID:institutionID:]([FKFullyQualifiedAccountIdentifier alloc], "initWithAccountID:institutionID:", self->_accountID, self->_institutionID);
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountID);
  objc_msgSend(v3, "safelyAddObject:", self->_institutionID);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKFullyQualifiedAccountIdentifier *v4;
  FKFullyQualifiedAccountIdentifier *v5;
  void **v6;
  char v7;

  v4 = (FKFullyQualifiedAccountIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_accountID, v6[1]))
      v7 = FKEqualObjects(self->_institutionID, v6[2]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)institutionID
{
  return self->_institutionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_institutionID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end

@implementation FKAccountPaymentInformationSCAN

- (FKAccountPaymentInformationSCAN)initWithAccountNumber:(id)a3 sortCode:(id)a4
{
  id v7;
  id v8;
  FKAccountPaymentInformationSCAN *v9;
  FKAccountPaymentInformationSCAN *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKAccountPaymentInformationSCAN;
  v9 = -[FKAccountPaymentInformationSCAN init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountNumber, a3);
    objc_storeStrong((id *)&v10->_sortCode, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKAccountPaymentInformationSCAN *v5;
  void *v6;
  void *v7;
  FKAccountPaymentInformationSCAN *v8;

  v5 = [FKAccountPaymentInformationSCAN alloc];
  v6 = (void *)-[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  v7 = (void *)-[NSString copyWithZone:](self->_sortCode, "copyWithZone:", a3);
  v8 = -[FKAccountPaymentInformationSCAN initWithAccountNumber:sortCode:](v5, "initWithAccountNumber:sortCode:", v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  FKAccountPaymentInformationSCAN *v4;
  FKAccountPaymentInformationSCAN *v5;
  void **v6;
  char v7;

  v4 = (FKAccountPaymentInformationSCAN *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_accountNumber, v6[1]))
      v7 = FKEqualObjects(self->_sortCode, v6[2]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)sortCode
{
  return self->_sortCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortCode, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
}

@end

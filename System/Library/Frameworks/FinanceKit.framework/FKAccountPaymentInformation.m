@implementation FKAccountPaymentInformation

- (FKAccountPaymentInformation)initWithAccountNumber:(id)a3 routingNumber:(id)a4
{
  id v6;
  id v7;
  FKAccountPaymentInformation *v8;
  FKAccountPaymentInformationACH *v9;
  FKAccountPaymentInformationACH *ach;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKAccountPaymentInformation;
  v8 = -[FKAccountPaymentInformation init](&v12, sel_init);
  if (v8)
  {
    v9 = -[FKAccountPaymentInformationACH initWithAccountNumber:routingNumber:]([FKAccountPaymentInformationACH alloc], "initWithAccountNumber:routingNumber:", v6, v7);
    ach = v8->_ach;
    v8->_ach = v9;

  }
  return v8;
}

- (FKAccountPaymentInformation)initWithAccountNumber:(id)a3 sortCode:(id)a4
{
  id v6;
  id v7;
  FKAccountPaymentInformation *v8;
  FKAccountPaymentInformationSCAN *v9;
  FKAccountPaymentInformationSCAN *scan;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKAccountPaymentInformation;
  v8 = -[FKAccountPaymentInformation init](&v12, sel_init);
  if (v8)
  {
    v9 = -[FKAccountPaymentInformationSCAN initWithAccountNumber:sortCode:]([FKAccountPaymentInformationSCAN alloc], "initWithAccountNumber:sortCode:", v6, v7);
    scan = v8->_scan;
    v8->_scan = v9;

  }
  return v8;
}

- (FKAccountPaymentInformation)initWithIBAN:(id)a3
{
  id v4;
  FKAccountPaymentInformation *v5;
  uint64_t v6;
  NSString *iban;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKAccountPaymentInformation;
  v5 = -[FKAccountPaymentInformation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    iban = v5->_iban;
    v5->_iban = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKAccountPaymentInformation *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FKAccountPaymentInformationSCAN *scan;
  FKAccountPaymentInformation *v9;
  FKAccountPaymentInformation *v10;
  void *v11;

  if (self->_ach)
  {
    v4 = [FKAccountPaymentInformation alloc];
    -[FKAccountPaymentInformationACH accountNumber](self->_ach, "accountNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKAccountPaymentInformationACH routingNumber](self->_ach, "routingNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FKAccountPaymentInformation initWithAccountNumber:routingNumber:](v4, "initWithAccountNumber:routingNumber:", v5, v6);
LABEL_5:
    v11 = (void *)v7;

    return v11;
  }
  scan = self->_scan;
  v9 = [FKAccountPaymentInformation alloc];
  v10 = v9;
  if (scan)
  {
    -[FKAccountPaymentInformationSCAN accountNumber](self->_scan, "accountNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKAccountPaymentInformationSCAN sortCode](self->_scan, "sortCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FKAccountPaymentInformation initWithAccountNumber:sortCode:](v10, "initWithAccountNumber:sortCode:", v5, v6);
    goto LABEL_5;
  }
  return -[FKAccountPaymentInformation initWithIBAN:](v9, "initWithIBAN:", self->_iban);
}

- (BOOL)isEqual:(id)a3
{
  FKAccountPaymentInformation *v4;
  FKAccountPaymentInformation *v5;
  void **v6;
  char v7;

  v4 = (FKAccountPaymentInformation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_ach, v6[1]) && FKEqualObjects(self->_scan, v6[2]))
      v7 = FKEqualObjects(self->_iban, v6[3]);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (FKAccountPaymentInformationACH)ach
{
  return self->_ach;
}

- (FKAccountPaymentInformationSCAN)scan
{
  return self->_scan;
}

- (NSString)iban
{
  return self->_iban;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iban, 0);
  objc_storeStrong((id *)&self->_scan, 0);
  objc_storeStrong((id *)&self->_ach, 0);
}

@end

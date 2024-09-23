@implementation FKAppleAccount

- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13
{
  return -[FKAppleAccount initWithAccountIdentifier:currentBalance:totalBalance:currency:status:type:creditLimit:minimumDueAmount:nextPaymentDueDate:lastUpdated:displayName:openingDate:overduePaymentAmount:](self, "initWithAccountIdentifier:currentBalance:totalBalance:currency:status:type:creditLimit:minimumDueAmount:nextPaymentDueDate:lastUpdated:displayName:openingDate:overduePaymentAmount:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0);
}

- (FKAppleAccount)initWithAccountIdentifier:(id)a3 currentBalance:(id)a4 totalBalance:(id)a5 currency:(id)a6 status:(unint64_t)a7 type:(unint64_t)a8 creditLimit:(id)a9 minimumDueAmount:(id)a10 nextPaymentDueDate:(id)a11 lastUpdated:(id)a12 displayName:(id)a13 openingDate:(id)a14 overduePaymentAmount:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FKAppleAccount *v27;
  uint64_t v28;
  NSString *accountIdentifier;
  uint64_t v30;
  NSDecimalNumber *currentBalance;
  uint64_t v32;
  NSDecimalNumber *totalBalance;
  uint64_t v34;
  NSString *currency;
  uint64_t v36;
  NSString *displayName;
  uint64_t v38;
  NSDecimalNumber *creditLimit;
  uint64_t v40;
  NSDecimalNumber *minimumDueAmount;
  uint64_t v42;
  NSDate *nextPaymentDueDate;
  uint64_t v44;
  NSDate *lastUpdated;
  uint64_t v46;
  NSDate *openingDate;
  uint64_t v48;
  NSDecimalNumber *overduePaymentAmount;
  id v54;
  id v55;
  objc_super v56;

  v18 = a3;
  v19 = a4;
  v55 = a5;
  v54 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v56.receiver = self;
  v56.super_class = (Class)FKAppleAccount;
  v27 = -[FKAppleAccount init](&v56, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    accountIdentifier = v27->_accountIdentifier;
    v27->_accountIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    currentBalance = v27->_currentBalance;
    v27->_currentBalance = (NSDecimalNumber *)v30;

    v32 = objc_msgSend(v55, "copy");
    totalBalance = v27->_totalBalance;
    v27->_totalBalance = (NSDecimalNumber *)v32;

    v34 = objc_msgSend(v54, "copy");
    currency = v27->_currency;
    v27->_currency = (NSString *)v34;

    v36 = objc_msgSend(v24, "copy");
    displayName = v27->_displayName;
    v27->_displayName = (NSString *)v36;

    v27->_status = a7;
    v27->_type = a8;
    v38 = objc_msgSend(v20, "copy");
    creditLimit = v27->_creditLimit;
    v27->_creditLimit = (NSDecimalNumber *)v38;

    v40 = objc_msgSend(v21, "copy");
    minimumDueAmount = v27->_minimumDueAmount;
    v27->_minimumDueAmount = (NSDecimalNumber *)v40;

    v42 = objc_msgSend(v22, "copy");
    nextPaymentDueDate = v27->_nextPaymentDueDate;
    v27->_nextPaymentDueDate = (NSDate *)v42;

    v44 = objc_msgSend(v23, "copy");
    lastUpdated = v27->_lastUpdated;
    v27->_lastUpdated = (NSDate *)v44;

    v46 = objc_msgSend(v25, "copy");
    openingDate = v27->_openingDate;
    v27->_openingDate = (NSDate *)v46;

    v48 = objc_msgSend(v26, "copy");
    overduePaymentAmount = v27->_overduePaymentAmount;
    v27->_overduePaymentAmount = (NSDecimalNumber *)v48;

  }
  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_totalBalance, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v5[5] = self->_status;
  v16 = -[NSDecimalNumber copyWithZone:](self->_minimumDueAmount, "copyWithZone:", a3);
  v17 = (void *)v5[9];
  v5[9] = v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_creditLimit, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  v20 = -[NSDate copyWithZone:](self->_nextPaymentDueDate, "copyWithZone:", a3);
  v21 = (void *)v5[10];
  v5[10] = v20;

  v22 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  v23 = (void *)v5[11];
  v5[11] = v22;

  v24 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  v25 = (void *)v5[12];
  v5[12] = v24;

  v26 = -[NSDecimalNumber copyWithZone:](self->_overduePaymentAmount, "copyWithZone:", a3);
  v27 = (void *)v5[13];
  v5[13] = v26;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_totalBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDueAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_creditLimit);
  objc_msgSend(v3, "safelyAddObject:", self->_nextPaymentDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_overduePaymentAmount);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_status);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKAppleAccount *v4;
  FKAppleAccount *v5;
  void **v6;
  BOOL v7;

  v4 = (FKAppleAccount *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = FKEqualObjects(self->_accountIdentifier, v6[1])
      && FKEqualObjects(self->_displayName, v6[7])
      && FKEqualObjects(self->_minimumDueAmount, v6[9])
      && FKEqualObjects(self->_currentBalance, v6[2])
      && FKEqualObjects(self->_totalBalance, v6[3])
      && FKEqualObjects(self->_currency, v6[4])
      && FKEqualObjects(self->_creditLimit, v6[8])
      && FKEqualObjects(self->_nextPaymentDueDate, v6[10])
      && FKEqualObjects(self->_lastUpdated, v6[11])
      && FKEqualObjects(self->_openingDate, v6[12])
      && FKEqualObjects(self->_overduePaymentAmount, v6[13])
      && self->_status == (_QWORD)v6[5];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumDueAmount: '%@'; "), self->_minimumDueAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalBalance: '%@'; "), self->_totalBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("currency: '%@'; "), self->_currency);
  objc_msgSend(v3, "appendFormat:", CFSTR("creditLimit: '%@'; "), self->_creditLimit);
  objc_msgSend(v3, "appendFormat:", CFSTR("nextPaymentDueDate: '%@'; "), self->_nextPaymentDueDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%ld'; "), self->_status);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), self->_openingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("overduePaymentAmount: '%@'; "), self->_overduePaymentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)creditDebitIndicator
{
  return self->_type - 1 < 2;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (NSString)currency
{
  return self->_currency;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (NSDecimalNumber)minimumDueAmount
{
  return self->_minimumDueAmount;
}

- (NSDate)nextPaymentDueDate
{
  return self->_nextPaymentDueDate;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (NSDecimalNumber)overduePaymentAmount
{
  return self->_overduePaymentAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overduePaymentAmount, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_nextPaymentDueDate, 0);
  objc_storeStrong((id *)&self->_minimumDueAmount, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end

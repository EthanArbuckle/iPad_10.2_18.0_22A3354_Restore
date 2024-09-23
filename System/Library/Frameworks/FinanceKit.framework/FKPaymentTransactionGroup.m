@implementation FKPaymentTransactionGroup

- (FKPaymentTransactionGroup)initWithStartDate:(id)a3 endDate:(id)a4 transactionCount:(int64_t)a5 type:(unint64_t)a6 bankConnectSectionIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  FKPaymentTransactionGroup *v15;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *endDate;
  uint64_t v20;
  NSString *bankConnectSectionIdentifier;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)FKPaymentTransactionGroup;
  v15 = -[FKPaymentTransactionGroup init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    v18 = objc_msgSend(v13, "copy");
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v18;

    v15->_transactionCount = a5;
    v15->_type = a6;
    v20 = objc_msgSend(v14, "copy");
    bankConnectSectionIdentifier = v15->_bankConnectSectionIdentifier;
    v15->_bankConnectSectionIdentifier = (NSString *)v20;

  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKPaymentTransactionGroup *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  NSString *bankConnectSectionIdentifier;

  v5 = objc_alloc_init(FKPaymentTransactionGroup);
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v8;

  v10 = -[NSString copyWithZone:](self->_bankConnectSectionIdentifier, "copyWithZone:", a3);
  bankConnectSectionIdentifier = v5->_bankConnectSectionIdentifier;
  v5->_bankConnectSectionIdentifier = (NSString *)v10;

  v5->_transactionCount = self->_transactionCount;
  v5->_type = self->_type;
  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectSectionIdentifier);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_transactionCount);
  v6 = FKIntegerHash(v5, self->_type);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  FKPaymentTransactionGroup *v4;
  FKPaymentTransactionGroup *v5;
  void **v6;
  BOOL v7;

  v4 = (FKPaymentTransactionGroup *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = FKEqualObjects(self->_startDate, v6[1])
      && FKEqualObjects(self->_endDate, v6[2])
      && FKEqualObjects(self->_bankConnectSectionIdentifier, v6[5])
      && (void *)self->_transactionCount == v6[3]
      && self->_type == (_QWORD)v6[4];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)bankConnectSectionIdentifier
{
  return self->_bankConnectSectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

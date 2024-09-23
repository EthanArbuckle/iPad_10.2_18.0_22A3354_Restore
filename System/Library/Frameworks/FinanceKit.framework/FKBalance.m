@implementation FKBalance

- (FKBalance)initWithUUID:(id)a3 availableBalance:(id)a4 bookedBalance:(id)a5 lastUpdatedAt:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FKBalance *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  FKBalanceCalculation *availableBalance;
  uint64_t v19;
  FKBalanceCalculation *bookedBalance;
  uint64_t v21;
  NSDate *lastUpdatedAt;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKBalance;
  v14 = -[FKBalance init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    availableBalance = v14->_availableBalance;
    v14->_availableBalance = (FKBalanceCalculation *)v17;

    v19 = objc_msgSend(v12, "copy");
    bookedBalance = v14->_bookedBalance;
    v14->_bookedBalance = (FKBalanceCalculation *)v19;

    v21 = objc_msgSend(v13, "copy");
    lastUpdatedAt = v14->_lastUpdatedAt;
    v14->_lastUpdatedAt = (NSDate *)v21;

  }
  return v14;
}

- (BOOL)hasMultipleBalances
{
  return self->_availableBalance && self->_bookedBalance != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKBalance *v5;
  uint64_t v6;
  NSUUID *uuid;
  FKBalanceCalculation *v8;
  FKBalanceCalculation *availableBalance;
  FKBalanceCalculation *v10;
  FKBalanceCalculation *bookedBalance;
  uint64_t v12;
  NSDate *lastUpdatedAt;

  v5 = objc_alloc_init(FKBalance);
  v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  v8 = -[FKBalanceCalculation copyWithZone:](self->_availableBalance, "copyWithZone:", a3);
  availableBalance = v5->_availableBalance;
  v5->_availableBalance = v8;

  v10 = -[FKBalanceCalculation copyWithZone:](self->_bookedBalance, "copyWithZone:", a3);
  bookedBalance = v5->_bookedBalance;
  v5->_bookedBalance = v10;

  v12 = -[NSDate copyWithZone:](self->_lastUpdatedAt, "copyWithZone:", a3);
  lastUpdatedAt = v5->_lastUpdatedAt;
  v5->_lastUpdatedAt = (NSDate *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_uuid);
  objc_msgSend(v3, "safelyAddObject:", self->_availableBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_bookedBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedAt);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKBalance *v4;
  FKBalance *v5;
  void **v6;
  char v7;

  v4 = (FKBalance *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_uuid, v6[1])
      && FKEqualObjects(self->_availableBalance, v6[2])
      && FKEqualObjects(self->_bookedBalance, v6[3]))
    {
      v7 = FKEqualObjects(self->_lastUpdatedAt, v6[4]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (FKBalanceCalculation)availableBalance
{
  return self->_availableBalance;
}

- (FKBalanceCalculation)bookedBalance
{
  return self->_bookedBalance;
}

- (NSDate)lastUpdatedAt
{
  return self->_lastUpdatedAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_bookedBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end

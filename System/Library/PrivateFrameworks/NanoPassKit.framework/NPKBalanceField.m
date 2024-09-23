@implementation NPKBalanceField

- (NPKBalanceField)initWithBalance:(id)a3 label:(id)a4 formattedValue:(id)a5 identifier:(id)a6 primaryBalance:(BOOL)a7 action:(id)a8 pendingUpdateExpireDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NPKBalanceField *v21;
  NPKBalanceField *v22;
  uint64_t v23;
  NSString *label;
  uint64_t v25;
  NSString *formattedValue;
  uint64_t v27;
  NSString *identifier;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)NPKBalanceField;
  v21 = -[NPKBalanceField init](&v31, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_balance, a3);
    v23 = objc_msgSend(v16, "copy");
    label = v22->_label;
    v22->_label = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    formattedValue = v22->_formattedValue;
    v22->_formattedValue = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v27;

    v22->_isPrimaryBalance = a7;
    objc_storeStrong((id *)&v22->_action, a8);
    objc_storeStrong((id *)&v22->_pendingUpdateExpireDate, a9);
  }

  return v22;
}

- (NPKBalanceField)initWithCoder:(id)a3
{
  id v4;
  NPKBalanceField *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  PKPaymentBalance *balance;
  uint64_t v10;
  NSString *formattedValue;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  PKPaymentPassAction *action;
  uint64_t v16;
  NSDate *pendingUpdateExpireDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPKBalanceField;
  v5 = -[NPKBalanceField init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v8 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (PKPaymentBalance *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    formattedValue = v5->_formattedValue;
    v5->_formattedValue = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v5->_isPrimaryBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimaryBalance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v14 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (PKPaymentPassAction *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingUpdateExpireDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    pendingUpdateExpireDate = v5->_pendingUpdateExpireDate;
    v5->_pendingUpdateExpireDate = (NSDate *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedValue, CFSTR("formattedValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrimaryBalance, CFSTR("isPrimaryBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingUpdateExpireDate, CFSTR("pendingUpdateExpireDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasPendingUpdate
{
  NSDate *pendingUpdateExpireDate;
  double v3;

  pendingUpdateExpireDate = self->_pendingUpdateExpireDate;
  if (pendingUpdateExpireDate)
  {
    -[NSDate timeIntervalSinceNow](pendingUpdateExpireDate, "timeIntervalSinceNow");
    LOBYTE(pendingUpdateExpireDate) = v3 > 0.0;
  }
  return (char)pendingUpdateExpireDate;
}

- (BOOL)isEqual:(id)a3
{
  NPKBalanceField *v4;
  NPKBalanceField *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  void *v14;
  void *v15;

  v4 = (NPKBalanceField *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (-[NPKBalanceField conformsToProtocol:](v4, "conformsToProtocol:", &unk_254D39A10))
  {
    -[NPKBalanceField balance](self, "balance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKBalanceField balance](v5, "balance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKEqualObjects())
    {
      -[NPKBalanceField label](self, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKBalanceField label](v5, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKEqualObjects())
      {
        -[NPKBalanceField formattedValue](self, "formattedValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKBalanceField formattedValue](v5, "formattedValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (PKEqualObjects()
          && (v12 = -[NPKBalanceField isPrimaryBalance](self, "isPrimaryBalance"),
              v12 == -[NPKBalanceField isPrimaryBalance](v5, "isPrimaryBalance")))
        {
          -[NPKBalanceField action](self, "action");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPKBalanceField action](v5, "action");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = PKEqualObjects();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *pendingUpdateExpireDate;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[NPKBalanceField label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBalanceField formattedValue](self, "formattedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBalanceField isPrimaryBalance](self, "isPrimaryBalance");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBalanceField identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> {label:%@ formattedValue:%@ isPrimaryBalance:%@ ID:%@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  pendingUpdateExpireDate = self->_pendingUpdateExpireDate;
  if (pendingUpdateExpireDate)
    objc_msgSend(v9, "appendFormat:", CFSTR(" PendingUpdateExpireDate:%@ hasPendingUpdate:%d"), pendingUpdateExpireDate, -[NPKBalanceField hasPendingUpdate](self, "hasPendingUpdate"));
  -[NPKBalanceField balance](self, "balance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NPKBalanceField balance](self, "balance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" balanceValue:%@"), v13);

  }
  -[NPKBalanceField action](self, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NPKBalanceField action](self, "action");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" action:%@"), v15);

  }
  objc_msgSend(v9, "appendString:", CFSTR("}"));
  return (NSString *)v9;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isPrimaryBalance
{
  return self->_isPrimaryBalance;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPaymentBalance)balance
{
  return self->_balance;
}

- (NSNumber)rawCountValue
{
  return self->_rawCountValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCountValue, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingUpdateExpireDate, 0);
}

@end

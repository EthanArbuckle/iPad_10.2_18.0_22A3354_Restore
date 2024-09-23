@implementation NPKCommutePlanField

- (NPKCommutePlanField)initWithLabel:(id)a3 detailLabel:(id)a4 formattedValue:(id)a5 rawCountValue:(id)a6 usageDateRange:(id)a7 identifier:(id)a8 details:(id)a9 action:(id)a10 isDeviceBound:(BOOL)a11 pendingUpdateExpireDate:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NPKCommutePlanField *v23;
  uint64_t v24;
  NSString *label;
  uint64_t v26;
  NSString *detailLabel;
  uint64_t v28;
  NSString *formattedValue;
  uint64_t v30;
  NSString *identifier;
  uint64_t v32;
  NSArray *details;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v18 = a5;
  v36 = a6;
  v35 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a12;
  v39.receiver = self;
  v39.super_class = (Class)NPKCommutePlanField;
  v23 = -[NPKCommutePlanField init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v38, "copy");
    label = v23->_label;
    v23->_label = (NSString *)v24;

    v26 = objc_msgSend(v37, "copy");
    detailLabel = v23->_detailLabel;
    v23->_detailLabel = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    formattedValue = v23->_formattedValue;
    v23->_formattedValue = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    details = v23->_details;
    v23->_details = (NSArray *)v32;

    objc_storeStrong((id *)&v23->_action, a10);
    objc_storeStrong((id *)&v23->_usageDateRange, a7);
    objc_storeStrong((id *)&v23->_rawCountValue, a6);
    v23->_isDeviceBound = a11;
    objc_storeStrong((id *)&v23->_pendingUpdateExpireDate, a12);
  }

  return v23;
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

- (BOOL)isCountBasedCommutePlan
{
  return self->_formattedValue != 0;
}

- (BOOL)isActive
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  if (-[NPKCommutePlanField isCountBasedCommutePlan](self, "isCountBasedCommutePlan"))
  {
    -[NPKCommutePlanField rawCountValue](self, "rawCountValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    if (v4 > 0)
      return 1;
  }
  if (-[NPKCommutePlanField isCountBasedCommutePlan](self, "isCountBasedCommutePlan"))
    return 0;
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expiryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 != 1)
    return 0;
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    return 1;
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  return v17 == -1;
}

- (NSDate)availableFrom
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[NPKDateRange startDate](self->_usageDateRange, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (-[PKPaymentPassAction availableFromRelative](self->_action, "availableFromRelative"), v4 == 0.0))
  {
    -[PKPaymentPassAction availableFrom](self->_action, "availableFrom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[PKPaymentPassAction availableFrom](self->_action, "availableFrom");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentPassAction availableFromRelative](self->_action, "availableFromRelative");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  if (!v5)
    goto LABEL_7;
LABEL_8:

  return (NSDate *)v7;
}

- (NSDate)availableUntil
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[NPKDateRange expiryDate](self->_usageDateRange, "expiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (-[PKPaymentPassAction availableUntilRelative](self->_action, "availableUntilRelative"), v4 == 0.0))
  {
    -[PKPaymentPassAction availableUntil](self->_action, "availableUntil");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[PKPaymentPassAction availableUntil](self->_action, "availableUntil");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentPassAction availableUntilRelative](self->_action, "availableUntilRelative");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  if (!v5)
    goto LABEL_7;
LABEL_8:

  return (NSDate *)v7;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[NPKCommutePlanField label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKCommutePlanField detailLabel](self, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKCommutePlanField identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> {label:%@ detailLabel:%@ ID:%@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKCommutePlanField formattedValue](self, "formattedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NPKCommutePlanField formattedValue](self, "formattedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" formattedValue:%@"), v10);

  }
  -[NPKCommutePlanField action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NPKCommutePlanField action](self, "action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" action:%@"), v12);

  }
  -[NPKCommutePlanField details](self, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v8, "appendString:", CFSTR(" details:"));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[NPKCommutePlanField details](self, "details");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "label");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendFormat:", CFSTR(" (%@: %@)"), v21, v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

  }
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" startDate:%@"), v26);

  }
  -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "expiryDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NPKCommutePlanField usageDateRange](self, "usageDateRange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "expiryDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" expiryDate:%@"), v30);

  }
  objc_msgSend(v8, "appendString:", CFSTR("}"));
  return (NSString *)v8;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)details
{
  return self->_details;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (NPKDateRange)usageDateRange
{
  return self->_usageDateRange;
}

- (NSNumber)rawCountValue
{
  return self->_rawCountValue;
}

- (BOOL)isDeviceBound
{
  return self->_isDeviceBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCountValue, 0);
  objc_storeStrong((id *)&self->_usageDateRange, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingUpdateExpireDate, 0);
}

@end

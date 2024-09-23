@implementation HDNotificationInstructionMessage

- (id)_initWithMinimumCompatibleVersion:(void *)a3 creationDateTimeIntervalNumber:(void *)a4 sendingDeviceInfo:(void *)a5 actionNumber:(void *)a6 clientIdentifier:(void *)a7 categoryIdentifier:(void *)a8 expirationDateTimeIntervalNumber:(void *)a9 criteria:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (a1 && v16 && objc_msgSend(v16, "integerValue") <= 1)
  {
    v24 = 0;
    if (v17 && v18 && v19 && v20 && v21 && v22)
    {
      v26 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v19, "integerValue");
      v27 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v32 - 1) > 2)
      {
        v24 = 0;
      }
      else
      {
        v29 = a1;
        v30 = v28;
        v31 = (id)objc_msgSend(v29, "initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:", v33, v18, v23);
        v28 = v30;
        a1 = v31;
        v24 = v31;
      }

    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (HDNotificationInstructionMessage)initWithCreationDate:(id)a3 sendingDeviceInfo:(id)a4 action:(int64_t)a5 clientIdentifier:(id)a6 categoryIdentifier:(id)a7 expirationDate:(id)a8 criteria:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HDNotificationInstructionMessage *v21;
  uint64_t v22;
  NSString *sendingDeviceInfo;
  uint64_t v24;
  NSString *clientIdentifier;
  uint64_t v26;
  NSString *categoryIdentifier;
  uint64_t v28;
  NSDate *creationDate;
  uint64_t v30;
  NSDate *expirationDate;
  uint64_t v32;
  HDNotificationInstructionCriteria *criteria;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)HDNotificationInstructionMessage;
  v21 = -[HDNotificationInstructionMessage init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    sendingDeviceInfo = v21->_sendingDeviceInfo;
    v21->_sendingDeviceInfo = (NSString *)v22;

    v21->_action = a5;
    v24 = objc_msgSend(v17, "copy");
    clientIdentifier = v21->_clientIdentifier;
    v21->_clientIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    categoryIdentifier = v21->_categoryIdentifier;
    v21->_categoryIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v15, "copy");
    creationDate = v21->_creationDate;
    v21->_creationDate = (NSDate *)v28;

    v30 = objc_msgSend(v19, "copy");
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = (NSDate *)v30;

    v32 = objc_msgSend(v20, "copy");
    criteria = v21->_criteria;
    v21->_criteria = (HDNotificationInstructionCriteria *)v32;

  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  HDNotificationInstructionMessage *v4;
  HDNotificationInstructionMessage *v5;
  NSString *categoryIdentifier;
  NSString *v7;
  NSString *clientIdentifier;
  NSString *v9;
  NSDate *creationDate;
  NSDate *v11;
  NSDate *expirationDate;
  NSDate *v13;
  NSString *sendingDeviceInfo;
  NSString *v15;
  HDNotificationInstructionCriteria *criteria;
  HDNotificationInstructionCriteria *v17;
  char v18;

  v4 = (HDNotificationInstructionMessage *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_action != v5->_action)
        goto LABEL_24;
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:")))
        goto LABEL_24;
      clientIdentifier = self->_clientIdentifier;
      v9 = v5->_clientIdentifier;
      if (clientIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:")))
        goto LABEL_24;
      creationDate = self->_creationDate;
      v11 = v5->_creationDate;
      if (creationDate != v11 && (!v11 || !-[NSDate isEqualToDate:](creationDate, "isEqualToDate:")))
        goto LABEL_24;
      expirationDate = self->_expirationDate;
      v13 = v5->_expirationDate;
      if (expirationDate != v13 && (!v13 || !-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:")))
        goto LABEL_24;
      sendingDeviceInfo = self->_sendingDeviceInfo;
      v15 = v5->_sendingDeviceInfo;
      if (sendingDeviceInfo != v15 && (!v15 || !-[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:")))
        goto LABEL_24;
      criteria = self->_criteria;
      v17 = v5->_criteria;
      if (criteria == v17)
      {
        v18 = 1;
        goto LABEL_25;
      }
      if (v17)
        v18 = -[HDNotificationInstructionCriteria isEqual:](criteria, "isEqual:");
      else
LABEL_24:
        v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v18 = 0;
  }
LABEL_26:

  return v18;
}

- (unint64_t)hash
{
  int64_t action;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  action = self->_action;
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ action;
  v5 = -[NSString hash](self->_clientIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_creationDate, "hash");
  v7 = -[NSDate hash](self->_expirationDate, "hash");
  v8 = v7 ^ -[NSString hash](self->_sendingDeviceInfo, "hash");
  return v6 ^ v8 ^ -[HDNotificationInstructionCriteria hash](self->_criteria, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromHKNotificationInstructionAction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@ ctime:%@ %@:%@ expires:%@ criteria:%@ device:%@>"), v4, v5, self->_creationDate, self->_clientIdentifier, self->_categoryIdentifier, self->_expirationDate, self->_criteria, self->_sendingDeviceInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HDNotificationInstructionMessage)initWithMessageDictionary:(id)a3 criteriaClasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HDNotificationInstructionMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("criteriaIdentifier"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "hk_safeDictionaryForKeyPath:error:", CFSTR("criteria"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __78__HDNotificationInstructionMessage_initWithMessageDictionary_criteriaClasses___block_invoke;
      v21[3] = &unk_1E6CFC3C8;
      v22 = v8;
      v10 = (HDNotificationInstructionMessage *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "hk_firstObjectPassingTest:", v21)), "initWithMessageDictionary:", v9);

      if (!v10)
        goto LABEL_9;
    }
    else
    {
      v10 = 0;
    }
    v19 = v8;
    v20 = v7;

  }
  else
  {
    v19 = 0;
    v20 = v7;
    v10 = 0;
  }
  objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("minimumCompatibleVersion"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("creationDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("sendingDeviceInfo"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("action"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("clientIdentifier"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("categoryIdentifier"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("expirationDate"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v11, v12, v13, v14, v15, v16, v17, v10);

  v9 = v10;
  v10 = self;
  v8 = v19;
  v7 = v20;
LABEL_9:

  return v10;
}

uint64_t __78__HDNotificationInstructionMessage_initWithMessageDictionary_criteriaClasses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "criteriaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSDictionary)messageDictionary
{
  void *v3;
  void *v4;
  int64_t action;
  NSString *sendingDeviceInfo;
  void *v7;
  NSString *clientIdentifier;
  NSString *categoryIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[8];
  _QWORD v19[9];

  v19[8] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("currentCompatibilityVersion");
  v18[1] = CFSTR("minimumCompatibleVersion");
  v19[0] = &unk_1E6DFD628;
  v19[1] = &unk_1E6DFD640;
  v18[2] = CFSTR("creationDate");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_creationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sendingDeviceInfo = self->_sendingDeviceInfo;
  action = self->_action;
  v19[2] = v4;
  v19[3] = sendingDeviceInfo;
  v18[3] = CFSTR("sendingDeviceInfo");
  v18[4] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", action);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  categoryIdentifier = self->_categoryIdentifier;
  v19[4] = v7;
  v19[5] = clientIdentifier;
  v18[5] = CFSTR("clientIdentifier");
  v18[6] = CFSTR("categoryIdentifier");
  v19[6] = categoryIdentifier;
  v18[7] = CFSTR("expirationDate");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (self->_criteria)
  {
    objc_msgSend((id)objc_opt_class(), "criteriaIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("criteriaIdentifier"));

    -[HDNotificationInstructionCriteria messageDictionary](self->_criteria, "messageDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("criteria"));

  }
  v16 = (void *)objc_msgSend(v13, "copy");

  return (NSDictionary *)v16;
}

- (HDNotificationInstructionMessage)initWithCodableNotificationInstructionMessage:(id)a3 criteriaClasses:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HDNotificationInstructionMessage *v18;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "hasCriteria"))
  {
    v9 = 0;
LABEL_6:
    v22 = objc_msgSend(v6, "hasMinimumCompatibleVersion");
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "minimumCompatibleVersion"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v20 = objc_msgSend(v6, "hasCreationDateTimeInterval");
    if (v20)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "creationDateTimeInterval");
      objc_msgSend(v10, "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v11 = objc_msgSend(v6, "hasSendingDeviceInfo");
    if (v11)
    {
      objc_msgSend(v6, "sendingDeviceInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v21 = objc_msgSend(v6, "hasAction");
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "action"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v12 = objc_msgSend(v6, "hasClientIdentifier");
    if (v12)
    {
      objc_msgSend(v6, "clientIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v13 = objc_msgSend(v6, "hasCategoryIdentifier");
    if (v13)
    {
      objc_msgSend(v6, "categoryIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if ((objc_msgSend(v6, "hasExpirationDateTimeInterval") & 1) != 0)
    {
      v15 = v7;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "expirationDateTimeInterval");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v8, v26, v25, v24, v23, v14, v17, v9);

      v7 = v15;
    }
    else
    {
      self = (HDNotificationInstructionMessage *)-[HDNotificationInstructionMessage _initWithMinimumCompatibleVersion:creationDateTimeIntervalNumber:sendingDeviceInfo:actionNumber:clientIdentifier:categoryIdentifier:expirationDateTimeIntervalNumber:criteria:](self, v8, v26, v25, v24, v23, v14, 0, v9);
    }
    if (v13)

    if (v12)
    if (v21)
    {

      if (!v11)
      {
LABEL_33:
        if (!v20)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    else if (!v11)
    {
      goto LABEL_33;
    }

    if (!v20)
    {
LABEL_35:
      v18 = self;
      if (!v22)
        goto LABEL_43;
      goto LABEL_42;
    }
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(v6, "criteria");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasIdentifier"))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __98__HDNotificationInstructionMessage_initWithCodableNotificationInstructionMessage_criteriaClasses___block_invoke;
    v27[3] = &unk_1E6CFC3C8;
    v8 = v8;
    v28 = v8;
    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "hk_firstObjectPassingTest:", v27)), "initWithCodableNotificationInstructionCriteria:", v8);

    if (v9)
    {

      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
  }
  v18 = 0;
LABEL_42:

LABEL_43:
  return v18;
}

uint64_t __98__HDNotificationInstructionMessage_initWithCodableNotificationInstructionMessage_criteriaClasses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "criteriaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (HDCodableNotificationInstructionMessage)codableMessage
{
  HDCodableNotificationInstructionMessage *v3;
  HDNotificationInstructionCriteria *criteria;
  void *v5;

  v3 = objc_alloc_init(HDCodableNotificationInstructionMessage);
  -[HDCodableNotificationInstructionMessage setCurrentCompatibilityVersion:](v3, "setCurrentCompatibilityVersion:", 2);
  -[HDCodableNotificationInstructionMessage setMinimumCompatibleVersion:](v3, "setMinimumCompatibleVersion:", 1);
  -[NSDate timeIntervalSinceReferenceDate](self->_creationDate, "timeIntervalSinceReferenceDate");
  -[HDCodableNotificationInstructionMessage setCreationDateTimeInterval:](v3, "setCreationDateTimeInterval:");
  -[HDCodableNotificationInstructionMessage setSendingDeviceInfo:](v3, "setSendingDeviceInfo:", self->_sendingDeviceInfo);
  -[HDCodableNotificationInstructionMessage setAction:](v3, "setAction:", self->_action);
  -[HDCodableNotificationInstructionMessage setClientIdentifier:](v3, "setClientIdentifier:", self->_clientIdentifier);
  -[HDCodableNotificationInstructionMessage setCategoryIdentifier:](v3, "setCategoryIdentifier:", self->_categoryIdentifier);
  -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
  -[HDCodableNotificationInstructionMessage setExpirationDateTimeInterval:](v3, "setExpirationDateTimeInterval:");
  criteria = self->_criteria;
  if (criteria)
  {
    -[HDNotificationInstructionCriteria codableCriteria](criteria, "codableCriteria");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableNotificationInstructionMessage setCriteria:](v3, "setCriteria:", v5);

  }
  return v3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)sendingDeviceInfo
{
  return self->_sendingDeviceInfo;
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HDNotificationInstructionCriteria)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end

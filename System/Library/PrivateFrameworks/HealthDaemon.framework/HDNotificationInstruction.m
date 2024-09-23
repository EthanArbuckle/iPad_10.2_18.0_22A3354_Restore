@implementation HDNotificationInstruction

- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(int64_t)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HDNotificationInstruction *v28;
  uint64_t v29;
  NSString *messageIdentifier;
  uint64_t v31;
  NSString *sendingDeviceName;
  uint64_t v33;
  NSString *sendingDeviceInfo;
  uint64_t v35;
  NSString *clientIdentifier;
  uint64_t v37;
  NSString *categoryIdentifier;
  uint64_t v39;
  NSDate *creationDate;
  uint64_t v41;
  NSDate *receivedDate;
  uint64_t v43;
  NSDate *expirationDate;
  uint64_t v45;
  NSDate *modificationDate;
  uint64_t v47;
  HDNotificationInstructionCriteria *criteria;
  id v50;
  id v51;
  objc_super v52;

  v51 = a3;
  v50 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v52.receiver = self;
  v52.super_class = (Class)HDNotificationInstruction;
  v28 = -[HDNotificationInstruction init](&v52, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v51, "copy");
    messageIdentifier = v28->_messageIdentifier;
    v28->_messageIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v22, "copy");
    sendingDeviceName = v28->_sendingDeviceName;
    v28->_sendingDeviceName = (NSString *)v31;

    v33 = objc_msgSend(v23, "copy");
    sendingDeviceInfo = v28->_sendingDeviceInfo;
    v28->_sendingDeviceInfo = (NSString *)v33;

    v28->_action = a9;
    v35 = objc_msgSend(v24, "copy");
    clientIdentifier = v28->_clientIdentifier;
    v28->_clientIdentifier = (NSString *)v35;

    v37 = objc_msgSend(v25, "copy");
    categoryIdentifier = v28->_categoryIdentifier;
    v28->_categoryIdentifier = (NSString *)v37;

    v39 = objc_msgSend(v50, "copy");
    creationDate = v28->_creationDate;
    v28->_creationDate = (NSDate *)v39;

    v41 = objc_msgSend(v20, "copy");
    receivedDate = v28->_receivedDate;
    v28->_receivedDate = (NSDate *)v41;

    v43 = objc_msgSend(v26, "copy");
    expirationDate = v28->_expirationDate;
    v28->_expirationDate = (NSDate *)v43;

    v45 = objc_msgSend(v21, "copy");
    modificationDate = v28->_modificationDate;
    v28->_modificationDate = (NSDate *)v45;

    v47 = objc_msgSend(v27, "copy");
    criteria = v28->_criteria;
    v28->_criteria = (HDNotificationInstructionCriteria *)v47;

    v28->_isInvalid = a14;
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  HDNotificationInstruction *v4;
  HDNotificationInstruction *v5;
  NSString *categoryIdentifier;
  NSString *v7;
  NSString *clientIdentifier;
  NSString *v9;
  NSDate *creationDate;
  NSDate *v11;
  NSDate *receivedDate;
  NSDate *v13;
  NSDate *expirationDate;
  NSDate *v15;
  NSDate *modificationDate;
  NSDate *v17;
  NSString *messageIdentifier;
  NSString *v19;
  NSString *sendingDeviceName;
  NSString *v21;
  NSString *sendingDeviceInfo;
  NSString *v23;
  HDNotificationInstructionCriteria *criteria;
  HDNotificationInstructionCriteria *v25;
  BOOL v26;

  v4 = (HDNotificationInstruction *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_action != v5->_action)
        goto LABEL_37;
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:")))
        goto LABEL_37;
      clientIdentifier = self->_clientIdentifier;
      v9 = v5->_clientIdentifier;
      if (clientIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:")))
        goto LABEL_37;
      creationDate = self->_creationDate;
      v11 = v5->_creationDate;
      if (creationDate != v11 && (!v11 || !-[NSDate isEqualToDate:](creationDate, "isEqualToDate:")))
        goto LABEL_37;
      receivedDate = self->_receivedDate;
      v13 = v5->_receivedDate;
      if (receivedDate != v13 && (!v13 || !-[NSDate isEqualToDate:](receivedDate, "isEqualToDate:")))
        goto LABEL_37;
      expirationDate = self->_expirationDate;
      v15 = v5->_expirationDate;
      if (expirationDate != v15 && (!v15 || !-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:")))
        goto LABEL_37;
      modificationDate = self->_modificationDate;
      v17 = v5->_modificationDate;
      if (modificationDate != v17 && (!v17 || !-[NSDate isEqualToDate:](modificationDate, "isEqualToDate:")))
        goto LABEL_37;
      messageIdentifier = self->_messageIdentifier;
      v19 = v5->_messageIdentifier;
      if (messageIdentifier != v19 && (!v19 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:")))
        goto LABEL_37;
      if (((sendingDeviceName = self->_sendingDeviceName, v21 = v5->_sendingDeviceName, sendingDeviceName == v21)
         || v21 && -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:"))
        && ((sendingDeviceInfo = self->_sendingDeviceInfo, v23 = v5->_sendingDeviceInfo, sendingDeviceInfo == v23)
         || v23 && -[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:"))
        && ((criteria = self->_criteria, v25 = v5->_criteria, criteria == v25)
         || v25 && -[HDNotificationInstructionCriteria isEqual:](criteria, "isEqual:")))
      {
        v26 = self->_isInvalid == v5->_isInvalid;
      }
      else
      {
LABEL_37:
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (unint64_t)hash
{
  int64_t action;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  action = self->_action;
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ action;
  v5 = -[NSString hash](self->_clientIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_creationDate, "hash");
  v7 = -[NSDate hash](self->_receivedDate, "hash");
  v8 = v7 ^ -[NSDate hash](self->_expirationDate, "hash");
  v9 = v6 ^ v8 ^ -[NSDate hash](self->_modificationDate, "hash");
  v10 = -[NSString hash](self->_messageIdentifier, "hash");
  v11 = v10 ^ -[NSString hash](self->_sendingDeviceName, "hash");
  v12 = v11 ^ -[NSString hash](self->_sendingDeviceInfo, "hash");
  return v9 ^ v12 ^ -[HDNotificationInstructionCriteria hash](self->_criteria, "hash") ^ self->_isInvalid;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *sendingDeviceName;
  NSString *sendingDeviceInfo;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromHKNotificationInstructionAction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_receivedDate;
  v14 = *(_OWORD *)&self->_messageIdentifier;
  v12 = *(_OWORD *)&self->_clientIdentifier;
  v11 = *(_OWORD *)&self->_expirationDate;
  sendingDeviceName = self->_sendingDeviceName;
  sendingDeviceInfo = self->_sendingDeviceInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInvalid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@ mID:%@ ctime:%@ rtime:%@ mtime:%@ %@:%@ expires:%@ criteria:%@ device:%@;%@ invalid:%@>"),
    v4,
    v5,
    v14,
    v13,
    v12,
    v11,
    sendingDeviceName,
    sendingDeviceInfo,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HDNotificationInstruction)initWithMessageIdentifier:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 message:(id)a6
{
  HDNotificationInstruction *v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HDNotificationInstruction *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v7 = 0;
  if (a3 && a6)
  {
    v11 = a6;
    v25 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend(v11, "creationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "creationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendingDeviceInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "action");
    objc_msgSend(v11, "clientIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expirationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "criteria");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v21) = 0;
    v19 = -[HDNotificationInstruction initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:](self, "initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:", v13, v24, v12, v23, v25, v14, v15, v22, v16, v17, v18, v21);

    self = v19;
    v7 = self;
  }

  return v7;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)sendingDeviceName
{
  return self->_sendingDeviceName;
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

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  int64_t v12;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (-[HDNotificationInstruction isInvalid](self, "isInvalid")
    || (-[HDNotificationInstruction expirationDate](self, "expirationDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "hk_isAfterDate:", v10),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 2;
  }
  else
  {
    -[HDNotificationInstruction criteria](self, "criteria");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HDNotificationInstruction criteria](self, "criteria");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isValidWithDatabaseTransaction:error:", v8, a5);

    }
    else
    {
      v12 = 1;
    }
  }

  return v12;
}

@end

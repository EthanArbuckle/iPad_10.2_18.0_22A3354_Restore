@implementation HKNotificationInstructionDiagnosticDescription

- (HKNotificationInstructionDiagnosticDescription)initWithMessageIdentifier:(id)a3 creationDate:(id)a4 receivedDate:(id)a5 modificationDate:(id)a6 sendingDeviceName:(id)a7 sendingDeviceInfo:(id)a8 action:(id)a9 clientIdentifier:(id)a10 categoryIdentifier:(id)a11 expirationDate:(id)a12 criteria:(id)a13 isInvalid:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  HKNotificationInstructionDiagnosticDescription *v29;
  uint64_t v30;
  NSString *messageIdentifier;
  uint64_t v32;
  NSString *creationDate;
  uint64_t v34;
  NSString *receivedDate;
  uint64_t v36;
  NSString *modificationDate;
  uint64_t v38;
  NSString *sendingDeviceName;
  uint64_t v40;
  NSString *sendingDeviceInfo;
  uint64_t v42;
  NSString *action;
  uint64_t v44;
  NSString *clientIdentifier;
  uint64_t v46;
  NSString *categoryIdentifier;
  uint64_t v48;
  NSString *expirationDate;
  uint64_t v50;
  NSString *criteria;
  uint64_t v52;
  NSString *isInvalid;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v58 = a6;
  v57 = a7;
  v56 = a8;
  v22 = v20;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)HKNotificationInstructionDiagnosticDescription;
  v29 = -[HKNotificationInstructionDiagnosticDescription init](&v59, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v19, "copy");
    messageIdentifier = v29->_messageIdentifier;
    v29->_messageIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    creationDate = v29->_creationDate;
    v29->_creationDate = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    receivedDate = v29->_receivedDate;
    v29->_receivedDate = (NSString *)v34;

    v36 = objc_msgSend(v58, "copy");
    modificationDate = v29->_modificationDate;
    v29->_modificationDate = (NSString *)v36;

    v38 = objc_msgSend(v57, "copy");
    sendingDeviceName = v29->_sendingDeviceName;
    v29->_sendingDeviceName = (NSString *)v38;

    v40 = objc_msgSend(v56, "copy");
    sendingDeviceInfo = v29->_sendingDeviceInfo;
    v29->_sendingDeviceInfo = (NSString *)v40;

    v42 = objc_msgSend(v23, "copy");
    action = v29->_action;
    v29->_action = (NSString *)v42;

    v44 = objc_msgSend(v24, "copy");
    clientIdentifier = v29->_clientIdentifier;
    v29->_clientIdentifier = (NSString *)v44;

    v46 = objc_msgSend(v25, "copy");
    categoryIdentifier = v29->_categoryIdentifier;
    v29->_categoryIdentifier = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    expirationDate = v29->_expirationDate;
    v29->_expirationDate = (NSString *)v48;

    v50 = objc_msgSend(v27, "copy");
    criteria = v29->_criteria;
    v29->_criteria = (NSString *)v50;

    v52 = objc_msgSend(v28, "copy");
    isInvalid = v29->_isInvalid;
    v29->_isInvalid = (NSString *)v52;

  }
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  HKNotificationInstructionDiagnosticDescription *v4;
  HKNotificationInstructionDiagnosticDescription *v5;
  NSString *action;
  NSString *v7;
  NSString *categoryIdentifier;
  NSString *v9;
  NSString *clientIdentifier;
  NSString *v11;
  NSString *creationDate;
  NSString *v13;
  NSString *criteria;
  NSString *v15;
  NSString *expirationDate;
  NSString *v17;
  NSString *isInvalid;
  NSString *v19;
  NSString *messageIdentifier;
  NSString *v21;
  NSString *modificationDate;
  NSString *v23;
  NSString *receivedDate;
  NSString *v25;
  NSString *sendingDeviceInfo;
  NSString *v27;
  NSString *sendingDeviceName;
  NSString *v29;
  char v30;

  v4 = (HKNotificationInstructionDiagnosticDescription *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      action = self->_action;
      v7 = v5->_action;
      if (action != v7 && (!v7 || !-[NSString isEqualToString:](action, "isEqualToString:")))
        goto LABEL_41;
      categoryIdentifier = self->_categoryIdentifier;
      v9 = v5->_categoryIdentifier;
      if (categoryIdentifier != v9 && (!v9 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:")))
        goto LABEL_41;
      clientIdentifier = self->_clientIdentifier;
      v11 = v5->_clientIdentifier;
      if (clientIdentifier != v11 && (!v11 || !-[NSString isEqualToString:](clientIdentifier, "isEqualToString:")))
        goto LABEL_41;
      creationDate = self->_creationDate;
      v13 = v5->_creationDate;
      if (creationDate != v13 && (!v13 || !-[NSString isEqualToString:](creationDate, "isEqualToString:")))
        goto LABEL_41;
      criteria = self->_criteria;
      v15 = v5->_criteria;
      if (criteria != v15 && (!v15 || !-[NSString isEqualToString:](criteria, "isEqualToString:")))
        goto LABEL_41;
      expirationDate = self->_expirationDate;
      v17 = v5->_expirationDate;
      if (expirationDate != v17 && (!v17 || !-[NSString isEqualToString:](expirationDate, "isEqualToString:")))
        goto LABEL_41;
      isInvalid = self->_isInvalid;
      v19 = v5->_isInvalid;
      if (isInvalid != v19 && (!v19 || !-[NSString isEqualToString:](isInvalid, "isEqualToString:")))
        goto LABEL_41;
      messageIdentifier = self->_messageIdentifier;
      v21 = v5->_messageIdentifier;
      if (messageIdentifier != v21 && (!v21 || !-[NSString isEqualToString:](messageIdentifier, "isEqualToString:")))
        goto LABEL_41;
      modificationDate = self->_modificationDate;
      v23 = v5->_modificationDate;
      if (modificationDate != v23 && (!v23 || !-[NSString isEqualToString:](modificationDate, "isEqualToString:")))
        goto LABEL_41;
      receivedDate = self->_receivedDate;
      v25 = v5->_receivedDate;
      if (receivedDate != v25 && (!v25 || !-[NSString isEqualToString:](receivedDate, "isEqualToString:")))
        goto LABEL_41;
      sendingDeviceInfo = self->_sendingDeviceInfo;
      v27 = v5->_sendingDeviceInfo;
      if (sendingDeviceInfo != v27 && (!v27 || !-[NSString isEqualToString:](sendingDeviceInfo, "isEqualToString:")))
        goto LABEL_41;
      sendingDeviceName = self->_sendingDeviceName;
      v29 = v5->_sendingDeviceName;
      if (sendingDeviceName == v29)
      {
        v30 = 1;
        goto LABEL_42;
      }
      if (v29)
        v30 = -[NSString isEqualToString:](sendingDeviceName, "isEqualToString:");
      else
LABEL_41:
        v30 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v30 = 0;
  }
LABEL_43:

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSString hash](self->_action, "hash");
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_clientIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_creationDate, "hash");
  v7 = -[NSString hash](self->_criteria, "hash");
  v8 = v7 ^ -[NSString hash](self->_expirationDate, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_isInvalid, "hash");
  v10 = -[NSString hash](self->_messageIdentifier, "hash");
  v11 = v10 ^ -[NSString hash](self->_modificationDate, "hash");
  v12 = v11 ^ -[NSString hash](self->_receivedDate, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_sendingDeviceInfo, "hash");
  return v13 ^ -[NSString hash](self->_sendingDeviceName, "hash");
}

+ (NSArray)propertyNames
{
  return (NSArray *)&unk_1E389DEA0;
}

- (NSArray)propertyValues
{
  __int128 v2;
  NSString *isInvalid;
  __int128 v5;
  NSString *receivedDate;
  __int128 v7;
  NSString *sendingDeviceInfo;
  __int128 v9;
  __int128 v10;
  NSString *criteria;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&self->_messageIdentifier;
  receivedDate = self->_receivedDate;
  v7 = *(_OWORD *)&self->_modificationDate;
  sendingDeviceInfo = self->_sendingDeviceInfo;
  v2 = *(_OWORD *)&self->_categoryIdentifier;
  v9 = *(_OWORD *)&self->_action;
  v10 = v2;
  isInvalid = self->_isInvalid;
  criteria = self->_criteria;
  v12 = isInvalid;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 12);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationInstructionDiagnosticDescription)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  HKNotificationInstructionDiagnosticDescription *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receivedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendingDeviceName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendingDeviceInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteria"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInvalid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKNotificationInstructionDiagnosticDescription initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:](self, "initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:", v18, v4, v5, v6, v17, v16, v7, v13, v8, v9, v10, v11);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageIdentifier;
  id v5;

  messageIdentifier = self->_messageIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageIdentifier, CFSTR("messageIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedDate, CFSTR("receivedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sendingDeviceName, CFSTR("sendingDeviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sendingDeviceInfo, CFSTR("sendingDeviceInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryIdentifier, CFSTR("categoryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteria, CFSTR("criteria"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isInvalid, CFSTR("isInvalid"));

}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSString)creationDate
{
  return self->_creationDate;
}

- (NSString)receivedDate
{
  return self->_receivedDate;
}

- (NSString)modificationDate
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

- (NSString)action
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

- (NSString)expirationDate
{
  return self->_expirationDate;
}

- (NSString)criteria
{
  return self->_criteria;
}

- (NSString)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInvalid, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_sendingDeviceName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end

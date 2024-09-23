@implementation CTXPCContextInfo

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountID, CFSTR("account_id"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_slotID, CFSTR("slot_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelID, CFSTR("label_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phone_number"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCContextInfo uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uuid=%@"), v4);

  -[CTXPCContextInfo accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", accountID=\"%@\"), v5);

  v6 = -[CTXPCContextInfo slotID](self, "slotID");
  v7 = "CTSubscriptionSlotUnknown";
  if (v6 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (v6 == 1)
    v7 = "CTSubscriptionSlotOne";
  objc_msgSend(v3, "appendFormat:", CFSTR(", slotID=%s"), v7);
  -[CTXPCContextInfo labelID](self, "labelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", labelID=\"%@\"), v8);

  -[CTXPCContextInfo label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label=\"%@\"), v9);

  -[CTXPCContextInfo phoneNumber](self, "phoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber=\"%@\"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)labelID
{
  return self->_labelID;
}

- (NSString)accountID
{
  return self->_accountID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)context
{
  return -[CTXPCServiceSubscriptionContext initWithUUID:andSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithUUID:andSlot:", self->_uuid, self->_slotID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CTXPCContextInfo)initWithCoder:(id)a3
{
  id v4;
  CTXPCContextInfo *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSString *accountID;
  uint64_t v10;
  NSString *labelID;
  uint64_t v12;
  NSString *label;
  uint64_t v14;
  NSString *phoneNumber;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTXPCContextInfo;
  v5 = -[CTXPCContextInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account_id"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    v5->_slotID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slot_id"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label_id"));
    v10 = objc_claimAutoreleasedReturnValue();
    labelID = v5->_labelID;
    v5->_labelID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v12 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phone_number"));
    v14 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v14;

  }
  return v5;
}

- (CTXPCContextInfo)initWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5
{
  id v9;
  id v10;
  CTXPCContextInfo *v11;
  CTXPCContextInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTXPCContextInfo;
  v11 = -[CTXPCContextInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_storeStrong((id *)&v12->_accountID, a4);
    v12->_slotID = a5;
  }

  return v12;
}

+ (id)contextWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5
{
  id v7;
  id v8;
  CTXPCContextInfo *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CTXPCContextInfo initWithUUID:andAccountID:andSlot:]([CTXPCContextInfo alloc], "initWithUUID:andAccountID:andSlot:", v8, v7, a5);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTXPCContextInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;

  v6 = (CTXPCContextInfo *)a3;
  if (v6 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTXPCContextInfo uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTXPCContextInfo uuid](v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v8))
      {
        v13 = 0;
LABEL_54:

        goto LABEL_55;
      }
      -[CTXPCContextInfo accountID](self, "accountID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTXPCContextInfo accountID](v6, "accountID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v10)
        || (v11 = -[CTXPCContextInfo slotID](self, "slotID"), v11 != -[CTXPCContextInfo slotID](v6, "slotID")))
      {
        v13 = 0;
LABEL_53:

        goto LABEL_54;
      }
      -[CTXPCContextInfo labelID](self, "labelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        && (-[CTXPCContextInfo labelID](self, "labelID"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTXPCContextInfo labelID](v6, "labelID"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v3, "isEqual:", v4) & 1) != 0))
      {
        v36 = 0;
      }
      else
      {
        -[CTXPCContextInfo labelID](self, "labelID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        -[CTXPCContextInfo labelID](v6, "labelID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

          v13 = 0;
LABEL_50:
          if (v12)
          {

          }
          goto LABEL_53;
        }
        v36 = 1;
      }
      -[CTXPCContextInfo label](self, "label");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
      {
        v33 = v12;
        v18 = (void *)v16;
        v19 = v4;
        -[CTXPCContextInfo label](self, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTXPCContextInfo label](v6, "label");
        v34 = v20;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqual:") & 1) != 0)
        {
          v32 = v3;
          v31 = 0;
          v4 = v19;
          v17 = v18;
          v12 = v33;
          goto LABEL_28;
        }
        v4 = v19;
        v17 = v18;
        v12 = v33;
      }
      -[CTXPCContextInfo label](self, "label");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v13 = 0;
        goto LABEL_41;
      }
      -[CTXPCContextInfo label](v6, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

        v13 = 0;
        goto LABEL_45;
      }
      v32 = v3;
      v31 = 1;
LABEL_28:
      -[CTXPCContextInfo phoneNumber](self, "phoneNumber");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
      {
        v29 = (void *)v23;
        -[CTXPCContextInfo phoneNumber](self, "phoneNumber");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTXPCContextInfo phoneNumber](v6, "phoneNumber");
        v33 = v25;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqual:") & 1) != 0)
        {
          v13 = 1;
          v24 = v29;
LABEL_35:

          if ((v31 & 1) != 0)
          {
            v21 = 0;
            v3 = v32;
            goto LABEL_41;
          }
          v3 = v32;
          goto LABEL_45;
        }
        v24 = v29;
      }
      -[CTXPCContextInfo phoneNumber](self, "phoneNumber");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {

        v13 = 0;
        if (v24)
          goto LABEL_35;
      }
      else
      {
        -[CTXPCContextInfo phoneNumber](v6, "phoneNumber");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v27 == 0;

        if (v24)
          goto LABEL_35;
      }
      v3 = v32;
      if (v31)
      {
        v21 = 0;
LABEL_41:

        if (v17)
        {

        }
        if (!v36)
          goto LABEL_50;
        goto LABEL_48;
      }
LABEL_45:
      if (v17)
      {

      }
      if ((v36 & 1) == 0)
        goto LABEL_50;
LABEL_48:
      v14 = 0;
      goto LABEL_49;
    }
    v13 = 0;
  }
LABEL_55:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTXPCContextInfo uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCContextInfo accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUID:andAccountID:andSlot:", v5, v6, -[CTXPCContextInfo slotID](self, "slotID"));

  return v7;
}

- (void)setLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_labelID, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

@end

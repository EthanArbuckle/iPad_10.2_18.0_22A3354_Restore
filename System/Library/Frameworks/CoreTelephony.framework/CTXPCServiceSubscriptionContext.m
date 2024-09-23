@implementation CTXPCServiceSubscriptionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultVoice, 0);
  objc_storeStrong((id *)&self->_userDataPreferred, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t slotID;
  id v5;

  slotID = self->_slotID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", slotID, CFSTR("slot_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelID, CFSTR("label_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phone_number"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userDataPreferred, CFSTR("user_data_preferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userDefaultVoice, CFSTR("user_default_voice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSimPresent, CFSTR("isSimPresent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSimGood, CFSTR("isSimGood"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSimHidden, CFSTR("isSimHidden"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSimDataOnly, CFSTR("isSimDataOnly"));

}

- (id)redactedDescription
{
  void *v3;
  int64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const char *v9;
  _BOOL4 v10;
  const char *v11;
  _BOOL4 v12;
  const char *v13;
  _BOOL4 v14;
  const char *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTXPCServiceSubscriptionContext slotID](self, "slotID");
  v5 = "CTSubscriptionSlotUnknown";
  if (v4 == 2)
    v5 = "CTSubscriptionSlotTwo";
  if (v4 == 1)
    v5 = "CTSubscriptionSlotOne";
  objc_msgSend(v3, "appendFormat:", CFSTR(" slotID=%s"), v5);
  -[CTXPCServiceSubscriptionContext userDataPreferred](self, "userDataPreferred");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", [userDataPreferred=%@"), v6);

  -[CTXPCServiceSubscriptionContext userDefaultVoice](self, "userDefaultVoice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", userDefaultVoice=%@"), v7);

  v8 = -[CTXPCServiceSubscriptionContext isSimPresent](self, "isSimPresent");
  v9 = "absent";
  if (v8)
    v9 = "present";
  objc_msgSend(v3, "appendFormat:", CFSTR(", SIM:(%s"), v9);
  v10 = -[CTXPCServiceSubscriptionContext isSimGood](self, "isSimGood");
  v11 = "bad";
  if (v10)
    v11 = "good";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s"), v11);
  v12 = -[CTXPCServiceSubscriptionContext isSimHidden](self, "isSimHidden");
  v13 = "exposed";
  if (v12)
    v13 = "hidden";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s"), v13);
  v14 = -[CTXPCServiceSubscriptionContext isSimDataOnly](self, "isSimDataOnly");
  v15 = "voice+data";
  if (v14)
    v15 = "dataonly";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s)]"), v15);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const char *v13;
  _BOOL4 v14;
  const char *v15;
  _BOOL4 v16;
  const char *v17;
  _BOOL4 v18;
  const char *v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTXPCServiceSubscriptionContext slotID](self, "slotID");
  v5 = "CTSubscriptionSlotUnknown";
  if (v4 == 2)
    v5 = "CTSubscriptionSlotTwo";
  if (v4 == 1)
    v5 = "CTSubscriptionSlotOne";
  objc_msgSend(v3, "appendFormat:", CFSTR(" slotID=%s"), v5);
  -[CTXPCServiceSubscriptionContext uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uuid=%@"), v6);

  -[CTXPCServiceSubscriptionContext labelID](self, "labelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", labelID=\"%@\"), v7);

  -[CTXPCServiceSubscriptionContext label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label=\"%@\"), v8);

  -[CTXPCServiceSubscriptionContext phoneNumber](self, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber=\"%@\"), v9);

  -[CTXPCServiceSubscriptionContext userDataPreferred](self, "userDataPreferred");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", [userDataPreferred=%@"), v10);

  -[CTXPCServiceSubscriptionContext userDefaultVoice](self, "userDefaultVoice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", userDefaultVoice=%@"), v11);

  v12 = -[CTXPCServiceSubscriptionContext isSimPresent](self, "isSimPresent");
  v13 = "absent";
  if (v12)
    v13 = "present";
  objc_msgSend(v3, "appendFormat:", CFSTR(", SIM:(%s"), v13);
  v14 = -[CTXPCServiceSubscriptionContext isSimGood](self, "isSimGood");
  v15 = "bad";
  if (v14)
    v15 = "good";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s"), v15);
  v16 = -[CTXPCServiceSubscriptionContext isSimHidden](self, "isSimHidden");
  v17 = "exposed";
  if (v16)
    v17 = "hidden";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s"), v17);
  v18 = -[CTXPCServiceSubscriptionContext isSimDataOnly](self, "isSimDataOnly");
  v19 = "voice+data";
  if (v18)
    v19 = "dataonly";
  objc_msgSend(v3, "appendFormat:", CFSTR(", %s)]"), v19);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)userDataPreferred
{
  return self->_userDataPreferred;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isSimPresent
{
  return self->_isSimPresent;
}

- (BOOL)isSimHidden
{
  return self->_isSimHidden;
}

- (NSNumber)userDefaultVoice
{
  return self->_userDefaultVoice;
}

- (BOOL)isSimGood
{
  return self->_isSimGood;
}

- (BOOL)isSimDataOnly
{
  return self->_isSimDataOnly;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)labelID
{
  return self->_labelID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTXPCServiceSubscriptionContext)initWithCoder:(id)a3
{
  id v4;
  CTXPCServiceSubscriptionContext *v5;
  uint64_t v6;
  NSString *labelID;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *phoneNumber;
  uint64_t v12;
  NSNumber *userDataPreferred;
  uint64_t v14;
  NSNumber *userDefaultVoice;
  uint64_t v16;
  NSUUID *uuid;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTXPCServiceSubscriptionContext;
  v5 = -[CTXPCServiceSubscriptionContext init](&v19, sel_init);
  if (v5)
  {
    v5->_slotID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slot_id"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label_id"));
    v6 = objc_claimAutoreleasedReturnValue();
    labelID = v5->_labelID;
    v5->_labelID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phone_number"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user_data_preferred"));
    v12 = objc_claimAutoreleasedReturnValue();
    userDataPreferred = v5->_userDataPreferred;
    v5->_userDataPreferred = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user_default_voice"));
    v14 = objc_claimAutoreleasedReturnValue();
    userDefaultVoice = v5->_userDefaultVoice;
    v5->_userDefaultVoice = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v16;

    v5->_isSimPresent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSimPresent"));
    v5->_isSimGood = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSimGood"));
    v5->_isSimHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSimHidden"));
    v5->_isSimDataOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSimDataOnly"));
  }

  return v5;
}

+ (CTXPCServiceSubscriptionContext)contextWithSlot:(int64_t)a3
{
  return -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", a3);
}

+ (CTXPCServiceSubscriptionContext)contextWithServiceDescriptor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "domain") == 1)
  {
    v4 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v3, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSlot:", objc_msgSend(v5, "integerValue"));

  }
  else
  {
    v6 = 0;
  }

  return (CTXPCServiceSubscriptionContext *)v6;
}

- (CTXPCServiceSubscriptionContext)initWithSlot:(int64_t)a3
{
  void *v5;
  CTXPCServiceSubscriptionContext *v6;

  CTSubscriptionSlotAsUUID(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CTXPCServiceSubscriptionContext initWithUUID:andSlot:](self, "initWithUUID:andSlot:", v5, a3);

  return v6;
}

- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3 andSlot:(int64_t)a4
{
  id v7;
  CTXPCServiceSubscriptionContext *v8;
  CTXPCServiceSubscriptionContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTXPCServiceSubscriptionContext;
  v8 = -[CTXPCServiceSubscriptionContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_slotID = a4;
    *(_DWORD *)&v9->_isSimPresent = 256;
  }

  return v9;
}

- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3
{
  return -[CTXPCServiceSubscriptionContext initWithUUID:andSlot:](self, "initWithUUID:andSlot:", a3, 0);
}

+ (CTXPCServiceSubscriptionContext)contextWithUUID:(id)a3
{
  id v3;
  CTXPCServiceSubscriptionContext *v4;

  v3 = a3;
  v4 = -[CTXPCServiceSubscriptionContext initWithUUID:]([CTXPCServiceSubscriptionContext alloc], "initWithUUID:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTXPCServiceSubscriptionContext *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  _BOOL4 v31;
  char v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  char v46;
  void *v47;
  void *v48;

  v7 = (CTXPCServiceSubscriptionContext *)a3;
  if (v7 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[CTXPCServiceSubscriptionContext slotID](self, "slotID");
      if (v8 == -[CTXPCServiceSubscriptionContext slotID](v7, "slotID"))
      {
        -[CTXPCServiceSubscriptionContext uuid](self, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTXPCServiceSubscriptionContext uuid](v7, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          LOBYTE(v13) = 0;
LABEL_91:

          goto LABEL_92;
        }
        -[CTXPCServiceSubscriptionContext labelID](self, "labelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          && (-[CTXPCServiceSubscriptionContext labelID](self, "labelID"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[CTXPCServiceSubscriptionContext labelID](v7, "labelID"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v3, "isEqual:", v4) & 1) != 0))
        {
          v12 = 0;
        }
        else
        {
          -[CTXPCServiceSubscriptionContext labelID](self, "labelID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            LOBYTE(v13) = 0;
LABEL_87:

            goto LABEL_88;
          }
          -[CTXPCServiceSubscriptionContext labelID](v7, "labelID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {

LABEL_48:
            LOBYTE(v13) = 0;
            goto LABEL_88;
          }
          v12 = 1;
        }
        -[CTXPCServiceSubscriptionContext label](self, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          && (-[CTXPCServiceSubscriptionContext label](self, "label"),
              v5 = (void *)objc_claimAutoreleasedReturnValue(),
              -[CTXPCServiceSubscriptionContext label](v7, "label"),
              v48 = v5,
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v5, "isEqual:", v47) & 1) != 0))
        {
          v45 = v12;
          v46 = 0;
        }
        else
        {
          -[CTXPCServiceSubscriptionContext label](self, "label");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            LOBYTE(v13) = 0;
            goto LABEL_83;
          }
          -[CTXPCServiceSubscriptionContext label](v7, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

            if (!v16)
              goto LABEL_48;
            goto LABEL_46;
          }
          v45 = v12;
          v46 = 1;
        }
        -[CTXPCServiceSubscriptionContext phoneNumber](self, "phoneNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && (-[CTXPCServiceSubscriptionContext phoneNumber](self, "phoneNumber"),
              v5 = (void *)objc_claimAutoreleasedReturnValue(),
              -[CTXPCServiceSubscriptionContext phoneNumber](v7, "phoneNumber"),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              v44 = v5,
              (objc_msgSend(v5, "isEqual:", v43) & 1) != 0))
        {
          v41 = 0;
        }
        else
        {
          -[CTXPCServiceSubscriptionContext phoneNumber](self, "phoneNumber");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            LOBYTE(v13) = 0;
            goto LABEL_78;
          }
          -[CTXPCServiceSubscriptionContext phoneNumber](v7, "phoneNumber");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {

            if (!v19)
            {
LABEL_45:
              if (!v16)
              {
LABEL_47:

                goto LABEL_48;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
          v41 = 1;
        }
        -[CTXPCServiceSubscriptionContext userDataPreferred](self, "userDataPreferred");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          -[CTXPCServiceSubscriptionContext userDataPreferred](self, "userDataPreferred");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTXPCServiceSubscriptionContext userDataPreferred](v7, "userDataPreferred");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v5;
          if ((objc_msgSend(v5, "isEqual:", v39) & 1) != 0)
          {
            v37 = 0;
LABEL_50:
            -[CTXPCServiceSubscriptionContext userDefaultVoice](self, "userDefaultVoice");
            v38 = objc_claimAutoreleasedReturnValue();
            if (v38
              && (-[CTXPCServiceSubscriptionContext userDefaultVoice](self, "userDefaultVoice"),
                  v5 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[CTXPCServiceSubscriptionContext userDefaultVoice](v7, "userDefaultVoice"),
                  v36 = (void *)objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v5, "isEqual:") & 1) != 0))
            {
              v32 = 0;
            }
            else
            {
              -[CTXPCServiceSubscriptionContext userDefaultVoice](self, "userDefaultVoice");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
LABEL_63:

                v26 = (void *)v38;
                if (v38)
                {

                  v26 = (void *)v38;
                }
                LOBYTE(v13) = 0;
LABEL_66:

                if (!v37)
                  goto LABEL_74;
LABEL_72:
                v22 = 0;
                goto LABEL_73;
              }
              -[CTXPCServiceSubscriptionContext userDefaultVoice](v7, "userDefaultVoice");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                LOBYTE(v13) = 0;
                goto LABEL_56;
              }
              v32 = 1;
            }
            v33 = -[CTXPCServiceSubscriptionContext isSimPresent](self, "isSimPresent");
            if (v33 != -[CTXPCServiceSubscriptionContext isSimPresent](v7, "isSimPresent")
              || (v34 = -[CTXPCServiceSubscriptionContext isSimGood](self, "isSimGood"),
                  v34 != -[CTXPCServiceSubscriptionContext isSimGood](v7, "isSimGood"))
              || (v35 = -[CTXPCServiceSubscriptionContext isSimHidden](self, "isSimHidden"),
                  v35 != -[CTXPCServiceSubscriptionContext isSimHidden](v7, "isSimHidden")))
            {
              if ((v32 & 1) != 0)
              {
                v24 = 0;
                goto LABEL_63;
              }
              LOBYTE(v13) = 0;
LABEL_69:
              v27 = (void *)v38;
              v28 = v36;
              if (!v38)
                goto LABEL_71;
              goto LABEL_70;
            }
            v31 = -[CTXPCServiceSubscriptionContext isSimDataOnly](self, "isSimDataOnly");
            v13 = v31 ^ -[CTXPCServiceSubscriptionContext isSimDataOnly](v7, "isSimDataOnly") ^ 1;
            if ((v32 & 1) == 0)
            {
              v26 = (void *)v38;
              v28 = v36;
              if (!v38)
                goto LABEL_66;
LABEL_70:

              v27 = (void *)v38;
LABEL_71:

              if ((v37 & 1) == 0)
              {
LABEL_74:
                v29 = v42;
                if (v42)
                {

                  v29 = v42;
                }

                if ((v41 & 1) == 0)
                  goto LABEL_79;
                v20 = 0;
LABEL_78:

LABEL_79:
                if (v19)
                {

                }
                if ((v46 & 1) == 0)
                {
                  v12 = v45;
                  if (!v16)
                  {
LABEL_85:

                    if ((v12 & 1) != 0)
                    {
                      v14 = 0;
                      goto LABEL_87;
                    }
LABEL_88:
                    if (v11)
                    {

                    }
                    goto LABEL_91;
                  }
LABEL_84:

                  goto LABEL_85;
                }
                v17 = 0;
                v12 = v45;
LABEL_83:

                if (!v16)
                  goto LABEL_85;
                goto LABEL_84;
              }
              goto LABEL_72;
            }
            v25 = 0;
LABEL_56:

            goto LABEL_69;
          }
        }
        -[CTXPCServiceSubscriptionContext userDataPreferred](self, "userDataPreferred");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          LOBYTE(v13) = 0;
LABEL_73:

          goto LABEL_74;
        }
        -[CTXPCServiceSubscriptionContext userDataPreferred](v7, "userDataPreferred");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          v37 = 1;
          goto LABEL_50;
        }

        if (v42)
        {

        }
        if (!v19)
          goto LABEL_44;
        goto LABEL_43;
      }
    }
    LOBYTE(v13) = 0;
  }
LABEL_92:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTXPCServiceSubscriptionContext uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUID:andSlot:", v5, -[CTXPCServiceSubscriptionContext slotID](self, "slotID"));

  return v6;
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

- (void)setUserDataPreferred:(id)a3
{
  objc_storeStrong((id *)&self->_userDataPreferred, a3);
}

- (void)setUserDefaultVoice:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultVoice, a3);
}

- (void)setIsSimPresent:(BOOL)a3
{
  self->_isSimPresent = a3;
}

- (void)setIsSimGood:(BOOL)a3
{
  self->_isSimGood = a3;
}

- (void)setIsSimHidden:(BOOL)a3
{
  self->_isSimHidden = a3;
}

- (void)setIsSimDataOnly:(BOOL)a3
{
  self->_isSimDataOnly = a3;
}

@end

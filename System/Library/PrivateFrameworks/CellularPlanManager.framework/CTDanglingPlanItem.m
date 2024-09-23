@implementation CTDanglingPlanItem

- (CTDanglingPlanItem)initWithIccid:(id)a3 phoneNumber:(id)a4 label:(id)a5 labelID:(id)a6 isPrivateNetworkSim:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  CTDanglingPlanItem *v16;
  CTDanglingPlanItem *v17;
  objc_super v19;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CTDanglingPlanItem;
  v16 = -[CTDanglingPlanItem init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[CTDanglingPlanItem setIccid:](v16, "setIccid:", v12);
    -[CTDanglingPlanItem setPhoneNumber:](v17, "setPhoneNumber:", v13);
    -[CTDanglingPlanItem setSimLabelID:](v17, "setSimLabelID:", v15);
    -[CTDanglingPlanItem setUserLabel:](v17, "setUserLabel:", v14);
    -[CTDanglingPlanItem setIsPrivateNetworkSim:](v17, "setIsPrivateNetworkSim:", v7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDanglingPlanItem iccid](self, "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", iccid=%@"), v4);

  -[CTDanglingPlanItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber=%@"), v5);

  -[CTDanglingPlanItem simLabelID](self, "simLabelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", simLabelID=%@"), v6);

  -[CTDanglingPlanItem userLabel](self, "userLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", userLabel=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isPrivateNetworkSim=%d"), -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDanglingPlanItem iccid](self, "iccid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIccid:", v6);

  -[CTDanglingPlanItem phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPhoneNumber:", v8);

  -[CTDanglingPlanItem simLabelID](self, "simLabelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSimLabelID:", v10);

  -[CTDanglingPlanItem userLabel](self, "userLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setUserLabel:", v12);

  objc_msgSend(v4, "setIsPrivateNetworkSim:", -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTDanglingPlanItem iccid](self, "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("iccid"));

  -[CTDanglingPlanItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

  -[CTDanglingPlanItem simLabelID](self, "simLabelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("simLabelID"));

  -[CTDanglingPlanItem userLabel](self, "userLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("label"));

  objc_msgSend(v8, "encodeBool:forKey:", -[CTDanglingPlanItem isPrivateNetworkSim](self, "isPrivateNetworkSim"), CFSTR("isPrivateNetworkSim"));
}

- (CTDanglingPlanItem)initWithCoder:(id)a3
{
  id v4;
  CTDanglingPlanItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTDanglingPlanItem;
  v5 = -[CTDanglingPlanItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTDanglingPlanItem setIccid:](v5, "setIccid:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTDanglingPlanItem setPhoneNumber:](v5, "setPhoneNumber:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simLabelID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTDanglingPlanItem setSimLabelID:](v5, "setSimLabelID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTDanglingPlanItem setUserLabel:](v5, "setUserLabel:", v9);

    -[CTDanglingPlanItem setIsPrivateNetworkSim:](v5, "setIsPrivateNetworkSim:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrivateNetworkSim")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_storeStrong((id *)&self->_iccid, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)simLabelID
{
  return self->_simLabelID;
}

- (void)setSimLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_simLabelID, a3);
}

- (CTUserLabel)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userLabel, a3);
}

- (BOOL)isPrivateNetworkSim
{
  return self->_isPrivateNetworkSim;
}

- (void)setIsPrivateNetworkSim:(BOOL)a3
{
  self->_isPrivateNetworkSim = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_simLabelID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end

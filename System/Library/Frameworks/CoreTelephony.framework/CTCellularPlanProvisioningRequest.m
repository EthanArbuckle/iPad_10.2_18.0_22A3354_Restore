@implementation CTCellularPlanProvisioningRequest

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CTCellularPlanProvisioningRequest (%p) {\n\tAddress: [%@]\n\tMatchingId: [%@]\n\tOID:[%@]\n\tConfirmation Code:[%@]\n\tICCID [%@]\n\tEID [%@]}\n"), self, self->_address, self->_matchingID, self->_OID, self->_confirmationCode, self->_ICCID, self->_EID);
}

- (CTCellularPlanProvisioningRequest)init
{
  CTCellularPlanProvisioningRequest *v2;
  CTCellularPlanProvisioningRequest *v3;
  NSString *address;
  NSString *matchingID;
  NSString *OID;
  NSString *confirmationCode;
  NSString *ICCID;
  NSString *EID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTCellularPlanProvisioningRequest;
  v2 = -[CTCellularPlanProvisioningRequest init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    address = v2->_address;
    v2->_address = 0;

    matchingID = v3->_matchingID;
    v3->_matchingID = 0;

    OID = v3->_OID;
    v3->_OID = 0;

    confirmationCode = v3->_confirmationCode;
    v3->_confirmationCode = 0;

    ICCID = v3->_ICCID;
    v3->_ICCID = 0;

    EID = v3->_EID;
    v3->_EID = 0;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCellularPlanProvisioningRequest *v4;
  NSString *address;
  void *v6;
  NSString *matchingID;
  void *v8;
  NSString *OID;
  void *v10;
  NSString *confirmationCode;
  void *v12;
  NSString *ICCID;
  void *v14;
  NSString *EID;
  void *v16;
  char v17;

  v4 = (CTCellularPlanProvisioningRequest *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else if (-[CTCellularPlanProvisioningRequest isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    address = self->_address;
    -[CTCellularPlanProvisioningRequest address](v4, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsEqualString(address, v6))
    {
      matchingID = self->_matchingID;
      -[CTCellularPlanProvisioningRequest matchingID](v4, "matchingID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (IsEqualString(matchingID, v8))
      {
        OID = self->_OID;
        -[CTCellularPlanProvisioningRequest OID](v4, "OID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (IsEqualString(OID, v10))
        {
          confirmationCode = self->_confirmationCode;
          -[CTCellularPlanProvisioningRequest confirmationCode](v4, "confirmationCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (IsEqualString(confirmationCode, v12))
          {
            ICCID = self->_ICCID;
            -[CTCellularPlanProvisioningRequest ICCID](v4, "ICCID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (IsEqualString(ICCID, v14))
            {
              EID = self->_EID;
              -[CTCellularPlanProvisioningRequest EID](v4, "EID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = IsEqualString(EID, v16);

            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_address, "copyWithZone:", a3);
  objc_msgSend(v5, "setAddress:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_matchingID, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingID:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_OID, "copyWithZone:", a3);
  objc_msgSend(v5, "setOID:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_confirmationCode, "copyWithZone:", a3);
  objc_msgSend(v5, "setConfirmationCode:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_ICCID, "copyWithZone:", a3);
  objc_msgSend(v5, "setICCID:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_EID, "copyWithZone:", a3);
  objc_msgSend(v5, "setEID:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingID, CFSTR("matchingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_OID, CFSTR("OID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_confirmationCode, CFSTR("confirmationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ICCID, CFSTR("ICCID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_EID, CFSTR("EID"));

}

- (CTCellularPlanProvisioningRequest)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanProvisioningRequest *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *matchingID;
  uint64_t v10;
  NSString *OID;
  uint64_t v12;
  NSString *confirmationCode;
  uint64_t v14;
  NSString *ICCID;
  uint64_t v16;
  NSString *EID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanProvisioningRequest;
  v5 = -[CTCellularPlanProvisioningRequest init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingID"));
    v8 = objc_claimAutoreleasedReturnValue();
    matchingID = v5->_matchingID;
    v5->_matchingID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OID"));
    v10 = objc_claimAutoreleasedReturnValue();
    OID = v5->_OID;
    v5->_OID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    confirmationCode = v5->_confirmationCode;
    v5->_confirmationCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCID"));
    v14 = objc_claimAutoreleasedReturnValue();
    ICCID = v5->_ICCID;
    v5->_ICCID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EID"));
    v16 = objc_claimAutoreleasedReturnValue();
    EID = v5->_EID;
    v5->_EID = (NSString *)v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(NSString *)address
{
  objc_storeStrong((id *)&self->_address, address);
}

- (NSString)matchingID
{
  return self->_matchingID;
}

- (void)setMatchingID:(NSString *)matchingID
{
  objc_storeStrong((id *)&self->_matchingID, matchingID);
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(NSString *)OID
{
  objc_storeStrong((id *)&self->_OID, OID);
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (void)setConfirmationCode:(NSString *)confirmationCode
{
  objc_storeStrong((id *)&self->_confirmationCode, confirmationCode);
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (void)setICCID:(NSString *)ICCID
{
  objc_storeStrong((id *)&self->_ICCID, ICCID);
}

- (NSString)EID
{
  return self->_EID;
}

- (void)setEID:(NSString *)EID
{
  objc_storeStrong((id *)&self->_EID, EID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EID, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_matchingID, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end

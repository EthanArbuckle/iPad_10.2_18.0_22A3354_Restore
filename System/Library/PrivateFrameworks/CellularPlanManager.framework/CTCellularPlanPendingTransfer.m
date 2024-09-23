@implementation CTCellularPlanPendingTransfer

- (CTCellularPlanPendingTransfer)init
{
  CTCellularPlanPendingTransfer *v2;
  CTCellularPlanPendingTransfer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTCellularPlanPendingTransfer;
  v2 = -[CTCellularPlanPendingTransfer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CTCellularPlanPendingTransfer setSourceIccid:](v2, "setSourceIccid:", 0);
    -[CTCellularPlanPendingTransfer setCarrierName:](v3, "setCarrierName:", 0);
    -[CTCellularPlanPendingTransfer setDeviceName:](v3, "setDeviceName:", 0);
    -[CTCellularPlanPendingTransfer setPlanLabel:](v3, "setPlanLabel:", 0);
    -[CTCellularPlanPendingTransfer setPhoneNumber:](v3, "setPhoneNumber:", 0);
    -[CTCellularPlanPendingTransfer setCountryCode:](v3, "setCountryCode:", 0);
    -[CTCellularPlanPendingTransfer setStatus:](v3, "setStatus:", 0);
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanPendingTransfer sourceIccid](self, "sourceIccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", sourceIccid=%@"), v4);

  -[CTCellularPlanPendingTransfer carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", carrierName=%@"), v5);

  -[CTCellularPlanPendingTransfer deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", deviceName=%@"), v6);

  -[CTCellularPlanPendingTransfer planLabel](self, "planLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planLabel=%@"), v7);

  -[CTCellularPlanPendingTransfer phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", phoneNumber=%@"), v8);

  -[CTCellularPlanPendingTransfer countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", countryCode=%@"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", status=%s"), CTCellularPlanPendingTransferStatusAsString(-[CTCellularPlanPendingTransfer status](self, "status")));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CTCellularPlanPendingTransfer sourceIccid](self, "sourceIccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("iccid"));

  -[CTCellularPlanPendingTransfer carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("carrierName"));

  -[CTCellularPlanPendingTransfer deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("deviceName"));

  -[CTCellularPlanPendingTransfer planLabel](self, "planLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("label"));

  -[CTCellularPlanPendingTransfer phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("phoneNumber"));

  -[CTCellularPlanPendingTransfer countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("countryCode"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[CTCellularPlanPendingTransfer status](self, "status"), CFSTR("status"));
}

- (CTCellularPlanPendingTransfer)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanPendingTransfer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanPendingTransfer;
  v5 = -[CTCellularPlanPendingTransfer init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setSourceIccid:](v5, "setSourceIccid:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setCarrierName:](v5, "setCarrierName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setDeviceName:](v5, "setDeviceName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setPlanLabel:](v5, "setPlanLabel:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setPhoneNumber:](v5, "setPhoneNumber:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer setCountryCode:](v5, "setCountryCode:", v11);

    -[CTCellularPlanPendingTransfer setStatus:](v5, "setStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status")));
  }

  return v5;
}

- (NSString)sourceIccid
{
  return self->_sourceIccid;
}

- (void)setSourceIccid:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIccid, a3);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (CTUserLabel)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
  objc_storeStrong((id *)&self->_planLabel, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
}

@end

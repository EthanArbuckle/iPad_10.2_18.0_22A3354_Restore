@implementation CTSatelliteMessagingProvisioningReceipt

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSatelliteMessagingProvisioningReceipt cfg_id](self, "cfg_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cfg_id=%@"), v4);

  -[CTSatelliteMessagingProvisioningReceipt result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", result=%@"), v5);

  -[CTSatelliteMessagingProvisioningReceipt sps_environment](self, "sps_environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", env=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTSatelliteMessagingProvisioningReceipt)initWithID:(id)a3 result:(id)a4 sps:(id)a5
{
  id v8;
  id v9;
  id v10;
  CTSatelliteMessagingProvisioningReceipt *v11;
  CTSatelliteMessagingProvisioningReceipt *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CTSatelliteMessagingProvisioningReceipt;
  v11 = -[CTSatelliteMessagingProvisioningReceipt init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CTSatelliteMessagingProvisioningReceipt setCfg_id:](v11, "setCfg_id:", v8);
    -[CTSatelliteMessagingProvisioningReceipt setResult:](v12, "setResult:", v9);
    -[CTSatelliteMessagingProvisioningReceipt setSps_environment:](v12, "setSps_environment:", v10);
  }

  return v12;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSatelliteMessagingProvisioningReceipt cfg_id](self, "cfg_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCfg_id:", v6);

  -[CTSatelliteMessagingProvisioningReceipt result](self, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setResult:", v8);

  -[CTSatelliteMessagingProvisioningReceipt sps_environment](self, "sps_environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSps_environment:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTSatelliteMessagingProvisioningReceipt cfg_id](self, "cfg_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cfg_idx"));

  -[CTSatelliteMessagingProvisioningReceipt result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("result"));

  -[CTSatelliteMessagingProvisioningReceipt sps_environment](self, "sps_environment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sps_environment"));

}

- (CTSatelliteMessagingProvisioningReceipt)initWithCoder:(id)a3
{
  id v4;
  CTSatelliteMessagingProvisioningReceipt *v5;
  uint64_t v6;
  NSUUID *cfg_id;
  uint64_t v8;
  NSError *v9;
  uint64_t v10;
  NSString *sps_environment;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSatelliteMessagingProvisioningReceipt;
  v5 = -[CTSatelliteMessagingProvisioningReceipt init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cfg_idx"));
    v6 = objc_claimAutoreleasedReturnValue();
    cfg_id = v5->_cfg_id;
    v5->_cfg_id = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_result;
    v5->_result = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sps_environment"));
    v10 = objc_claimAutoreleasedReturnValue();
    sps_environment = v5->_sps_environment;
    v5->_sps_environment = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)cfg_id
{
  return self->_cfg_id;
}

- (void)setCfg_id:(id)a3
{
  objc_storeStrong((id *)&self->_cfg_id, a3);
}

- (NSError)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)sps_environment
{
  return self->_sps_environment;
}

- (void)setSps_environment:(id)a3
{
  objc_storeStrong((id *)&self->_sps_environment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sps_environment, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_cfg_id, 0);
}

@end

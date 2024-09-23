@implementation CTSatelliteMessagingProvisioning

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSatelliteMessagingProvisioning cfg_id](self, "cfg_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cfg_id=%@"), v4);

  -[CTSatelliteMessagingProvisioning cfg](self, "cfg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cfg=%@"), v5);

  -[CTSatelliteMessagingProvisioning sps_environment](self, "sps_environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", env=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTSatelliteMessagingProvisioning)initWithID:(id)a3 data:(id)a4 sps:(id)a5
{
  id v8;
  id v9;
  id v10;
  CTSatelliteMessagingProvisioning *v11;
  CTSatelliteMessagingProvisioning *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CTSatelliteMessagingProvisioning;
  v11 = -[CTSatelliteMessagingProvisioning init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CTSatelliteMessagingProvisioning setCfg_id:](v11, "setCfg_id:", v8);
    -[CTSatelliteMessagingProvisioning setCfg:](v12, "setCfg:", v9);
    -[CTSatelliteMessagingProvisioning setSps_environment:](v12, "setSps_environment:", v10);
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
  -[CTSatelliteMessagingProvisioning cfg_id](self, "cfg_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCfg_id:", v6);

  -[CTSatelliteMessagingProvisioning cfg](self, "cfg");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCfg:", v8);

  -[CTSatelliteMessagingProvisioning sps_environment](self, "sps_environment");
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
  -[CTSatelliteMessagingProvisioning cfg_id](self, "cfg_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cfg_idx"));

  -[CTSatelliteMessagingProvisioning cfg](self, "cfg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cfg"));

  -[CTSatelliteMessagingProvisioning sps_environment](self, "sps_environment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sps_environment"));

}

- (CTSatelliteMessagingProvisioning)initWithCoder:(id)a3
{
  id v4;
  CTSatelliteMessagingProvisioning *v5;
  uint64_t v6;
  NSUUID *cfg_id;
  uint64_t v8;
  NSData *cfg;
  uint64_t v10;
  NSString *sps_environment;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSatelliteMessagingProvisioning;
  v5 = -[CTSatelliteMessagingProvisioning init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cfg_idx"));
    v6 = objc_claimAutoreleasedReturnValue();
    cfg_id = v5->_cfg_id;
    v5->_cfg_id = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cfg"));
    v8 = objc_claimAutoreleasedReturnValue();
    cfg = v5->_cfg;
    v5->_cfg = (NSData *)v8;

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

- (NSData)cfg
{
  return self->_cfg;
}

- (void)setCfg:(id)a3
{
  objc_storeStrong((id *)&self->_cfg, a3);
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
  objc_storeStrong((id *)&self->_cfg, 0);
  objc_storeStrong((id *)&self->_cfg_id, 0);
}

@end

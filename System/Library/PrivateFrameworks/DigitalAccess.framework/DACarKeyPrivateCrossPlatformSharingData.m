@implementation DACarKeyPrivateCrossPlatformSharingData

- (DACarKeyPrivateCrossPlatformSharingData)initWithVehicleEnteredPasscode:(id)a3 pairedEntityIdentifier:(id)a4
{
  id v7;
  id v8;
  DACarKeyPrivateCrossPlatformSharingData *v9;
  DACarKeyPrivateCrossPlatformSharingData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DACarKeyPrivateCrossPlatformSharingData;
  v9 = -[DACarKeyPrivateCrossPlatformSharingData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicleEnteredPasscode, a3);
    objc_storeStrong((id *)&v10->_pairedEntityIdentifier, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACarKeyPrivateCrossPlatformSharingData *v5;
  uint64_t v6;
  NSString *vehicleEnteredPasscode;
  uint64_t v8;
  NSString *pairedEntityIdentifier;

  v5 = -[DACarKeyPrivateCrossPlatformSharingData init](+[DACarKeyPrivateCrossPlatformSharingData allocWithZone:](DACarKeyPrivateCrossPlatformSharingData, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_vehicleEnteredPasscode, "copyWithZone:", a3);
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v6;

    v8 = -[NSString copyWithZone:](self->_pairedEntityIdentifier, "copyWithZone:", a3);
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DACarKeyPrivateCrossPlatformSharingData vehicleEnteredPasscode](self, "vehicleEnteredPasscode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("vehicleEnteredPasscode"));

  -[DACarKeyPrivateCrossPlatformSharingData pairedEntityIdentifier](self, "pairedEntityIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pairedEntityIdentifier"));

}

- (DACarKeyPrivateCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4;
  DACarKeyPrivateCrossPlatformSharingData *v5;
  uint64_t v6;
  NSString *vehicleEnteredPasscode;
  uint64_t v8;
  NSString *pairedEntityIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DACarKeyPrivateCrossPlatformSharingData;
  v5 = -[DACarKeyPrivateCrossPlatformSharingData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleEnteredPasscode"));
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedEntityIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VEP length                : %d\n"), -[NSString length](self->_vehicleEnteredPasscode, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Paired Entity Identifier  : %@\n"), self->_pairedEntityIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (NSString)vehicleEnteredPasscode
{
  return self->_vehicleEnteredPasscode;
}

- (NSString)pairedEntityIdentifier
{
  return self->_pairedEntityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
}

@end

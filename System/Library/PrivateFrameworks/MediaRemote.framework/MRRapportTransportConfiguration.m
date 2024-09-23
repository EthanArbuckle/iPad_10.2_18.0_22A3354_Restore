@implementation MRRapportTransportConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceUID;
  id v5;

  deviceUID = self->_deviceUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceUID, CFSTR("device"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionUID, CFSTR("session"));

}

- (MRRapportTransportConfiguration)initWithCoder:(id)a3
{
  id v4;
  MRRapportTransportConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MRRapportTransportConfiguration);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[MRRapportTransportConfiguration setDeviceUID:](v5, "setDeviceUID:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  -[MRRapportTransportConfiguration setSessionUID:](v5, "setSessionUID:", v9);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("device=%@(%@), session=%@"), self->_deviceUID, self->_name, self->_sessionUID);
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
}

@end

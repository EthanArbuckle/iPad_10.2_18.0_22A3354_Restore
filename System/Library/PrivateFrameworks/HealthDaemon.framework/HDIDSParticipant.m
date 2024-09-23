@implementation HDIDSParticipant

- (HDIDSParticipant)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDIDSParticipant)initWithDevice:(id)a3
{
  id v5;
  HDIDSParticipant *v6;
  uint64_t v7;
  NSString *destinationIdentifier;
  uint64_t v9;
  NSString *deviceIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDIDSParticipant;
  v6 = -[HDIDSParticipant init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "hd_destinationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    destinationIdentifier = v6->_destinationIdentifier;
    v6->_destinationIdentifier = (NSString *)v7;

    objc_msgSend(v5, "hd_deviceIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v6;
}

- (HDIDSParticipant)initWithIdentifier:(id)a3
{
  id v4;
  HDIDSParticipant *v5;
  uint64_t v6;
  NSString *destinationIdentifier;
  uint64_t v8;
  NSString *deviceIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDIDSParticipant;
  v5 = -[HDIDSParticipant init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    destinationIdentifier = v5->_destinationIdentifier;
    v5->_destinationIdentifier = (NSString *)v6;

    v8 = objc_msgSend(v4, "copy");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  IDSDevice *device;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  device = self->_device;
  if (device)
  {
    -[IDSDevice hd_shortDescription](device, "hd_shortDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p destinationIdentifier=%@"), v7, self, self->_destinationIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (IDSDevice)device
{
  return self->_device;
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

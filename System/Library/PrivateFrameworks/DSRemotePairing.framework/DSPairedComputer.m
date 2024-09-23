@implementation DSPairedComputer

- (DSPairedComputer)initWithDeviceName:(id)a3
{
  -[DSPairedComputer setDeviceName:](self, "setDeviceName:", a3);
  return self;
}

- (unint64_t)hash
{
  NSString *remotePairingFrameworkIdentifier;

  remotePairingFrameworkIdentifier = self->_remotePairingFrameworkIdentifier;
  if (!remotePairingFrameworkIdentifier)
    remotePairingFrameworkIdentifier = self->_lockdownFrameworkIdentifier;
  return -[NSString hash](remotePairingFrameworkIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DSPairedComputer *v4;
  NSString *serialNumber;
  void *v6;
  NSString *remotePairingFrameworkIdentifier;
  void *v8;
  BOOL v9;
  NSString *lockdownFrameworkIdentifier;
  void *v12;

  v4 = (DSPairedComputer *)a3;
  if (v4 == self)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(lockdownFrameworkIdentifier) = 0;
    goto LABEL_8;
  }
  serialNumber = self->_serialNumber;
  -[DSPairedComputer serialNumber](v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serialNumber) = -[NSString isEqualToString:](serialNumber, "isEqualToString:", v6);

  if ((serialNumber & 1) != 0
    || (remotePairingFrameworkIdentifier = self->_remotePairingFrameworkIdentifier) != 0
    && (-[DSPairedComputer remotePairingFrameworkIdentifier](v4, "remotePairingFrameworkIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[NSString isEqualToString:](remotePairingFrameworkIdentifier, "isEqualToString:", v8),
        v8,
        v9))
  {
LABEL_6:
    LOBYTE(lockdownFrameworkIdentifier) = 1;
  }
  else
  {
    lockdownFrameworkIdentifier = self->_lockdownFrameworkIdentifier;
    if (lockdownFrameworkIdentifier)
    {
      -[DSPairedComputer lockdownFrameworkIdentifier](v4, "lockdownFrameworkIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(lockdownFrameworkIdentifier) = -[NSString isEqualToString:](lockdownFrameworkIdentifier, "isEqualToString:", v12);

    }
  }
LABEL_8:

  return (char)lockdownFrameworkIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)datePaired
{
  return self->_datePaired;
}

- (void)setDatePaired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)remotePairingFrameworkIdentifier
{
  return self->_remotePairingFrameworkIdentifier;
}

- (void)setRemotePairingFrameworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)lockdownFrameworkIdentifier
{
  return self->_lockdownFrameworkIdentifier;
}

- (void)setLockdownFrameworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)lockdownFrameworkKey
{
  return self->_lockdownFrameworkKey;
}

- (void)setLockdownFrameworkKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_lockdownFrameworkKey, 0);
  objc_storeStrong((id *)&self->_lockdownFrameworkIdentifier, 0);
  objc_storeStrong((id *)&self->_remotePairingFrameworkIdentifier, 0);
  objc_storeStrong((id *)&self->_datePaired, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end

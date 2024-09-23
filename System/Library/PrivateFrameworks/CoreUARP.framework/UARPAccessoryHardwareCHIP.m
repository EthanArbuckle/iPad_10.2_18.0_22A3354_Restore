@implementation UARPAccessoryHardwareCHIP

- (UARPAccessoryHardwareCHIP)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 hardwareID:(unsigned __int16)a5 metadata:(id)a6
{
  id v11;
  UARPAccessoryHardwareCHIP *v12;
  UARPAccessoryHardwareCHIP *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)UARPAccessoryHardwareCHIP;
  v12 = -[UARPAccessoryHardwareID initWithTransport:](&v15, sel_initWithTransport_, 6);
  v13 = v12;
  if (v12)
  {
    v12->_vendorID = a3;
    v12->_productID = a4;
    v12->_hwID = a5;
    objc_storeStrong((id *)&v12->_metadata, a6);
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("vendorID=%u, productID=%u, hwID=%u, metadata=%@"), self->_vendorID, self->_productID, self->_hwID, self->_metadata);
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)hwID
{
  return self->_hwID;
}

- (UARPAccessoryMetadata)metadata
{
  return (UARPAccessoryMetadata *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end

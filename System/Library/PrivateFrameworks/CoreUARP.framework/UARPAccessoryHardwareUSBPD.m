@implementation UARPAccessoryHardwareUSBPD

- (UARPAccessoryHardwareUSBPD)init
{
  -[UARPAccessoryHardwareUSBPD doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  UARPAccessoryHardwareUSBPD *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPAccessoryHardwareUSBPD;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v7, sel_initWithTransport_, 8);
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }
  return result;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6
{
  UARPAccessoryHardwareUSBPD *v8;
  UARPAccessoryHardwareUSBPD *v9;
  UARPAccessoryHardwareUSBPD *v10;

  v8 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:](self, "initWithVendorID:productID:", a3, a4);
  v9 = v8;
  if (v8)
  {
    v8->_location = a6;
    if (a6 > 2 || (v8->_usbpdClass = a5, (unint64_t)a5 > 2))
    {
      v10 = 0;
      goto LABEL_7;
    }
    *((_BYTE *)&v8->super.super.isa + *off_24CEA4148[a5]) = 1;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (UARPAccessoryHardwareUSBPD)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4 usbpdClass:(int64_t)a5 locationType:(int64_t)a6 supportsAccMode7:(BOOL)a7
{
  UARPAccessoryHardwareUSBPD *result;

  result = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:](self, "initWithVendorID:productID:usbpdClass:locationType:", a3, a4, a5, a6);
  if (result)
    result->_supportsAccMode7 = a7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *v5;
  int64_t v6;
  int vendorID;
  int productID;
  BOOL v9;

  v4 = (UARPAccessoryHardwareUSBPD *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v9 = 1;
    }
    else
    {
      v5 = v4;
      v6 = -[UARPAccessoryHardwareID transport](self, "transport");
      if (v6 == -[UARPAccessoryHardwareID transport](v5, "transport")
        && (vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareUSBPD vendorID](v5, "vendorID")))
      {
        productID = self->_productID;
        v9 = productID == -[UARPAccessoryHardwareUSBPD productID](v5, "productID");
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t vendorID;
  uint64_t productID;
  const char *v6;
  const char *v7;
  const char *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  vendorID = self->_vendorID;
  productID = self->_productID;
  v6 = UARPUSBPDDeviceClassToString(self->_usbpdClass);
  v7 = UARPAccessoryUSBPDLocationTypeToString(self->_location);
  if (self->_supportsAccMode7)
    v8 = "YES";
  else
    v8 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("USB-PD, VID/PID = 0x%04x/0x%04x, Class = %s, Location = %s, Supports AccMode7 = %s"), vendorID, productID, v6, v7, v8);
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (int64_t)location
{
  return self->_location;
}

- (BOOL)isMagSafeCable
{
  return self->_isMagSafeCable;
}

- (BOOL)isPowerAdapter
{
  return self->_isPowerAdapter;
}

- (BOOL)isUSBCLightning
{
  return self->_isUSBCLightning;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

@end

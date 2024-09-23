@implementation UARPAccessoryHardwareBluetooth

- (UARPAccessoryHardwareBluetooth)init
{
  -[UARPAccessoryHardwareBluetooth doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareBluetooth)initWithVendorIDSource:(int64_t)a3 vendorID:(unsigned __int16)a4 productID:(unsigned __int16)a5 productVersion:(unsigned __int16)a6
{
  UARPAccessoryHardwareBluetooth *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UARPAccessoryHardwareBluetooth;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v11, sel_initWithTransport_, 3);
  if (result)
  {
    result->_vendorIDSource = a3;
    result->_vendorID = a4;
    result->_productID = a5;
    result->_productVersion = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHardwareBluetooth *v4;
  UARPAccessoryHardwareBluetooth *v5;
  int64_t vendorIDSource;
  int64_t v7;
  int vendorID;
  int productID;
  int productVersion;
  BOOL v11;

  v4 = (UARPAccessoryHardwareBluetooth *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v11 = 1;
    }
    else
    {
      v5 = v4;
      vendorIDSource = self->_vendorIDSource;
      if (vendorIDSource == -[UARPAccessoryHardwareBluetooth vendorIDSource](v5, "vendorIDSource")
        && (v7 = -[UARPAccessoryHardwareID transport](self, "transport"),
            v7 == -[UARPAccessoryHardwareID transport](v5, "transport"))
        && (vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareBluetooth vendorID](v5, "vendorID"))
        && (productID = self->_productID, productID == -[UARPAccessoryHardwareBluetooth productID](v5, "productID")))
      {
        productVersion = self->_productVersion;
        v11 = productVersion == -[UARPAccessoryHardwareBluetooth productVersion](v5, "productVersion");
      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bluetooth, VendorID = 0x%04x, ProductID = 0x%04x, VendorID Source = %s, Product Version = 0x%04x"), self->_vendorID, self->_productID, UARPAccessoryVendorIDSourceToString(self->_vendorIDSource), self->_productVersion);
}

- (int64_t)vendorIDSource
{
  return self->_vendorIDSource;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)productVersion
{
  return self->_productVersion;
}

@end

@implementation UARPAccessoryHardwareUSB

- (UARPAccessoryHardwareUSB)init
{
  -[UARPAccessoryHardwareUSB doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareUSB)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  UARPAccessoryHardwareUSB *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPAccessoryHardwareUSB;
  result = -[UARPAccessoryHardwareID initWithTransport:](&v7, sel_initWithTransport_, 2);
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHardwareUSB *v4;
  UARPAccessoryHardwareUSB *v5;
  int64_t v6;
  int vendorID;
  int productID;
  BOOL v9;

  v4 = (UARPAccessoryHardwareUSB *)a3;
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
        && (vendorID = self->_vendorID, vendorID == -[UARPAccessoryHardwareUSB vendorID](v5, "vendorID")))
      {
        productID = self->_productID;
        v9 = productID == -[UARPAccessoryHardwareUSB productID](v5, "productID");
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
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("USB, VendorID = 0x%04x, ProductID = 0x%04x"), self->_vendorID, self->_productID);
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

@end

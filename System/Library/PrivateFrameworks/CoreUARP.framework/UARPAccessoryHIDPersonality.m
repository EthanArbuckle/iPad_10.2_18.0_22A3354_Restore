@implementation UARPAccessoryHIDPersonality

- (UARPAccessoryHIDPersonality)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  UARPAccessoryHIDPersonality *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPAccessoryHIDPersonality;
  result = -[UARPAccessoryHIDPersonality init](&v7, sel_init);
  if (result)
  {
    result->_vendorID = a3;
    result->_productID = a4;
  }
  return result;
}

- (unint64_t)getHash
{
  return self->_productID | ((unint64_t)self->_vendorID << 16);
}

- (id)personalityIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%04x.%04x"), a3, self->_vendorID, self->_productID);
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHIDPersonality *v4;
  UARPAccessoryHIDPersonality *v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = (UARPAccessoryHIDPersonality *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v8 = 1;
    }
    else
    {
      v5 = v4;
      v6 = -[UARPAccessoryHIDPersonality vendorID](self, "vendorID");
      if (v6 == -[UARPAccessoryHIDPersonality vendorID](v5, "vendorID"))
      {
        v7 = -[UARPAccessoryHIDPersonality productID](self, "productID");
        v8 = v7 == -[UARPAccessoryHIDPersonality productID](v5, "productID");
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

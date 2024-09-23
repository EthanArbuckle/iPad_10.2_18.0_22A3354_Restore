@implementation UARPAccessoryHardwareHID

- (UARPAccessoryHardwareHID)init
{
  -[UARPAccessoryHardwareHID doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareHID)initWithVendorID:(unsigned __int16)a3 productID:(unsigned __int16)a4
{
  UARPAccessoryHardwareHID *v6;
  UARPAccessoryHardwareHID *v7;
  uint64_t v8;
  NSMutableSet *personalities;
  UARPAccessoryHIDPersonality *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UARPAccessoryHardwareHID;
  v6 = -[UARPAccessoryHardwareID initWithTransport:](&v12, sel_initWithTransport_, 1);
  v7 = v6;
  if (v6)
  {
    v6->_vendorID = a3;
    v6->_productID = a4;
    v8 = objc_opt_new();
    personalities = v7->_personalities;
    v7->_personalities = (NSMutableSet *)v8;

    v10 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", v7->_vendorID, v7->_productID);
    -[NSMutableSet addObject:](v7->_personalities, "addObject:", v10);

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryHardwareHID *v4;
  NSMutableSet *personalities;
  void *v6;
  char v7;

  v4 = (UARPAccessoryHardwareHID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      personalities = self->_personalities;
      -[UARPAccessoryHardwareHID personalities](v4, "personalities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableSet isEqualToSet:](personalities, "isEqualToSet:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("HID, "));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_personalities;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "vendorID");
        v11 = objc_msgSend(v9, "productID");
        objc_msgSend(v3, "appendFormat:", CFSTR("<VID/PID = 0x%04x/0x%04x> "), v10, v11, (_QWORD)v14);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)personalities
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_personalities);
}

- (void)addPersonality:(id)a3
{
  -[NSMutableSet addObject:](self->_personalities, "addObject:", a3);
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalities, 0);
}

@end

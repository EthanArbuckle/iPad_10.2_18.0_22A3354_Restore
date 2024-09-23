@implementation ASDCustomProperty

- (ASDCustomProperty)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDCustomProperty init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (ASDCustomProperty)initWithSelector:(unsigned int)a3 propertyDataType:(unsigned int)a4 andQualifierDataType:(unsigned int)a5
{
  return -[ASDCustomProperty initWithSelector:scope:element:propertyDataType:andQualifierDataType:](self, "initWithSelector:scope:element:propertyDataType:andQualifierDataType:", *(_QWORD *)&a3, 1735159650, 0, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (ASDCustomProperty)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  ASDPropertyAddress *v10;
  ASDCustomProperty *v11;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v10 = -[ASDPropertyAddress initWithSelector:scope:element:]([ASDPropertyAddress alloc], "initWithSelector:scope:element:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v11 = -[ASDCustomProperty initWithAddress:propertyDataType:qualifierDataType:](self, "initWithAddress:propertyDataType:qualifierDataType:", v10, v8, v7);

  return v11;
}

- (ASDCustomProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  id v8;
  ASDCustomProperty *v9;
  uint64_t v10;
  ASDPropertyAddress *address;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDCustomProperty;
  v9 = -[ASDCustomProperty init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    address = v9->_address;
    v9->_address = (ASDPropertyAddress *)v10;

    v9->_propertyDataType = a4;
    v9->_qualifierDataType = a5;
  }

  return v9;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  return 8;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  return 0;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (void)sendPropertyChangeNotification
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[ASDCustomProperty address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "audioObjectPropertyAddress");
  LODWORD(v9) = v4;

  -[ASDCustomProperty owner](self, "owner", v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyChangedDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDCustomProperty owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v8, v7);

}

- (unsigned)selector
{
  void *v2;
  unsigned int v3;

  -[ASDCustomProperty address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selector");

  return v3;
}

- (unsigned)scope
{
  void *v2;
  unsigned int v3;

  -[ASDCustomProperty address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scope");

  return v3;
}

- (unsigned)element
{
  void *v2;
  unsigned int v3;

  -[ASDCustomProperty address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "element");

  return v3;
}

- (id)value
{
  int v4;
  id v5;

  if (-[ASDCustomProperty propertyDataType](self, "propertyDataType") != 1667658612
    && -[ASDCustomProperty propertyDataType](self, "propertyDataType") != 1886155636)
  {
    return 0;
  }
  v5 = 0;
  v4 = 8;
  if (-[ASDCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:](self, "getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:", 0, 0, &v4, &v5, 0))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

- (ASDPropertyAddress)address
{
  return self->_address;
}

- (unsigned)propertyDataType
{
  return self->_propertyDataType;
}

- (unsigned)qualifierDataType
{
  return self->_qualifierDataType;
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void)setSettable:(BOOL)a3
{
  self->_settable = a3;
}

- (ASDObject)owner
{
  return (ASDObject *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_address, 0);
}

@end

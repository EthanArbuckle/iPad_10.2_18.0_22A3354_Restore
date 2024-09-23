@implementation ASDTIOA2HeadsetInfoProperty

- (ASDTIOA2HeadsetInfoProperty)initWithIOA2Device:(id)a3
{
  id v4;
  void *v5;
  ASDTIOA2HeadsetInfoProperty *v6;
  ASDTIOA2HeadsetInfoProperty *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A260]), "initWithAddress:", 0x676C6F6268656164, 0);
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2HeadsetInfoProperty;
  v6 = -[ASDCustomProperty initWithAddress:propertyDataType:qualifierDataType:](&v9, sel_initWithAddress_propertyDataType_qualifierDataType_, v5, 1886155636, 0);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_device, v4);

  return v7;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  BOOL v7;
  void *v10;
  void *v11;

  if (*a5 < 8)
    return 0;
  -[ASDTIOA2HeadsetInfoProperty value](self, "value", *(_QWORD *)&a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v7 = v10 != 0;
  if (v10)
  {
    *(_QWORD *)a6 = v10;
    *a5 = 8;
  }

  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (id)value
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "customPropertyWithKey:", CFSTR("headset info"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1B8];
  return v4;
}

- (BOOL)includeValueInDescription
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
}

@end

@implementation ASDTIOA2LegacyHeadsetInfoProperty

- (ASDTIOA2LegacyHeadsetInfoProperty)initWithIOA2Device:(id)a3
{
  id v4;
  void *v5;
  ASDTIOA2LegacyHeadsetInfoProperty *v6;
  ASDTIOA2LegacyHeadsetInfoProperty *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A260]), "initWithAddress:", 0x676C6F6268656164, 0);
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2LegacyHeadsetInfoProperty;
  v6 = -[ASDCustomProperty initWithAddress:propertyDataType:qualifierDataType:](&v9, sel_initWithAddress_propertyDataType_qualifierDataType_, v5, 1886155636, 0);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_device, v4);

  return v7;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  uint64_t v7;
  void *v10;
  uint64_t v11;

  if (*a5 >= 8)
  {
    -[ASDTIOA2LegacyHeadsetInfoProperty value](self, "value", *(_QWORD *)&a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");

    if (v11
      || (objc_msgSend(MEMORY[0x24BDBCE70], "dictionary"), v7 = objc_claimAutoreleasedReturnValue(), (v11 = v7) != 0))
    {
      *(_QWORD *)a6 = v11;
      *a5 = 8;
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (id)value
{
  ASDTIOA2LegacyDevice **p_device;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  std::recursive_mutex *v8;
  char v9;

  p_device = &self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scopedLock");
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v5 = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(v5, "customPropertyWithKey:", CFSTR("headset info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    std::recursive_mutex::unlock(v8);
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
}

@end

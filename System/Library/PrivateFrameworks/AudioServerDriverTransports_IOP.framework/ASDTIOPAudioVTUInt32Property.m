@implementation ASDTIOPAudioVTUInt32Property

- (ASDTIOPAudioVTUInt32Property)initWithConfig:(id)a3
{
  ASDTIOPAudioVTUInt32Property *v3;
  ASDTIOPAudioVTUInt32Property *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioVTUInt32Property;
  v3 = -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:](&v6, sel_initWithConfig_propertyDataType_qualifierDataType_, a3, 1918990199, 0);
  v4 = v3;
  if (v3)
  {
    -[ASDTCustomProperty setPropertyValueSize:](v3, "setPropertyValueSize:", 4);
    -[ASDTCustomProperty setCacheMode:](v4, "setCacheMode:", 0);
  }
  return v4;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDTIOPAudioVTUInt32Property;
  if (-[ASDTCustomProperty checkPropertyValue:](&v7, sel_checkPropertyValue_, v4))
    v5 = objc_msgSend(v4, "length") == 4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)storePropertyValue:(id)a3
{
  return -[ASDTIOPAudioVTUInt32Property storeUInt32Value:](self, "storeUInt32Value:", *(unsigned int *)objc_msgSend(objc_retainAutorelease(a3), "bytes"));
}

- (id)retrievePropertyValue
{
  void *v2;
  int v4;

  v4 = 0;
  if (-[ASDTIOPAudioVTUInt32Property retrieveUInt32Value:](self, "retrieveUInt32Value:", &v4))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)storeUInt32Value:(unsigned int)a3
{
  return 0;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  return 0;
}

@end

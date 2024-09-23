@implementation ASDTControlProperty

+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForControl:controlSelector:propertySelector:propertyDataType:andQualifierDataType:", v12, v10, v9, v8, v7);

  return v13;
}

+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6
{
  return (id)objc_msgSend(a1, "forControl:controlSelector:propertySelector:propertyDataType:andQualifierDataType:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 0);
}

- (id)initForControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  void *v13;
  ASDTControlProperty *v14;
  ASDTControlProperty *v15;
  ASDTControlProperty *v16;
  objc_super v18;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A260]), "initWithSelector:scope:element:", v9, objc_msgSend(v12, "controlScope"), objc_msgSend(v12, "controlElement"));
    v18.receiver = self;
    v18.super_class = (Class)ASDTControlProperty;
    v14 = -[ASDCustomProperty initWithAddress:propertyDataType:qualifierDataType:](&v18, sel_initWithAddress_propertyDataType_qualifierDataType_, v13, v8, v7);
    v15 = v14;
    if (v14)
    {
      -[ASDTControlProperty setControl:](v14, "setControl:", v12);
      -[ASDTControlProperty setControlAddress:](v15, "setControlAddress:", a4 | (unint64_t)(objc_msgSend(v12, "controlScope") << 32), objc_msgSend(v12, "controlElement"));
    }
    self = v15;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isSettable
{
  ASDTControlProperty *v2;
  void *v3;

  v2 = self;
  -[ASDTControlProperty control](self, "control");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isPropertySettable:", &v2->_controlAddress);

  return (char)v2;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)&a3;
  -[ASDTControlProperty control](self, "control");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "dataSizeForProperty:withQualifierSize:andQualifierData:", &self->_controlAddress, v5, a4);

  return a4;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  uint64_t v7;
  uint64_t v11;
  void *v13;

  v7 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a3;
  -[ASDTControlProperty control](self, "control");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v13, "getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", &self->_controlAddress, v11, a4, a5, a6, v7);

  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  void *v13;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a3;
  -[ASDTControlProperty control](self, "control");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v13, "setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", &self->_controlAddress, v11, a4, v9, a6, v7);

  return v7;
}

- (ASDControl)control
{
  return (ASDControl *)objc_loadWeakRetained((id *)&self->_control);
}

- (void)setControl:(id)a3
{
  objc_storeWeak((id *)&self->_control, a3);
}

- (AudioObjectPropertyAddress)controlAddress
{
  AudioObjectPropertyAddress *p_controlAddress;
  uint64_t v3;
  AudioObjectPropertyElement mElement;
  AudioObjectPropertyAddress result;

  p_controlAddress = &self->_controlAddress;
  v3 = *(_QWORD *)&self->_controlAddress.mSelector;
  mElement = p_controlAddress->mElement;
  result.mSelector = v3;
  result.mScope = HIDWORD(v3);
  result.mElement = mElement;
  return result;
}

- (void)setControlAddress:(AudioObjectPropertyAddress)a3
{
  self->_controlAddress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_control);
}

@end

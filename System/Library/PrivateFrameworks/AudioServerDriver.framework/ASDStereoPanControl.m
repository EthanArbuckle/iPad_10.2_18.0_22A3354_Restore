@implementation ASDStereoPanControl

- (ASDStereoPanControl)initWithPlugin:(id)a3
{
  double v3;
  uint64_t v5;

  LODWORD(v5) = 1936744814;
  LODWORD(v3) = 0.5;
  return -[ASDStereoPanControl initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 1, 2, 0, 0, 1735159650, a3, v3, v5);
}

- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  double v5;
  uint64_t v7;

  LODWORD(v7) = 1936744814;
  LODWORD(v5) = 0.5;
  return -[ASDStereoPanControl initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 1, 2, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, v5, v7);
}

- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  double v6;
  uint64_t v8;

  LODWORD(v8) = a6;
  LODWORD(v6) = 0.5;
  return -[ASDStereoPanControl initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 1, 2, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, v6, v8);
}

- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  uint64_t v10;

  LODWORD(v10) = 1936744814;
  return -[ASDStereoPanControl initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:", *(_QWORD *)&a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, v10);
}

- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10
{
  ASDStereoPanControl *v14;
  ASDStereoPanControl *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *valueQueue;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ASDStereoPanControl;
  v14 = -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](&v25, sel_initWithElement_inScope_withPlugin_andObjectClassID_, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, a10);
  v15 = v14;
  if (v14)
  {
    v14->_value = a3;
    v14->_settable = a6;
    v14->_leftPanChannel = a4;
    v14->_rightPanChannel = a5;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.%@.%p"), v17, v20, v15);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    valueQueue = v15->_valueQueue;
    v15->_valueQueue = (OS_dispatch_queue *)v22;

  }
  return v15;
}

- (unsigned)baseClass
{
  return 1936744814;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v5;

  if (!a3)
    return 0;
  if (a3->mSelector == 1936745315 || a3->mSelector == 1936745334)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)ASDStereoPanControl;
  return -[ASDControl hasProperty:](&v5, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v6;

  if (!a3)
    return 0;
  if (a3->mSelector == 1936745334)
    return 4;
  if (a3->mSelector == 1936745315)
    return 8;
  v6.receiver = self;
  v6.super_class = (Class)ASDStereoPanControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result;
  int v12;
  unsigned int v13;
  objc_super v14;

  result = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1936745315)
    {
      if (*a6 >= 8)
      {
        *(_DWORD *)a7 = -[ASDStereoPanControl leftPanChannel](self, "leftPanChannel");
        *((_DWORD *)a7 + 1) = -[ASDStereoPanControl rightPanChannel](self, "rightPanChannel");
        v13 = 8;
        goto LABEL_10;
      }
      return 0;
    }
    if (a3->mSelector == 1936745334)
    {
      if (*a6 >= 4)
      {
        -[ASDStereoPanControl value](self, "value");
        *(_DWORD *)a7 = v12;
        v13 = 4;
LABEL_10:
        *a6 = v13;
        return 1;
      }
      return 0;
    }
    v14.receiver = self;
    v14.super_class = (Class)ASDStereoPanControl;
    return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3 || a3->mSelector == 1936745315)
    return 0;
  if (a3->mSelector == 1936745334)
    return -[ASDStereoPanControl isSettable](self, "isSettable");
  v4.receiver = self;
  v4.super_class = (Class)ASDStereoPanControl;
  return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  _BOOL4 v15;
  double v16;
  objc_super v18;

  if (!a3)
    goto LABEL_7;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  v15 = -[ASDStereoPanControl hasProperty:](self, "hasProperty:");
  if (v15)
  {
    v15 = -[ASDStereoPanControl isPropertySettable:](self, "isPropertySettable:", a3);
    if (v15)
    {
      if (a3->mSelector != 1936745334)
      {
        v18.receiver = self;
        v18.super_class = (Class)ASDStereoPanControl;
        LOBYTE(v15) = -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v18, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
        return v15;
      }
      if ((_DWORD)v10 == 4)
      {
        LODWORD(v16) = *(_DWORD *)a7;
        LOBYTE(v15) = -[ASDStereoPanControl changeValue:](self, "changeValue:", v16);
        return v15;
      }
LABEL_7:
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)changeValue:(float)a3
{
  return 0;
}

- (void)setValue:(float)a3
{
  NSObject *valueQueue;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD block[6];
  float v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASDStereoPanControl_setValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F6273706376;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __32__ASDStereoPanControl_setValue___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;
  float v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 80) != v2)
  {
    v3 = 1.0;
    v4 = v2 >= 1.0;
    v5 = v2 > 0.0 || v2 >= 1.0;
    if (v2 <= 0.0)
      v4 = 1;
    if (!v5)
      v3 = 0.0;
    if (v4)
      v2 = v3;
    *(float *)(v1 + 80) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)value
{
  NSObject *valueQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__ASDStereoPanControl_value__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __28__ASDStereoPanControl_value__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 80);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)leftPanChannel
{
  NSObject *valueQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__ASDStereoPanControl_leftPanChannel__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__ASDStereoPanControl_leftPanChannel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (unsigned)rightPanChannel
{
  NSObject *valueQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ASDStereoPanControl_rightPanChannel__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__ASDStereoPanControl_rightPanChannel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 100);
  return result;
}

- (void)setPanChannel:(unsigned int)a3 isLeft:(BOOL)a4
{
  NSObject *valueQueue;
  void *v6;
  uint64_t v7;
  int v8;
  _QWORD block[6];
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ASDStereoPanControl_setPanChannel_isLeft___block_invoke;
  block[3] = &unk_24DBCA8F0;
  v11 = a4;
  v10 = a3;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    v8 = 0;
    v7 = 0x676C6F6273706363;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __44__ASDStereoPanControl_setPanChannel_isLeft___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  _DWORD *v3;

  v1 = *(_DWORD *)(result + 48);
  if (*(_BYTE *)(result + 52))
    v2 = 96;
  else
    v2 = 100;
  v3 = (_DWORD *)(*(_QWORD *)(result + 32) + v2);
  if (*v3 != v1)
  {
    *v3 = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)setLeftPanChannel:(unsigned int)a3
{
  -[ASDStereoPanControl setPanChannel:isLeft:](self, "setPanChannel:isLeft:", *(_QWORD *)&a3, 1);
}

- (void)setRightPanChannel:(unsigned int)a3
{
  -[ASDStereoPanControl setPanChannel:isLeft:](self, "setPanChannel:isLeft:", *(_QWORD *)&a3, 0);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  float v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASDStereoPanControl;
  v6 = a3;
  -[ASDControl diagnosticDescriptionWithIndent:walkTree:](&v10, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDStereoPanControl value](self, "value");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Current Value: %f\n"), v6, v8);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Panning Channels: %u, %u\n"), v6, -[ASDStereoPanControl leftPanChannel](self, "leftPanChannel"), -[ASDStereoPanControl rightPanChannel](self, "rightPanChannel"));

  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioStereoPanControl");
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueQueue, 0);
}

@end

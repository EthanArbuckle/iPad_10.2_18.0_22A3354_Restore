@implementation ASDSliderControl

- (ASDSliderControl)initWithPlugin:(id)a3
{
  uint64_t v4;

  LODWORD(v4) = 1936483442;
  return -[ASDSliderControl initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, 0, 0, 1735159650, a3, v4);
}

- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  uint64_t v6;

  LODWORD(v6) = 1936483442;
  return -[ASDSliderControl initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, v6);
}

- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  uint64_t v7;

  LODWORD(v7) = a6;
  return -[ASDSliderControl initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, v7);
}

- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8
{
  uint64_t v9;

  LODWORD(v9) = 1936483442;
  return -[ASDSliderControl initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, v9);
}

- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8 andObjectClassID:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v10;
  unsigned int mMinimum;
  unsigned int mMaximum;
  id v17;
  ASDSliderControl *v18;
  ASDSliderControl *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *valueQueue;
  void *v29;
  objc_super v30;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  mMinimum = a4.mMinimum;
  mMaximum = a4.mMaximum;
  v17 = a8;
  if (mMinimum > mMaximum)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDSliderControl.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.mMinimum <= range.mMaximum"));

  }
  v30.receiver = self;
  v30.super_class = (Class)ASDSliderControl;
  v18 = -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](&v30, sel_initWithElement_inScope_withPlugin_andObjectClassID_, v10, v9, v17, a9);
  v19 = v18;
  if (v18)
  {
    v18->_value = a3;
    v18->_range.mMinimum = mMinimum;
    v18->_range.mMaximum = mMaximum;
    v18->_settable = a5;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD17C8];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.%@.%p"), v21, v24, v19);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = dispatch_queue_create((const char *)objc_msgSend(v25, "UTF8String"), 0);
    valueQueue = v19->_valueQueue;
    v19->_valueQueue = (OS_dispatch_queue *)v26;

  }
  return v19;
}

- (unsigned)baseClass
{
  return 1936483442;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if ((a3->mSelector | 4) == 0x73647276)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)ASDSliderControl;
  return -[ASDControl hasProperty:](&v4, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v6;

  if (!a3)
    return 0;
  if (a3->mSelector == 1935962742)
    return 4;
  if (a3->mSelector == 1935962738)
    return 8;
  v6.receiver = self;
  v6.super_class = (Class)ASDSliderControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8;
  NSObject *v10;
  unsigned int v11;
  NSObject *valueQueue;
  objc_super v14;
  _QWORD v15[6];
  _QWORD block[6];

  v8 = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1935962738)
    {
      if (*a6 >= 8)
      {
        valueQueue = self->_valueQueue;
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
        v15[3] = &unk_24DBCA528;
        v15[4] = self;
        v15[5] = a7;
        dispatch_sync(valueQueue, v15);
        v11 = 8;
        goto LABEL_10;
      }
    }
    else
    {
      if (a3->mSelector != 1935962742)
      {
        v14.receiver = self;
        v14.super_class = (Class)ASDSliderControl;
        return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
      }
      if (*a6 >= 4)
      {
        v10 = self->_valueQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
        block[3] = &unk_24DBCA528;
        block[4] = self;
        block[5] = a7;
        dispatch_sync(v10, block);
        v11 = 4;
LABEL_10:
        *a6 = v11;
        return 1;
      }
    }
    return 0;
  }
  return v8;
}

uint64_t __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t result)
{
  **(_DWORD **)(result + 40) = *(_DWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

uint64_t __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t result)
{
  **(_QWORD **)(result + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 84);
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3 || a3->mSelector == 1935962738)
    return 0;
  if (a3->mSelector == 1935962742)
    return -[ASDSliderControl isSettable](self, "isSettable");
  v4.receiver = self;
  v4.super_class = (Class)ASDSliderControl;
  return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  _BOOL4 v15;
  unsigned int mMaximum;
  unsigned int mMinimum;
  uint64_t v18;
  objc_super v20;

  if (!a3)
    goto LABEL_12;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  v15 = -[ASDSliderControl hasProperty:](self, "hasProperty:");
  if (!v15)
    return v15;
  v15 = -[ASDSliderControl isPropertySettable:](self, "isPropertySettable:", a3);
  if (!v15)
    return v15;
  if (a3->mSelector != 1935962742)
  {
    v20.receiver = self;
    v20.super_class = (Class)ASDSliderControl;
    LOBYTE(v15) = -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
    return v15;
  }
  if ((_DWORD)v10 != 4)
  {
LABEL_12:
    LOBYTE(v15) = 0;
    return v15;
  }
  mMinimum = self->_range.mMinimum;
  mMaximum = self->_range.mMaximum;
  if (mMaximum >= *(_DWORD *)a7)
    mMaximum = *(_DWORD *)a7;
  if (mMaximum <= mMinimum)
    v18 = mMinimum;
  else
    v18 = mMaximum;
  LOBYTE(v15) = -[ASDSliderControl changeValue:](self, "changeValue:", v18);
  return v15;
}

- (void)setRange:(_ASDSliderRange)a3
{
  NSObject *valueQueue;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDSliderControl_setRange___block_invoke;
  block[3] = &unk_24DBCA578;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v10 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F6273647272;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __29__ASDSliderControl_setRange___block_invoke(uint64_t result)
{
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(result + 32) + 84);
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 88) != *(_DWORD *)(result + 52)
    || *(_DWORD *)v1 != *(_DWORD *)(result + 48))
  {
    *v1 = *(_QWORD *)(result + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (_ASDSliderRange)range
{
  NSObject *valueQueue;
  _ASDSliderRange v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2810000000;
  v9 = "";
  v10 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__ASDSliderControl_range__block_invoke;
  block[3] = &unk_24DBCA398;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(valueQueue, block);
  v3 = (_ASDSliderRange)v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ASDSliderControl_range__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(result + 32) + 84);
  return result;
}

- (void)setValue:(unsigned int)a3
{
  NSObject *valueQueue;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD block[6];
  unsigned int v9;
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
  block[2] = __29__ASDSliderControl_setValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F6273647276;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __29__ASDSliderControl_setValue___block_invoke(uint64_t result)
{
  _DWORD *v1;
  unsigned int v2;

  v1 = *(_DWORD **)(result + 32);
  v2 = v1[22];
  if (v2 >= *(_DWORD *)(result + 48))
    v2 = *(_DWORD *)(result + 48);
  if (v2 <= v1[21])
    v2 = v1[21];
  if (v1[20] != v2)
  {
    v1[20] = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (unsigned)value
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
  v5[2] = __25__ASDSliderControl_value__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ASDSliderControl_value__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (BOOL)changeValue:(unsigned int)a3
{
  return 0;
}

+ (id)sliderControlWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v16;

  v8 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a6;
  v10 = a5;
  v12 = *(_QWORD *)&a3;
  v13 = a8;
  LODWORD(v16) = 1936483442;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v12, a4, v10, v9, v8, v13, v16);

  return v14;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _ASDSliderRange v8;
  _BOOL4 v9;
  const __CFString *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDSliderControl;
  v6 = a3;
  -[ASDControl diagnosticDescriptionWithIndent:walkTree:](&v12, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDSliderControl range](self, "range");
  v9 = -[ASDSliderControl isSettable](self, "isSettable");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Settable: %@\n"), v6, v10);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Value: %u\n"), v6, -[ASDSliderControl value](self, "value"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Range: Min %u Max %u\n"), v6, v8, HIDWORD(*(unint64_t *)&v8));

  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioSliderControl");
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

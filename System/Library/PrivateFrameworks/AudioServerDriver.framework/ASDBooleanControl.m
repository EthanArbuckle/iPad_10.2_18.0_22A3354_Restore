@implementation ASDBooleanControl

- (ASDBooleanControl)initWithPlugin:(id)a3
{
  return -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, 0, 1735159650, a3, 1953458028);
}

- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 1953458028);
}

- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  return -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  return -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, 1953458028);
}

- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8
{
  ASDBooleanControl *v10;
  ASDBooleanControl *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *valueQueue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ASDBooleanControl;
  v10 = -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](&v21, sel_initWithElement_inScope_withPlugin_andObjectClassID_, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
  v11 = v10;
  if (v10)
  {
    v10->_value = a3;
    v10->_settable = a4;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@.%p"), v13, v16, v11);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    valueQueue = v11->_valueQueue;
    v11->_valueQueue = (OS_dispatch_queue *)v18;

  }
  return v11;
}

- (unsigned)baseClass
{
  return 1953458028;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1650685548)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)ASDBooleanControl;
  return -[ASDControl hasProperty:](&v4, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v6;

  if (!a3)
    return 0;
  if (a3->mSelector == 1650685548)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)ASDBooleanControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result;
  objc_super v11;

  result = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1650685548)
    {
      if (*a6 < 4)
      {
        return 0;
      }
      else
      {
        *(_DWORD *)a7 = -[ASDBooleanControl value](self, "value");
        *a6 = 4;
        return 1;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)ASDBooleanControl;
      return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v11, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
    }
  }
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1650685548)
    return -[ASDBooleanControl isSettable](self, "isSettable");
  v4.receiver = self;
  v4.super_class = (Class)ASDBooleanControl;
  return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  _BOOL4 v15;
  objc_super v17;

  if (!a3)
    goto LABEL_7;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  v15 = -[ASDBooleanControl hasProperty:](self, "hasProperty:");
  if (v15)
  {
    v15 = -[ASDBooleanControl isPropertySettable:](self, "isPropertySettable:", a3);
    if (v15)
    {
      if (a3->mSelector != 1650685548)
      {
        v17.receiver = self;
        v17.super_class = (Class)ASDBooleanControl;
        LOBYTE(v15) = -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v17, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
        return v15;
      }
      if ((_DWORD)v10 == 4)
      {
        LOBYTE(v15) = -[ASDBooleanControl changeValue:](self, "changeValue:", *(_DWORD *)a7 != 0);
        return v15;
      }
LABEL_7:
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)changeValue:(BOOL)a3
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  NSObject *valueQueue;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD block[6];
  BOOL v9;
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
  block[2] = __30__ASDBooleanControl_setValue___block_invoke;
  block[3] = &unk_24DBCA728;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F626263766CLL;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __30__ASDBooleanControl_setValue___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 32) + 80) != *(unsigned __int8 *)(result + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 48);
  }
  return result;
}

- (BOOL)value
{
  NSObject *valueQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__ASDBooleanControl_value__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__ASDBooleanControl_value__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

+ (id)muteControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v10, v9, v8, v7, v11, 1836414053);

  return v12;
}

+ (id)phantomPowerControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v10, v9, v8, v7, v11, 1885888878);

  return v12;
}

+ (id)invertControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v10, v9, v8, v7, v11, 1885893481);

  return v12;
}

+ (id)jackControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v10, v9, v8, v7, v11, 1784767339);

  return v12;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDBooleanControl;
  v6 = a3;
  -[ASDControl diagnosticDescriptionWithIndent:walkTree:](&v11, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASDBooleanControl isSettable](self, "isSettable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Settable: %@\n"), v6, v8, v11.receiver, v11.super_class);
  if (-[ASDBooleanControl value](self, "value"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Value: %@\n"), v6, v9);

  return v7;
}

- (id)driverClassName
{
  int v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  v2 = -[ASDControl objectClass](self, "objectClass");
  v3 = CFSTR("AudioBooleanControl");
  if (v2 > 1885888877)
  {
    v4 = 1936682094;
    v12 = CFSTR("AudioLFEMuteControl");
    v13 = CFSTR("AudioTalkbackControl");
    if (v2 != 1952541794)
      v13 = CFSTR("AudioBooleanControl");
    if (v2 != 1937072749)
      v12 = v13;
    if (v2 == 1936682095)
      v7 = CFSTR("AudioSoloControl");
    else
      v7 = v12;
    v8 = 1885888878;
    v9 = CFSTR("AudioPhantomPowerControl");
    v10 = 1885893481;
    v11 = CFSTR("AudioInvertControl");
  }
  else
  {
    v4 = 1784767338;
    v5 = CFSTR("AudioListenbackControl");
    v6 = CFSTR("AudioMuteControl");
    if (v2 != 1836414053)
      v6 = CFSTR("AudioBooleanControl");
    if (v2 != 1819504226)
      v5 = v6;
    if (v2 == 1784767339)
      v7 = CFSTR("AudioJackControl");
    else
      v7 = v5;
    v8 = 1668049264;
    v9 = CFSTR("AudioClipLightControl");
    v10 = 1702259059;
    v11 = CFSTR("AudioTapEnableControl");
  }
  if (v2 == v10)
    v3 = v11;
  if (v2 == v8)
    v3 = v9;
  if (v2 <= v4)
    return (id)v3;
  else
    return (id)v7;
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

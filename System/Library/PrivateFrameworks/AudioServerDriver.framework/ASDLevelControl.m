@implementation ASDLevelControl

- (ASDLevelControl)initWithPlugin:(id)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  return -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, 0, 1735159650, a3, 1818588780, v3, v4, v5);
}

- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  double v5;
  double v6;
  double v7;

  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  return -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 1818588780, v5, v6, v7);
}

- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  double v6;
  double v7;
  double v8;

  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  return -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, v6, v7, v8);
}

- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  return -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9, 1818588780);
}

- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v19;
  ASDLevelControl *v20;
  ASDLevelControl *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *valueQueue;
  void *v31;
  objc_super v32;

  v10 = *(_QWORD *)&a10;
  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v19 = a9;
  if (a4 > a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDLevelControl.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumValue <= maximumValue"));

  }
  v32.receiver = self;
  v32.super_class = (Class)ASDLevelControl;
  v20 = -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](&v32, sel_initWithElement_inScope_withPlugin_andObjectClassID_, v12, v11, v19, v10);
  v21 = v20;
  if (v20)
  {
    v20->_decibelValue = a3;
    v20->_minimumDecibelValue = a4;
    v20->_maximumDecibelValue = a5;
    v20->_settable = a6;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@.%p"), v23, v26, v21);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = dispatch_queue_create((const char *)objc_msgSend(v27, "UTF8String"), 0);
    valueQueue = v21->_valueQueue;
    v21->_valueQueue = (OS_dispatch_queue *)v28;

  }
  return v21;
}

- (unsigned)baseClass
{
  return 1818588780;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  BOOL result;
  objc_super v9;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  result = 1;
  if ((a3->mSelector - 1818453106 > 4 || ((1 << (a3->mSelector - 114)) & 0x13) == 0)
    && mSelector != 1818456932
    && mSelector != 1818456950)
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDLevelControl;
    return -[ASDControl hasProperty:](&v9, sel_hasProperty_);
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  AudioObjectPropertySelector mSelector;
  unsigned int result;
  objc_super v10;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  result = 4;
  if ((int)a3->mSelector <= 1818453109)
  {
    if (mSelector != 1818453106)
    {
      if (mSelector == 1818453107)
        return result;
      goto LABEL_14;
    }
    return 16;
  }
  else if (mSelector != 1818453110 && mSelector != 1818456932 && mSelector != 1818456950)
  {
LABEL_14:
    v10.receiver = self;
    v10.super_class = (Class)ASDLevelControl;
    return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v10, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  double v8;
  BOOL v9;
  AudioObjectPropertySelector mSelector;
  int v13;
  unsigned int v14;
  NSObject *valueQueue;
  objc_super v17;
  _QWORD block[6];

  v9 = 0;
  if (a3 && a6 && a7)
  {
    mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1818453109)
    {
      if (mSelector == 1818453106)
      {
        if (*a6 >= 0x10)
        {
          valueQueue = self->_valueQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __90__ASDLevelControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_24DBCA528;
          block[4] = self;
          block[5] = a7;
          dispatch_sync(valueQueue, block);
          v14 = 16;
          goto LABEL_21;
        }
        return 0;
      }
      if (mSelector == 1818453107)
      {
        if (*a6 >= 4)
        {
          LODWORD(v8) = *(_DWORD *)a7;
          -[ASDLevelControl scalarFromDecibel:](self, "scalarFromDecibel:", v8);
          goto LABEL_18;
        }
        return 0;
      }
    }
    else
    {
      switch(mSelector)
      {
        case 0x6C636476u:
          if (*a6 >= 4)
          {
            -[ASDLevelControl decibelValue](self, "decibelValue");
            goto LABEL_18;
          }
          return 0;
        case 0x6C637364u:
          if (*a6 >= 4)
          {
            LODWORD(v8) = *(_DWORD *)a7;
            -[ASDLevelControl decibelFromScalar:](self, "decibelFromScalar:", v8);
            goto LABEL_18;
          }
          return 0;
        case 0x6C637376u:
          if (*a6 >= 4)
          {
            -[ASDLevelControl scalarValue](self, "scalarValue");
LABEL_18:
            *(_DWORD *)a7 = v13;
            v14 = 4;
LABEL_21:
            *a6 = v14;
            return 1;
          }
          return 0;
      }
    }
    v17.receiver = self;
    v17.super_class = (Class)ASDLevelControl;
    return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v17, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v9;
}

double __90__ASDLevelControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  double *v1;
  double result;

  v1 = *(double **)(a1 + 40);
  v1[1] = *(float *)(*(_QWORD *)(a1 + 32) + 88);
  result = *(float *)(*(_QWORD *)(a1 + 32) + 84);
  *v1 = result;
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  BOOL v3;
  AudioObjectPropertySelector mSelector;
  unsigned __int16 v5;
  objc_super v7;

  v3 = 0;
  if (!a3)
    return v3;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1818456931)
  {
    if (mSelector == 1818456932)
      return v3;
    v5 = 29558;
  }
  else
  {
    if (mSelector - 1818453106 < 2)
      return v3;
    v5 = 25718;
  }
  if (mSelector == (v5 | 0x6C630000))
    return -[ASDLevelControl isSettable](self, "isSettable");
  v7.receiver = self;
  v7.super_class = (Class)ASDLevelControl;
  return -[ASDObject isPropertySettable:](&v7, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  _BOOL4 v15;
  double v16;
  AudioObjectPropertySelector mSelector;
  float v18;
  float v19;
  float v20;
  double v21;
  objc_super v23;

  if (!a3)
    goto LABEL_9;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  v15 = -[ASDLevelControl hasProperty:](self, "hasProperty:");
  if (!v15)
    return v15;
  v15 = -[ASDLevelControl isPropertySettable:](self, "isPropertySettable:", a3);
  if (!v15)
    return v15;
  mSelector = a3->mSelector;
  if (a3->mSelector != 1818456950 && mSelector != 1818453110)
  {
    v23.receiver = self;
    v23.super_class = (Class)ASDLevelControl;
    LOBYTE(v15) = -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v23, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
    return v15;
  }
  if ((_DWORD)v10 != 4)
  {
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  v18 = *(float *)a7;
  if (mSelector == 1818456950)
  {
    *(float *)&v16 = fminf(fmaxf(v18, 0.0), 1.0);
    LOBYTE(v15) = -[ASDLevelControl changeScalarValue:](self, "changeScalarValue:", v16);
  }
  else
  {
    -[ASDLevelControl minimumDecibelValue](self, "minimumDecibelValue");
    if (v18 <= v19)
    {
      -[ASDLevelControl minimumDecibelValue](self, "minimumDecibelValue");
      v18 = v20;
    }
    -[ASDLevelControl maximumDecibelValue](self, "maximumDecibelValue");
    if (v18 >= *(float *)&v21)
    {
      -[ASDLevelControl maximumDecibelValue](self, "maximumDecibelValue");
      v18 = *(float *)&v21;
    }
    *(float *)&v21 = v18;
    LOBYTE(v15) = -[ASDLevelControl changeDecibelValue:](self, "changeDecibelValue:", v21);
  }
  return v15;
}

- (float)_scalarFromDecibel:(float)a3
{
  float minimumDecibelValue;
  float maximumDecibelValue;
  float v5;

  minimumDecibelValue = self->_minimumDecibelValue;
  maximumDecibelValue = self->_maximumDecibelValue;
  v5 = minimumDecibelValue;
  if (minimumDecibelValue <= a3)
  {
    v5 = a3;
    if (maximumDecibelValue < a3)
      v5 = self->_maximumDecibelValue;
  }
  return (float)(v5 - minimumDecibelValue) / (float)(maximumDecibelValue - minimumDecibelValue);
}

- (float)_decibelFromScalar:(float)a3
{
  float v3;
  float v4;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  if (a3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  return self->_minimumDecibelValue + (float)(v4 * (float)(self->_maximumDecibelValue - self->_minimumDecibelValue));
}

- (float)scalarFromDecibel:(float)a3
{
  NSObject *valueQueue;
  float v4;
  _QWORD block[6];
  float v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = (float *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASDLevelControl_scalarFromDecibel___block_invoke;
  block[3] = &unk_24DBCA7F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(valueQueue, block);
  v4 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__ASDLevelControl_scalarFromDecibel___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;
  int v4;

  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "_scalarFromDecibel:", a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (float)decibelFromScalar:(float)a3
{
  NSObject *valueQueue;
  float v4;
  _QWORD block[6];
  float v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = (float *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASDLevelControl_decibelFromScalar___block_invoke;
  block[3] = &unk_24DBCA7F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(valueQueue, block);
  v4 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__ASDLevelControl_decibelFromScalar___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;
  int v4;

  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "_decibelFromScalar:", a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void)setMaximumDecibelValue:(float)a3
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
  block[2] = __42__ASDLevelControl_setMaximumDecibelValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F626C636472;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __42__ASDLevelControl_setMaximumDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 88) != v2)
  {
    *(float *)(v1 + 88) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)maximumDecibelValue
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
  v5[2] = __38__ASDLevelControl_maximumDecibelValue__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __38__ASDLevelControl_maximumDecibelValue__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 88);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMinimumDecibelValue:(float)a3
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
  block[2] = __42__ASDLevelControl_setMinimumDecibelValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = 0;
    v6 = 0x676C6F626C636472;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __42__ASDLevelControl_setMinimumDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 84) != v2)
  {
    *(float *)(v1 + 84) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)minimumDecibelValue
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
  v5[2] = __38__ASDLevelControl_minimumDecibelValue__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __38__ASDLevelControl_minimumDecibelValue__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 84);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDecibelValue:(float)a3
{
  NSObject *valueQueue;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  _QWORD block[6];
  float v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDLevelControl_setDecibelValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v10 = a3;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v12 + 24))
  {
    v8 = 0;
    v7 = 0x676C6F626C636476;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedProperty:forObject:", &v7, self);

    LODWORD(v7) = 1818456950;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __35__ASDLevelControl_setDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 80) != v2)
  {
    *(float *)(v1 + 80) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)decibelValue
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
  v5[2] = __31__ASDLevelControl_decibelValue__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __31__ASDLevelControl_decibelValue__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 80);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setScalarValue:(float)a3
{
  -[ASDLevelControl decibelFromScalar:](self, "decibelFromScalar:");
  -[ASDLevelControl setDecibelValue:](self, "setDecibelValue:");
}

- (float)scalarValue
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
  v5[2] = __30__ASDLevelControl_scalarValue__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ASDLevelControl_scalarValue__block_invoke(uint64_t a1, double a2)
{
  _DWORD *v3;
  uint64_t result;
  int v5;

  v3 = *(_DWORD **)(a1 + 32);
  LODWORD(a2) = v3[20];
  result = objc_msgSend(v3, "_scalarFromDecibel:", a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (BOOL)changeDecibelValue:(float)a3
{
  return 0;
}

- (BOOL)changeScalarValue:(float)a3
{
  return 0;
}

+ (id)volumeControlWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v11 = a6;
  v15 = a9;
  v16 = objc_alloc((Class)objc_opt_class());
  *(float *)&v17 = a3;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  v20 = (void *)objc_msgSend(v16, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", v11, v10, v9, v15, 1986817381, v17, v18, v19);

  return v20;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;
  objc_super v16;

  v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASDLevelControl;
  v6 = a3;
  -[ASDControl diagnosticDescriptionWithIndent:walkTree:](&v16, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDLevelControl isSettable](self, "isSettable");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Settable: %@\n"), v6, v9);
  -[ASDLevelControl scalarValue](self, "scalarValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Scalar Value: %f\n"), v6, v10);
  -[ASDLevelControl decibelValue](self, "decibelValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Decibel Value: %f\n"), v6, v11);
  -[ASDLevelControl minimumDecibelValue](self, "minimumDecibelValue");
  v13 = v12;
  -[ASDLevelControl maximumDecibelValue](self, "maximumDecibelValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Decibel Range: Min %f Max %f\n"), v6, *(_QWORD *)&v13, v14);

  return v7;
}

- (id)driverClassName
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[ASDControl objectClass](self, "objectClass");
  v3 = CFSTR("AudioLevelControl");
  if (v2 == 1986817381)
    v3 = CFSTR("AudioVolumeControl");
  if (v2 == 1937072758)
    return CFSTR("AudioLFEVolumeControl");
  else
    return (id)v3;
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

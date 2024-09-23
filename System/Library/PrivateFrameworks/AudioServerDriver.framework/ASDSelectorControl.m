@implementation ASDSelectorControl

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 withPlugin:(id)a4
{
  return -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:](self, "initWithIsSettable:forElement:inScope:withPlugin:", a3, 0, 1735159650, a4);
}

- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:](self, "initWithIsSettable:forElement:inScope:withPlugin:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  return -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6
{
  return -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 1936483188);
}

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7
{
  ASDSelectorControl *v8;
  ASDSelectorControl *v9;
  NSMutableArray *v10;
  NSMutableArray *values;
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
  v21.super_class = (Class)ASDSelectorControl;
  v8 = -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](&v21, sel_initWithElement_inScope_withPlugin_andObjectClassID_, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7);
  v9 = v8;
  if (v8)
  {
    v8->_settable = a3;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v9->_values;
    v9->_values = v10;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@.%p"), v13, v16, v9);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    valueQueue = v9->_valueQueue;
    v9->_valueQueue = (OS_dispatch_queue *)v18;

  }
  return v9;
}

- (unsigned)baseClass
{
  return 1936483188;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  BOOL result;
  objc_super v7;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  result = 1;
  if ((int)a3->mSelector > 1935893352)
  {
    if (mSelector != 1935893353 && mSelector != 1935894894)
    {
LABEL_11:
      v7.receiver = self;
      v7.super_class = (Class)ASDSelectorControl;
      return -[ASDControl hasProperty:](&v7, sel_hasProperty_);
    }
  }
  else
  {
    if (mSelector != 1668049771)
    {
      if (mSelector == 1935892841)
        return result;
      goto LABEL_11;
    }
    return self->_hasKindProperty;
  }
  return result;
}

- (unsigned)minDataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v6;

  if (!a3)
    return 0;
  if (a3->mSelector == 1935893353)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)ASDSelectorControl;
  return -[ASDObject minDataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_minDataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  AudioObjectPropertySelector mSelector;
  NSObject *v6;
  unsigned int v7;
  NSObject *valueQueue;
  objc_super v10;
  _QWORD block[6];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1935893352)
  {
    if (mSelector != 1935894894)
    {
      if (mSelector == 1935893353)
      {
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 0;
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        valueQueue = self->_valueQueue;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
        v12[3] = &unk_24DBCA750;
        v12[4] = self;
        v12[5] = &v17;
        v12[6] = &v13;
        dispatch_sync(valueQueue, v12);
        if (v14[3])
          v7 = 4 * *((_DWORD *)v18 + 6);
        else
          v7 = 4;
        _Block_object_dispose(&v13, 8);
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    return 8;
  }
  else
  {
    if (mSelector != 1668049771)
    {
      if (mSelector == 1935892841)
      {
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 0;
        v6 = self->_valueQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
        block[3] = &unk_24DBCA398;
        block[4] = self;
        block[5] = &v17;
        dispatch_sync(v6, block);
        v7 = 4 * *((_DWORD *)v18 + 6);
LABEL_16:
        _Block_object_dispose(&v17, 8);
        return v7;
      }
LABEL_13:
      v10.receiver = self;
      v10.super_class = (Class)ASDSelectorControl;
      return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v10, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    return 4 * self->_hasKindProperty;
  }
}

uint64_t __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 96);
  result = objc_msgSend(*(id *)(a1[4] + 88), "count");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_indexOfValue:(unsigned int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_values;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "value", (_QWORD)v13) == a3)
        {
          v11 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

- (id)_findValue:(unsigned int)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[ASDSelectorControl _indexOfValue:](self, "_indexOfValue:", *(_QWORD *)&a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  AudioObjectPropertySelector mSelector;
  NSObject *valueQueue;
  _QWORD *v11;
  NSObject *v12;
  int v13;
  unsigned int v14;
  NSObject *v15;
  int v16;
  unsigned __int8 v17;
  char v18;
  objc_super v20;
  _QWORD v21[7];
  int v22;
  _QWORD v23[7];
  int v24;
  _QWORD v25[8];
  _QWORD block[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (a3 && a6 && a7)
  {
    mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1935893352)
    {
      if (mSelector != 1935894894)
      {
        if (mSelector == 1935893353)
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = 0;
          valueQueue = self->_valueQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_24DBCA3C0;
          block[6] = a7;
          block[7] = a6;
          block[4] = self;
          block[5] = &v27;
          v11 = block;
          goto LABEL_11;
        }
LABEL_22:
        v20.receiver = self;
        v20.super_class = (Class)ASDSelectorControl;
        v17 = -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
        *((_BYTE *)v32 + 24) = v17;
        goto LABEL_23;
      }
      if (a4 >= 4 && a5 && *a6 >= 8)
      {
        v15 = self->_valueQueue;
        v16 = *(_DWORD *)a5;
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
        v23[3] = &unk_24DBCA778;
        v24 = v16;
        v23[4] = self;
        v23[5] = &v31;
        v23[6] = a7;
        dispatch_sync(v15, v23);
        v14 = 8;
        goto LABEL_21;
      }
    }
    else
    {
      if (mSelector != 1668049771)
      {
        if (mSelector == 1935892841)
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = 0;
          valueQueue = self->_valueQueue;
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
          v25[3] = &unk_24DBCA3C0;
          v25[6] = a6;
          v25[7] = a7;
          v25[4] = self;
          v25[5] = &v27;
          v11 = v25;
LABEL_11:
          dispatch_sync(valueQueue, v11);
          *a6 = 4 * *((_DWORD *)v28 + 6);
          *((_BYTE *)v32 + 24) = 1;
          _Block_object_dispose(&v27, 8);
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      if (self->_hasKindProperty && a4 >= 4 && a5 && *a6 >= 4)
      {
        v12 = self->_valueQueue;
        v13 = *(_DWORD *)a5;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
        v21[3] = &unk_24DBCA778;
        v22 = v13;
        v21[4] = self;
        v21[5] = &v31;
        v21[6] = a7;
        dispatch_sync(v12, v21);
        v14 = 4;
LABEL_21:
        *a6 = v14;
      }
    }
  }
LABEL_23:
  v18 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  return v18;
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = **(unsigned int **)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 96) >= v4 >> 2)
      v6 = v4 >> 2;
    else
      v6 = *(_QWORD *)(v5 + 96);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = *(id *)(v5 + 88);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "selected", (_QWORD)v16))
          {
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= v6)
              goto LABEL_15;
            v13 = objc_msgSend(v12, "value");
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = *(_QWORD *)(v14 + 24);
            *(_QWORD *)(v14 + 24) = v15 + 1;
            *(_DWORD *)(v3 + 4 * v15) = v13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
LABEL_15:

  }
  else if (**(_DWORD **)(a1 + 56) >= 4u)
  {
    **(_DWORD **)(a1 + 48) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v3 = **(unsigned int **)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v5 = *(_QWORD *)(a1 + 56);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v6);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == v4)
        break;
      *(_DWORD *)(v5 + 4 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "value", (_QWORD)v11);
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          goto LABEL_6;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const void *v6;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_findValue:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    **(_QWORD **)(a1 + 48) = v5;

    v6 = **(const void ***)(a1 + 48);
    if (v6)
      CFRetain(v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  objc_autoreleasePoolPop(v2);
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_findValue:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    **(_DWORD **)(a1 + 48) = objc_msgSend(v3, "kind");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1935893353)
    return -[ASDSelectorControl isSettable](self, "isSettable");
  v4.receiver = self;
  v4.super_class = (Class)ASDSelectorControl;
  return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  _BOOL4 v15;
  objc_super v17;

  if (a3)
  {
    v8 = *(_QWORD *)&a8;
    v10 = *(_QWORD *)&a6;
    v12 = *(_QWORD *)&a4;
    v15 = -[ASDSelectorControl hasProperty:](self, "hasProperty:");
    if (v15)
    {
      v15 = -[ASDSelectorControl isPropertySettable:](self, "isPropertySettable:", a3);
      if (v15)
      {
        if (a3->mSelector == 1935893353)
        {
          if ((_DWORD)v10 == 4)
            LOBYTE(v15) = -[ASDSelectorControl changeValue:](self, "changeValue:", *(unsigned int *)a7);
          else
            LOBYTE(v15) = -[ASDSelectorControl changeValues:withCount:](self, "changeValues:withCount:", a7, v10 >> 2);
        }
        else
        {
          v17.receiver = self;
          v17.super_class = (Class)ASDSelectorControl;
          LOBYTE(v15) = -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v17, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
        }
      }
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)_updateSelectedValue
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_selectedValue = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_values;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "selected", (_QWORD)v9))
        {
          self->_selectedValue = objc_msgSend(v8, "value");
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)addValue:(id)a3
{
  id v4;
  NSObject *valueQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDSelectorControl_addValue___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(valueQueue, block);

}

void __31__ASDSelectorControl_addValue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  int v8;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "_indexOfValue:", objc_msgSend(*(id *)(a1 + 40), "value"));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(a1 + 40), "selected"))
      goto LABEL_14;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    v5 = *(_QWORD **)(a1 + 32);
    if (v5[12] != 1)
      goto LABEL_14;
LABEL_13:
    objc_msgSend(v5, "_updateSelectedValue");
    goto LABEL_14;
  }
  objc_msgSend(v4, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "selected") && (objc_msgSend(*(id *)(a1 + 40), "selected") & 1) == 0)
  {
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v8 = objc_msgSend(v6, "value");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectAtIndex:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v3);

    if (v7 != v8)
      goto LABEL_14;
    v5 = *(_QWORD **)(a1 + 32);
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "selected") & 1) == 0 && objc_msgSend(*(id *)(a1 + 40), "selected"))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectAtIndex:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v3);

LABEL_14:
  objc_autoreleasePoolPop(v2);
}

- (void)removeValue:(id)a3
{
  id v4;
  NSObject *valueQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDSelectorControl_removeValue___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(valueQueue, block);

}

void __34__ASDSelectorControl_removeValue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "selected"))
      --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectAtIndex:", v4);
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80);
    if (v6 == objc_msgSend(v5, "value"))
      objc_msgSend(*(id *)(a1 + 32), "_updateSelectedValue");

  }
  objc_autoreleasePoolPop(v2);
}

- (id)values
{
  NSObject *valueQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__ASDSelectorControl_values__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__ASDSelectorControl_values__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)nameForValue:(unsigned int)a3
{
  NSObject *valueQueue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDSelectorControl_nameForValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(valueQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__ASDSelectorControl_nameForValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_findValue:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_autoreleasePoolPop(v2);
}

- (unsigned)kindForValue:(unsigned int)a3
{
  NSObject *valueQueue;
  unsigned int v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDSelectorControl_kindForValue___block_invoke;
  block[3] = &unk_24DBCA7A0;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(valueQueue, block);
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __35__ASDSelectorControl_kindForValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_findValue:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "kind");

  objc_autoreleasePoolPop(v2);
}

- (BOOL)changeValue:(unsigned int)a3
{
  unsigned int v4;

  v4 = a3;
  return -[ASDSelectorControl changeValues:withCount:](self, "changeValues:withCount:", &v4, 1);
}

- (BOOL)changeValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  NSObject *valueQueue;
  void *v6;
  BOOL v7;
  uint64_t v9;
  int v10;
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  valueQueue = self->_valueQueue;
  v15 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ASDSelectorControl_setSelectedValues_withCount___block_invoke;
  block[3] = &unk_24DBCA7C8;
  block[7] = a4;
  block[8] = a3;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v16;
  dispatch_sync(valueQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    -[ASDSelectorControl selectionDidChange:](self, "selectionDidChange:", v17[5]);
    v10 = 0;
    v9 = 0x676C6F6273636369;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changedProperty:forObject:", &v9, self);

    v7 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __50__ASDSelectorControl_setSelectedValues_withCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    LODWORD(v3) = **(_DWORD **)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v4 + 80) != (_DWORD)v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = v3;
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v4 + 88), "count"))
  {
    v25 = v2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "setPrevSelected:", objc_msgSend(v10, "selected"));
          objc_msgSend(v10, "setSelected:", 0);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    if (*(_QWORD *)(a1 + 56))
    {
      v11 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "_findValue:", *(unsigned int *)(*(_QWORD *)(a1 + 64) + 4 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          objc_msgSend(v12, "setSelected:", 1);
        }

        ++v11;
      }
      while (v11 < *(_QWORD *)(a1 + 56));
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v20 = objc_msgSend(v19, "prevSelected");
          if (v20 != objc_msgSend(v19, "selected"))
          {
            v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            if (!v21)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"));
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v24 = *(void **)(v23 + 40);
              *(_QWORD *)(v23 + 40) = v22;

              v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            }
            objc_msgSend(v21, "addObject:", v19);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
    }

    v2 = v25;
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)setSelectedValues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  BOOL v17;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  if (!v5)
  {
LABEL_16:
    v16 = objc_retainAutorelease((id)v5);
    v17 = -[ASDSelectorControl setSelectedValues:withCount:](self, "setSelectedValues:withCount:", objc_msgSend(v16, "bytes"), v6);

    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v19 = objc_retainAutorelease(v7);
    v20 = objc_msgSend(v19, "mutableBytes");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v22;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        if (!(v11 - v6 + v13))
          break;
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_msgSend(v14, "unsignedIntValue");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ASDSelectorControl setSelectedValues:].cold.2();

            v17 = 0;
            goto LABEL_23;
          }
          v15 = objc_msgSend(v14, "value");
        }
        *(_DWORD *)(v20 + 4 * v11 + 4 * v13++) = v15;
        if (v10 == v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          v11 += v13;
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }

    v5 = (uint64_t)v19;
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDSelectorControl setSelectedValues:].cold.1();
  v17 = 0;
LABEL_23:

  return v17;
}

- (void)setSelectedValue:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3;
  -[ASDSelectorControl setSelectedValues:withCount:](self, "setSelectedValues:withCount:", &v3, 1);
}

- (unsigned)selectedValue
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
  v9 = -1;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__ASDSelectorControl_selectedValue__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__ASDSelectorControl_selectedValue__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (NSArray)selectedValues
{
  void *v3;
  NSObject *valueQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  ASDSelectorControl *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numSelected);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  valueQueue = self->_valueQueue;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __36__ASDSelectorControl_selectedValues__block_invoke;
  v11 = &unk_24DBCA438;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(valueQueue, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __36__ASDSelectorControl_selectedValues__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "selected", (_QWORD)v9))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDSelectorControl;
  -[ASDControl diagnosticDescriptionWithIndent:walkTree:](&v21, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDSelectorControl isSettable](self, "isSettable");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Settable: %@\n"), v6, v9);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Current Item: %u\n"), v6, -[ASDSelectorControl selectedValue](self, "selectedValue"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Items:\n"), v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ASDSelectorControl values](self, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %@\n"), v6, v13 + v15, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      v13 = (v13 + v15);
    }
    while (v12);
  }

  return v7;
}

- (id)driverClassName
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = -[ASDControl objectClass](self, "objectClass");
  v3 = CFSTR("AudioSelectorControl");
  v4 = CFSTR("AudioDataSourceControl");
  if (v2 != 1685287523)
    v4 = CFSTR("AudioSelectorControl");
  if (v2 == 1751740518)
    v5 = CFSTR("AudioHighPassFilterControl");
  else
    v5 = v4;
  if (v2 == 1852601964)
    v6 = CFSTR("AudioLineLevelControl");
  else
    v6 = v5;
  if (v2 == 1684370292)
    v3 = CFSTR("AudioDataDestinationControl");
  if (v2 == 1668047723)
    v3 = CFSTR("AudioClockSourceControl");
  if (v2 <= 1685287522)
    return (id)v3;
  else
    return (id)v6;
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (BOOL)hasKindProperty
{
  return self->_hasKindProperty;
}

- (void)setHasKindProperty:(BOOL)a3
{
  self->_hasKindProperty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueQueue, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)setSelectedValues:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "-[ASDSelectorControl setSelectedValues:]";
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Memory allocation error.", (uint8_t *)&v0, 0xCu);
}

- (void)setSelectedValues:.cold.2()
{
  objc_class *v0;
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 136315394;
  v3 = "-[ASDSelectorControl setSelectedValues:]";
  v4 = 2112;
  v5 = v1;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Bad input object: %@", (uint8_t *)&v2, 0x16u);

}

@end

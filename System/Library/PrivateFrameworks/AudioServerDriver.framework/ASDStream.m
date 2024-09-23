@implementation ASDStream

- (ASDStream)initWithPlugin:(id)a3
{
  return -[ASDStream initWithDirection:withPlugin:](self, "initWithDirection:withPlugin:", 1869968496, a3);
}

- (ASDStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  ASDStream *v5;
  ASDStream *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *physicalFormats;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *physicalFormatQueue;
  NSMutableArray *v17;
  NSMutableArray *controls;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *controlQueue;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ASDStream;
  v5 = -[ASDObject initWithPlugin:](&v26, sel_initWithPlugin_, a4);
  v6 = v5;
  if (v5)
  {
    v5->_direction = a3;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    physicalFormats = v6->_physicalFormats;
    v6->_physicalFormats = v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.device.%@.%p.physicalFormats"), v8, v13, v6);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    physicalFormatQueue = v6->_physicalFormatQueue;
    v6->_physicalFormatQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    controls = v6->_controls;
    v6->_controls = v17;

    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.device.%@.%p.controls"), v8, v21, v6);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    controlQueue = v6->_controlQueue;
    v6->_controlQueue = (OS_dispatch_queue *)v23;

    v6->_physicalFormatSettable = 1;
    v6->_isTapStream = 0;

  }
  return v6;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  signed int mSelector;
  BOOL v4;
  int v5;
  objc_super v9;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1935762291)
  {
    if (mSelector <= 1819569762)
    {
      if (mSelector == 1668575852 || mSelector == 1819173229)
        return 1;
      goto LABEL_32;
    }
    v4 = mSelector == 1819569763 || mSelector == 1885762592;
    v5 = 1885762657;
  }
  else if (mSelector > 1936092512)
  {
    v4 = mSelector == 1936092513 || mSelector == 1952805485;
    v5 = 1952542835;
  }
  else
  {
    v4 = mSelector == 1935762292 || mSelector == 1935894638;
    v5 = 1935960434;
  }
  if (!v4 && mSelector != v5)
  {
LABEL_32:
    v9.receiver = self;
    v9.super_class = (Class)ASDStream;
    return -[ASDObject hasProperty:](&v9, sel_hasProperty_);
  }
  return a3->mScope == 1735159650 && a3->mElement == 0;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  signed int mSelector;
  unsigned int v6;
  int v7;
  NSObject *physicalFormatQueue;
  NSObject *controlQueue;
  _QWORD *v12;
  objc_super v14;
  _QWORD v15[6];
  _QWORD v16[7];
  unsigned int v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v6 = 4;
  if ((int)a3->mSelector > 1935762291)
  {
    if (mSelector <= 1936092512)
    {
      if (mSelector != 1935762292 && mSelector != 1935894638 && mSelector != 1935960434)
        goto LABEL_24;
      return v6;
    }
    if (mSelector != 1936092513)
    {
      if (mSelector == 1952542835)
        return v6;
      v7 = 1952805485;
      goto LABEL_23;
    }
    goto LABEL_28;
  }
  if (mSelector > 1870098019)
  {
    if (mSelector == 1870098020)
      goto LABEL_25;
    if (mSelector == 1885762592)
      return 40;
    if (mSelector != 1885762657)
      goto LABEL_24;
LABEL_28:
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
    block[3] = &unk_24DBCA398;
    block[4] = self;
    block[5] = &v19;
    dispatch_sync(physicalFormatQueue, block);
    v6 = 56 * *((_DWORD *)v20 + 6);
    goto LABEL_34;
  }
  if (mSelector == 1668575852)
  {
LABEL_25:
    if (a4)
    {
      if ((a4 & 3) != 0)
        return 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      controlQueue = self->_controlQueue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      v16[3] = &unk_24DBCA778;
      v17 = a4 >> 2;
      v16[5] = &v19;
      v16[6] = a5;
      v16[4] = self;
      v12 = v16;
    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      controlQueue = self->_controlQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v15[3] = &unk_24DBCA398;
      v15[4] = self;
      v15[5] = &v19;
      v12 = v15;
    }
    dispatch_sync(controlQueue, v12);
    v6 = 4 * *((_DWORD *)v20 + 6);
LABEL_34:
    _Block_object_dispose(&v19, 8);
    return v6;
  }
  if (mSelector == 1819173229)
    return 8;
  v7 = 1819569763;
LABEL_23:
  if (mSelector != v7)
  {
LABEL_24:
    v14.receiver = self;
    v14.super_class = (Class)ASDStream;
    return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v14, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v6;
}

uint64_t __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v8;
    while (1)
    {
      if (*(_QWORD *)v8 != v6)
        objc_enumerationMutation(v3);
      if (!--v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22073330C]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  objc_autoreleasePoolPop(v2);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result;
  uint64_t v13;
  signed int mSelector;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *physicalFormatQueue;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *controlQueue;
  __int128 v28;
  objc_super v29;
  _QWORD v30[8];
  _QWORD v31[9];
  unsigned int v32;
  _QWORD block[8];
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  result = 0;
  if (a3 && a6 && a7)
  {
    v13 = *(_QWORD *)&a4;
    mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1935762291)
    {
      if (mSelector <= 1936092512)
      {
        switch(mSelector)
        {
          case 1935762292:
            if (*a6 >= 4)
            {
              v16 = -[ASDStream isActive](self, "isActive");
              goto LABEL_45;
            }
            break;
          case 1935894638:
            if (*a6 >= 4)
            {
              v16 = -[ASDStream startingChannel](self, "startingChannel");
              goto LABEL_45;
            }
            break;
          case 1935960434:
            if (*a6 >= 4)
            {
              *(_DWORD *)a7 = -[ASDStream direction](self, "direction") == 1768845428;
LABEL_46:
              v22 = 4;
LABEL_47:
              *a6 = v22;
              return 1;
            }
            break;
          default:
            goto LABEL_51;
        }
        return 0;
      }
      if (mSelector != 1936092513)
      {
        if (mSelector != 1952542835)
        {
          if (mSelector == 1952805485)
          {
            if (*a6 >= 4)
            {
              v16 = -[ASDStream terminalType](self, "terminalType");
              goto LABEL_45;
            }
            return 0;
          }
          goto LABEL_51;
        }
        if (*a6 >= 4)
        {
          v16 = -[ASDStream isTapStream](self, "isTapStream");
          goto LABEL_45;
        }
        return 0;
      }
    }
    else
    {
      if (mSelector <= 1870098019)
      {
        if (mSelector != 1668575852)
        {
          if (mSelector != 1819173229)
          {
            if (mSelector == 1819569763)
            {
              if (*a6 >= 4)
              {
                v16 = -[ASDStream latency](self, "latency");
LABEL_45:
                *(_DWORD *)a7 = v16;
                goto LABEL_46;
              }
              return 0;
            }
LABEL_51:
            v29.receiver = self;
            v29.super_class = (Class)ASDStream;
            return -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v29, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
          }
          if (*a6 >= 8)
          {
            -[ASDStream streamName](self, "streamName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)a7 = v21;

            if (*(_QWORD *)a7)
              CFRetain(*(CFTypeRef *)a7);
            v22 = 8;
            goto LABEL_47;
          }
          return 0;
        }
        goto LABEL_26;
      }
      if (mSelector == 1870098020)
      {
LABEL_26:
        if (a4)
        {
          if ((a4 & 3) != 0)
            return 0;
          *(_QWORD *)&v34 = 0;
          *((_QWORD *)&v34 + 1) = &v34;
          v35 = 0x2020000000uLL;
          v17 = *a6;
          if (v17 >= -[ASDStream dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))v18 = -[ASDStream dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v13, a5);
          else
            v18 = *a6;
          v26 = v18 >> 2;
          if (*(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) != v26)
          {
            controlQueue = self->_controlQueue;
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
            v31[3] = &unk_24DBCA8A0;
            v32 = v13 >> 2;
            v31[4] = self;
            v31[5] = &v34;
            v31[6] = a5;
            v31[7] = v26;
            v31[8] = a7;
            dispatch_sync(controlQueue, v31);
            LODWORD(v26) = *(_DWORD *)(*((_QWORD *)&v34 + 1) + 24);
          }
          v20 = 4 * v26;
        }
        else
        {
          *(_QWORD *)&v34 = 0;
          *((_QWORD *)&v34 + 1) = &v34;
          v35 = 0x2020000000uLL;
          if (*a6 < 4)
          {
            v20 = 0;
          }
          else
          {
            v25 = self->_controlQueue;
            v30[0] = MEMORY[0x24BDAC760];
            v30[1] = 3221225472;
            v30[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
            v30[3] = &unk_24DBCA3C0;
            v30[4] = self;
            v30[5] = &v34;
            v30[6] = a6;
            v30[7] = a7;
            dispatch_sync(v25, v30);
            v20 = 4 * *(_DWORD *)(*((_QWORD *)&v34 + 1) + 24);
          }
        }
LABEL_31:
        *a6 = v20;
        _Block_object_dispose(&v34, 8);
        return 1;
      }
      if (mSelector == 1885762592)
      {
        if (*a6 >= 0x28)
        {
          -[ASDStream physicalFormat](self, "physicalFormat");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "audioStreamBasicDescription");
          }
          else
          {
            v36 = 0;
            v34 = 0u;
            v35 = 0u;
          }
          v28 = v35;
          *(_OWORD *)a7 = v34;
          *((_OWORD *)a7 + 1) = v28;
          *((_QWORD *)a7 + 4) = v36;

          v22 = 40;
          goto LABEL_47;
        }
        return 0;
      }
      if (mSelector != 1885762657)
        goto LABEL_51;
    }
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000uLL;
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
    block[3] = &unk_24DBCA3C0;
    block[6] = a6;
    block[7] = a7;
    block[4] = self;
    block[5] = &v34;
    dispatch_sync(physicalFormatQueue, block);
    v20 = 56 * *(_DWORD *)(*((_QWORD *)&v34 + 1) + 24);
    goto LABEL_31;
  }
  return result;
}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = **(_DWORD **)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") <= v2 / 0x38uLL)
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  else
    v3 = **(unsigned int **)(a1 + 48) / 0x38uLL;
  v4 = *(_QWORD *)(a1 + 56);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v10 == v3)
        break;
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      if (v11)
      {
        objc_msgSend(v11, "audioStreamRangedDescription");
      }
      else
      {
        v16 = 0;
        v14 = 0u;
        v15 = 0u;
        v13 = 0u;
      }
      v12 = v4 + 56 * v10;
      *(_QWORD *)(v12 + 48) = v16;
      *(_OWORD *)(v12 + 16) = v14;
      *(_OWORD *)(v12 + 32) = v15;
      *(_OWORD *)v12 = v13;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_6;
        break;
      }
    }
  }

}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v8;
    while (1)
    {
      if (*(_QWORD *)v8 != v6)
        objc_enumerationMutation(v3);
      if (!--v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v3 = **(unsigned int **)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == v4)
        break;
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "objectID", (_QWORD)v10);
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_6;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  objc_super v6;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  if (a3->mSelector == 1952542835 || mSelector == 1935762292)
    return 1;
  if (mSelector == 1885762592)
    return -[ASDStream isPhysicalFormatSettable](self, "isPhysicalFormatSettable");
  v6.receiver = self;
  v6.super_class = (Class)ASDStream;
  return -[ASDObject isPropertySettable:](&v6, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  AudioObjectPropertySelector mSelector;
  ASDStreamFormat *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  NSObject *physicalFormatQueue;
  ASDStreamFormat *v22;
  objc_super v23;
  _QWORD block[5];
  ASDStreamFormat *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  if (!a3)
    return 0;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  if (!-[ASDStream hasProperty:](self, "hasProperty:")
    || !-[ASDStream isPropertySettable:](self, "isPropertySettable:", a3))
  {
    return 0;
  }
  mSelector = a3->mSelector;
  if (a3->mSelector != 1885762592)
  {
    if (mSelector == 1952542835)
    {
      if ((_DWORD)v10 == 4)
      {
        -[ASDStream setIsTapStream:](self, "setIsTapStream:", *(_DWORD *)a7 != 0);
        return 1;
      }
    }
    else
    {
      if (mSelector != 1935762292)
      {
        v23.receiver = self;
        v23.super_class = (Class)ASDStream;
        return -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v23, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
      }
      if ((_DWORD)v10 == 4)
      {
        -[ASDStream setIsActive:](self, "setIsActive:", *(_DWORD *)a7 != 0);
        return 1;
      }
    }
    return 0;
  }
  if ((_DWORD)v10 != 40 || !-[ASDStream isPhysicalFormatSettable](self, "isPhysicalFormatSettable"))
    return 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v16 = -[ASDStreamFormat initWithAudioStreamBasicDescription:]([ASDStreamFormat alloc], "initWithAudioStreamBasicDescription:", a7);
  -[ASDStream physicalFormat](self, "physicalFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ASDStreamFormat isEqual:](v16, "isEqual:", v17);

  *((_BYTE *)v28 + 24) = v18;
  if (v18)
  {
    v19 = 1;
  }
  else
  {
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__ASDStream_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
    block[3] = &unk_24DBCA8C8;
    block[4] = self;
    v26 = &v27;
    v22 = v16;
    v25 = v22;
    dispatch_sync(physicalFormatQueue, block);

    if (*((_BYTE *)v28 + 24))
      v19 = -[ASDStream changePhysicalFormat:](self, "changePhysicalFormat:", v22);
    else
      v19 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __84__ASDStream_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isCompatible:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7), (_QWORD)v8);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)addPhysicalFormat:(id)a3
{
  id v4;
  NSObject *physicalFormatQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ASDStream *v15;
  id v16;

  v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  block = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __31__ASDStream_addPhysicalFormat___block_invoke;
  v14 = &unk_24DBCA438;
  v15 = self;
  v16 = v4;
  v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6270667461, v10, block, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6273666D61, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

}

void __31__ASDStream_addPhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v7 = (id)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "addObject:", v7);

}

- (void)removePhysicalFormat:(id)a3
{
  id v4;
  NSObject *physicalFormatQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  ASDStream *v15;
  id v16;

  v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  block = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __34__ASDStream_removePhysicalFormat___block_invoke;
  v14 = &unk_24DBCA438;
  v15 = self;
  v16 = v4;
  v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6270667461, v10, block, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6273666D61, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

}

uint64_t __34__ASDStream_removePhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)setPhysicalFormats:(id)a3
{
  id v4;
  NSObject *physicalFormatQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ASDStream *v15;
  id v16;

  v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  block = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __32__ASDStream_setPhysicalFormats___block_invoke;
  v14 = &unk_24DBCA438;
  v15 = self;
  v16 = v4;
  v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6270667461, v10, block, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6273666D61, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

}

void __32__ASDStream_setPhysicalFormats___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (NSArray)physicalFormats
{
  NSObject *physicalFormatQueue;
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
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  physicalFormatQueue = self->_physicalFormatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__ASDStream_physicalFormats__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(physicalFormatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __28__ASDStream_physicalFormats__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (ASDStreamFormat)physicalFormat
{
  NSObject *physicalFormatQueue;
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
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  physicalFormatQueue = self->_physicalFormatQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__ASDStream_physicalFormat__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(physicalFormatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDStreamFormat *)v3;
}

void __27__ASDStream_physicalFormat__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  NSObject *physicalFormatQueue;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ASDStream *v15;
  id v16;

  v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  block = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __31__ASDStream_setPhysicalFormat___block_invoke;
  v14 = &unk_24DBCA438;
  v15 = self;
  v16 = v4;
  v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6270667420, v10, block, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

  LODWORD(v10) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6273666D74, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

}

void __31__ASDStream_setPhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void)addControl:(id)a3
{
  id v4;
  NSObject *controlQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__ASDStream_addControl___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(controlQueue, block);
  objc_msgSend(v6, "setOwner:", self);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "lrtcbolg");
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __24__ASDStream_addControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeControl:(id)a3
{
  id v4;
  NSObject *controlQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__ASDStream_removeControl___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(controlQueue, block);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "lrtcbolg");
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __27__ASDStream_removeControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)controls
{
  NSObject *controlQueue;
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
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__ASDStream_controls__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __21__ASDStream_controls__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setIsActive:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_isActive = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6273616374, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  NSString *v4;
  NSString *streamName;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  streamName = self->_streamName;
  self->_streamName = v4;

  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626C6E616DLL, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (void)setLatency:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_latency = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626C746E63, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (void)setIsTapStream:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_isTapStream = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6274617073, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (BOOL)isTapStream
{
  return self->_isTapStream;
}

- (unsigned)latency
{
  return self->_latency;
}

- (void)startStream
{
  void *v3;
  void *v4;
  id readInputBlock;
  void *v6;
  void *v7;
  id convertInputBlock;
  void *v9;
  void *v10;
  id processInputBlock;
  void *v12;
  void *v13;
  id processOutputBlock;
  void *v15;
  void *v16;
  id mixOutputBlock;
  void *v18;
  void *v19;
  id processMixBlock;
  void *v21;
  void *v22;
  id convertMixBlock;
  void *v24;
  void *v25;
  id writeMixBlock;
  void *v27;
  void *v28;
  id readIsolatedInputBlock;

  -[ASDStream readInputBlock](self, "readInputBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  readInputBlock = self->_readInputBlock;
  self->_readInputBlock = v4;

  self->_readInputBlockUnretained = self->_readInputBlock;
  -[ASDStream convertInputBlock](self, "convertInputBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  convertInputBlock = self->_convertInputBlock;
  self->_convertInputBlock = v7;

  self->_convertInputBlockUnretained = self->_convertInputBlock;
  -[ASDStream processInputBlock](self, "processInputBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  processInputBlock = self->_processInputBlock;
  self->_processInputBlock = v10;

  self->_processInputBlockUnretained = self->_processInputBlock;
  -[ASDStream processOutputBlock](self, "processOutputBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  processOutputBlock = self->_processOutputBlock;
  self->_processOutputBlock = v13;

  self->_processOutputBlockUnretained = self->_processOutputBlock;
  -[ASDStream mixOutputBlock](self, "mixOutputBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  mixOutputBlock = self->_mixOutputBlock;
  self->_mixOutputBlock = v16;

  self->_mixOutputBlockUnretained = self->_mixOutputBlock;
  -[ASDStream processMixBlock](self, "processMixBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  processMixBlock = self->_processMixBlock;
  self->_processMixBlock = v19;

  self->_processMixBlockUnretained = self->_processMixBlock;
  -[ASDStream convertMixBlock](self, "convertMixBlock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  convertMixBlock = self->_convertMixBlock;
  self->_convertMixBlock = v22;

  self->_convertMixBlockUnretained = self->_convertMixBlock;
  -[ASDStream writeMixBlock](self, "writeMixBlock");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  writeMixBlock = self->_writeMixBlock;
  self->_writeMixBlock = v25;

  self->_writeMixBlockUnretained = self->_writeMixBlock;
  -[ASDStream readIsolatedInputBlock](self, "readIsolatedInputBlock");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_readIsolatedInputBlock = v28;

  self->_readIsolatedInputBlockUnretained = self->_readIsolatedInputBlock;
}

- (void)stopStream
{
  id readInputBlock;
  id convertInputBlock;
  id processInputBlock;
  id processOutputBlock;
  id mixOutputBlock;
  id processMixBlock;
  id convertMixBlock;
  id writeMixBlock;
  id readIsolatedInputBlock;

  readInputBlock = self->_readInputBlock;
  self->_readInputBlock = 0;

  self->_readInputBlockUnretained = 0;
  convertInputBlock = self->_convertInputBlock;
  self->_convertInputBlock = 0;

  self->_convertInputBlockUnretained = 0;
  processInputBlock = self->_processInputBlock;
  self->_processInputBlock = 0;

  self->_processInputBlockUnretained = 0;
  processOutputBlock = self->_processOutputBlock;
  self->_processOutputBlock = 0;

  self->_processOutputBlockUnretained = 0;
  mixOutputBlock = self->_mixOutputBlock;
  self->_mixOutputBlock = 0;

  self->_mixOutputBlockUnretained = 0;
  processMixBlock = self->_processMixBlock;
  self->_processMixBlock = 0;

  self->_processMixBlockUnretained = 0;
  convertMixBlock = self->_convertMixBlock;
  self->_convertMixBlock = 0;

  self->_convertMixBlockUnretained = 0;
  writeMixBlock = self->_writeMixBlock;
  self->_writeMixBlock = 0;

  self->_writeMixBlockUnretained = 0;
  readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_readIsolatedInputBlock = 0;

  self->_readIsolatedInputBlockUnretained = 0;
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  NSObject *physicalFormatQueue;
  uint8_t v6[8];
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  physicalFormatQueue = self->_physicalFormatQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ASDStream_deviceChangedToSamplingRate___block_invoke;
  block[3] = &unk_24DBCA578;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(physicalFormatQueue, block);
  if (v9[5])
  {
    -[ASDStream setPhysicalFormat:](self, "setPhysicalFormat:");
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Device changed to a sample rate that the stream does not have a physical format supporting it", v6, 2u);
  }
  _Block_object_dispose(&v8, 8);

  return 1;
}

void __41__ASDStream_deviceChangedToSamplingRate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
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
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  objc_msgSend(v3, "setSampleRate:", *(double *)(a1 + 48));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(v3, "isCompatible:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v15 = *(double *)(a1 + 48);
          objc_msgSend(v14, "minimumSampleRate", (_QWORD)v26);
          if (vabdd_f64(v15, v16) >= 0.001)
          {
            v17 = *(double *)(a1 + 48);
            objc_msgSend(v14, "maximumSampleRate");
            if (vabdd_f64(v17, v18) >= 0.001)
            {
              v19 = *(double *)(a1 + 48);
              objc_msgSend(v14, "minimumSampleRate");
              if (v19 <= v20)
                continue;
              v21 = *(double *)(a1 + 48);
              objc_msgSend(v14, "maximumSampleRate");
              if (v21 >= v22)
                continue;
            }
          }
          v23 = objc_msgSend(v14, "copy");
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v25 = *(void **)(v24 + 40);
          *(_QWORD *)(v24 + 40) = v23;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMaximumSampleRate:", *(double *)(a1 + 48));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMinimumSampleRate:", *(double *)(a1 + 48));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSampleRate:", *(double *)(a1 + 48));
          goto LABEL_25;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_25:

  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)changePhysicalFormat:(id)a3
{
  return 0;
}

- (id)channelNumberForChannelIndex:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), -[ASDStream startingChannel](self, "startingChannel") + a3);
}

- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4
{
  a3->mChannelLabel = -1;
  *(_QWORD *)&a3->mCoordinates[1] = 0;
  *(_QWORD *)&a3->mChannelFlags = 0;
}

- (void)setReadInputBlock:(id)a3
{
  void *v4;
  id readInputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  readInputBlock = self->_readInputBlock;
  self->_readInputBlock = v4;

  self->_readInputBlockUnretained = self->_readInputBlock;
}

- (void)setConvertInputBlock:(id)a3
{
  void *v4;
  id convertInputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  convertInputBlock = self->_convertInputBlock;
  self->_convertInputBlock = v4;

  self->_convertInputBlockUnretained = self->_convertInputBlock;
}

- (void)setProcessInputBlock:(id)a3
{
  void *v4;
  id processInputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  processInputBlock = self->_processInputBlock;
  self->_processInputBlock = v4;

  self->_processInputBlockUnretained = self->_processInputBlock;
}

- (void)setProcessOutputBlock:(id)a3
{
  void *v4;
  id processOutputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  processOutputBlock = self->_processOutputBlock;
  self->_processOutputBlock = v4;

  self->_processOutputBlockUnretained = self->_processOutputBlock;
}

- (void)setMixOutputBlock:(id)a3
{
  void *v4;
  id mixOutputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  mixOutputBlock = self->_mixOutputBlock;
  self->_mixOutputBlock = v4;

  self->_mixOutputBlockUnretained = self->_mixOutputBlock;
}

- (void)setProcessMixBlock:(id)a3
{
  void *v4;
  id processMixBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  processMixBlock = self->_processMixBlock;
  self->_processMixBlock = v4;

  self->_processMixBlockUnretained = self->_processMixBlock;
}

- (void)setConvertMixBlock:(id)a3
{
  void *v4;
  id convertMixBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  convertMixBlock = self->_convertMixBlock;
  self->_convertMixBlock = v4;

  self->_convertMixBlockUnretained = self->_convertMixBlock;
}

- (void)setWriteMixBlock:(id)a3
{
  void *v4;
  id writeMixBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  writeMixBlock = self->_writeMixBlock;
  self->_writeMixBlock = v4;

  self->_writeMixBlockUnretained = self->_writeMixBlock;
}

- (void)setReadIsolatedInputBlock:(id)a3
{
  void *v4;
  id readIsolatedInputBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_readIsolatedInputBlock = v4;

  self->_readIsolatedInputBlockUnretained = self->_readIsolatedInputBlock;
}

- (id)readInputBlockUnretainedPtr
{
  return &self->_readInputBlockUnretained;
}

- (id)convertInputBlockUnretainedPtr
{
  return &self->_convertInputBlockUnretained;
}

- (id)processInputBlockUnretainedPtr
{
  return &self->_processInputBlockUnretained;
}

- (id)processOutputBlockUnretainedPtr
{
  return &self->_processOutputBlockUnretained;
}

- (id)mixOutputBlockUnretainedPtr
{
  return &self->_mixOutputBlockUnretained;
}

- (id)processMixBlockUnretainedPtr
{
  return &self->_processMixBlockUnretained;
}

- (id)convertMixBlockUnretainedPtr
{
  return &self->_convertMixBlockUnretained;
}

- (id)writeMixBlockUnretainedPtr
{
  return &self->_writeMixBlockUnretained;
}

- (id)readIsolatedInputBlockUnretainedPtr
{
  return &self->_readIsolatedInputBlockUnretained;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v49;
  ASDStream *v50;
  void *v51;
  id obj;
  _BOOL4 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)ASDStream;
  v53 = v4;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v63, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDStream streamName](self, "streamName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  if (-[ASDStream isActive](self, "isActive"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v10);
  v11 = -[ASDStream direction](self, "direction");
  v12 = CFSTR("Output");
  if (v11 == 1768845428)
    v12 = CFSTR("Input");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Direction: %@\n"), v6, v12);
  if (-[ASDStream isTapStream](self, "isTapStream"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Tap Stream: %@\n"), v6, v13);
  v14 = -[ASDStream terminalType](self, "terminalType");
  LODWORD(v15) = BYTE3(v14);
  v16 = 32;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  if ((((_DWORD)v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = BYTE2(v14);
  if ((((_DWORD)v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v18 = 32;
  else
    v18 = BYTE1(v14);
  if ((_DWORD)v14 << 24 == 2130706432 || (_DWORD)v14 << 24 < 520093697)
    v20 = 32;
  else
    v20 = v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Terminal Type: %c%c%c%c (0x%08x)\n"), v6, v15, v17, v18, v20, v14);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Starting Channel: %u\n"), v6, -[ASDStream startingChannel](self, "startingChannel"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Latency: %u\n"), v6, -[ASDStream latency](self, "latency"));
  -[ASDStream physicalFormat](self, "physicalFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Physical Format\n"), v6);
  objc_msgSend(v21, "sampleRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Sample Rate: %f\n"), v6, v22);
  if ((int)objc_msgSend(v21, "formatID") >= 0x20000000)
  {
    if ((int)objc_msgSend(v21, "formatID") > 2130706431)
      v16 = 32;
    else
      v16 = ((int)objc_msgSend(v21, "formatID") >> 24);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 8) < 0x20000000
    || (int)(objc_msgSend(v21, "formatID") << 8) > 2130706431)
  {
    v23 = 32;
  }
  else
  {
    v23 = ((int)(objc_msgSend(v21, "formatID") << 8) >> 24);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 16) < 0x20000000
    || (int)(objc_msgSend(v21, "formatID") << 16) > 2130706431)
  {
    v24 = 32;
  }
  else
  {
    v24 = ((__int16)objc_msgSend(v21, "formatID") >> 8);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 24) < 520093697
    || objc_msgSend(v21, "formatID") == 127)
  {
    v25 = 32;
  }
  else
  {
    v25 = (char)objc_msgSend(v21, "formatID");
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format ID: %c%c%c%c\n"), v6, v16, v23, v24, v25);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format Flags: 0x%08x\n"), v6, objc_msgSend(v21, "formatFlags"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Packet: %u\n"), v6, objc_msgSend(v21, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Frames Per Packet: %u\n"), v6, objc_msgSend(v21, "framesPerPacket"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Frame: %u\n"), v6, objc_msgSend(v21, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Channels Per Frame: %u\n"), v6, objc_msgSend(v21, "channelsPerFrame"));
  v49 = v21;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bits Per Channel: %u\n"), v6, objc_msgSend(v21, "bitsPerChannel"));
  v51 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Physical Format\n"), v6);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = self;
  -[ASDStream physicalFormats](self, "physicalFormats");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v54 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v60 != v54)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@%u: Physical Format\n"), v8, v28 + i);
        objc_msgSend(v30, "sampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Sample Rate: %f\n"), v8, v31);
        if ((int)objc_msgSend(v30, "formatID") < 0x20000000 || (int)objc_msgSend(v30, "formatID") > 2130706431)
          v32 = 32;
        else
          v32 = ((int)objc_msgSend(v30, "formatID") >> 24);
        if ((int)(objc_msgSend(v30, "formatID") << 8) < 0x20000000
          || (int)(objc_msgSend(v30, "formatID") << 8) > 2130706431)
        {
          v33 = 32;
        }
        else
        {
          v33 = ((int)(objc_msgSend(v30, "formatID") << 8) >> 24);
        }
        if ((int)(objc_msgSend(v30, "formatID") << 16) < 0x20000000
          || (int)(objc_msgSend(v30, "formatID") << 16) > 2130706431)
        {
          v34 = 32;
        }
        else
        {
          v34 = ((__int16)objc_msgSend(v30, "formatID") >> 8);
        }
        if ((int)(objc_msgSend(v30, "formatID") << 24) < 520093697
          || objc_msgSend(v30, "formatID") == 127)
        {
          v35 = 32;
        }
        else
        {
          v35 = (char)objc_msgSend(v30, "formatID");
        }
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format ID: %c%c%c%c\n"), v8, v32, v33, v34, v35);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format Flags: 0x%08x\n"), v8, objc_msgSend(v30, "formatFlags"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Packet: %u\n"), v8, objc_msgSend(v30, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Frames Per Packet: %u\n"), v8, objc_msgSend(v30, "framesPerPacket"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Frame: %u\n"), v8, objc_msgSend(v30, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Channels Per Frame: %u\n"), v8, objc_msgSend(v30, "channelsPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bits Per Channel: %u\n"), v8, objc_msgSend(v30, "bitsPerChannel"));
        objc_msgSend(v30, "minimumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Minimum Sample Rate: %f\n"), v8, v36);
        objc_msgSend(v30, "maximumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Maximum Sample Rate: %f\n"), v8, v37);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      v28 = (v28 + i);
    }
    while (v27);
  }

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v51);
  -[ASDStream controls](v50, "controls");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[ASDStream controls](v50, "controls");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v56 != v44)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          if (v53)
          {
            objc_msgSend(v46, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v47);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v51, v43 + j, objc_msgSend(v46, "objectID"));
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        v43 = (v43 + j);
      }
      while (v42);
    }

  }
  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioStream");
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (unsigned)direction
{
  return self->_direction;
}

- (void)setDirection:(unsigned int)a3
{
  self->_direction = a3;
}

- (unsigned)startingChannel
{
  return self->_startingChannel;
}

- (void)setStartingChannel:(unsigned int)a3
{
  self->_startingChannel = a3;
}

- (BOOL)isPhysicalFormatSettable
{
  return self->_physicalFormatSettable;
}

- (void)setPhysicalFormatSettable:(BOOL)a3
{
  self->_physicalFormatSettable = a3;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (void)setTerminalType:(unsigned int)a3
{
  self->_terminalType = a3;
}

- (id)readInputBlock
{
  return self->_readInputBlock;
}

- (id)convertInputBlock
{
  return self->_convertInputBlock;
}

- (id)processInputBlock
{
  return self->_processInputBlock;
}

- (id)processOutputBlock
{
  return self->_processOutputBlock;
}

- (id)mixOutputBlock
{
  return self->_mixOutputBlock;
}

- (id)processMixBlock
{
  return self->_processMixBlock;
}

- (id)convertMixBlock
{
  return self->_convertMixBlock;
}

- (id)writeMixBlock
{
  return self->_writeMixBlock;
}

- (id)readIsolatedInputBlock
{
  return self->_readIsolatedInputBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readIsolatedInputBlock, 0);
  objc_storeStrong(&self->_writeMixBlock, 0);
  objc_storeStrong(&self->_convertMixBlock, 0);
  objc_storeStrong(&self->_processMixBlock, 0);
  objc_storeStrong(&self->_mixOutputBlock, 0);
  objc_storeStrong(&self->_processOutputBlock, 0);
  objc_storeStrong(&self->_processInputBlock, 0);
  objc_storeStrong(&self->_convertInputBlock, 0);
  objc_storeStrong(&self->_readInputBlock, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_physicalFormatQueue, 0);
  objc_storeStrong((id *)&self->_physicalFormats, 0);
  objc_storeStrong((id *)&self->_physicalFormat, 0);
}

@end

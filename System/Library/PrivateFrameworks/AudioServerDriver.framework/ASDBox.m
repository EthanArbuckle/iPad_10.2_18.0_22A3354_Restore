@implementation ASDBox

- (ASDBox)initWithPlugin:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDBox initWithPlugin:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Do not call %@"), v6);

  return 0;
}

- (ASDBox)initWithBoxUID:(id)a3 withPlugin:(id)a4
{
  id v7;
  ASDBox *v8;
  ASDBox *v9;
  NSString **p_boxUID;
  NSMutableArray *v11;
  NSMutableArray *audioDevices;
  NSMutableArray *v13;
  NSMutableArray *clockDevices;
  void *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *deviceQueue;
  id v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *acquireQueue;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDBox;
  v8 = -[ASDObject initWithPlugin:](&v24, sel_initWithPlugin_, a4);
  v9 = v8;
  if (v8)
  {
    p_boxUID = &v8->_boxUID;
    objc_storeStrong((id *)&v8->_boxUID, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    audioDevices = v9->_audioDevices;
    v9->_audioDevices = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    clockDevices = v9->_clockDevices;
    v9->_clockDevices = v13;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.box.%@.devices"), v16, *p_boxUID);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    deviceQueue = v9->_deviceQueue;
    v9->_deviceQueue = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.box.%@.acquire"), v16, *p_boxUID);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = dispatch_queue_create((const char *)objc_msgSend(v20, "UTF8String"), 0);
    acquireQueue = v9->_acquireQueue;
    v9->_acquireQueue = (OS_dispatch_queue *)v21;

    -[ASDObject setupDiagnosticStateDumpHandlerWithTreeWalk:](v9, "setupDiagnosticStateDumpHandlerWithTreeWalk:", 0);
  }

  return v9;
}

- (unsigned)objectClass
{
  return 1633841016;
}

- (unsigned)transportType
{
  return 0;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  signed int mSelector;
  BOOL result;
  int v6;
  objc_super v7;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  result = 1;
  if ((int)a3->mSelector <= 1652060013)
  {
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860)
          return result;
        v6 = 1652060006;
      }
      else
      {
        if (mSelector == 1651013225)
          return result;
        v6 = 1651536495;
      }
    }
    else if (mSelector > 1651007860)
    {
      if (mSelector == 1651007861)
        return result;
      v6 = 1651010921;
    }
    else
    {
      if (mSelector == 1650682915)
        return result;
      v6 = 1650751011;
    }
    goto LABEL_27;
  }
  if (mSelector <= 1819111267)
  {
    if (mSelector > 1768187245)
    {
      if (mSelector == 1768187246)
        return -[ASDBox supportsIdentify](self, "supportsIdentify");
      v6 = 1819107691;
    }
    else
    {
      if (mSelector == 1652060014)
        return result;
      v6 = 1719105134;
    }
    goto LABEL_27;
  }
  if (mSelector <= 1836411235)
  {
    if (mSelector == 1819111268)
      return result;
    v6 = 1819173229;
    goto LABEL_27;
  }
  if (mSelector != 1836411236 && mSelector != 1936618861)
  {
    v6 = 1953653102;
LABEL_27:
    if (mSelector != v6)
    {
      v7.receiver = self;
      v7.super_class = (Class)ASDBox;
      return -[ASDObject hasProperty:](&v7, sel_hasProperty_);
    }
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  signed int mSelector;
  unsigned int v6;
  int v7;
  NSObject *deviceQueue;
  _QWORD *v9;
  int v10;
  objc_super v12;
  _QWORD block[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v6 = 8;
  if ((int)a3->mSelector <= 1652060013)
  {
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860)
          return v6;
        v7 = 1652060006;
      }
      else
      {
        if (mSelector == 1651013225)
          return 4;
        v7 = 1651536495;
      }
    }
    else
    {
      if (mSelector <= 1651007860)
      {
        if (mSelector == 1650682915)
        {
          v15 = 0;
          v16 = &v15;
          v17 = 0x2020000000;
          v18 = 0;
          deviceQueue = self->_deviceQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
          block[3] = &unk_24DBCA398;
          block[4] = self;
          block[5] = &v15;
          v9 = block;
        }
        else
        {
          if (mSelector != 1650751011)
            goto LABEL_35;
          v15 = 0;
          v16 = &v15;
          v17 = 0x2020000000;
          v18 = 0;
          deviceQueue = self->_deviceQueue;
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 3221225472;
          v14[2] = __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
          v14[3] = &unk_24DBCA398;
          v14[4] = self;
          v14[5] = &v15;
          v9 = v14;
        }
        dispatch_sync(deviceQueue, v9);
        v6 = 4 * *((_DWORD *)v16 + 6);
        _Block_object_dispose(&v15, 8);
        return v6;
      }
      if (mSelector == 1651007861)
        return 4;
      v7 = 1651010921;
    }
LABEL_30:
    if (mSelector == v7)
      return 4;
LABEL_35:
    v12.receiver = self;
    v12.super_class = (Class)ASDBox;
    return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v12, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  if (mSelector <= 1819111267)
  {
    if (mSelector > 1768187245)
    {
      if (mSelector != 1768187246)
      {
        v10 = 1819107691;
LABEL_26:
        if (mSelector != v10)
          goto LABEL_35;
        return v6;
      }
    }
    else if (mSelector != 1652060014)
    {
      v10 = 1719105134;
      goto LABEL_26;
    }
    return 4;
  }
  if (mSelector <= 1836411235)
  {
    if (mSelector == 1819111268)
      return v6;
    v10 = 1819173229;
    goto LABEL_26;
  }
  if (mSelector != 1836411236 && mSelector != 1936618861)
  {
    v7 = 1953653102;
    goto LABEL_30;
  }
  return v6;
}

uint64_t __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  ASDBox *v8;
  signed int mSelector;
  unsigned int v12;
  NSObject *deviceQueue;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD *v18;
  unsigned int v19;
  objc_super v21;
  _QWORD v22[8];
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD block[6];

  v8 = self;
  LOBYTE(self) = 0;
  if (a3 && a6 && a7)
  {
    mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1652060013)
    {
      if (mSelector > 1819111267)
      {
        if (mSelector <= 1836411235)
        {
          if (mSelector == 1819111268)
          {
            if (*a6 < 8)
              goto LABEL_70;
            -[ASDBox modelName](v8, "modelName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (mSelector != 1819173229)
              goto LABEL_72;
            if (*a6 < 8)
              goto LABEL_70;
            -[ASDBox boxName](v8, "boxName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          switch(mSelector)
          {
            case 1836411236:
              if (*a6 < 8)
                goto LABEL_70;
              -[ASDBox modelUID](v8, "modelUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1936618861:
              if (*a6 < 8)
                goto LABEL_70;
              -[ASDBox serialNumber](v8, "serialNumber");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              break;
            case 1953653102:
              if (*a6 >= 4)
              {
                v12 = -[ASDBox transportType](v8, "transportType");
LABEL_61:
                *(_DWORD *)a7 = v12;
                goto LABEL_62;
              }
              goto LABEL_70;
            default:
              goto LABEL_72;
          }
        }
LABEL_65:
        *(_QWORD *)a7 = v15;

        if (*(_QWORD *)a7)
          CFRetain(*(CFTypeRef *)a7);
        v19 = 8;
        goto LABEL_68;
      }
      if (mSelector > 1768187245)
      {
        if (mSelector == 1768187246)
        {
          if (*a6 >= 4)
          {
            LODWORD(self) = -[ASDBox supportsIdentify](v8, "supportsIdentify");
            if (!(_DWORD)self)
              return (char)self;
            v12 = -[ASDBox identify](v8, "identify");
            goto LABEL_61;
          }
          goto LABEL_70;
        }
        if (mSelector != 1819107691)
          goto LABEL_72;
        if (*a6 < 8)
          goto LABEL_70;
        -[ASDBox manufacturerName](v8, "manufacturerName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }
      if (mSelector != 1652060014)
      {
        if (mSelector != 1719105134)
          goto LABEL_72;
        if (*a6 < 8)
          goto LABEL_70;
        -[ASDBox firmwareVersion](v8, "firmwareVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }
      if (*a6 < 4)
        goto LABEL_70;
      -[ASDBox acquireQueue](v8, "acquireQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
      block[3] = &unk_24DBCA528;
      block[4] = v8;
      block[5] = a7;
      v18 = block;
LABEL_45:
      dispatch_sync(v16, v18);

LABEL_62:
      v19 = 4;
LABEL_68:
      *a6 = v19;
      goto LABEL_69;
    }
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860)
        {
          if (*a6 < 8)
            goto LABEL_70;
          -[ASDBox boxUID](v8, "boxUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_65;
        }
        if (mSelector != 1652060006)
          goto LABEL_72;
        if (*a6 < 4)
          goto LABEL_70;
        -[ASDBox acquireQueue](v8, "acquireQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
        v28[3] = &unk_24DBCA528;
        v28[4] = v8;
        v28[5] = a7;
        v18 = v28;
        goto LABEL_45;
      }
      if (mSelector == 1651013225)
      {
        if (*a6 >= 4)
        {
          v12 = -[ASDBox hasVideo](v8, "hasVideo");
          goto LABEL_61;
        }
        goto LABEL_70;
      }
      if (mSelector == 1651536495)
      {
        if (*a6 >= 4)
        {
          v12 = -[ASDBox requiresAuthentication](v8, "requiresAuthentication");
          goto LABEL_61;
        }
LABEL_70:
        LOBYTE(self) = 0;
        return (char)self;
      }
    }
    else
    {
      if (mSelector <= 1651007860)
      {
        if (mSelector == 1650682915)
        {
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v27 = 0;
          deviceQueue = v8->_deviceQueue;
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
          v22[3] = &unk_24DBCA3C0;
          v22[4] = v8;
          v22[5] = &v24;
          v22[6] = a6;
          v22[7] = a7;
          v14 = v22;
        }
        else
        {
          if (mSelector != 1650751011)
            goto LABEL_72;
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v27 = 0;
          deviceQueue = v8->_deviceQueue;
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
          v23[3] = &unk_24DBCA3C0;
          v23[4] = v8;
          v23[5] = &v24;
          v23[6] = a6;
          v23[7] = a7;
          v14 = v23;
        }
        dispatch_sync(deviceQueue, v14);
        *a6 = 4 * *((_DWORD *)v25 + 6);
        _Block_object_dispose(&v24, 8);
LABEL_69:
        LOBYTE(self) = 1;
        return (char)self;
      }
      if (mSelector == 1651007861)
      {
        if (*a6 >= 4)
        {
          v12 = -[ASDBox hasAudio](v8, "hasAudio");
          goto LABEL_61;
        }
        goto LABEL_70;
      }
      if (mSelector == 1651010921)
      {
        if (*a6 >= 4)
        {
          v12 = -[ASDBox hasMIDI](v8, "hasMIDI");
          goto LABEL_61;
        }
        goto LABEL_70;
      }
    }
LABEL_72:
    v21.receiver = v8;
    v21.super_class = (Class)ASDBox;
    LOBYTE(self) = -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v21, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return (char)self;
}

uint64_t __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "acquired");
  **(_DWORD **)(a1 + 40) = result;
  return result;
}

uint64_t __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "acquisitionFailure");
  **(_DWORD **)(a1 + 40) = result;
  return result;
}

void __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
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
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
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

void __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(uint64_t a1)
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
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
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
  _BOOL4 v5;
  objc_super v7;

  if (a3)
  {
    mSelector = a3->mSelector;
    if (a3->mSelector == 1652060014)
    {
      LOBYTE(v5) = -[ASDBox isAcquirable](self, "isAcquirable");
    }
    else if (mSelector == 1768187246)
    {
      LOBYTE(v5) = -[ASDBox canSetIdentify](self, "canSetIdentify");
    }
    else if (mSelector == 1819173229)
    {
      v5 = -[ASDBox canChangeBoxName](self, "canChangeBoxName");
      if (v5)
        LOBYTE(v5) = -[ASDBox acquired](self, "acquired");
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)ASDBox;
      LOBYTE(v5) = -[ASDObject isPropertySettable:](&v7, sel_isPropertySettable_);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  AudioObjectPropertySelector mSelector;
  BOOL v12;
  objc_super v13;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  if (a3->mSelector != 1652060014)
  {
    if (mSelector != 1768187246)
    {
      if (mSelector != 1819173229)
      {
        v13.receiver = self;
        v13.super_class = (Class)ASDBox;
        return -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v13, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
      }
      if (a6 == 8)
        return -[ASDBox changeBoxName:](self, "changeBoxName:", *(_QWORD *)a7, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
      return 0;
    }
    if (a6 == 4
      && -[ASDBox supportsIdentify](self, "supportsIdentify")
      && -[ASDBox canSetIdentify](self, "canSetIdentify"))
    {
      -[ASDBox identifyBox:](self, "identifyBox:", *(_DWORD *)a7 != 0);
      return 1;
    }
    return 0;
  }
  if (a6 != 4)
    return 0;
  v12 = 1;
  -[ASDBox acquireBox:fromHAL:](self, "acquireBox:fromHAL:", *(_DWORD *)a7 != 0, 1, a5);
  return v12;
}

- (void)addAudioDevice:(id)a3
{
  id v4;
  NSObject *deviceQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_addAudioDevice___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(deviceQueue, block);
  objc_msgSend(v6, "setOwner:", self);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "#vdbbolg");
  -[ASDObject plugin](self, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __25__ASDBox_addAudioDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addClockDevice:(id)a3
{
  id v4;
  NSObject *deviceQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_addClockDevice___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(deviceQueue, block);
  objc_msgSend(v6, "setOwner:", self);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "#lcbbolg");
  -[ASDObject plugin](self, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __25__ASDBox_addClockDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAudioDevice:(id)a3
{
  id v4;
  NSObject *deviceQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_removeAudioDevice___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(deviceQueue, block);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "#vdbbolg");
  -[ASDObject plugin](self, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __28__ASDBox_removeAudioDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeClockDevice:(id)a3
{
  id v4;
  NSObject *deviceQueue;
  id v6;
  void *v7;
  void *v8;
  char v9[9];
  char v10;
  __int16 v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_removeClockDevice___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(deviceQueue, block);
  v10 = 0;
  v11 = 0;
  strcpy(v9, "#lcbbolg");
  -[ASDObject plugin](self, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", v9, self);

  *(_DWORD *)v9 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedProperty:forObject:", v9, self);

}

uint64_t __28__ASDBox_removeClockDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllAudioDevices
{
  NSObject *deviceQueue;
  void *v4;
  void *v5;
  char v6[9];
  char v7;
  __int16 v8;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDBox_removeAllAudioDevices__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
  v7 = 0;
  v8 = 0;
  strcpy(v6, "#vdbbolg");
  -[ASDObject plugin](self, "plugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", v6, self);

  *(_DWORD *)v6 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedProperty:forObject:", v6, self);

}

uint64_t __31__ASDBox_removeAllAudioDevices__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (void)removeAllClockDevices
{
  NSObject *deviceQueue;
  void *v4;
  void *v5;
  char v6[9];
  char v7;
  __int16 v8;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDBox_removeAllClockDevices__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
  v7 = 0;
  v8 = 0;
  strcpy(v6, "#lcbbolg");
  -[ASDObject plugin](self, "plugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", v6, self);

  *(_DWORD *)v6 = 1870098020;
  -[ASDObject plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedProperty:forObject:", v6, self);

}

uint64_t __31__ASDBox_removeAllClockDevices__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

- (void)addDevicesToPlugin
{
  NSObject *deviceQueue;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_addDevicesToPlugin__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __28__ASDBox_addDevicesToPlugin__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAudioDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addClockDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

}

- (void)removeDevicesFromPlugin
{
  NSObject *deviceQueue;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ASDBox_removeDevicesFromPlugin__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __33__ASDBox_removeDevicesFromPlugin__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAudioDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

  objc_msgSend(*(id *)(a1 + 32), "plugin");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClockDevices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

}

- (NSString)boxName
{
  return self->_boxName;
}

- (void)setBoxName:(id)a3
{
  NSString *v4;
  NSString *boxName;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  boxName = self->_boxName;
  self->_boxName = v4;

  LODWORD(v8) = 0;
  -[ASDObject plugin](self, "plugin", 0x676C6F626C6E616DLL, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (BOOL)changeBoxName:(id)a3
{
  return 0;
}

- (void)setAcquired:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_acquired != a3)
  {
    self->_acquired = a3;
    LODWORD(v6) = 0;
    -[ASDObject plugin](self, "plugin", 0x676C6F6262786F6ELL, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

  }
}

- (BOOL)acquired
{
  return self->_acquired;
}

- (void)setAcquisitionFailure:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_acquisitionFailure != a3)
  {
    self->_acquisitionFailure = a3;
    if (a3)
    {
      LODWORD(v6) = 0;
      -[ASDObject plugin](self, "plugin", 0x676C6F6262786F66, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

    }
  }
}

- (int)acquisitionFailure
{
  return self->_acquisitionFailure;
}

- (void)setIdentify:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_identify != a3)
  {
    self->_identify = a3;
    LODWORD(v6) = 0;
    -[ASDObject plugin](self, "plugin", 0x676C6F626964656ELL, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

  }
}

- (BOOL)identify
{
  return self->_identify;
}

- (BOOL)acquireBox:(BOOL)a3 fromHAL:(BOOL)a4
{
  return 0;
}

- (OS_dispatch_queue)acquireQueue
{
  return self->_acquireQueue;
}

- (NSArray)audioDevices
{
  NSObject *deviceQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  deviceQueue = self->_deviceQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__ASDBox_audioDevices__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(deviceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __22__ASDBox_audioDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)systemWillSleep
{
  NSObject *deviceQueue;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_systemWillSleep__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __25__ASDBox_systemWillSleep__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "systemWillSleep");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "systemWillSleep", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)systemHasPoweredOn
{
  NSObject *deviceQueue;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_systemHasPoweredOn__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __28__ASDBox_systemHasPoweredOn__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "systemHasPoweredOn");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "systemHasPoweredOn", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)keyPathsForValuesAffectingAcquireable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("acquirable"), 0);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  ASDBox *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v4 = a4;
  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)ASDBox;
  v66 = v4;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v75, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDBox boxName](self, "boxName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v8, "UTF8String"));

  -[ASDBox manufacturerName](self, "manufacturerName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASDBox modelName](self, "modelName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model Name: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASDBox serialNumber](self, "serialNumber");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Serial Number: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASDBox firmwareVersion](self, "firmwareVersion");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Firmware Version: %s\n"), v6, objc_msgSend(v12, "UTF8String"));

  -[ASDBox boxUID](self, "boxUID");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Box UID: %s\n"), v6, objc_msgSend(v13, "UTF8String"));

  -[ASDBox modelUID](self, "modelUID");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model UID: %s\n"), v6, objc_msgSend(v14, "UTF8String"));

  v15 = -[ASDBox transportType](self, "transportType");
  LODWORD(v16) = v15 >> 24;
  if ((v15 - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  LODWORD(v17) = v15 << 8 >> 24;
  if (((v15 << 8) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = v17;
  LODWORD(v18) = (__int16)v15 >> 8;
  if (((v15 << 16) - 0x20000000) >> 24 >= 0x5F)
    v18 = 32;
  else
    v18 = v18;
  if (v15 << 24 == 2130706432 || v15 << 24 < 520093697)
    v20 = 32;
  else
    v20 = (char)v15;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v16, v17, v18, v20);
  if (-[ASDBox hasAudio](self, "hasAudio"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has Audio: %@\n"), v6, v21);
  if (-[ASDBox hasVideo](self, "hasVideo"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has Video: %@\n"), v6, v22);
  if (-[ASDBox hasMIDI](self, "hasMIDI"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has MIDI: %@\n"), v6, v23);
  if (-[ASDBox requiresAuthentication](self, "requiresAuthentication"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Protected: %@\n"), v6, v24);
  if (-[ASDBox acquired](self, "acquired"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Acquired: %@\n"), v6, v25);
  if (-[ASDBox isAcquirable](self, "isAcquirable"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Acquirable: %@\n"), v6, v26);
  if (-[ASDBox supportsIdentify](self, "supportsIdentify"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Supports Identify: %@\n"), v6, v27);
  if (-[ASDBox canSetIdentify](self, "canSetIdentify"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Identify Settable: %@\n"), v6, v28);
  if (-[ASDBox canChangeBoxName](self, "canChangeBoxName"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Change Box Name: %@\n"), v6, v29);
  v30 = -[ASDBox acquisitionFailure](self, "acquisitionFailure");
  LODWORD(v31) = v30 >> 24;
  if ((v30 - 0x20000000) >> 24 >= 0x5F)
    v31 = 32;
  else
    v31 = v31;
  LODWORD(v32) = v30 << 8 >> 24;
  if (((v30 << 8) - 0x20000000) >> 24 >= 0x5F)
    v32 = 32;
  else
    v32 = v32;
  LODWORD(v33) = (__int16)v30 >> 8;
  if (((v30 << 16) - 0x20000000) >> 24 >= 0x5F)
    v33 = 32;
  else
    v33 = v33;
  if (v30 << 24 == 2130706432 || v30 << 24 < 520093697)
    v35 = 32;
  else
    v35 = (char)v30;
  v36 = v7;
  v37 = v6;
  objc_msgSend(v36, "appendFormat:", CFSTR("%@|    Acquisition Failure: %c%c%c%c\n"), v6, v31, v32, v33, v35);
  -[ASDBox audioDevices](self, "audioDevices");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v36;
  v64 = v38;
  if (objc_msgSend(v38, "count"))
  {
    v62 = self;
    objc_msgSend(v36, "appendFormat:", CFSTR("%@|    Device Objects:\n"), v37);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v40 = v38;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v72 != v44)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (v66)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "diagnosticDescriptionWithIndent:walkTree:", v65, 1);
            v47 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "appendString:", v47);
          }
          else
          {
            v48 = objc_msgSend(v46, "objectID");
            objc_msgSend(v46, "deviceUID");
            v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v60 = v48;
            v36 = v39;
            objc_msgSend(v39, "appendFormat:", CFSTR("%@|        %u: %u (%s)\n"), v37, v43 + i, v60, objc_msgSend(v47, "UTF8String"));
          }

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        v43 = (v43 + i);
      }
      while (v42);
    }

    self = v62;
    v38 = v64;
  }
  -[ASDBox clockDevices](self, "clockDevices");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "count"))
  {
    v63 = v49;
    objc_msgSend(v36, "appendFormat:", CFSTR("%@|    Clock Device Objects:\n"), v37);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v50 = v38;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v51)
    {
      v52 = v51;
      v53 = 0;
      v54 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v68 != v54)
            objc_enumerationMutation(v50);
          v56 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if (v66)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "diagnosticDescriptionWithIndent:walkTree:", v65, 1);
            v57 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "appendString:", v57);
          }
          else
          {
            v58 = objc_msgSend(v56, "objectID");
            objc_msgSend(v56, "deviceUID");
            v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v61 = v58;
            v36 = v39;
            objc_msgSend(v39, "appendFormat:", CFSTR("%@|        %u: %u (%s)\n"), v37, v53 + j, v61, objc_msgSend(v57, "UTF8String"));
          }

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        v53 = (v53 + j);
      }
      while (v52);
    }

    v49 = v63;
    v38 = v64;
  }

  return v36;
}

- (id)driverClassName
{
  return CFSTR("AudioBox");
}

- (NSString)boxUID
{
  return self->_boxUID;
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (BOOL)hasMIDI
{
  return self->_hasMIDI;
}

- (void)setHasMIDI:(BOOL)a3
{
  self->_hasMIDI = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (BOOL)supportsIdentify
{
  return self->_supportsIdentify;
}

- (void)setSupportsIdentify:(BOOL)a3
{
  self->_supportsIdentify = a3;
}

- (BOOL)canSetIdentify
{
  return self->_canSetIdentify;
}

- (void)setCanSetIdentify:(BOOL)a3
{
  self->_canSetIdentify = a3;
}

- (BOOL)isAcquirable
{
  return self->_acquirable;
}

- (void)setAcquirable:(BOOL)a3
{
  self->_acquirable = a3;
}

- (BOOL)canChangeBoxName
{
  return self->_canChangeBoxName;
}

- (void)setCanChangeBoxName:(BOOL)a3
{
  self->_canChangeBoxName = a3;
}

- (NSArray)clockDevices
{
  return &self->_clockDevices->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_boxUID, 0);
  objc_storeStrong((id *)&self->_acquireQueue, 0);
  objc_storeStrong((id *)&self->_boxName, 0);
  objc_storeStrong((id *)&self->_deviceQueue, 0);
  objc_storeStrong((id *)&self->_clockDevices, 0);
  objc_storeStrong((id *)&self->_audioDevices, 0);
}

@end

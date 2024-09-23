@implementation ASDClockDevice

- (ASDClockDevice)initWithPlugin:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDClockDevice initWithPlugin:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Do not call %@"), v6);

  return 0;
}

- (ASDClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v7;
  id v8;
  ASDClockDevice *v9;
  ASDClockDevice *v10;
  NSString **p_deviceUID;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *controls;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *controlQueue;
  NSArray *v19;
  NSArray *samplingRates;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *sampleRateQueue;
  id v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *ioReferenceQueue;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ASDClockDevice;
  v9 = -[ASDObject initWithPlugin:](&v28, sel_initWithPlugin_, v8);
  v10 = v9;
  if (v9)
  {
    v9->_isAlive = 1;
    v9->_transportType = 0;
    v9->_clockAlgorithm = 1768518246;
    v9->_clockIsStable = 1;
    p_deviceUID = &v9->_deviceUID;
    objc_storeStrong((id *)&v9->_deviceUID, a3);
    objc_storeWeak((id *)&v10->_configurationChangeDelegate, v8);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    controls = v10->_controls;
    v10->_controls = v14;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.controls"), v13, *p_deviceUID);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    controlQueue = v10->_controlQueue;
    v10->_controlQueue = (OS_dispatch_queue *)v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    samplingRates = v10->_samplingRates;
    v10->_samplingRates = v19;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.sampleRate"), v13, *p_deviceUID);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    sampleRateQueue = v10->_sampleRateQueue;
    v10->_sampleRateQueue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.device.%@.ioReference"), v13, *p_deviceUID);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = dispatch_queue_create((const char *)objc_msgSend(v24, "UTF8String"), 0);
    ioReferenceQueue = v10->_ioReferenceQueue;
    v10->_ioReferenceQueue = (OS_dispatch_queue *)v25;

    -[ASDObject setupDiagnosticStateDumpHandlerWithTreeWalk:](v10, "setupDiagnosticStateDumpHandlerWithTreeWalk:", 1);
  }

  return v10;
}

- (unsigned)objectClass
{
  return 1633905771;
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
  if ((int)a3->mSelector > 1819107690)
  {
    if (mSelector <= 1853059618)
    {
      if (mSelector > 1819569762)
      {
        if (mSelector == 1819569763)
          return result;
        v6 = 1836411236;
      }
      else
      {
        if (mSelector == 1819107691)
          return result;
        v6 = 1819173229;
      }
      goto LABEL_28;
    }
    if (mSelector <= 1919512166)
    {
      if (mSelector == 1853059619)
        return result;
      v6 = 1853059700;
      goto LABEL_28;
    }
    if (mSelector != 1919512167 && mSelector != 1935763060)
    {
      v6 = 1953653102;
LABEL_28:
      if (mSelector != v6)
      {
        v7.receiver = self;
        v7.super_class = (Class)ASDClockDevice;
        return -[ASDObject hasProperty:](&v7, sel_hasProperty_);
      }
    }
  }
  else
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795)
          return result;
        v6 = 1668510818;
      }
      else
      {
        if (mSelector == 1634429294)
          return result;
        v6 = 1668049764;
      }
      goto LABEL_28;
    }
    if (mSelector <= 1735354733)
    {
      if (mSelector == 1668575852)
        return result;
      v6 = 1668639076;
      goto LABEL_28;
    }
    if (mSelector != 1735354734 && mSelector != 1751737454)
    {
      v6 = 1818850926;
      goto LABEL_28;
    }
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  signed int mSelector;
  unsigned int v6;
  NSObject *sampleRateQueue;
  int v8;
  int v9;
  void *v10;
  NSObject *controlQueue;
  _QWORD *v12;
  objc_super v14;
  _QWORD v15[7];
  _QWORD v16[8];
  unsigned int v17;
  _QWORD block[6];
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v6 = 8;
  if ((int)a3->mSelector <= 1819107690)
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795)
          return 4;
        v8 = 1668510818;
      }
      else
      {
        if (mSelector == 1634429294)
        {
          v24 = 1633969526;
          v20 = *(_QWORD *)&a3->mSelector;
          LODWORD(v21) = a3->mElement;
          LODWORD(v20) = 1870098020;
          -[ASDObject owner](self, "owner");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v10, "dataSizeForProperty:withQualifierSize:andQualifierData:", &v20, 4, &v24);

          return v6;
        }
        v8 = 1668049764;
      }
      goto LABEL_34;
    }
    if (mSelector > 1735354733)
    {
      if (mSelector == 1735354734 || mSelector == 1751737454)
        return 4;
      v8 = 1818850926;
      goto LABEL_34;
    }
    if (mSelector != 1668575852)
    {
      v9 = 1668639076;
LABEL_25:
      if (mSelector == v9)
        return v6;
      goto LABEL_38;
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    controlQueue = self->_controlQueue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
    v19[3] = &unk_24DBCA578;
    v19[5] = &v20;
    v19[6] = a3;
    v19[4] = self;
    v12 = v19;
    goto LABEL_41;
  }
  if (mSelector > 1853059699)
  {
    if (mSelector > 1919512166)
    {
      if (mSelector == 1919512167 || mSelector == 1953653102)
        return 4;
      v8 = 1935763060;
LABEL_34:
      if (mSelector == v8)
        return 4;
LABEL_38:
      v14.receiver = self;
      v14.super_class = (Class)ASDClockDevice;
      return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v14, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    if (mSelector == 1853059700)
      return v6;
    if (mSelector != 1870098020)
      goto LABEL_38;
    if (a4)
    {
      if ((a4 & 3) != 0)
        return 0;
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      controlQueue = self->_controlQueue;
      v23 = 0;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v16[3] = &unk_24DBCA5A0;
      v17 = a4 >> 2;
      v16[6] = a5;
      v16[7] = a3;
      v16[4] = self;
      v16[5] = &v20;
      v12 = v16;
    }
    else
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      controlQueue = self->_controlQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4;
      v15[3] = &unk_24DBCA578;
      v15[5] = &v20;
      v15[6] = a3;
      v15[4] = self;
      v12 = v15;
    }
LABEL_41:
    dispatch_sync(controlQueue, v12);
    v6 = 4 * *((_DWORD *)v21 + 6);
    goto LABEL_42;
  }
  if (mSelector <= 1819569762)
  {
    if (mSelector == 1819107691)
      return v6;
    v9 = 1819173229;
    goto LABEL_25;
  }
  if (mSelector == 1819569763)
    return 4;
  if (mSelector != 1836411236)
  {
    if (mSelector == 1853059619)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      sampleRateQueue = self->_sampleRateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      block[3] = &unk_24DBCA398;
      block[4] = self;
      block[5] = &v20;
      dispatch_sync(sampleRateQueue, block);
      v6 = 16 * *((_DWORD *)v21 + 6);
LABEL_42:
      _Block_object_dispose(&v20, 8);
      return v6;
    }
    goto LABEL_38;
  }
  return v6;
}

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(_QWORD *a1)
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
  v3 = *(id *)(a1[4] + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "controlScope", (_QWORD)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
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
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
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

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4(_QWORD *a1)
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
  v3 = *(id *)(a1[4] + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "controlScope", (_QWORD)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  char v8;
  uint64_t v11;
  uint64_t v13;
  signed int mSelector;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  AudioObjectPropertyScope mScope;
  unsigned int v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v42;
  NSObject *controlQueue;
  _QWORD *v44;
  objc_super v45;
  _QWORD v46[9];
  _QWORD v47[10];
  unsigned int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[9];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  _BYTE v59[128];
  uint64_t v60;

  v8 = 0;
  v60 = *MEMORY[0x24BDAC8D0];
  if (!a3 || !a6 || !a7)
    return v8;
  v11 = *(_QWORD *)&a8;
  v13 = *(_QWORD *)&a4;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1819173228)
  {
    if (mSelector <= 1870098019)
    {
      if (mSelector <= 1836411235)
      {
        if (mSelector != 1819173229)
        {
          if (mSelector != 1819569763)
            goto LABEL_77;
          if (*a6 < 4)
            return 0;
          mScope = a3->mScope;
          if (mScope != 1869968496)
          {
            if (mScope == 1768845428)
              goto LABEL_41;
            if (mScope != 1735159650)
              goto LABEL_96;
            v25 = -[ASDClockDevice inputLatency](self, "inputLatency");
            if (v25 > -[ASDClockDevice outputLatency](self, "outputLatency"))
            {
LABEL_41:
              v23 = -[ASDClockDevice inputLatency](self, "inputLatency");
              goto LABEL_95;
            }
          }
          v23 = -[ASDClockDevice outputLatency](self, "outputLatency");
          goto LABEL_95;
        }
        if (*a6 < 8)
          return 0;
        -[ASDClockDevice deviceName](self, "deviceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (mSelector != 1836411236)
        {
          if (mSelector == 1853059619)
          {
            -[ASDClockDevice samplingRates](self, "samplingRates");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *a6;
            if (objc_msgSend(v26, "count") <= v27 >> 4)
              v28 = objc_msgSend(v26, "count");
            else
              v28 = (unint64_t)*a6 >> 4;
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v31 = v26;
            v32 = 0;
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v50;
              while (2)
              {
                for (i = 0; i != v33; ++i)
                {
                  if (*(_QWORD *)v50 != v34)
                    objc_enumerationMutation(v31);
                  if (v28 == v32)
                  {
                    LODWORD(v32) = v28;
                    goto LABEL_89;
                  }
                  objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "doubleValue");
                  *((int64x2_t *)a7 + v32++) = vdupq_lane_s64(v36, 0);
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
                if (v33)
                  continue;
                break;
              }
            }
LABEL_89:

            *a6 = 16 * v32;
            return 1;
          }
          if (mSelector != 1853059700)
            goto LABEL_77;
          if (*a6 < 8)
            return 0;
          -[ASDClockDevice samplingRate](self, "samplingRate");
          *(_QWORD *)a7 = v19;
LABEL_73:
          v30 = 8;
LABEL_97:
          *a6 = v30;
          return 1;
        }
        if (*a6 < 8)
          return 0;
        -[ASDClockDevice modelUID](self, "modelUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_71:
      *(_QWORD *)a7 = v20;

      if (*(_QWORD *)a7)
        CFRetain(*(CFTypeRef *)a7);
      goto LABEL_73;
    }
    if (mSelector > 1935763059)
    {
      if (mSelector != 1935763060)
      {
        if (mSelector == 1953653102)
        {
          if (*a6 >= 4)
          {
            v23 = -[ASDClockDevice transportType](self, "transportType");
            goto LABEL_95;
          }
          return 0;
        }
        if (mSelector == 1937007734)
        {
          if (*a6 >= 4)
          {
            *a6 = 4;
            -[ASDObject owner](self, "owner");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "owner");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)a7 = objc_msgSend(v22, "objectID");

            return 1;
          }
          return 0;
        }
        goto LABEL_77;
      }
      if (*a6 < 4)
        return 0;
      *(_DWORD *)a7 = 0;
      goto LABEL_96;
    }
    if (mSelector != 1870098020)
    {
      if (mSelector == 1919512167)
      {
        if (*a6 < 4)
          return 0;
        v23 = -[ASDClockDevice timestampPeriod](self, "timestampPeriod");
        goto LABEL_95;
      }
      goto LABEL_77;
    }
    if (a4)
    {
      if ((a4 & 3) != 0)
        return 0;
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v57 = 0;
      v39 = *a6;
      if (v39 >= -[ASDClockDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))v40 = -[ASDClockDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v13, a5);
      else
        v40 = *a6;
      v42 = v40 >> 2;
      if (v55[3] == v42)
      {
LABEL_107:
        v18 = 4 * v42;
        goto LABEL_108;
      }
      controlQueue = self->_controlQueue;
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
      v47[3] = &unk_24DBCA5F0;
      v48 = v13 >> 2;
      v47[6] = a5;
      v47[7] = a3;
      v47[4] = self;
      v47[5] = &v54;
      v47[8] = v42;
      v47[9] = a7;
      v44 = v47;
    }
    else
    {
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v57 = 0;
      v37 = *a6;
      if (v37 >= -[ASDClockDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5))v38 = -[ASDClockDevice dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5);
      else
        v38 = *a6;
      v42 = v38 >> 2;
      if (v55[3] == v42)
        goto LABEL_107;
      controlQueue = self->_controlQueue;
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      v46[3] = &unk_24DBCA5C8;
      v46[4] = self;
      v46[5] = &v54;
      v46[6] = a3;
      v46[7] = v42;
      v46[8] = a7;
      v44 = v46;
    }
    dispatch_sync(controlQueue, v44);
    LODWORD(v42) = *((_DWORD *)v55 + 6);
    goto LABEL_107;
  }
  if (mSelector > 1668639075)
  {
    if (mSelector <= 1751737453)
    {
      if (mSelector != 1668639076)
      {
        if (mSelector == 1735354734)
        {
          if (*a6 < 4)
            return 0;
          v23 = -[ASDClockDevice isRunning](self, "isRunning");
          goto LABEL_95;
        }
LABEL_77:
        v45.receiver = self;
        v45.super_class = (Class)ASDClockDevice;
        return -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v45, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
      }
      if (*a6 < 8)
        return 0;
      -[ASDClockDevice deviceUID](self, "deviceUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    }
    if (mSelector == 1751737454)
    {
      if (*a6 >= 4)
      {
        v23 = -[ASDClockDevice isHidden](self, "isHidden");
        goto LABEL_95;
      }
      return 0;
    }
    if (mSelector != 1818850926)
    {
      if (mSelector != 1819107691)
        goto LABEL_77;
      if (*a6 < 8)
        return 0;
      -[ASDClockDevice manufacturerName](self, "manufacturerName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    }
    if (*a6 < 4)
      return 0;
    *(_DWORD *)a7 = self->_isAlive;
LABEL_96:
    v30 = 4;
    goto LABEL_97;
  }
  if (mSelector > 1668050794)
  {
    if (mSelector != 1668050795)
    {
      if (mSelector != 1668510818)
      {
        if (mSelector == 1668575852)
        {
          v54 = 0;
          v55 = &v54;
          v56 = 0x2020000000;
          v17 = self->_controlQueue;
          v57 = 0;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_24DBCA5C8;
          block[6] = a6;
          block[7] = a3;
          block[4] = self;
          block[5] = &v54;
          block[8] = a7;
          dispatch_sync(v17, block);
          v18 = 4 * *((_DWORD *)v55 + 6);
LABEL_108:
          *a6 = v18;
          _Block_object_dispose(&v54, 8);
          return 1;
        }
        goto LABEL_77;
      }
      if (*a6 >= 4)
      {
        v23 = -[ASDClockDevice clockIsStable](self, "clockIsStable");
        goto LABEL_95;
      }
      return 0;
    }
    if (*a6 >= 4)
    {
      v23 = -[ASDClockDevice clockAlgorithm](self, "clockAlgorithm");
      goto LABEL_95;
    }
    return 0;
  }
  if (mSelector != 1634429294)
  {
    if (mSelector == 1668049764)
    {
      if (*a6 < 4)
        return 0;
      v23 = -[ASDClockDevice clockDomain](self, "clockDomain");
LABEL_95:
      *(_DWORD *)a7 = v23;
      goto LABEL_96;
    }
    goto LABEL_77;
  }
  v58 = 1633969526;
  v54 = *(_QWORD *)&a3->mSelector;
  LODWORD(v55) = a3->mElement;
  LODWORD(v54) = 1870098020;
  -[ASDObject owner](self, "owner");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v29, "getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", &v54, 4, &v58, a6, a7, v11);

  return v8;
}

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v3 = **(unsigned int **)(a1 + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") <= v3 >> 2)
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  else
    v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "controlScope", (_QWORD)v11) == *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4))
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == v4)
            goto LABEL_15;
          *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = objc_msgSend(v10, "objectID");
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
LABEL_15:

  objc_autoreleasePoolPop(v2);
}

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
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
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
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

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v3 = *(id *)(a1[4] + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "controlScope", (_QWORD)v9) == *(_DWORD *)(a1[6] + 4))
        {
          if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[7])
            goto LABEL_12;
          *(_DWORD *)(a1[8] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
LABEL_12:

  objc_autoreleasePoolPop(v2);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1853059700)
    return 1;
  if (a3->mSelector == 1819173229)
    return -[ASDClockDevice canChangeDeviceName](self, "canChangeDeviceName");
  v4.receiver = self;
  v4.super_class = (Class)ASDClockDevice;
  return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  AudioObjectPropertySelector mSelector;
  BOOL v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  double v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  if (!-[ASDClockDevice hasProperty:](self, "hasProperty:")
    || !-[ASDClockDevice isPropertySettable:](self, "isPropertySettable:", a3))
  {
    return 0;
  }
  mSelector = a3->mSelector;
  if (a3->mSelector != 1818850926)
  {
    if (mSelector == 1853059700)
    {
      if ((_DWORD)v10 == 8)
      {
        v18 = *(double *)a7;
        -[ASDClockDevice samplingRates](self, "samplingRates");
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "doubleValue");
              if (vabdd_f64(v18, v24) < 0.001)
              {

                v17 = -[ASDClockDevice changeSamplingRate:](self, "changeSamplingRate:", v18);
                goto LABEL_25;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v21)
              continue;
            break;
          }
        }

        v17 = 0;
LABEL_25:

        return v17;
      }
    }
    else
    {
      if (mSelector != 1819173229)
      {
        v25.receiver = self;
        v25.super_class = (Class)ASDClockDevice;
        return -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v25, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v12, a5, v10, a7, v8);
      }
      if ((_DWORD)v10 == 8)
        return -[ASDClockDevice changeDeviceName:](self, "changeDeviceName:", *(_QWORD *)a7);
    }
    return 0;
  }
  if ((_DWORD)v10 != 4)
    return 0;
  self->_isAlive = *(_DWORD *)a7 != 0;
  return 1;
}

- (void)addControl:(id)a3
{
  id v4;
  void *v5;
  NSObject *controlQueue;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ASDClockDevice *v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    block = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __29__ASDClockDevice_addControl___block_invoke;
    v15 = &unk_24DBCA438;
    v16 = self;
    v7 = v4;
    v17 = v7;
    dispatch_sync(controlQueue, &block);
    objc_msgSend(v7, "setOwner:", self);
    LODWORD(v11) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626374726CLL, v11, block, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v10, self);

    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626F776E64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v10, self);

  }
}

uint64_t __29__ASDClockDevice_addControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeControl:(id)a3
{
  id v4;
  void *v5;
  NSObject *controlQueue;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  ASDClockDevice *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    block = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __32__ASDClockDevice_removeControl___block_invoke;
    v14 = &unk_24DBCA438;
    v15 = self;
    v16 = v4;
    dispatch_sync(controlQueue, &block);
    LODWORD(v10) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626374726CLL, v10, block, v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changedProperty:forObject:", &v9, self);

    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626F776E64);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedProperty:forObject:", &v9, self);

  }
}

uint64_t __32__ASDClockDevice_removeControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__ASDClockDevice_controls__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__ASDClockDevice_controls__block_invoke(uint64_t a1)
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

- (void)requestConfigurationChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASDClockDevice configurationChangeDelegate](self, "configurationChangeDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestConfigurationChangeForDevice:withBlock:", self, v4);

}

- (void)performConfigurationChange:(void *)a3
{
  (*((void (**)(void *, SEL))a3 + 2))(a3, a2);

}

- (int)addClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)removeClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)startIOForClient:(unsigned int)a3
{
  NSObject *ioReferenceQueue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__ASDClockDevice_startIOForClient___block_invoke;
  v6[3] = &unk_24DBCA618;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASDClockDevice_startIOForClient___block_invoke(uint64_t a1)
{
  void *v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v2 = (void *)MEMORY[0x22073330C]();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "performStartIO");
    objc_autoreleasePoolPop(v2);
  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
}

- (int)stopIOForClient:(unsigned int)a3
{
  NSObject *ioReferenceQueue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__ASDClockDevice_stopIOForClient___block_invoke;
  v6[3] = &unk_24DBCA618;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__ASDClockDevice_stopIOForClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 104);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 104) = v4;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
    {
      v6 = (void *)MEMORY[0x22073330C]();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "performStopIO");
      objc_autoreleasePoolPop(v6);
    }
  }
}

- (int)performStartIO
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (-[ASDClockDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDClockDevice.m"), 845, CFSTR("performStartIO should only be called when IO is not running"));

  }
  self->_isRunning = 1;
  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62676F696ELL, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v7, self);

  return 0;
}

- (int)performStopIO
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[ASDClockDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDClockDevice.m"), 863, CFSTR("performStopIO should only be called when IO is running"));

  }
  self->_isRunning = 0;
  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62676F696ELL, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v7, self);

  return 0;
}

- (void)setSamplingRate:(double)a3
{
  NSObject *sampleRateQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[6];

  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDClockDevice_setSamplingRate___block_invoke;
  block[3] = &unk_24DBCA528;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737274, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

}

void __34__ASDClockDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22073330C]();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_updateTimestampPeriod:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSafetyOffsets:", *(double *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (double)samplingRate
{
  NSObject *sampleRateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ASDClockDevice_samplingRate__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __30__ASDClockDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 80);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  return 0;
}

- (void)setSamplingRates:(id)a3
{
  id v4;
  NSObject *sampleRateQueue;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t block;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  ASDClockDevice *v14;
  id v15;

  v4 = a3;
  sampleRateQueue = self->_sampleRateQueue;
  block = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __35__ASDClockDevice_setSamplingRates___block_invoke;
  v13 = &unk_24DBCA438;
  v14 = self;
  v15 = v4;
  v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737223, v9, block, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v8, self);

}

void __35__ASDClockDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v3;

  objc_autoreleasePoolPop(v2);
}

- (NSArray)samplingRates
{
  NSObject *sampleRateQueue;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__ASDClockDevice_samplingRates__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__ASDClockDevice_samplingRates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceName = self->_deviceName;
  self->_deviceName = v4;

  LODWORD(v8) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626C6E616DLL, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", &v7, self);

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)changeDeviceName:(id)a3
{
  return 0;
}

- (void)setTimestampPeriod:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_timestampPeriod != a3)
  {
    self->_timestampPeriod = a3;
    LODWORD(v6) = 0;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6272696E67, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

  }
}

- (unsigned)timestampPeriod
{
  return self->_timestampPeriod;
}

- (void)updateTimestampPeriod
{
  NSObject *sampleRateQueue;
  _QWORD block[5];

  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ASDClockDevice_updateTimestampPeriod__block_invoke;
  block[3] = &unk_24DBCA460;
  block[4] = self;
  dispatch_sync(sampleRateQueue, block);
}

void __39__ASDClockDevice_updateTimestampPeriod__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1 + 32), "_updateTimestampPeriod:", *(double *)(*(_QWORD *)(a1 + 32) + 80));
  objc_autoreleasePoolPop(v2);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)ioReferenceQueue
{
  return self->_ioReferenceQueue;
}

- (void)setInputLatency:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_inputLatency = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x696E70746C746E63, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)inputLatency
{
  return self->_inputLatency;
}

- (void)setOutputLatency:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_outputLatency = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x6F7574706C746E63, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)outputLatency
{
  return self->_outputLatency;
}

- (void)setClockDomain:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockDomain = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62636C6B64, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)clockDomain
{
  return self->_clockDomain;
}

- (void)setClockAlgorithm:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockAlgorithm = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F62636C6F6BLL, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)clockAlgorithm
{
  return self->_clockAlgorithm;
}

- (void)setClockIsStable:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_clockIsStable = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F6263737462, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (BOOL)clockIsStable
{
  return 1;
}

- (void)setTransportType:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_transportType = a3;
  LODWORD(v6) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F627472616ELL, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changedProperty:forObject:", &v5, self);

}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setGetZeroTimestampBlock:(id)a3
{
  void *v5;
  id getZeroTimestampBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDClockDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDClockDevice.m"), 1117, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
}

- (void)setBeginIOOperationBlock:(id)a3
{
  void *v5;
  id beginIOOperationBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDClockDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDClockDevice.m"), 1125, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_beginIOOperationBlock = v5;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
}

- (void)setEndIOOperationBlock:(id)a3
{
  void *v5;
  id endIOOperationBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASDClockDevice isRunning](self, "isRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDClockDevice.m"), 1132, CFSTR("Can't set block when IO is running"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  endIOOperationBlock = self->_endIOOperationBlock;
  self->_endIOOperationBlock = v5;

  self->_endIOOperationBlockUnretained = self->_endIOOperationBlock;
}

- (id)getZeroTimestampBlockUnretainedPtr
{
  return &self->_getZeroTimestampBlockUnretained;
}

- (id)beginIOOperationBlockUnretainedPtr
{
  return &self->_beginIOOperationBlockUnretained;
}

- (id)endIOOperationBlockUnretainedPtr
{
  return &self->_endIOOperationBlockUnretained;
}

- (void)systemWillSleep
{
  dispatch_semaphore_t v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_semaphore *wakeSemaphore;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  NSObject *v11;

  v3 = dispatch_semaphore_create(0);
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__ASDClockDevice_systemWillSleep__block_invoke;
  v9[3] = &unk_24DBCA438;
  v10 = v3;
  v5 = v4;
  v11 = v5;
  v6 = v3;
  -[ASDClockDevice requestConfigurationChange:](self, "requestConfigurationChange:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  wakeSemaphore = self->_wakeSemaphore;
  self->_wakeSemaphore = (OS_dispatch_semaphore *)v5;
  v8 = v5;

}

intptr_t __33__ASDClockDevice_systemWillSleep__block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)systemHasPoweredOn
{
  OS_dispatch_semaphore *wakeSemaphore;
  OS_dispatch_semaphore *v4;
  NSObject *v5;

  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    v5 = wakeSemaphore;
    dispatch_semaphore_signal(v5);
    v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;

  }
}

- (void)dealloc
{
  NSObject *wakeSemaphore;
  OS_dispatch_semaphore *v4;
  objc_super v5;

  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    dispatch_semaphore_signal(wakeSemaphore);
    v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ASDClockDevice;
  -[ASDObject dealloc](&v5, sel_dealloc);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unsigned int v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  _BOOL4 v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASDClockDevice;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v57, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDClockDevice deviceName](self, "deviceName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASDClockDevice manufacturerName](self, "manufacturerName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASDClockDevice modelName](self, "modelName");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model Name: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASDClockDevice deviceUID](self, "deviceUID");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device UID: %s\n"), v6, objc_msgSend(v12, "UTF8String"));

  -[ASDClockDevice modelUID](self, "modelUID");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model UID: %s\n"), v6, objc_msgSend(v13, "UTF8String"));

  v14 = -[ASDClockDevice transportType](self, "transportType");
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = ((__int16)v14 >> 8);
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697)
    v19 = 32;
  else
    v19 = (char)v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v15, v16, v17, v19);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Domain: 0x%08x\n"), v6, -[ASDClockDevice clockDomain](self, "clockDomain"));
  v20 = -[ASDClockDevice clockAlgorithm](self, "clockAlgorithm");
  v21 = CFSTR("12Pt Moving Window Average");
  if (v20 == 1768518246)
    v22 = CFSTR("Simple IIR");
  else
    v22 = CFSTR("Unknown");
  if (v20 != 1835103847)
    v21 = v22;
  if (v20 == 1918990199)
    v23 = CFSTR("Raw");
  else
    v23 = (__CFString *)v21;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Algorithm: %s\n"), v6, -[__CFString UTF8String](v23, "UTF8String"));
  if (-[ASDClockDevice clockIsStable](self, "clockIsStable"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Is Stable: %@\n"), v6, v24);
  if (self->_isAlive)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v25);
  if (-[ASDClockDevice isRunning](self, "isRunning"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Running: %@\n"), v6, v26);
  -[ASDClockDevice samplingRate](self, "samplingRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Nominal Sample Rate: %f\n"), v6, v27);
  v48 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Nominal Sample Rates:\n"), v6);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[ASDClockDevice samplingRates](self, "samplingRates");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v54 != v32)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "doubleValue");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Rate[%u]: %f\n"), v8, v31 + i, v34);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      v31 = (v31 + i);
    }
    while (v30);
  }

  v35 = -[ASDClockDevice isHidden](self, "isHidden");
  v36 = CFSTR("NO");
  if (v35)
    v36 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Hidden: %@\n"), v48, v36);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Latency: %u\n"), v48, -[ASDClockDevice inputLatency](self, "inputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Latency: %u\n"), v48, -[ASDClockDevice outputLatency](self, "outputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Zero Timestamp Period: %u\n"), v48, -[ASDClockDevice timestampPeriod](self, "timestampPeriod"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v48);
  -[ASDClockDevice controls](self, "controls");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[ASDClockDevice controls](self, "controls");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v40)
    {
      v41 = v40;
      v42 = 0;
      v43 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v50 != v43)
            objc_enumerationMutation(v39);
          v45 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if (v4)
          {
            objc_msgSend(v45, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v46);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v48, v42 + j, objc_msgSend(v45, "objectID"));
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        v42 = (v42 + j);
      }
      while (v41);
    }

  }
  return v7;
}

- (id)driverClassName
{
  return CFSTR("ClockDevice");
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)canChangeDeviceName
{
  return self->_canChangeDeviceName;
}

- (void)setCanChangeDeviceName:(BOOL)a3
{
  self->_canChangeDeviceName = a3;
}

- (id)getZeroTimestampBlock
{
  return self->_getZeroTimestampBlock;
}

- (id)beginIOOperationBlock
{
  return self->_beginIOOperationBlock;
}

- (id)endIOOperationBlock
{
  return self->_endIOOperationBlock;
}

- (ASDDeviceConfigurationChangeDelegate)configurationChangeDelegate
{
  return (ASDDeviceConfigurationChangeDelegate *)objc_loadWeakRetained((id *)&self->_configurationChangeDelegate);
}

- (void)setConfigurationChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configurationChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationChangeDelegate);
  objc_storeStrong(&self->_endIOOperationBlock, 0);
  objc_storeStrong(&self->_beginIOOperationBlock, 0);
  objc_storeStrong(&self->_getZeroTimestampBlock, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_wakeSemaphore, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ioReferenceQueue, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
}

@end

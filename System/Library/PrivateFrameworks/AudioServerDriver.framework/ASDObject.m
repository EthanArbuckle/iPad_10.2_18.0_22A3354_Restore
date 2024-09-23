@implementation ASDObject

- (ASDObject)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[ASDObject initWithPlugin:](self, "initWithPlugin:", 0);
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDObject init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Do not call %@"), v6);

  return 0;
}

- (ASDObject)initWithPlugin:(id)a3
{
  id v4;
  ASDObject *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *customProperties;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *customPropertyQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDObject;
  v5 = -[ASDObject init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "addCAObject:", v5);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_propertyChangedDelegate, v4);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    customProperties = v5->_customProperties;
    v5->_customProperties = v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.object.%u.customProperties"), v7, -[ASDObject objectID](v5, "objectID"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    customPropertyQueue = v5->_customPropertyQueue;
    v5->_customPropertyQueue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  BOOL v5;
  int v6;
  char v8;
  NSObject *customPropertyQueue;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  AudioObjectPropertySelector v17;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyElement mElement;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (a3)
  {
    mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      v5 = mSelector == 1650682995;
      v6 = 1668047219;
    }
    else
    {
      if (mSelector == 1668641652)
      {
        customPropertyQueue = self->_customPropertyQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __25__ASDObject_hasProperty___block_invoke;
        block[3] = &unk_24DBCA398;
        block[4] = self;
        block[5] = &v25;
        dispatch_sync(customPropertyQueue, block);
        goto LABEL_12;
      }
      v5 = mSelector == 1937007734;
      v6 = 1870098020;
    }
    if (v5 || mSelector == v6)
    {
      v28 = 1;
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[ASDObject customProperties](self, "customProperties", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      v13 = v12;
      if (v12)
      {
        v14 = *(_QWORD *)v21;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
            v17 = a3->mSelector;
            if (v17 == objc_msgSend(v16, "selector"))
            {
              mScope = a3->mScope;
              if (mScope == objc_msgSend(v16, "scope"))
              {
                mElement = a3->mElement;
                if (mElement == objc_msgSend(v16, "element"))
                {
                  *((_BYTE *)v26 + 24) = 1;

                  goto LABEL_12;
                }
              }
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
  }
LABEL_12:
  v8 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);
  return v8;
}

uint64_t __25__ASDObject_hasProperty___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  uint64_t v4;
  AudioObjectPropertySelector mSelector;
  BOOL v6;
  int v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  AudioObjectPropertySelector v15;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyElement mElement;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    LOBYTE(v4) = 0;
    mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      v6 = mSelector == 1650682995;
      v7 = 1668047219;
    }
    else
    {
      v6 = mSelector == 1668641652 || mSelector == 1870098020;
      v7 = 1937007734;
    }
    if (!v6 && mSelector != v7)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[ASDObject customProperties](self, "customProperties", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v4 = v11;
      if (v11)
      {
        v12 = *(_QWORD *)v19;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
            v15 = a3->mSelector;
            if (v15 == objc_msgSend(v14, "selector"))
            {
              mScope = a3->mScope;
              if (mScope == objc_msgSend(v14, "scope"))
              {
                mElement = a3->mElement;
                if (mElement == objc_msgSend(v14, "element"))
                {
                  LOBYTE(v4) = objc_msgSend(v14, "isSettable");
                  goto LABEL_27;
                }
              }
            }
            ++v13;
          }
          while (v4 != v13);
          v4 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v4)
            continue;
          break;
        }
      }
LABEL_27:

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  uint64_t v6;
  AudioObjectPropertySelector mSelector;
  int v9;
  NSObject *customPropertyQueue;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  AudioObjectPropertySelector v16;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyElement mElement;
  int v19;
  unsigned int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!a3)
    goto LABEL_23;
  v6 = *(_QWORD *)&a4;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1668641651)
  {
    if (mSelector == 1650682995)
    {
LABEL_9:
      v30 = 4;
      goto LABEL_23;
    }
    v9 = 1668047219;
  }
  else
  {
    if (mSelector == 1668641652)
    {
      customPropertyQueue = self->_customPropertyQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__ASDObject_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
      block[3] = &unk_24DBCA398;
      block[4] = self;
      block[5] = &v27;
      dispatch_sync(customPropertyQueue, block);
      goto LABEL_23;
    }
    if (mSelector == 1870098020)
      goto LABEL_23;
    v9 = 1937007734;
  }
  if (mSelector == v9)
    goto LABEL_9;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ASDObject customProperties](self, "customProperties", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = a3->mSelector;
        if (v16 == objc_msgSend(v15, "selector"))
        {
          mScope = a3->mScope;
          if (mScope == objc_msgSend(v15, "scope"))
          {
            mElement = a3->mElement;
            if (mElement == objc_msgSend(v15, "element"))
            {
              v19 = objc_msgSend(v15, "dataSizeWithQualifierSize:andQualifierData:", v6, a5);
              *((_DWORD *)v28 + 6) = v19;

              goto LABEL_23;
            }
          }
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v12)
        continue;
      break;
    }
  }

LABEL_23:
  v20 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return v20;
}

uint64_t __68__ASDObject_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 12 * result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  uint64_t v8;
  uint64_t v13;
  AudioObjectPropertySelector mSelector;
  id WeakRetained;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  AudioObjectPropertySelector v26;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyElement mElement;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  _DWORD *v38;
  unsigned int v40;
  const void *v41;
  unsigned int v42;
  unsigned int obj;
  id obja;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  LOBYTE(v8) = 0;
  v55 = *MEMORY[0x24BDAC8D0];
  if (!a3 || !a6 || !a7)
    return v8;
  v13 = *(_QWORD *)&a4;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1668641651)
  {
    switch(mSelector)
    {
      case 0x63757374u:
        v20 = *a6;
        if (*a6 >= 0xC)
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          -[ASDObject customProperties](self, "customProperties");
          obja = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v29)
          {
            v30 = v29;
            v31 = 0;
            v32 = *(_QWORD *)v50;
            v33 = 1 - v20 / 0xC;
            v40 = v33;
            v42 = v20 / 0xC;
            while (2)
            {
              v34 = 0;
              v35 = v31;
              v36 = v33 + v31;
              do
              {
                if (*(_QWORD *)v50 != v32)
                  objc_enumerationMutation(obja);
                v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v34);
                v38 = (char *)a7 + 12 * (v35 + v34);
                *v38 = objc_msgSend(v37, "selector");
                v38[1] = objc_msgSend(v37, "propertyDataType");
                v38[2] = objc_msgSend(v37, "qualifierDataType");
                if (!(v36 + (_DWORD)v34))
                {
                  v21 = v42;
                  goto LABEL_46;
                }
                ++v34;
              }
              while (v30 != v34);
              v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
              v31 = v35 + v34;
              v33 = v40;
              if (v30)
                continue;
              break;
            }
            v21 = v35 + v34;
          }
          else
          {
            v21 = 0;
          }
LABEL_46:

        }
        else
        {
          v21 = 0;
        }
        *a6 = 12 * v21;
        goto LABEL_48;
      case 0x6F776E64u:
        *a6 = 0;
        goto LABEL_48;
      case 0x73746476u:
        if (*a6 >= 4)
        {
          *a6 = 4;
          WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

          if (WeakRetained)
          {
            -[ASDObject owner](self, "owner");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)a7 = objc_msgSend(v18, "objectID");

LABEL_48:
            LOBYTE(v8) = 1;
            return v8;
          }
        }
        goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (mSelector == 1650682995)
  {
    if (*a6 >= 4)
    {
      *a6 = 4;
      v19 = -[ASDObject baseClass](self, "baseClass");
      goto LABEL_20;
    }
LABEL_21:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (mSelector == 1668047219)
  {
    if (*a6 >= 4)
    {
      *a6 = 4;
      v19 = -[ASDObject objectClass](self, "objectClass");
LABEL_20:
      *(_DWORD *)a7 = v19;
      goto LABEL_48;
    }
    goto LABEL_21;
  }
LABEL_22:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[ASDObject customProperties](self, "customProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v8)
  {
    v41 = a5;
    obj = a8;
    v23 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v22);
        v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v26 = a3->mSelector;
        if (v26 == objc_msgSend(v25, "selector"))
        {
          mScope = a3->mScope;
          if (mScope == objc_msgSend(v25, "scope"))
          {
            mElement = a3->mElement;
            if (mElement == objc_msgSend(v25, "element"))
            {
              LOBYTE(v8) = objc_msgSend(v25, "getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:", v13, v41, a6, a7, obj);
              goto LABEL_34;
            }
          }
        }
      }
      v8 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_34:

  return v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v14;
  AudioObjectPropertySelector mSelector;
  BOOL v16;
  int v17;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  AudioObjectPropertySelector v25;
  AudioObjectPropertyScope mScope;
  AudioObjectPropertyElement mElement;
  const void *v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v10 = *(_QWORD *)&a6;
    v12 = *(_QWORD *)&a4;
    LOBYTE(v14) = 0;
    mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      v16 = mSelector == 1650682995;
      v17 = 1668047219;
    }
    else
    {
      v16 = mSelector == 1668641652 || mSelector == 1870098020;
      v17 = 1937007734;
    }
    if (!v16 && mSelector != v17)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[ASDObject customProperties](self, "customProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v14 = v21;
      if (v21)
      {
        v28 = a7;
        v29 = a8;
        v22 = *(_QWORD *)v31;
        while (2)
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
            v25 = a3->mSelector;
            if (v25 == objc_msgSend(v24, "selector", v28))
            {
              mScope = a3->mScope;
              if (mScope == objc_msgSend(v24, "scope"))
              {
                mElement = a3->mElement;
                if (mElement == objc_msgSend(v24, "element"))
                {
                  if (objc_msgSend(v24, "isSettable"))
                    LOBYTE(v14) = objc_msgSend(v24, "setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:", v12, a5, v10, v28, v29);
                  else
                    LOBYTE(v14) = 0;
                  goto LABEL_29;
                }
              }
            }
            ++v23;
          }
          while (v14 != v23);
          v14 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_29:

    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (unsigned)baseClass
{
  return 1634689642;
}

- (unsigned)objectClass
{
  return 1634689642;
}

- (BOOL)isKindOfAudioClass:(unsigned int)a3
{
  return a3 == 1634689642
      || -[ASDObject baseClass](self, "baseClass") == a3
      || -[ASDObject objectClass](self, "objectClass") == a3;
}

- (void)addCustomProperty:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *customPropertyQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  _QWORD block[5];
  id v17;
  SEL v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "selector"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDObject.m"), 344, CFSTR("Custom property has 0 selector"));

    }
    objc_msgSend(v6, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDObject.m"), 345, CFSTR("Custom property is already attached to an object"));

    }
    if (objc_msgSend(v6, "propertyDataType") != 1667658612
      && objc_msgSend(v6, "propertyDataType") != 1886155636
      && objc_msgSend(v6, "propertyDataType") != 1918990199)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDObject.m"), 346, CFSTR("Unsupported property data type"));

    }
    if (objc_msgSend(v6, "qualifierDataType") != 1667658612
      && objc_msgSend(v6, "qualifierDataType") != 1886155636
      && objc_msgSend(v6, "qualifierDataType") != 1918990199
      && objc_msgSend(v6, "qualifierDataType"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDObject.m"), 347, CFSTR("Unsupported qualifier data type"));

    }
    objc_msgSend(v6, "setOwner:", self);
    customPropertyQueue = self->_customPropertyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__ASDObject_addCustomProperty___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v17 = v6;
    v18 = a2;
    dispatch_sync(customPropertyQueue, block);
    v15 = 0;
    v14 = 0x676C6F6263757374;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v14, self);

  }
}

uint64_t __31__ASDObject_addCustomProperty___block_invoke(_QWORD *a1)
{
  void *v3;

  if (objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ASDObject.m"), 352, CFSTR("Custom property already exists."));

  }
  return objc_msgSend(*(id *)(a1[4] + 8), "addObject:", a1[5]);
}

- (void)removeCustomProperty:(id)a3
{
  id v5;
  void *v6;
  NSObject *customPropertyQueue;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  _QWORD block[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    customPropertyQueue = self->_customPropertyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__ASDObject_removeCustomProperty___block_invoke;
    block[3] = &unk_24DBCA3E8;
    block[4] = self;
    v8 = v5;
    v13 = v8;
    v14 = a2;
    dispatch_sync(customPropertyQueue, block);
    objc_msgSend(v8, "setOwner:", 0);
    v11 = 0;
    v10 = 0x676C6F6263757374;
    -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedProperty:forObject:", &v10, self);

  }
}

uint64_t __34__ASDObject_removeCustomProperty___block_invoke(_QWORD *a1)
{
  void *v3;

  if ((objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("ASDObject.m"), 370, CFSTR("Custom property doesn't exist."));

  }
  return objc_msgSend(*(id *)(a1[4] + 8), "removeObject:", a1[5]);
}

- (NSArray)customProperties
{
  NSObject *customPropertyQueue;
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  customPropertyQueue = self->_customPropertyQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__ASDObject_customProperties__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(customPropertyQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__ASDObject_customProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setupDiagnosticStateDumpHandlerWithTreeWalk:(BOOL)a3
{
  void *v5;
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v6, &location);
  v7 = a3;
  self->_stateDumpHandler = os_state_add_handler();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

_DWORD *__57__ASDObject_setupDiagnosticStateDumpHandlerWithTreeWalk___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  _DWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    objc_msgSend(WeakRetained, "diagnosticDescriptionWithIndent:walkTree:", &stru_24DBCB510, *(unsigned __int8 *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "length");
      v10 = malloc_type_calloc(1uLL, v9 + 200, 0x566C1BF9uLL);
      if (v10)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "driverClassName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("AudioServerDriver %@ State:"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        *v10 = 1;
        v10[1] = v9;
        v14 = objc_retainAutorelease(v13);
        objc_msgSend(v14, "UTF8String");
        __strlcpy_chk();
        memcpy(v10 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v9);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;

  v5 = (void *)MEMORY[0x24BDD16A8];
  v6 = a3;
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDObject driverClassName](self, "driverClassName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@+%s\n"), v6, objc_msgSend(v8, "UTF8String"));

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Object ID: %u\n"), v6, -[ASDObject objectID](self, "objectID"));
  v9 = -[ASDObject baseClass](self, "baseClass");
  LODWORD(v10) = v9 >> 24;
  if ((v9 - 0x20000000) >> 24 >= 0x5F)
    v10 = 32;
  else
    v10 = v10;
  LODWORD(v11) = v9 << 8 >> 24;
  if (((v9 << 8) - 0x20000000) >> 24 >= 0x5F)
    v11 = 32;
  else
    v11 = v11;
  LODWORD(v12) = (__int16)v9 >> 8;
  if (((v9 << 16) - 0x20000000) >> 24 >= 0x5F)
    v12 = 32;
  else
    v12 = v12;
  if (v9 << 24 == 2130706432 || v9 << 24 < 520093697)
    v14 = 32;
  else
    v14 = (char)v9;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Base Class: %c%c%c%c\n"), v6, v10, v11, v12, v14);
  v15 = -[ASDObject objectClass](self, "objectClass");
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
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Object Class: %c%c%c%c\n"), v6, v16, v17, v18, v20);
  -[ASDObject owner](self, "owner");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Owner ID: %u\n"), v6, objc_msgSend(v21, "objectID"));

  return v7;
}

- (NSString)driverClassName
{
  return (NSString *)CFSTR("AudioObject");
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  if (self->_stateDumpHandler)
    os_state_remove_handler();
  WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  objc_msgSend(WeakRetained, "removeCAObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASDObject;
  -[ASDObject dealloc](&v4, sel_dealloc);
}

- (unsigned)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(unsigned int)a3
{
  self->_objectID = a3;
}

- (ASDObject)owner
{
  return (ASDObject *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (ASDPlugin)plugin
{
  return (ASDPlugin *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
  objc_storeWeak((id *)&self->_plugin, a3);
}

- (ASDPropertyChangedDelegate)propertyChangedDelegate
{
  return (ASDPropertyChangedDelegate *)objc_loadWeakRetained((id *)&self->_propertyChangedDelegate);
}

- (void)setPropertyChangedDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_propertyChangedDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_propertyChangedDelegate);
  objc_destroyWeak((id *)&self->_plugin);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_customPropertyQueue, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
}

@end

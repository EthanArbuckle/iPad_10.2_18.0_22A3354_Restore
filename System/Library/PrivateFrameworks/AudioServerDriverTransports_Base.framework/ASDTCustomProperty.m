@implementation ASDTCustomProperty

+ (id)customPropertyForConfig:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  v4 = (objc_class *)objc_msgSend(v3, "asdtSubclass");
  if (-[objc_class isSubclassOfClass:](v4, "isSubclassOfClass:", objc_opt_class())
    && (-[objc_class conformsToProtocol:](v4, "conformsToProtocol:", &unk_2564505E8) & 1) != 0)
  {
    v5 = (void *)objc_msgSend([v4 alloc], "initWithConfig:", v3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDTCustomProperty customPropertyForConfig:].cold.1(v3);
    v5 = 0;
  }

  return v5;
}

- (ASDTCustomProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  ASDTCustomProperty *v10;
  ASDTCustomProperty *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "asdtPropertyAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ASDTCustomProperty;
    v10 = -[ASDCustomProperty initWithAddress:propertyDataType:qualifierDataType:](&v13, sel_initWithAddress_propertyDataType_qualifierDataType_, v9, v6, v5);
    if (v10)
    {
      -[ASDCustomProperty setSettable:](v10, "setSettable:", objc_msgSend(v8, "asdtIsSettable"));
      -[ASDTCustomProperty setCacheMode:](v10, "setCacheMode:", objc_msgSend(v8, "asdtPropertyCacheMode"));
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)propertyName
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASDCustomProperty selector](self, "selector") >> 29
    && -[ASDCustomProperty selector](self, "selector") >> 24 <= 0x7E)
  {
    v6 = -[ASDCustomProperty selector](self, "selector") >> 24;
  }
  else
  {
    v6 = 32;
  }
  if ((-[ASDCustomProperty selector](self, "selector") & 0xE00000) != 0
    && (-[ASDCustomProperty selector](self, "selector") >> 16) <= 0x7Eu)
  {
    v7 = (-[ASDCustomProperty selector](self, "selector") >> 16);
  }
  else
  {
    v7 = 32;
  }
  if ((-[ASDCustomProperty selector](self, "selector") & 0xE000) != 0
    && ((unsigned __int16)-[ASDCustomProperty selector](self, "selector") >> 8) <= 0x7Eu)
  {
    v8 = ((unsigned __int16)-[ASDCustomProperty selector](self, "selector") >> 8);
  }
  else
  {
    v8 = 32;
  }
  if ((-[ASDCustomProperty selector](self, "selector") & 0xE0) != 0
    && -[ASDCustomProperty selector](self, "selector") <= 0x7Eu)
  {
    v9 = -[ASDCustomProperty selector](self, "selector");
  }
  else
  {
    v9 = 32;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%c%c%c%c)"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  NSString *name;
  NSString *v4;
  NSString *v5;

  name = self->_name;
  if (!name)
  {
    -[ASDTCustomProperty propertyName](self, "propertyName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }
  return name;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  unsigned int v5;
  unsigned int result;

  v5 = -[ASDCustomProperty propertyDataType](self, "propertyDataType", *(_QWORD *)&a3, a4);
  result = 8;
  if (v5 != 1667658612 && v5 != 1886155636)
  {
    if (v5 == 1918990199)
      return -[ASDTCustomProperty propertyValueSize](self, "propertyValueSize");
    else
      return 0;
  }
  return result;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  unsigned int v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  void *v26;

  v11 = -[ASDCustomProperty propertyDataType](self, "propertyDataType", *(_QWORD *)&a3, a4, a5, a6, *(_QWORD *)&a7);
  -[ASDTCustomProperty propertyValue](self, "propertyValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_9;
  switch(v11)
  {
    case 0x63667374u:
      goto LABEL_5;
    case 0x72617777u:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v16)
          -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTCustomProperty.m"), 130, CFSTR("inPropertyValue must be an NSData object"));

        }
      }
      v24 = v13;
      v25 = objc_msgSend(v24, "length");
      if (a5 && *a5 >= v25)
      {
        if (v25)
        {
          *a5 = v25;
          memcpy(a6, (const void *)objc_msgSend(objc_retainAutorelease(v24), "bytes"), v25);
          v14 = 1;
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.1(self);
      }
      v14 = 0;
LABEL_21:

      goto LABEL_10;
    case 0x706C7374u:
LABEL_5:
      if (a5 && *a5 > 7)
      {
        *(_QWORD *)a6 = CFRetain(v12);
        *a5 = 8;
        v14 = 1;
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.1(self);
      break;
  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  unsigned int v10;
  void *v11;
  id DeepCopy;
  BOOL v14;

  v10 = -[ASDCustomProperty propertyDataType](self, "propertyDataType", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7);
  if (!-[ASDCustomProperty isSettable](self, "isSettable"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.4(self);
    return 0;
  }
  if (v10 != 1667658612)
  {
    if (v10 == 1918990199)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a6, a5, 0);
      DeepCopy = (id)objc_claimAutoreleasedReturnValue();
      -[ASDTCustomProperty setDataNoCopy:](self, "setDataNoCopy:", DeepCopy);
      goto LABEL_20;
    }
    if (v10 != 1886155636)
      return 0;
  }
  if (a5 != 8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.3(self);
    return 0;
  }
  v11 = *(void **)a6;
  if (!*(_QWORD *)a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.1(self);
    return 0;
  }
  if (-[ASDTCustomProperty plistDeepCopyOnSet](self, "plistDeepCopyOnSet"))
  {
    DeepCopy = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFPropertyListRef *)a6, 0);
    if (!DeepCopy)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.2(self);
      return 0;
    }
  }
  else
  {
    DeepCopy = v11;
  }
LABEL_20:
  v14 = -[ASDTCustomProperty checkAndSetPropertyValue:](self, "checkAndSetPropertyValue:", DeepCopy);

  return v14;
}

+ (BOOL)automaticallyNotifiesObserversOfPropertyValue
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;

  v4 = a3;
  v5 = -[ASDCustomProperty propertyDataType](self, "propertyDataType");
  if (v5 != 1667658612 && v5 != 1918990199)
  {
    if (v5 != 1886155636)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_14;
  }
LABEL_11:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTCustomProperty checkPropertyValue:].cold.1(self);
  v6 = 0;
LABEL_14:

  return v6;
}

- (void)doCachePropertyValue:(id)a3
{
  id v4;
  id propertyValue;

  v4 = a3;
  -[ASDTCustomProperty setPropertyValueWasCached:](self, "setPropertyValueWasCached:", 1);
  propertyValue = self->_propertyValue;
  self->_propertyValue = v4;

}

- (void)cachePropertyValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  if (-[ASDTCustomProperty cacheMode](self, "cacheMode") == 2
    || -[ASDTCustomProperty cacheMode](self, "cacheMode") == 1 && -[ASDTCustomProperty useCache](self, "useCache"))
  {
    if (v4)
    {
      -[ASDTCustomProperty dataNoCopy](self, "dataNoCopy");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v4)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v4);
        v6 = objc_claimAutoreleasedReturnValue();

        if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTCustomProperty cachePropertyValue:].cold.1(self);
        -[ASDTCustomProperty setDataNoCopy:](self, "setDataNoCopy:", 0);
        v4 = (id)v6;
      }
    }
    -[ASDTCustomProperty doCachePropertyValue:](self, "doCachePropertyValue:", v4);
  }

}

- (void)releasePropertyValueCache
{
  id propertyValue;

  if (-[ASDTCustomProperty propertyValueWasCached](self, "propertyValueWasCached"))
  {
    propertyValue = self->_propertyValue;
    self->_propertyValue = 0;

    -[ASDTCustomProperty setPropertyValueWasCached:](self, "setPropertyValueWasCached:", 0);
  }
}

- (BOOL)storePropertyValue:(id)a3
{
  -[ASDTCustomProperty cachePropertyValue:](self, "cachePropertyValue:", a3);
  return 1;
}

- (BOOL)checkAndSetPropertyValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (!-[ASDTCustomProperty checkPropertyValue:](self, "checkPropertyValue:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTCustomProperty checkAndSetPropertyValue:].cold.1(self);
    goto LABEL_6;
  }
  NSStringFromSelector(sel_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTCustomProperty willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  NSStringFromSelector(sel_propertyValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTCustomProperty willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  LODWORD(v6) = -[ASDTCustomProperty storePropertyValue:](self, "storePropertyValue:", v4);
  NSStringFromSelector(sel_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTCustomProperty didChangeValueForKey:](self, "didChangeValueForKey:", v7);

  NSStringFromSelector(sel_propertyValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTCustomProperty didChangeValueForKey:](self, "didChangeValueForKey:", v8);

  if (!(_DWORD)v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  -[ASDCustomProperty sendPropertyChangeNotification](self, "sendPropertyChangeNotification");
  v9 = 1;
LABEL_7:

  return v9;
}

- (id)retrievePropertyValue
{
  return 0;
}

- (id)propertyValue
{
  int v3;
  uint64_t v4;
  void *v5;

  v3 = -[ASDTCustomProperty cacheMode](self, "cacheMode");
  if (v3 == 1)
  {
    if (!-[ASDTCustomProperty useCache](self, "useCache"))
      goto LABEL_3;
  }
  else if (!v3)
  {
LABEL_3:
    -[ASDTCustomProperty retrievePropertyValue](self, "retrievePropertyValue");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!-[ASDTCustomProperty propertyValueWasCached](self, "propertyValueWasCached"))
  {
    -[ASDTCustomProperty retrievePropertyValue](self, "retrievePropertyValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTCustomProperty cachePropertyValue:](self, "cachePropertyValue:", v5);
    return v5;
  }
  -[ASDTCustomProperty cachedPropertyValue](self, "cachedPropertyValue");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v5 = (void *)v4;
  return v5;
}

- (BOOL)includeValueInDescription
{
  return 1;
}

- (id)cachedPropertyValue
{
  return self->_propertyValue;
}

- (void)setUseCache:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (-[ASDTCustomProperty cacheMode](self, "cacheMode") == 1)
  {
    if (v3)
    {
      -[ASDTCustomProperty retrievePropertyValue](self, "retrievePropertyValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTCustomProperty doCachePropertyValue:](self, "doCachePropertyValue:", v5);

    }
    else
    {
      -[ASDTCustomProperty releasePropertyValueCache](self, "releasePropertyValueCache");
    }
  }
  self->_useCache = v3;
}

+ (id)consolidatePList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_52;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_52;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDTCustomProperty consolidatePList:].cold.6();
LABEL_61:
    v45 = 0;
    goto LABEL_62;
  }
  v3 = v3;
  if (!objc_msgSend(v3, "count"))
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      +[ASDTCustomProperty consolidatePList:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_60:

    goto LABEL_61;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v3, "count") * objc_msgSend(v5, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (v8)
    {
      v9 = v8;
      v10 = v4;
      v11 = *(_QWORD *)v89;
      while (2)
      {
        v12 = 0;
        v13 = v5;
        do
        {
          if (*(_QWORD *)v89 != v11)
            objc_enumerationMutation(v7);
          v5 = *(id *)(*((_QWORD *)&v88 + 1) + 8 * v12);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v33)
              +[ASDTCustomProperty consolidatePList:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);

            v4 = v10;
            goto LABEL_59;
          }
          objc_msgSend(v6, "appendData:", v5);
          ++v12;
          v13 = v5;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
        if (v9)
          continue;
        break;
      }
      v14 = v5;
      v4 = v10;
    }
    else
    {
      v14 = v5;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v5 = v3;
      v41 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v77;
        while (2)
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v77 != v43)
              objc_enumerationMutation(v5);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v46)
                +[ASDTCustomProperty consolidatePList:].cold.5(v46, v47, v48, v49, v50, v51, v52, v53);
LABEL_59:

              goto LABEL_60;
            }
          }
          v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          if (v42)
            continue;
          break;
        }
      }
      goto LABEL_51;
    }
    v14 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count") * objc_msgSend(v14, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v23 = v3;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v85;
      v74 = v23;
      v75 = v4;
      v71 = *(_QWORD *)v85;
      while (2)
      {
        v27 = 0;
        v72 = v25;
        do
        {
          if (*(_QWORD *)v85 != v26)
            objc_enumerationMutation(v23);
          v73 = v27;
          v5 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * v27);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            v4 = v75;
            if (v63)
              +[ASDTCustomProperty consolidatePList:].cold.4(v63, v64, v65, v66, v67, v68, v69, v70);
LABEL_58:

            goto LABEL_59;
          }
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v14 = v5;
          v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v81;
            while (2)
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v81 != v30)
                  objc_enumerationMutation(v14);
                v32 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v54)
                    +[ASDTCustomProperty consolidatePList:].cold.3(v54, v55, v56, v57, v58, v59, v60, v61);

                  v23 = v74;
                  v4 = v75;
                  goto LABEL_58;
                }
                objc_msgSend(v6, "addObject:", v32);
              }
              v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
              if (v29)
                continue;
              break;
            }
          }

          v27 = v73 + 1;
          v23 = v74;
          v4 = v75;
          v26 = v71;
        }
        while (v73 + 1 != v72);
        v25 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
        if (v25)
          continue;
        break;
      }
    }
  }

  v5 = v6;
LABEL_51:

  v3 = v5;
LABEL_52:
  v3 = v3;
  v45 = v3;
LABEL_62:

  return v45;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)propertyValueSize
{
  return self->_propertyValueSize;
}

- (void)setPropertyValueSize:(unsigned int)a3
{
  self->_propertyValueSize = a3;
}

- (int)cacheMode
{
  return self->_cacheMode;
}

- (void)setCacheMode:(int)a3
{
  self->_cacheMode = a3;
}

- (BOOL)useCache
{
  return self->_useCache;
}

- (BOOL)propertyValueWasCached
{
  return self->_propertyValueWasCached;
}

- (void)setPropertyValueWasCached:(BOOL)a3
{
  self->_propertyValueWasCached = a3;
}

- (BOOL)plistDeepCopyOnSet
{
  return self->_plistDeepCopyOnSet;
}

- (void)setPlistDeepCopyOnSet:(BOOL)a3
{
  self->_plistDeepCopyOnSet = a3;
}

- (NSData)dataNoCopy
{
  return (NSData *)objc_loadWeakRetained((id *)&self->_dataNoCopy);
}

- (void)setDataNoCopy:(id)a3
{
  objc_storeWeak((id *)&self->_dataNoCopy, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataNoCopy);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_propertyValue, 0);
}

+ (void)customPropertyForConfig:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Subclass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v1, "%s: Invalid subclass name: %@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)getPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: get: Incoming data size invalid: %u", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)getPropertyWithQualifierSize:(uint64_t)a3 qualifierData:(uint64_t)a4 dataSize:(uint64_t)a5 andData:(uint64_t)a6 forClient:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "inPropertyValue must be an NSData object", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: set: Bad argument.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: set: Property list copy failed.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: set: Incoming data size invalid: %u", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Attempt to set value to unsettable property.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v3, "%@: set: Bad property data type: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)cachePropertyValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to cache property data (out of memory).", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)checkAndSetPropertyValue:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: set: Failed property value check: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

+ (void)consolidatePList:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Empty array found.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)consolidatePList:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Objects in array for must be all Data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)consolidatePList:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Objects in sub-array must be all Number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)consolidatePList:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Array must contain only arrays.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)consolidatePList:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Objects in array must be all Number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)consolidatePList:.cold.6()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "Object of type %@ is not supported.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

@end

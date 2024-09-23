@implementation _IKJSDataDictionaryExporter

- (_IKJSDataDictionaryExporter)initWithAppContext:(id)a3 dataObservable:(id)a4
{
  id v6;
  id v7;
  _IKJSDataDictionaryExporter *v8;
  _IKJSDataDictionaryExporter *v9;
  void *v10;
  void *v11;
  IKWeakHandle *v12;
  uint64_t v13;
  IKHandle *dataDictionaryHandle;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  IKStrongHandle *v22;
  IKHandle *v23;
  uint64_t v24;
  NSMutableArray *touchedPropertyPaths;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  _QWORD v30[4];
  id v31;
  id location[2];
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_IKJSDataDictionaryExporter;
  v8 = -[IKJSObject initWithAppContext:](&v33, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataObservable, v7);
    -[_IKJSDataDictionaryExporter dataObservable](v9, "dataObservable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_initWeak(location, v9);
      v12 = [IKWeakHandle alloc];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __65___IKJSDataDictionaryExporter_initWithAppContext_dataObservable___block_invoke;
      v30[3] = &unk_1E9F4BAA8;
      objc_copyWeak(&v31, location);
      v13 = -[IKWeakHandle initWithGetter:](v12, "initWithGetter:", v30);
      dataDictionaryHandle = v9->_dataDictionaryHandle;
      v9->_dataDictionaryHandle = (IKHandle *)v13;

      objc_destroyWeak(&v31);
      objc_destroyWeak(location);
    }
    else
    {
      ITMLKitGetLogObject(3);
      v15 = objc_claimAutoreleasedReturnValue();
      ITMLKitGetLogObject(3);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_signpost_id_make_with_pointer(v16, &stru_1E9F50578);

      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D95F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "DataParsing", (const char *)&unk_1D96B1A0E, (uint8_t *)location, 2u);
      }

      objc_msgSend(v6, "jsContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IKJSDataDictionaryExporter dataObservable](v9, "dataObservable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_dataDictionaryObjectFromValue:inContext:", v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[IKStrongHandle initWithObject:]([IKStrongHandle alloc], "initWithObject:", v21);
      v23 = v9->_dataDictionaryHandle;
      v9->_dataDictionaryHandle = &v22->super;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
      touchedPropertyPaths = v9->_touchedPropertyPaths;
      v9->_touchedPropertyPaths = (NSMutableArray *)v24;

      ITMLKitGetLogObject(3);
      v26 = objc_claimAutoreleasedReturnValue();
      ITMLKitGetLogObject(3);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_signpost_id_make_with_pointer(v27, &stru_1E9F50578);

      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D95F2000, v26, OS_SIGNPOST_INTERVAL_END, v28, "DataParsing", (const char *)&unk_1D96B1A0E, (uint8_t *)location, 2u);
      }

    }
  }

  return v9;
}

- (id)dataDictionaryObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IKStrongHandle *v11;
  IKHandle *dataDictionaryHandle;

  if (-[NSMutableArray count](self->_touchedPropertyPaths, "count"))
  {
    -[_IKJSDataDictionaryExporter dataObservable](self, "dataObservable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IKJSDataDictionaryExporter dataObservable](self, "dataObservable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_class();
    -[IKHandle object](self->_dataDictionaryHandle, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updatedDataDictionaryObject:fromValue:forPropertyPaths:inContext:", v9, v7, self->_touchedPropertyPaths, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[IKStrongHandle initWithObject:]([IKStrongHandle alloc], "initWithObject:", v10);
    dataDictionaryHandle = self->_dataDictionaryHandle;
    self->_dataDictionaryHandle = &v11->super;

    -[NSMutableArray removeAllObjects](self->_touchedPropertyPaths, "removeAllObjects");
  }
  return -[IKHandle object](self->_dataDictionaryHandle, "object");
}

- (void)touchPropertyPath:(id)a3
{
  -[NSMutableArray addObject:](self->_touchedPropertyPaths, "addObject:", a3);
}

+ (id)_dataDictionaryObjectFromValue:(id)a3 inContext:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "JSValueRef");
  v8 = objc_msgSend(v6, "JSGlobalContextRef");

  return (id)objc_msgSend(a1, "_dataDictionaryObjectFromValueRef:inContextRef:", v7, v8);
}

+ (id)_dataDictionaryObjectFromValueRef:(OpaqueJSValue *)a3 inContextRef:(OpaqueJSContext *)a4
{
  uint64_t (**v7)(_QWORD, _QWORD);
  OpaqueJSString *v8;
  __CFString *v9;
  uint64_t v10;
  OpaqueJSValue *v12;
  const OpaqueJSValue *Prototype;
  OpaqueJSString *v14;
  const OpaqueJSValue *Property;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  OpaqueJSPropertyNameArray *v20;
  int64_t Count;
  void *v22;
  size_t j;
  OpaqueJSString *NameAtIndex;
  JSValueRef v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t (**v29)(_QWORD, _QWORD);
  _QWORD v30[5];

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78___IKJSDataDictionaryExporter__dataDictionaryObjectFromValueRef_inContextRef___block_invoke;
  v30[3] = &__block_descriptor_40_e40___OpaqueJSValue__16__0__OpaqueJSValue__8l;
  v30[4] = a4;
  v7 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v30, a2);
  if (JSValueIsString(a4, a3))
  {
    v8 = JSValueToStringCopy(a4, a3, 0);
    v9 = (__CFString *)JSStringCopyCFString(0, v8);
    JSStringRelease(v8);
    goto LABEL_8;
  }
  if (JSValueIsNumber(a4, a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", JSValueToNumber(a4, a3, 0));
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = (__CFString *)v10;
    goto LABEL_8;
  }
  if (JSValueIsBoolean(a4, a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", JSValueToBoolean(a4, a3));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (JSValueIsObject(a4, a3))
  {
    v12 = (OpaqueJSValue *)((uint64_t (**)(_QWORD, OpaqueJSValue *))v7)[2](v7, a3);
    Prototype = JSObjectGetPrototype(a4, v12);
    if (JSValueIsArray(a4, Prototype))
    {
      v14 = JSStringCreateWithCFString(CFSTR("length"));
      Property = JSObjectGetProperty(a4, v12, v14, 0);
      JSStringRelease(v14);
      v16 = 0;
      if (JSValueIsNumber(a4, Property))
        v16 = (uint64_t)JSValueToNumber(a4, Property, 0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(a1, "_dataDictionaryObjectFromValueRef:inContextRef:", JSObjectGetPropertyAtIndex(a4, v12, i, 0), a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

        }
      }
      v9 = (__CFString *)objc_msgSend(v17, "copy");

    }
    else
    {
      v29 = v7;
      v20 = JSObjectCopyPropertyNames(a4, v12);
      Count = JSPropertyNameArrayGetCount(v20);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", Count);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (Count >= 1)
      {
        for (j = 0; j != Count; ++j)
        {
          NameAtIndex = JSPropertyNameArrayGetNameAtIndex(v20, j);
          v25 = JSObjectGetProperty(a4, v12, NameAtIndex, 0);
          v26 = (__CFString *)JSStringCopyCFString(0, NameAtIndex);
          -[__CFString ik_sharedInstanceForDomain:](v26, "ik_sharedInstanceForDomain:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "_dataDictionaryObjectFromValueRef:inContextRef:", v25, a4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v27);

        }
      }
      JSPropertyNameArrayRelease(v20);
      v9 = (__CFString *)objc_msgSend(v22, "copy");

      v7 = v29;
    }
  }
  else
  {
    v9 = (__CFString *)MEMORY[0x1E0C9AA70];
  }
LABEL_8:

  return v9;
}

+ (id)_dataDictionaryObjectFromObject:(id)a3 forAccessorSequence:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void **p_cache;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void **v19;
  void **v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = v7;
  v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v26)
  {
    p_cache = &OBJC_METACLASS___IKDOMXPathResult.cache;
    v11 = *(_QWORD *)v28;
    v12 = 0x1E0C99000uLL;
    v13 = &OBJC_METACLASS___IKDOMXPathResult.cache;
    v14 = 0x1E0C99000uLL;
    v9 = v7;
    v25 = v7;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v16, "property");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v17);
          v18 = v8;
          v19 = p_cache;
          v20 = v13;
          v21 = v14;
          v22 = v12;
          v23 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v23;
          v12 = v22;
          v14 = v21;
          v13 = v20;
          p_cache = v19;
          v8 = v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            v9 = 0;
            v7 = v25;
            goto LABEL_16;
          }
          objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v16, "subscriptIndex"));
          v17 = v9;
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v7 = v25;
      v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_16:

  return v9;
}

+ (id)_updatedDataDictionaryObject:(id)a3 fromValue:(id)a4 forPropertyPaths:(id)a5 inContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "ikdt_isArray")
    && objc_msgSend(v10, "ikdt_isObject")
    && (!objc_msgSend(v10, "ikdt_isArray") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (!objc_msgSend(v10, "ikdt_isObject") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    if (!objc_msgSend(v10, "ikdt_isArray"))
      goto LABEL_15;
    objc_msgSend(v10, "valueForProperty:", CFSTR("length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isNumber"))
    {
      objc_msgSend(v13, "toNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

    }
    else
    {
      v15 = 0;
    }
    if (v15 == objc_msgSend(v9, "count"))
    {

LABEL_15:
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v78;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v78 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "accessorSequence");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (!v24)
            {
              objc_msgSend(a1, "_dataDictionaryObjectFromValue:inContext:", v10, v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_11;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
          if (v20)
            continue;
          break;
        }
      }
      v61 = v12;
      v62 = v10;
      v57 = v11;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v26 = v18;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v74 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v31, "accessorSequence");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v34)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, v33);
            }
            objc_msgSend(v31, "propertyPathByRemovingFirstAccessor");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v35);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        }
        while (v28);
      }

      v10 = v62;
      if (objc_msgSend(v62, "ikdt_isArray"))
      {
        v56 = v9;
        v58 = v9;
        v60 = (void *)objc_msgSend(v58, "mutableCopy");
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        objc_msgSend(v25, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        if (!v36)
        {
LABEL_59:

          v16 = (void *)objc_msgSend(v60, "copy");
          v9 = v56;

LABEL_61:
          v12 = v61;

          v11 = v57;
          goto LABEL_11;
        }
        v37 = v36;
        v38 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v70 != v38)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = objc_msgSend(v40, "subscriptIndex");
              objc_msgSend(v62, "valueAtIndex:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectAtIndexedSubscript:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v40);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_updatedDataDictionaryObject:fromValue:forPropertyPaths:inContext:", v43, v42, v44, v61);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v60, "setObject:atIndexedSubscript:", v45, v41);
            }
          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        }
        while (v37);
      }
      else
      {
        if (!objc_msgSend(v62, "ikdt_isObject"))
        {
          v16 = 0;
          goto LABEL_61;
        }
        v56 = v9;
        v59 = v9;
        v60 = (void *)objc_msgSend(v59, "mutableCopy");
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v25, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v66;
          do
          {
            for (m = 0; m != v47; ++m)
            {
              if (*(_QWORD *)v66 != v48)
                objc_enumerationMutation(obj);
              v50 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v50, "property");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "valueForProperty:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "objectForKeyedSubscript:", v51);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v50);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "_updatedDataDictionaryObject:fromValue:forPropertyPaths:inContext:", v53, v52, v54, v61);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (v55)
                  objc_msgSend(v60, "setObject:forKeyedSubscript:", v55, v51);
                else
                  objc_msgSend(v60, "removeObjectForKey:", v51);

              }
            }
            v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
          }
          while (v47);
        }
      }
      v10 = v62;
      goto LABEL_59;
    }
    objc_msgSend(a1, "_dataDictionaryObjectFromValue:inContext:", v10, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_dataDictionaryObjectFromValue:inContext:", v10, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return v16;
}

- (IKJSDataObservable)dataObservable
{
  return (IKJSDataObservable *)objc_loadWeakRetained((id *)&self->_dataObservable);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataObservable);
  objc_storeStrong((id *)&self->_touchedPropertyPaths, 0);
  objc_storeStrong((id *)&self->_dataDictionaryHandle, 0);
}

@end

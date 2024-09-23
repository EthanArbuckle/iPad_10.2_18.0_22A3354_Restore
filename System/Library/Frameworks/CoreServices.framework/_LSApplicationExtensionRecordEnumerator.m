@implementation _LSApplicationExtensionRecordEnumerator

- (BOOL)_evaluatePluginNoIO:(unsigned int)a3 data:(const LSPluginData *)a4 extensionPointID:(unsigned int)a5 context:(LSContext *)a6
{
  unint64_t options;
  unsigned int platform;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t var4;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  _LSPlugInPropertyList *v27;
  int v29;
  _BYTE buf[12];
  __int16 v31;
  _BYTE v32[10];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a5 && a4->var4 != a5)
  {
    v16 = _LSEnumeratorLog;
    v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17)
      return v17;
    var4 = a4->var4;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = a3;
    v31 = 2048;
    *(_QWORD *)v32 = a5;
    *(_WORD *)&v32[8] = 2048;
    v33 = var4;
    v19 = "Skipping plugin %llx during enumeration because it is on the wrong extension point (want %llx, had %llx)";
    v20 = v16;
    v21 = 32;
    goto LABEL_20;
  }
  options = self->_options;
  if ((options & 1) != 0 && (*(_BYTE *)&a4->var0.flags & 1) != 0)
  {
    v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17)
      return v17;
    -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.4();
LABEL_30:
    LOBYTE(v17) = 0;
    return v17;
  }
  platform = self->_platform;
  if (platform && a4->var0.platform != platform)
  {
    v22 = _LSEnumeratorLog;
    v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17)
      return v17;
    v23 = a4->var0.platform;
    v24 = self->_platform;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = a3;
    v31 = 1024;
    *(_DWORD *)v32 = v23;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v24;
    v19 = "Skipping plugin %llx during enumeration because it is the wrong platform (%x, want %x)";
    v20 = v22;
    v21 = 24;
LABEL_20:
    _os_log_debug_impl(&dword_182882000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_30;
  }
  if ((options & 0x4000000000000000) == 0)
  {
    v13 = _LSBundleGet(a6->db, a4->var8);
    if (v13)
    {
      if (((*(unsigned __int16 *)(v13 + 189) | (*(unsigned __int8 *)(v13 + 191) << 16)) & 0x80000) != 0)
      {
        v29 = 0;
        *(_QWORD *)buf = 0;
        _LSExtensionPointFindWithStringID(a6->db, a4->var4, a4->var0.platform, 0, &v29, buf);
        if (*(_QWORD *)buf)
        {
          v14 = *(_QWORD *)(*(_QWORD *)buf + 68);
          v15 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
          if ((v14 & 1) == 0)
          {
            if (v15)
              -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.2();
            goto LABEL_30;
          }
          if (v15)
            -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.3();
        }
      }
    }
  }
  if (self->_filterBlock)
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a6, a4->var0.infoDictionary);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a6, _LSPluginGetSDKDictionaryDataUnit(a6->db, a3, (uint64_t)a4));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_LSPlugInPropertyList initWithInfoPlist:SDKPlist:]([_LSPlugInPropertyList alloc], "initWithInfoPlist:SDKPlist:", v25, v26);
    objc_storeStrong((id *)&self->_propertyList, v27);
    if (((*((uint64_t (**)(void))self->_filterBlock + 2))() & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
        -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.1();

      goto LABEL_30;
    }

  }
  LOBYTE(v17) = 1;
  return v17;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  unsigned int *begin;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _LSDatabase *db;
  int IsValid;
  __CFString *v17;
  id v18;
  id v19;
  __CFString *v21;

  begin = self->_plugins.__begin_;
  v7 = self->_plugins.__end_ - begin;
  if (v7 > a4)
  {
    v11 = begin[a4];
    v12 = _LSGetPlugin((uint64_t)a5->db, begin[a4]);
    if (v12)
    {
      v13 = v12;
      v14 = self->_options >> 63;
      db = a5->db;
      v21 = 0;
      IsValid = _LSPluginIsValid(db, v11, v13, 0, v14, (const __CFString **)&v21);
      v17 = v21;
      if (IsValid)
      {
        if (self->_extensionPointRecord)
          v18 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:extensionPointRecord:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:extensionPointRecord:error:", a5, v11, v13, self->_extensionPointRecord, 0);
        else
          v18 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:error:", a5, v11, v13, 0);
        v19 = *a3;
        *a3 = v18;

      }
      else if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
      {
        -[_LSApplicationExtensionRecordEnumerator _getObject:atIndex:context:].cold.1();
      }

    }
  }
  return v7 > a4;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  _BOOL4 v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[6];
  int v18;
  char v19;
  int v20;

  v20 = 0;
  v6 = -[_LSApplicationExtensionRecordEnumerator _getExtensionPointID:context:error:](self, "_getExtensionPointID:context:error:", &v20, a3, a4);
  if (v6)
  {
    v7 = (LOBYTE(self->_options) >> 4) & 1;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69___LSApplicationExtensionRecordEnumerator__prepareWithContext_error___block_invoke;
    v17[3] = &unk_1E1044928;
    v18 = v20;
    v17[4] = self;
    v17[5] = a3;
    v19 = v7;
    v8 = (id)MEMORY[0x186DAE9BC](v17);
    _CSStringBindingEnumerateAllBindings();
    v9 = _LSEnumeratorLog;
    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
      -[_LSApplicationExtensionRecordEnumerator _prepareWithContext:error:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);

  }
  return v6;
}

- (BOOL)_getExtensionPointID:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5
{
  const __CFString *extensionPointID;
  unsigned int StringForCFString;
  NSObject *v9;
  _BOOL4 v10;
  NSString *v11;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  extensionPointID = (const __CFString *)self->_extensionPointID;
  if (!extensionPointID)
    goto LABEL_5;
  StringForCFString = _LSDatabaseGetStringForCFString(a4->db, extensionPointID, 0);
  if (!StringForCFString)
  {
    v9 = _LSEnumeratorLog;
    v10 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEFAULT);
    StringForCFString = 0;
    if (v10)
    {
      v11 = self->_extensionPointID;
      v13 = 138477827;
      v14 = v11;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "Could not find extension point %{private}@ in database; will yield nothing",
        (uint8_t *)&v13,
        0xCu);
LABEL_5:
      StringForCFString = 0;
    }
  }
  if (a3)
    *a3 = StringForCFString;
  return 1;
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  _LSApplicationExtensionRecordEnumerator *v6;
  void *v7;
  id filterBlock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  v6 = -[_LSDBEnumerator _initWithContext:](&v10, sel__initWithContext_, 0);
  if (v6)
  {
    objc_msgSend(a3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_extensionPointID, v7);
    v6->_options = a4;
    filterBlock = v6->_filterBlock;
    v6->_filterBlock = 0;

    v6->_platform = objc_msgSend(a3, "platform");
    objc_storeStrong((id *)&v6->_extensionPointRecord, a3);

  }
  return v6;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (void).cxx_destruct
{
  vector<unsigned int, std::allocator<unsigned int>> *p_plugins;
  unsigned int *begin;

  p_plugins = &self->_plugins;
  begin = self->_plugins.__begin_;
  if (begin)
  {
    p_plugins->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointRecord, 0);
  objc_storeStrong((id *)&self->_extensionPointID, 0);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:](self, "initWithExtensionPointIdentifier:options:platform:", a3, a4, 0);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:filter:](self, "initWithExtensionPointIdentifier:options:platform:filter:", a3, a4, *(_QWORD *)&a5, 0);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:filter:](self, "initWithExtensionPointIdentifier:options:platform:filter:", a3, a4, 0, a5);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5 filter:(id)a6
{
  _LSApplicationExtensionRecordEnumerator *v10;
  uint64_t v11;
  NSString *extensionPointID;
  uint64_t v13;
  id filterBlock;
  uint64_t v15;
  LSPropertyList *propertyList;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  v10 = -[_LSDBEnumerator _initWithContext:](&v18, sel__initWithContext_, 0);
  if (v10)
  {
    v11 = objc_msgSend(a3, "copy");
    extensionPointID = v10->_extensionPointID;
    v10->_extensionPointID = (NSString *)v11;

    v10->_options = a4;
    v13 = objc_msgSend(a6, "copy");
    filterBlock = v10->_filterBlock;
    v10->_filterBlock = (id)v13;

    v10->_platform = a5;
    if (a6)
    {
      _LSLazyPropertyListGetSharedEmptyPropertyList();
      v15 = objc_claimAutoreleasedReturnValue();
      propertyList = v10->_propertyList;
      v10->_propertyList = (LSPropertyList *)v15;

    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LSApplicationExtensionRecordEnumerator *v5;
  uint64_t v6;
  NSString *extensionPointID;
  uint64_t v8;
  id filterBlock;
  LSPropertyList *v10;
  LSPropertyList *propertyList;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_extensionPointID, "copyWithZone:", a3);
    extensionPointID = v5->_extensionPointID;
    v5->_extensionPointID = (NSString *)v6;

    v5->_options = self->_options;
    v8 = objc_msgSend(self->_filterBlock, "copy");
    filterBlock = v5->_filterBlock;
    v5->_filterBlock = (id)v8;

    v10 = -[LSPropertyList copyWithZone:](self->_propertyList, "copyWithZone:", a3);
    propertyList = v5->_propertyList;
    v5->_propertyList = v10;

    if (v5 != self)
      std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>((char *)&v5->_plugins, (char *)self->_plugins.__begin_, (uint64_t)self->_plugins.__end_, self->_plugins.__end_ - self->_plugins.__begin_);
    objc_storeStrong((id *)&v5->_extensionPointRecord, self->_extensionPointRecord);
  }
  return v5;
}

- (void)_prepareWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Will enumerate %llu candidate plugins", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_getObject:atIndex:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_6();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_182882000, v1, OS_LOG_TYPE_DEBUG, "Skipping plugin %llx during enumeration because it is invalid: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end

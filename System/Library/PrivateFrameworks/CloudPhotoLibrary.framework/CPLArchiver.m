@implementation CPLArchiver

- (id)_encodeKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!self->_forDisplay)
  {
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_4958);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v4;
    v8 = v7;

    v4 = v8;
  }
  return v4;
}

- (id)_decodeKey:(id)a3 class:(Class)a4 inDictionary:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a5;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1097);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)archivedPropertyList
{
  return self->_archive;
}

- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4
{
  id v7;
  CPLArchiver *v8;
  CPLArchiver *v9;
  id *p_rootObject;
  void *v11;
  void *v12;
  uint64_t v13;
  id archive;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLArchiver;
  v8 = -[CPLArchiver init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    p_rootObject = &v8->_rootObject;
    objc_storeStrong(&v8->_rootObject, a3);
    v9->_forDisplay = a4;
    objc_msgSend(*p_rootObject, "plistArchiveWithCPLArchiver:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17[0] = CFSTR("c");
      objc_msgSend(*p_rootObject, "storedClassNameForCPLArchiver:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = CFSTR("p");
      v18[0] = v12;
      v18[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v13 = objc_claimAutoreleasedReturnValue();
      archive = v9->_archive;
      v9->_archive = (id)v13;

    }
  }

  return v9;
}

- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4 block:(id)a5
{
  id v9;
  void (**v10)(id, CPLArchiver *);
  CPLArchiver *v11;
  CPLArchiver *v12;
  id v13;
  id archiveCursor;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id archive;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, CPLArchiver *))a5;
  v21.receiver = self;
  v21.super_class = (Class)CPLArchiver;
  v11 = -[CPLArchiver init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_rootObject, a3);
    v12->_forDisplay = a4;
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    archiveCursor = v12->_archiveCursor;
    v12->_archiveCursor = v13;
    v15 = v13;

    v10[2](v10, v12);
    v16 = v12->_archiveCursor;
    v12->_archiveCursor = 0;

    v22[0] = CFSTR("c");
    objc_msgSend(v12->_rootObject, "storedClassNameForCPLArchiver:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = CFSTR("p");
    v23[0] = v17;
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    archive = v12->_archive;
    v12->_archive = (id)v18;

  }
  return v12;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (CPLArchiver)initWithArchive:(id)a3 rootClass:(Class)a4
{
  id v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  CPLArchiver *v11;
  CPLArchiver *v12;
  uint64_t v13;
  id archiveCursor;
  uint64_t v15;
  id rootObject;
  CPLArchiver *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  objc_class *v24;
  __int16 v25;
  Class v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("c"));
  v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Invalid stored class name '%@'", buf, 0xCu);
      }

    }
    goto LABEL_19;
  }
  v9 = (objc_class *)-[objc_class classForStoredClassName:forCPLArchiver:](a4, "classForStoredClassName:forCPLArchiver:", v8, self);
  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v8;
        v25 = 2112;
        v26 = a4;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Can't find a proper class from '%@' according to %@", buf, 0x16u);
      }

    }
    goto LABEL_19;
  }
  v10 = v9;
  if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", a4) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v10;
        v25 = 2112;
        v26 = a4;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Invalid class for archive: %@. Expected subclass of %@", buf, 0x16u);
      }

    }
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  v22.receiver = self;
  v22.super_class = (Class)CPLArchiver;
  v11 = -[CPLArchiver init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_archive, a3);
    objc_msgSend(v7, "objectForKey:", CFSTR("p"));
    v13 = objc_claimAutoreleasedReturnValue();
    archiveCursor = v12->_archiveCursor;
    v12->_archiveCursor = (id)v13;

    v15 = objc_msgSend([v10 alloc], "initWithCPLArchiver:", v12);
    rootObject = v12->_rootObject;
    v12->_rootObject = (id)v15;

  }
  self = v12;
  v17 = self;
LABEL_20:

  return v17;
}

- (void)encodeObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 659, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (void)encodeRootObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 663, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (void)encodeBycopyObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 667, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (void)encodeByrefObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 671, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (void)encodeConditionalObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 675, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 679, CFSTR("%@ does not support %@"), v7, v8);

  abort();
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 683, CFSTR("%@ does not support %@"), v9, v10);

  abort();
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 687, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (id)decodeObject
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 692, CFSTR("%@ does not support %@"), v6, v7);

  abort();
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 697, CFSTR("%@ does not support %@"), v7, v8);

  abort();
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 701, CFSTR("%@ does not support %@"), v9, v10);

  abort();
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 705, CFSTR("%@ does not support %@"), v7, v8);

  abort();
}

- (void)encodePropertyList:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 710, CFSTR("%@ does not support %@"), v8, v9);

  abort();
}

- (id)decodePropertyList
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 714, CFSTR("%@ does not support %@"), v6, v7);

  abort();
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!self->_forDisplay)
  {
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1118);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v6;
    v10 = v9;

    v6 = v10;
  }
  objc_msgSend(v13, "replacementObjectForCoder:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "plistArchiveWithCPLArchiver:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(self->_archiveCursor, "setObject:forKey:", v12, v6);

}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (!self->_forDisplay)
  {
    v9 = v8;
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1119);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v9;
    v13 = v12;

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 732, CFSTR("%@ does not support %@"), v16, v17);

  abort();
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id archiveCursor;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_forDisplay)
  {
    if (v4)
    {
LABEL_3:
      archiveCursor = self->_archiveCursor;
      v13 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(archiveCursor, "setObject:forKey:", v9, v13);

      v7 = v13;
    }
  }
  else
  {
    v14 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1120);
      v7 = v14;
    }
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v10;
    else
      v11 = v14;
    v12 = v11;

    v7 = v12;
    if (v4)
      goto LABEL_3;
  }

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id archiveCursor;
  void *v12;
  id v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!self->_forDisplay)
  {
    v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1122);
      v7 = v13;
    }
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v13;
    v10 = v9;

    v7 = v10;
  }
  if ((_DWORD)v4)
  {
    archiveCursor = self->_archiveCursor;
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v12, v14);

    v7 = v14;
  }

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id archiveCursor;
  void *v12;
  id v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!self->_forDisplay)
  {
    v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1123);
      v7 = v13;
    }
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v13;
    v10 = v9;

    v7 = v10;
  }
  if ((_DWORD)v4)
  {
    archiveCursor = self->_archiveCursor;
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v12, v14);

    v7 = v14;
  }

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id archiveCursor;
  void *v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = v6;
  if (!self->_forDisplay)
  {
    v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1124);
      v7 = v13;
    }
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v13;
    v10 = v9;

    v7 = v10;
  }
  if (a3)
  {
    archiveCursor = self->_archiveCursor;
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v12, v14);

    v7 = v14;
  }

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id archiveCursor;
  void *v13;
  id v14;
  id v15;

  v6 = a4;
  v8 = v6;
  if (!self->_forDisplay)
  {
    v14 = v6;
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1125);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v9;
    else
      v10 = v14;
    v11 = v10;

    v8 = v11;
  }
  if (a3 != 0.0)
  {
    archiveCursor = self->_archiveCursor;
    *(float *)&v7 = a3;
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v13, v15);

    v8 = v15;
  }

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id archiveCursor;
  void *v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = v6;
  if (!self->_forDisplay)
  {
    v13 = v6;
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1126);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v13;
    v10 = v9;

    v7 = v10;
  }
  if (a3 != 0.0)
  {
    archiveCursor = self->_archiveCursor;
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v12, v14);

    v7 = v14;
  }

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a5;
  if (!self->_forDisplay)
  {
    v8 = v7;
    if (_smallKeyOnce != -1)
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1127);
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v8;
    v12 = v11;

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 779, CFSTR("%@ does not support %@"), v15, v16);

  abort();
}

- (BOOL)containsValueForKey:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  id v5;
  void *v6;
  id archiveCursor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1128);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v6)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v5);
      objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 788, CFSTR("%@ does not support %@"), v13, v14);

  abort();
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1129);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_msgSend(v10, "BOOLValue");
  return v11;
}

- (int)decodeIntForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1130);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_msgSend(v10, "intValue");
  return v11;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1131);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_msgSend(v10, "intValue");
  return v11;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1132);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_msgSend(v10, "longLongValue");
  return v11;
}

- (float)decodeFloatForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  float v11;
  float v12;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1133);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  return v12;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1134);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  return v12;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v6;
  void *v7;
  id archiveCursor;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1135);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v7)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v6);
      objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 824, CFSTR("%@ does not support %@"), v14, v15);

  abort();
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id archiveCursor;
  void *v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = v6;
  if (!self->_forDisplay)
  {
    v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1136);
      v7 = v13;
    }
    objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v13;
    v10 = v9;

    v7 = v10;
  }
  if (a3)
  {
    archiveCursor = self->_archiveCursor;
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v12, v14);

    v7 = v14;
  }

}

- (int64_t)decodeIntegerForKey:(id)a3
{
  id v4;
  void *v5;
  id archiveCursor;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1137);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v5)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = objc_msgSend(v10, "integerValue");
  return v11;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id *p_archiveCursor;
  id archiveCursor;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v6 = a4;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1138);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_archiveCursor = &self->_archiveCursor;
  archiveCursor = self->_archiveCursor;
  if (v7)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(*p_archiveCursor, "objectForKeyedSubscript:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = v13;
  if (v14)
  {
    v15 = *p_archiveCursor;
    objc_storeStrong(&self->_archiveCursor, v13);
    v16 = (void *)objc_msgSend([a3 alloc], "initWithCPLArchiver:", self);
    v17 = *p_archiveCursor;
    *p_archiveCursor = v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id *p_archiveCursor;
  id archiveCursor;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  id v34;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1139);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_archiveCursor = &self->_archiveCursor;
  archiveCursor = self->_archiveCursor;
  if (v9)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(*p_archiveCursor, "objectForKeyedSubscript:", v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLArchiver decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", v16, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v15;
    if (v18)
    {
      if ((objc_msgSend(v7, "containsObject:", objc_opt_class()) & 1) == 0
        && !objc_msgSend(v7, "containsObject:", objc_opt_class()))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v41, 887, CFSTR("%@ is not supported for %@"), v7, v42);

        abort();
      }
      v19 = v18;
      objc_opt_class();
      v47 = v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v59 = (id)objc_opt_class();
            v60 = 2112;
            v61 = v19;
            v37 = v59;
            _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_ERROR, "Unexpected array. Found %@: '%@'", buf, 0x16u);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v39, 866, CFSTR("Unexpected array. Found %@: '%@'"), objc_opt_class(), v19);

        abort();
      }
      v44 = v18;
      v45 = v15;
      v43 = *p_archiveCursor;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v46 = v7;
      v20 = v7;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v53;
LABEL_17:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v20);
          v25 = *(objc_class **)(*((_QWORD *)&v52 + 1) + 8 * v24);
          if (v25 != (objc_class *)objc_opt_class())
            break;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            if (v22)
              goto LABEL_17;
            goto LABEL_23;
          }
        }
      }
      else
      {
LABEL_23:
        v25 = 0;
      }

      v26 = v47;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
      if (v25)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v27 = v47;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v49 != v30)
                objc_enumerationMutation(v27);
              objc_storeStrong(&self->_archiveCursor, *(id *)(*((_QWORD *)&v48 + 1) + 8 * i));
              v32 = (void *)objc_msgSend([v25 alloc], "initWithCPLArchiver:", self);
              objc_msgSend(v17, "addObject:", v32);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v29);
        }
        v33 = *p_archiveCursor;
        *p_archiveCursor = 0;

        v26 = v47;
      }
      v34 = *p_archiveCursor;
      *p_archiveCursor = v43;

      v15 = v45;
      v7 = v46;
      v18 = v44;
    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (id)decodePropertyListForKey:(id)a3
{
  id v5;
  void *v6;
  id archiveCursor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1144);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v6)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v5);
      objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 898, CFSTR("%@ does not support %@"), v13, v14);

  abort();
}

- (void)encodePoint:(CGPoint)a3 forKey:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id archiveCursor;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];
  NSPoint v21;
  NSPoint v22;

  y = a3.y;
  x = a3.x;
  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (self->_forDisplay)
  {
    v9 = v7;
LABEL_10:
    archiveCursor = self->_archiveCursor;
    v21.x = x;
    v21.y = y;
    NSStringFromPoint(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v14, v8);

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1145);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v9 = v12;

  if (self->_forDisplay)
  {
    v8 = v9;
    goto LABEL_10;
  }
  v22.x = x;
  v22.y = y;
  if (!NSEqualPoints(v22, *MEMORY[0x1E0CB3430]))
  {
    v15 = self->_archiveCursor;
    v19[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("y");
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, v9);

  }
LABEL_11:

}

- (void)encodeSize:(CGSize)a3 forKey:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id archiveCursor;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];
  NSSize v21;
  NSSize v22;

  height = a3.height;
  width = a3.width;
  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (self->_forDisplay)
  {
    v9 = v7;
LABEL_10:
    archiveCursor = self->_archiveCursor;
    v21.width = width;
    v21.height = height;
    NSStringFromSize(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v14, v8);

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1150);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v9 = v12;

  if (self->_forDisplay)
  {
    v8 = v9;
    goto LABEL_10;
  }
  v22.width = width;
  v22.height = height;
  if (!NSEqualSizes(v22, *MEMORY[0x1E0CB3440]))
  {
    v15 = self->_archiveCursor;
    v19[0] = CFSTR("w");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("h");
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, v9);

  }
LABEL_11:

}

- (void)encodeRect:(CGRect)a3 forKey:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id archiveCursor;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];
  NSRect v25;
  NSRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  if (self->_forDisplay)
  {
    v11 = v9;
LABEL_10:
    archiveCursor = self->_archiveCursor;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    NSStringFromRect(v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(archiveCursor, "setObject:forKey:", v16, v10);

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1155);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v10;
  v11 = v14;

  if (self->_forDisplay)
  {
    v10 = v11;
    goto LABEL_10;
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (!NSIsEmptyRect(v26))
  {
    v17 = self->_archiveCursor;
    v23[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v23[1] = CFSTR("y");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v19;
    v23[2] = CFSTR("w");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v20;
    v23[3] = CFSTR("h");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v22, v11);

  }
LABEL_11:

}

- (CGPoint)decodePointForKey:(id)a3
{
  id v5;
  void *v6;
  id archiveCursor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;
  CGPoint result;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1156);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v6)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_opt_class();
          v24 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v30 = v22;
          v31 = 2112;
          v32 = v23;
          v33 = 2112;
          v34 = v24;
          v25 = v23;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v27, 937, CFSTR("Unexpected dictionary for %@. Found %@: '%@'"), v28, objc_opt_class(), self->_archiveCursor);

      abort();
    }
    v12 = v11;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("x"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("y"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "doubleValue");
    v18 = v17;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB3430];
    v18 = *(double *)(MEMORY[0x1E0CB3430] + 8);
  }

  v19 = v15;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGSize)decodeSizeForKey:(id)a3
{
  id v5;
  void *v6;
  id archiveCursor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;
  CGSize result;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1159);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v6)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_opt_class();
          v24 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v30 = v22;
          v31 = 2112;
          v32 = v23;
          v33 = 2112;
          v34 = v24;
          v25 = v23;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v27, 947, CFSTR("Unexpected dictionary for %@. Found %@: '%@'"), v28, objc_opt_class(), self->_archiveCursor);

      abort();
    }
    v12 = v11;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("w"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("h"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "doubleValue");
    v18 = v17;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB3440];
    v18 = *(double *)(MEMORY[0x1E0CB3440] + 8);
  }

  v19 = v15;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGRect)decodeRectForKey:(id)a3
{
  id v5;
  void *v6;
  id archiveCursor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;
  CGRect result;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1160);
  objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  archiveCursor = self->_archiveCursor;
  if (v6)
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(self->_archiveCursor, "objectForKeyedSubscript:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(archiveCursor, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_opt_class();
          v32 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v38 = v30;
          v39 = 2112;
          v40 = v31;
          v41 = 2112;
          v42 = v32;
          v33 = v31;
          _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v35, 957, CFSTR("Unexpected dictionary for %@. Found %@: '%@'"), v36, objc_opt_class(), self->_archiveCursor);

      abort();
    }
    v12 = v11;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("x"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("y"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("w"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("h"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "doubleValue");
    v24 = v23;

  }
  else
  {
    v15 = *MEMORY[0x1E0CB3438];
    v18 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v21 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v24 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }

  v25 = v15;
  v26 = v18;
  v27 = v21;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)forDisplay
{
  return self->_forDisplay;
}

- (id)archiveCursor
{
  return self->_archiveCursor;
}

- (void)setArchiveCursor:(id)a3
{
  objc_storeStrong(&self->_archiveCursor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong(&self->_archiveCursor, 0);
  objc_storeStrong(&self->_archive, 0);
}

uint64_t __32__CPLArchiver_decodeRectForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __32__CPLArchiver_decodeSizeForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_decodePointForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_encodeRect_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_encodeSize_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_encodePoint_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __40__CPLArchiver_decodePropertyListForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __44__CPLArchiver_decodeObjectOfClasses_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __42__CPLArchiver_decodeObjectOfClass_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __35__CPLArchiver_decodeIntegerForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __36__CPLArchiver_encodeInteger_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __48__CPLArchiver_decodeBytesForKey_returnedLength___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_decodeDoubleForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_decodeFloatForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_decodeInt64ForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_decodeInt32ForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __31__CPLArchiver_decodeIntForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __32__CPLArchiver_decodeBoolForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_decodeObjectForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __41__CPLArchiver_encodeBytes_length_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __35__CPLArchiver_encodeDouble_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_encodeFloat_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_encodeInt64_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __34__CPLArchiver_encodeInt32_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __32__CPLArchiver_encodeInt_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __33__CPLArchiver_encodeBool_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __46__CPLArchiver_encodeConditionalObject_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __35__CPLArchiver_encodeObject_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __45__CPLArchiver__decodeKey_class_inDictionary___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

uint64_t __26__CPLArchiver__encodeKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping](CPLArchiver, "_initializeSmallKeyMapping");
}

+ (void)_initializeSmallKeyMapping
{
  void *v2;

  v2 = (void *)_keyToSmallKeyMapping;
  _keyToSmallKeyMapping = (uint64_t)&unk_1E611B780;

}

+ (id)archivedDataWithRootObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "archivedPropertyListWithRootObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v6)
      v8 = 0;
    else
      v8 = _CPLSilentLogging == 0;
    if (v8)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Can't encode %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)archivedPropertyListWithRootObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootObject:forDisplay:", v4, 0);

  objc_msgSend(v5, "archivedPropertyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)archivedPropertyListWithRootObject:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootObject:forDisplay:block:", v7, 0, v6);

  objc_msgSend(v8, "archivedPropertyList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)archivedDataWithRootObject:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "archivedPropertyListWithRootObject:usingBlock:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v8)
      v10 = 0;
    else
      v10 = _CPLSilentLogging == 0;
    if (v10)
    {
      __CPLGenericOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Can't encode %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)unarchivedObjectWithPropertyList:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArchive:rootClass:", v6, a4);

  objc_msgSend(v7, "rootObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)displayablePropertyListWithRootObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootObject:forDisplay:", v4, 1);

  objc_msgSend(v5, "archivedPropertyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fullDescriptionForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootObject:forDisplay:", v4, 1);

  objc_msgSend(v5, "archivedPropertyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("p"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)unarchiveObjectWithData:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v18 = v13;
            v14 = v13;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Incorrect serialized record is a %@", buf, 0xCu);

          }
        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("incorrect serialized record is a %@"), objc_opt_class());
        _CPLStoreFailure(v15);
      }
      objc_msgSend(a1, "unarchivedObjectWithPropertyList:ofClass:", v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't unarchive %@", buf, 0xCu);
        }

      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_displayableArrayForArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_displayableObjectForObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_displayableObjectForObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "displayableDictionaryForDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v4;
      goto LABEL_10;
    }
    objc_msgSend(a1, "_displayableArrayForArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

LABEL_10:
  return v8;
}

+ (id)displayableDictionaryForDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_smallKeyOnce != -1)
    dispatch_once(&_smallKeyOnce, block);
  if (displayableDictionaryForDictionary__onceToken != -1)
    dispatch_once(&displayableDictionaryForDictionary__onceToken, &__block_literal_global_1107);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4959;
  v17 = __Block_byref_object_dispose__4960;
  v18 = 0;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_1110;
  v9[3] = &unk_1E60D83D8;
  v11 = &v13;
  v12 = a1;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSmallKeyMapping");
}

void __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_1110(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)displayableDictionaryForDictionary__smallKeyToDisplayableKey, "objectForKeyedSubscript:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v18;
    v10 = v9;

    objc_msgSend(*(id *)(a1 + 48), "_displayableObjectForObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    *a4 = 1;
  }

}

void __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v0 = objc_alloc(MEMORY[0x1E0C99E08]);
  v1 = (void *)objc_msgSend(v0, "initWithCapacity:", objc_msgSend((id)_keyToSmallKeyMapping, "count"));
  v2 = (void *)_keyToSmallKeyMapping;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_3;
  v6[3] = &unk_1E60D83B0;
  v3 = v1;
  v7 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)displayableDictionaryForDictionary__smallKeyToDisplayableKey;
  displayableDictionaryForDictionary__smallKeyToDisplayableKey = (uint64_t)v3;
  v5 = v3;

}

uint64_t __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

@end

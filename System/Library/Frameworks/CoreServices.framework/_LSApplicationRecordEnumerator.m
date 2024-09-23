@implementation _LSApplicationRecordEnumerator

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  unsigned int *begin;
  unint64_t v7;
  void *v9;
  id v10;

  begin = self->_bundleIdentifiersOrUnits.__begin_;
  v7 = self->_bundleIdentifiersOrUnits.__end_ - begin;
  if (v7 > a4)
  {
    -[_LSApplicationRecordEnumerator _applicationRecordWithContext:bundleIdentifierOrUnit:](self, "_applicationRecordWithContext:bundleIdentifierOrUnit:", a5, begin[a4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *a3;
    *a3 = v9;

  }
  return v7 > a4;
}

- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4
{
  LSContext *v4;
  id v7;
  _BOOL4 v8;
  LSContext *v9;
  unint64_t options;
  unsigned int bundleClass;
  LSContext *v12;
  uint64_t v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v15;
  void *v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  LSApplicationRecord *v25;
  _QWORD v26[5];
  LSContext *v27;
  LSContext *v28;
  unsigned int v29;
  id v30;
  unsigned int v31;

  v4 = *(LSContext **)&a4;
  v31 = 0;
  v30 = 0;
  if (!-[_LSApplicationRecordEnumerator _enumerateAllBundles](self, "_enumerateAllBundles"))
  {
    v9 = (LSContext *)_CSStringCopyCFString();
    v4 = v9;
    if (v9)
    {
      options = self->_options;
      bundleClass = self->_bundleClass;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke;
      v26[3] = &unk_1E103FD90;
      v26[4] = self;
      v28 = a3;
      v12 = v9;
      v27 = v12;
      v29 = bundleClass;
      v13 = MEMORY[0x186DAE9BC](v26);
      v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v13;
      if ((options & 0xC0) == 0x40)
        v15 = 0;
      else
        v15 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, id *))(v13 + 16))(v13, 128, &v31, &v30);
      if ((v15 & 1) == 0 && (options & 0x40) != 0)
        v15 = ((uint64_t (**)(_QWORD, uint64_t, unsigned int *, id *))v14)[2](v14, 1152, &v31, &v30);
      if ((v15 & 1) == 0)
      {
        v18 = _LSEnumeratorLog;
        if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
          -[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:].cold.1((uint64_t)v12, v18, v19, v20, v21, v22, v23, v24);
      }

    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:]", 256, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, v16);

    }
    LODWORD(v4) = v31;
    v8 = v30 != 0;
LABEL_19:
    v7 = 0;
    if ((_DWORD)v4)
    {
      if (v8)
      {
        v25 = [LSApplicationRecord alloc];
        v7 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v25, "_initWithContext:bundleID:bundleData:error:", a3, v31, v30, 0);
      }
    }
    return v7;
  }
  v7 = (id)_LSBundleGet(a3->db, (int)v4);
  v30 = v7;
  if (v7)
  {
    if (!evaluateBundleNoIOCommon(v4, (uint64_t)v7, (const LSBundleData *)self->_options))
      return 0;
    v31 = v4;
    v8 = 1;
    goto LABEL_19;
  }
  return v7;
}

- (BOOL)_enumerateAllBundles
{
  return (~LODWORD(self->_options) & 0xD0) == 0;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSURL *volumeURL;

  v5 = -[_LSApplicationRecordEnumerator _getContainer:context:error:](self, "_getContainer:context:error:", &self->_container, a3, a4);
  if (v5)
  {
    if (-[_LSApplicationRecordEnumerator _enumerateAllBundles](self, "_enumerateAllBundles"))
      _CSStoreEnumerateUnits();
    else
      _CSStringBindingEnumerateAllBindings();
    v6 = _LSEnumeratorLog;
    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
      -[_LSApplicationRecordEnumerator _prepareWithContext:error:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }
  volumeURL = self->_volumeURL;
  self->_volumeURL = 0;

  return v5;
}

- (BOOL)_getContainer:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (_LSApplicationRecordEnumerator)initWithContext:(LSContext *)a3 volumeURL:(id)a4 options:(unint64_t)a5
{
  _LSApplicationRecordEnumerator *v7;
  _LSApplicationRecordEnumerator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationRecordEnumerator;
  v7 = -[_LSDBEnumerator _initWithContext:](&v10, sel__initWithContext_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_options = a5;
    objc_storeStrong((id *)&v7->_volumeURL, a4);
    v8->_bundleClass = 2;
  }
  return v8;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  vector<unsigned int, std::allocator<unsigned int>> *p_bundleIdentifiersOrUnits;
  unsigned int *begin;

  p_bundleIdentifiersOrUnits = &self->_bundleIdentifiersOrUnits;
  begin = self->_bundleIdentifiersOrUnits.__begin_;
  if (begin)
  {
    p_bundleIdentifiersOrUnits->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_volumeURL, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LSApplicationRecordEnumerator *v5;
  uint64_t v6;
  NSURL *volumeURL;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSURL copyWithZone:](self->_volumeURL, "copyWithZone:", a3);
    volumeURL = v5->_volumeURL;
    v5->_volumeURL = (NSURL *)v6;

    v5->_options = self->_options;
    if (v5 != self)
      std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>((char *)&v5->_bundleIdentifiersOrUnits, (char *)self->_bundleIdentifiersOrUnits.__begin_, (uint64_t)self->_bundleIdentifiersOrUnits.__end_, self->_bundleIdentifiersOrUnits.__end_ - self->_bundleIdentifiersOrUnits.__begin_);
    v5->_container = self->_container;
    v5->_bundleClass = self->_bundleClass;
  }
  return v5;
}

- (unsigned)bundleClass
{
  return self->_bundleClass;
}

- (void)setBundleClass:(unsigned int)a3
{
  self->_bundleClass = a3;
}

- (void)_prepareWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Will enumerate %llu candidate bundle identifiers/units", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end

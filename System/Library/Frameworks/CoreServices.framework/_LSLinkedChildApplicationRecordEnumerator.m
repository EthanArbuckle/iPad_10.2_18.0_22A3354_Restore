@implementation _LSLinkedChildApplicationRecordEnumerator

- (_LSLinkedChildApplicationRecordEnumerator)initWithContext:(LSContext *)a3 parentBundleID:(id)a4 options:(unint64_t)a5
{
  _LSLinkedChildApplicationRecordEnumerator *v7;
  uint64_t v8;
  NSString *parentBundleID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_LSLinkedChildApplicationRecordEnumerator;
  v7 = -[_LSDBEnumerator _initWithContext:](&v11, sel__initWithContext_, a3);
  if (v7)
  {
    v8 = objc_msgSend(a4, "copy");
    parentBundleID = v7->_parentBundleID;
    v7->_parentBundleID = (NSString *)v8;

    v7->_options = a5;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LSLinkedChildApplicationRecordEnumerator *v5;
  _LSLinkedChildApplicationRecordEnumerator *v6;
  uint64_t v7;
  NSString *parentBundleID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LSLinkedChildApplicationRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5 != self)
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>((char *)&v5->_units, (char *)self->_units.__begin_, (uint64_t)self->_units.__end_, self->_units.__end_ - self->_units.__begin_);
  v7 = -[NSString copyWithZone:](self->_parentBundleID, "copyWithZone:", a3);
  parentBundleID = v6->_parentBundleID;
  v6->_parentBundleID = (NSString *)v7;

  v6->_options = self->_options;
  return v6;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  self->_units.__end_ = self->_units.__begin_;
  if (_LSDatabaseGetStringForCFString(a3->db, (const __CFString *)self->_parentBundleID, 0))
    _LSDatabaseEnumeratingBindingMap();
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  unsigned int *begin;
  unint64_t v7;
  LSContext *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v20;

  begin = self->_units.__begin_;
  v7 = self->_units.__end_ - begin;
  if (v7 >= a4)
  {
    v11 = (LSContext *)begin[a4];
    v12 = _LSBundleGet(a5->db, begin[a4]);
    if (v12 && (v13 = v12, evaluateBundleNoIOCommon(v11, v12, (const LSBundleData *)self->_options)))
    {
      v20 = 0;
      v14 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", a5, v11, v13, &v20);
      v15 = v20;
      if (!v14)
      {
        _LSDefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[_LSLinkedChildApplicationRecordEnumerator _getObject:atIndex:context:].cold.1(v11, (uint64_t)v15, v16);

        _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, v15);
      }
      v17 = *a3;
      *a3 = v14;

    }
    else
    {
      v18 = *a3;
      *a3 = 0;

    }
  }
  return v7 >= a4;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  objc_storeStrong((id *)&self->_parentBundleID, 0);
  begin = self->_units.__begin_;
  if (begin)
  {
    self->_units.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

- (void)_getObject:(unsigned int)a1 atIndex:(uint64_t)a2 context:(os_log_t)log .cold.1(unsigned int a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "could not create child record for unit %llx: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end

@implementation _LSExtensionPointRecordEnumerator

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  unsigned int *begin;
  unint64_t v7;
  uint64_t v8;
  id v11;
  id v12;

  begin = self->_extensionIDs.__begin_;
  v7 = self->_extensionIDs.__end_ - begin;
  if (v7 > a4)
  {
    v8 = begin[a4];
    if ((_DWORD)v8)
    {
      if (_LSGetExtensionPointData((uint64_t)a5->db, begin[a4]))
      {
        v11 = -[LSRecord _initWithContext:tableID:unitID:]([LSExtensionPointRecord alloc], "_initWithContext:tableID:unitID:", a5, a5->db->schema.extensionPointTable, v8);
        v12 = *a3;
        *a3 = v11;

      }
    }
  }
  return v7 > a4;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  void *v6;
  int v7;
  int StringForCFString;
  _LSDatabase *db;
  NSObject *v10;
  _QWORD v12[5];
  int v13;
  int v14;

  -[_LSExtensionPointRecordEnumerator parentApplicationRecord](self, "parentApplicationRecord", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unitID");

  StringForCFString = _LSDatabaseGetStringForCFString(a3->db, (const __CFString *)self->_extensionPointID, 0);
  db = a3->db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___LSExtensionPointRecordEnumerator__prepareWithContext_error___block_invoke;
  v12[3] = &unk_1E1044050;
  v12[4] = self;
  v13 = v7;
  v14 = StringForCFString;
  _LSEnumerateExtensionPoints(db, (uint64_t)v12);
  v10 = _LSEnumeratorLog;
  if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
    -[_LSExtensionPointRecordEnumerator _prepareWithContext:error:].cold.1((uint64_t)self, v10);
  return 1;
}

- (LSApplicationRecord)parentApplicationRecord
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 120, 1);
}

- (_LSExtensionPointRecordEnumerator)initWithExtensionPointIdentifier:(id)a3
{
  _LSExtensionPointRecordEnumerator *v4;
  uint64_t v5;
  NSString *extensionPointID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LSExtensionPointRecordEnumerator;
  v4 = -[_LSDBEnumerator _initWithContext:](&v8, sel__initWithContext_, 0);
  v5 = objc_msgSend(a3, "copy");
  extensionPointID = v4->_extensionPointID;
  v4->_extensionPointID = (NSString *)v5;

  return v4;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  objc_storeStrong((id *)&self->_parentApplicationRecord, 0);
  begin = self->_extensionIDs.__begin_;
  if (begin)
  {
    self->_extensionIDs.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_extensionPointID, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  char *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LSExtensionPointRecordEnumerator;
  v4 = -[_LSDBEnumerator copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    v6 = v4 == (char *)self;
  else
    v6 = 1;
  if (!v6)
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(v4 + 96, (char *)self->_extensionIDs.__begin_, (uint64_t)self->_extensionIDs.__end_, self->_extensionIDs.__end_ - self->_extensionIDs.__begin_);
  return v5;
}

- (void)setParentApplicationRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)_prepareWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t)(*(_QWORD *)(a1 + 104) - *(_QWORD *)(a1 + 96)) >> 2;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Will enumerate %llu EPs", (uint8_t *)&v3, 0xCu);
}

@end

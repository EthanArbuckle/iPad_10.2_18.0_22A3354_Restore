@implementation _LSTypeEnumerator

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  void *v6;
  _LSDatabase *db;
  _QWORD v9[5];

  v6 = (void *)MEMORY[0x186DAE7A0](self, a2, a3, a4);
  db = a3->db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47___LSTypeEnumerator__prepareWithContext_error___block_invoke;
  v9[3] = &unk_1E1045760;
  v9[4] = self;
  _UTEnumerateActiveTypes((uint64_t)db, v9);
  objc_autoreleasePoolPop(v6);
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  unsigned int *begin;
  unint64_t v7;
  uint64_t v10;
  id v11;
  id v12;

  begin = self->_typeIDs.__begin_;
  v7 = self->_typeIDs.__end_ - begin;
  if (v7 > a4)
  {
    v10 = begin[a4];
    if (_UTTypeGet())
    {
      v11 = -[LSRecord _initWithContext:tableID:unitID:]([_UTDeclaredTypeRecord alloc], "_initWithContext:tableID:unitID:", a5, a5->db->schema.utypeTable, v10);
      v12 = *a3;
      *a3 = v11;

    }
  }
  return v7 > a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  char *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LSTypeEnumerator;
  v4 = -[_LSDBEnumerator copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    v6 = v4 == (char *)self;
  else
    v6 = 1;
  if (!v6)
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(v4 + 88, (char *)self->_typeIDs.__begin_, (uint64_t)self->_typeIDs.__end_, self->_typeIDs.__end_ - self->_typeIDs.__begin_);
  return v5;
}

- (void).cxx_destruct
{
  vector<unsigned int, std::allocator<unsigned int>> *p_typeIDs;
  unsigned int *begin;

  p_typeIDs = &self->_typeIDs;
  begin = self->_typeIDs.__begin_;
  if (begin)
  {
    p_typeIDs->__end_ = begin;
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

@end

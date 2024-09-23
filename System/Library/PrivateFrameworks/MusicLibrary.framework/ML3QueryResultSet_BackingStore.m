@implementation ML3QueryResultSet_BackingStore

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  int64_t *begin;
  unint64_t v5;

  begin = self->_persistentIDs.__begin_;
  v5 = self->_persistentIDs.__end_ - begin;
  if (v5 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Index (%ld) out of bounds (%lu)"), a3, v5);
    begin = self->_persistentIDs.__begin_;
  }
  return begin[a3];
}

- (unint64_t)count
{
  return self->_persistentIDs.__end_ - self->_persistentIDs.__begin_;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  char *end;
  char *begin;
  uint64_t *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __n128 (*v22)(__n128 *, __n128 *);
  uint64_t (*v23)();
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x4012000000;
  v22 = __Block_byref_object_copy__14080;
  v23 = __Block_byref_object_dispose__14081;
  v25 = 0;
  v26 = 0;
  v24 = "";
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ML3QueryResultSet_BackingStore_enumerateSectionsUsingBlock___block_invoke;
  v11[3] = &unk_1E5B63708;
  v13 = &v19;
  v14 = &v15;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1AF43CDE0](v11);
  begin = self->_sections.__begin_;
  end = self->_sections.__end_;
  if (begin != end)
  {
    v9 = v16;
    do
    {
      v10 = *begin;
      if (v10 != *((unsigned __int8 *)v9 + 24))
      {
        v6[2](v6);
        v9 = v16;
        *((_BYTE *)v16 + 24) = v10;
      }
      ++v20[7];
      ++begin;
    }
    while (begin != end);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (void).cxx_destruct
{
  char *begin;
  int64_t *v4;

  begin = self->_sections.__begin_;
  if (begin)
  {
    self->_sections.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_persistentIDs.__begin_;
  if (v4)
  {
    self->_persistentIDs.__end_ = v4;
    operator delete(v4);
  }
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  int64_t *begin;
  int64_t *end;
  uint64_t v7;
  int64_t *v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  if (begin != end)
  {
    v7 = 0;
    v8 = begin + 1;
    do
    {
      v9 = *(v8 - 1);
      v11 = 0;
      v4[2](v4, v9, v7++, &v11);
      if (v11)
        v10 = 1;
      else
        v10 = v8 == end;
      ++v8;
    }
    while (!v10);
  }

}

- (void)reverseEnumeratePersistentIDsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  uint64_t v5;
  int64_t *end;
  uint64_t v7;
  char v8;

  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  v5 = 0;
  end = self->_persistentIDs.__end_;
  do
  {
    if (end == self->_persistentIDs.__begin_)
      break;
    v8 = 0;
    v7 = *--end;
    v4[2](v4, v7, v5++, &v8);
  }
  while (!v8);

}

- (BOOL)containsPersistentIDs:(const void *)a3
{
  int64_t *begin;
  int64_t *end;
  uint64_t v5;
  unint64_t v6;
  int64_t *v7;
  _QWORD *v8;
  BOOL result;
  BOOL v10;

  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  if (begin == end)
    return 0;
  v5 = *(_QWORD *)a3;
  v6 = *((_QWORD *)a3 + 1);
  v7 = begin + 1;
  do
  {
    v8 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(v5, v6, *(v7 - 1));
    v10 = v8 == 0;
    result = v8 != 0;
    v10 = !v10 || v7++ == end;
  }
  while (!v10);
  return result;
}

- (void)reverseEnumerateSectionsUsingBlock:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  char *begin;
  char *end;
  uint64_t *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __n128 (*v22)(__n128 *, __n128 *);
  uint64_t (*v23)();
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x4012000000;
  v22 = __Block_byref_object_copy__14080;
  v23 = __Block_byref_object_dispose__14081;
  v25 = 0;
  v26 = 0;
  v24 = "";
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ML3QueryResultSet_BackingStore_reverseEnumerateSectionsUsingBlock___block_invoke;
  v11[3] = &unk_1E5B63708;
  v13 = &v19;
  v14 = &v15;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1AF43CDE0](v11);
  begin = self->_sections.__begin_;
  end = self->_sections.__end_;
  if (end != begin)
  {
    v9 = v16;
    do
    {
      v10 = *--end;
      if (v10 != *((unsigned __int8 *)v9 + 24))
      {
        v6[2](v6);
        v9 = v16;
        *((_BYTE *)v16 + 24) = *end;
        begin = self->_sections.__begin_;
      }
      ++v20[7];
    }
    while (end != begin);
  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (id)backingStoreByRemovingPersistentIDs:(const void *)a3
{
  int64_t *end;
  int64_t *begin;
  ML3QueryResultSet_MutableBackingStore *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t *value;
  char *v12;
  int64_t *v13;
  int64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  int64_t *v21;
  int64_t v22;
  char v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  _BYTE *v28;
  uint64_t v29;
  unint64_t v30;
  size_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char v36;

  begin = self->_persistentIDs.__begin_;
  end = self->_persistentIDs.__end_;
  v7 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  if (end != begin)
  {
    v8 = 0;
    if ((unint64_t)(end - begin) <= 1)
      v9 = 1;
    else
      v9 = end - begin;
    do
    {
      v10 = self->_persistentIDs.__begin_[v8];
      if (!std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(*(_QWORD *)a3, *((_QWORD *)a3 + 1), v10))
      {
        v12 = (char *)v7->super._persistentIDs.__end_;
        value = v7->super._persistentIDs.__end_cap_.__value_;
        if (v12 >= (char *)value)
        {
          v14 = v7->super._persistentIDs.__begin_;
          v15 = (v12 - (char *)v14) >> 3;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61)
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          v17 = (char *)value - (char *)v14;
          if (v17 >> 2 > v16)
            v16 = v17 >> 2;
          v18 = (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8;
          v19 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v18)
            v19 = v16;
          if (v19)
          {
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v19);
            v14 = v7->super._persistentIDs.__begin_;
            v12 = (char *)v7->super._persistentIDs.__end_;
          }
          else
          {
            v20 = 0;
          }
          v21 = (int64_t *)(v19 + 8 * v15);
          *v21 = v10;
          v13 = v21 + 1;
          while (v12 != (char *)v14)
          {
            v22 = *((_QWORD *)v12 - 1);
            v12 -= 8;
            *--v21 = v22;
          }
          v7->super._persistentIDs.__begin_ = v21;
          v7->super._persistentIDs.__end_ = v13;
          v7->super._persistentIDs.__end_cap_.__value_ = (int64_t *)(v19 + 8 * v20);
          if (v14)
            operator delete(v14);
        }
        else
        {
          *(_QWORD *)v12 = v10;
          v13 = (int64_t *)(v12 + 8);
        }
        v7->super._persistentIDs.__end_ = v13;
        v23 = self->_sections.__begin_[v8];
        v25 = v7->super._sections.__end_;
        v24 = v7->super._sections.__end_cap_.__value_;
        if (v25 >= v24)
        {
          v27 = v7->super._sections.__begin_;
          v28 = (_BYTE *)(v25 - v27);
          v29 = v25 - v27 + 1;
          if (v29 < 0)
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          v30 = v24 - v27;
          if (2 * v30 > v29)
            v29 = 2 * v30;
          if (v30 >= 0x3FFFFFFFFFFFFFFFLL)
            v31 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v31 = v29;
          if (v31)
            v32 = (char *)operator new(v31);
          else
            v32 = 0;
          v33 = &v28[(_QWORD)v32];
          v34 = &v28[(_QWORD)v32];
          *v34 = v23;
          v26 = v34 + 1;
          if (v25 != v27)
          {
            v35 = &v25[~(unint64_t)v27];
            do
            {
              v36 = *--v25;
              (v35--)[(_QWORD)v32] = v36;
            }
            while (v25 != v27);
            v25 = v7->super._sections.__begin_;
            v33 = v32;
          }
          v7->super._sections.__begin_ = v33;
          v7->super._sections.__end_ = v26;
          v7->super._sections.__end_cap_.__value_ = &v32[v31];
          if (v25)
            operator delete(v25);
        }
        else
        {
          *v25 = v23;
          v26 = v25 + 1;
        }
        v7->super._sections.__end_ = v26;
      }
      ++v8;
    }
    while (v8 != v9);
  }
  return v7;
}

@end

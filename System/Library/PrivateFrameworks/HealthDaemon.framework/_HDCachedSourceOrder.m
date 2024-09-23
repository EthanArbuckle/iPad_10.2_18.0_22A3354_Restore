@implementation _HDCachedSourceOrder

- (id)sources
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;

  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3));
    v4 = *(_QWORD **)(a1 + 16);
    v3 = *(_QWORD **)(a1 + 24);
    while (v4 != v3)
    {
      objc_msgSend(v2, "addObject:", *v4);
      v4 += 3;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (char)initWithSources:(char)a3 userOrdered:(char)a4 isDefaultOrder:
{
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id *v21;
  id *i;
  void *v23;
  objc_super v25;

  if (!a1)
    return 0;
  v25.receiver = a1;
  v25.super_class = (Class)_HDCachedSourceOrder;
  v7 = (char *)objc_msgSendSuper2(&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v7 + 16 != (char *)a2)
    {
      v10 = *a2;
      v9 = a2[1];
      v11 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3);
      v12 = (id *)*((_QWORD *)v7 + 2);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v7 + 4) - (_QWORD)v12) >> 3) >= v11)
      {
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v7 + 3) - (_QWORD)v12) >> 3) >= v11)
        {
          v21 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *>(v10, v9, v12);
          for (i = (id *)*((_QWORD *)v8 + 3); i != v21; i -= 3)
          {
            v23 = *(i - 3);

          }
          *((_QWORD *)v8 + 3) = v21;
        }
        else
        {
          v17 = v10 + 8 * ((uint64_t)(*((_QWORD *)v7 + 3) - (_QWORD)v12) >> 3);
          std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *>(v10, v17, v12);
          v18 = *((_QWORD *)v8 + 3);
          if (v17 != v9)
          {
            v19 = *((_QWORD *)v8 + 3);
            do
            {
              *(_QWORD *)v19 = *(id *)v17;
              v20 = *(_BYTE *)(v17 + 16);
              *(_QWORD *)(v19 + 8) = *(_QWORD *)(v17 + 8);
              *(_BYTE *)(v19 + 16) = v20;
              v18 += 24;
              v17 += 24;
              v19 += 24;
            }
            while (v17 != v9);
          }
          *((_QWORD *)v8 + 3) = v18;
        }
      }
      else
      {
        std::vector<_HDWrappedSource>::__vdeallocate((void **)v7 + 2);
        if (v11 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v13 = 0x5555555555555556 * ((uint64_t)(*((_QWORD *)v8 + 4) - *((_QWORD *)v8 + 2)) >> 3);
        if (v13 <= v11)
          v13 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v8 + 4) - *((_QWORD *)v8 + 2)) >> 3) >= 0x555555555555555)
          v14 = 0xAAAAAAAAAAAAAAALL;
        else
          v14 = v13;
        std::vector<_HDWrappedSource>::__vallocate[abi:ne180100]((_QWORD *)v8 + 2, v14);
        v15 = *((_QWORD *)v8 + 3);
        while (v10 != v9)
        {
          *(_QWORD *)v15 = *(id *)v10;
          v16 = *(_BYTE *)(v10 + 16);
          *(_QWORD *)(v15 + 8) = *(_QWORD *)(v10 + 8);
          *(_BYTE *)(v15 + 16) = v16;
          v15 += 24;
          v10 += 24;
        }
        *((_QWORD *)v8 + 3) = v15;
      }
    }
    v8[8] = a3;
    v8[9] = a4;
  }
  return v8;
}

- (char)orderedSources
{
  *(_QWORD *)result = 0;
  *((_QWORD *)result + 1) = 0;
  *((_QWORD *)result + 2) = 0;
  if (a2)
    return std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>(result, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16)) >> 3));
  return result;
}

- (_HDCachedSourceOrder)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (id)description
{
  void *v3;
  id *begin;
  _HDWrappedSource *end;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 userOrdered;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((self->_orderedSources.__end_ - self->_orderedSources.__begin_) >> 3));
  begin = (id *)self->_orderedSources.__begin_;
  end = self->_orderedSources.__end_;
  while (begin != (id *)end)
  {
    objc_msgSend(*begin, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    begin += 3;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  userOrdered = self->_userOrdered;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = "YES";
  if (!userOrdered)
    v12 = "NO";
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%p> userOrder:%s sources:%@"), v8, self, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _HDWrappedSource *end;
  _HDWrappedSource *begin;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_userOrdered == *((unsigned __int8 *)v4 + 8)
    && self->_isDefaultSourceOrder == *((unsigned __int8 *)v4 + 9)
    && (begin = self->_orderedSources.__begin_, end = self->_orderedSources.__end_,
                                                v7 = v4[2],
                                                end - begin == v4[3] - v7))
  {
    v8 = 1;
    while (begin != end)
    {
      if (*(_QWORD *)begin != *(_QWORD *)v7
        && (!*(_QWORD *)v7 || !objc_msgSend(*(id *)begin, "isEqual:"))
        || *((double *)begin + 1) != *(double *)(v7 + 8))
      {
        goto LABEL_12;
      }
      begin = (_HDWrappedSource *)((char *)begin + 24);
      v7 += 24;
    }
  }
  else
  {
LABEL_12:
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  vector<_HDWrappedSource, std::allocator<_HDWrappedSource>> *p_orderedSources;

  p_orderedSources = &self->_orderedSources;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_orderedSources);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

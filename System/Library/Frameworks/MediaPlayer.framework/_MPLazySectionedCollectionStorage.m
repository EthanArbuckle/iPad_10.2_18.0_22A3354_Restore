@implementation _MPLazySectionedCollectionStorage

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = (char *)self + 96;
  return self;
}

- (void).cxx_destruct
{
  int64_t *begin;

  std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::destroy((_QWORD *)self->_sectionIdentifierSetMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_sectionsCache, 0);
  std::__tree<std::__value_type<long,MPIdentifierSet * {__strong}>,std::__map_value_compare<long,std::__value_type<long,MPIdentifierSet * {__strong}>,std::less<long>,true>,std::allocator<std::__value_type<long,MPIdentifierSet * {__strong}>>>::destroy((_QWORD *)self->_itemIdentifierSetMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_itemsCache, 0);
  begin = self->_cachedNumberOfItemsInSections.__begin_;
  if (begin)
  {
    self->_cachedNumberOfItemsInSections.__end_ = begin;
    operator delete(begin);
  }
}

- (id)_stateDumpObject
{
  void *v3;
  int64_t *end;
  int64_t *begin;
  unint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_cachedNumberOfSections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_cachedNumberOfItemsInSections.__begin_;
  end = self->_cachedNumberOfItemsInSections.__end_;
  if (end != begin)
  {
    v6 = 0;
    do
    {
      v7 = begin[v6];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zu: %ld"), v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        begin = self->_cachedNumberOfItemsInSections.__begin_;
        end = self->_cachedNumberOfItemsInSections.__end_;
      }
      ++v6;
    }
    while (v6 < end - begin);
  }
  v14[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = CFSTR("hasValidCachedNumberOfSections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasValidCachedNumberOfSections);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("cachedNumberOfSections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cachedNumberOfSections);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = CFSTR("cachedNumberOfItemsInSections");
  v15[2] = v11;
  v15[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

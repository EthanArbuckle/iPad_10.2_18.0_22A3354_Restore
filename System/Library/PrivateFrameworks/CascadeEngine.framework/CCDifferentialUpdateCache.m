@implementation CCDifferentialUpdateCache

- (BOOL)addUnmodifiedSourceItemIdHash:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = objc_msgSend(v4, "longLongValue");
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&self->_unmodified_set, (unint64_t *)&v9, &v9);
    v7 = v6 & 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasUnmodifiedSourceItemIdHash:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = objc_msgSend(v4, "longLongValue");
    v6 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>(&self->_unmodified_set.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v8) != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)&self->_unmodified_set);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (CCDifferentialUpdateCache)initWithCapacity:(unint64_t)a3
{
  CCDifferentialUpdateCache *v4;
  CCDifferentialUpdateCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCDifferentialUpdateCache;
  v4 = -[CCDifferentialUpdateCache init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__rehash<true>((uint64_t)&v4->_unmodified_set, vcvtps_u32_f32((float)a3 / v4->_unmodified_set.__table_.__p3_.__value_));
  return v5;
}

- (CCDifferentialUpdateCache)init
{
  return -[CCDifferentialUpdateCache initWithCapacity:](self, "initWithCapacity:", 0);
}

- (unint64_t)unmodifiedItemCount
{
  return self->_unmodified_set.__table_.__p2_.__value_;
}

@end

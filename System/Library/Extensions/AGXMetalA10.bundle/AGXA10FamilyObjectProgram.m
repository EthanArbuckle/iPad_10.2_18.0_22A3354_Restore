@implementation AGXA10FamilyObjectProgram

- (void).cxx_destruct
{
  ObjectProgram *p_impl;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  unsigned int *begin;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *value;
  unint64_t mutableBuffers;

  p_impl = &self->_impl;
  v4 = *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[1].cs.pcf.var0;
  if (v4)
  {
    v5 = (unint64_t)LODWORD(self[2]._impl.variants.initial_chunk.keys[1].cs.var0.key) << 32;
    while (1)
    {
      while (1)
      {
        v6 = *(NSObject **)(v4 + 24 * v5 + 144);
        if (v6)
          dispatch_release(v6);
        v7 = (v5 + 1);
        if (v7 < HIDWORD(v5))
          break;
        v4 = *(_QWORD *)(v4 + 224);
        v5 = 0x400000000;
        if (!v4)
          goto LABEL_9;
      }
      v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!v4)
      {
LABEL_9:
        if (!(_DWORD)v5)
          break;
      }
    }
  }
  v8 = 0;
  v9 = &self[1]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__s.__data_[8];
  do
  {
    v10 = *(_QWORD *)((char *)&self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.var0 + v8);
    if (v10)
    {
      if (*(char *)(v10 + 199) < 0)
        operator delete(*(void **)(v10 + 176));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 144));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 120));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 96));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 72));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 48));
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)(v10 + 24));
      MEMORY[0x234927ECC](v10, 0x1032C40E5532501);
    }
    v8 += 8;
  }
  while (v8 != 248);
  v11 = *(char **)&self[2]._impl.variants.initial_chunk.keys[1].cs.pcf.var0;
  if (v11 != v9)
  {
    do
    {
      v12 = (char *)*((_QWORD *)v11 + 28);
      MEMORY[0x234927ECC]();
      *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[1].cs.pcf.var0 = v12;
      v11 = v12;
    }
    while (v12 != v9);
  }
  begin = self[1]._impl.variants.initial_chunk.keys[3].stream.__begin_;
  if (begin != (unsigned int *)p_impl)
  {
    do
    {
      v14 = (unsigned int *)*((_QWORD *)begin + 104);
      v15 = VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::G9::ObjectProgramVariant>,4u>::Chunk::~Chunk((uint64_t)begin);
      MEMORY[0x234927ECC](v15, 0x10B2C40CE86BACFLL);
      self[1]._impl.variants.initial_chunk.keys[3].stream.__begin_ = v14;
      begin = v14;
    }
    while (v14 != (unsigned int *)p_impl);
  }
  value = self[1]._impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_;
  if (value)
    dispatch_release((dispatch_object_t)value);
  mutableBuffers = self[1]._impl.variants.initial_chunk.keys[3].cs.mutableBuffers;
  if (mutableBuffers)
    (*(void (**)(unint64_t))(*(_QWORD *)mutableBuffers + 8))(mutableBuffers);

  VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::G9::ObjectProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

- (id).cxx_construct
{
  self[1]._impl.variants.initial_chunk.keys[3].stream.__begin_ = (unsigned int *)VectorMap<AGX::ObjectProgramKey,AGX::ProgramVariantEntry<AGX::G9::ObjectProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  LODWORD(self[1]._impl.variants.initial_chunk.keys[3].stream.__end_) = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[3].cs.pcf.var0 = 0u;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[1]._impl.variants.initial_chunk.keys[3].cs.var0 + 2) = 0u;
  *(_QWORD *)&self[1]._impl.variants.initial_chunk.keys[3].streamType = 0;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self[1]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.var0 = 0u;
  *((_OWORD *)&self[1]._impl.variants.initial_chunk + 28) = 0u;
  *(_OWORD *)&self[1]._impl.variants.__r.__words[1] = 0u;
  *(_OWORD *)&self[2].super.isa = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].streamType = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].stream.__end_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].cs.mutableBuffers = 0u;
  self[2]._impl.variants.initial_chunk.keys[0].cs.var0 = 0u;
  *(_OWORD *)self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].streamType = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].stream.__end_ = 0u;
  *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[1].cs.pcf.var0 = (char *)self + 912;
  *(_DWORD *)&self[2]._impl.variants.initial_chunk.keys[1].cs.var0.var0 = 0;
  self[2]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers = 0;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[2]._impl.variants.initial_chunk.keys[1].cs.var0 + 8) = 0u;
  *((_DWORD *)&self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l + 4) = 0;
  self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.var0 = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].stream.__begin_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].cs.pcf.var0 = 0u;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[2]._impl.variants.initial_chunk.keys[2].cs.var0 + 8) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.var0 = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].stream.__begin_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].cs.pcf.var0 = 0u;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[2]._impl.variants.initial_chunk.keys[3].cs.var0 + 8) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.var0 = 0u;
  *(_OWORD *)((char *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.var0 + 1) = 0u;
  return self;
}

@end

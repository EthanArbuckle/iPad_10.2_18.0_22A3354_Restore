@implementation AGXA10FamilyFragmentProgram

- (void).cxx_destruct
{
  FragmentProgram *p_impl;
  char *data;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t *p_var0;
  uint64_t v10;
  char *v11;
  char *v12;
  unint64_t mutableBuffers;
  unint64_t v14;
  uint64_t v15;
  NSObject *key;
  uint64_t v17;

  p_impl = &self->_impl;
  data = self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__data_;
  if (data)
  {
    v5 = (unint64_t)LODWORD(self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__size_) << 32;
    while (1)
    {
      while (1)
      {
        v6 = *(NSObject **)&data[24 * v5 + 144];
        if (v6)
          dispatch_release(v6);
        v7 = (v5 + 1);
        if (v7 < HIDWORD(v5))
          break;
        data = (char *)*((_QWORD *)data + 28);
        v5 = 0x400000000;
        if (!data)
          goto LABEL_9;
      }
      v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!data)
      {
LABEL_9:
        if (!(_DWORD)v5)
          break;
      }
    }
  }
  v8 = 0;
  p_var0 = &self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.var0;
  do
  {
    v10 = *(_QWORD *)((char *)&self[3]._impl.variants.initial_chunk.keys[2].streamType + v8);
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
  v11 = self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__data_;
  if (v11 != (char *)p_var0)
  {
    do
    {
      v12 = (char *)*((_QWORD *)v11 + 28);
      MEMORY[0x234927ECC]();
      self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__data_ = v12;
      v11 = v12;
    }
    while (v12 != (char *)p_var0);
  }
  mutableBuffers = self[2]._impl.variants.initial_chunk.keys[3].cs.mutableBuffers;
  if ((FragmentProgram *)mutableBuffers != p_impl)
  {
    do
    {
      v14 = *(_QWORD *)(mutableBuffers + 1344);
      v15 = VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::G9::FragmentProgramVariant>,4u>::Chunk::~Chunk(mutableBuffers);
      MEMORY[0x234927ECC](v15, 0x10B2C40D3941106);
      self[2]._impl.variants.initial_chunk.keys[3].cs.mutableBuffers = v14;
      mutableBuffers = v14;
    }
    while ((FragmentProgram *)v14 != p_impl);
  }
  key = self[2]._impl.variants.initial_chunk.keys[3].cs.var0.key;
  if (key)
    dispatch_release(key);
  v17 = *(&self[2]._impl.variants.initial_chunk.keys[3].cs.var0.key + 1);
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);

  VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::G9::FragmentProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

- (id).cxx_construct
{
  self[2]._impl.variants.initial_chunk.keys[3].cs.mutableBuffers = (unint64_t)VectorMap<AGX::FragmentProgramKey,AGX::ProgramVariantEntry<AGX::G9::FragmentProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  self[2]._impl.variants.initial_chunk.keys[3].cs.pcf.key = 0;
  self[2]._impl.variants.initial_chunk.keys[3].cs.var0 = 0u;
  *(_OWORD *)self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *(_OWORD *)((char *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__l.__size_
            + 2) = 0u;
  self[2]._impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_ = 0;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)self[2]._impl.variants.var0.__words = 0u;
  *(_OWORD *)&self[2]._impl.variants.var0.__words[2] = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].stream.__begin_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].cs.pcf.var0 = 0u;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[3]._impl.variants.initial_chunk.keys[0].cs.var0 + 8) = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.var0 = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1]._vptr$ProgramKey = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].stream.__begin_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].stream.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].cs.pcf.var0 = 0u;
  self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__data_ = (char *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.var0;
  LODWORD(self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l.__size_) = 0;
  *(&self[3]._impl.variants.initial_chunk.keys[1].cs.var0.key + 1) = 0;
  *((_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  LODWORD(self[3]._impl.variants.initial_chunk.keys[2]._vptr$ProgramKey) = 0;
  self[3]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.var0 = 0;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[2].streamType = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[2].stream.__end_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[2].cs.mutableBuffers = 0u;
  self[3]._impl.variants.initial_chunk.keys[2].cs.var0 = 0u;
  *(_OWORD *)self[3]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[3]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[3].streamType = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[3].stream.__end_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[3].cs.mutableBuffers = 0u;
  self[3]._impl.variants.initial_chunk.keys[3].cs.var0 = 0u;
  *(_OWORD *)self[3]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[3]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)self[3]._impl.variants.var0.__words = 0u;
  *(_OWORD *)((char *)&self[3]._impl.variants.var0.__words[1] + 1) = 0u;
  return self;
}

@end

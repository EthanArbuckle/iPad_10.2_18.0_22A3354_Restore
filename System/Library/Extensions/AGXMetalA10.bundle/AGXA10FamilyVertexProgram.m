@implementation AGXA10FamilyVertexProgram

- (void).cxx_destruct
{
  VertexProgram *p_impl;
  unsigned int *begin;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int *p_streamType;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  unint64_t key;
  unint64_t v14;
  uint64_t v15;
  char *data;
  unint64_t size;

  p_impl = &self->_impl;
  begin = self[2]._impl.variants.initial_chunk.keys[3].stream.__begin_;
  if (begin)
  {
    v5 = (unint64_t)LODWORD(self[2]._impl.variants.initial_chunk.keys[3].stream.__end_) << 32;
    while (1)
    {
      while (1)
      {
        v6 = *(NSObject **)&begin[6 * v5 + 36];
        if (v6)
          dispatch_release(v6);
        v7 = (v5 + 1);
        if (v7 < HIDWORD(v5))
          break;
        begin = (unsigned int *)*((_QWORD *)begin + 28);
        v5 = 0x400000000;
        if (!begin)
          goto LABEL_9;
      }
      v5 = v5 & 0xFFFFFFFF00000000 | v7;
      if (!begin)
      {
LABEL_9:
        if (!(_DWORD)v5)
          break;
      }
    }
  }
  v8 = 0;
  p_streamType = &self[2]._impl.variants.initial_chunk.keys[1].streamType;
  do
  {
    v10 = *(unint64_t *)((char *)&self[2]._impl.variants.initial_chunk.keys[3].cs.var0.key + v8 + 8);
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
  v11 = self[2]._impl.variants.initial_chunk.keys[3].stream.__begin_;
  if (v11 != (unsigned int *)p_streamType)
  {
    do
    {
      v12 = (unsigned int *)*((_QWORD *)v11 + 28);
      MEMORY[0x234927ECC]();
      self[2]._impl.variants.initial_chunk.keys[3].stream.__begin_ = v12;
      v11 = v12;
    }
    while (v12 != (unsigned int *)p_streamType);
  }
  key = self[2]._impl.variants.initial_chunk.keys[0].cs.var0.key;
  if ((VertexProgram *)key != p_impl)
  {
    do
    {
      v14 = *(_QWORD *)(key + 1024);
      v15 = VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::G9::VertexProgramVariant>,4u>::Chunk::~Chunk(key);
      MEMORY[0x234927ECC](v15, 0x10B2C4049FF2409);
      self[2]._impl.variants.initial_chunk.keys[0].cs.var0.key = v14;
      key = v14;
    }
    while ((VertexProgram *)v14 != p_impl);
  }
  data = self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l.__data_;
  if (data)
    dispatch_release((dispatch_object_t)data);
  size = self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l.__size_;
  if (size)
    (*(void (**)(unint64_t))(*(_QWORD *)size + 8))(size);

  VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::G9::VertexProgramVariant>,4u>::Chunk::~Chunk((uint64_t)p_impl);
}

- (id).cxx_construct
{
  self[2]._impl.variants.initial_chunk.keys[0].cs.var0.key = (unint64_t)VectorMap<AGX::VertexProgramKey,AGX::ProgramVariantEntry<AGX::G9::VertexProgramVariant>,4u>::Chunk::Chunk(&self->_impl);
  *((_DWORD *)&self[2]._impl.variants.initial_chunk.keys[0].cs.var0.var0 + 2) = 0;
  *(_OWORD *)self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)((char *)&self[2]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.var0 + 2) = 0u;
  *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[0].cs.pcf.var0 = 0;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].streamType = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].stream.__end_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].cs.mutableBuffers = 0u;
  self[2]._impl.variants.initial_chunk.keys[1].cs.var0 = 0u;
  *(_OWORD *)self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[1].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].streamType = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].stream.__end_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].cs.mutableBuffers = 0u;
  self[2]._impl.variants.initial_chunk.keys[2].cs.var0 = 0u;
  *(_OWORD *)self[2]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[2].geometry_buffer_desc.var0 = 0u;
  self[2]._impl.variants.initial_chunk.keys[3].stream.__begin_ = (unsigned int *)&self[2]._impl.variants.initial_chunk.keys[1].streamType;
  LODWORD(self[2]._impl.variants.initial_chunk.keys[3].stream.__end_) = 0;
  *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[3].streamType = 0;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].stream.__end_cap_.__value_ = 0u;
  *(_DWORD *)&self[2]._impl.variants.initial_chunk.keys[3].cs.var0.var0 = 0;
  *(_QWORD *)&self[2]._impl.variants.initial_chunk.keys[3].cs.pcf.var0 = 0;
  *($7130C7362630A2286D2DCCE4027C263B *)((char *)&self[2]._impl.variants.initial_chunk.keys[3].cs.var0 + 8) = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self[2]._impl.variants.initial_chunk.keys[3].geometry_buffer_desc.__r_.var0 = 0u;
  *((_OWORD *)&self[2]._impl.variants.initial_chunk + 28) = 0u;
  *(_OWORD *)&self[2]._impl.variants.__r.__words[1] = 0u;
  *(_OWORD *)&self[3].super.isa = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].streamType = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].stream.__end_ = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].cs.mutableBuffers = 0u;
  self[3]._impl.variants.initial_chunk.keys[0].cs.var0 = 0u;
  *(_OWORD *)self[3]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.__r_.__value_.var0.__l + 1) = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[0].geometry_buffer_desc.var0 = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].streamType = 0u;
  *(_OWORD *)&self[3]._impl.variants.initial_chunk.keys[1].stream.__end_ = 0u;
  *(_OWORD *)((char *)&self[3]._impl.variants.initial_chunk.keys[1].stream.__end_cap_.__value_ + 1) = 0u;
  return self;
}

@end

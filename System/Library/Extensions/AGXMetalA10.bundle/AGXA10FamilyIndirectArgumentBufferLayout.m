@implementation AGXA10FamilyIndirectArgumentBufferLayout

- (AGXA10FamilyIndirectArgumentBufferLayout)initWithStructType:(id)a3
{
  AGXA10FamilyIndirectArgumentBufferLayout *v4;
  uint64_t v5;
  void **v6;
  uint64_t value;
  objc_super v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  _QWORD v15[2];

  v9.receiver = self;
  v9.super_class = (Class)AGXA10FamilyIndirectArgumentBufferLayout;
  v4 = -[_MTLIndirectArgumentBufferLayout init](&v9, sel_init);
  if (v4)
  {
    v5 = operator new();
    *(_QWORD *)v5 = 0;
    *(_BYTE *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(v5 + 16) = v5 + 24;
    *(_QWORD *)(v5 + 48) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 40) = v5 + 48;
    *(_QWORD *)(v5 + 72) = 0;
    *(_QWORD *)(v5 + 96) = 0;
    *(_QWORD *)(v5 + 56) = 0;
    *(_QWORD *)(v5 + 64) = v5 + 72;
    *(_QWORD *)(v5 + 80) = 0;
    *(_QWORD *)(v5 + 88) = v5 + 96;
    *(_QWORD *)(v5 + 120) = 0;
    *(_QWORD *)(v5 + 104) = 0;
    *(_QWORD *)(v5 + 112) = v5 + 120;
    *(_QWORD *)(v5 + 152) = 0;
    *(_QWORD *)(v5 + 144) = 0;
    *(_QWORD *)(v5 + 128) = 0;
    *(_QWORD *)(v5 + 136) = v5 + 144;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    v6 = (void **)(v5 + 176);
    *(_QWORD *)(v5 + 192) = 0;
    v15[0] = 0;
    v15[1] = 0;
    AGX::IndirectArgumentLayoutGen1<AGX::G9::Encoders>::parseStruct((uint64_t)&v10, v5, a3, (int *)v15, &v14, 0);
    *(_QWORD *)(v5 + 160) = v10;
    *(_BYTE *)(v5 + 168) = v11;
    if (*(char *)(v5 + 199) < 0)
      operator delete(*v6);
    *(_OWORD *)v6 = v12;
    *(_QWORD *)(v5 + 192) = v13;
    value = (uint64_t)v4->_impl.__ptr_.__value_;
    v4->_impl.__ptr_.__value_ = (IndirectArgumentLayout *)v5;
    if (value)
      std::default_delete<AGX::G9::IndirectArgumentLayout>::operator()[abi:nn180100](value);
  }
  return v4;
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t *v5;
  unsigned int v6;

  v5 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a3)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a3)
      return *(void **)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v5 + 8));
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t *v5;
  unsigned int v6;

  v5 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a3)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a3)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v5 + 8));
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t *v5;
  unsigned int v6;

  v5 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v5)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v6 = *((_DWORD *)v5 + 7);
      if (v6 <= a3)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    if (v6 >= a3)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v5 + 8));
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForIndirectCommandBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (unint64_t)uniqueIdentifierForAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  v7 = a3;
  -[_MTLIndirectArgumentBufferLayout device](self, "device");
  v9 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 18);
  if (!v9)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v10 = *((_DWORD *)v9 + 7);
      if (v10 <= v7)
        break;
      v9 = (uint64_t *)*v9;
      if (!v9)
        goto LABEL_7;
    }
    if (v10 >= v7)
      return *(_QWORD *)(*(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 24) + a5 + *((unsigned int *)v9 + 8));
    v9 = (uint64_t *)v9[1];
    if (!v9)
      goto LABEL_7;
  }
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return *((_BYTE *)self->_impl.__ptr_.__value_ + 8);
}

- (unint64_t)encodedLength
{
  return *((unsigned int *)self->_impl.__ptr_.__value_ + 40);
}

- (unint64_t)alignment
{
  return *((unsigned int *)self->_impl.__ptr_.__value_ + 41);
}

- (unsigned)hashValue
{
  return *(_DWORD *)self->_impl.__ptr_.__value_;
}

- (unsigned)hashOffset
{
  return *((_DWORD *)self->_impl.__ptr_.__value_ + 1);
}

- (unsigned)hashMask
{
  return -2097152;
}

- (unsigned)hashSignature
{
  return 2145386496;
}

- (unint64_t)constantOffsetAtIndex:(unint64_t)a3
{
  uint64_t *v3;
  unsigned int v4;

  v3 = (uint64_t *)*((_QWORD *)self->_impl.__ptr_.__value_ + 15);
  if (!v3)
LABEL_7:
    abort();
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v3 + 7);
      if (v4 <= a3)
        break;
      v3 = (uint64_t *)*v3;
      if (!v3)
        goto LABEL_7;
    }
    if (v4 >= a3)
      return *((unsigned int *)v3 + 8);
    v3 = (uint64_t *)v3[1];
    if (!v3)
      goto LABEL_7;
  }
}

- (void).cxx_destruct
{
  IndirectArgumentLayout *value;

  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<AGX::G9::IndirectArgumentLayout>::operator()[abi:nn180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

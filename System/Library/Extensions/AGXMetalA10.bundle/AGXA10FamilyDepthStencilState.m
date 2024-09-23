@implementation AGXA10FamilyDepthStencilState

- (BOOL)readsDepth
{
  return self->_impl.desc.label.__r_.var0 & 1;
}

- (BOOL)writesDepth
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 1) & 1;
}

- (BOOL)readsStencil
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 2) & 1;
}

- (BOOL)writesStencil
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 3) & 1;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_impl.desc.label.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_impl.desc.label.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((_QWORD *)self + 4) = 0;
  *(_QWORD *)((char *)self + 76) = 0xE0000000E000000;
  return self;
}

@end

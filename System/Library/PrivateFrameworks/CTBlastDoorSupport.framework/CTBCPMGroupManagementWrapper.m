@implementation CTBCPMGroupManagementWrapper

- (CTBCPMGroupManagementWrapper)initWithWrapped:(optional<ctb::CPMGroupManagement> *)a3
{
  CTBCPMGroupManagementWrapper *v4;
  CTBCPMGroupManagementWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTBCPMGroupManagementWrapper;
  v4 = -[CTBCPMGroupManagementWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__optional_storage_base<ctb::CPMGroupManagement,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::CPMGroupManagement,false>>((uint64_t)&v4->_wrapped, (__n128 *)a3);
  return v5;
}

- (optional<ctb::CPMGroupManagement>)wrapped
{
  uint64_t v1;

  return (optional<ctb::CPMGroupManagement> *)std::__optional_copy_base<ctb::CPMGroupManagement,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, v1 + 8);
}

- (void).cxx_destruct
{
  if (LOBYTE(self->_wrapped.var0.var1.fId.var0))
  {
    if (*((char *)&self->_wrapped.var0.var1.fId.__r_.__value_.var0.var1 + 23) < 0)
      operator delete(self->_wrapped.var0.var1.fId.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 40) = 0;
  return self;
}

@end

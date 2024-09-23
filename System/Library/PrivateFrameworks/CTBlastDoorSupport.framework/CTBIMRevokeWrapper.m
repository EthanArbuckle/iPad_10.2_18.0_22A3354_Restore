@implementation CTBIMRevokeWrapper

- (CTBIMRevokeWrapper)initWithWrapped:(optional<ctb::IMRevoke> *)a3
{
  CTBIMRevokeWrapper *v4;
  CTBIMRevokeWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTBIMRevokeWrapper;
  v4 = -[CTBIMRevokeWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__optional_storage_base<ctb::IMRevoke,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::IMRevoke,false>>((uint64_t)&v4->_wrapped, (__int128 *)&a3->var0.var0);
  return v5;
}

- (optional<ctb::IMRevoke>)wrapped
{
  uint64_t v1;

  return (optional<ctb::IMRevoke> *)std::__optional_copy_base<ctb::IMRevoke,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, v1 + 8);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<ctb::IMRevoke,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 88) = 0;
  return self;
}

@end

@implementation CTBIMCompositionIndicationWrapper

- (CTBIMCompositionIndicationWrapper)initWithWrapped:(optional<ctb::IMCompositionIndication> *)a3
{
  CTBIMCompositionIndicationWrapper *v4;
  CTBIMCompositionIndicationWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTBIMCompositionIndicationWrapper;
  v4 = -[CTBIMCompositionIndicationWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__optional_storage_base<ctb::IMCompositionIndication,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::IMCompositionIndication,false>>((uint64_t)&v4->_wrapped, (__n128 *)a3);
  return v5;
}

- (optional<ctb::IMCompositionIndication>)wrapped
{
  uint64_t v1;

  return (optional<ctb::IMCompositionIndication> *)std::__optional_copy_base<ctb::IMCompositionIndication,false>::__optional_copy_base[abi:ne180100](retstr, v1 + 8);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<ctb::IMCompositionIndication,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 72) = 0;
  return self;
}

@end

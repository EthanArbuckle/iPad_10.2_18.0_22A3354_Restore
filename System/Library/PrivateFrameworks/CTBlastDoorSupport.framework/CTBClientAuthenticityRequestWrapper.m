@implementation CTBClientAuthenticityRequestWrapper

- (CTBClientAuthenticityRequestWrapper)initWithWrapped:(optional<ctb::ClientAuthenticityRequest> *)a3
{
  CTBClientAuthenticityRequestWrapper *v4;
  CTBClientAuthenticityRequestWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTBClientAuthenticityRequestWrapper;
  v4 = -[CTBClientAuthenticityRequestWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__optional_storage_base<ctb::ClientAuthenticityRequest,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::ClientAuthenticityRequest,false>>((uint64_t)&v4->_wrapped, (__n128 *)a3);
  return v5;
}

- (optional<ctb::ClientAuthenticityRequest>)wrapped
{
  return (optional<ctb::ClientAuthenticityRequest> *)std::__optional_copy_base<ctb::ClientAuthenticityRequest,false>::__optional_copy_base[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
  optional<ctb::ClientAuthenticityRequest> *p_wrapped;

  if (self->_wrapped.__engaged_)
  {
    p_wrapped = &self->_wrapped;
    std::vector<ctb::ClientAuthenticityRequest::Method>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_wrapped);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end

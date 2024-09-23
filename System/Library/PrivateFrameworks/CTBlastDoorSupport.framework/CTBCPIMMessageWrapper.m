@implementation CTBCPIMMessageWrapper

- (CTBCPIMMessageWrapper)initWithWrapped:(optional<ctb::CPIMMessage> *)a3
{
  CTBCPIMMessageWrapper *v4;
  CTBCPIMMessageWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTBCPIMMessageWrapper;
  v4 = -[CTBCPIMMessageWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__optional_storage_base<ctb::CPIMMessage,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::CPIMMessage,false>>((ctb::CPIMMessage *)&v4->_wrapped, (uint64_t)a3);
  return v5;
}

- (optional<ctb::CPIMMessage>)wrapped
{
  uint64_t v1;

  return (optional<ctb::CPIMMessage> *)std::__optional_copy_base<ctb::CPIMMessage,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, (const ctb::CPIMMessage *)(v1 + 8));
}

- (void).cxx_destruct
{
  if (LOBYTE(self[2]._wrapped.var1))
    ctb::CPIMMessage::~CPIMMessage((void **)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 176) = 0;
  return self;
}

@end

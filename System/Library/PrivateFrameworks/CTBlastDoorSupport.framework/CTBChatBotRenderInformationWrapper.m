@implementation CTBChatBotRenderInformationWrapper

- (CTBChatBotRenderInformationWrapper)initWithWrapped:(optional<ctb:(optional<ctb:(optional<ctb::chatbot::WebResources> *)a5 :chatbot::CategoryList> *)a4 :chatbot::RenderInformation> *)a3
{
  CTBChatBotRenderInformationWrapper *v6;
  CTBChatBotRenderInformationWrapper *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTBChatBotRenderInformationWrapper;
  v6 = -[CTBChatBotRenderInformationWrapper init](&v9, sel_init, a3, a4, a5);
  v7 = v6;
  if (v6)
    std::__optional_storage_base<ctb::chatbot::RenderInformation,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::chatbot::RenderInformation,false>>((ctb::chatbot::BotInformation *)&v6->_wrapped, (uint64_t)a3);
  return v7;
}

- (optional<ctb::chatbot::RenderInformation>)wrapped
{
  return (optional<ctb::chatbot::RenderInformation> *)std::__optional_copy_base<ctb::chatbot::RenderInformation,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, (const ctb::chatbot::RenderInformation *)&self->_wrapped);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<ctb::chatbot::RenderInformation,false>::~__optional_destruct_base[abi:ne180100]((void **)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 688) = 0;
  return self;
}

@end

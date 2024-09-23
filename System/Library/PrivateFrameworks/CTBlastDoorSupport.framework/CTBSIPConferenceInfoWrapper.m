@implementation CTBSIPConferenceInfoWrapper

- (CTBSIPConferenceInfoWrapper)initWithWrapped:(optional<ctb:(BOOL)a4 :SIPConferenceInfo> *)a3
{
  CTBSIPConferenceInfoWrapper *v5;
  CTBSIPConferenceInfoWrapper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTBSIPConferenceInfoWrapper;
  v5 = -[CTBSIPConferenceInfoWrapper init](&v8, sel_init, a3, a4);
  v6 = v5;
  if (v5)
    std::__optional_storage_base<ctb::SIPConferenceInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::SIPConferenceInfo,false>>((uint64_t)&v5->_wrapped, (uint64_t)a3);
  return v6;
}

- (optional<ctb::SIPConferenceInfo>)wrapped
{
  return (optional<ctb::SIPConferenceInfo> *)std::__optional_copy_base<ctb::SIPConferenceInfo,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<ctb::SIPConferenceInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 104) = 0;
  return self;
}

@end

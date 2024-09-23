@implementation CTBProvisioningConfigurationWrapper

- (CTBProvisioningConfigurationWrapper)initWithWrapped:(optional<ctb:()set<std:()std:(std:()set<std:()std:(std:()basic_string<char :()std:(std::allocator<char>> *)a6 :char_traits<char> allocator<std::string>> *)a5 :less<std::string> :string :allocator<std::string>> *)a4 :less<std::string> :string :ProvisioningConfiguration> *)a3
{
  CTBProvisioningConfigurationWrapper *v7;
  CTBProvisioningConfigurationWrapper *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTBProvisioningConfigurationWrapper;
  v7 = -[CTBProvisioningConfigurationWrapper init](&v10, sel_init, a3, a4, a5, a6);
  v8 = v7;
  if (v7)
    std::__optional_storage_base<ctb::ProvisioningConfiguration,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::ProvisioningConfiguration,false>>((uint64_t)&v7->_wrapped, (uint64_t)a3);
  return v8;
}

- (optional<ctb::ProvisioningConfiguration>)wrapped
{
  return (optional<ctb::ProvisioningConfiguration> *)std::__optional_copy_base<ctb::ProvisioningConfiguration,false>::__optional_copy_base[abi:ne180100]((ctb::ProvisioningConfiguration *)retstr, (const ctb::ProvisioningConfiguration *)&self->_wrapped);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<ctb::ProvisioningConfiguration,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_wrapped);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 1160) = 0;
  return self;
}

@end

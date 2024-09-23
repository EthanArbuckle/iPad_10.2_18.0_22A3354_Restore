@implementation ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3;
  Security::Universal *v4;
  char *v5;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (Security::Universal *)(*(uint64_t (**)(_QWORD *))(**((_QWORD **)a2 + 4) + 80))(*((_QWORD **)a2 + 4));
  v7 = Security::Universal::bestNativeArch(v4);
  v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)(v3 + 232), v7, (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes((uint64_t **)v5 + 5, a2);
}

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke_2(uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3;
  Security::Universal *v4;
  char *v5;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (Security::Universal *)(*(uint64_t (**)(_QWORD *))(**((_QWORD **)a2 + 4) + 80))(*((_QWORD **)a2 + 4));
  v7 = Security::Universal::bestNativeArch(v4);
  v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)(v3 + 264), v7, (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions((uint64_t **)v5 + 5, a2);
}

@end

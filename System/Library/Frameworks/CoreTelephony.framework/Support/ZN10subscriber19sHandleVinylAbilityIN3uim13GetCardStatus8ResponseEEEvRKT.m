@implementation ZN10subscriber19sHandleVinylAbilityIN3uim13GetCardStatus8ResponseEEEvRKT

char *___ZN10subscriber19sHandleVinylAbilityIN3uim13GetCardStatus8ResponseEEEvRKT_RNSt3__16vectorINS_15VinylCapabilityENS7_9allocatorIS9_EEEE_block_invoke_2(uint64_t a1, _BYTE *a2)
{
  int v2;
  int __src;
  uint64_t vars0;

  if (*a2)
    v2 = 2;
  else
    v2 = 1;
  __src = v2;
  return std::vector<subscriber::VinylCapability>::__assign_with_size[abi:ne180100]<subscriber::VinylCapability const*,subscriber::VinylCapability const*>(*(char **)(a1 + 32), &__src, (uint64_t)&vars0, 1uLL);
}

@end

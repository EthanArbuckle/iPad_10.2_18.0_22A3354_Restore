@implementation ZN23EurekaCallCommandDriver17sendUSSDUserReplyENSt3

_QWORD *___ZN23EurekaCallCommandDriver17sendUSSDUserReplyENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN10subscriber7SimSlotE_block_invoke(uint64_t a1, uint64_t a2)
{
  char *v2;
  unint64_t v3;

  *(_DWORD *)a2 = 1;
  if (*(char *)(a1 + 55) < 0)
  {
    v2 = *(char **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v2 = (char *)(a1 + 32);
    v3 = *(unsigned __int8 *)(a1 + 55);
  }
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>((_QWORD *)(a2 + 8), v2, &v2[v3], v3);
}

@end

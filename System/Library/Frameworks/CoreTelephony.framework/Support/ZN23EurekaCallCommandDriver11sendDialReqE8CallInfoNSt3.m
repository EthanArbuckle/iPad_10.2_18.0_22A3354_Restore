@implementation ZN23EurekaCallCommandDriver11sendDialReqE8CallInfoNSt3

_QWORD *___ZN23EurekaCallCommandDriver11sendDialReqE8CallInfoNSt3__18functionIFvRKN2vs13VoiceDialCall8ResponseEEEE_block_invoke(uint64_t a1, _QWORD *a2)
{
  char *v3;
  unint64_t v4;

  if (*(char *)(a1 + 87) < 0)
  {
    v3 = *(char **)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v3 = (char *)(a1 + 64);
    v4 = *(unsigned __int8 *)(a1 + 87);
  }
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(a2, v3, &v3[v4], v4);
}

@end

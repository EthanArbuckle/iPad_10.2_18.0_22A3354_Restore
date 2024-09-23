@implementation NSString

void __46__NSString_SNN__initWithOwnedCXXStringNoCopy___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v1 + 48);
  v2 = (_QWORD *)(v1 + 48);
  v3 = v4;
  *v2 = 0;
  if (v4)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)v2, v3);
}

@end

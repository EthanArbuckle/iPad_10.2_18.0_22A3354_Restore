@implementation ZN18VinylCommandDriver17setVirtualSimModeEbbNSt3

_QWORD *___ZN18VinylCommandDriver17setVirtualSimModeEbbNSt3__18functionIFvN3ctu6resultIb10VinylErrorEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;
  _BOOL8 v3;
  _QWORD *result;
  uint64_t v5;
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 72) != 0;
  v3 = *(_BYTE *)(a1 + 73) != 0;
  std::__function::__value_func<void ()(std::shared_ptr<std::vector<unsigned char>>)>::__value_func[abi:ne180100]((uint64_t)v6, a1 + 40);
  (*(void (**)(uint64_t, _BOOL8, _BOOL8, _BYTE *))(*(_QWORD *)v1 + 312))(v1, v2, v3, v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

@end

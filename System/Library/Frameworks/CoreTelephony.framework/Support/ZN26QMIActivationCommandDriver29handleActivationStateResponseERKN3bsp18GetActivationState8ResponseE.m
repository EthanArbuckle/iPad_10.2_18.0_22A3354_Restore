@implementation ZN26QMIActivationCommandDriver29handleActivationStateResponseERKN3bsp18GetActivationState8ResponseE

_QWORD *___ZN26QMIActivationCommandDriver29handleActivationStateResponseERKN3bsp18GetActivationState8ResponseE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *result;
  int v6;
  __int16 v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((_QWORD *)(v4 + 56), (char *)a2, (char *)(a2 + 20), 0x14uLL);
  *(_BYTE *)(v4 + 80) = 1;
  v6 = *(_DWORD *)(a2 + 20);
  v7 = *(_WORD *)(a2 + 24);
  *(_BYTE *)(v4 + 126) = *(_BYTE *)(a2 + 26);
  *(_WORD *)(v4 + 124) = v7;
  *(_DWORD *)(v4 + 120) = v6;
  *(_BYTE *)(v4 + 127) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128) = 1;
  return result;
}

@end

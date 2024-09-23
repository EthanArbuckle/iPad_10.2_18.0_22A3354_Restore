@implementation ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *result;

  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(*(_QWORD **)(a1 + 32), (char *)a2, (char *)(a2 + 20), 0x14uLL);
  v4 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v4 + 24) = 1;
  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(v4 + 32), *(char **)(a2 + 24), *(char **)(a2 + 32), *(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a2 + 24) != *(_QWORD *)(a2 + 32);
  return result;
}

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke_2(uint64_t a1, char **a2)
{
  _QWORD *result;

  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(*(_QWORD **)(a1 + 32), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return result;
}

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke_3(uint64_t a1, char **a2)
{
  _QWORD *result;

  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  return result;
}

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke_34(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  _BYTE *v4;
  _BYTE *v5;

  v3 = result;
  v4 = *(_BYTE **)a2;
  v5 = *(_BYTE **)(a2 + 8);
  if (v5 != v4)
    result = memmove((void *)(result[4] + 9), v4, v5 - v4);
  *(_BYTE *)(v3[4] + 19) = 1;
  return result;
}

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke_2_36(uint64_t a1, char **a2)
{
  _QWORD *result;

  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return result;
}

_QWORD *___ZL17parseOptionalTLVsIN3bsp22SendActivationManifest8ResponseEEvPKN3ctu11OsLogLoggerER14ActivationInfoT__block_invoke_3_38(uint64_t a1, char **a2)
{
  _QWORD *result;

  result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
  return result;
}

@end

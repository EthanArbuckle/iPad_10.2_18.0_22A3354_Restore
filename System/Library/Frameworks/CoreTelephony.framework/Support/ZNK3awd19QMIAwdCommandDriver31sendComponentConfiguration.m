@implementation ZNK3awd19QMIAwdCommandDriver31sendComponentConfiguration

_QWORD *___ZNK3awd19QMIAwdCommandDriver31sendComponentConfiguration_syncENSt3__110shared_ptrINS_10AppContextEEERKNS1_6vectorIhNS1_9allocatorIhEEEEN8dispatch5blockIU13block_pointerFvbEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  char *v2;

  *(_QWORD *)a2 = 0;
  *(_DWORD *)(a2 + 8) = 1;
  v2 = *(char **)(a1 + 40);
  *(_BYTE *)(a2 + 12) = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(a2 + 13) = *(_DWORD *)(a1 + 56);
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((_QWORD *)(a2 + 16), v2, *(char **)(a1 + 48), *(_QWORD *)(a1 + 48) - (_QWORD)v2);
}

@end

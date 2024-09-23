@implementation ZN16SSSHapticsPlayer17playHapticPatternEPK14

_QWORD *___ZN16SSSHapticsPlayer17playHapticPatternEPK14__CFDictionaryP20SSPlayerSynchronizerbbNSt3__18functionIFvvEEE_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *result;
  uint64_t v4;
  _QWORD block[4];
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SSSQueue::mSSSDispatchQueueInitialization != -1)
    dispatch_once(&SSSQueue::mSSSDispatchQueueInitialization, &__block_literal_global_5374);
  v2 = (id)SSSQueue::mSSSHighPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = ___ZN16SSSHapticsPlayer17playHapticPatternEPK14__CFDictionaryP20SSPlayerSynchronizerbbNSt3__18functionIFvvEEE_block_invoke_2;
  block[3] = &__block_descriptor_64_ea8_32c27_ZTSNSt3__18functionIFvvEEE_e5_v8__0l;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)v6, a1 + 32);
  dispatch_async(v2, block);

  result = v7;
  if (v7 == v6)
  {
    v4 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

@end

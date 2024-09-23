@implementation ZN16AdobeXMPCore

_QWORD *___ZN16AdobeXMPCore_IntL23sDefaultMemoryAllocatorEv_block_invoke()
{
  _QWORD *v0;
  _QWORD *result;

  v0 = (_QWORD *)operator new();
  result = AdobeXMPCore_Int::MemoryAllocatorWrapperImpl::MemoryAllocatorWrapperImpl(v0);
  AdobeXMPCore_Int::gDefaultMemoryAllocator = (uint64_t)v0;
  return result;
}

_QWORD *___ZN16AdobeXMPCore_IntL21sDefaultErrorNotifierEv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &unk_1E1BBA508;
  AdobeXMPCore_Int::gDefaultErrorNotifier = (uint64_t)result;
  return result;
}

@end

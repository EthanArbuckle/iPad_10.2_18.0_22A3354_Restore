@implementation EXConnectionHandlerScene

uint64_t __52___EXConnectionHandlerScene_shouldAcceptConnection___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "conformsToProtocol:", &unk_254642BC0);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1[4] + 8), "shouldAcceptXPCConnection:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

@end

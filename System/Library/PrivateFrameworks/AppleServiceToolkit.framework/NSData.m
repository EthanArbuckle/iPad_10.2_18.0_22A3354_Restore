@implementation NSData

uint64_t __32__NSData_GZip__dataGZipDeflated__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  do
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_resizeOutputBuffer:forStream:", *(_QWORD *)(a1 + 40), v5 + 32);
      result = deflate((z_streamp)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), 0);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    while (!*(_DWORD *)(v5 + 64));
  }
  while (*(_DWORD *)(v5 + 40));
  return result;
}

@end

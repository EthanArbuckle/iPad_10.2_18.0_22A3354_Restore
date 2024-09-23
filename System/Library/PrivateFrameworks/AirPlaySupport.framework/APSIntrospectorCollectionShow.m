@implementation APSIntrospectorCollectionShow

uint64_t __APSIntrospectorCollectionShow_block_invoke(uint64_t a1)
{
  CFSetGetCount(*(CFSetRef *)(*(_QWORD *)(a1 + 32) + 8));
  return FPrintF();
}

void __APSIntrospectorCollectionShow_block_invoke_2()
{
  _QWORD v0[3];
  int v1;

  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2000000000;
  v1 = 1;
  CFSetApplyBlock();
  _Block_object_dispose(v0, 8);
}

uint64_t __APSIntrospectorCollectionShow_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = FPrintF();
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end

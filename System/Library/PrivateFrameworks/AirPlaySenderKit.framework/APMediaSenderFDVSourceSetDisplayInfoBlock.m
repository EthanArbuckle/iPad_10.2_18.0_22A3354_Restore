@implementation APMediaSenderFDVSourceSetDisplayInfoBlock

void __APMediaSenderFDVSourceSetDisplayInfoBlock_block_invoke(_QWORD *a1)
{
  const void *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  v2 = (const void *)a1[4];
  if (v2)
    v3 = _Block_copy(v2);
  else
    v3 = 0;
  v4 = a1[5];
  v5 = *(const void **)(v4 + 32);
  if (v5)
  {
    _Block_release(v5);
    v4 = a1[5];
  }
  *(_QWORD *)(v4 + 32) = v3;
  if (a1[6])
    v6 = a1[6];
  else
    v6 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v6);
  v7 = a1[5];
  v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_release(v8);
    v7 = a1[5];
  }
  *(_QWORD *)(v7 + 40) = v6;
}

@end

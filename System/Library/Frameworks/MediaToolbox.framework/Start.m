@implementation Start

void __pwdKeyExchangeSenderAOCP_Start_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(_QWORD, _QWORD))(a1[4] + 80))(a1[5], a1[6]);
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[6];
  if (v3)
    CFRelease(v3);
}

void __fileWriterSink_Start_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

@end

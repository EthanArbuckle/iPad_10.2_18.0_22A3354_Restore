@implementation ZN19QmiEosCommandDriver9init

_QWORD *___ZN19QmiEosCommandDriver9init_syncEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  _BYTE v4[24];
  _BYTE *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  QmiEosCommandDriver::queryEosStatus(v1, (uint64_t)v4);
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

@end

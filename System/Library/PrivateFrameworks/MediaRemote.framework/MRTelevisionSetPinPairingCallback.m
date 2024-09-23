@implementation MRTelevisionSetPinPairingCallback

void __MRTelevisionSetPinPairingCallback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD *, double);
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MRTelevisionSetPinPairingCallback_block_invoke_2;
  v11[3] = &unk_1E30C9B30;
  v12 = v7;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *, double))(v8 + 16);
  v10 = v7;
  v9(v8, a2, a3, v11, 0.0);

}

uint64_t __MRTelevisionSetPinPairingCallback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

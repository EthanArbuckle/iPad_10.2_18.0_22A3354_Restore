@implementation SOSBSKBLoadAndUnlockWithWrappingSecret

uint64_t __SOSBSKBLoadAndUnlockWithWrappingSecret_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFData *v3;
  int8x16_t v4;
  _QWORD v6[5];
  int8x16_t v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SOSBSKBLoadAndUnlockWithWrappingSecret_block_invoke_2;
  v6[3] = &unk_1E1FD1468;
  v3 = *(const __CFData **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = *(int8x16_t *)(a1 + 48);
  v7 = vextq_s8(v4, v4, 8uLL);
  return SOSPerformWithUnwrappedData(a2, v3, v4.i64[0], (uint64_t)v6);
}

uint64_t __SOSBSKBLoadAndUnlockWithWrappingSecret_block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = SOSBSKBLoadAndUnlockBagWithSecret(*(_QWORD *)(a1 + 40), a2, a3, *(CFTypeRef **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end

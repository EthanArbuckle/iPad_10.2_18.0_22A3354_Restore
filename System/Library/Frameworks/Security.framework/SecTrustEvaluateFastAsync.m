@implementation SecTrustEvaluateFastAsync

uint64_t __SecTrustEvaluateFastAsync_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 112);
  return result;
}

void __SecTrustEvaluateFastAsync_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2000000000;
    v9 = 0;
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(NSObject **)(v3 + 136);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 0x40000000;
    v5[2] = __SecTrustEvaluateFastAsync_block_invoke_2;
    v5[3] = &unk_1E1FDA7C8;
    v5[4] = &v6;
    v5[5] = v3;
    dispatch_sync(v4, v5);
    SecTrustLogFailureDescription(*(__SecTrust **)(a1 + 40), *((_DWORD *)v7 + 6));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_object_dispose(&v6, 8);
  }
}

@end

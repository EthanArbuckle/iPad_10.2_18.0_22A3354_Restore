@implementation DisplayCPMSHDRCallbackDCPStage1

void ____DisplayCPMSHDRCallbackDCPStage1_block_invoke(_QWORD *a1)
{
  NSObject *v1;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(_QWORD *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v13 = a1;
  v12 = a1;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = __DisplayGetPowerAccumulatorDCP(a1[7], (_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  v1 = *(NSObject **)(a1[7] + 144);
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = ____DisplayCPMSHDRCallbackDCPStage1_block_invoke_2;
  v7 = &unk_1E68EB698;
  v11 = a1[7];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  dispatch_async(v1, &block);
}

void ____DisplayCPMSHDRCallbackDCPStage1_block_invoke_2(_QWORD *a1)
{
  __DisplayCPMSHDRCallbackDCPStage2(a1[7], *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(double *)(*(_QWORD *)(a1[6] + 8) + 24));
  CFRelease((CFTypeRef)a1[7]);
}

@end

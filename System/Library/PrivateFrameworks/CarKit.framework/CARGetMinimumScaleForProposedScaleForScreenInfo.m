@implementation CARGetMinimumScaleForProposedScaleForScreenInfo

void ___CARGetMinimumScaleForProposedScaleForScreenInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "safeFrame");
  if (v6 < 1122.0)
    goto LABEL_5;
  objc_msgSend(v9, "safeFrame");
  v7 = 2.0;
  if (v8 >= 684.0)
    v7 = 3.0;
  if (v7 < 3.0)
  {
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x40000000;
    *a4 = 1;
  }

}

@end

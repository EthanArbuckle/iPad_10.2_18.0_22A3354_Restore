@implementation CKWaveformWithPowerLevels

void __CKWaveformWithPowerLevels_block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "set");
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(double *)(*(_QWORD *)(a1 + 48) + 8 * v2);
      v4 = *(double *)(a1 + 56);
      if (CKMainScreenScale_once_30 != -1)
        dispatch_once(&CKMainScreenScale_once_30, &__block_literal_global_243);
      v5 = *(double *)&CKMainScreenScale_sMainScreenScale_30;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_30 == 0.0)
        v5 = 1.0;
      v6 = fmax(round(v3 * v4 * v5) / v5, 1.0);
      if (v6 < *(double *)(a1 + 64))
        v6 = *(double *)(a1 + 64);
      v7 = (*(double *)(a1 + 56) - v6) * 0.5;
      v8 = *(double *)&CKMainScreenScale_sMainScreenScale_30;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_30 == 0.0)
        v8 = 1.0;
      v9 = round(v8 * v7) / v8;
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 72) * (double)v2, v9, *(double *)(a1 + 80), *(double *)(a1 + 56) + v9 * -2.0, *(double *)(a1 + 80) * 0.5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fill");

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
}

@end

@implementation QLWaveformWithPowerLevels

void __QLWaveformWithPowerLevels_block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGRect v12;

  objc_msgSend(*(id *)(a1 + 32), "set");
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(double *)(*(_QWORD *)(a1 + 48) + 8 * v2) * 30.0;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scale");
      v6 = v5;

      v7 = round(v3 * v6) / v6;
      if (v7 <= 1.0)
        v8 = 14.5;
      else
        v8 = (30.0 - v7) * 0.5;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v11 = v10;

      v12.origin.y = round(v11 * v8) / v11;
      v12.origin.x = (double)v2 * 3.0;
      v12.size.height = 30.0 - v12.origin.y * 2.0;
      v12.size.width = 2.0;
      UIRectFill(v12);
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
}

@end

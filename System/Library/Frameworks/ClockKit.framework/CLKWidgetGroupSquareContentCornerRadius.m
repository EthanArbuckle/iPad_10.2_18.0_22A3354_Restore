@implementation CLKWidgetGroupSquareContentCornerRadius

void __CLKWidgetGroupSquareContentCornerRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_24CC175D8;
  v5[1] = &unk_24CC175F0;
  v6[0] = &unk_24CC17AD8;
  v6[1] = &unk_24CC17AD8;
  v5[2] = &unk_24CC17608;
  v5[3] = &unk_24CC17620;
  v6[2] = &unk_24CC17B68;
  v6[3] = &unk_24CC17B68;
  v5[4] = &unk_24CC17638;
  v5[5] = &unk_24CC17650;
  v6[4] = &unk_24CC17AD8;
  v6[5] = &unk_24CC17B68;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 3.0);
  CLKWidgetGroupSquareContentCornerRadius__cornerRadius = v4;

}

@end

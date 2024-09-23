@implementation CLKLargeDialDiameterForDevice

void __CLKLargeDialDiameterForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 2);
  v5[0] = &unk_24CC17878;
  v5[1] = &unk_24CC178A8;
  v6[0] = &unk_24CC17BF8;
  v6[1] = &unk_24CC17C08;
  v5[2] = &unk_24CC178C0;
  v6[2] = &unk_24CC17C18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 161.0);
  CLKLargeDialDiameterForDevice__largeDialDiameter = v4;

}

@end

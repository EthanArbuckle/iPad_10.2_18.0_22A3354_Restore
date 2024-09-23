@implementation CLKComplicationGraphicExtraLargeCircularScalingFactor

void __CLKComplicationGraphicExtraLargeCircularScalingFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 0);
  v5[0] = &unk_24CC16DB0;
  v5[1] = &unk_24CC16DE0;
  v6[0] = &unk_24CC17A48;
  v6[1] = &unk_24CC17A58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v3, 2.86);
  CLKComplicationGraphicExtraLargeCircularScalingFactor_scalingFactor = v4;

}

@end

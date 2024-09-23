@implementation CDMeterDisabledLayerActions

void ___CDMeterDisabledLayerActions_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = CFSTR("instanceTransform");
  v3[1] = CFSTR("contentsMultiplyColor");
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = CFSTR("transform");
  v3[3] = CFSTR("hidden");
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = CFSTR("position");
  v3[5] = CFSTR("opacity");
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = CFSTR("instanceCount");
  v3[7] = CFSTR("instanceDelay");
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = CFSTR("backgroundColor");
  v4[8] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_CDMeterDisabledLayerActions__dictionary;
  _CDMeterDisabledLayerActions__dictionary = v1;

}

@end

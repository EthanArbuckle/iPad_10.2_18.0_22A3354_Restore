@implementation UtilitarianFlatImageSizeForDevice

void ___UtilitarianFlatImageSizeForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&xmmword_254AB8468 = ___UtilitarianFlatImageSizeForDevice_block_invoke_2((uint64_t)v4, v4);
  *((_QWORD *)&xmmword_254AB8468 + 1) = v2;
  _UtilitarianFlatImageSizeForDevice__imageSize = ___UtilitarianFlatImageSizeForDevice_block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);
  unk_254AB8460 = v3;

}

double ___UtilitarianFlatImageSizeForDevice_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = &unk_24CC16D98;
  v8[1] = &unk_24CC16DB0;
  v9[0] = &unk_24CC178F8;
  v9[1] = &unk_24CC17908;
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 22.0);
  v6 = v5;

  objc_msgSend(v3, "scaledValue:", 10.0);
  return v6;
}

@end

@implementation CLKComplicationTemplateCircularMediumRingImage

- (int64_t)compatibleFamily
{
  return 105;
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = &unk_24CC16D98;
  v9[1] = &unk_24CC16DB0;
  v10[0] = &unk_24CC17998;
  v10[1] = &unk_24CC179A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 25.0);

}

@end

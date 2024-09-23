@implementation VNShotflowNetworkANFDv2

+ (id)modelName
{
  return CFSTR("shotflow-8k6zuzd9wy_46860_opt_quantized.espresso");
}

+ (unint64_t)mumberPosClasses
{
  return 6;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANFDv2 importantClasses]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANFDv2 importantClasses]::onceToken, &__block_literal_global_161_29943);
  return (const void *)+[VNShotflowNetworkANFDv2 importantClasses]::importantClasses;
}

double __43__VNShotflowNetworkANFDv2_importantClasses__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x28uLL);
  v0[1] = v1 + 5;
  v0[2] = v1 + 5;
  v1[4] = 5;
  *(_QWORD *)&result = 1;
  *(_OWORD *)v1 = xmmword_1A15FA0C8;
  *((_OWORD *)v1 + 1) = unk_1A15FA0D8;
  *v0 = v1;
  +[VNShotflowNetworkANFDv2 importantClasses]::importantClasses = (uint64_t)v0;
  return result;
}

@end

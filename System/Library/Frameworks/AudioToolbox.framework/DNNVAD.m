@implementation DNNVAD

AudioComponent __DNNVAD_Initialize_block_invoke()
{
  AudioComponent result;
  AudioComponentDescription v1;
  AudioComponentDescription inDesc;

  *(_OWORD *)&v1.componentType = xmmword_1B66A22B0;
  v1.componentFlagsMask = 0;
  result = AudioComponentFindNext(0, &v1);
  if (!result)
  {
    *(_OWORD *)&inDesc.componentType = *(_OWORD *)&v1.componentType;
    inDesc.componentFlagsMask = 0;
    return AudioComponentRegister(&inDesc, CFSTR("Apple: AUNeuralNetVAD"), 0x10601u, (AudioComponentFactoryFunction)ausdk::APFactory<ausdk::AUBaseProcessMultipleLookup,AUNeuralNetVAD>::Factory);
  }
  return result;
}

@end

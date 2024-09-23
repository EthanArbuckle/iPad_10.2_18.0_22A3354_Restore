@implementation DAAudioUnitHelper

+ (AudioComponentDescription)getRemoteIODescription
{
  *(_OWORD *)&retstr->componentType = xmmword_10000D730;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (AudioComponentDescription)getGeneratorDescription
{
  *(_OWORD *)&retstr->componentType = xmmword_10000D740;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (AudioComponentDescription)getBandPassDescription
{
  *(_OWORD *)&retstr->componentType = xmmword_10000D750;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (AudioComponentDescription)getMixerDescription
{
  *(_OWORD *)&retstr->componentType = xmmword_10000D760;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (AudioStreamBasicDescription)getBasicStreamDescription
{
  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  retstr->mSampleRate = 44100.0;
  *(_OWORD *)&retstr->mFormatID = xmmword_10000D770;
  *(_QWORD *)&retstr->mBytesPerFrame = 0x100000004;
  retstr->mBitsPerChannel = 32;
  return result;
}

@end

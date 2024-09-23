@implementation CSFAudioStreamBasicDescriptionFactory

+ (AudioStreamBasicDescription)lpcmInt16ASBD
{
  AudioStreamBasicDescription *result;
  float v5;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B50D76F0;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1B50D7700;
  return result;
}

+ (AudioStreamBasicDescription)lpcmInt16NarrowBandASBD
{
  AudioStreamBasicDescription *result;
  float v5;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRateNarrowBand](CSConfig, "inputRecordingSampleRateNarrowBand");
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B50D76F0;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1B50D7700;
  return result;
}

+ (AudioStreamBasicDescription)lpcmFloatASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0x96C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)opusASBD
{
  AudioStreamBasicDescription *result;
  float v5;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B50D7710;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1B50D7720;
  return result;
}

+ (AudioStreamBasicDescription)opusNarrowBandASBD
{
  AudioStreamBasicDescription *result;
  float v5;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRateNarrowBand](CSConfig, "inputRecordingSampleRateNarrowBand");
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B50D7710;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1B50D7720;
  return result;
}

+ (AudioStreamBasicDescription)speexASBD
{
  *(_OWORD *)&retstr->mFormatID = 0u;
  *(_OWORD *)&retstr->mBytesPerFrame = 0u;
  retstr->mSampleRate = 16000.0;
  retstr->mFormatID = 1936745848;
  retstr->mFramesPerPacket = 320;
  retstr->mChannelsPerFrame = 1;
  return result;
}

+ (AudioStreamBasicDescription)lpcmInterleavedASBD
{
  int v3;
  int v4;
  uint64_t v5;
  double v6;

  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v4 = v3;
  v5 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v5, v6);
}

+ (AudioStreamBasicDescription)lpcmMonoInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", 1);
}

+ (AudioStreamBasicDescription)lpcmInterleavedWithRemoteVADASBD
{
  int v3;
  int v4;
  unsigned int v5;
  double v6;

  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v4 = v3;
  v5 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v5 + 1, v6);
}

+ (AudioStreamBasicDescription)lpcmMonoInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", 2);
}

+ (AudioStreamBasicDescription)lpcmInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4
{
  unsigned int v8;
  UInt32 v9;
  unsigned int v10;
  UInt32 v11;
  AudioStreamBasicDescription *result;
  AudioFormatFlags v13;

  v8 = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  v9 = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  v10 = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  v11 = +[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat");
  if ((_DWORD)result)
    v13 = 9;
  else
    v13 = 12;
  retstr->mSampleRate = a4;
  retstr->mFormatID = 1819304813;
  retstr->mFormatFlags = v13;
  retstr->mBytesPerPacket = v8 * a5;
  retstr->mFramesPerPacket = v9;
  retstr->mBytesPerFrame = v10 * a5;
  retstr->mChannelsPerFrame = a5;
  retstr->mBitsPerChannel = v11;
  retstr->mReserved = 0;
  return result;
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedASBD
{
  int v3;
  int v4;
  uint64_t v5;
  double v6;

  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v4 = v3;
  v5 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", v5, v6);
}

+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", 1);
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedWithRemoteVADASBD
{
  int v3;
  int v4;
  unsigned int v5;
  double v6;

  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v4 = v3;
  v5 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", v5 + 1, v6);
}

+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", 2);
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4
{
  UInt32 v8;
  UInt32 v9;
  UInt32 v10;
  UInt32 v11;
  AudioStreamBasicDescription *result;
  AudioFormatFlags v13;

  v8 = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  v9 = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  v10 = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  v11 = +[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat");
  retstr->mSampleRate = a4;
  if ((_DWORD)result)
    v13 = 41;
  else
    v13 = 44;
  retstr->mFormatID = 1819304813;
  retstr->mFormatFlags = v13;
  retstr->mBytesPerPacket = v8;
  retstr->mFramesPerPacket = v9;
  retstr->mBytesPerFrame = v10;
  retstr->mChannelsPerFrame = a5;
  retstr->mBitsPerChannel = v11;
  retstr->mReserved = 0;
  return result;
}

+ (AudioStreamBasicDescription)lpcmASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)lpcmNarrowBandASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRateNarrowBand](CSConfig, "inputRecordingSampleRateNarrowBand");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)utteranceFileASBD
{
  float v4;
  AudioFormatFlags v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  retstr->mFormatID = 1819304813;
  if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
    v5 = 9;
  else
    v5 = 12;
  retstr->mFormatFlags = v5;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)aiffFileASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket](CSConfig, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame](CSConfig, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

@end

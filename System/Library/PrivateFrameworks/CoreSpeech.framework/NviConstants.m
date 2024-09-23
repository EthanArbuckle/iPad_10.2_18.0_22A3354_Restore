@implementation NviConstants

+ (float)inputRecordingSampleRate
{
  return 16000.0;
}

+ (unsigned)inputRecordingFramesPerPacket
{
  return 1;
}

+ (unsigned)inputRecordingBytesPerFrame
{
  return +[NviConstants inputRecordingSampleByteDepth](NviConstants, "inputRecordingSampleByteDepth");
}

+ (unsigned)inputRecordingBytesPerPacket
{
  unsigned int v2;

  v2 = +[NviConstants inputRecordingSampleByteDepth](NviConstants, "inputRecordingSampleByteDepth");
  return +[NviConstants inputRecordingFramesPerPacket](NviConstants, "inputRecordingFramesPerPacket") * v2;
}

+ (unsigned)inputRecordingNumberOfChannels
{
  if (NviIsHorseman_onceToken != -1)
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13245);
  if (NviIsHorseman_isHorseman)
    return 34;
  else
    return 1;
}

+ (unsigned)numChannelsForNviDirectionality
{
  if (NviIsHorseman_onceToken != -1)
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13245);
  if (NviIsHorseman_isHorseman)
    return 6;
  else
    return 1;
}

+ (unsigned)inputRecordingSampleBitDepth
{
  return 8 * +[NviConstants inputRecordingSampleByteDepth](NviConstants, "inputRecordingSampleByteDepth");
}

+ (unsigned)inputRecordingSampleByteDepth
{
  return 2;
}

+ (unsigned)nviDirectionalityStartingChannelId
{
  if (NviIsHorseman_onceToken != -1)
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13245);
  if (NviIsHorseman_isHorseman)
    return 28;
  else
    return 0;
}

+ (unsigned)nviDirectionalityEndingChannelId
{
  if (NviIsHorseman_onceToken != -1)
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13245);
  if (NviIsHorseman_isHorseman)
    return 34;
  else
    return 0;
}

+ (AudioStreamBasicDescription)monoChannelLpcmASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate](NviConstants, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket](NviConstants, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = 1;
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame](NviConstants, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth](NviConstants, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)allChannelsLpcmInterleavedASBD
{
  float v4;
  unsigned int v5;
  unsigned int v6;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate](NviConstants, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  v5 = +[NviConstants inputRecordingBytesPerPacket](NviConstants, "inputRecordingBytesPerPacket");
  retstr->mBytesPerPacket = +[NviConstants inputRecordingNumberOfChannels](NviConstants, "inputRecordingNumberOfChannels")* v5;
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket](NviConstants, "inputRecordingFramesPerPacket");
  v6 = +[NviConstants inputRecordingBytesPerFrame](NviConstants, "inputRecordingBytesPerFrame");
  retstr->mBytesPerFrame = +[NviConstants inputRecordingNumberOfChannels](NviConstants, "inputRecordingNumberOfChannels")* v6;
  retstr->mChannelsPerFrame = +[NviConstants inputRecordingNumberOfChannels](NviConstants, "inputRecordingNumberOfChannels");
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth](NviConstants, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)allChannelsLpcmNonInterleavedASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate](NviConstants, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0x2C6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket](NviConstants, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket](NviConstants, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame](NviConstants, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = +[NviConstants inputRecordingNumberOfChannels](NviConstants, "inputRecordingNumberOfChannels");
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth](NviConstants, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)nviDirectionalityLpcmNonInterleavedASBD
{
  float v4;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate](NviConstants, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0x2C6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket](NviConstants, "inputRecordingBytesPerPacket");
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket](NviConstants, "inputRecordingFramesPerPacket");
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame](NviConstants, "inputRecordingBytesPerFrame");
  retstr->mChannelsPerFrame = +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality");
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth](NviConstants, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)nviDirectionalityLpcmInterleavedASBD
{
  float v4;
  unsigned int v5;
  unsigned int v6;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate](NviConstants, "inputRecordingSampleRate");
  retstr->mSampleRate = v4;
  *(_QWORD *)&retstr->mFormatID = 0xC6C70636DLL;
  v5 = +[NviConstants inputRecordingBytesPerPacket](NviConstants, "inputRecordingBytesPerPacket");
  retstr->mBytesPerPacket = +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality")* v5;
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket](NviConstants, "inputRecordingFramesPerPacket");
  v6 = +[NviConstants inputRecordingBytesPerFrame](NviConstants, "inputRecordingBytesPerFrame");
  retstr->mBytesPerFrame = +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality")* v6;
  retstr->mChannelsPerFrame = +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality");
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth](NviConstants, "inputRecordingSampleBitDepth");
  *(_QWORD *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (id)nviLogsRootDir
{
  if (nviLogsRootDir_onceToken != -1)
    dispatch_once(&nviLogsRootDir_onceToken, &__block_literal_global_12865);
  return (id)nviLogsRootDir_nviLoggingRoot;
}

void __30__NviConstants_nviLogsRootDir__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPSharedResourcesDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/nvi"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nviLogsRootDir_nviLoggingRoot;
  nviLogsRootDir_nviLoggingRoot = v0;

}

@end

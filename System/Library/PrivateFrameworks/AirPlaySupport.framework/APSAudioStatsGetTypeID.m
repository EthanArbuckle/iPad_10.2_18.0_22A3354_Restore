@implementation APSAudioStatsGetTypeID

uint64_t __APSAudioStatsGetTypeID_block_invoke()
{
  uint64_t result;

  APSAudioStatsGetTypeID_histogramClass = 0;
  unk_1EF9208F0 = "APSAudioStats";
  qword_1EF9208F8 = 0;
  unk_1EF920900 = 0;
  qword_1EF920908 = (uint64_t)APSAudioStatsFinalize;
  unk_1EF920910 = 0;
  qword_1EF920918 = 0;
  unk_1EF920920 = 0;
  qword_1EF920928 = (uint64_t)APSAudioStatsCopyDebugDescription;
  result = _CFRuntimeRegisterClass();
  APSAudioStatsGetTypeID_typeID = result;
  return result;
}

@end

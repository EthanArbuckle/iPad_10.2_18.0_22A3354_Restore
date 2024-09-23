@implementation ZN11HeadTracker18HeadTrackerSession19AddSpatializationAUER10XAudioUniti

_QWORD *___ZN11HeadTracker18HeadTrackerSession19AddSpatializationAUER10XAudioUniti_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("disable_head_tracking"), CFSTR("com.apple.coreaudio"), (const __CFString *)&HeadTracker::HeadTrackerSession::AddSpatializationAU(XAudioUnit &,int)::disableHeadTracking, a4);
}

@end

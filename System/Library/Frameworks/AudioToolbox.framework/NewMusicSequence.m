@implementation NewMusicSequence

void __NewMusicSequence_block_invoke()
{
  CALog::Scope *v0;
  const __CFString *v1;
  CALog::Scope *v2;
  const __CFString *v3;

  v0 = (CALog::Scope *)operator new();
  *((_QWORD *)v0 + 1) = 0;
  *(_QWORD *)v0 = os_log_create("com.apple.coreaudio", "seq");
  v1 = CFStringCreateWithCString(0, "sequencer_verbose", 0x600u);
  CALog::Scope::SetPriorityThresholdFromPreference(v0, CFSTR("com.apple.coreaudio"), v1);
  CFRelease(v1);
  kSequencerScope = (uint64_t)v0;
  v2 = (CALog::Scope *)operator new();
  *((_QWORD *)v2 + 1) = 0;
  *(_QWORD *)v2 = os_log_create("com.apple.coreaudio", "seqp");
  v3 = CFStringCreateWithCString(0, "sequenceparser_verbose", 0x600u);
  CALog::Scope::SetPriorityThresholdFromPreference(v2, CFSTR("com.apple.coreaudio"), v3);
  CFRelease(v3);
  kSequenceParserScope = (uint64_t)v2;
}

@end

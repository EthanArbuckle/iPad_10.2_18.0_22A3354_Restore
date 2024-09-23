@implementation Z25GetAudioWorkQueuePriorityv

_QWORD *___Z25GetAudioWorkQueuePriorityv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("audiocontrol_priority"), CFSTR("com.apple.coreaudio"), (const __CFString *)&GetAudioWorkQueuePriority(void)::gAudioWorkQueuePriority, a4);
}

@end

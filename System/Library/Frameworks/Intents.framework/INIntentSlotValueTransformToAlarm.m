@implementation INIntentSlotValueTransformToAlarm

uint64_t __INIntentSlotValueTransformToAlarm_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAlarmRepeatScheduleOptions:", a2);
}

@end

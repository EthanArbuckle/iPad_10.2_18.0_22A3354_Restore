@implementation INIntentSlotValueTransformToCallRecordFilter

uint64_t __INIntentSlotValueTransformToCallRecordFilter_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCallTypes:", a2);
}

@end

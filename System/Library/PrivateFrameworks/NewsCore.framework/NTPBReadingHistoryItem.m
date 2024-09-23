@implementation NTPBReadingHistoryItem

void __54__NTPBReadingHistoryItem_FCReadingHistory__asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("ReadingHistory"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v1;

}

@end

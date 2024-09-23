@implementation LinkQualityDataKeyIsAllowed

void __LinkQualityDataKeyIsAllowed_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("dataStalls"), CFSTR("isKnownGood"), CFSTR("lastReportedRxSignalStrength"), CFSTR("linkQuality"), CFSTR("isLowInternetDL"), CFSTR("isLowInternetUL"), CFSTR("loadedLQM"), CFSTR("LQM"), CFSTR("radioTechnology"), 0);
  v1 = (void *)qword_1ECEAD7A8;
  qword_1ECEAD7A8 = v0;

}

@end

@implementation MTIDCommon

+ (id)idOptions
{
  if (idOptions_onceToken != -1)
    dispatch_once(&idOptions_onceToken, &__block_literal_global_0);
  return (id)idOptions_options;
}

void __23__MTIDCommon_idOptions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("date");
  v2[1] = CFSTR("syncWaitTime");
  v2[2] = CFSTR("idType");
  v2[3] = CFSTR("cachePolicy");
  v2[4] = CFSTR("reset");
  v2[5] = CFSTR("dsId");
  v2[6] = CFSTR("iTunesUserRequired");
  v2[7] = CFSTR("appBundleID");
  v2[8] = CFSTR("existingOnly");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)idOptions_options;
  idOptions_options = v0;

}

@end

@implementation INIntentResolutionResult

void __60__INIntentResolutionResult_CMSCoding__instanceFromCMSCoded___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("BooleanResolutionResult");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("DoubleResoultionResult");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("PlayMediaMediaItemResolutionResult");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("AddMediaMediaItemResolutionResult");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("AddMediaMediaDestinationResolutionResult");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("PlaybackQueueLocationResolutionResult");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("PlaybackRepeatModeResolutionResult");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("UpdateMediaAffinityMediaItemResolutionResult");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("MediaAffinityTypeResolutionResult");
  v3[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)instanceFromCMSCoded__classmap;
  instanceFromCMSCoded__classmap = v0;

}

@end

@implementation CMSPredictedMethodNameForElidingMethod

void __CMSPredictedMethodNameForElidingMethod_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("PlayMediaIntentHandling.resolvePlayShuffled");
  v2[1] = CFSTR("PlayMediaIntentHandling.resolvePlaybackQueueLocation");
  v3[0] = CFSTR("PlayMediaIntentHandling.handle");
  v3[1] = CFSTR("PlayMediaIntentHandling.handle");
  v2[2] = CFSTR("PlayMediaIntentHandling.resolvePlaybackRepeatMode");
  v2[3] = CFSTR("PlayMediaIntentHandling.resolvePlaybackSpeed");
  v3[2] = CFSTR("PlayMediaIntentHandling.handle");
  v3[3] = CFSTR("PlayMediaIntentHandling.handle");
  v2[4] = CFSTR("PlayMediaIntentHandling.resolveResumePlayback");
  v2[5] = CFSTR("AddMediaIntentHandling.resolveMediaDestination");
  v3[4] = CFSTR("PlayMediaIntentHandling.handle");
  v3[5] = CFSTR("AddMediaIntentHandling.handle");
  v2[6] = CFSTR("UpdateMediaAffinityIntentHandling.resolveAffinityType");
  v3[6] = CFSTR("UpdateMediaAffinityIntentHandling.handle");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CMSPredictedMethodNameForElidingMethod_predictionDependencies;
  CMSPredictedMethodNameForElidingMethod_predictionDependencies = v0;

}

@end

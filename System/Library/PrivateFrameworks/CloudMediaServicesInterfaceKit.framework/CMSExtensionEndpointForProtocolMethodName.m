@implementation CMSExtensionEndpointForProtocolMethodName

void __CMSExtensionEndpointForProtocolMethodName_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("PlayMediaIntentHandling.resolveMediaItems");
  v2[1] = CFSTR("PlayMediaIntentHandling.resolvePlayShuffled");
  v3[0] = CFSTR("intent/playMedia");
  v3[1] = CFSTR("intent/playMedia");
  v2[2] = CFSTR("PlayMediaIntentHandling.resolvePlaybackQueueLocation");
  v2[3] = CFSTR("PlayMediaIntentHandling.resolvePlaybackRepeatMode");
  v3[2] = CFSTR("intent/playMedia");
  v3[3] = CFSTR("intent/playMedia");
  v2[4] = CFSTR("PlayMediaIntentHandling.resolvePlaybackSpeed");
  v2[5] = CFSTR("PlayMediaIntentHandling.resolveResumePlayback");
  v3[4] = CFSTR("intent/playMedia");
  v3[5] = CFSTR("intent/playMedia");
  v2[6] = CFSTR("PlayMediaIntentHandling.confirm");
  v2[7] = CFSTR("PlayMediaIntentHandling.handle");
  v3[6] = CFSTR("intent/playMedia");
  v3[7] = CFSTR("intent/playMedia");
  v2[8] = CFSTR("AddMediaIntentHandling.resolveMediaItems");
  v2[9] = CFSTR("AddMediaIntentHandling.resolveMediaDestination");
  v3[8] = CFSTR("intent/addMedia");
  v3[9] = CFSTR("intent/addMedia");
  v2[10] = CFSTR("AddMediaIntentHandling.confirm");
  v2[11] = CFSTR("AddMediaIntentHandling.handle");
  v3[10] = CFSTR("intent/addMedia");
  v3[11] = CFSTR("intent/addMedia");
  v2[12] = CFSTR("UpdateMediaAffinityIntentHandling.resolveMediaItems");
  v2[13] = CFSTR("UpdateMediaAffinityIntentHandling.resolveAffinityType");
  v3[12] = CFSTR("intent/updateMediaAffinity");
  v3[13] = CFSTR("intent/updateMediaAffinity");
  v2[14] = CFSTR("UpdateMediaAffinityIntentHandling.confirm");
  v2[15] = CFSTR("UpdateMediaAffinityIntentHandling.handle");
  v3[14] = CFSTR("intent/updateMediaAffinity");
  v3[15] = CFSTR("intent/updateMediaAffinity");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping;
  CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping = v0;

}

@end

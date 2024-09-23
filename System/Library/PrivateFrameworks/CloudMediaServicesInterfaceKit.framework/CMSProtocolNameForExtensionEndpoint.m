@implementation CMSProtocolNameForExtensionEndpoint

void __CMSProtocolNameForExtensionEndpoint_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("intent/playMedia");
  v2[1] = CFSTR("intent/addMedia");
  v3[0] = CFSTR("PlayMediaIntentHandling");
  v3[1] = CFSTR("AddMediaIntentHandling");
  v2[2] = CFSTR("intent/updateMediaAffinity");
  v3[2] = CFSTR("UpdateMediaAffinityIntentHandling");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CMSProtocolNameForExtensionEndpoint_nameMapping;
  CMSProtocolNameForExtensionEndpoint_nameMapping = v0;

}

@end

@implementation SOSPeerInfoCreateCloudIdentity

void __SOSPeerInfoCreateCloudIdentity_block_invoke(int a1, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, CFSTR("CloudIdentity"), (const void *)*MEMORY[0x1E0C9AE50]);
}

@end

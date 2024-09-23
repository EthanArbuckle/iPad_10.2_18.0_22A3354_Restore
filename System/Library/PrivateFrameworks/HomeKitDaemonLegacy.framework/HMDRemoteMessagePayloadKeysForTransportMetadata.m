@implementation HMDRemoteMessagePayloadKeysForTransportMetadata

void __HMDRemoteMessagePayloadKeysForTransportMetadata_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("kIDSMessageSourceIDKey");
  v2[1] = CFSTR("kRemoteMessageIsFinalResponseKey");
  v2[2] = CFSTR("kRemoteMessageTransportAttributionKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HMDRemoteMessagePayloadKeysForTransportMetadata_keys;
  HMDRemoteMessagePayloadKeysForTransportMetadata_keys = v0;

}

@end

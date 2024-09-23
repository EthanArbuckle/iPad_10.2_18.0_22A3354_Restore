@implementation NSURL(MPCPlaybackEngineEventPayload)

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
}

@end

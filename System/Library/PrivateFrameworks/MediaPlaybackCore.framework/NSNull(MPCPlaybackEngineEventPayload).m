@implementation NSNull(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  return 0;
}

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  return objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

@end

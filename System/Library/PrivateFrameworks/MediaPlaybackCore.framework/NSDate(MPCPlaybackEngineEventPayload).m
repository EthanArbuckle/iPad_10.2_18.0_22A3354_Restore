@implementation NSDate(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v1, "numberWithDouble:");
}

+ (uint64_t)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a3, "doubleValue");
  return objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

@end

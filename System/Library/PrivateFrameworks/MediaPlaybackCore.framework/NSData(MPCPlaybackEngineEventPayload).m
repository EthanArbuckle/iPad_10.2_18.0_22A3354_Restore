@implementation NSData(MPCPlaybackEngineEventPayload)

- (uint64_t)mpc_jsonValue
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "initWithBase64EncodedString:options:", v4, 0);

  return v5;
}

@end

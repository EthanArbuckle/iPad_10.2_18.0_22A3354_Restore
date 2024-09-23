@implementation ICMusicSubscriptionStatus(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "initWithResponseDictionary:", v4);

  return v5;
}

@end

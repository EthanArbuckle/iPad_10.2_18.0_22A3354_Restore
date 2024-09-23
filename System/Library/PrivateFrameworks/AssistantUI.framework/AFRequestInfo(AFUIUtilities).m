@implementation AFRequestInfo(AFUIUtilities)

- (BOOL)afui_isRemoteHeadsetActivation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "speechRequestOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "activationEvent");

  return (v2 & 0xFFFFFFFFFFFFFFFELL) == 14;
}

- (BOOL)afui_isRemoteVoiceActivation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "speechRequestOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "activationEvent");

  return v2 == 8 || v2 == 15;
}

@end

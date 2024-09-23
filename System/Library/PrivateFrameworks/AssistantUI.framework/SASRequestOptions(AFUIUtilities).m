@implementation SASRequestOptions(AFUIUtilities)

- (uint64_t)afui_isTVFollowUpHearstActivation
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a1, "requestSource") != 9)
    return 0;
  objc_msgSend(a1, "originalRequestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "afui_isRemoteHeadsetActivation");

  return v4;
}

@end

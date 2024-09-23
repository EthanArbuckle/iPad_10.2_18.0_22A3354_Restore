@implementation HMCameraRecordingReachabilityEvent(HFAdditions)

- (double)duration
{
  return 4.0;
}

- (uint64_t)isComplete
{
  return 1;
}

- (uint64_t)canAskForUserFeedback
{
  return 0;
}

- (id)hf_endDate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "dateOfOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v2, "dateByAddingTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_dateInterval
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(a1, "dateOfOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  v4 = (void *)objc_msgSend(v2, "initWithStartDate:duration:", v3);

  return v4;
}

- (uint64_t)hf_isPlayable
{
  return 0;
}

- (uint64_t)hf_hasInsufficientAnalysis
{
  return 0;
}

- (double)targetFragmentDuration
{
  return 4.0;
}

- (uint64_t)encryptionKey
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (uint64_t)videoAssetRequiredHTTPHeaders
{
  return MEMORY[0x1E0C9AA70];
}

- (uint64_t)containerType
{
  return 2;
}

@end

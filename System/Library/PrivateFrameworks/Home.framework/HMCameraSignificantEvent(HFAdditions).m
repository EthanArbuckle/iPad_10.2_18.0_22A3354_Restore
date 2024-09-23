@implementation HMCameraSignificantEvent(HFAdditions)

- (id)hf_faceClassificationName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "faceClassification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (const)hf_reasonKey
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "reason");
  if ((unint64_t)(v1 - 2) > 3)
    return CFSTR("AnyMotion");
  else
    return off_1EA73DB90[v1 - 2];
}

@end

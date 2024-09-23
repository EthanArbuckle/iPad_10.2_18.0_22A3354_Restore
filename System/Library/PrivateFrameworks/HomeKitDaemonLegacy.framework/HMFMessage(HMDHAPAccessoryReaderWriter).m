@implementation HMFMessage(HMDHAPAccessoryReaderWriter)

- (uint64_t)isSingleReadWriteRequest
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("kCharacteristicReadRequestKey")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("kCharacteristicWriteRequestKey"));

  }
  return v3;
}

@end

@implementation NSOperationQueue(MSVAdditions)

- (uint64_t)increaseQualityOfService
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "qualityOfService");
  if (result > 16)
  {
    if (result == 25)
    {
      v3 = 33;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
    if (result == 17)
    {
      v3 = -1;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
  }
  else
  {
    if (result == -1)
    {
      v3 = 25;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
    if (result == 9)
    {
      v3 = 17;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
  }
  return result;
}

- (uint64_t)decreaseQualityOfService
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "qualityOfService");
  if (result > 24)
  {
    if (result == 25)
    {
      v3 = -1;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
    if (result == 33)
    {
      v3 = 25;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
  }
  else
  {
    if (result == -1)
    {
      v3 = 17;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
    if (result == 17)
    {
      v3 = 9;
      return objc_msgSend(a1, "setQualityOfService:", v3);
    }
  }
  return result;
}

@end

@implementation NSError(GKServerError)

- (uint64_t)isGKCompoundError
{
  if (objc_msgSend(a1, "code") != 5020)
    return 0;
  if ((objc_msgSend(a1, "isGKServerError") & 1) != 0)
    return 1;
  return objc_msgSend(a1, "isGKClientError");
}

@end

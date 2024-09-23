@implementation NSURL(CommonBRAdditions)

- (id)br_physicalURL
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (_CFURLIsItemPromiseAtURL())
  {
    v2 = a1;
  }
  else
  {
    v3 = _CFURLPromiseCopyPhysicalURL();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = a1;
    v2 = v5;

  }
  return v2;
}

@end

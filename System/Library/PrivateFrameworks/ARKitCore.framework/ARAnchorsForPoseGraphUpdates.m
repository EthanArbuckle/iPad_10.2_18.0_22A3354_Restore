@implementation ARAnchorsForPoseGraphUpdates

uint64_t __ARAnchorsForPoseGraphUpdates_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

@end

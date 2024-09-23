@implementation UIImageView(NUCrossFadeViewAnimatable)

- (void)nu_crossFadeViewSetValue:()NUCrossFadeViewAnimatable
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v5;
  else
    v4 = 0;
  objc_msgSend(a1, "setImage:", v4);

}

- (uint64_t)nu_crossFadeViewClearVisibleState
{
  return objc_msgSend(a1, "setImage:", 0);
}

@end

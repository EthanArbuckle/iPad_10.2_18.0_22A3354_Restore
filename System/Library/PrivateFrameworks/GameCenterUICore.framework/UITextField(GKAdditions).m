@implementation UITextField(GKAdditions)

- (uint64_t)isReallyFirstResponder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "superview"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "superview"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6 == a1))
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(a1, "isFirstResponder");
  }

  return v7;
}

@end

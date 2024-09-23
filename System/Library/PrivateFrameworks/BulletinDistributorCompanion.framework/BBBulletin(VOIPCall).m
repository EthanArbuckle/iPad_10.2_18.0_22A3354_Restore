@implementation BBBulletin(VOIPCall)

- (uint64_t)blt_isVOIPCall
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "sound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(a1, "sectionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

@implementation UIListContentConfiguration(MobileSafariExtras)

- (uint64_t)safari_usesWhiteText
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "textProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resolvedColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

@end

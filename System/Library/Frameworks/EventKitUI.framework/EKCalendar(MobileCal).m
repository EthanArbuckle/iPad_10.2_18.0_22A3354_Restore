@implementation EKCalendar(MobileCal)

- (id)uiColor
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "CGColor");
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

@end

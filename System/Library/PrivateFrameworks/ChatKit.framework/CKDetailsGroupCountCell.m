@implementation CKDetailsGroupCountCell

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsGroupCountCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

+ (double)preferredHeight
{
  return 22.0;
}

@end

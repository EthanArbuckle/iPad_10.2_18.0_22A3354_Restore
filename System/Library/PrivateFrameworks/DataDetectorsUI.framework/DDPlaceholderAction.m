@implementation DDPlaceholderAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Convert"));
}

- (id)iconName
{
  return CFSTR("arrow.triangle.swap");
}

- (BOOL)isPlaceholderAction
{
  return 1;
}

@end

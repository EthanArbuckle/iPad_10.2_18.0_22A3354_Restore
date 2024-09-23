@implementation DDParsecNayAction

- (id)localizedName
{
  return CFSTR("Report as irrelevant (Internal)");
}

- (unint64_t)relevancy
{
  return 2;
}

- (int)interactionType
{
  return 0;
}

- (BOOL)hasUserInterface
{
  return 0;
}

@end

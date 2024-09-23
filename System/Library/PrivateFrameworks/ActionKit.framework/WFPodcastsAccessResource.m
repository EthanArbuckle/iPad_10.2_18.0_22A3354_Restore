@implementation WFPodcastsAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.podcasts");
}

- (unint64_t)status
{
  return 4;
}

@end

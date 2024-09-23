@implementation POPodcastCollection

+ (Class)SAMPClass
{
  return (Class)objc_opt_class();
}

+ (id)uriScheme
{
  return CFSTR("x-sampcollection-podcast");
}

@end

@implementation SLVimeoService

- (id)serviceType
{
  return CFSTR("com.apple.social.vimeo");
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F158];
}

- (int64_t)authenticationStyle
{
  return 0;
}

- (BOOL)isFirstClassService
{
  return _SLServiceRegionIsChina() ^ 1;
}

- (int64_t)maximumURLCount
{
  return 0;
}

- (int64_t)maximumImageCount
{
  return 0;
}

- (int64_t)maximumVideoCount
{
  return -1;
}

- (int64_t)maximumVideoDataSize
{
  return 0x140000000;
}

- (int64_t)maximumVideoTimeLimit
{
  return -1;
}

- (id)activityTitle
{
  return CFSTR("Vimeo");
}

- (id)activityImage
{
  return 0;
}

@end

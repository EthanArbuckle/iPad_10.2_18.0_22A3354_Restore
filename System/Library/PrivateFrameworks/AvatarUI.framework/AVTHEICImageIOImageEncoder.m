@implementation AVTHEICImageIOImageEncoder

+ (id)typeIdentifier
{
  return CFSTR("public.heic");
}

- (id)fileExtension
{
  return CFSTR("heic");
}

@end

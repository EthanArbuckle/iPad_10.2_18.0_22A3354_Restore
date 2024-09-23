@implementation DAPlatform

+ (id)currentPlatform
{
  return +[DAPlatform_iOS_Swift sharedInstance](DAPlatform_iOS_Swift, "sharedInstance");
}

@end

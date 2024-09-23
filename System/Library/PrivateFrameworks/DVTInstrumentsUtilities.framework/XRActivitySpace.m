@implementation XRActivitySpace

+ (id)sharedInstance
{
  if (qword_25583C900 != -1)
    dispatch_once(&qword_25583C900, &unk_24EDC2BD0);
  return (id)qword_25583C908;
}

- (id)spaceName
{
  return CFSTR("Background Activity Space");
}

@end

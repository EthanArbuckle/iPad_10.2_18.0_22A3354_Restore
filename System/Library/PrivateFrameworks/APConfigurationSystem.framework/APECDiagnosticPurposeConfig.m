@implementation APECDiagnosticPurposeConfig

+ (NSString)path
{
  return (NSString *)CFSTR("EventCollection/Purposes/101");
}

- (NSNumber)purpose
{
  return (NSNumber *)&unk_250701F50;
}

@end

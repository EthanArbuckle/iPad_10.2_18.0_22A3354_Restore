@implementation ATXAudioConnectedMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 2;
}

@end

@implementation MXMOSSignpostSampleTag

+ (MXMOSSignpostSampleTag)timestamp
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.timestamp"));
}

+ (MXMOSSignpostSampleTag)duration
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.duration"));
}

+ (MXMOSSignpostSampleTag)animationFrameCount
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.frame.count"));
}

+ (MXMOSSignpostSampleTag)animationFrameRate
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.frame.rate"));
}

+ (MXMOSSignpostSampleTag)animationGlitchTimeRatio
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitch.time.ratio"));
}

+ (MXMOSSignpostSampleTag)animationNumberOfGlitches
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitch.number"));
}

+ (MXMOSSignpostSampleTag)animationGlitchesTotalDuration
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitches.total.duration"));
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchTimeRatioAdjusted
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitch.non_first_frame.time.ratio.adjusted"));
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameNumberOfGlitches
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitch.non_first_frame.number"));
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchesTotalDuration
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.animation.hitches.non_first_frame.total.duration"));
}

+ (MXMOSSignpostSampleTag)telemetryNumber1
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.telemetry.number.1"));
}

+ (MXMOSSignpostSampleTag)telemetryNumber2
{
  return -[MXMSampleTag initWithDNString:]([MXMOSSignpostSampleTag alloc], "initWithDNString:", CFSTR("os_signpost.telemetry.number.2"));
}

@end

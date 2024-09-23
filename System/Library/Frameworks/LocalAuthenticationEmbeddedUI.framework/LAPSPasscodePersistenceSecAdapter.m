@implementation LAPSPasscodePersistenceSecAdapter

- (BOOL)verifyFixedLengthNumericPasscodeIsStrong:(id)a3
{
  return SecPasswordIsPasswordWeak2() ^ 1;
}

- (BOOL)verifyVariableLengthAlphanumericPasscodeIsStrong:(id)a3
{
  return SecPasswordIsPasswordWeak2() ^ 1;
}

@end

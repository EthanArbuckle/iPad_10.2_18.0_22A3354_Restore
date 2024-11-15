@implementation TUCall(SafetyKit)

- (BOOL)sa_hasFailed
{
  unsigned int v1;
  _BOOL8 result;

  v1 = objc_msgSend(a1, "disconnectedReason");
  result = 1;
  if (v1 > 0x24)
    return v1 - 1000 < 2;
  if (((1 << v1) & 0x1BF1EF7F20) != 0)
    return result;
  return ((1 << v1) & 0x40E0080DFLL) == 0 && v1 - 1000 < 2;
}

@end

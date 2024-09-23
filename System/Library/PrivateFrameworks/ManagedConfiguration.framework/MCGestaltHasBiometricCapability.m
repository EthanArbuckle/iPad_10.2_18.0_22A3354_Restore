@implementation MCGestaltHasBiometricCapability

void __MCGestaltHasBiometricCapability_block_invoke()
{
  const void *v0;
  const void *v1;
  const void *v2;
  const void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    MCGestaltHasBiometricCapability_hasBiometrics = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    CFRelease(v1);
  }
  if (!MCGestaltHasBiometricCapability_hasBiometrics)
  {
    v2 = (const void *)MGCopyAnswer();
    if (v2)
    {
      v3 = v2;
      MCGestaltHasBiometricCapability_hasBiometrics = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
      CFRelease(v3);
    }
  }
}

@end

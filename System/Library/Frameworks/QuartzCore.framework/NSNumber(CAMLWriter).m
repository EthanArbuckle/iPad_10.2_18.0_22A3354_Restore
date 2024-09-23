@implementation NSNumber(CAMLWriter)

- (const)CAMLType
{
  double v1;
  double v2;

  objc_msgSend(a1, "doubleValue");
  v2 = floor(v1);
  if (fabs(v1) <= 2147483650.0 && v2 == v1)
    return CFSTR("integer");
  else
    return CFSTR("real");
}

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t v4;
  CFStringRef v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "doubleValue");
  v6[0] = v4;
  v5 = CACreateStringWithDoubleArray((uint64_t)v6, 1uLL, 1.0e-12);
  objc_msgSend(a3, "setElementContent:", v5);
  CFRelease(v5);
}

@end

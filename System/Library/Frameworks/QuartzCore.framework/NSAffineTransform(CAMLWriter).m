@implementation NSAffineTransform(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("CGAffineTransform");
}

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  CFStringRef v4;
  CFStringRef v5;
  CFStringRef v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "transformStruct");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  v10[0] = v7;
  v10[1] = v8;
  v10[2] = v9;
  v4 = CACreateStringWithDoubleArray((uint64_t)v10, 6uLL, 1.0e-12);
  if (v4)
  {
    v5 = v4;
    v6 = CFStringCreateWithFormat(0, 0, CFSTR("matrix(%@)"), v4);
    objc_msgSend(a3, "setElementContent:", v6);
    CFRelease(v6);
    CFRelease(v5);
  }
}

@end

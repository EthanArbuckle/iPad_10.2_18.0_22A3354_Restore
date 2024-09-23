@implementation NSCoder(_FEGeometryKeyedCoding)

- (void)encodeCGRect:()_FEGeometryKeyedCoding forKey:
{
  id v12;
  id v13;

  v12 = a7;
  _FEStringFromCGRect(a2, a3, a4, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v13, v12);

}

- (double)decodeCGRectForKey:()_FEGeometryKeyedCoding
{
  id v4;
  void *v5;
  id v6;
  double DoubleValue;
  __CFString *v8;
  CFStringRef v9;
  CFStringRef v10;
  __CFString *v11;
  CFStringRef v12;
  CFStringRef v13;
  __CFString *v15;
  __CFString *v16;
  CFStringRef v17;
  CFStringRef str;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    DoubleValue = *MEMORY[0x24BDBF090];
    if ((unint64_t)objc_msgSend(v6, "length") >= 0xD)
    {
      v15 = 0;
      v16 = 0;
      if (SplitBracesAndComma(v6, (CFStringRef *)&v16, (CFStringRef *)&v15))
      {
        v8 = v16;
        DoubleValue = *MEMORY[0x24BDBEFB0];
        if ((unint64_t)-[__CFString length](v8, "length") >= 5)
        {
          v17 = 0;
          str = 0;
          if (SplitBracesAndComma(v8, &str, &v17))
          {
            v9 = str;
            DoubleValue = CFStringGetDoubleValue(str);
            v10 = v17;
            CFStringGetDoubleValue(v17);
            CFRelease(v9);
            CFRelease(v10);
          }
        }

        v11 = v15;
        if ((unint64_t)-[__CFString length](v11, "length") >= 5)
        {
          v17 = 0;
          str = 0;
          if (SplitBracesAndComma(v11, &str, &v17))
          {
            v12 = str;
            CFStringGetDoubleValue(str);
            v13 = v17;
            CFStringGetDoubleValue(v17);
            CFRelease(v12);
            CFRelease(v13);
          }
        }

        CFRelease(v8);
        CFRelease(v11);
      }
    }

  }
  else
  {
    DoubleValue = *MEMORY[0x24BDBF090];
  }

  return DoubleValue;
}

@end

@implementation NSInvocation(NSInvocationDebugDescription)

- (NSMutableString)debugDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableString *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableString *v9;
  const __CFString *v10;
  uint64_t v12;

  v2 = (void *)objc_msgSend(a1, "methodSignature");
  v3 = objc_msgSend(v2, "_frameDescriptor");
  v4 = objc_msgSend(v2, "numberOfArguments");
  v5 = -[NSMutableString initWithCapacity:]([NSMutableString alloc], "initWithCapacity:", 100);
  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("<NSInvocation: %p>\n"), a1);
  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("return value: "));
  appendArgumentInfoToDescription(a1, 0, *(uint64_t **)v3, 1, v5);
  if (v4)
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("target: "));
    v6 = *(uint64_t **)(v3 + 8);
    appendArgumentInfoToDescription(a1, 0, v6, 0, v5);
    if (v4 != 1)
    {
      v7 = v6[1];
      if (v7)
      {
        v8 = 1;
        do
        {
          if (v8 == 1 && *(_BYTE *)(v7 + 36) == 58)
          {
            v9 = v5;
            v10 = CFSTR("selector: ");
          }
          else
          {
            v12 = v8;
            v9 = v5;
            v10 = CFSTR("argument %lu: ");
          }
          -[NSMutableString appendFormat:](v9, "appendFormat:", v10, v12);
          appendArgumentInfoToDescription(a1, v8++, (uint64_t *)v7, 0, v5);
          v7 = *(_QWORD *)(v7 + 8);
        }
        while (v7);
      }
    }
  }
  return v5;
}

@end

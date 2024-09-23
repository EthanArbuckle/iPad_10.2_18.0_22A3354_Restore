@implementation UIImage(MessagesAdditions)

- (id)__ms_PNGData
{
  __CFData *v2;
  CGImageDestination *v3;
  CGImageDestination *v4;
  void *v5;

  v2 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v3 = CGImageDestinationCreateWithData(v2, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
  if (v3)
  {
    v4 = v3;
    CGImageDestinationAddImage(v3, (CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"), 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
  }
  if (-[__CFData length](v2, "length"))
    v5 = (void *)-[__CFData copy](v2, "copy");
  else
    v5 = 0;

  return v5;
}

- (id)__ms_HEICData
{
  __CFData *v2;
  CGImageDestinationRef v3;
  CGImageDestination *v4;
  const __CFDictionary *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (__CFData *)objc_opt_new();
  v3 = CGImageDestinationCreateWithData(v2, CFSTR("public.heic"), 1uLL, 0);
  if (v3)
  {
    v4 = v3;
    v8 = *MEMORY[0x1E0CBC780];
    v9[0] = &unk_1EA267A80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(v4, (CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"), v5);
    CGImageDestinationFinalize(v4);
    CFAutorelease(v4);
    v6 = (void *)-[__CFData copy](v2, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

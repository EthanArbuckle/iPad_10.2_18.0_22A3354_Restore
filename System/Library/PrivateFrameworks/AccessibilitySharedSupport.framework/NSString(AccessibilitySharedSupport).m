@implementation NSString(AccessibilitySharedSupport)

- (id)axss_stringByTrimmingToLength:()AccessibilitySharedSupport encoding:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v6 = a1;
  if (objc_msgSend(v6, "lengthOfBytesUsingEncoding:", a4) > a3)
  {
    v7 = malloc_type_malloc(a3, 0x53904uLL);
    v11 = 0;
    objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, a3, &v11, a4, 0, 0, objc_msgSend(v6, "length"), 0);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = objc_msgSend(v8, "initWithBytes:length:encoding:", v7, v11, a4);

    free(v7);
    v6 = (id)v9;
  }
  return v6;
}

@end

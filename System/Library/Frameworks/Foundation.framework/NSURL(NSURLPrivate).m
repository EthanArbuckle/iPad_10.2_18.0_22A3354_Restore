@implementation NSURL(NSURLPrivate)

- (char)_initFileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  char *v9;
  Class Class;
  uint64_t v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!objc_msgSend(a3, "length"))
    {

      return 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: nil string parameter"), _NSMethodExceptionProem((objc_class *)a1, a2));
  }
  if ((objc_msgSend(a3, "isAbsolutePath") & 1) == 0)
    objc_msgSend(a3, "stringByStandardizingPath");
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class != (Class)qword_1ECD0A210)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&off_1EDCF95D8;
    v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
    if (!v9)
      return v9;
    v11 = _CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
    if (v11)
    {
      *(_QWORD *)&v9[*MEMORY[0x1E0C99EC8]] = v11;
      return v9;
    }

    if (!a5)
      return 0;
    goto LABEL_22;
  }
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if ((void *)qword_1ECD0A200 != a1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)a1, a2));
  v9 = (char *)_CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
  if (!v9)
  {
    if (!a5)
      return 0;
LABEL_22:
    if (*a5)
    {
      v9 = 0;
      *a5 = *a5;
      return v9;
    }
    return 0;
  }
  return v9;
}

+ (id)_fileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "_initFileURLWithPath:cachingResourceValuesForKeys:error:", a3, a4, a5);
}

@end

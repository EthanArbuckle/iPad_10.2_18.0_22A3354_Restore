@implementation NSObject(WFRuntimeUtilities)

+ (void)wf_enumerateClassMethodsWithPrefix:()WFRuntimeUtilities usingBlock:
{
  id v6;
  void (**v7)(id, objc_method *, const char *);
  objc_class *Class;
  Method *v9;
  unint64_t i;
  objc_method *v11;
  const char *Name;
  void *v13;
  unsigned int outCount;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    outCount = 0;
    Class = object_getClass(a1);
    v9 = class_copyMethodList(Class, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v11 = v9[i];
        Name = method_getName(v11);
        NSStringFromSelector(Name);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "hasPrefix:", v6))
          v7[2](v7, v11, Name);

      }
    }
    free(v9);
  }

}

@end

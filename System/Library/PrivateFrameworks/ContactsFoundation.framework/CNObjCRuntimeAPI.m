@implementation CNObjCRuntimeAPI

+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  Method *v6;
  unint64_t i;
  unsigned int outCount;

  v5 = (void (**)(id, _QWORD))a4;
  if (a3)
  {
    outCount = 0;
    v6 = class_copyMethodList(a3, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ((void (**)(id, Method))v5)[2](v5, v6[i++]))
        ;
    }
    free(v6);
  }

}

@end

@implementation NSObject(AXTrmpoline)

- (AXTrampoline)axSuperTrampoline
{
  objc_class *Class;
  BOOL isMetaClass;
  objc_class *v4;

  Class = object_getClass(a1);
  isMetaClass = class_isMetaClass(Class);
  v4 = (objc_class *)a1;
  if (!isMetaClass)
    v4 = object_getClass(a1);
  return +[AXTrampoline trampolineWithCaller:targetClass:](AXTrampoline, "trampolineWithCaller:targetClass:", a1, class_getSuperclass(v4));
}

- (AXTrampoline)axTrampolineForClass:()AXTrmpoline
{
  return +[AXTrampoline trampolineWithCaller:targetClass:](AXTrampoline, "trampolineWithCaller:targetClass:", a1, a3);
}

@end

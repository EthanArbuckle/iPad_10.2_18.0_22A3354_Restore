@implementation NSCTRubyAnnotation

- (unint64_t)_cfTypeID
{
  if (TCFBase<TRubyAnnotation>::GetTypeID(void)::once != -1)
    dispatch_once_f(&TCFBase<TRubyAnnotation>::GetTypeID(void)::once, 0, (dispatch_function_t)TCFBase<TRubyAnnotation>::GetTypeID(void)::{lambda(void *)#1}::__invoke);
  return TCFBase<TRubyAnnotation>::fTypeID;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end

@implementation NSObject(MKAbstractAnnotationContainerViewExtras)

- (uint64_t)_mapkit_isInternalAnnotation
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)_mapkit_isInternalAnnotationView
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end

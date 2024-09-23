@implementation _ContinuityCaptureShieldUICAPackage

- (id)substitutedClasses
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ContinuityCaptureShieldUICAPackage;
  v2 = -[_ContinuityCaptureShieldUICAPackage substitutedClasses](&v7, "substitutedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(NSNull, v5), CFSTR("LKEventHandler"));
  return v4;
}

@end

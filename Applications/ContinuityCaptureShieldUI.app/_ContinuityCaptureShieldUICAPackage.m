@implementation _ContinuityCaptureShieldUICAPackage

- (id)substitutedClasses
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ContinuityCaptureShieldUICAPackage;
  v2 = -[_ContinuityCaptureShieldUICAPackage substitutedClasses](&v6, "substitutedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(NSNull), CFSTR("LKEventHandler"));
  return v4;
}

@end

@implementation NDOTypeChecking

+ (BOOL)isNotEmptyString:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length") != 0;

  return v4;
}

@end

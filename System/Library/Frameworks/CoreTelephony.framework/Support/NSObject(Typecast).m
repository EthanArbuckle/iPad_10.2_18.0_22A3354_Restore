@implementation NSObject(Typecast)

+ (id)typecast:()Typecast
{
  id v3;
  id v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end

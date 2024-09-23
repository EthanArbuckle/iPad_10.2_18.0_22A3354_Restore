@implementation GKSignInOriginManager

+ (id)stringForOrigin:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("unknown");
  else
    return off_1E75B54A0[a3 - 1];
}

@end

@implementation MLService

+ (id)alloc
{
  return [_MLServiceS alloc];
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)objc_opt_class();
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return +[_MLServiceS instancesRespondToSelector:](_MLServiceS, "instancesRespondToSelector:", a3) & 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[_MLServiceS allocWithZone:](_MLServiceS, "allocWithZone:", a3);
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

@end

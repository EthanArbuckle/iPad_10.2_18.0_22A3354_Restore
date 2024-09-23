@implementation NFVoid

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "init");
}

@end

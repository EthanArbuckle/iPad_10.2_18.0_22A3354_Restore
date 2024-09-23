@implementation NSSymbolAutomaticContentTransition

+ (NSSymbolAutomaticContentTransition)transition
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NSSymbolAutomaticContentTransition;
  objc_msgSendSuper2(&v3, sel__transitionWithType_, 8);
  return (NSSymbolAutomaticContentTransition *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSSymbolAutomaticContentTransition;
  return -[NSSymbolContentTransition copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end

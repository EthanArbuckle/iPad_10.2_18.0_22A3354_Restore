@implementation NSSetChange

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSSetChange == a1)
    return +[NSSetChange allocWithZone:](NSConcreteSetChange, "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSetChange;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSSetChange)initWithType:(unint64_t)a3 object:(id)a4
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSSetChange;
  return -[NSSetChange init](&v5, sel_init, a3, a4);
}

- (unint64_t)changeType
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)value
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end

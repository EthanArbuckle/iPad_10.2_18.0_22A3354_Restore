@implementation NSFileSecurity

+ (NSFileSecurity)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSFileSecurity == a1)
    return (NSFileSecurity *)+[__NSPlaceholderFileSecurity immutablePlaceholder](__NSPlaceholderFileSecurity, "immutablePlaceholder", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSFileSecurity;
  return (NSFileSecurity *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (unint64_t)_cfTypeID
{
  return 64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation LNPropertyQuery

- (id)_init
{
  uint64_t v3;
  id result;
  objc_super v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("LNPropertyQuery cannot be initialized directly"));
    __break(1u);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LNPropertyQuery;
    return -[LNPropertyQuery init](&v5, sel_init);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

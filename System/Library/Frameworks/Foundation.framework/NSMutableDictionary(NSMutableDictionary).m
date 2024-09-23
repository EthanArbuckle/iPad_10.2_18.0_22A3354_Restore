@implementation NSMutableDictionary(NSMutableDictionary)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)initWithContentsOfURL:()NSMutableDictionary error:
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "newWithContentsOf:immutable:error:", a3, 0, a4);

  return v5;
}

- (uint64_t)initWithContentsOfFile:()NSMutableDictionary
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "newWithContentsOf:immutable:", a3, 0);

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSMutableDictionary
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "newWithContentsOf:immutable:", a3, 0);

  return v4;
}

@end

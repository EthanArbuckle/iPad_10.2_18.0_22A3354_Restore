@implementation _NSConstantData

- (unint64_t)retainCount
{
  return 1;
}

+ (id)alloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Alloc on %@ is not allowed"), NSStringFromClass(v4));
  return 0;
}

- (void)dealloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Dealloc on %@ is not allowed"), NSStringFromClass(v4));
}

- (unint64_t)length
{
  return (unint64_t)self[1].super.super.isa;
}

- (const)bytes
{
  return &self[2];
}

@end

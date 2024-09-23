@implementation _PFAbstractString

- (const)_fastCharacterContents
{
  return 0;
}

- (unint64_t)fastestEncoding
{
  return 4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithUTF8String:", -[_PFAbstractString UTF8String](self, "UTF8String"));
}

- (id)description
{
  return (id)-[_PFAbstractString copy](self, "copy");
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 <= 5 && ((1 << a3) & 0x32) != 0)
    return (const char *)-[_PFAbstractString UTF8String](self, "UTF8String");
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_PFAbstractString;
  return -[_PFAbstractString cStringUsingEncoding:](&v6, sel_cStringUsingEncoding_);
}

- (unint64_t)smallestEncoding
{
  return 4;
}

@end

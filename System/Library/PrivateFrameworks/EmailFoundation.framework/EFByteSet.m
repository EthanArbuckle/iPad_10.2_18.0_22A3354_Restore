@implementation EFByteSet

+ (id)asciiWhitespaceSet
{
  if (+[EFByteSet asciiWhitespaceSet]::onceToken != -1)
    dispatch_once(&+[EFByteSet asciiWhitespaceSet]::onceToken, &__block_literal_global_1);
  return (id)+[EFByteSet asciiWhitespaceSet]::set;
}

void __31__EFByteSet_asciiWhitespaceSet__block_invoke()
{
  EFByteSet *v0;
  void *v1;

  v0 = -[EFByteSet initWithCString:]([EFByteSet alloc], "initWithCString:", "\t\n\v\f\r ");
  v1 = (void *)+[EFByteSet asciiWhitespaceSet]::set;
  +[EFByteSet asciiWhitespaceSet]::set = (uint64_t)v0;

}

- (EFByteSet)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void *v7;
  void *v8;
  EFByteSet *result;
  BOOL v10;
  uint64_t v11;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromRange(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("range extends beyond {0..255}: (NSRange) %@"), v8);

  }
  v12.receiver = self;
  v12.super_class = (Class)EFByteSet;
  result = -[EFByteSet init](&v12, sel_init);
  if (result)
    v10 = location >= v6;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = 256;
    if (location > 0x100)
      v11 = location;
    do
    {
      if (v11 == location)
        std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
      *(unint64_t *)((char *)result->_bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << location;
      ++location;
      --length;
    }
    while (length);
  }
  return result;
}

- (EFByteSet)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  EFByteSet *result;
  BOOL v7;
  unsigned int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EFByteSet;
  result = -[EFByteSet init](&v9, sel_init);
  if (result)
    v7 = a4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    do
    {
      v8 = *(unsigned __int8 *)a3;
      a3 = (char *)a3 + 1;
      *(unint64_t *)((char *)result->_bitString.__first_ + (((unint64_t)v8 >> 3) & 0x18)) |= 1 << v8;
      --a4;
    }
    while (a4);
  }
  return result;
}

- (EFByteSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EFByteSet;
  return -[EFByteSet init](&v3, sel_init);
}

- (EFByteSet)initWithCString:(const char *)a3
{
  return -[EFByteSet initWithBytes:length:](self, "initWithBytes:length:", a3, strlen(a3));
}

- (id)description
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 256; ++i)
  {
    if (((*(unint64_t *)((char *)self->_bitString.__first_ + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02zX"), i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p> {%@}"), v7, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init(EFMutableByteSet);
  if (result)
  {
    v5 = *(_OWORD *)self->_bitString.__first_;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_bitString.__first_[2];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (BOOL)byteIsMember:(unsigned __int8)a3
{
  return (*(unint64_t *)((char *)self->_bitString.__first_ + (((unint64_t)a3 >> 3) & 0x18)) >> a3) & 1;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

@implementation EFMutableByteSet

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init(EFByteSet);
  if (result)
  {
    v5 = *(_OWORD *)self->super._bitString.__first_;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->super._bitString.__first_[2];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (void)addBytesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromRange(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("range extends beyond {0..255}: (NSRange) %@"), v9);

  }
  if (location < v6)
  {
    v10 = 256;
    if (location > 0x100)
      v10 = location;
    do
    {
      if (v10 == location)
        std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
      *(unint64_t *)((char *)self->super._bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << location;
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)removeBytesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromRange(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("range extends beyond {0..255}: (NSRange) %@"), v9);

  }
  if (location < v6)
  {
    v10 = 256;
    if (location > 0x100)
      v10 = location;
    do
    {
      if (v10 == location)
        std::__throw_out_of_range[abi:ne180100]("bitset reset argument out of range");
      *(unint64_t *)((char *)self->super._bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << location);
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)invert
{
  *(int8x16_t *)self->super._bitString.__first_ = vmvnq_s8(*(int8x16_t *)self->super._bitString.__first_);
  *(int8x16_t *)&self->super._bitString.__first_[2] = vmvnq_s8(*(int8x16_t *)&self->super._bitString.__first_[2]);
}

@end

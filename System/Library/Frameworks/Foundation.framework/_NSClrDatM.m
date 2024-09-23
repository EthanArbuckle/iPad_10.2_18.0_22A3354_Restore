@implementation _NSClrDatM

- (void)_freeBytes
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset_s(self->super._bytes, self->super._capacity, 0, self->super._capacity);
  v3.receiver = self;
  v3.super_class = (Class)_NSClrDatM;
  -[NSConcreteMutableData _freeBytes](&v3, sel__freeBytes);
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return 0;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (BOOL)_canUseRealloc
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSClrDatM;
  -[NSData encodeWithCoder:](&v4, sel_encodeWithCoder_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.zeroing"));
}

- (id)description
{
  return CFSTR("{length = <redacted>, bytes = <redacted>}");
}

@end

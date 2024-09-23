@implementation IPv6PrefixWrapper

- (IPv6PrefixWrapper)initWithPrefix:(id *)a3
{
  IPv6PrefixWrapper *v4;
  $B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)IPv6PrefixWrapper;
  v4 = -[IPv6PrefixWrapper init](&v7, sel_init);
  if (v4)
  {
    v5 = ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v4->_ipv6Prefix = v5;
    if (v5)
    {
      *v5 = *a3;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_ipv6Prefix);
  v3.receiver = self;
  v3.super_class = (Class)IPv6PrefixWrapper;
  -[IPv6PrefixWrapper dealloc](&v3, sel_dealloc);
}

- (const)ipv6Prefix
{
  return self->_ipv6Prefix;
}

@end

@implementation NSString

- (id)_FCCKPIdentifierWithType:(void *)a1
{
  uint64_t v4;

  if (a1)
  {
    v4 = objc_opt_new();
    -[FCCKPIdentifier setName:](v4, a1);
    if (v4)
    {
      *(_BYTE *)(v4 + 20) |= 1u;
      *(_DWORD *)(v4 + 16) = a2;
    }
  }
  else
  {
    v4 = 0;
  }
  return (id)v4;
}

void __49__NSString_FCAdditions__fc_isValidColorHexString__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^#?(([0-9A-F]{2}){3,4}|([0-9A-F]){3})$"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_224;
  _MergedGlobals_224 = v0;

}

@end

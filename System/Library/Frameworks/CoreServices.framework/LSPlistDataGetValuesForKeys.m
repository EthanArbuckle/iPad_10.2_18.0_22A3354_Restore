@implementation LSPlistDataGetValuesForKeys

void ___LSPlistDataGetValuesForKeys_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  id v9;

  v5 = a2;
  v6 = (uint64_t)v5;
  if (*(_BYTE *)(a1 + 40))
  {
    v8 = v5;
    _LSPlistCompactString(v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = v7;
  }
  v9 = (id)v6;
  -[_LSPlistHint setCachedValue:forKey:](*(_QWORD *)(a1 + 32), a3, v6);

}

@end

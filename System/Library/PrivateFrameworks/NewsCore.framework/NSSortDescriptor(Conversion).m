@implementation NSSortDescriptor(Conversion)

- (id)FCCKPQuerySort
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  void *v6;

  v2 = objc_opt_new();
  v3 = objc_msgSend(a1, "ascending");
  if (v2)
  {
    if (v3)
      v4 = 1;
    else
      v4 = 2;
    *(_BYTE *)(v2 + 20) |= 1u;
    *(_DWORD *)(v2 + 16) = v4;
  }
  objc_msgSend(a1, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCCKPRecordFieldIdentifierForUserFieldName(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPQuerySort setFieldName:](v2, v6);

  return (id)v2;
}

@end

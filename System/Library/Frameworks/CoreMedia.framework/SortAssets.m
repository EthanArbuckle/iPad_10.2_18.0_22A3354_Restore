@implementation SortAssets

uint64_t __figMobileAsset_SortAssets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v4 = objc_msgSend((id)objc_msgSend(a2, "attributes"), "objectForKey:", CFSTR("_ContentVersion"));
  v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("_ContentVersion"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)v4;
  else
    v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
    return objc_msgSend(v6, "compare:", v7);
  if (v7)
    v9 = -1;
  else
    v9 = 0;
  if (v6)
    return 1;
  else
    return v9;
}

@end

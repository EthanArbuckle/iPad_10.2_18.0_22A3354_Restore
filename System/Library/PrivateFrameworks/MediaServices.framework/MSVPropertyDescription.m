@implementation MSVPropertyDescription

uint64_t ___MSVPropertyDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("="));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("="));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(&unk_1E43FC6A0, "indexOfObject:", v6);
  v10 = objc_msgSend(&unk_1E43FC6A0, "indexOfObject:", v8);
  v11 = -1;
  if (v9 >= v10)
    v11 = 1;
  if (v9 == v10)
    v12 = 0;
  else
    v12 = v11;

  return v12;
}

@end

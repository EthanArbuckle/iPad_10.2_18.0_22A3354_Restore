@implementation AppURLInContainer

uint64_t ___AppURLInContainer_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v6 = a2;
  v7 = v6;
  if (a3 == 4
    && (objc_msgSend(v6, "pathExtension"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("app")),
        v8,
        v9))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

@end

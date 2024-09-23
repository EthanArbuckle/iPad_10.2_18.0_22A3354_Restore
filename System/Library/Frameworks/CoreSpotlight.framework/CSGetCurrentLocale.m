@implementation CSGetCurrentLocale

void __CSGetCurrentLocale_block_invoke()
{
  CSLocaleObserver *v0;
  void *v1;

  v0 = objc_alloc_init(CSLocaleObserver);
  v1 = (void *)CSGetCurrentLocale_sLocaleObserver;
  CSGetCurrentLocale_sLocaleObserver = (uint64_t)v0;

}

void __CSGetCurrentLocale_block_invoke_2(_QWORD *a1, void *a2, void *a3, char a4)
{
  id v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a2;
  v12 = a3;
  if (v12)
  {
    v8 = (void *)a1[4];
    if (v8)
      objc_msgSend(v8, "addObjectsFromArray:", v12);
  }
  v9 = (_BYTE *)a1[6];
  if (v9)
    *v9 = a4;
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

@end

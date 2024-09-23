@implementation NTPBTodaySectionConfigGenerateArticles

void __NTPBTodaySectionConfigGenerateArticles_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  char v10;
  BOOL v11;

  v11 = 0;
  NTPBTodaySectionConfigGenerateArticle(a2, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = v11;
  if (*(_BYTE *)(v7 + 24))
    v9 = !v11;
  else
    v9 = 1;
  v10 = !v9;
  *(_BYTE *)(v7 + 24) = v10;
  if (!v8)
    *a4 = 1;

}

@end

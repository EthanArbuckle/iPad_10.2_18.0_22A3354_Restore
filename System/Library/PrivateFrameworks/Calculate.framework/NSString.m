@implementation NSString

id __71__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = objc_msgSend(v4, "range");
  objc_msgSend(v3, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "range");
  v10 = v9;

  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v2 + 16))(v2, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v10, a2 - v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v11);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 + a3;
}

void __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a2)
  {
    v3 = a1[4];
    v4 = a2;
    v5 = objc_msgSend(v4, "range");
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v5, v6);
    v7 = a1[5];
    v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    (*(void (**)(void))(v7 + 16))();
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appendString:", v9);
  }
}

void __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes;
  calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes = v0;

  v2 = objc_opt_new();
  v3 = (void *)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock;
  calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock = v2;

}

@end

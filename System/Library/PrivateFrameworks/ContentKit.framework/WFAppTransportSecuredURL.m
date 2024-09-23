@implementation WFAppTransportSecuredURL

uint64_t __WFAppTransportSecuredURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSIncludesSubdomains"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "count");
    if (v9 <= objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "subarrayWithRange:", objc_msgSend(*(id *)(a1 + 48), "count") - objc_msgSend(v8, "count"), objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isEqualToArray:", v8);

    }
    else
    {
      v10 = 0;
    }
    v5 = v8;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5);
  }

  return v10;
}

@end

@implementation NSDictionary

void __56__NSDictionary_AppleMediaServices__ams_filterUsingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

uint64_t __62__NSDictionary_AppleMediaServices_Project__ams_valuesForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __64__NSDictionary_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "supportsSecureCoding");
}

void __57__NSDictionary_AppleMediaServices__ams_mapWithTransform___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "second");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "first");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

    v2 = v6;
  }

}

AMSPair *__64__NSDictionary_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  uint64_t v7;
  AMSPair *v8;
  void *v9;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [AMSPair alloc];
    objc_msgSend(v5, "ams_sanitizedForSecureCoding");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v7;
    v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v4, v7);

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v6 = [AMSPair alloc];
    objc_msgSend(v5, "description");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v4, v5);
LABEL_10:

  return v8;
}

AMSPair *__53__NSDictionary_AppleMediaServices__hashedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  void *v8;
  AMSPair *v9;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  AMSHashIfNeeded(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AMSHashIfNeeded(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v7, v8);
  return v9;
}

void __60__NSDictionary_AppleMediaServices__ams_arrayUsingTransform___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

uint64_t __89__NSDictionary_AppleMediaServices_Project__ams_keysForChangedValuesComparedToDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;
  return v7;
}

void __66__NSDictionary_AppleMediaServices__ams_firstKeyObjectPassingTest___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  AMSPair *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v8 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v11, v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

@end

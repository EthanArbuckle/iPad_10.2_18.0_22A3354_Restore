@implementation ASDErrorWithSafeUserInfo

void __ASDErrorWithSafeUserInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  safeUserInfoValue(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((id)v6 != v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v10);
  }
  else
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("_desc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

  }
}

@end

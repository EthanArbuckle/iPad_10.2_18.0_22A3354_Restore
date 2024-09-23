@implementation MakeVisibleFunctionTablesForPipeline

id ___MakeVisibleFunctionTablesForPipeline_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type")));
  if (objc_msgSend(v4, "unsignedIntValue") == 24)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index")));
    v6 = objc_msgSend(v5, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

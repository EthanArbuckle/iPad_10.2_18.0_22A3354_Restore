@implementation LSEncodeURLPropertyDictionary

void ___LSEncodeURLPropertyDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  _LSReplaceURLPropertyValueForEncoding(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

@end

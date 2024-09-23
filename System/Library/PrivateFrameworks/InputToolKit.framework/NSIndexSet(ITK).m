@implementation NSIndexSet(ITK)

+ (id)itk_indexSetWithNSNumberIndex:()ITK
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
    v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndex:", objc_msgSend(v3, "unsignedIntValue"));
  else
    v4 = objc_alloc_init(MEMORY[0x24BDD15E0]);
  v5 = v4;

  return v5;
}

- (id)itk_rangeArray
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__NSIndexSet_ITK__itk_rangeArray__block_invoke;
  v6[3] = &unk_250F9E438;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (__CFString)itk_indexString
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return CFSTR("[]");
  if (v2 == 1)
  {
    v3 = objc_msgSend(a1, "firstIndex");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld]"), v3);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v5, "appendString:", CFSTR("["));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__NSIndexSet_ITK__itk_indexString__block_invoke;
    v9[3] = &unk_250F9E460;
    v10 = v5;
    v6 = v5;
    objc_msgSend(a1, "enumerateIndexesUsingBlock:", v9);
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (__CFString *)v8;
  }
}

@end

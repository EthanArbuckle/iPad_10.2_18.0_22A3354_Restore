@implementation NSString

void __56__NSString_ITK__itk_whitespaceAndNewlineCoalescedString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[\r\n\\s]+"), 0, 0);
  v1 = (void *)itk_whitespaceAndNewlineCoalescedString_regex;
  itk_whitespaceAndNewlineCoalescedString_regex = v0;

}

uint64_t __30__NSString_ITK__itk_wordCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0FA8])
    && (unint64_t)objc_msgSend(v9, "length") >= *(_QWORD *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke_67(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(" "));
}

void __60__NSString_ITK__itk_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v12 = v3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v12;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v8 = (void *)MEMORY[0x24BDD1968];
  v9 = objc_msgSend(v3, "range");
  objc_msgSend(v8, "valueWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

}

unint64_t __40__NSString_ITK__itk_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t result;
  unint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "length");
  if (v3 <= result)
    v5 = result;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end

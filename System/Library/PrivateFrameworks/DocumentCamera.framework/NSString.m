@implementation NSString

void __54__NSString_DC__dc_whitespaceAndNewlineCoalescedString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[\r\n\\s]+"), 0, 0);
  v1 = (void *)dc_whitespaceAndNewlineCoalescedString_regex;
  dc_whitespaceAndNewlineCoalescedString_regex = v0;

}

void __58__NSString_DC__dc_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
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

unint64_t __38__NSString_DC__dc_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
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

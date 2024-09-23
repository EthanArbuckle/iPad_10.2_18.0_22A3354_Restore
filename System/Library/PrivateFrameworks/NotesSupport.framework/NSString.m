@implementation NSString

void __54__NSString_IC__ic_whitespaceAndNewlineCoalescedString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[\r\n\\s]+"), 0, 0);
  v1 = (void *)ic_whitespaceAndNewlineCoalescedString_regex;
  ic_whitespaceAndNewlineCoalescedString_regex = v0;

}

void __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2D40])
    && (unint64_t)objc_msgSend(v9, "length") >= *(_QWORD *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke_90(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(" "));
}

void __58__NSString_IC__ic_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
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
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v12;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v9 = objc_msgSend(v3, "range");
  objc_msgSend(v8, "valueWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

}

NSUInteger __41__NSString_IC__ic_sentenceRangeForRange___block_invoke(uint64_t a1, int a2, NSRange range1, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  NSUInteger length;
  NSUInteger location;
  NSRange v12;
  BOOL v13;
  uint64_t v14;
  NSRange v16;
  NSRange v17;
  NSRange v18;

  length = range1.length;
  location = range1.location;
  v17 = *(NSRange *)(a1 + 40);
  v16.location = location;
  v16.length = length;
  v12 = NSIntersectionRange(v16, v17);
  if (v12.length)
    v13 = v12.location == 0x7FFFFFFFFFFFFFFFLL;
  else
    v13 = 1;
  if (!v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12.location = *(_QWORD *)(v14 + 32);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v14 + 32) = location;
      *(_QWORD *)(v14 + 40) = length;
    }
    else
    {
      v12.length = *(_QWORD *)(v14 + 40);
      v18.location = location;
      v18.length = length;
      v12 = NSUnionRange(v12, v18);
      *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v12;
    }
  }
  if ((unint64_t)(a4 + a5) > *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40))
    *a6 = 1;
  return v12.location;
}

unint64_t __38__NSString_IC__ic_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
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

id __45__NSString_HTMLStrings___HTMLTagNameClosing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isAtEnd") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "scanLocation"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end

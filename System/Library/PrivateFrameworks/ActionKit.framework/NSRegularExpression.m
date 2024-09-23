@implementation NSRegularExpression

void __63__NSRegularExpression_ENAGRegex__enCapturedSubstringsOfString___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "numberOfRanges"))
  {
    v3 = 0;
    do
    {
      v4 = objc_msgSend(v9, "rangeAtIndex:", v3);
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(MEMORY[0x24BDD17C8], "string");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v8, "addObject:", v7);

      ++v3;
    }
    while (v3 < objc_msgSend(v9, "numberOfRanges"));
  }

}

@end

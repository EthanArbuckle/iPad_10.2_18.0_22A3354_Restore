@implementation NSAttributedString

void __96__NSAttributedString_LTParagraphs__lt_attributedStringByJoiningComponents_withAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v5);

}

@end

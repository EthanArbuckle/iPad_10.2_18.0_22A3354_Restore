@implementation UpdateRectTransformDictionary

void __UpdateRectTransformDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(a3, "removeFromSuperlayer");
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);

}

void __UpdateRectTransformDictionary_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!CGColorEqualToColor((CGColorRef)objc_msgSend(v4, "backgroundColor"), *(CGColorRef *)(a1 + 32)))
    objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)(a1 + 32));

}

@end

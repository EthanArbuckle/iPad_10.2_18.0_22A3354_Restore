@implementation CARHandleSuggestUI

BOOL __CARHandleSuggestUI_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __CARHandleSuggestUI_block_invoke_313(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  else
    v4 = 0;

  return v4;
}

void __CARHandleSuggestUI_block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v6, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

    v4 = v6;
  }

}

@end

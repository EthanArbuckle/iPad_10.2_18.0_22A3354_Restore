@implementation GEOLPRLPRConvertRule

void __64__GEOLPRLPRConvertRule_MNExtras__rules_forPlateTypes_atIndexes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!objc_msgSend(v10, "plateTypeIndexesCount"))
  {
LABEL_8:
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v8, "addObject:", v9);

    goto LABEL_9;
  }
  v3 = objc_msgSend(v10, "plateTypeIndexesCount");
  v4 = objc_msgSend(v10, "plateTypeIndexes");
  if (v3)
  {
    v5 = (unsigned int *)v4;
    do
    {
      v7 = *v5++;
      v6 = v7;
      if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v7))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "count") > v6)
          goto LABEL_8;
      }
    }
    while (--v3);
  }
LABEL_9:

}

@end

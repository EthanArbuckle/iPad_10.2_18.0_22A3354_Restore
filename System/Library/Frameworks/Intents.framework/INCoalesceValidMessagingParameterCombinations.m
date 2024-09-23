@implementation INCoalesceValidMessagingParameterCombinations

uint64_t __INCoalesceValidMessagingParameterCombinations_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = objc_msgSend(v5, "containsObject:", CFSTR("speakableGroupName"));
  v8 = objc_msgSend(v5, "containsObject:", CFSTR("recipients"));
  v9 = v8;
  if (v7 && (v8 & 1) != 0)
    goto LABEL_10;
  if (v7)
  {
    objc_msgSend(v5, "setByAddingObject:", CFSTR("recipients"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "containsObject:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_9;
  }
  if (!v9)
    goto LABEL_10;
  objc_msgSend(v5, "setByAddingObject:", CFSTR("speakableGroupName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "containsObject:", v12))
  {
    v13 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v13, "removeObject:", CFSTR("recipients"));
    objc_msgSend(v13, "addObject:", CFSTR("speakableGroupName"));
    v14 = objc_msgSend(v6, "containsObject:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_9;
LABEL_10:
    v15 = 1;
    goto LABEL_11;
  }

LABEL_9:
  v15 = 0;
LABEL_11:

  return v15;
}

@end

@implementation CNUIUserActionCurator

uint64_t __59___CNUIUserActionCurator_curateUserAction_withKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v6 = a2;
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "label");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v8 = 0;
LABEL_7:
      objc_msgSend(v6, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:ignoreURLs:", *(_QWORD *)(a1 + 40), 1);

      if (!v8)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  objc_msgSend(v6, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    v8 = 1;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_8:

LABEL_9:
  if (!v7)

  return v9;
}

@end

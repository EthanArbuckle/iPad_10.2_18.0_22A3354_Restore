@implementation FCPromoteAccessibleHeadline

uint64_t ___FCPromoteAccessibleHeadline_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasThumbnail");
}

uint64_t ___FCPromoteAccessibleHeadline_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  char v28;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;

  v3 = a2;
  if (objc_msgSend(v3, "hasThumbnail"))
  {
    v4 = *(id *)(a1 + 32);
    v5 = v3;
    v6 = objc_msgSend(v5, "isPaid");
    v7 = objc_msgSend(v5, "isBundlePaid");
    objc_msgSend(v5, "sourceChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    v11 = v9;
    objc_msgSend(v10, "bundleSubscriptionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "purchaseProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = v13;
    v16 = v11;
    if ((v6 & 1) == 0 && !v7)
      goto LABEL_8;
    v17 = v6 ^ 1;
    if (!v15)
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      objc_msgSend(v15, "purchasedTagIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v16);

      if ((v19 & 1) != 0)
        goto LABEL_8;
    }
    v21 = v7 ^ 1;
    if (!v14)
      v21 = 1;
    if ((v21 & 1) == 0)
    {
      v22 = v14;
      v23 = v16;
      if (!v23)
        goto LABEL_15;
      objc_msgSend(v22, "bundleSubscription");
      v34 = v23;
      v24 = objc_claimAutoreleasedReturnValue();
      objc_getAssociatedObject((id)v24, (const void *)(v24 + 1));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v32, "unsignedIntegerValue");
      v26 = v25;
      objc_getAssociatedObject((id)v24, (const void *)~v25);
      v35 = v22;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue") ^ v26;

      v22 = v35;
      v23 = v34;
      if ((v28 & 1) != 0)
      {
        objc_msgSend(v35, "bundleSubscription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleChannelIDs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "containsObject:", v34);

        if ((v33 & 1) != 0)
        {
LABEL_8:
          v20 = 1;
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
LABEL_15:

      }
    }
    v20 = 0;
    goto LABEL_17;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

@end

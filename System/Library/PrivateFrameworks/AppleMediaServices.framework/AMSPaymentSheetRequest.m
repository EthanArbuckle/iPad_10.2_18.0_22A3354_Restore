@implementation AMSPaymentSheetRequest

- (unint64_t)ams_confirmationStyle
{
  int64_t v2;

  v2 = -[AMSPaymentSheetRequest confirmationTitle](self, "confirmationTitle");
  if ((unint64_t)(v2 - 1) > 5)
    return 0;
  else
    return qword_18CF5CC48[v2 - 1];
}

- (unint64_t)ams_paymentRequestorType
{
  int64_t v2;

  v2 = -[AMSPaymentSheetRequest payee](self, "payee");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_18CF5CC78[v2 - 1];
}

- (id)ams_createSummaryItems
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id PKPaymentSummaryItemClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v24[20];
  _QWORD v25[4];
  id v26;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSPaymentSheetRequest paymentSummary](self, "paymentSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSPaymentSheetRequest paymentSummary](self, "paymentSummary");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  -[AMSPaymentSheetRequest storeName](self, "storeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    AMSLocalizedString(CFSTR("CONFIRMATION_TITLE_PAY"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  AMSLocalizedString(CFSTR("CONFIRMATION_TITLE_PAY"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest storeName](self, "storeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  if (-[AMSPaymentSheetRequest shouldUppercaseText](self, "shouldUppercaseText"))
  {
    objc_msgSend(v6, "localizedUppercaseString");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  -[AMSPaymentSheetRequest priceSectionItems](self, "priceSectionItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__AMSPaymentSheetRequest_PassKit__ams_createSummaryItems__block_invoke;
  v25[3] = &unk_1E2544540;
  v13 = v3;
  v26 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
  -[AMSPaymentSheetRequest price](self, "price");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &unk_1E25AF8A8;
  if (v14)
    v16 = (void *)v14;
  v17 = v16;

  PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  v19 = (void *)MEMORY[0x1E0CB3598];
  objc_msgSend(v17, "decimalValue");

  objc_msgSend(v19, "decimalNumberWithDecimal:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PKPaymentSummaryItemClass, "summaryItemWithLabel:amount:", v6, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v21);
  if (objc_msgSend(v13, "count"))
    v22 = (void *)objc_msgSend(v13, "copy");
  else
    v22 = 0;

  return v22;
}

void __57__AMSPaymentSheetRequest_PassKit__ams_createSummaryItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id PKPaymentSummaryItemClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PKPaymentSummaryItemClass, "summaryItemWithLabel:amount:", v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "price");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLocalizedAmount:", v7);
  objc_msgSend(v8, "setUseDarkColor:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (id)ams_createSummaryItemsForAttributedListWithAssetCache:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[AMSPaymentSheetRequest attributedList](self, "attributedList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _summaryItemsForAttributedList:assetCache:bag:](self, "_summaryItemsForAttributedList:assetCache:bag:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_createContentItemForAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AMSPaymentSheetRequest accountHeader](self, "accountHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AMSPaymentSheetRequest account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("%%appleId%%"), "ams_replaceAccountPatternWithUsername:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
      objc_msgSend(v7, "setTitle:", v8);

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
      objc_msgSend(v7, "setLabel:", v9);

    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        -[AMSPaymentSheetRequest logKey](self, "logKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v12;
        v18 = 2114;
        v19 = v14;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain or format account name", (uint8_t *)&v16, 0x16u);

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)ams_createContentItemForDeviceName:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)getPKPaymentContentItemClass());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);

  objc_msgSend(v4, "setTitle:", v5);
  objc_msgSend(v4, "setCentered:", 1);
  return v4;
}

- (id)ams_createAMSContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest flexList](self, "flexList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _amsContentItemsForFlexibleList:assetCache:designVersion:bag:](self, "_amsContentItemsForFlexibleList:assetCache:designVersion:bag:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ams_createContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest flexList](self, "flexList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _contentItemsForFlexibleList:assetCache:designVersion:bag:](self, "_contentItemsForFlexibleList:assetCache:designVersion:bag:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ams_createAMSContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest preSheetDialog](self, "preSheetDialog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _amsContentItemsForFlexibleList:assetCache:designVersion:bag:](self, "_amsContentItemsForFlexibleList:assetCache:designVersion:bag:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ams_createContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest preSheetDialog](self, "preSheetDialog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _contentItemsForFlexibleList:assetCache:designVersion:bag:](self, "_contentItemsForFlexibleList:assetCache:designVersion:bag:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ams_createAMSContentItemForRating
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AMSPaymentSheetRequest ratingHeader](self, "ratingHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest ratingValue](self, "ratingValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    -[AMSPaymentSheetRequest ams_createAMSContentItem:label:image:accessibilityIdentifier:](self, "ams_createAMSContentItem:label:image:accessibilityIdentifier:", v7, v8, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)ams_createContentItemForRating
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[AMSPaymentSheetRequest ratingHeader](self, "ratingHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest ratingValue](self, "ratingValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v6 = objc_alloc_init((Class)getPKPaymentContentItemClass());
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
    objc_msgSend(v6, "setTitle:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    objc_msgSend(v6, "setLabel:", v8);

  }
  return v6;
}

- (id)ams_createSecondaryContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest secondaryFlexList](self, "secondaryFlexList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest _amsContentItemsForFlexibleList:assetCache:designVersion:bag:](self, "_amsContentItemsForFlexibleList:assetCache:designVersion:bag:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ams_amsContentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t v20;
  CGImage *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    v29 = 0;
    goto LABEL_18;
  }
  if (v15)
  {
    if (-[AMSPaymentSheetRequest payee](self, "payee") == 3 && a5 == 0)
      v20 = 4;
    else
      v20 = a5;
    v21 = -[AMSPaymentSheetRequest _createImageRefWithURL:designVersion:adornmentStyle:bag:](self, "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v15, v17, v20, v18);
    if (v21)
      goto LABEL_16;
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_opt_class();
      v31 = v24;
      -[AMSPaymentSheetRequest logKey](self, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load salable icon image", buf, 0x16u);

    }
  }
  v21 = 0;
LABEL_16:
  -[AMSPaymentSheetRequest _attachInlineImagesToAttributedString:designVersion:bag:](self, "_attachInlineImagesToAttributedString:designVersion:bag:", v14, v17, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "attributedStringByRemovingPlaceholderTagsFromAttributedString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
  -[AMSPaymentSheetRequest ams_createAMSContentItem:label:image:accessibilityIdentifier:](self, "ams_createAMSContentItem:label:image:accessibilityIdentifier:", v28, v27, v21, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v29;
}

- (id)ams_contentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int64_t v19;
  CGImage *v20;
  CGImage *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (v13)
  {
    v17 = objc_alloc_init((Class)getPKPaymentContentItemClass());
    if (v14)
    {
      if (-[AMSPaymentSheetRequest payee](self, "payee") == 3 && a5 == 0)
        v19 = 4;
      else
        v19 = a5;
      v20 = -[AMSPaymentSheetRequest _createImageRefWithURL:designVersion:adornmentStyle:bag:](self, "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v14, v15, v19, v16);
      if (v20)
      {
        v21 = v20;
        objc_msgSend(v17, "setImage:", v20);
        CGImageRelease(v21);
      }
      else
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)objc_opt_class();
          v33 = v25;
          -[AMSPaymentSheetRequest logKey](self, "logKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v25;
          v36 = 2114;
          v37 = v26;
          _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load salable icon image", buf, 0x16u);

        }
      }
    }
    -[AMSPaymentSheetRequest _attachInlineImagesToAttributedString:designVersion:bag:](self, "_attachInlineImagesToAttributedString:designVersion:bag:", v13, v15, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "attributedStringByRemovingPlaceholderTagsFromAttributedString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSPaymentSheetRequest account](self, "account");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "username");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ams_replaceAccountPatternWithUsername:", v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
    objc_msgSend(v17, "setTitle:", v31);

    objc_msgSend(v17, "setLabel:", v22);
  }
  else
  {
    v17 = 0;
    v22 = 0;
  }

  return v17;
}

- (id)ams_createAMSContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest salableInfoLabel](self, "salableInfoLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest salableIconURL](self, "salableIconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest ams_amsContentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:](self, "ams_amsContentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:", v11, v12, -[AMSPaymentSheetRequest salableIcon](self, "salableIcon"), v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)ams_createSecondaryContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest secondarySalableInfoLabel](self, "secondarySalableInfoLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest secondarySalableIconURL](self, "secondarySalableIconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest ams_amsContentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:](self, "ams_amsContentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:", v11, v12, -[AMSPaymentSheetRequest secondarySalableIcon](self, "secondarySalableIcon"), v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)ams_createContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSPaymentSheetRequest salableInfoLabel](self, "salableInfoLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest salableIconURL](self, "salableIconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPaymentSheetRequest ams_contentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:](self, "ams_contentItemForSalableInfoLabel:salableIconURL:salableIcon:assetCache:designVersion:bag:", v11, v12, -[AMSPaymentSheetRequest salableIcon](self, "salableIcon"), v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)attributedStringByRemovingPlaceholderTagsFromAttributedString:(id)a3
{
  void *v3;
  id v4;
  void (**v5)(void *, const __CFString *);
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__AMSPaymentSheetRequest_PassKit__attributedStringByRemovingPlaceholderTagsFromAttributedString___block_invoke;
  aBlock[3] = &unk_1E2542FE8;
  v9 = v3;
  v4 = v3;
  v5 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v5[2](v5, CFSTR("%%image_"));
  v5[2](v5, CFSTR("%%IMAGE_"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v4);

  return v6;
}

void __97__AMSPaymentSheetRequest_PassKit__attributedStringByRemovingPlaceholderTagsFromAttributedString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", v9);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    v6 = v4;
    do
    {
      v7 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("%%"), 0, v6 + 1, objc_msgSend(v3, "length") + ~v6);
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v6, v8 - v6 + v7, &stru_1E2548760);
      objc_msgSend(*(id *)(a1 + 32), "mutableString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "rangeOfString:", v9);
      v3 = v5;
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (id)_attachInlineImagesToAttributedString:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CGImage *v30;
  __CFData *Mutable;
  CGImageDestination *v32;
  int v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  _BOOL4 v56;
  _BOOL4 v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  const __CFString *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  id v97;
  void *v98;
  objc_class *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v105;
  id v106;
  void *v107;
  os_log_t log;
  NSObject *loga;
  os_log_t logb;
  id v111;
  id v112;
  id v113;
  void *v114;
  const __CFAllocator *allocator;
  id v116;
  id v117;
  uint64_t v118;
  void *v119;
  AMSPaymentSheetRequest *v120;
  void *v121;
  int v122;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v116 = a4;
  v117 = a5;
  v120 = self;
  -[AMSPaymentSheetRequest inlineImages](self, "inlineImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v118 = v10;
  if (v10 >= 1)
  {
    v11 = 0;
    v12 = &off_1E2519000;
    v114 = (void *)*MEMORY[0x1E0CEC580];
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[AMSPaymentSheetRequest inlineImages](v120, "inlineImages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v122 = 0;
      v121 = v17;
      if (objc_msgSend(v17, "isServerSupplied"))
      {
        v119 = v15;
        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v17, "URLString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLWithString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12[274], "sharedPurchaseConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(v12[274], "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = (void *)objc_opt_class();
          v25 = v24;
          -[AMSPaymentSheetRequest logKey](v120, "logKey");
          v26 = v18;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableURL(v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v124 = v24;
          v125 = 2114;
          v126 = v27;
          v127 = 2114;
          v128 = v28;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching server-supplied inline image at URL: %{public}@", buf, 0x20u);

          v18 = v26;
          v12 = &off_1E2519000;
        }

        v29 = -[AMSPaymentSheetRequest _createImageRefWithURL:designVersion:adornmentStyle:bag:](v120, "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v21, v116, 0, v117);
      }
      else
      {
        v37 = objc_msgSend(v17, "imageType");
        if (!v37)
        {
          objc_msgSend(v12[274], "sharedPurchaseConfig");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v51)
          {
            objc_msgSend(v12[274], "sharedConfig");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v51, "OSLogObject");
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v53 = (void *)objc_opt_class();
            v54 = v53;
            -[AMSPaymentSheetRequest logKey](v120, "logKey");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v124 = v53;
            v125 = 2114;
            v126 = v55;
            _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch rating image for unknown rating image type", buf, 0x16u);

            v12 = &off_1E2519000;
          }

          goto LABEL_38;
        }
        v38 = v37;
        if (v37 != 2)
        {
          v56 = -[AMSPaymentSheetRequest isDesignVersionEqualOrGreaterThan:](v120, "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0);
          v57 = v38 == 11 && v56;
          if (-[AMSPaymentSheetRequest isDesignVersionEqualOrGreaterThan:](v120, "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0))
          {
            if (v57)
              goto LABEL_58;
            if (v38 <= 7 && ((1 << v38) & 0xB0) != 0)
            {
              objc_msgSend(v17, "value");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12[274], "sharedPurchaseConfig");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v58)
              {
                objc_msgSend(v12[274], "sharedConfig");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v58, "OSLogObject");
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                v111 = v18;
                v60 = (void *)objc_opt_class();
                v61 = v60;
                -[AMSPaymentSheetRequest logKey](v120, "logKey");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v124 = v60;
                v125 = 2114;
                v126 = v62;
                v127 = 2114;
                v128 = v51;
                _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Will render inline image remotely with rating value: %{public}@", buf, 0x20u);

                v18 = v111;
                v12 = &off_1E2519000;
              }

              v63 = CFSTR("AMSPaymentSheetContentItemMPAARating");
              switch(v38)
              {
                case 4uLL:
                  v63 = CFSTR("AMSPaymentSheetContentItemRatingAU");
                  goto LABEL_90;
                case 5uLL:
                  v63 = CFSTR("AMSPaymentSheetContentItemRatingKR");
                  goto LABEL_90;
                case 6uLL:
                  v63 = CFSTR("AMSPaymentSheetContentItemRatingFR");
                  goto LABEL_90;
                case 7uLL:
LABEL_90:
                  objc_msgSend(v18, "setObject:forKeyedSubscript:", v51, v63);
                  break;
                default:
                  break;
              }
LABEL_38:

              v46 = 0;
              goto LABEL_63;
            }
          }
          else if (v57)
          {
LABEL_58:
            objc_msgSend(v17, "value");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSPaymentSheetInlineImage textEncapsulationForServerValue:](AMSPaymentSheetInlineImage, "textEncapsulationForServerValue:", v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12[274], "sharedPurchaseConfig");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v70)
            {
              objc_msgSend(v12[274], "sharedConfig");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v70, "OSLogObject");
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              v72 = (void *)objc_opt_class();
              v73 = v72;
              -[AMSPaymentSheetRequest logKey](v120, "logKey");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v124 = v72;
              v125 = 2114;
              v126 = v74;
              v127 = 2114;
              v128 = v69;
              _os_log_impl(&dword_18C849000, v71, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating text encapsulation inline image with rating value: %{public}@", buf, 0x20u);

              v12 = &off_1E2519000;
            }

            objc_msgSend(v18, "setObject:forKeyedSubscript:", v69, CFSTR("AMSPaymentSheetContentItemTextEncapsulation"));
            v46 = 1;
            goto LABEL_63;
          }
          v119 = v15;
          objc_msgSend(v17, "localAssetConfiguration");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38 == 12)
          {
            objc_msgSend(v17, "value");
            v77 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v77, CFSTR("AMSPaymentSheetContentItemInlineImage"));
            goto LABEL_69;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v77 = v21;
            objc_msgSend(v12[274], "sharedPurchaseConfig");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v78)
            {
              objc_msgSend(v12[274], "sharedConfig");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v78, "OSLogObject");
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              loga = v79;
              v80 = (void *)objc_opt_class();
              v106 = v80;
              -[AMSPaymentSheetRequest logKey](v120, "logKey");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "filename");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = v8;
              v84 = v18;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v77, "type"));
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v124 = v80;
              v79 = loga;
              v125 = 2114;
              v126 = v81;
              v127 = 2114;
              v128 = v82;
              v129 = 2114;
              v130 = v83;
              v131 = 2114;
              v132 = v85;
              _os_log_impl(&dword_18C849000, loga, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching client-supplied inline image with image type: %{public}@, name: %{public}@, asset type: %{public}@", buf, 0x34u);

              v18 = v84;
              v8 = v112;

              v12 = &off_1E2519000;
            }

            v30 = -[AMSPaymentSheetRequest _createImageForAssetConfiguration:outAssetScale:](v120, "_createImageForAssetConfiguration:outAssetScale:", v77, &v122);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v77 = v21;
              objc_msgSend(v12[274], "sharedPurchaseConfig");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v86)
              {
                objc_msgSend(v12[274], "sharedConfig");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v86, "OSLogObject");
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                v107 = (void *)objc_opt_class();
                logb = v107;
                -[AMSPaymentSheetRequest logKey](v120, "logKey");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "name");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "accessibilityText");
                v113 = v8;
                v89 = v18;
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v77, "scale"));
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v124 = v107;
                v125 = 2114;
                v126 = v105;
                v127 = 2114;
                v128 = v88;
                v129 = 2114;
                v130 = v90;
                v131 = 2114;
                v132 = v91;
                _os_log_impl(&dword_18C849000, v87, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Using client-supplied inline symbol image with name: %{public}@, accessibility text: %{public}@, scale: %{public}@", buf, 0x34u);

                v18 = v89;
                v8 = v113;

                v12 = &off_1E2519000;
              }

              objc_msgSend(v77, "name");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v92, CFSTR("AMSPaymentSheetContentItemSymbolImageName"));

              objc_msgSend(v77, "accessibilityText");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v93, CFSTR("AMSPaymentSheetContentItemSymbolImageAccessibilityText"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v77, "scale"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v94, CFSTR("AMSPaymentSheetContentItemSymbolImageScale"));

            }
            else
            {
              objc_msgSend(v12[274], "sharedPurchaseConfig");
              v77 = (id)objc_claimAutoreleasedReturnValue();
              if (!v77)
              {
                objc_msgSend(v12[274], "sharedConfig");
                v77 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v77, "OSLogObject");
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                v96 = (void *)objc_opt_class();
                v97 = v96;
                -[AMSPaymentSheetRequest logKey](v120, "logKey");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = (objc_class *)objc_opt_class();
                NSStringFromClass(v99);
                v100 = v21;
                v101 = v18;
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v124 = v96;
                v125 = 2114;
                v126 = v98;
                v127 = 2114;
                v128 = v102;
                _os_log_impl(&dword_18C849000, v95, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch rating image for unknown local image asset type: %{public}@", buf, 0x20u);

                v12 = &off_1E2519000;
                v18 = v101;
                v21 = v100;

              }
            }
LABEL_69:
            v30 = 0;
          }

          goto LABEL_10;
        }
        v119 = v15;
        v39 = -[AMSPaymentSheetRequest isDesignVersionEqualOrGreaterThan:](v120, "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0);
        objc_msgSend(v121, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12[274], "sharedPurchaseConfig");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v40;
        if (v39)
        {
          if (!v40)
          {
            objc_msgSend(v12[274], "sharedConfig");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v41, "OSLogObject");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = (void *)objc_opt_class();
            v44 = v43;
            -[AMSPaymentSheetRequest logKey](v120, "logKey");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v124 = v43;
            v125 = 2114;
            v126 = v45;
            v127 = 2114;
            v128 = v21;
            _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating text encapsulation inline image with rating value: %{public}@", buf, 0x20u);

            v12 = &off_1E2519000;
          }

          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("AMSPaymentSheetContentItemTextEncapsulation"));
          v46 = 2;
          goto LABEL_32;
        }
        if (!v40)
        {
          objc_msgSend(v12[274], "sharedConfig");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v41, "OSLogObject");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = (void *)objc_opt_class();
          v66 = v65;
          -[AMSPaymentSheetRequest logKey](v120, "logKey");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v124 = v65;
          v125 = 2114;
          v126 = v67;
          v127 = 2114;
          v128 = v21;
          _os_log_impl(&dword_18C849000, v64, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating client-supplied inline image with rating value: %{public}@", buf, 0x20u);

          v12 = &off_1E2519000;
        }

        v29 = -[AMSPaymentSheetRequest _createRatingImageWithStringValue:assetScale:](v120, "_createRatingImageWithStringValue:assetScale:", v21, &v122);
      }
      v30 = (CGImage *)v29;
LABEL_10:

      if (v30)
      {
        Mutable = CFDataCreateMutable(allocator, 0);
        v32 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)objc_msgSend(v114, "identifier"), 1uLL, 0);
        CGImageDestinationAddImage(v32, v30, 0);
        if (CGImageDestinationFinalize(v32))
        {
          v33 = v122;
          v34 = objc_msgSend(v121, "tint");
          LODWORD(v35) = v33;
          -[AMSPaymentSheetRequest _replaceImagePlaceholderTag:withImageData:scale:tint:forAttributedString:](v120, "_replaceImagePlaceholderTag:withImageData:scale:tint:forAttributedString:", v119, Mutable, v34, v8, v35);
          v36 = v8;
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12[274], "sharedPurchaseConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            objc_msgSend(v12[274], "sharedConfig");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v36, "OSLogObject");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = (void *)objc_opt_class();
            log = v48;
            -[AMSPaymentSheetRequest logKey](v120, "logKey");
            v49 = v8;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v124 = v48;
            v125 = 2114;
            v126 = v50;
            _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to finalized inline rating image", buf, 0x16u);

            v8 = v49;
          }

          v12 = &off_1E2519000;
        }

        if (Mutable)
          CFRelease(Mutable);
        if (v32)
          CFRelease(v32);
        CGImageRelease(v30);
      }
      v46 = 0;
LABEL_32:
      v15 = v119;
LABEL_63:
      if (objc_msgSend(v18, "count"))
      {
        v75 = (void *)objc_msgSend(v18, "copy");
        -[AMSPaymentSheetRequest _replaceImagePlaceholderTag:withAttributes:foregroundColor:forAttributedString:](v120, "_replaceImagePlaceholderTag:withAttributes:foregroundColor:forAttributedString:", v15, v75, v46, v8);
        v76 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v76;
      }

      ++v11;
    }
    while (v118 != v11);
  }
  v103 = v8;

  return v103;
}

- (id)_attachLeadingItem:(id)a3 attributedString:(id)a4 designVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (-[AMSPaymentSheetRequest isDesignVersionEqualOrGreaterThan:](self, "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("​"), 0x1E2566F00);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

    objc_msgSend(v11, "addAttributes:range:", v7, 0, 1);
    objc_msgSend(v11, "appendAttributedString:", v8);
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_amsContentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  AMSPaymentSheetRequest *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__55;
  v28 = __Block_byref_object_dispose__55;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __96__AMSPaymentSheetRequest_PassKit___amsContentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke;
    v19 = &unk_1E2544568;
    v20 = self;
    v21 = v12;
    v22 = v13;
    v23 = &v24;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v16);

  }
  if (objc_msgSend((id)v25[5], "count", v16, v17, v18, v19, v20))
    v14 = (void *)objc_msgSend((id)v25[5], "copy");
  else
    v14 = 0;
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __96__AMSPaymentSheetRequest_PassKit___amsContentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *log;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v4)
  {
    if ((isKindOfClass & 1) != 0)
      v14 = v5;
    else
      v14 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("header"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("headerIcon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v16 && v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:", v16, v14, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v19);
    }
    else
    {
      if (!v18 || !v14)
        goto LABEL_30;
      v20 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v18, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLWithString:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(*(id *)(a1 + 32), "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v19, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      if (!v22)
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          log = v24;
          v25 = (void *)objc_opt_class();
          v37 = *(void **)(a1 + 32);
          v40 = v25;
          objc_msgSend(v37, "logKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v25;
          v24 = log;
          v43 = 2114;
          v44 = v38;
          _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load flexList icon image", buf, 0x16u);

        }
      }
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
      objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:", v26, v14, v22, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v27);

    }
LABEL_30:

    goto LABEL_44;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v5;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "_attachInlineImagesToAttributedString:designVersion:bag:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:](AMSPaymentSheetRequest, "attributedStringByRemovingPlaceholderTagsFromAttributedString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leadingItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "_attachLeadingItem:attributedString:designVersion:", v10, v9, *(_QWORD *)(a1 + 40));
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AMSPaymentSheetContentItemLeadingItemAttribute"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AMSPaymentSheetContentItemLeadingItemValueAttribute"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;

        v28 = 0;
        if (objc_msgSend(v13, "integerValue") == 2 && v30)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(*(id *)(a1 + 32), "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v31, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

        }
        v9 = (void *)v11;
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("axID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v9);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
      objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:", v35, v34, v28, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v36);

    }
  }
  else
  {

  }
LABEL_44:

}

- (id)ams_createAMSContentItem:(id)a3 label:(id)a4 image:(CGImage *)a5 accessibilityIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  AMSPaymentContentItem *v12;
  AMSPaymentContentItem *v13;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(AMSPaymentContentItem);
  v13 = v12;
  if (a5)
  {
    -[AMSPaymentContentItem setImage:](v12, "setImage:", a5);
    CGImageRelease(a5);
  }
  if (v9)
    -[AMSPaymentContentItem setTitle:](v13, "setTitle:", v9);
  if (v10)
    -[AMSPaymentContentItem setLabel:](v13, "setLabel:", v10);
  if (v11)
    -[AMSPaymentContentItem setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", v11);

  return v13;
}

- (id)_contentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  AMSPaymentSheetRequest *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__55;
  v28 = __Block_byref_object_dispose__55;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __93__AMSPaymentSheetRequest_PassKit___contentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke;
    v19 = &unk_1E2544568;
    v20 = self;
    v21 = v12;
    v22 = v13;
    v23 = &v24;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v16);

  }
  if (objc_msgSend((id)v25[5], "count", v16, v17, v18, v19, v20))
    v14 = (void *)objc_msgSend((id)v25[5], "copy");
  else
    v14 = 0;
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __93__AMSPaymentSheetRequest_PassKit___contentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  char isKindOfClass;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CGImage *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  CGImage *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *log;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v4)
  {
    if ((isKindOfClass & 1) != 0)
      v15 = v5;
    else
      v15 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("header"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("headerIcon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    if (v17 && v15)
    {
      v20 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      objc_msgSend(v20, "setTitle:", v17);
      objc_msgSend(v20, "setLabel:", v15);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v20);
    }
    else
    {
      if (!v19 || !v15)
        goto LABEL_42;
      v20 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      v21 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v19, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLWithString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(*(id *)(a1 + 32), "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v23, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      if (v24)
      {
        v25 = (CGImage *)v24;
        objc_msgSend(v20, "setImage:", v24);
        CGImageRelease(v25);
      }
      else
      {
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v33, "OSLogObject");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          log = v34;
          v35 = (void *)objc_opt_class();
          v37 = *(void **)(a1 + 32);
          v40 = v35;
          objc_msgSend(v37, "logKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v35;
          v34 = log;
          v43 = 2114;
          v44 = v38;
          _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load flexList icon image", buf, 0x16u);

        }
      }
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
      objc_msgSend(v20, "setTitle:", v36);

      objc_msgSend(v20, "setLabel:", v15);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v20);

    }
LABEL_42:

    goto LABEL_43;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v5;

    if (v7)
    {
      v8 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      objc_msgSend(*(id *)(a1 + 32), "_attachInlineImagesToAttributedString:designVersion:bag:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:](AMSPaymentSheetRequest, "attributedStringByRemovingPlaceholderTagsFromAttributedString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leadingItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "_attachLeadingItem:attributedString:designVersion:", v11, v10, *(_QWORD *)(a1 + 40));
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSPaymentSheetContentItemLeadingItemAttribute"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSPaymentSheetContentItemLeadingItemValueAttribute"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = v26;
        else
          v27 = 0;

        if (objc_msgSend(v14, "integerValue") == 2 && v27)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(*(id *)(a1 + 32), "_createImageRefWithURL:designVersion:adornmentStyle:bag:", v28, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
          if (v29)
          {
            v30 = (CGImage *)v29;
            objc_msgSend(v8, "setImage:", v29);
            CGImageRelease(v30);
          }

        }
        v10 = (void *)v12;
      }
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v10);
      objc_msgSend(v8, "setLabel:", v31);

      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E2548760);
      objc_msgSend(v8, "setTitle:", v32);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);
    }
  }
  else
  {

  }
LABEL_43:

}

- (int64_t)_imageTypeForURL:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("jpg")) & 1) != 0)
    v5 = 2;
  else
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("png"));

  return v5;
}

- (CGRect)_rectWithAspectRatio:(CGSize)a3 insideRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double MidX;
  CGFloat MidY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  v18 = a4.size.width / a3.width;
  v10 = a4.size.height / a3.height;
  MidX = CGRectGetMidX(a4);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  v13 = fmin(v18, v10);
  v14 = v9 * v13;
  v15 = v8 * v13;
  v16 = MidY + v8 * v13 * -0.5;
  v17 = MidX + v14 * -0.5;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (id)_replaceImagePlaceholderTag:(id)a3 withAttributes:(id)a4 foregroundColor:(int64_t)a5 forAttributedString:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, const __CFString *);
  void *v18;
  _QWORD aBlock[4];
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  int64_t v25;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(a6, "mutableCopy");
  v12 = (void *)objc_msgSend(v10, "mutableCopy");

  v13 = CFSTR("AMSPaymentContentItemLightColorAttribute");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke;
  aBlock[3] = &unk_1E25445E0;
  v21 = v9;
  v22 = v11;
  v24 = v12;
  v25 = a5;
  v23 = v13;
  v14 = v12;
  v15 = v11;
  v16 = v9;
  v17 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v17[2](v17, CFSTR("%%image_"));
  v17[2](v17, CFSTR("%%IMAGE_"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v15);

  return v18;
}

void __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v16 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v16, *(_QWORD *)(a1 + 32), CFSTR("%%"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mutableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
  }
  else
  {
    v8 = v5;
    v9 = v6;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 == 2)
      {
        v27 = 1;
        v13 = MEMORY[0x1E0C9AAB0];
      }
      else
      {
        if (v11)
          goto LABEL_7;
        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_2;
        v21[3] = &unk_1E2544590;
        v12 = *(void **)(a1 + 40);
        v22 = *(id *)(a1 + 48);
        v23 = &v24;
        objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", v8, v9, 0, v21);

        v13 = MEMORY[0x1E0C9AAB0];
        if (!*((_BYTE *)v25 + 24))
LABEL_7:
          v13 = MEMORY[0x1E0C9AAA0];
      }
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v8, v9, CFSTR(" "));
      v14 = *(void **)(a1 + 56);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_3;
      v17[3] = &unk_1E25445B8;
      v18 = *(id *)(a1 + 40);
      v19 = v8;
      v20 = v9;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
      objc_msgSend(*(id *)(a1 + 40), "mutableString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "rangeOfString:", v3);
      v9 = v15;

      _Block_object_dispose(&v24, 8);
      v4 = v7;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

void __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

uint64_t __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a2, a3, *(_QWORD *)(a1 + 40), 1);
}

- (id)_replaceImagePlaceholderTag:(id)a3 withImageData:(id)a4 scale:(float)a5 tint:(BOOL)a6 forAttributedString:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(void *, const __CFString *);
  void *v19;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  AMSPaymentSheetRequest *v25;
  float v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_msgSend(a7, "mutableCopy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withImageData_scale_tint_forAttributedString___block_invoke;
  aBlock[3] = &unk_1E2544608;
  v22 = v12;
  v23 = v14;
  v26 = a5;
  v24 = v13;
  v25 = self;
  v27 = a6;
  v15 = v13;
  v16 = v14;
  v17 = v12;
  v18 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v18[2](v18, CFSTR("%%image_"));
  v18[2](v18, CFSTR("%%IMAGE_"));
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v16);

  return v19;
}

void __108__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withImageData_scale_tint_forAttributedString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  id v33;
  id v34;
  int v35;
  void *v36;
  _BYTE buf[24];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v33, *(_QWORD *)(a1 + 32), CFSTR("%%"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", v36);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
  }
  else
  {
    v7 = v4;
    if (CFSTR("AMSPaymentContentItemImageAndScaleAttachment"))
      v8 = CFSTR("AMSPaymentContentItemImageKey") == 0;
    else
      v8 = 1;
    v10 = !v8 && CFSTR("AMSPaymentContentItemScaleKey") != 0;
    v35 = v10;
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v7, v5, CFSTR(" "));
      if (*(_QWORD *)(a1 + 48))
      {
        if (v35 && *(float *)(a1 + 64) > 0.0)
        {
          +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v11, "OSLogObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = (void *)objc_opt_class();
            v14 = *(void **)(a1 + 56);
            v34 = v13;
            objc_msgSend(v14, "logKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(a1 + 32);
            LODWORD(v17) = *(_DWORD *)(a1 + 64);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            *(_QWORD *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2114;
            v38 = v16;
            v39 = 2114;
            v40 = v18;
            v41 = 2114;
            v42 = v19;
            _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Rendering Retina image for tag: %{public}@, scale:%{public}@ tint:%{public}@", buf, 0x34u);

          }
          v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v20, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("AMSPaymentContentItemImageKey"));
          LODWORD(v21) = *(_DWORD *)(a1 + 64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("AMSPaymentContentItemScaleKey"));

          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("AMSPaymentContentItemImageAndScaleAttachment"), v20, v7, 1);
        }
        else
        {
          +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v23, "OSLogObject");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (void *)objc_opt_class();
            v26 = *(void **)(a1 + 56);
            v27 = v25;
            objc_msgSend(v26, "logKey");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2114;
            v38 = v29;
            _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Rendering non-Retina image for tag: %{public}@", buf, 0x20u);

          }
          v30 = *(void **)(a1 + 40);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v31 = (_QWORD *)getPKPaymentContentItemImageAttachmentSymbolLoc_ptr;
          v38 = getPKPaymentContentItemImageAttachmentSymbolLoc_ptr;
          if (!getPKPaymentContentItemImageAttachmentSymbolLoc_ptr)
          {
            v32 = (void *)PassKitCoreLibrary_1();
            v31 = dlsym(v32, "PKPaymentContentItemImageAttachment");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v31;
            getPKPaymentContentItemImageAttachmentSymbolLoc_ptr = (uint64_t)v31;
          }
          _Block_object_dispose(buf, 8);
          if (!v31)
          {
            dlerror();
            abort_report_np();
            __break(1u);
          }
          objc_msgSend(v30, "addAttribute:value:range:", *v31, *(_QWORD *)(a1 + 48), v7, 1);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "mutableString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "rangeOfString:", v36);
      v3 = v6;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (id)_summaryItemsForAttributedList:(id)a3 assetCache:(id)a4 bag:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id PKPaymentSummaryItemClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BYTE v31[20];
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  AMSSetLogKeyIfNeeded();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke;
    v32[3] = &unk_1E2542030;
    v9 = v7;
    v33 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v32);
    -[AMSPaymentSheetRequest paymentSummary](self, "paymentSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AMSPaymentSheetRequest paymentSummary](self, "paymentSummary");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AMSPaymentSheetRequest storeName](self, "storeName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        AMSLocalizedString(CFSTR("CONFIRMATION_TITLE_PAY"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSPaymentSheetRequest storeName](self, "storeName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@"), v18, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      AMSLocalizedString(CFSTR("CONFIRMATION_TITLE_PAY"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
LABEL_12:
    if (-[AMSPaymentSheetRequest shouldUppercaseText](self, "shouldUppercaseText"))
    {
      objc_msgSend(v12, "localizedUppercaseString");
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v20;
    }
    -[AMSPaymentSheetRequest price](self, "price");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = &unk_1E25AF8A8;
    if (v21)
      v23 = (void *)v21;
    v24 = v23;

    PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
    v26 = (void *)MEMORY[0x1E0CB3598];
    objc_msgSend(v24, "decimalValue");

    objc_msgSend(v26, "decimalNumberWithDecimal:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PKPaymentSummaryItemClass, "summaryItemWithLabel:amount:", v12, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v28);
    v13 = v33;
    goto LABEL_17;
  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v35 = (id)objc_opt_class();
    v36 = 2114;
    v37 = v8;
    v15 = v35;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping attributed list", buf, 0x16u);

  }
LABEL_17:

  if (objc_msgSend(v7, "count"))
    v29 = (void *)objc_msgSend(v7, "copy");
  else
    v29 = 0;

  return v29;
}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_2;
  v5[3] = &unk_1E2542030;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("header"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (v7 && v5)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      v8 = objc_msgSend(v5, "length");
      objc_msgSend(v5, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_3;
      v11[3] = &unk_1E2544658;
      v7 = v7;
      v12 = v7;
      v15 = v18;
      v13 = v5;
      v16 = 0;
      v17 = v8;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

      _Block_object_dispose(v18, 8);
    }
  }
  else
  {

    v7 = 0;
  }

}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id PKPaymentSummaryItemClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a2;
  PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PKPaymentSummaryItemClass, "summaryItemWithLabel:amount:type:", v15, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setLocalizedAmount:", &stru_1E2548760);
  if (a3)
  {
    objc_msgSend(v7, "setLocalizedTitle:", &stru_1E2548760);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalizedTitle:", v8);

  }
  objc_msgSend(v7, "setUseDarkColor:", 1, v15);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v10 = objc_msgSend(v16, "length");
  objc_msgSend(v7, "setUseLargeFont:", 0);
  v11 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_4;
  v17[3] = &unk_1E2544630;
  v19 = v9;
  v20 = v10;
  v18 = v7;
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = v7;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("useLargeSize"), v12, v13, 0, v17);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v16, "length") + 1;

}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  id v10;

  v9 = a2;
  if (a3 == *(_QWORD *)(a1 + 40) && a4 == *(_QWORD *)(a1 + 48))
  {
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "setUseLargeFont:", 1);
    v9 = v10;
    *a5 = 1;
  }

}

- (CGPath)_createBorderPathForAdornmentStyle:(int64_t)a3 iconWidth:(double)a4 iconHeight:(double)a5
{
  CGPath *Mutable;
  CGFloat v8;
  const CGPath *v9;
  CGPath *MutableCopy;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;

  Mutable = 0;
  switch(a3)
  {
    case 0:
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, 0.5, 0.5);
      CGPathAddLineToPoint(Mutable, 0, 0.5, a5 + -0.5);
      v12 = a4 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, v12, a5 + -0.5);
      CGPathAddLineToPoint(Mutable, 0, v12, 0.5);
      CGPathAddLineToPoint(Mutable, 0, 0.5, 0.5);
      return Mutable;
    case 3:
    case 6:
      v18.size.width = a4 + -1.0;
      v18.size.height = a5 + -1.0;
      v18.origin.x = 0.5;
      v8 = (a5 + -1.0) * 0.5;
      v18.origin.y = 0.5;
      v9 = CGPathCreateWithRoundedRect(v18, (a4 + -1.0) * 0.5, v8, 0);
      MutableCopy = CGPathCreateMutableCopy(v9);
      CGPathRelease(v9);
      return MutableCopy;
    case 4:
      Mutable = CGPathCreateMutable();
      v13 = a4 * 0.236842105 + 0.0 + 0.5;
      CGPathMoveToPoint(Mutable, 0, 0.5, v13);
      v14 = a5 - a4 * 0.236842105 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, 0.5, v14);
      v15 = a5 + -0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, 0.5, v15, v13, v15);
      v16 = a4 - a4 * 0.236842105 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, v16, v15);
      v17 = a4 + -0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, v17, v15, v17, v14);
      CGPathAddLineToPoint(Mutable, 0, v17, v13);
      CGPathAddQuadCurveToPoint(Mutable, 0, v17, 0.5, v16, 0.5);
      CGPathAddLineToPoint(Mutable, 0, v13, 0.5);
      CGPathAddQuadCurveToPoint(Mutable, 0, 0.5, 0.5, 0.5, v13);
      return Mutable;
    default:
      return Mutable;
  }
}

- (CGImage)_createDefaultImageWithImageRef:(CGImage *)a3 size:(CGSize)a4 borderPath:(CGPath *)a5
{
  double height;
  double width;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  CGColor *v11;
  CGImage *Image;
  _OWORD v14[2];
  uint64_t v15;
  CGRect v16;

  height = a4.height;
  width = a4.width;
  v15 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, vcvtd_n_u64_f64(width, 2uLL), DeviceRGB, 2u);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = width;
  v16.size.height = height;
  CGContextDrawImage(v10, v16, a3);
  v14[0] = xmmword_18CF5CC08;
  v14[1] = unk_18CF5CC18;
  v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v14);
  CGContextSetStrokeColorWithColor(v10, v11);
  CGContextSetLineWidth(v10, 1.0);
  CGContextAddPath(v10, a5);
  CGContextDrawPath(v10, kCGPathStroke);
  Image = CGBitmapContextCreateImage(v10);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v11);
  CGContextRelease(v10);
  return Image;
}

- (CGImage)_createImageForAssetConfiguration:(id)a3 outAssetScale:(float *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  CGImage *v18;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[AMSPaymentSheetRequest logKey](self, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v10;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to bundle", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "size");
    v18 = -[AMSPaymentSheetRequest _createImageRefForAssetURL:size:assetType:outAssetScale:](self, "_createImageRefForAssetURL:size:assetType:outAssetScale:", v15, objc_msgSend(v6, "type"), &v27, v16, v17);
    if (a4)
LABEL_9:
      *(_DWORD *)a4 = v27;
  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      v26 = v22;
      -[AMSPaymentSheetRequest logKey](self, "logKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filename");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v24;
      v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to find path for resource: %{public}@.%{public}@", buf, 0x2Au);

    }
    v18 = 0;
    if (a4)
      goto LABEL_9;
  }

  return v18;
}

- (CGImage)_createImageRefForAssetURL:(id)a3 size:(CGSize)a4 assetType:(int64_t)a5 outAssetScale:(float *)a6
{
  CGImage *v6;
  double height;
  double width;
  id v12;
  CGImage *v13;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  if (!a5)
  {
    v13 = -[AMSPaymentSheetRequest _createImageRefForImageURL:outAssetScale:](self, "_createImageRefForImageURL:outAssetScale:", v12, a6);
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v13 = -[AMSPaymentSheetRequest _createImageRefForPDFURL:size:outAssetScale:](self, "_createImageRefForPDFURL:size:outAssetScale:", v12, a6, width, height);
LABEL_5:
    v6 = v13;
  }

  return v6;
}

- (CGImage)_createImageRefForPDFURL:(id)a3 size:(CGSize)a4 outAssetScale:(float *)a5
{
  double height;
  double width;
  const __CFURL *v9;
  CGPDFDocument *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  CGPDFPage *Page;
  CGPDFPage *v14;
  CGFloat v15;
  CGFloat v16;
  int RotationAngle;
  double v18;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGColorSpace *DeviceRGB;
  void (**v38)(_QWORD);
  CGContext *v39;
  void (**v40)(_QWORD);
  CGFloat MidX;
  CGFloat MidY;
  double v43;
  CGFloat v44;
  CGImage *Image;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  double rect;
  double recta;
  CGFloat y;
  CGFloat x;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  CGAffineTransform v131;
  _QWORD v132[5];
  _QWORD v133[5];
  CGAffineTransform v134;
  _QWORD aBlock[5];
  CGAffineTransform transform;
  CGAffineTransform v137;
  uint64_t v138;
  CGRect BoxRect;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  height = a4.height;
  width = a4.width;
  v138 = *MEMORY[0x1E0C80C00];
  v9 = (const __CFURL *)a3;
  v10 = CGPDFDocumentCreateWithURL(v9);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v10;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v10)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v52, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x1E0CB3940];
        if (v54)
        {
          v56 = objc_opt_class();
          AMSLogKey();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("%@: [%@] "), v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v58;
        }
        AMSLogableURL(v9);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v137.a) = 138543618;
        *(_QWORD *)((char *)&v137.a + 4) = v58;
        WORD2(v137.b) = 2114;
        *(_QWORD *)((char *)&v137.b + 6) = v101;
        _os_log_impl(&dword_18C849000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to create PDF document for resource at URL: %{public}@", (uint8_t *)&v137, 0x16u);
        if (v54)

      }
      goto LABEL_70;
    }
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v64)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v64, "OSLogObject");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x1E0CB3940];
      if (v66)
      {
        v68 = objc_opt_class();
        AMSLogKey();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringWithFormat:", CFSTR("%@: [%@] "), v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v70;
      }
      AMSLogableURL(v9);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v137.a) = 138543618;
      *(_QWORD *)((char *)&v137.a + 4) = v70;
      WORD2(v137.b) = 2114;
      *(_QWORD *)((char *)&v137.b + 6) = v104;
      _os_log_impl(&dword_18C849000, v65, OS_LOG_TYPE_FAULT, "%{public}@Failed to create PDF document for resource at URL: %{public}@", (uint8_t *)&v137, 0x16u);
      if (v66)

    }
LABEL_90:

    goto LABEL_91;
  }
  Page = CGPDFDocumentGetPage(v10, 1uLL);
  v14 = Page;
  if (!Page)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v52, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x1E0CB3940];
        if (v59)
        {
          v61 = objc_opt_class();
          AMSLogKey();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringWithFormat:", CFSTR("%@: [%@] "), v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v63;
        }
        AMSLogableURL(v9);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v137.a) = 138543618;
        *(_QWORD *)((char *)&v137.a + 4) = v63;
        WORD2(v137.b) = 2114;
        *(_QWORD *)((char *)&v137.b + 6) = v109;
        _os_log_impl(&dword_18C849000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to create PDF page for page 1 of PDF at URL: %{public}@", (uint8_t *)&v137, 0x16u);
        if (v59)

      }
LABEL_70:

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v103, 0);

LABEL_91:
      Image = 0;
      v28 = 0.0;
      goto LABEL_123;
    }
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v64)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v64, "OSLogObject");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)MEMORY[0x1E0CB3940];
      if (v78)
      {
        v80 = objc_opt_class();
        AMSLogKey();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "stringWithFormat:", CFSTR("%@: [%@] "), v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v82;
      }
      AMSLogableURL(v9);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v137.a) = 138543618;
      *(_QWORD *)((char *)&v137.a + 4) = v82;
      WORD2(v137.b) = 2114;
      *(_QWORD *)((char *)&v137.b + 6) = v110;
      _os_log_impl(&dword_18C849000, v65, OS_LOG_TYPE_FAULT, "%{public}@Failed to create PDF page for page 1 of PDF at URL: %{public}@", (uint8_t *)&v137, 0x16u);
      if (v78)

    }
    goto LABEL_90;
  }
  BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  y = BoxRect.origin.y;
  x = BoxRect.origin.x;
  v15 = BoxRect.size.width;
  v16 = BoxRect.size.height;
  RotationAngle = CGPDFPageGetRotationAngle(v14);
  memset(&v137, 0, sizeof(v137));
  CGAffineTransformMakeRotation(&v137, (double)-RotationAngle * 0.0174532925);
  transform = v137;
  v140.origin.y = y;
  v140.origin.x = x;
  v140.size.width = v15;
  v140.size.height = v16;
  v141 = CGRectApplyAffineTransform(v140, &transform);
  v121 = v141.origin.y;
  v122 = v141.origin.x;
  v18 = v141.size.width;
  rect = v141.size.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v142.origin.x = x;
    v142.origin.y = y;
    v142.size.width = v15;
    v142.size.height = v16;
    v20 = CGRectGetWidth(v142);
    v143.origin.x = x;
    v143.origin.y = y;
    v143.size.width = v15;
    v143.size.height = v16;
    width = v20 * 0.5;
    height = CGRectGetHeight(v143) * 0.5;
  }
  -[AMSPaymentSheetRequest _rectWithAspectRatio:insideRect:](self, "_rectWithAspectRatio:insideRect:", v18, rect, 0.0, 0.0, width, height);
  v22 = v21;
  v24 = v23;
  v119 = v16;
  v120 = v15;
  +[AMSDevice screenScale](AMSDevice, "screenScale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &unk_1E25AF8C0;
  objc_msgSend(v25, "floatValue");
  v28 = v27;

  v29 = *MEMORY[0x1E0C9D538];
  v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  CGAffineTransformMakeScale(&v134, v28, v28);
  v144.origin.x = v29;
  v144.origin.y = v30;
  v144.size.width = v22;
  v144.size.height = v24;
  v145 = CGRectApplyAffineTransform(v144, &v134);
  v146 = CGRectIntegral(v145);
  v31 = v146.origin.x;
  v32 = v146.origin.y;
  v33 = v146.size.width;
  v34 = v146.size.height;
  v118 = CGRectGetHeight(v146);
  v147.origin.y = v121;
  v147.origin.x = v122;
  v147.size.width = v18;
  v147.size.height = rect;
  recta = CGRectGetHeight(v147);
  v148.origin.x = v31;
  v148.origin.y = v32;
  v148.size.width = v33;
  v148.size.height = v34;
  v35 = CGRectGetWidth(v148);
  v149.origin.x = v31;
  v149.origin.y = v32;
  v149.size.width = v33;
  v149.size.height = v34;
  v36 = CGRectGetHeight(v149);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v133[0] = v11;
  v133[1] = 3221225472;
  v133[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_83;
  v133[3] = &__block_descriptor_40_e5_v8__0l;
  v133[4] = DeviceRGB;
  v38 = (void (**)(_QWORD))_Block_copy(v133);
  if (!DeviceRGB)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v71)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v71, "OSLogObject");
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)MEMORY[0x1E0CB3940];
        if (v73)
        {
          v75 = objc_opt_class();
          AMSLogKey();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "stringWithFormat:", CFSTR("%@: [%@] "), v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v77;
        }
        AMSLogableURL(v9);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(transform.a) = 138543618;
        *(_QWORD *)((char *)&transform.a + 4) = v77;
        WORD2(transform.b) = 2114;
        *(_QWORD *)((char *)&transform.b + 6) = v111;
        _os_log_impl(&dword_18C849000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to create color space for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v73)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v40 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v89 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v89, 0);
    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v40 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v40 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v40, "OSLogObject");
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = (void *)MEMORY[0x1E0CB3940];
        if (v90)
        {
          v92 = objc_opt_class();
          AMSLogKey();
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "stringWithFormat:", CFSTR("%@: [%@] "), v92, v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v94;
        }
        AMSLogableURL(v9);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(transform.a) = 138543618;
        *(_QWORD *)((char *)&transform.a + 4) = v94;
        WORD2(transform.b) = 2114;
        *(_QWORD *)((char *)&transform.b + 6) = v112;
        _os_log_impl(&dword_18C849000, v89, OS_LOG_TYPE_FAULT, "%{public}@Failed to create color space for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v90)

      }
    }

    Image = 0;
    v28 = 0.0;
    goto LABEL_122;
  }
  v39 = CGBitmapContextCreate(0, (unint64_t)v35, (unint64_t)v36, 8uLL, 4 * (unint64_t)v35, DeviceRGB, 2u);
  v132[0] = v11;
  v132[1] = 3221225472;
  v132[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_2;
  v132[3] = &__block_descriptor_40_e5_v8__0l;
  v132[4] = v39;
  v40 = (void (**)(_QWORD))_Block_copy(v132);
  if (v39)
  {
    v150.origin.x = v31;
    v150.origin.y = v32;
    v150.size.width = v33;
    v150.size.height = v34;
    CGPDFPageGetDrawingTransform(&transform, v14, kCGPDFCropBox, v150, 0, 1);
    v137 = transform;
    if (v118 / recta > 1.0)
    {
      v151.origin.x = x;
      v151.origin.y = y;
      v151.size.width = v120;
      v151.size.height = v119;
      MidX = CGRectGetMidX(v151);
      v152.origin.x = x;
      v152.origin.y = y;
      v152.size.width = v120;
      v152.size.height = v119;
      MidY = CGRectGetMidY(v152);
      v131 = v137;
      CGAffineTransformTranslate(&transform, &v131, MidX, MidY);
      v137 = transform;
      v131 = transform;
      CGAffineTransformScale(&transform, &v131, v118 / recta, v118 / recta);
      v137 = transform;
      v153.origin.x = x;
      v153.origin.y = y;
      v153.size.width = v120;
      v153.size.height = v119;
      v43 = CGRectGetMidX(v153);
      v154.origin.x = x;
      v154.origin.y = y;
      v154.size.width = v120;
      v154.size.height = v119;
      v44 = CGRectGetMidY(v154);
      v131 = v137;
      CGAffineTransformTranslate(&transform, &v131, -v43, -v44);
      v137 = transform;
    }
    transform = v137;
    CGContextConcatCTM(v39, &transform);
    v155.origin.y = y;
    v155.origin.x = x;
    v155.size.height = v119;
    v155.size.width = v120;
    CGContextAddRect(v39, v155);
    CGContextClip(v39);
    CGContextDrawPDFPage(v39, v14);
    Image = CGBitmapContextCreateImage(v39);
    if (Image)
      goto LABEL_121;
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v46, "OSLogObject");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0CB3940];
        if (v127)
        {
          v49 = objc_opt_class();
          AMSLogKey();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: [%@] "), v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v51;
        }
        AMSLogableURL(v9);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(transform.a) = 138543618;
        *(_QWORD *)((char *)&transform.a + 4) = v51;
        WORD2(transform.b) = 2114;
        *(_QWORD *)((char *)&transform.b + 6) = v115;
        _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v127)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v96 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v96, 0);
    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v95)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v95, "OSLogObject");
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E0CB3940];
        if (v130)
        {
          v106 = objc_opt_class();
          AMSLogKey();
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "stringWithFormat:", CFSTR("%@: [%@] "), v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v108;
        }
        AMSLogableURL(v9);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(transform.a) = 138543618;
        *(_QWORD *)((char *)&transform.a + 4) = v108;
        WORD2(transform.b) = 2114;
        *(_QWORD *)((char *)&transform.b + 6) = v116;
        _os_log_impl(&dword_18C849000, v96, OS_LOG_TYPE_FAULT, "%{public}@Failed to create image for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v130)

      }
    }
  }
  else if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v83)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v83, "OSLogObject");
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)MEMORY[0x1E0CB3940];
      if (v128)
      {
        v86 = objc_opt_class();
        AMSLogKey();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "stringWithFormat:", CFSTR("%@: [%@] "), v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v88;
      }
      AMSLogableURL(v9);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(transform.a) = 138543618;
      *(_QWORD *)((char *)&transform.a + 4) = v88;
      WORD2(transform.b) = 2114;
      *(_QWORD *)((char *)&transform.b + 6) = v113;
      _os_log_impl(&dword_18C849000, v84, OS_LOG_TYPE_ERROR, "%{public}@Failed to create bitmap image context for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
      if (v128)

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v96 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v96, 0);
  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v95)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v95, "OSLogObject");
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (void *)MEMORY[0x1E0CB3940];
      if (v129)
      {
        v98 = objc_opt_class();
        AMSLogKey();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "stringWithFormat:", CFSTR("%@: [%@] "), v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v100;
      }
      AMSLogableURL(v9);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(transform.a) = 138543618;
      *(_QWORD *)((char *)&transform.a + 4) = v100;
      WORD2(transform.b) = 2114;
      *(_QWORD *)((char *)&transform.b + 6) = v114;
      _os_log_impl(&dword_18C849000, v96, OS_LOG_TYPE_FAULT, "%{public}@Failed to create bitmap image context for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
      if (v129)

    }
  }

  Image = 0;
  v28 = 0.0;
LABEL_121:
  v40[2](v40);
LABEL_122:

  v38[2](v38);
LABEL_123:
  if (a5)
    *a5 = v28;
  v12[2](v12);

  return Image;
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke(uint64_t a1)
{
  CGPDFDocumentRelease(*(CGPDFDocumentRef *)(a1 + 32));
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_83(uint64_t a1)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 32));
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_2(uint64_t a1)
{
  CGContextRelease(*(CGContextRef *)(a1 + 32));
}

- (CGImage)_createImageRefForImageURL:(id)a3 outAssetScale:(float *)a4
{
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  void *v9;
  int v10;
  int v11;
  double v12;
  CGImage *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFURL *)a3;
  v27 = 0;
  v7 = CGImageSourceCreateWithURL(v6, 0);
  if (v7)
  {
    v8 = v7;
    if (CGImageSourceGetCount(v7))
    {
      +[AMSDevice screenScale](AMSDevice, "screenScale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;

      LODWORD(v12) = v11;
      v13 = -[AMSPaymentSheetRequest _createImageRefForImageSource:screenScale:outAssetScale:](self, "_createImageRefForImageSource:screenScale:outAssetScale:", v8, &v27, v12);
    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_opt_class();
        v23 = v22;
        -[AMSPaymentSheetRequest logKey](self, "logKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v22;
        v30 = 2114;
        v31 = v24;
        v32 = 2114;
        v33 = v25;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed image count: %{public}@", buf, 0x20u);

      }
      v13 = 0;
    }
    CFRelease(v8);
    if (a4)
LABEL_16:
      *(_DWORD *)a4 = v27;
  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      -[AMSPaymentSheetRequest logKey](self, "logKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v16;
      v30 = 2114;
      v31 = v18;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to create image source for resource at URL: %{public}@", buf, 0x20u);

    }
    v13 = 0;
    if (a4)
      goto LABEL_16;
  }

  return v13;
}

- (CGImage)_createImageMaskRefWithSize:(CGSize)a3 andPath:(CGPath *)a4
{
  double height;
  double width;
  CGColorSpace *DeviceGray;
  CGContext *v8;
  CGColor *v9;
  CGImage *Image;
  size_t v11;
  size_t v12;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  CGImage *v17;
  __int128 v19;
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v20 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v8 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, DeviceGray, 7u);
  v19 = xmmword_18CF5CCA0;
  v9 = CGColorCreate(DeviceGray, (const CGFloat *)&v19);
  CGContextSetFillColorWithColor(v8, v9);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = width;
  v21.size.height = height;
  CGContextFillRect(v8, v21);
  CGContextBeginPath(v8);
  CGContextAddPath(v8, a4);
  CGContextClip(v8);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = width;
  v22.size.height = height;
  CGContextClearRect(v8, v22);
  Image = CGBitmapContextCreateImage(v8);
  v11 = CGImageGetWidth(Image);
  v12 = CGImageGetHeight(Image);
  BitsPerComponent = CGImageGetBitsPerComponent(Image);
  BitsPerPixel = CGImageGetBitsPerPixel(Image);
  BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  v17 = CGImageMaskCreate(v11, v12, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  CGImageRelease(Image);
  CGColorRelease(v9);
  CGContextRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v17;
}

- (CGImage)_createImageRefForImageSource:(CGImageSource *)a3 screenScale:(float)a4 outAssetScale:(float *)a5
{
  size_t Count;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  float v15;
  CGImage *result;

  Count = CGImageSourceGetCount(a3);
  v9 = 2.0;
  v10 = 1.0;
  if (a4 == 2.0 && (Count & 0xFFFFFFFFFFFFFFFELL) == 2)
    v11 = 2.0;
  else
    v11 = 1.0;
  v12 = 1;
  v13 = 2;
  if (Count == 3)
    v10 = 3.0;
  else
    v13 = 0;
  if (Count != 2)
  {
    v12 = v13;
    v9 = v10;
  }
  if (a4 == 3.0)
    v14 = v12;
  else
    v14 = (a4 == 2.0) & ((Count & 0xFFFFFFFFFFFFFFFELL) == 2);
  if (a4 == 3.0)
    v15 = v9;
  else
    v15 = v11;
  result = CGImageSourceCreateImageAtIndex(a3, v14, 0);
  if (a5)
    *a5 = v15;
  return result;
}

- (CGImage)_createImageRefWithURL:(id)a3 designVersion:(id)a4 adornmentStyle:(int64_t)a5 bag:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  AMSURLRequestEncoder *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  CGImage *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  CGDataProvider *v42;
  unint64_t v43;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v46 = a4;
  v10 = a6;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject", a5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[AMSPaymentSheetRequest logKey](self, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v13;
    v51 = 2114;
    v52 = v15;
    v53 = 2114;
    v54 = v16;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading image resource at: %{public}@", buf, 0x20u);

  }
  v17 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v10);

  -[AMSURLRequestEncoder setDisableResponseDecoding:](v17, "setDisableResponseDecoding:", 1);
  v18 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = v19;

  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v17, "requestWithMethod:URL:parameters:", 2, v9, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v21, "resultWithError:", &v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v48;

  if (v23)
  {
    v24 = 0;
LABEL_8:
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_opt_class();
      v30 = v29;
      -[AMSPaymentSheetRequest logKey](self, "logKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v29;
      v51 = 2114;
      v52 = v31;
      v53 = 2114;
      v54 = v23;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load image resource. Error: %{public}@", buf, 0x20u);

    }
    v32 = 0;
    v33 = v46;
    goto LABEL_13;
  }
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dataTaskPromiseWithRequest:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v26, "resultWithError:", &v47);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v47;

  if (v23)
    goto LABEL_8;
  objc_msgSend(v24, "data");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v35, "length");

  if (!v23)
    goto LABEL_8;
  -[AMSPaymentSheetRequest performanceMetrics](self, "performanceMetrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setResourceRequestStartTime:", v20);

  v37 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(v37, "timeIntervalSince1970");
  v39 = v38;
  -[AMSPaymentSheetRequest performanceMetrics](self, "performanceMetrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setResourceRequestEndTime:", v39);

  objc_msgSend(v24, "data");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = CGDataProviderCreateWithCFData((CFDataRef)v41);
  v43 = -[AMSPaymentSheetRequest _imageTypeForURL:](self, "_imageTypeForURL:", v9);
  if (v43 >= 2)
  {
    v33 = v46;
    if (v43 == 2)
      v32 = CGImageCreateWithJPEGDataProvider(v42, 0, 1, kCGRenderingIntentDefault);
    else
      v32 = 0;
  }
  else
  {
    v32 = CGImageCreateWithPNGDataProvider(v42, 0, 1, kCGRenderingIntentDefault);
    v33 = v46;
  }
  if (v42)
    CFRelease(v42);
  if (-[AMSPaymentSheetRequest isDesignVersionLessThan:](self, "isDesignVersionLessThan:", 0x1E25AF8F0))
    v32 = -[AMSPaymentSheetRequest _createImageRefForImageRef:withAdornmentStyle:andDesignVersion:](self, "_createImageRefForImageRef:withAdornmentStyle:andDesignVersion:", v32, v45, v33);
LABEL_13:

  return v32;
}

- (CGImage)_createImageRefForImageRef:(CGImage *)a3 withAdornmentStyle:(int64_t)a4 andDesignVersion:(id)a5
{
  id v8;
  unint64_t Width;
  size_t Height;
  size_t v11;
  double v12;
  double v13;
  CGPath *v14;
  AMSPaymentSheetRequest *v15;
  CGImage *v16;
  CGPath *v17;
  int64_t v18;
  CGImage *Image;
  CGImage *v20;
  CGPath *Mutable;
  const CGPath *MutableCopy;
  CGImage *v23;
  CGColorSpace *DeviceRGB;
  CGContext *v25;
  const CGPath *v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL4 v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v8 = a5;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v11 = Height;
  v12 = (double)Width;
  v13 = (double)Height;
  switch(a4)
  {
    case 0:
      v14 = -[AMSPaymentSheetRequest _createBorderPathForAdornmentStyle:iconWidth:iconHeight:](self, "_createBorderPathForAdornmentStyle:iconWidth:iconHeight:", 0, (double)Width, v13);
      v20 = -[AMSPaymentSheetRequest _createDefaultImageWithImageRef:size:borderPath:](self, "_createDefaultImageWithImageRef:size:borderPath:", a3, v14, v12, v13);
      goto LABEL_24;
    case 1:
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, 0.0, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, 0.0, v13 - v12 * 0.032);
      CGPathAddArcToPoint(Mutable, 0, 0.0, v13, v12 * 0.032, v13, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, v12 - v12 * 0.473684211, v13);
      CGPathAddArcToPoint(Mutable, 0, (double)Width, v13, (double)Width, v13 - v12 * 0.473684211, v12 * 0.473684211);
      CGPathAddLineToPoint(Mutable, 0, (double)Width, v12 * 0.032);
      CGPathAddArcToPoint(Mutable, 0, (double)Width, 0.0, v12 - v12 * 0.032, 0.0, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, v12 * 0.032, 0.0);
      CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 0.0, v12 * 0.032, v12 * 0.032);
      MutableCopy = CGPathCreateMutableCopy(Mutable);
      v23 = -[AMSPaymentSheetRequest _createMaskedImageRefForImageRef:withPathRef:adornmentStyle:andDesignVersion:](self, "_createMaskedImageRefForImageRef:withPathRef:adornmentStyle:andDesignVersion:", a3, MutableCopy, 1, v8);
      if (Mutable)
        CGPathRelease(Mutable);
      if (MutableCopy)
        CGPathRelease(MutableCopy);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v25 = CGBitmapContextCreate(0, Width, v11, 8uLL, 4 * Width, DeviceRGB, 2u);
      CGContextSetRGBFillColor(v25, 0.0, 0.0, 0.0, 0.0);
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.width = (double)Width;
      v38.size.height = v13;
      CGContextFillRect(v25, v38);
      CGContextSetRGBFillColor(v25, 0.827000022, 0.827000022, 0.827000022, 1.0);
      v39.origin.x = 0.0;
      v39.origin.y = 0.0;
      v39.size.width = (double)Width;
      v39.size.height = v13;
      v26 = CGPathCreateWithRoundedRect(v39, v12 * 0.0579999983, v13 * 0.0579999983, 0);
      CGContextBeginPath(v25);
      CGContextAddPath(v25, v26);
      CGContextFillPath(v25);
      if (DeviceRGB)
        CGColorSpaceRelease(DeviceRGB);
      if (v26)
        CGPathRelease(v26);
      v27 = v12 * 0.0813999996;
      v28 = v13 * 0.0813999996;
      v40.size.width = v12 + v12 * 0.0813999996 * -2.0;
      v40.size.height = v13 + v13 * 0.0813999996 * -2.0;
      v40.origin.x = v12 * 0.0813999996;
      v40.origin.y = v13 * 0.0813999996;
      CGContextDrawImage(v25, v40, v23);
      if (v23)
        CGImageRelease(v23);
      v29 = v27 * 0.550000012;
      v30 = v12 - v27 - v27 * 0.550000012;
      v31 = v13 - v28 - v28 * 0.550000012;
      CGContextSetRGBStrokeColor(v25, 0.707, 0.707, 0.707, 1.0);
      CGContextSetLineWidth(v25, v12 * 0.0208333333);
      CGContextMoveToPoint(v25, v30, v28 * 0.550000012 + v31);
      CGContextAddLineToPoint(v25, v30, v31 - v28 * 0.550000012);
      CGContextStrokePath(v25);
      CGContextMoveToPoint(v25, v30 - v29, v31);
      CGContextAddLineToPoint(v25, v29 + v30, v31);
      CGContextStrokePath(v25);
      Image = CGBitmapContextCreateImage(v25);
      if (v25)
        CGContextRelease(v25);
      v14 = 0;
      goto LABEL_25;
    case 2:
      v41.origin.y = v13 * 0.125;
      v41.size.height = v13 * 0.75;
      v41.origin.x = 0.0;
      v41.size.width = (double)Width;
      v14 = CGPathCreateWithRoundedRect(v41, v13 * 0.375, v13 * 0.375, 0);
      v15 = self;
      v16 = a3;
      v17 = v14;
      v18 = 2;
      goto LABEL_23;
    case 3:
    case 6:
      v37.origin.x = 0.0;
      v37.origin.y = 0.0;
      v37.size.width = (double)Width;
      v37.size.height = (double)Height;
      v14 = CGPathCreateWithRoundedRect(v37, v12 * 0.5, v13 * 0.5, 0);
      v15 = self;
      v16 = a3;
      v17 = v14;
      v18 = a4;
      goto LABEL_23;
    case 4:
      v32 = -[AMSPaymentSheetRequest isDesignVersionEqualOrGreaterThan:](self, "isDesignVersionEqualOrGreaterThan:", 0x1E25AF8F0);
      v33 = 0.236842105;
      if (v32)
        v33 = 0.185185185;
      v34 = v33 * v12;
      v35 = v33 * v13;
      v42.origin.x = 0.0;
      v42.origin.y = 0.0;
      v42.size.width = (double)Width;
      v42.size.height = v13;
      v14 = CGPathCreateWithRoundedRect(v42, v34, v35, 0);
      v15 = self;
      v16 = a3;
      v17 = v14;
      v18 = 4;
      goto LABEL_23;
    case 5:
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = (double)Width;
      v43.size.height = (double)Height;
      v14 = CGPathCreateWithRoundedRect(v43, v13 * 0.102564103, v13 * 0.102564103, 0);
      v15 = self;
      v16 = a3;
      v17 = v14;
      v18 = 5;
LABEL_23:
      v20 = -[AMSPaymentSheetRequest _createMaskedImageRefForImageRef:withPathRef:adornmentStyle:andDesignVersion:](v15, "_createMaskedImageRefForImageRef:withPathRef:adornmentStyle:andDesignVersion:", v16, v17, v18, v8);
LABEL_24:
      Image = v20;
LABEL_25:
      CGPathRelease(v14);
      if (Image)
        CGImageRelease(a3);
      break;
    default:
      CGPathRelease(0);
      Image = 0;
      break;
  }

  return Image;
}

- (CGImage)_createMaskedImageRefForImageRef:(CGImage *)a3 withPathRef:(CGPath *)a4 adornmentStyle:(int64_t)a5 andDesignVersion:(id)a6
{
  id v9;
  size_t Width;
  size_t Height;
  double v12;
  double v13;
  CGColorSpace *ColorSpace;
  uint64_t Model;
  uint64_t v16;
  CGImage *Copy;
  CGImage *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  CGImage *v25;
  CGImage *v26;
  size_t v27;
  size_t v28;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGContext *v31;
  _BOOL4 v32;
  CGColor *v33;
  CGImage *Image;
  _BYTE v36[32];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v12 = (double)Width;
  v13 = (double)Height;
  ColorSpace = CGImageGetColorSpace(a3);
  Model = CGColorSpaceGetModel(ColorSpace);
  if ((_DWORD)Model == 1)
  {
    Copy = CGImageCreateCopy(a3);
    goto LABEL_5;
  }
  v16 = Model;
  if (!(_DWORD)Model)
  {
    Copy = -[AMSPaymentSheetRequest _createRGBImageRefForGreyScaleImageRef:width:height:](self, "_createRGBImageRefForGreyScaleImageRef:width:height:", a3, Width, Height);
LABEL_5:
    v18 = Copy;
    goto LABEL_11;
  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_opt_class();
    v22 = v21;
    -[AMSPaymentSheetRequest logKey](self, "logKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v36 = 138543874;
    *(_QWORD *)&v36[4] = v21;
    *(_WORD *)&v36[12] = 2114;
    *(_QWORD *)&v36[14] = v23;
    *(_WORD *)&v36[22] = 2114;
    *(_QWORD *)&v36[24] = v24;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Warning - Attempting to mask image with an unsupported color model: %{public}@", v36, 0x20u);

  }
  v18 = 0;
LABEL_11:
  v25 = -[AMSPaymentSheetRequest _createImageMaskRefWithSize:andPath:](self, "_createImageMaskRefWithSize:andPath:", a4, v12, v13);
  v26 = CGImageCreateWithMask(v18, v25);
  v27 = CGImageGetWidth(v26);
  v28 = CGImageGetHeight(v26);
  BitsPerComponent = CGImageGetBitsPerComponent(v26);
  BytesPerRow = CGImageGetBytesPerRow(v26);
  v31 = CGBitmapContextCreate(0, v27, v28, BitsPerComponent, BytesPerRow, ColorSpace, 1u);
  CGContextSetInterpolationQuality(v31, kCGInterpolationHigh);
  CGContextSetRGBFillColor(v31, 1.0, 0.0, 0.0, 0.0);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v12;
  v38.size.height = v13;
  CGContextFillRect(v31, v38);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v12;
  v39.size.height = v13;
  CGContextDrawImage(v31, v39, v26);
  v32 = -[AMSPaymentSheetRequest _shouldDrawGrayBorderForMaskedImageWithDesignVersion:](self, "_shouldDrawGrayBorderForMaskedImageWithDesignVersion:", v9);

  if (a4 && v32)
  {
    *(_OWORD *)v36 = xmmword_18CF5CC08;
    *(_OWORD *)&v36[16] = unk_18CF5CC18;
    v33 = CGColorCreate(ColorSpace, (const CGFloat *)v36);
    CGContextSetStrokeColorWithColor(v31, v33);
    CGContextSetLineWidth(v31, 2.0);
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    v40.size.width = v12;
    v40.size.height = v13;
    CGContextClipToMask(v31, v40, v25);
    CGContextAddPath(v31, a4);
    CGContextDrawPath(v31, kCGPathStroke);
    CGColorRelease(v33);
  }
  Image = CGBitmapContextCreateImage(v31);
  CGContextRelease(v31);
  CGImageRelease(v25);
  CGImageRelease(v26);
  CGImageRelease(v18);
  return Image;
}

- (CGImage)_createRatingImageWithStringValue:(id)a3 assetScale:(float *)a4
{
  __CFString *v4;
  void *v5;
  float v6;
  float v7;
  CGColorSpace *DeviceRGB;
  CGColorRef v9;
  CTFontRef UIFontForLanguage;
  __CFDictionary *Mutable;
  const __CFAttributedString *v12;
  const __CTFramesetter *v13;
  CFIndex v14;
  CGSize v15;
  float height;
  CGFloat v17;
  float v18;
  float width;
  double v20;
  CGContext *v21;
  const CGPath *v22;
  const __CTLine *v23;
  CGImage *Image;
  CGFloat components[2];
  __int128 v28;
  uint64_t v29;
  CFRange v30;
  CGSize v31;
  CGRect v32;
  CGRect v33;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  +[AMSDevice screenScale](AMSDevice, "screenScale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  *(_OWORD *)components = xmmword_18CF5CC28;
  v28 = unk_18CF5CC38;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGColorCreate(DeviceRGB, components);
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontLabel, v7 * 9.0, 0);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA8188], UIFontForLanguage);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA8550], v9);
  v12 = CFAttributedStringCreate(0, v4, Mutable);
  v13 = CTFramesetterCreateWithAttributedString(v12);
  v14 = -[__CFString length](v4, "length");

  v31.width = 1.79769313e308;
  v30.location = 0;
  v30.length = v14;
  v31.height = 1.79769313e308;
  v15 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v30, 0, v31, 0);
  height = v15.height;
  v17 = ceilf(height);
  v18 = v17 * 0.352941176;
  width = v15.width;
  v20 = ceilf(width) + ceilf(v18) * 2.0;
  v21 = CGBitmapContextCreate(0, (unint64_t)v20, vcvtps_u32_f32(height), 8uLL, vcvtd_n_u64_f64(v20, 3uLL), DeviceRGB, 2u);
  CGContextSetShouldAntialias(v21, 1);
  CGContextSetInterpolationQuality(v21, kCGInterpolationHigh);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = v20;
  v32.size.height = v17;
  v33 = CGRectInset(v32, 1.0, 1.0);
  v22 = CGPathCreateWithRoundedRect(v33, 6.0, 6.0, 0);
  CGContextAddPath(v21, v22);
  CGContextSetStrokeColorWithColor(v21, v9);
  CGContextSetLineWidth(v21, 1.0);
  CGContextStrokePath(v21);
  v23 = CTLineCreateWithAttributedString(v12);
  CGContextSetTextPosition(v21, v20 * 0.5 - v15.width * 0.5, v17 * 0.5 + v15.height * -0.25 + -1.0);
  CTLineDraw(v23, v21);
  Image = CGBitmapContextCreateImage(v21);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v9);
  CGContextRelease(v21);
  CGPathRelease(v22);
  if (Mutable)
    CFRelease(Mutable);
  if (v12)
    CFRelease(v12);
  if (UIFontForLanguage)
    CFRelease(UIFontForLanguage);
  if (v13)
    CFRelease(v13);
  if (v23)
    CFRelease(v23);
  if (a4)
    *a4 = v7;
  return Image;
}

- (CGImage)_createRGBImageRefForGreyScaleImageRef:(CGImage *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  CGFloat v7;
  CGFloat v8;
  CGColorSpace *DeviceRGB;
  size_t Width;
  size_t Height;
  CGContext *v12;
  CGImage *Image;
  CGRect v15;
  CGRect v16;

  v7 = (double)a4;
  v8 = (double)a5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v12 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * a4, DeviceRGB, 1u);
  CGContextSetInterpolationQuality(v12, kCGInterpolationHigh);
  CGContextSetRGBFillColor(v12, 0.0, 0.0, 0.0, 1.0);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v7;
  v15.size.height = v8;
  CGContextFillRect(v12, v15);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v7;
  v16.size.height = v8;
  CGContextDrawImage(v12, v16, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v12);
  return Image;
}

- (BOOL)_shouldDrawGrayBorderForMaskedImageWithDesignVersion:(id)a3
{
  return 1;
}

- (AMSPaymentSheetRequest)init
{
  AMSPaymentSheetRequest *v2;
  uint64_t v3;
  NSString *logKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSPaymentSheetRequest;
  v2 = -[AMSPaymentSheetRequest init](&v6, sel_init);
  if (v2)
  {
    AMSSetLogKeyIfNeeded();
    v3 = objc_claimAutoreleasedReturnValue();
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v3;

  }
  return v2;
}

- (BOOL)requiresDelegateAuthentication
{
  void *v2;
  BOOL v3;

  -[AMSPaymentSheetRequest delegateAuthenticateChallenge](self, "delegateAuthenticateChallenge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isDesignVersionEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AMSPaymentSheetRequest designVersion](self, "designVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", v4);

  return v6;
}

- (BOOL)isDesignVersionEqualOrGreaterThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[AMSPaymentSheetRequest designVersion](self, "designVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSPaymentSheetRequest designVersion](self, "designVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    v8 = v7 >= objc_msgSend(v4, "integerValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDesignVersionLessThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[AMSPaymentSheetRequest designVersion](self, "designVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSPaymentSheetRequest designVersion](self, "designVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    v8 = v7 < objc_msgSend(v4, "integerValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v4 = a3;
  -[AMSPaymentSheetRequest account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAccount"));

  -[AMSPaymentSheetRequest accountHeader](self, "accountHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAccountHeader"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPaymentSheetRequest isApplePayClassic](self, "isApplePayClassic"), CFSTR("kApplePayClassic"));
  -[AMSPaymentSheetRequest attributedList](self, "attributedList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kAttributedList"));

  -[AMSPaymentSheetRequest biometricsRequest](self, "biometricsRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kBiometricsRequest"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetRequest confirmationTitle](self, "confirmationTitle"), CFSTR("kConfirmationTitle"));
  -[AMSPaymentSheetRequest countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kCountryCode"));

  -[AMSPaymentSheetRequest currencyCode](self, "currencyCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kCurrencyCode"));

  -[AMSPaymentSheetRequest delegateAuthenticateChallenge](self, "delegateAuthenticateChallenge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kDelegateAuthenticateChallenge"));

  -[AMSPaymentSheetRequest designVersion](self, "designVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kDesignVersion"));

  -[AMSPaymentSheetRequest displayPrice](self, "displayPrice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kDisplayPrice"));

  -[AMSPaymentSheetRequest explanation](self, "explanation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("kExplanation"));

  -[AMSPaymentSheetRequest flexList](self, "flexList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("kFlexList"));

  -[AMSPaymentSheetRequest inlineImages](self, "inlineImages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("kInlineImages"));

  -[AMSPaymentSheetRequest logKey](self, "logKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("kLogKey"));

  -[AMSPaymentSheetRequest merchantSession](self, "merchantSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("kMerchantSession"));

  -[AMSPaymentSheetRequest message](self, "message");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("kMessage"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetRequest payee](self, "payee"), CFSTR("kPayee"));
  -[AMSPaymentSheetRequest paymentSession](self, "paymentSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("kPaymentSession"));

  -[AMSPaymentSheetRequest paymentSummary](self, "paymentSummary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("kPaymentSummary"));

  -[AMSPaymentSheetRequest preSheetDialog](self, "preSheetDialog");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("kPreSheetDialog"));

  -[AMSPaymentSheetRequest price](self, "price");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("kPrice"));

  -[AMSPaymentSheetRequest priceSectionItems](self, "priceSectionItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("kPriceSectionItems"));

  -[AMSPaymentSheetRequest ratingHeader](self, "ratingHeader");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("kRatingHeader"));

  -[AMSPaymentSheetRequest ratingValue](self, "ratingValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("kRatingValue"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPaymentSheetRequest requiresAuthorization](self, "requiresAuthorization"), CFSTR("kRequiresAuthorization"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetRequest salableIcon](self, "salableIcon"), CFSTR("kSalableIcon"));
  -[AMSPaymentSheetRequest salableIconURL](self, "salableIconURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("kSalableIconURL"));

  -[AMSPaymentSheetRequest salableInfo](self, "salableInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("kSalableInfo"));

  -[AMSPaymentSheetRequest salableInfoLabel](self, "salableInfoLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("kSalableInfoLabel"));

  -[AMSPaymentSheetRequest secondaryFlexList](self, "secondaryFlexList");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("kSecondaryFlexList"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetRequest secondarySalableIcon](self, "secondarySalableIcon"), CFSTR("kSecondarySalableIcon"));
  -[AMSPaymentSheetRequest secondarySalableIconURL](self, "secondarySalableIconURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("kSecondarySalableIconURL"));

  -[AMSPaymentSheetRequest secondarySalableInfo](self, "secondarySalableInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("kSecondarySalableInfo"));

  -[AMSPaymentSheetRequest secondarySalableInfoLabel](self, "secondarySalableInfoLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("kSecondarySalableInfoLabel"));

  -[AMSPaymentSheetRequest selectedCard](self, "selectedCard");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("kSelectedCard"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPaymentSheetRequest shouldUppercaseText](self, "shouldUppercaseText"), &stru_1E2548760);
  -[AMSPaymentSheetRequest storeName](self, "storeName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("kShouldUppercaseText"));

  -[AMSPaymentSheetRequest styles](self, "styles");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("kStyles"));

  -[AMSPaymentSheetRequest title](self, "title");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("kTitle"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetRequest titleType](self, "titleType"), CFSTR("kTitleType"));
  -[AMSPaymentSheetRequest userAgent](self, "userAgent");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("kUserAgent"));

}

- (AMSPaymentSheetRequest)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentSheetRequest *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  NSString *accountHeader;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *attributedList;
  uint64_t v17;
  AMSBiometricsSignatureRequest *biometricsRequest;
  uint64_t v19;
  NSString *countryCode;
  uint64_t v21;
  NSString *currencyCode;
  uint64_t v23;
  NSString *delegateAuthenticateChallenge;
  uint64_t v25;
  NSNumber *designVersion;
  uint64_t v27;
  NSString *displayPrice;
  uint64_t v29;
  NSString *explanation;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *flexList;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSArray *inlineImages;
  uint64_t v44;
  NSString *logKey;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSDictionary *merchantSession;
  uint64_t v51;
  NSString *message;
  uint64_t v53;
  NSString *paymentSession;
  uint64_t v55;
  NSString *paymentSummary;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSArray *preSheetDialog;
  uint64_t v64;
  NSNumber *price;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSArray *priceSectionItems;
  uint64_t v71;
  NSString *ratingHeader;
  uint64_t v73;
  NSString *ratingValue;
  uint64_t v75;
  NSURL *salableIconURL;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSArray *salableInfo;
  uint64_t v84;
  NSAttributedString *salableInfoLabel;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSArray *secondaryFlexList;
  uint64_t v93;
  NSURL *secondarySalableIconURL;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  NSArray *secondarySalableInfo;
  uint64_t v102;
  NSAttributedString *secondarySalableInfoLabel;
  uint64_t v104;
  AMSCardSingleSelection *selectedCard;
  uint64_t v106;
  NSString *storeName;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  NSArray *styles;
  uint64_t v114;
  NSString *title;
  uint64_t v116;
  NSString *userAgent;
  objc_super v119;

  v4 = a3;
  v119.receiver = self;
  v119.super_class = (Class)AMSPaymentSheetRequest;
  v5 = -[AMSPaymentSheetRequest init](&v119, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAccount"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAccountHeader"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountHeader = v5->_accountHeader;
    v5->_accountHeader = (NSString *)v8;

    v5->_applePayClassic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kApplePayClassic"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kAttributedList"));
    v15 = objc_claimAutoreleasedReturnValue();
    attributedList = v5->_attributedList;
    v5->_attributedList = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBiometricsRequest"));
    v17 = objc_claimAutoreleasedReturnValue();
    biometricsRequest = v5->_biometricsRequest;
    v5->_biometricsRequest = (AMSBiometricsSignatureRequest *)v17;

    v5->_confirmationTitle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kConfirmationTitle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCountryCode"));
    v19 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCurrencyCode"));
    v21 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDelegateAuthenticateChallenge"));
    v23 = objc_claimAutoreleasedReturnValue();
    delegateAuthenticateChallenge = v5->_delegateAuthenticateChallenge;
    v5->_delegateAuthenticateChallenge = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDesignVersion"));
    v25 = objc_claimAutoreleasedReturnValue();
    designVersion = v5->_designVersion;
    v5->_designVersion = (NSNumber *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDisplayPrice"));
    v27 = objc_claimAutoreleasedReturnValue();
    displayPrice = v5->_displayPrice;
    v5->_displayPrice = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExplanation"));
    v29 = objc_claimAutoreleasedReturnValue();
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("kFlexList"));
    v36 = objc_claimAutoreleasedReturnValue();
    flexList = v5->_flexList;
    v5->_flexList = (NSArray *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("kInlineImages"));
    v42 = objc_claimAutoreleasedReturnValue();
    inlineImages = v5->_inlineImages;
    v5->_inlineImages = (NSArray *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLogKey"));
    v44 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v44;

    v46 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("kMerchantSession"));
    v49 = objc_claimAutoreleasedReturnValue();
    merchantSession = v5->_merchantSession;
    v5->_merchantSession = (NSDictionary *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessage"));
    v51 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v51;

    v5->_payee = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPayee"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPaymentSession"));
    v53 = objc_claimAutoreleasedReturnValue();
    paymentSession = v5->_paymentSession;
    v5->_paymentSession = (NSString *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPaymentSummary"));
    v55 = objc_claimAutoreleasedReturnValue();
    paymentSummary = v5->_paymentSummary;
    v5->_paymentSummary = (NSString *)v55;

    v57 = (void *)MEMORY[0x1E0C99E60];
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    objc_msgSend(v57, "setWithObjects:", v58, v59, v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("kPreSheetDialog"));
    v62 = objc_claimAutoreleasedReturnValue();
    preSheetDialog = v5->_preSheetDialog;
    v5->_preSheetDialog = (NSArray *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPrice"));
    v64 = objc_claimAutoreleasedReturnValue();
    price = v5->_price;
    v5->_price = (NSNumber *)v64;

    v66 = (void *)MEMORY[0x1E0C99E60];
    v67 = objc_opt_class();
    objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v68, CFSTR("kPriceSectionItems"));
    v69 = objc_claimAutoreleasedReturnValue();
    priceSectionItems = v5->_priceSectionItems;
    v5->_priceSectionItems = (NSArray *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRatingHeader"));
    v71 = objc_claimAutoreleasedReturnValue();
    ratingHeader = v5->_ratingHeader;
    v5->_ratingHeader = (NSString *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRatingValue"));
    v73 = objc_claimAutoreleasedReturnValue();
    ratingValue = v5->_ratingValue;
    v5->_ratingValue = (NSString *)v73;

    v5->_requiresAuthorization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRequiresAuthorization"));
    v5->_salableIcon = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSalableIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSalableIconURL"));
    v75 = objc_claimAutoreleasedReturnValue();
    salableIconURL = v5->_salableIconURL;
    v5->_salableIconURL = (NSURL *)v75;

    v77 = (void *)MEMORY[0x1E0C99E60];
    v78 = objc_opt_class();
    v79 = objc_opt_class();
    v80 = objc_opt_class();
    objc_msgSend(v77, "setWithObjects:", v78, v79, v80, objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("kSalableInfo"));
    v82 = objc_claimAutoreleasedReturnValue();
    salableInfo = v5->_salableInfo;
    v5->_salableInfo = (NSArray *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSalableInfoLabel"));
    v84 = objc_claimAutoreleasedReturnValue();
    salableInfoLabel = v5->_salableInfoLabel;
    v5->_salableInfoLabel = (NSAttributedString *)v84;

    v86 = (void *)MEMORY[0x1E0C99E60];
    v87 = objc_opt_class();
    v88 = objc_opt_class();
    v89 = objc_opt_class();
    objc_msgSend(v86, "setWithObjects:", v87, v88, v89, objc_opt_class(), 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v90, CFSTR("kSecondaryFlexList"));
    v91 = objc_claimAutoreleasedReturnValue();
    secondaryFlexList = v5->_secondaryFlexList;
    v5->_secondaryFlexList = (NSArray *)v91;

    v5->_secondarySalableIcon = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSecondarySalableIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSecondarySalableIconURL"));
    v93 = objc_claimAutoreleasedReturnValue();
    secondarySalableIconURL = v5->_secondarySalableIconURL;
    v5->_secondarySalableIconURL = (NSURL *)v93;

    v95 = (void *)MEMORY[0x1E0C99E60];
    v96 = objc_opt_class();
    v97 = objc_opt_class();
    v98 = objc_opt_class();
    objc_msgSend(v95, "setWithObjects:", v96, v97, v98, objc_opt_class(), 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("kSecondarySalableInfo"));
    v100 = objc_claimAutoreleasedReturnValue();
    secondarySalableInfo = v5->_secondarySalableInfo;
    v5->_secondarySalableInfo = (NSArray *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSecondarySalableInfoLabel"));
    v102 = objc_claimAutoreleasedReturnValue();
    secondarySalableInfoLabel = v5->_secondarySalableInfoLabel;
    v5->_secondarySalableInfoLabel = (NSAttributedString *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSelectedCard"));
    v104 = objc_claimAutoreleasedReturnValue();
    selectedCard = v5->_selectedCard;
    v5->_selectedCard = (AMSCardSingleSelection *)v104;

    v5->_shouldUppercaseText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kShouldUppercaseText"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStoreName"));
    v106 = objc_claimAutoreleasedReturnValue();
    storeName = v5->_storeName;
    v5->_storeName = (NSString *)v106;

    v108 = (void *)MEMORY[0x1E0C99E60];
    v109 = objc_opt_class();
    v110 = objc_opt_class();
    objc_msgSend(v108, "setWithObjects:", v109, v110, objc_opt_class(), 0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v111, CFSTR("kStyles"));
    v112 = objc_claimAutoreleasedReturnValue();
    styles = v5->_styles;
    v5->_styles = (NSArray *)v112;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitle"));
    v114 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v114;

    v5->_titleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kTitleType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserAgent"));
    v116 = objc_claimAutoreleasedReturnValue();
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v116;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accountHeader
{
  return self->_accountHeader;
}

- (void)setAccountHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isApplePayClassic
{
  return self->_applePayClassic;
}

- (void)setApplePayClassic:(BOOL)a3
{
  self->_applePayClassic = a3;
}

- (NSArray)attributedList
{
  return self->_attributedList;
}

- (void)setAttributedList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_biometricsRequest, a3);
}

- (int64_t)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(int64_t)a3
{
  self->_confirmationTitle = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)delegateAuthenticateChallenge
{
  return self->_delegateAuthenticateChallenge;
}

- (void)setDelegateAuthenticateChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)designVersion
{
  return self->_designVersion;
}

- (void)setDesignVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)displayPrice
{
  return self->_displayPrice;
}

- (void)setDisplayPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)flexList
{
  return self->_flexList;
}

- (void)setFlexList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)inlineImages
{
  return self->_inlineImages;
}

- (void)setInlineImages:(id)a3
{
  objc_storeStrong((id *)&self->_inlineImages, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSDictionary)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)payee
{
  return self->_payee;
}

- (void)setPayee:(int64_t)a3
{
  self->_payee = a3;
}

- (NSString)paymentSession
{
  return self->_paymentSession;
}

- (void)setPaymentSession:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)paymentSummary
{
  return self->_paymentSummary;
}

- (void)setPaymentSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)preSheetDialog
{
  return self->_preSheetDialog;
}

- (void)setPreSheetDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)priceSectionItems
{
  return self->_priceSectionItems;
}

- (void)setPriceSectionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)ratingHeader
{
  return self->_ratingHeader;
}

- (void)setRatingHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)ratingValue
{
  return self->_ratingValue;
}

- (void)setRatingValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (void)setRequiresAuthorization:(BOOL)a3
{
  self->_requiresAuthorization = a3;
}

- (int64_t)salableIcon
{
  return self->_salableIcon;
}

- (void)setSalableIcon:(int64_t)a3
{
  self->_salableIcon = a3;
}

- (NSURL)salableIconURL
{
  return self->_salableIconURL;
}

- (void)setSalableIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)salableInfo
{
  return self->_salableInfo;
}

- (void)setSalableInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSAttributedString)salableInfoLabel
{
  return self->_salableInfoLabel;
}

- (void)setSalableInfoLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)secondaryFlexList
{
  return self->_secondaryFlexList;
}

- (void)setSecondaryFlexList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (int64_t)secondarySalableIcon
{
  return self->_secondarySalableIcon;
}

- (void)setSecondarySalableIcon:(int64_t)a3
{
  self->_secondarySalableIcon = a3;
}

- (NSURL)secondarySalableIconURL
{
  return self->_secondarySalableIconURL;
}

- (void)setSecondarySalableIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)secondarySalableInfo
{
  return self->_secondarySalableInfo;
}

- (void)setSecondarySalableInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSAttributedString)secondarySalableInfoLabel
{
  return self->_secondarySalableInfoLabel;
}

- (void)setSecondarySalableInfoLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (AMSCardSingleSelection)selectedCard
{
  return self->_selectedCard;
}

- (void)setSelectedCard:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCard, a3);
}

- (BOOL)shouldUppercaseText
{
  return self->_shouldUppercaseText;
}

- (void)setShouldUppercaseText:(BOOL)a3
{
  self->_shouldUppercaseText = a3;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setStoreName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)isDelegateAuthentication
{
  return self->_isDelegateAuthentication;
}

- (void)setIsDelegateAuthentication:(BOOL)a3
{
  self->_isDelegateAuthentication = a3;
}

- (AMSPaymentSheetPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_selectedCard, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfoLabel, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfo, 0);
  objc_storeStrong((id *)&self->_secondarySalableIconURL, 0);
  objc_storeStrong((id *)&self->_secondaryFlexList, 0);
  objc_storeStrong((id *)&self->_salableInfoLabel, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_salableIconURL, 0);
  objc_storeStrong((id *)&self->_ratingValue, 0);
  objc_storeStrong((id *)&self->_ratingHeader, 0);
  objc_storeStrong((id *)&self->_priceSectionItems, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_preSheetDialog, 0);
  objc_storeStrong((id *)&self->_paymentSummary, 0);
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_inlineImages, 0);
  objc_storeStrong((id *)&self->_flexList, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_displayPrice, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_delegateAuthenticateChallenge, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_attributedList, 0);
  objc_storeStrong((id *)&self->_accountHeader, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)paymentSheetRequestFromDictionary:(id)a3 account:(id)a4
{
  return +[AMSFinancePaymentSheetResponse createRequestFromDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:authenticateResponse:taskInfo:account:](AMSFinancePaymentSheetResponse, "createRequestFromDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:authenticateResponse:taskInfo:account:", a3, 0, 0, 0, 0, 0, a4);
}

@end

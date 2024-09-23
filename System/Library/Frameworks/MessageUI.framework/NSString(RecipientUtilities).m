@implementation NSString(RecipientUtilities)

+ (id)mf_commaSeparatedRecipientListWithRecipientCount:()RecipientUtilities prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  +[MFAddressConcatenator defaultRecipientListConcatenator](MFAddressConcatenator, "defaultRecipientListConcatenator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commaSeparatedAddressListWithAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", a3, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)mf_copyDisplayableAddressComment
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v1 = a1;
  objc_msgSend(v1, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v1, "stringValue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "ec_personNameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setNamePrefix:", 0);
    objc_msgSend(v7, "setNameSuffix:", 0);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v8, "setStyle:", 3);
    objc_msgSend(v8, "stringFromPersonNameComponents:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v1;
    objc_msgSend(v10, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v10, "stringValue");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v14;

    if (!objc_msgSend(v8, "length"))
    {
      v15 = 0;
      goto LABEL_12;
    }
    v9 = v8;
    v8 = v9;
  }
  v15 = v9;
LABEL_12:

  return v15;
}

@end

@implementation CUIKContactDescriptionGenerator

+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0D0C298];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "contactIdentifierIsMe:", v10);

  objc_msgSend(a1, "CUIKLabeledDisplayStringForContact:label:isMe:", v8, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4 isMe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v5 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedCapitalizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "contactType") != 1)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v9)
      {
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@’s %@"), &stru_1E6EBAE30, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v16, v11, v9);
      }
      else
      {
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@’s address"), &stru_1E6EBAE30, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v16, v11, v18);
      }
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v12 = v11;
LABEL_9:
    v10 = v12;
LABEL_12:

    goto LABEL_13;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("My Address"), &stru_1E6EBAE30, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v10 = v9;
LABEL_13:

  return v10;
}

@end

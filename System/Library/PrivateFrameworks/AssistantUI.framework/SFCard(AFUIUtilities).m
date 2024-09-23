@implementation SFCard(AFUIUtilities)

- (uint64_t)afui_hasContentEqualTo:()AFUIUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v22;
  void *v23;
  unint64_t v24;

  v4 = a3;
  objc_msgSend(a1, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "cardSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }
  objc_msgSend(a1, "cardSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(a1, "cardSections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "cardSections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      objc_msgSend(v13, "nextCard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cardSections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {

        break;
      }
      objc_msgSend(v15, "nextCard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cardSections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        break;
      objc_msgSend(v13, "setCardSectionId:", &stru_24D7A4738);
      objc_msgSend(v15, "setCardSectionId:", &stru_24D7A4738);
      objc_msgSend(v13, "setResultIdentifier:", &stru_24D7A4738);
      objc_msgSend(v15, "setResultIdentifier:", &stru_24D7A4738);
      objc_msgSend(v13, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if ((v22 & 1) != 0)
      {
        ++v11;
        objc_msgSend(a1, "cardSections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24 > v11)
          continue;
      }
      goto LABEL_15;
    }

    goto LABEL_14;
  }
  v22 = 1;
LABEL_15:

  return v22;
}

@end

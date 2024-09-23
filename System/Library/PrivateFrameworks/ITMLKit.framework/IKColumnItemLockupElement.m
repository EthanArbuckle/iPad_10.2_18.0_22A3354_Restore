@implementation IKColumnItemLockupElement

- (NSString)columnItemType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[IKViewElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    -[IKViewElement style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnItemType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "copy");

  }
  return (NSString *)v6;
}

- (IKTextElement)title
{
  id v3;

  v3 = 0;
  -[IKColumnItemLockupElement _computeTitle:subtitle:secondarySubtitle:unstyledTextElements:](self, "_computeTitle:subtitle:secondarySubtitle:unstyledTextElements:", &v3, 0, 0, 0);
  return (IKTextElement *)v3;
}

- (IKTextElement)subtitle
{
  id v3;

  v3 = 0;
  -[IKColumnItemLockupElement _computeTitle:subtitle:secondarySubtitle:unstyledTextElements:](self, "_computeTitle:subtitle:secondarySubtitle:unstyledTextElements:", 0, &v3, 0, 0);
  return (IKTextElement *)v3;
}

- (IKTextElement)secondarySubtitle
{
  id v3;

  v3 = 0;
  -[IKColumnItemLockupElement _computeTitle:subtitle:secondarySubtitle:unstyledTextElements:](self, "_computeTitle:subtitle:secondarySubtitle:unstyledTextElements:", 0, 0, &v3, 0);
  return (IKTextElement *)v3;
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 3);
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 80);
}

- (IKImageElement)image
{
  void *v2;
  void *v3;

  -[IKColumnItemLockupElement images](self, "images");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKImageElement *)v3;
}

- (NSArray)images
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement childElementsWithType:](self, "childElementsWithType:", 49);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

BOOL __35__IKColumnItemLockupElement_images__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageType") == 0;
}

- (IKTextBadgeAttachment)titleBadge
{
  void *v2;
  void *v3;
  void *v4;

  -[IKColumnItemLockupElement title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKTextBadgeAttachment *)v4;
}

- (IKTextBadgeAttachment)subtitleBadge
{
  void *v2;
  void *v3;
  void *v4;

  -[IKColumnItemLockupElement subtitle](self, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKTextBadgeAttachment *)v4;
}

- (IKButtonElement)button
{
  return (IKButtonElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 12);
}

- (IKVideoElement)video
{
  return (IKVideoElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 152);
}

- (NSArray)textElements
{
  id v3;

  v3 = 0;
  -[IKColumnItemLockupElement _computeTitle:subtitle:secondarySubtitle:unstyledTextElements:](self, "_computeTitle:subtitle:secondarySubtitle:unstyledTextElements:", 0, 0, 0, &v3);
  return (NSArray *)v3;
}

- (BOOL)hasSeparator
{
  void *v2;
  void *v3;
  char v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("separator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (BOOL)isWatchlisted
{
  void *v2;
  void *v3;
  char v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("watchlisted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (BOOL)onlyVisibleOnColumnHighlight
{
  void *v2;
  void *v3;
  char v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("onlyVisibleOnColumnHighlight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (void)_computeTitle:(id *)a3 subtitle:(id *)a4 secondarySubtitle:(id *)a5 unstyledTextElements:(id *)a6
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id *v21;
  id *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[IKViewElement childElementsWithType:](self, "childElementsWithType:", 138);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v17, "textStyle") == 1)
        {
          v18 = v17;

          v14 = (uint64_t)v18;
        }
        else if (objc_msgSend(v17, "textStyle") == 2)
        {
          v19 = v17;

          v13 = (uint64_t)v19;
        }
        else if (!objc_msgSend(v17, "textStyle"))
        {
          objc_msgSend(v9, "addObject:", v17);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  if (v14 | v13)
  {
    v20 = 0;
    v22 = a3;
    v21 = a4;
    if (!a3)
      goto LABEL_28;
LABEL_27:
    *v22 = objc_retainAutorelease((id)v14);
    goto LABEL_28;
  }
  v22 = a3;
  v21 = a4;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v20 = 0;
      v13 = 0;
      if (!a3)
        goto LABEL_28;
      goto LABEL_27;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 3)
    {
      v20 = 0;
      if (a3)
        goto LABEL_27;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
        goto LABEL_27;
    }
  }
  else
  {
    v20 = 0;
    v13 = 0;
    v14 = 0;
    if (a3)
      goto LABEL_27;
  }
LABEL_28:
  if (v21)
    *v21 = objc_retainAutorelease((id)v13);
  if (a5)
    *a5 = objc_retainAutorelease(v20);
  if (a6)
    *a6 = (id)objc_msgSend(v9, "copy");

}

@end

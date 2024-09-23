@implementation DOMNode(DDExtensions)

- (uint64_t)dd_searchForLinkRemovingExistingDDLinksWithEndNode:()DDExtensions didModifyDOM:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a1;
  v8 = v7;
  if (a4)
    *a4 = 0;
  if (!v7)
  {
LABEL_28:
    v18 = 0;
    goto LABEL_31;
  }
  v9 = v7;
  while (1)
  {
    if (_isLinkNode(v9))
    {
      if (!_isDataDetectorLinkNode(v9))
      {
LABEL_29:
        v18 = 1;
        goto LABEL_30;
      }
      _removeDataDetectorLinkInNode(v9);
      if (a4)
        *a4 = 1;
    }
    if (v9 == v6)
    {
      objc_msgSend(v8, "parentNode");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_28;
      do
      {
        if (_isLinkNode(v9))
        {
          if (!_isDataDetectorLinkNode(v9))
            goto LABEL_29;
          _removeDataDetectorLinkInNode(v9);
          if (a4)
            *a4 = 1;
        }
        objc_msgSend(v9, "parentNode");
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v19;
      }
      while (v19);
LABEL_27:
      v18 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v9, "childNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
      break;
    objc_msgSend(v10, "item:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_18:

    v9 = (id)v11;
    if (!v11)
      goto LABEL_27;
  }
  objc_msgSend(v9, "nextSibling");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v13;
  v15 = v13;
  if (v12)
  {
LABEL_17:
    v9 = v12;

    v11 = (uint64_t)v9;
    goto LABEL_18;
  }
  v15 = v13;
  while (1)
  {
    v16 = v15;
    objc_msgSend(v15, "parentNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      break;
    objc_msgSend(v15, "nextSibling");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v12 = (void *)v17;
      goto LABEL_17;
    }
  }

  v18 = 0;
  v9 = v14;
LABEL_30:

LABEL_31:
  return v18;
}

@end

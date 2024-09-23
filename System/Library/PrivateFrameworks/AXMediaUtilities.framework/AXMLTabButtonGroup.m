@implementation AXMLTabButtonGroup

- (id)topmost
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double MinY;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;
  CGRect v19;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXMMLElementGroup subfeatures](self, "subfeatures", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "frame");
          MinY = CGRectGetMinY(v18);
          objc_msgSend(v5, "frame");
          if (MinY >= CGRectGetMinY(v19))
            continue;
        }
        v10 = v8;

        v5 = v10;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)textLabel
{
  uint64_t v2;
  unint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[AXMMLElementGroup subfeatures](self, "subfeatures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v44)
  {
    v41 = &stru_1E6260C18;
    v42 = &stru_1E6260C18;
    goto LABEL_28;
  }
  v2 = *(_QWORD *)v46;
  v3 = 0x1E0C99000uLL;
  v41 = &stru_1E6260C18;
  v42 = &stru_1E6260C18;
  v40 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v46 != v2)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v5, "feature");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v3 + 3640), "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v5, "feature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {

        goto LABEL_14;
      }
      objc_msgSend(v5, "feature");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "uiClass") == 11)
      {

LABEL_13:
        objc_msgSend(v5, "feature");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v42;
        __AXMStringForVariables(v42, v15, v16, v17, v18, v19, v20, v21, v7);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v5, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "uiClass");

      v2 = v40;
      v14 = v13 == 17;
      v3 = 0x1E0C99000uLL;
      if (v14)
        goto LABEL_13;
LABEL_15:
      objc_msgSend(v5, "feature");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v3 + 3640), "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
        goto LABEL_23;
      objc_msgSend(v5, "feature");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v26, "length"))
      {

        goto LABEL_23;
      }
      objc_msgSend(v5, "feature");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "uiClass") == 5)
      {

LABEL_22:
        objc_msgSend(v5, "feature");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v41;
        __AXMStringForVariables(v41, v30, v31, v32, v33, v34, v35, v36, v23);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

        continue;
      }
      objc_msgSend(v5, "feature");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "uiClass");

      v2 = v40;
      v14 = v29 == 16;
      v3 = 0x1E0C99000;
      if (v14)
        goto LABEL_22;
    }
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  }
  while (v44);
LABEL_28:

  if (-[__CFString length](v42, "length"))
    v37 = v42;
  else
    v37 = v41;
  v38 = v37;

  return v38;
}

@end

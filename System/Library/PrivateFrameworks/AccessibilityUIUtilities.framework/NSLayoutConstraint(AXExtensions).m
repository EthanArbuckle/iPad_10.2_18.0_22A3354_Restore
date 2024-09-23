@implementation NSLayoutConstraint(AXExtensions)

+ (id)ax_constraintsToMakeItem:()AXExtensions sameDimensionsAsItem:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(&unk_1E76C2400, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(&unk_1E76C2400);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "integerValue");
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, v12, 0, v6, v12, 1.0, 0.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(&unk_1E76C2400, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)ax_removeFromContainer
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a1, "firstItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v15;
  else
    v3 = 0;
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (v4)
      v9 = v4;
    else
      v9 = v6;
    v10 = v9;
  }
  else
  {
    objc_msgSend(v4, "ax_firstCommonAncestorWithView:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v10)
  {
    while (1)
    {
      objc_msgSend(v11, "constraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", a1);

      if (v13)
        break;
      objc_msgSend(v11, "superview");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
      if (!v14)
        goto LABEL_21;
    }
    objc_msgSend(v11, "removeConstraint:", a1);

  }
LABEL_21:

}

@end

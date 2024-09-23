@implementation UIView(GKConstraints)

- (void)_gkRemoveAllConstraints
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "superview");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v3, "constraints", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v5)
        goto LABEL_15;
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "firstItem");
          v10 = objc_claimAutoreleasedReturnValue();
          if ((void *)v10 == a1)
          {

          }
          else
          {
            v11 = (void *)v10;
            objc_msgSend(v9, "secondItem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 != a1)
              continue;
          }
          objc_msgSend(v3, "removeConstraint:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
LABEL_15:

      objc_msgSend(v3, "superview");
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v13;
    }
    while (v13);
  }
  objc_msgSend(a1, "constraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeConstraints:", v14);

}

@end

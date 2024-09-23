@implementation UIView(CKUtilities)

- (uint64_t)__ck_containsFirstResponder
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isFirstResponder") & 1) != 0)
    return 1;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "__ck_containsFirstResponder") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_13;
        }
      }
      v2 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_13:

  return v2;
}

- (double)__ck_alignmentRectSizeForFrameSize:()CKUtilities
{
  double v3;

  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, a2, a3);
  return v3;
}

- (double)__ck_frameSizeForAlignmentRectSize:()CKUtilities
{
  double v3;

  objc_msgSend(a1, "frameForAlignmentRect:", 0.0, 0.0, a2, a3);
  return v3;
}

- (void)__ck_makeEdgesEqualTo:()CKUtilities
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
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v15 = (void *)MEMORY[0x1E0CB3718];
  v4 = a3;
  objc_msgSend(a1, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(a1, "rightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(a1, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(a1, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (uint64_t)__ck_ensureMinimumTouchInsets
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "bounds");
  v4 = fmin((v2 + -44.0) * 0.5, 0.0);
  v5 = fmin((v3 + -44.0) * 0.5, 0.0);
  return objc_msgSend(a1, "_setTouchInsets:", v5, v4, v5, v4);
}

@end

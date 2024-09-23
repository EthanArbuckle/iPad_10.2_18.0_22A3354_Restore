@implementation UIView(GKAdditionsAdditional)

- (void)_gkRecursivelyApplyBlock:()GKAdditionsAdditional depth:
{
  void (**v6)(id, void *, _QWORD);
  uint64_t v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a3;
  v6[2](v6, a1, a4);
  v7 = a4 + 1;
  objc_msgSend(a1, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__UIView_GKAdditionsAdditional___gkRecursivelyApplyBlock_depth___block_invoke;
  v10[3] = &unk_1E59C4318;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

- (uint64_t)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional
{
  return objc_msgSend(a1, "_gkRecursiveDescriptionForKey:depth:", a3, 0);
}

- (id)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional depth:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForKey_depth___block_invoke;
  v13[3] = &unk_1E59C4340;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  objc_msgSend(a1, "_gkRecursivelyApplyBlock:depth:", v13, a4);
  v10 = v15;
  v11 = v8;

  return v11;
}

- (id)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:depth:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForValue_forKey_depth___block_invoke;
  v17[3] = &unk_1E59C4368;
  v18 = v9;
  v19 = v8;
  v11 = v10;
  v20 = v11;
  v12 = v8;
  v13 = v9;
  objc_msgSend(a1, "_gkRecursivelyApplyBlock:depth:", v17, a5);
  v14 = v20;
  v15 = v11;

  return v15;
}

- (uint64_t)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:
{
  return objc_msgSend(a1, "_gkRecursiveDescriptionForValue:forKey:depth:", a3, a4, 0);
}

- (id)_gkAncestryDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      objc_msgSend(v4, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" -> "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (__CFString)_gkAncestryAffectingVisualLayout
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  __CFString *v51;
  uint64_t v52;
  __CFString *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *context;
  double v59;
  double v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CATransform3D v66;
  CATransform3D v67;
  CATransform3D v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v70 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1AF430880]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    v4 = v3;
    v59 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v60 = *MEMORY[0x1E0C9D538];
    do
    {
      objc_msgSend(v4, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      objc_msgSend(v4, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      memset(&v68, 0, sizeof(v68));
      objc_msgSend(v4, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        objc_msgSend(v21, "transform");
      else
        memset(&v68, 0, sizeof(v68));

      memset(&v67, 0, sizeof(v67));
      objc_msgSend(v4, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        objc_msgSend(v23, "sublayerTransform");
      else
        memset(&v67, 0, sizeof(v67));

      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_opt_class();
      v71.origin.x = v6;
      v71.origin.y = v8;
      v71.size.width = v10;
      v71.size.height = v12;
      NSStringFromCGRect(v71);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@ %p> frame:%@"), v26, v4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v60 || v16 != v59 || v18 != v10 || v20 != v12)
      {
        v72.origin.x = v14;
        v72.origin.y = v16;
        v72.size.width = v18;
        v72.size.height = v20;
        NSStringFromCGRect(v72);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" bounds:%@"), v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v30;
      }
      objc_msgSend(v4, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "zPosition");
      v33 = v32;

      if (v33 != 0.0)
      {
        objc_msgSend(v4, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "zPosition");
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" zPos:%g"), v35);
        v36 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v36;
      }
      v66 = v68;
      if (!CATransform3DIsIdentity(&v66))
      {
        v66 = v68;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v66);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" transform:%@"), v37);
        v38 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v38;
      }
      v66 = v67;
      if (!CATransform3DIsIdentity(&v66))
      {
        v66 = v67;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v66);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" sublayerTransform:%@"), v39);
        v40 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v40;
      }
      objc_msgSend(v4, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "animationKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v42, "count"))
      {
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(" animations:%@"), v43);
        v44 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v44;
      }
      objc_msgSend(v2, "addObject:", v28);
      objc_msgSend(v4, "superview");
      v45 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v45;
    }
    while (v45);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = v2;
  objc_msgSend(v2, "reverseObjectEnumerator");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v47)
  {
    v48 = v47;
    v49 = &stru_1E59EB978;
    v50 = *(_QWORD *)v63;
    v51 = &stru_1E59EB978;
    do
    {
      v52 = 0;
      v53 = v49;
      do
      {
        if (*(_QWORD *)v63 != v50)
          objc_enumerationMutation(v46);
        v54 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v52);
        -[__CFString stringByAppendingString:](v51, "stringByAppendingString:", v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "stringByAppendingString:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "stringByAppendingString:", CFSTR("\n"));
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingString:](v53, "stringByAppendingString:", CFSTR(" "));
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v52;
        v53 = v49;
      }
      while (v48 != v52);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v48);
  }
  else
  {
    v49 = &stru_1E59EB978;
    v51 = &stru_1E59EB978;
  }

  objc_autoreleasePoolPop(context);
  return v51;
}

@end

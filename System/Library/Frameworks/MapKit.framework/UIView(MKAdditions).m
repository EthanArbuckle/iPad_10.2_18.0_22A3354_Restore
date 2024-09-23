@implementation UIView(MKAdditions)

+ (uint64_t)_mapkit_shouldAdoptImplicitAnimationParameters
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock");
  if ((_DWORD)result)
    return objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
  return result;
}

+ (id)_mapkit_currentAnimationTimingFunction
{
  unint64_t v0;
  _QWORD *v1;

  v0 = objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve");
  if (v0 > 3)
    v1 = (_QWORD *)MEMORY[0x1E0CD3038];
  else
    v1 = (_QWORD *)qword_1E20D8AB8[v0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_mapkit_currentAnimationDuration
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
}

- (BOOL)_mapkit_isDarkModeEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle") == 2;

  return v2;
}

- (double)_mapkit_userInterfaceOnlySafeAreaInsets
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double MaxY;
  void *v13;
  void *v14;
  double MinY;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v1 = a1;
  v2 = v1;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      break;
    objc_msgSend(v2, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
    if (!v5)
    {
      v6 = 0.0;
      goto LABEL_24;
    }
  }
  objc_msgSend(v3, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0.0;
    v6 = 0.0;
    if (v9 && (objc_msgSend(v9, "isHidden") & 1) == 0)
    {
      objc_msgSend(v10, "bounds");
      objc_msgSend(v1, "convertRect:fromView:", v10);
      MaxY = CGRectGetMaxY(v35);
      if (MaxY >= 0.0)
        v6 = MaxY;
      else
        v6 = 0.0;
    }
    objc_msgSend(v8, "toolbar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "isHidden") & 1) == 0)
      {
        objc_msgSend(v14, "bounds");
        objc_msgSend(v1, "convertRect:fromView:", v14);
        MinY = CGRectGetMinY(v36);
        objc_msgSend(v1, "bounds");
        if (CGRectGetMaxY(v37) - MinY >= 0.0)
        {
          objc_msgSend(v1, "bounds");
          v11 = CGRectGetMaxY(v38) - MinY;
        }
      }
    }

  }
  else
  {
    v11 = 0.0;
    v6 = 0.0;
  }
  objc_msgSend(v4, "tabBarController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "tabBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((objc_msgSend(v18, "isHidden") & 1) == 0)
      {
        objc_msgSend(v19, "bounds");
        objc_msgSend(v1, "convertRect:fromView:", v19);
        v20 = CGRectGetMinY(v39);
        objc_msgSend(v1, "bounds");
        if (v11 <= CGRectGetMaxY(v40) - v20)
        {
          objc_msgSend(v1, "bounds");
          CGRectGetMaxY(v41);
        }
      }
    }

  }
LABEL_24:
  objc_msgSend(v1, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "windowScene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statusBarManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "statusBarFrame");
  objc_msgSend(v1, "convertRect:fromView:", 0);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if (v31 > 0.0)
  {
    objc_msgSend(v1, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "convertRect:fromView:", v32, v25, v27, v29, v31);
    v33 = CGRectGetMaxY(v42);

    if (v6 <= v33)
      v6 = v33;
  }

  return v6;
}

- (double)_mapkit_translateRect:()MKAdditions ifNeededFromSingleEdge:
{
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double x;
  double width;
  double height;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;
  CGRect v54;

  objc_msgSend(a1, "bounds");
  v49 = v14;
  v50 = v13;
  v51 = v15;
  v52 = v16;
  objc_msgSend(a1, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  objc_msgSend(a1, "safeAreaInsets");
  if (v19 >= v26)
    v30 = 0.0;
  else
    v30 = v26;
  if (v21 >= v27)
    v31 = 0.0;
  else
    v31 = v27;
  if (v23 >= v28)
    v32 = 0.0;
  else
    v32 = v28;
  if (v25 >= v29)
    v33 = 0.0;
  else
    v33 = v29;
  switch(a7)
  {
    case 1:
    case 4:
      objc_msgSend(a1, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 0, a2, a3, a4, a5);
      v37 = a5;
      goto LABEL_18;
    case 2:
      v38 = a1;
      v39 = a2;
      v40 = a3;
      v41 = a4;
      v42 = a5;
      v43 = 10;
      goto LABEL_17;
    case 8:
      v38 = a1;
      v39 = a2;
      v40 = a3;
      v41 = a4;
      v42 = a5;
      v43 = 5;
LABEL_17:
      objc_msgSend(v38, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", v43, 0, v39, v40, v41, v42);
      v36 = a4;
LABEL_18:
      v54.origin.x = v50 + v31;
      v54.origin.y = v49 + v30;
      v54.size.width = v51 - (v31 + v33);
      v54.size.height = v52 - (v30 + v32);
      v53 = CGRectIntersection(*(CGRect *)&v34, v54);
      x = v53.origin.x;
      width = v53.size.width;
      height = v53.size.height;
      if (!CGRectIsNull(v53) && (width < a4 || height < a5))
        return *MEMORY[0x1E0C9D628];
      return x;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Only one edge can be specified."), 0);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v48);
  }
}

- (BOOL)_mapkit_hasPointerInteraction
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_mapkit_currentPointerInteraction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)_mapkit_currentPointerInteraction
{
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "interactions", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (void)_mapkit_addPointerInteraction
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA860]);
  objc_msgSend(a1, "addInteraction:", v2);

}

- (void)_mapkit_addPointerInteractionWithDelegate:()MKAdditions
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CEA860];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithDelegate:", v5);

  objc_msgSend(a1, "addInteraction:", v6);
}

- (void)_mapkit_removePointerInteraction
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_mapkit_currentPointerInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(a1, "removeInteraction:", v2);
    v2 = v3;
  }

}

@end

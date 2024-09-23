@implementation UIView(AVAdditions)

- (void)avkit_reevaluateHiddenStateOfItem:()AVAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_reevaluateHiddenStateOfItem:", v4);

}

- (void)avkit_makeSubtreeDisallowGroupBlending
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupBlending:", 0);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "avkit_makeSubtreeDisallowGroupBlending");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (uint64_t)avkit_isVideoGravityFrozen
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isVideoGravityFrozen");

  return v2;
}

- (uint64_t)avkit_isDescendantOfNonPagingScrollView
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isDescendantOfNonPagingScrollView");

  return v2;
}

- (BOOL)avkit_isInAWindowAndVisible
{
  _BOOL8 v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (!objc_msgSend(a1, "_isInAWindow") || (objc_msgSend(a1, "isHiddenOrHasHiddenAncestor") & 1) != 0)
    return 0;
  objc_msgSend(a1, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(a1, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v19 = CGRectIntersection(v18, v20);
  v2 = !CGRectIsEmpty(v19);

  return v2;
}

- (uint64_t)avkit_isCompletelyTransparent
{
  void *v2;
  void *v3;
  float v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  if (v4 == 0.0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "avkit_isCompletelyTransparent");

  }
  return v6;
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:()AVAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);

}

- (uint64_t)avkit_isBeingPresented
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isBeingPresented");

  return v2;
}

- (uint64_t)avkit_wantsAnimatedViewTransitions
{
  uint64_t result;

  result = objc_msgSend(a1, "_isInAWindow");
  if ((_DWORD)result)
    return objc_msgSend(a1, "avkit_isBeingScrolledQuickly") ^ 1;
  return result;
}

- (void)avkit_needsUpdateBackdropCaptureViewHidden
{
  id v1;

  objc_msgSend(a1, "superview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");

}

- (uint64_t)avkit_isBeingScrolled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isBeingScrolled");

  return v2;
}

- (uint64_t)avkit_isBeingScrolledQuickly
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isBeingScrolledQuickly");

  return v2;
}

- (id)avkit_backdropGroupLeader
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "avkit_backdropGroupLeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)avkit_ancestorViewPassingTest:()AVAdditions
{
  unsigned int (**v4)(id, void *);
  id v5;
  void *v6;

  v4 = a3;
  if (v4[2](v4, a1))
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avkit_ancestorViewPassingTest:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (uint64_t)avkit_isAncestorOfViewPassingTest:()AVAdditions
{
  uint64_t (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((v4[2](v4, a1) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "avkit_isAncestorOfViewPassingTest:", v4) & 1) != 0)
          {
            v5 = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (uint64_t)avkit_isDescendantOfViewPassingTest:()AVAdditions
{
  uint64_t (**v4)(id, void *);
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((v4[2](v4, a1) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "avkit_isDescendantOfViewPassingTest:", v4);

  }
  return v5;
}

- (id)avkit_hitTestControlForPoint:()AVAdditions withEvent:
{
  id v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "avkit_hitTestControlForPoint:withEvent:bestSoFar:shortestDistanceSoFar:", a3, &v4, &v5);
  return v4;
}

- (void)avkit_hitTestControlForPoint:()AVAdditions withEvent:bestSoFar:shortestDistanceSoFar:
{
  id v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
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
  int v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGPoint v52;
  CGRect v53;
  CGRect v54;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  if ((objc_msgSend(a1, "isHidden") & 1) != 0)
    goto LABEL_24;
  if (!objc_msgSend(a1, "isUserInteractionEnabled"))
    goto LABEL_24;
  objc_msgSend(a1, "bounds");
  if (CGRectIsEmpty(v53))
    goto LABEL_24;
  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "opacity");
  v16 = v15;

  if (v16 <= 0.05)
    goto LABEL_24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v12, "type") == 11)
  {
    objc_msgSend(a1, "hitTest:withEvent:", v12, a2, a3);
    v17 = objc_claimAutoreleasedReturnValue();
    if ((void *)v17 == a1)
    {

    }
    else
    {
      v18 = (void *)v17;
      objc_msgSend(a1, "hitRect");
      v52.x = a2;
      v52.y = a3;
      v19 = CGRectContainsPoint(v54, v52);

      if (!v19)
        goto LABEL_16;
    }
    objc_msgSend(a1, "bounds");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "bounds");
      objc_msgSend(a1, "trackRectForBounds:");
      v44 = v21;
      v45 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(a1, "bounds");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      objc_msgSend(a1, "value");
      LODWORD(v43) = v34;
      objc_msgSend(a1, "thumbRectForBounds:trackRect:value:", v27, v29, v31, v33, v45, v44, v23, v25, v43);
      objc_msgSend(a1, "_thumbHitEdgeInsets");
    }
    UIDistanceBetweenPointAndRect();
    UIRoundToViewScale();
    v36 = v35;
    if (v35 <= *a7)
    {
      *a6 = objc_retainAutorelease(a1);
      *a7 = v36;
    }
  }
LABEL_16:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(a1, "subviews");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(a1, "convertPoint:toView:", v42, a2, a3);
        objc_msgSend(v42, "avkit_hitTestControlForPoint:withEvent:bestSoFar:shortestDistanceSoFar:", v12, a6, a7);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v39);
  }

LABEL_24:
}

- (double)avkit_overrideLayoutMarginsForCounterRotation
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avkit_overrideLayoutMarginsForCounterRotation");
    v5 = v4;

  }
  else
  {
    v5 = 2.22507386e-308;
  }

  return v5;
}

- (uint64_t)avkit_isCounterRotatedForTransition
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isCounterRotatedForTransition");

  return v2;
}

- (uint64_t)avkit_isBeingDismissed
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isBeingDismissed");

  return v2;
}

- (uint64_t)avkit_isBeingScrollTested
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isBeingScrollTested");

  return v2;
}

- (uint64_t)avkit_isInAScrollView
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_isInAScrollView");

  return v2;
}

- (uint64_t)avkit_hasFullScreenLayoutClass
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "avkit_hasFullScreenLayoutClass");

  return v2;
}

- (double)avkit_portionOfFrameUnobscuredBySuperviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    y = -100000.0;
    height = 1000000.0;
    width = 1000000.0;
    x = -100000.0;
    do
    {
      objc_msgSend(v12, "bounds");
      objc_msgSend(v12, "convertRect:toView:", 0);
      v32.origin.x = v17;
      v32.origin.y = v18;
      v32.size.width = v19;
      v32.size.height = v20;
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v29 = CGRectIntersection(v28, v32);
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      objc_msgSend(v12, "superview");
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }
    while (v21);
    objc_msgSend(a1, "convertRect:toView:", 0, v3, v5, v7, v9);
    v33.origin.x = v22;
    v33.origin.y = v23;
    v33.size.width = v24;
    v33.size.height = v25;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v31 = CGRectIntersection(v30, v33);
    objc_msgSend(a1, "convertRect:fromView:", 0, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    v3 = v26;
  }

  return v3;
}

- (uint64_t)avkit_setFrame:()AVAdditions inLayoutDirection:
{
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  if (a7 == 1)
  {
    v12 = a1;
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;

    objc_msgSend(v12, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      objc_msgSend(v17, "contentInset");
      v19 = v18;
      v21 = v20;
      objc_msgSend(v17, "bounds");
      v23 = v22 - (v19 + v21);
      objc_msgSend(v17, "contentSize");
      v25 = v24;

      v15 = v23 + fmax(v25 - v23, 0.0);
    }
    a2 = v15 - a2 - a4;

  }
  return objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
}

- (double)avkit_extendedDynamicRangeGain
{
  uint64_t ExtendedDynamicRangeGainFilter;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  ExtendedDynamicRangeGainFilter = -[UIView _getExtendedDynamicRangeGainFilterIndex](a1);
  v3 = 0.0;
  if (ExtendedDynamicRangeGainFilter != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = ExtendedDynamicRangeGainFilter;
    objc_msgSend(a1, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0CD2CB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v3 = v9;

  }
  return v3;
}

- (void)setAvkit_extendedDynamicRangeGain:()AVAdditions
{
  float v4;
  float v5;
  uint64_t ExtendedDynamicRangeGainFilter;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a2;
  v5 = fabsf(v4);
  ExtendedDynamicRangeGainFilter = -[UIView _getExtendedDynamicRangeGainFilterIndex](a1);
  v7 = ExtendedDynamicRangeGainFilter;
  if (v4 > 0.0 && v5 >= 0.00000011921)
  {
    objc_msgSend(a1, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C78]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2CA8]);
      objc_msgSend(v10, "setName:", CFSTR("AVExtendedDynamicRangeGain.filter"));
      objc_msgSend(v21, "filters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      v13 = v12;
      if (v12)
        v14 = v12;
      else
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v18 = v14;

      objc_msgSend(v18, "addObject:", v10);
      v7 = objc_msgSend(v18, "count") - 1;
      objc_msgSend(v21, "setFilters:", v18);

      v9 = v21;
    }
    objc_msgSend(v9, "filters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v20, *MEMORY[0x1E0CD2CB8]);

    goto LABEL_18;
  }
  if (ExtendedDynamicRangeGainFilter != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "layer");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "removeObjectAtIndex:", v7);
    if (objc_msgSend(v16, "count"))
      v17 = v16;
    else
      v17 = 0;
    objc_msgSend(v21, "setFilters:", v17);
LABEL_18:

  }
}

@end

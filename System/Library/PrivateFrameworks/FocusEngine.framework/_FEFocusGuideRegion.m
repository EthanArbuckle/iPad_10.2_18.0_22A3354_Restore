@implementation _FEFocusGuideRegion

- (_FEFocusGuideRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  _FEFocusGuideRegion *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_FEFocusGuideRegion;
  result = -[_FEFocusRegion initWithFrame:coordinateSpace:](&v5, sel_initWithFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->__focusPriority = 500.0;
  return result;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_FEFocusGuideRegion;
  -[_FEFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v9, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusGuideRegion delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v6);

  -[_FEFocusGuideRegion owningEnvironment](self, "owningEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOwningEnvironment:", v7);

  objc_msgSend(v5, "_setIsUnoccludable:", -[_FEFocusGuideRegion _isUnoccludable](self, "_isUnoccludable"));
  -[_FEFocusGuideRegion _focusPriority](self, "_focusPriority");
  objc_msgSend(v5, "_setFocusPriority:");
  objc_msgSend(v5, "_setIgnoresSpeedBumpEdges:", -[_FEFocusGuideRegion _ignoresSpeedBumpEdges](self, "_ignoresSpeedBumpEdges"));
  objc_msgSend(v5, "_setIsUnclippable:", -[_FEFocusGuideRegion _isUnclippable](self, "_isUnclippable"));
  return v5;
}

- (BOOL)_isEnabledForFocusedRegion:(id)a3 inSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  char v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  BOOL v35;
  CGFloat v36;
  CGFloat v37;
  BOOL v38;
  CGFloat v39;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  if (!a3)
    return 1;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "originalRegionForRegion:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotFrameForRegion:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "snapshotFrameForRegion:", v7);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v43.origin.x = v10;
  v43.origin.y = v12;
  v43.size.width = v14;
  v43.size.height = v16;
  if (CGRectIsNull(v43)
    || (v44.origin.x = v18, v44.origin.y = v20, v44.size.width = v22, v44.size.height = v24, CGRectIsNull(v44)))
  {
    v25 = 1;
  }
  else
  {
    v45.origin.x = v10;
    v45.origin.y = v12;
    v45.size.width = v14;
    v45.size.height = v16;
    v46 = CGRectStandardize(v45);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = v24;
    v47 = CGRectStandardize(v46);
    v30 = v47.origin.x;
    v31 = v47.origin.y;
    v32 = v47.size.width;
    v33 = v47.size.height;
    v41 = y;
    v42 = x;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v34 = CGRectGetMinX(v47) + 0.0001;
    v48.origin.x = v30;
    v48.origin.y = v31;
    v48.size.width = v32;
    v48.size.height = v33;
    if (v34 <= CGRectGetMaxX(v48))
    {
      v49.origin.y = v41;
      v49.origin.x = x;
      v49.size.width = width;
      v49.size.height = height;
      v36 = CGRectGetMaxX(v49) + -0.0001;
      v50.origin.x = v30;
      v50.origin.y = v31;
      v50.size.width = v32;
      v50.size.height = v33;
      v35 = v36 >= CGRectGetMinX(v50);
    }
    else
    {
      v35 = 0;
    }
    v51.origin.x = x;
    v51.origin.y = v41;
    v51.size.width = width;
    v51.size.height = height;
    v37 = CGRectGetMinY(v51) + 0.0001;
    v52.origin.x = v30;
    v52.origin.y = v31;
    v52.size.width = v32;
    v52.size.height = v33;
    if (v37 <= CGRectGetMaxY(v52))
    {
      v53.origin.x = v42;
      v53.origin.y = v41;
      v53.size.width = width;
      v53.size.height = height;
      v39 = CGRectGetMaxY(v53) + -0.0001;
      v54.origin.x = v30;
      v54.origin.y = v31;
      v54.size.width = v32;
      v54.size.height = v33;
      v38 = v39 >= CGRectGetMinY(v54);
    }
    else
    {
      v38 = 0;
    }
    v25 = !v35 || !v38;
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_FEFocusGuideRegion;
  if (-[_FEFocusRegion isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_loadWeakRetained(v5 + 7);
    if (WeakRetained == v7)
    {
      v9 = objc_loadWeakRetained((id *)&self->_owningEnvironment);
      v10 = objc_loadWeakRetained(v5 + 8);
      v8 = v9 == v10
        && self->__isUnoccludable == *((unsigned __int8 *)v5 + 48)
        && self->__focusPriority == *((float *)v5 + 13)
        && self->__ignoresSpeedBumpEdges == *((unsigned __int8 *)v5 + 49)
        && self->__isUnclippable == *((unsigned __int8 *)v5 + 50);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_canOccludeRegionsBelow
{
  return 0;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  return !-[_FEFocusGuideRegion _isUnoccludable](self, "_isUnoccludable");
}

- (BOOL)_shouldCropRegionToSearchArea
{
  return 1;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _UIDeepestPreferredEnvironmentSearch *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "focusedItemInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_FEFocusGuideRegion _isEnabledForFocusedRegion:inSnapshot:](self, "_isEnabledForFocusedRegion:inSnapshot:", v12, v10);

  if (v13)
  {
    -[_FEFocusGuideRegion _delegatePreferredFocusEnvironmentsForMovementRequest:](self, "_delegatePreferredFocusEnvironmentsForMovementRequest:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      -[_FEFocusGuideRegion owningEnvironment](self, "owningEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _FEFocusEnvironmentPreferredFocusEnvironments(v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    v17 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          -[_UIDeepestPreferredEnvironmentSearch deepestPreferredFocusableItemForEnvironment:withRequest:](v17, "deepestPreferredFocusableItemForEnvironment:withRequest:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), v8, (_QWORD)v26);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)v23;

            goto LABEL_15;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v20)
          continue;
        break;
      }
    }

    -[_FEFocusGuideRegion _fallbackFocusItemForMovementRequest:inFocusMap:withSnapshot:](self, "_fallbackFocusItemForMovementRequest:inFocusMap:withSnapshot:", v8, v9, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  return 0;
}

- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_FEFocusGuideRegion delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "focusItemForSorting");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_FEFocusGuideRegion;
    -[_FEFocusRegion _focusedItemForLinearSorting:inMap:withSnapshot:](&v15, sel__focusedItemForLinearSorting_inMap_withSnapshot_, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  return 0;
}

- (unint64_t)_focusableBoundaries
{
  return 32;
}

- (int64_t)_preferredDistanceComparisonType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_FEFocusGuideRegion;
  return -[_FEFocusRegion _preferredDistanceComparisonType](&v3, sel__preferredDistanceComparisonType);
}

- (void)_willParticipateAsDestinationRegionInFocusUpdate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_FEFocusGuideRegion delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "focusGuideRegion:willParticipateAsDestinationRegionInFocusUpdate:", self, v6);
  }
  else
  {
    objc_msgSend(v6, "_focusedGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(v6, "_setFocusRedirectedByGuide:", 1);
  }

}

- (id)_delegatePreferredFocusEnvironmentsForMovementRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_FEFocusGuideRegion delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "focusGuideRegion:preferredFocusEnvironmentsForMovementRequest:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v8 = v7;

  return v8;
}

- (id)_debugAssociatedObject
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusedRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = -[_FEFocusGuideRegion _isEnabledForFocusedRegion:inSnapshot:](self, "_isEnabledForFocusedRegion:inSnapshot:", v6, v7);
  if ((_DWORD)v4)
  {
    +[_FEFocusRegionDebugDrawingConfiguration guideConfigurationForRegion:](_FEFocusRegionDebugDrawingConfiguration, "guideConfigurationForRegion:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_FEFocusGuideRegionDelegate)delegate
{
  return (_FEFocusGuideRegionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_FEFocusEnvironment)owningEnvironment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_owningEnvironment);
}

- (void)setOwningEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_owningEnvironment, a3);
}

- (BOOL)_isUnoccludable
{
  return self->__isUnoccludable;
}

- (void)_setIsUnoccludable:(BOOL)a3
{
  self->__isUnoccludable = a3;
}

- (float)_focusPriority
{
  return self->__focusPriority;
}

- (void)_setFocusPriority:(float)a3
{
  self->__focusPriority = a3;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return self->__ignoresSpeedBumpEdges;
}

- (void)_setIgnoresSpeedBumpEdges:(BOOL)a3
{
  self->__ignoresSpeedBumpEdges = a3;
}

- (BOOL)_isUnclippable
{
  return self->__isUnclippable;
}

- (void)_setIsUnclippable:(BOOL)a3
{
  self->__isUnclippable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningEnvironment);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

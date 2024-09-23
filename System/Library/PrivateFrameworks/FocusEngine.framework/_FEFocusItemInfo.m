@implementation _FEFocusItemInfo

+ (_FEFocusItemInfo)infoWithItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithItem:containingView:useFallbackAncestorScroller:", v4, 0, 0);

  return (_FEFocusItemInfo *)v5;
}

+ (_FEFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithItem:containingView:useFallbackAncestorScroller:", v6, 0, v4);

  return (_FEFocusItemInfo *)v7;
}

- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  _FEFocusItemInfo *v8;
  _FEFocusItemInfo *v9;
  char v10;
  objc_super v12;

  v5 = a5;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_FEFocusItemInfo;
  v8 = -[_FEFocusItemInfo init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v7);
    v9->_inheritedFocusMovementStyle = 0;
    if (v5)
      v10 = 16;
    else
      v10 = 0;
    *(_BYTE *)&v9->_flags = *(_BYTE *)&v9->_flags & 0xEF | v10;
  }

  return v9;
}

- (NSArray)ancestorEnvironmentScrollableContainers
{
  NSArray *ancestorEnvironmentScrollableContainers;
  id WeakRetained;
  NSArray *v5;
  NSArray *v6;

  ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  if (!ancestorEnvironmentScrollableContainers)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    _FEFocusAncestorEnvironmentScrollableContainers(WeakRetained, (*(_BYTE *)&self->_flags >> 4) & 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_ancestorEnvironmentScrollableContainers;
    self->_ancestorEnvironmentScrollableContainers = v5;

    ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  }
  return ancestorEnvironmentScrollableContainers;
}

- (int64_t)inheritedFocusMovementStyle
{
  int64_t result;
  void *v4;
  void *v5;

  result = self->_inheritedFocusMovementStyle;
  if (!result)
  {
    -[_FEFocusItemInfo item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_FEFocusItemInfo item](self, "item");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inheritedFocusMovementStyle = _FEFocusEnvironmentInheritedFocusMovementStyle(v5);

      return self->_inheritedFocusMovementStyle;
    }
    else
    {
      result = 1;
      self->_inheritedFocusMovementStyle = 1;
    }
  }
  return result;
}

- (int64_t)focusTouchSensitivityStyle
{
  void *v3;
  int64_t v4;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    -[_FEFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_FEFocusItemIsViewOrRespondsToSelector(v3))
      v4 = objc_msgSend(v3, "_focusTouchSensitivityStyle");
    else
      v4 = 0;
    self->_focusTouchSensitivityStyle = v4;
    *(_BYTE *)&self->_flags |= 1u;

  }
  return self->_focusTouchSensitivityStyle;
}

- (int64_t)rotaryFocusMovementAxis
{
  void *v3;

  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    -[_FEFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rotaryFocusMovementAxis = _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(v3, 0);

    *(_BYTE *)&self->_flags |= 8u;
  }
  return self->_rotaryFocusMovementAxis;
}

- (BOOL)isFocusMovementFlippedHorizontally
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    -[_FEFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54___FEFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke;
    v5[3] = &unk_250D3A1E0;
    v5[4] = &v6;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v3, v5);

    *((_BYTE *)&self->_flags + 1) = *((_BYTE *)v7 + 24);
    *(_BYTE *)&self->_flags |= 2u;
    _Block_object_dispose(&v6, 8);
  }
  return *((_BYTE *)&self->_flags + 1);
}

- (BOOL)useFallbackAncestorScroller
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (_FEFocusRegion)focusedRegion
{
  _FEFocusRegion *v3;
  _FEFocusRegion *focusedRegion;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    -[_FEFocusItemInfo _createFocusedRegion](self, "_createFocusedRegion");
    v3 = (_FEFocusRegion *)objc_claimAutoreleasedReturnValue();
    focusedRegion = self->_focusedRegion;
    self->_focusedRegion = v3;

    *(_BYTE *)&self->_flags |= 4u;
  }
  return self->_focusedRegion;
}

- (id)_createFocusedRegion
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  _FEFocusItemRegion *v23;
  void *v25;
  _FEFocusItemRegion *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    v23 = 0;
    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "_parentFocusEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
    && _FEFocusItemIsViewOrRespondsToSelector(v5))
  {
    objc_msgSend(v6, "_focusItemContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_6;
    objc_msgSend(v7, "_focusCoordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _FEFocusItemFrameInCoordinateSpace(v5, v9);
    _FEFocusRectWithMinimumSize(v10, v11, v12, v13);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v47.origin.x = v15;
    v47.origin.y = v17;
    v47.size.width = v19;
    v47.size.height = v21;
    if (!CGRectIsNull(v47))
    {
      +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x24BDD17C8];
        v36 = v5;
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p>"), v38, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemInfo.m"), 191, CFSTR("Unable to find focus system for item %@"), v39);
      }
      v26 = [_FEFocusItemRegion alloc];
      objc_msgSend(v8, "_focusCoordinateSpace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v26, "initWithFrame:coordinateSpace:item:focusSystem:", v27, v5, v25, v15, v17, v19, v21);

      if (v23)
        goto LABEL_10;
    }
    else
    {
LABEL_6:

    }
  }
  logger();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_parentFocusEnvironment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "debugDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_parentFocusEnvironment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_focusItemContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "debugDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v28;
    v42 = 2112;
    v43 = v30;
    v44 = 2112;
    v45 = v33;
    _os_log_fault_impl(&dword_23C48C000, v22, OS_LOG_TYPE_FAULT, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);

  }
  v23 = 0;
LABEL_10:

LABEL_12:
  return v23;
}

- (CGRect)focusedRectInCoordinateSpace:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
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
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  -[_FEFocusItemInfo focusedRegion](self, "focusedRegion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    +[_FEFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_FEFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v5, v4);
    _FEFocusRectWithMinimumSize(v7, v8, v9, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v12 = *MEMORY[0x24BDBF070];
    v14 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)invalidateFocusedRegion
{
  _FEFocusRegion *focusedRegion;

  focusedRegion = self->_focusedRegion;
  self->_focusedRegion = 0;

  *(_BYTE *)&self->_flags &= ~4u;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; item = %@, focusedRegion = %@>"),
    v4,
    self,
    WeakRetained,
    self->_focusedRegion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  _FEFocusRegion *focusedRegion;
  void *v11;
  _FEFocusRegion *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_loadWeakRetained((id *)&self->_item);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }

  focusedRegion = self->_focusedRegion;
  if (focusedRegion)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = focusedRegion;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; item = %@, focusedRegion = %@>"), v4, self, v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_FEFocusItem)item
{
  return (_FEFocusItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_ancestorEnvironmentScrollableContainers, 0);
}

@end

@implementation _FEFocusMapSnapshotter

- (_FEFocusMapSnapshotter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshotter.m"), 38, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_FEFocusMapSnapshotter)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _FEFocusMapSnapshotter *v17;
  _FEFocusMapSnapshotter *v18;
  CGSize v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshotter.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootContainer"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshotter.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshotter.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_FEFocusMapSnapshotter;
  v17 = -[_FEFocusMapSnapshotter init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_focusSystem, v13);
    objc_storeWeak((id *)&v18->_rootContainer, v14);
    objc_storeWeak((id *)&v18->_coordinateSpace, v15);
    v19 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v18->_snapshotFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v18->_snapshotFrame.size = v19;
    v18->_snapshotFrameIsEmpty = 1;
    v18->_ignoresRootContainerClippingRect = a7;
    v18->_clipToSnapshotRect = 1;
    objc_storeStrong((id *)&v18->_searchInfo, a6);
  }

  return v18;
}

- (void)setSnapshotFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_snapshotFrame, a3))
  {
    self->_snapshotFrame.origin.x = x;
    self->_snapshotFrame.origin.y = y;
    self->_snapshotFrame.size.width = width;
    self->_snapshotFrame.size.height = height;
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    self->_snapshotFrameIsEmpty = CGRectIsEmpty(v8);
  }
}

- (id)_searchAreaForContainerSearchRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id WeakRetained;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  _FEFocusRegion *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  _FEFocusMapRect *v44;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  objc_msgSend(WeakRetained, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if ((_FERectSmartIntersectsRect(v9, v11, v13, v15, x, y, width, height) & 1) == 0)
  {
    x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v10, v12, v14, v16);
    y = v17;
    width = v18;
    height = v19;
  }
  v20 = self->_focusedRegion;
  if (v20)
  {
    +[_FEFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_FEFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v20, WeakRetained);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    if ((_FERectSmartIntersectsRect(v21, v23, v25, v27, x, y, width, height) & 1) == 0)
    {
      x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v22, v24, v26, v28);
      y = v29;
      width = v30;
      height = v31;
    }
  }
  v32 = objc_loadWeakRetained((id *)&self->_rootContainer);
  _FEFocusItemSafeCast(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = _FEFocusItemFrameInCoordinateSpace(v33, WeakRetained);
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v46.origin.x = v34;
  v46.origin.y = v36;
  v46.size.width = v38;
  v46.size.height = v40;
  if (!CGRectIsNull(v46) && (_FERectSmartIntersectsRect(v34, v36, v38, v40, x, y, width, height) & 1) == 0)
  {
    x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v34, v36, v38, v40);
    y = v41;
    width = v42;
    height = v43;
  }
  v44 = -[_FEFocusMapRect initWithFrame:coordinateSpace:]([_FEFocusMapRect alloc], "initWithFrame:coordinateSpace:", WeakRetained, x, y, width, height);

  return v44;
}

- (id)captureSnapshot
{
  id WeakRetained;
  void *v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  _FEFocusMapRect *v13;
  void *v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  v4 = WeakRetained;
  if (self->_snapshotFrameIsEmpty)
  {
    objc_msgSend(WeakRetained, "bounds");
    x = v5;
    y = v7;
    width = v9;
    height = v11;
  }
  else
  {
    x = self->_snapshotFrame.origin.x;
    y = self->_snapshotFrame.origin.y;
    width = self->_snapshotFrame.size.width;
    height = self->_snapshotFrame.size.height;
  }
  v13 = -[_FEFocusMapRect initWithFrame:coordinateSpace:]([_FEFocusMapRect alloc], "initWithFrame:coordinateSpace:", v4, x, y, width, height);
  -[_FEFocusMapSnapshotter _searchAreaForContainerSearchRect:](self, "_searchAreaForContainerSearchRect:", x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_FEFocusMapSnapshot _initWithSnapshotter:mapArea:searchArea:]([_FEFocusMapSnapshot alloc], "_initWithSnapshotter:mapArea:searchArea:", self, v13, v14);

  return v15;
}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (_FEFocusRegionContainer)rootContainer
{
  return (_FEFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_rootContainer);
}

- (_FECoordinateSpace)coordinateSpace
{
  return (_FECoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (_FEFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (void)setFocusedRegion:(id)a3
{
  objc_storeStrong((id *)&self->_focusedRegion, a3);
}

- (_FEFocusRegionContainer)regionsContainer
{
  return (_FEFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_regionsContainer);
}

- (void)setRegionsContainer:(id)a3
{
  objc_storeWeak((id *)&self->_regionsContainer, a3);
}

- (_FEFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (_FEFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_movementInfo, a3);
}

- (CGRect)snapshotFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotFrame.origin.x;
  y = self->_snapshotFrame.origin.y;
  width = self->_snapshotFrame.size.width;
  height = self->_snapshotFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (BOOL)ignoresRootContainerClippingRect
{
  return self->_ignoresRootContainerClippingRect;
}

- (void)setIgnoresRootContainerClippingRect:(BOOL)a3
{
  self->_ignoresRootContainerClippingRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end

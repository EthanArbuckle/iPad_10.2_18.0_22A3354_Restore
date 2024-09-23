@implementation AVTCenteringCollectionViewDelegate

- (AVTCenteringCollectionViewDelegate)initWithCollectionView:(id)a3 delegate:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTCenteringCollectionViewDelegate *v12;
  AVTCenteringCollectionViewDelegate *v13;
  uint64_t v14;
  AVTUILogger *logger;
  uint64_t v16;
  NSIndexPath *lastHapticOnScrollIndexPath;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTCenteringCollectionViewDelegate;
  v12 = -[AVTCenteringCollectionViewDelegate init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collectionView, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_msgSend(v11, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    lastHapticOnScrollIndexPath = v13->_lastHapticOnScrollIndexPath;
    v13->_lastHapticOnScrollIndexPath = (NSIndexPath *)v16;

  }
  return v13;
}

- (UICollectionViewLayoutAttributes)centerItemAttributes
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCenteringCollectionViewDelegate lastHapticOnScrollIndexPath](self, "lastHapticOnScrollIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionViewLayoutAttributes *)v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTCenteringCollectionViewDelegate;
  if (-[AVTCenteringCollectionViewDelegate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTCenteringCollectionViewDelegate;
  -[AVTCenteringCollectionViewDelegate methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  objc_super v9;

  -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTCenteringCollectionViewDelegate;
    -[AVTCenteringCollectionViewDelegate forwardingTargetForSelector:](&v9, sel_forwardingTargetForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  objc_msgSend(v8, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v9, v12, v14, v16, v17);
  v19 = v18;
  v21 = v20;

  if (v19 == *MEMORY[0x1E0C9D538] && v21 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[AVTCenteringCollectionViewDelegate logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logCarouselErrorGettingFrameForElementAtIndex:", objc_msgSend(v6, "item"));

  }
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v27, v19, v21);
  objc_msgSend(v27, "setContentOffset:animated:", 1);
  -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "collectionView:didSelectItemAtIndexPath:", v27, v6);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCenteringCollectionViewDelegate setLastHapticOnScrollIndexPath:](self, "setLastHapticOnScrollIndexPath:", v10);

  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

  -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollViewWillBeginDragging:", v15);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  double MidX;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  CGRect v35;

  v34 = a3;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCenteringCollectionViewDelegate lastHapticOnScrollIndexPath](self, "lastHapticOnScrollIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v10);

  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    objc_msgSend(v13, "collectionViewLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutAttributesForItemAtIndexPath:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    MidX = CGRectGetMidX(v35);

    objc_msgSend(v17, "center");
    v22 = v21;
    -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentOffset");
    v25 = v24;
    -[AVTCenteringCollectionViewDelegate previousOffset](self, "previousOffset");
    v27 = v26;

    if (v25 <= v27)
      v28 = MidX > v22 + 10.0;
    else
      v28 = MidX < v22 + -10.0;
    -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contentOffset");
    -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

    if (objc_msgSend(v34, "avtui_isMoving") && !v28)
    {
      objc_msgSend(v17, "indexPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTCenteringCollectionViewDelegate setLastHapticOnScrollIndexPath:](self, "setLastHapticOnScrollIndexPath:", v30);

    }
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "scrollViewDidScroll:", v34);

    }
    goto LABEL_12;
  }
  objc_msgSend(v13, "contentOffset");
  -[AVTCenteringCollectionViewDelegate setPreviousOffset:](self, "setPreviousOffset:");

  -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrollViewDidScroll:", v34);
LABEL_12:

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  void *v32;
  double v33;
  unint64_t v34;
  _BOOL8 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  id v80;

  y = a4.y;
  x = a4.x;
  v80 = a3;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v9, a5->x, a5->y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "item");
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  objc_msgSend(v12, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13, v16, v18, v20, v21);
  v23 = v22;
  v25 = v24;

  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v26, v23, v25);
  v28 = v27;
  v30 = v29;

  v31 = fabs(x);
  -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentOffset");
  v34 = COERCE_UNSIGNED_INT64(v28 - v33) >> 63;

  v36 = v31 > 0.3 && *(_QWORD *)&x >> 63 != (_DWORD)v34;
  objc_msgSend(v80, "contentOffset");
  v38 = v37;
  objc_msgSend(v80, "contentInset");
  if (v38 > -v39)
  {
    objc_msgSend(v80, "contentOffset");
    v41 = v40;
    objc_msgSend(v80, "contentSize");
    v43 = v42;
    objc_msgSend(v80, "bounds");
    v45 = v43 - v44;
    v46 = v31 > 1.3 || v36;
    if (v46 && v41 < v45)
    {
      v48 = a5->x;
      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView", v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "contentOffset");
      v51 = v50;

      v52 = (void *)MEMORY[0x1E0CB36B0];
      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "numberOfItemsInSection:", 0) - 1;

      v55 = objc_msgSend(v10, "item");
      v56 = v55 - 1;
      if (v48 > v51)
        v56 = v55 + 1;
      if (v54 < v56)
        v56 = v54;
      objc_msgSend(v52, "indexPathForItem:inSection:", v56 & ~(v56 >> 63), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "collectionViewLayout");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v57, "item");
      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "bounds");
      v63 = v62;
      v65 = v64;
      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "bounds");
      objc_msgSend(v59, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v60, v63, v65, v67, v68);
      v70 = v69;
      v72 = v71;

      -[AVTCenteringCollectionViewDelegate collectionView](self, "collectionView");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v73, v70, v72);
      v28 = v74;
      v30 = v75;

      v10 = v57;
    }
  }
  -[AVTCenteringCollectionViewDelegate logger](self, "logger");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "logCarouselEndsDraggingWithVelocity:willSwitchIndexPathInsteadOfScrollBack:forHighVelocity:", v36, v31 > 1.3, x);

  a5->x = v28;
  a5->y = v30;
  -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_opt_respondsToSelector();

  if ((v78 & 1) != 0)
  {
    -[AVTCenteringCollectionViewDelegate delegate](self, "delegate");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v80, a5, x, y);

  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDelegate)delegate
{
  return (UICollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGPoint)previousOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousOffset.x;
  y = self->_previousOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousOffset:(CGPoint)a3
{
  self->_previousOffset = a3;
}

- (NSIndexPath)lastHapticOnScrollIndexPath
{
  return self->_lastHapticOnScrollIndexPath;
}

- (void)setLastHapticOnScrollIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastHapticOnScrollIndexPath, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lastHapticOnScrollIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end

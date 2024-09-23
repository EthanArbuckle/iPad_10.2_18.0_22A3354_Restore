@implementation SFCapsuleCollectionViewItem

- (void)setCapsuleContentIsValid:(BOOL)a3
{
  self->_capsuleContentIsValid = a3;
}

- (SFCapsuleView)capsuleView
{
  return (SFCapsuleView *)objc_loadWeakRetained((id *)&self->_capsuleView);
}

- (double)capsuleHeightForWidth:(double)a3 defaultHeight:(double)a4 state:(int64_t)a5 index:(int64_t)a6
{
  id WeakRetained;
  id v12;
  NSMutableDictionary *cachedContentSizesByState;
  void *v14;
  void *v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  double Height;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  _QWORD v31[2];
  CGRect v32;
  CGRect v33;

  WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleView);
  v12 = objc_loadWeakRetained((id *)&self->_collectionView);
  cachedContentSizesByState = self->_cachedContentSizesByState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedContentSizesByState, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 || !objc_msgSend(v12, "_suppressingDataSourceCalls"))
  {
    objc_msgSend(WeakRetained, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGSizeValue");
    v19 = v18;
    v22 = v20 != a3 || v15 == 0;
    if (v17 && v22)
    {
      objc_msgSend(v12, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v12, "numberOfItems");
      v19 = a4;
      if (v24 != a6)
      {
        v25 = v24;
        v19 = a4;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (v25 >= a6)
          {
            objc_msgSend(v23, "capsuleCollectionView:heightForItemAtIndex:width:state:", v12, a6, a5, a3);
          }
          else
          {
            objc_msgSend(WeakRetained, "bounds");
            Height = CGRectGetHeight(v33);
          }
          v19 = Height;
        }
      }
      *(double *)v31 = a3;
      *(double *)&v31[1] = v19;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v31, "{CGSize=dd}");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = self->_cachedContentSizesByState;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v27, v29);

    }
    if (v19 > 0.0)
      a4 = v19;

  }
  else
  {
    objc_msgSend(WeakRetained, "bounds");
    v16 = CGRectGetHeight(v32);
    if (v16 != 0.0)
      a4 = v16;
  }

  return a4;
}

- (void)setCapsuleView:(id)a3
{
  objc_storeWeak((id *)&self->_capsuleView, a3);
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)invalidateCapsuleHeight
{
  -[NSMutableDictionary removeAllObjects](self->_cachedContentSizesByState, "removeAllObjects");
}

- (SFCapsuleCollectionViewItem)initWithCollectionView:(id)a3
{
  id v4;
  SFCapsuleCollectionViewItem *v5;
  SFCapsuleCollectionViewItem *v6;
  uint64_t v7;
  NSMutableDictionary *cachedContentSizesByState;
  SFCapsuleCollectionViewItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCapsuleCollectionViewItem;
  v5 = -[SFCapsuleCollectionViewItem init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    cachedContentSizesByState = v6->_cachedContentSizesByState;
    v6->_cachedContentSizesByState = (NSMutableDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)capsuleIsDetached
{
  return self->_capsuleIsDetached;
}

- (BOOL)capsuleContentIsValid
{
  return self->_capsuleContentIsValid;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (SFCapsuleCollectionView)collectionView
{
  return (SFCapsuleCollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCapsuleIsDetached:(BOOL)a3
{
  self->_capsuleIsDetached = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_capsuleView);
  objc_storeStrong((id *)&self->_cachedContentSizesByState, 0);
}

@end

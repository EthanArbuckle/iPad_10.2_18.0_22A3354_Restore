@implementation ASVGesture

- (ASVGesture)initWithDataSource:(id)a3
{
  id v4;
  ASVGesture *v5;
  ASVGesture *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASVGesture;
  v5 = -[ASVGesture init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    objc_msgSend(v4, "assetScreenPosition");
    *(_QWORD *)v6->_initialAssetLocationOnScreen = v7;
    *(_QWORD *)v6->_latestAssetLocationOnScreen = v7;
  }

  return v6;
}

- (ASVGestureDataSource)dataSource
{
  return (ASVGestureDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)firstTouchWasOnAsset
{
  return self->_firstTouchWasOnAsset;
}

- (void)setFirstTouchWasOnAsset:(BOOL)a3
{
  self->_firstTouchWasOnAsset = a3;
}

- (double)initialAssetLocationOnScreen
{
  return *(double *)(a1 + 24);
}

- (void)setInitialAssetLocationOnScreen:(ASVGesture *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialAssetLocationOnScreen = v2;
}

- (double)latestAssetLocationOnScreen
{
  return *(double *)(a1 + 32);
}

- (void)setLatestAssetLocationOnScreen:(ASVGesture *)self
{
  uint64_t v2;

  *(_QWORD *)self->_latestAssetLocationOnScreen = v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end

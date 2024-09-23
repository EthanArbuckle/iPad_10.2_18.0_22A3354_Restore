@implementation LACUIPackagedView

- (LACUIPackagedView)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  LACUIPackagedView *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  CALayer *rootLayer;
  void *v14;
  void *v15;
  LACUIPackagedViewStateController *v16;
  LACUIPackagedViewStateController *stateController;
  LACUIPackagedView *v18;
  NSObject *v19;
  id v21;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LACUIPackagedView;
  v7 = -[LACUIPackagedView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (!v7)
    goto LABEL_6;
  v8 = *MEMORY[0x24BDE5D50];
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v6, v8, 0, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (v9)
  {
    objc_msgSend(v9, "rootLayer");
    v12 = objc_claimAutoreleasedReturnValue();
    rootLayer = v7->_rootLayer;
    v7->_rootLayer = (CALayer *)v12;

    -[CALayer setGeometryFlipped:](v7->_rootLayer, "setGeometryFlipped:", objc_msgSend(v9, "isGeometryFlipped"));
    -[LACUIPackagedView layer](v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 0);

    -[LACUIPackagedView layer](v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v7->_rootLayer);

    v16 = -[LACUIPackagedViewStateController initWithLayer:]([LACUIPackagedViewStateController alloc], "initWithLayer:", v7->_rootLayer);
    stateController = v7->_stateController;
    v7->_stateController = v16;

LABEL_6:
    v18 = v7;
    goto LABEL_10;
  }
  LA_LOG_LACUIPackagedView();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[LACUIPackagedView initWithURL:error:].cold.1((uint64_t)v6, (uint64_t)v11, v19);

  v18 = 0;
LABEL_10:

  return v18;
}

- (void)setStateNamed:(id)a3 animated:(BOOL)a4
{
  -[LACUIPackagedView setStateNamed:animated:completion:](self, "setStateNamed:animated:completion:", a3, a4, &__block_literal_global_5);
}

- (void)setStateNamed:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LACUIPackagedViewState *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[LACUIPackagedViewState initWithName:]([LACUIPackagedViewState alloc], "initWithName:", v9);

  -[LACUIPackagedView setState:animated:completion:](self, "setState:animated:completion:", v10, v5, v8);
}

- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[LACUIPackagedView _setState:animated:allowRetry:completion:](self, a3, a4, 1, a5);
}

- (void)_setState:(int)a3 animated:(int)a4 allowRetry:(void *)a5 completion:
{
  id v9;
  id v10;
  void *v11;
  dispatch_time_t v12;
  _BOOL8 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  char v22;
  id location;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    if (a3)
    {
      objc_msgSend(a1, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        if (a4)
        {
          objc_initWeak(&location, a1);
          v12 = dispatch_time(0, 10000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __62__LACUIPackagedView__setState_animated_allowRetry_completion___block_invoke;
          block[3] = &unk_2510F8520;
          objc_copyWeak(&v21, &location);
          v19 = v9;
          v22 = a3;
          v20 = v10;
          dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
          goto LABEL_15;
        }
        LA_LOG_LACUIPackagedView();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[LACUIPackagedView _setState:animated:allowRetry:completion:].cold.1((uint64_t)a1, (uint64_t)v9, v15);

      }
      v14 = (void *)a1[52];
      objc_msgSend(a1, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16 != 0;

    }
    else
    {
      v13 = 0;
      v14 = (void *)a1[52];
    }
    if (v10)
      v17 = v10;
    else
      v17 = &__block_literal_global_11;
    objc_msgSend(v14, "setState:animated:completion:", v9, v13, v17);
  }
LABEL_15:

}

- (CGRect)convertRectFromSublayerCoordinates:(CGRect)a3
{
  CALayer *rootLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  rootLayer = self->_rootLayer;
  if (rootLayer)
    -[CALayer transform](rootLayer, "transform", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CA_CGRectApplyTransform();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGPoint)convertPointToSublayerCoordinates:(CGPoint)a3
{
  CALayer *rootLayer;
  double v4;
  double v5;
  CATransform3D v6;
  CATransform3D v7;
  CGPoint result;

  rootLayer = self->_rootLayer;
  if (rootLayer)
    -[CALayer transform](rootLayer, "transform", a3.x, a3.y);
  else
    memset(&v6, 0, sizeof(v6));
  CATransform3DInvert(&v7, &v6);
  CA_CGPointApplyTransform();
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@; %p>"), objc_opt_class(), self);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedView;
  -[LACUIPackagedView layoutSubviews](&v3, sel_layoutSubviews);
  -[LACUIPackagedView _updateRootLayer](self);
}

- (void)_updateRootLayer
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  if (a1)
  {
    v1 = (void *)a1[54];
    objc_msgSend(a1, "bounds");
    LACUILayerScaleToFitInRect(v1, v2, v3, v4, v5);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedView;
  -[LACUIPackagedView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (self->_setInitialStateWhenMovedToWindow)
    -[LACUIPackagedViewStateController setInitialState](self->_stateController, "setInitialState");
}

- (BOOL)_isRendered
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

void __62__LACUIPackagedView__setState_animated_allowRetry_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[LACUIPackagedView _setState:animated:allowRetry:completion:](WeakRetained, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), 0, *(_QWORD *)(a1 + 40));

}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (BOOL)setInitialStateWhenMovedToWindow
{
  return self->_setInitialStateWhenMovedToWindow;
}

- (void)setSetInitialStateWhenMovedToWindow:(BOOL)a3
{
  self->_setInitialStateWhenMovedToWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)initWithURL:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_240AAB000, a2, a3, "Failed to load %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

- (void)_setState:(NSObject *)a3 animated:allowRetry:completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_240AAB000, a2, a3, "%@ animated transition to '%@' state will be skipped because view is not rendered", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end

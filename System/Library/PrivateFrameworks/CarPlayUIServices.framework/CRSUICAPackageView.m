@implementation CRSUICAPackageView

- (CRSUICAPackageView)initWithPackage:(id)a3
{
  return -[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:](self, "initWithPackage:state:dynamicStateProvider:", a3, 0, 0);
}

- (CRSUICAPackageView)initWithPackage:(id)a3 dynamicStateProvider:(id)a4
{
  return -[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:](self, "initWithPackage:state:dynamicStateProvider:", a3, 0, a4);
}

- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4
{
  return -[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:](self, "initWithPackage:state:dynamicStateProvider:", a3, a4, 0);
}

- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4 dynamicStateProvider:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  CRSUICAPackageView *v13;
  CRSUICAPackageView *v14;
  id v15;
  void *v16;
  uint64_t v17;
  CAStateController *stateController;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  id dynamicStateProvider;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    -[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:].cold.1();
  v12 = v11;
  objc_msgSend(v11, "frame");
  v30.receiver = self;
  v30.super_class = (Class)CRSUICAPackageView;
  v13 = -[CRSUICAPackageView initWithFrame:](&v30, sel_initWithFrame_);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_rootLayer, v12);
    v15 = objc_alloc(MEMORY[0x24BDE5788]);
    objc_msgSend(v8, "rootLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithLayer:", v16);
    stateController = v14->_stateController;
    v14->_stateController = (CAStateController *)v17;

    objc_msgSend(v12, "frame");
    v14->_packageSize.width = v19;
    v14->_packageSize.height = v20;
    v21 = MEMORY[0x212BA7864](v10);
    dynamicStateProvider = v14->_dynamicStateProvider;
    v14->_dynamicStateProvider = (id)v21;

    objc_msgSend(v8, "rootLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setGeometryFlipped:", objc_msgSend(v8, "isGeometryFlipped"));

    -[CRSUICAPackageView layer](v14, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v12);

    if (!v9 && v10)
    {
      -[CRSUICAPackageView traitCollection](v14, "traitCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v25);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
      -[CRSUICAPackageView setState:animated:](v14, "setState:animated:", v9, 0);
    if (v10)
    {
      objc_opt_self();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)-[CRSUICAPackageView registerForTraitChanges:withAction:](v14, "registerForTraitChanges:withAction:", v27, sel_userInterfaceStyleChanged);

    }
  }

  return v14;
}

- (void)setState:(id)a3
{
  -[CRSUICAPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSString *v8;
  NSString *state;
  double v10;
  CAStateController *stateController;
  CALayer *rootLayer;

  v4 = a4;
  v6 = a3;
  -[CALayer stateWithName:](self->_rootLayer, "stateWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    state = self->_state;
    self->_state = v8;

    stateController = self->_stateController;
    rootLayer = self->_rootLayer;
    if (v4)
    {
      LODWORD(v10) = 1.0;
      -[CAStateController setState:ofLayer:transitionSpeed:](stateController, "setState:ofLayer:transitionSpeed:", v7, rootLayer, v10);
    }
    else
    {
      -[CAStateController setState:ofLayer:](stateController, "setState:ofLayer:", v7, rootLayer);
    }
  }

  return v7 != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_packageSize.width;
  height = self->_packageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CALayer *rootLayer;
  CATransform3D v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRSUICAPackageView;
  -[CRSUICAPackageView layoutSubviews](&v11, sel_layoutSubviews);
  -[CRSUICAPackageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (-[CRSUICAPackageView contentMode](self, "contentMode"))
  {
    if (-[CRSUICAPackageView contentMode](self, "contentMode") == 1)
    {
      if (v4 / self->_packageSize.width >= v6 / self->_packageSize.height)
        v7 = v6 / self->_packageSize.height;
      else
        v7 = v4 / self->_packageSize.width;
LABEL_11:
      v8 = v7;
      goto LABEL_12;
    }
    v7 = 1.0;
    v8 = 1.0;
    if (-[CRSUICAPackageView contentMode](self, "contentMode") == 2)
    {
      if (v4 / self->_packageSize.width >= v6 / self->_packageSize.height)
        v7 = v4 / self->_packageSize.width;
      else
        v7 = v6 / self->_packageSize.height;
      goto LABEL_11;
    }
  }
  else
  {
    v8 = v4 / self->_packageSize.width;
    v7 = v6 / self->_packageSize.height;
  }
LABEL_12:
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v4 * 0.5, v6 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v10, v8, v7, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v10);
}

- (void)userInterfaceStyleChanged
{
  void (**dynamicStateProvider)(id, id);
  void *v4;
  id v5;

  dynamicStateProvider = (void (**)(id, id))self->_dynamicStateProvider;
  if (dynamicStateProvider)
  {
    -[CRSUICAPackageView traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    dynamicStateProvider[2](dynamicStateProvider, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUICAPackageView setState:animated:](self, "setState:animated:", v4, 0);

  }
}

- (CAPackage)package
{
  return self->_package;
}

- (NSString)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong(&self->_dynamicStateProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
}

- (void)initWithPackage:state:dynamicStateProvider:.cold.1()
{
  __assert_rtn("-[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:]", "CRSUICAPackageView.m", 38, "rootLayer");
}

@end

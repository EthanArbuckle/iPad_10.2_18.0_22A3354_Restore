@implementation AEExplorerGroupingView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEExplorerGroupingView;
  -[AEExplorerGroupingView layoutSubviews](&v3, sel_layoutSubviews);
  -[AEExplorerGroupingView bounds](self, "bounds");
  -[UIView setFrame:](self->_sceneView, "setFrame:");
}

- (void)setSceneView:(id)a3
{
  UIView *v5;
  UIView *sceneView;
  UIView *v7;

  v5 = (UIView *)a3;
  sceneView = self->_sceneView;
  v7 = v5;
  if (sceneView != v5)
  {
    -[UIView removeFromSuperview](sceneView, "removeFromSuperview");
    -[AEExplorerGroupingView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_sceneView, a3);
  }

}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end

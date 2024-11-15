@implementation _MKUIViewControllerRootView

- (_MKUIViewControllerRootView)initWithViewController:(id)a3
{
  id v4;
  _MKUIViewControllerRootView *v5;
  _MKUIViewControllerRootView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKUIViewControllerRootView;
  v5 = -[_MKUIViewControllerRootView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[_MKUIViewControllerRootView _commonInit](v5, "_commonInit");
    -[_MKUIViewControllerRootView setViewController:](v6, "setViewController:", v4);
  }

  return v6;
}

- (_MKUIViewControllerRootView)initWithCoder:(id)a3
{
  _MKUIViewControllerRootView *v3;
  _MKUIViewControllerRootView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKUIViewControllerRootView;
  v3 = -[_MKUIViewControllerRootView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_MKUIViewControllerRootView _commonInit](v3, "_commonInit");
  return v4;
}

- (_MKUIViewControllerRootView)initWithFrame:(CGRect)a3
{
  _MKUIViewControllerRootView *v3;
  _MKUIViewControllerRootView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKUIViewControllerRootView;
  v3 = -[_MKUIViewControllerRootView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_MKUIViewControllerRootView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)setViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_viewController, obj);
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
    v5 = obj;
  }

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end

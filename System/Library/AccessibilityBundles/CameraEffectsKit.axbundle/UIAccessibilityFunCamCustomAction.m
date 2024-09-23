@implementation UIAccessibilityFunCamCustomAction

- (UIAccessibilityFunCamCustomAction)initWithName:(id)a3 target:(id)a4 selector:(SEL)a5 effect:(id)a6 axElement:(id)a7 vc:(id)a8
{
  id v14;
  id v15;
  id v16;
  UIAccessibilityFunCamCustomAction *v17;
  UIAccessibilityFunCamCustomAction *v18;
  objc_super v20;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)UIAccessibilityFunCamCustomAction;
  v17 = -[UIAccessibilityFunCamCustomAction initWithName:target:selector:](&v20, sel_initWithName_target_selector_, a3, a4, a5);
  v18 = v17;
  if (v17)
  {
    -[UIAccessibilityFunCamCustomAction setEffect:](v17, "setEffect:", v14);
    -[UIAccessibilityFunCamCustomAction setAxElement:](v18, "setAxElement:", v15);
    -[UIAccessibilityFunCamCustomAction setVc:](v18, "setVc:", v16);
  }

  return v18;
}

- (id)effect
{
  return objc_loadWeakRetained(&self->_effect);
}

- (void)setEffect:(id)a3
{
  objc_storeWeak(&self->_effect, a3);
}

- (UIAccessibilityElement)axElement
{
  return (UIAccessibilityElement *)objc_loadWeakRetained((id *)&self->_axElement);
}

- (void)setAxElement:(id)a3
{
  objc_storeWeak((id *)&self->_axElement, a3);
}

- (UIViewController)vc
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_vc);
}

- (void)setVc:(id)a3
{
  objc_storeWeak((id *)&self->_vc, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vc);
  objc_destroyWeak((id *)&self->_axElement);
  objc_destroyWeak(&self->_effect);
}

@end

@implementation ViewWithCustomNextResponder

- (id)nextResponder
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ViewWithCustomNextResponder;
    -[ViewWithCustomNextResponder nextResponder](&v8, sel_nextResponder);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)parentFocusEnvironment
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ViewWithCustomNextResponder;
    -[ViewWithCustomNextResponder parentFocusEnvironment](&v8, sel_parentFocusEnvironment);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4
{
  UIResponder **p_customNextResponder;
  id obj;

  p_customNextResponder = &self->_customNextResponder;
  obj = a4;
  objc_storeWeak((id *)p_customNextResponder, a3);
  objc_storeWeak((id *)&self->_customParentFocusEnvironment, obj);

}

- (UIResponder)customNextResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_customNextResponder);
}

- (UIFocusEnvironment)customParentFocusEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customParentFocusEnvironment);
  objc_destroyWeak((id *)&self->_customNextResponder);
}

@end

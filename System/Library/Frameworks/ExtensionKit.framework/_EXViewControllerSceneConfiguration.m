@implementation _EXViewControllerSceneConfiguration

- (UIStoryboard)storyboard
{
  UIStoryboard *storyboard;
  void *v4;
  UIStoryboard *v5;
  UIStoryboard *v6;
  UIStoryboard *v7;
  UIStoryboard *v8;
  UIStoryboard *v9;
  UIStoryboard *v10;

  storyboard = self->_storyboard;
  if (!storyboard)
  {
    -[_EXViewControllerSceneConfiguration storyboardName](self, "storyboardName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (objc_msgSend(MEMORY[0x24BEBD9A0], "storyboardWithName:bundle:", v4, 0),
          (v5 = (UIStoryboard *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = self->_storyboard;
      self->_storyboard = v5;
      v7 = v5;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (UIStoryboard *)objc_claimAutoreleasedReturnValue();
      v7 = self->_storyboard;
      self->_storyboard = v8;
    }

    storyboard = self->_storyboard;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (UIStoryboard *)objc_claimAutoreleasedReturnValue();

  if (storyboard == v9)
    v10 = 0;
  else
    v10 = self->_storyboard;
  return v10;
}

- (Class)viewControllerClass
{
  NSString *viewControllerClass;
  objc_class *v4;
  Class v5;

  viewControllerClass = (NSString *)self->_viewControllerClass;
  if (!viewControllerClass)
  {
    viewControllerClass = self->_viewControllerClassName;
    if (viewControllerClass)
    {
      NSClassFromString(viewControllerClass);
      v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v5 = self->_viewControllerClass;
      self->_viewControllerClass = v4;

      viewControllerClass = (NSString *)self->_viewControllerClass;
    }
  }
  return (Class)viewControllerClass;
}

- (NSString)storyboardName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoryboardName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setStoryboard:(id)a3
{
  objc_storeStrong((id *)&self->_storyboard, a3);
}

- (NSString)viewControllerClassName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setViewControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_viewControllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClass, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_storyboardName, 0);
}

@end

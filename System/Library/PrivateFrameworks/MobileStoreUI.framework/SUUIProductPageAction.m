@implementation SUUIProductPageAction

+ (id)actionWithType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setActionType:", a3);
  return v4;
}

- (UIViewController)viewController
{
  void (**viewControllerBlock)(_QWORD, _QWORD);

  viewControllerBlock = (void (**)(_QWORD, _QWORD))self->_viewControllerBlock;
  if (viewControllerBlock)
  {
    ((void (**)(_QWORD, SEL))viewControllerBlock)[2](viewControllerBlock, a2);
    viewControllerBlock = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return (UIViewController *)viewControllerBlock;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (SUUIItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)viewControllerBlock
{
  return self->_viewControllerBlock;
}

- (void)setViewControllerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_viewControllerBlock, 0);
  objc_storeStrong((id *)&self->_urlTitle, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

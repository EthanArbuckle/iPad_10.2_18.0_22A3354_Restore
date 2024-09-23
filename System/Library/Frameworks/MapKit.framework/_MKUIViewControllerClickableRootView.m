@implementation _MKUIViewControllerClickableRootView

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  UITapGestureRecognizer *gestureRecognizer;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *v11;
  id v12;

  v6 = a3;
  v7 = v6;
  gestureRecognizer = self->_gestureRecognizer;
  if (v6 && a4)
  {
    v12 = v6;
    if (!gestureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0CEAA88]);
      v10 = self->_gestureRecognizer;
      self->_gestureRecognizer = v9;

      -[_MKUIViewControllerClickableRootView addGestureRecognizer:](self, "addGestureRecognizer:", self->_gestureRecognizer);
      v7 = v12;
      gestureRecognizer = self->_gestureRecognizer;
    }
    -[UITapGestureRecognizer addTarget:action:](gestureRecognizer, "addTarget:action:", v7, a4);
    goto LABEL_8;
  }
  if (gestureRecognizer)
  {
    v12 = v6;
    -[_MKUIViewControllerClickableRootView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v11 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;

LABEL_8:
    v7 = v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end

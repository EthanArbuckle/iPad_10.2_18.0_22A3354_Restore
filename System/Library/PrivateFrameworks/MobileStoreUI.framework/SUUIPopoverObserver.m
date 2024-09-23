@implementation SUUIPopoverObserver

- (SUUIPopoverObserver)initWithPopoverController:(id)a3
{
  id v5;
  SUUIPopoverObserver *v6;
  SUUIPopoverObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPopoverObserver;
  v6 = -[SUUIPopoverObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_popoverController, a3);
    -[UIPopoverController setDelegate:](v7->_popoverController, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIPopoverObserver;
  -[SUUIPopoverObserver dealloc](&v3, sel_dealloc);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", a3);
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  id v5;

  self->_selector = a4;
  v5 = a3;
  objc_storeWeak(&self->_target, v5);

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id *p_target;
  id WeakRetained;
  SEL selector;
  id v7;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    selector = self->_selector;

    if (selector)
    {
      v7 = objc_loadWeakRetained(p_target);
      objc_msgSend(v7, "performSelector:withObject:", self->_selector, 0);

    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

@end

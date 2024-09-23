@implementation CPSHighlightForwardingButton

- (void)setHighlightForwardingTarget:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);
    objc_msgSend(v5, "setHighlighted:", 0);

    objc_storeWeak((id *)&self->_highlightForwardingTarget, obj);
    objc_msgSend(obj, "setHighlighted:", -[CPSHighlightForwardingButton isHighlighted](self, "isHighlighted"));
  }

}

- (void)setHighlighted:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPSHighlightForwardingButton;
  -[CPSHighlightForwardingButton setHighlighted:](&v5, sel_setHighlighted_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);
  objc_msgSend(WeakRetained, "setHighlighted:", -[CPSHighlightForwardingButton isHighlighted](self, "isHighlighted"));

}

- (CPSHighlightable)highlightForwardingTarget
{
  return (CPSHighlightable *)objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_highlightForwardingTarget);
}

@end

@implementation GCEventInteraction

- (GCEventInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCEventInteraction;
  return -[GCEventInteraction init](&v3, sel_init);
}

- (void)setHandledEventTypes:(unint64_t)a3
{
  self->_handledEventTypes = a3;
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (unint64_t)handledEventTypes
{
  return self->_handledEventTypes;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end

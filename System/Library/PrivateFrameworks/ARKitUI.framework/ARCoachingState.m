@implementation ARCoachingState

- (ARCoachingState)initWithView:(id)a3
{
  id v4;
  ARCoachingState *v5;
  ARCoachingState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARCoachingState;
  v5 = -[ARCoachingState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_view, v4);

  return v6;
}

- (int64_t)requirements
{
  return 0;
}

- (BOOL)isViewActiveForState
{
  return 1;
}

- (id)doAction:(int64_t)a3
{
  return 0;
}

- (ARCoachingOverlayView)view
{
  return (ARCoachingOverlayView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end

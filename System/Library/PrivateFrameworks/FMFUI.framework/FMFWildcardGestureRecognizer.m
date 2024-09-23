@implementation FMFWildcardGestureRecognizer

- (FMFWildcardGestureRecognizer)init
{
  FMFWildcardGestureRecognizer *v2;
  FMFWildcardGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFWildcardGestureRecognizer;
  v2 = -[FMFWildcardGestureRecognizer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FMFWildcardGestureRecognizer setCancelsTouchesInView:](v2, "setCancelsTouchesInView:", 0);
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void (**touchesBeganCallback)(id, id, id);

  touchesBeganCallback = (void (**)(id, id, id))self->_touchesBeganCallback;
  if (touchesBeganCallback)
    touchesBeganCallback[2](touchesBeganCallback, a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void (**touchesEndedCallback)(id, id, id);

  touchesEndedCallback = (void (**)(id, id, id))self->_touchesEndedCallback;
  if (touchesEndedCallback)
    touchesEndedCallback[2](touchesEndedCallback, a3, a4);
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (id)touchesBeganCallback
{
  return self->_touchesBeganCallback;
}

- (void)setTouchesBeganCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)touchesEndedCallback
{
  return self->_touchesEndedCallback;
}

- (void)setTouchesEndedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchesEndedCallback, 0);
  objc_storeStrong(&self->_touchesBeganCallback, 0);
}

@end

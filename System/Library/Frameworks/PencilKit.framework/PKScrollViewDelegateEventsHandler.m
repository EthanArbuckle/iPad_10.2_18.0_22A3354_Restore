@implementation PKScrollViewDelegateEventsHandler

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[PKScrollViewDelegateEventsHandler scrollViewDidEndScrollingAnimationHandler](self, "scrollViewDidEndScrollingAnimationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKScrollViewDelegateEventsHandler scrollViewDidEndScrollingAnimationHandler](self, "scrollViewDidEndScrollingAnimationHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PKScrollViewDelegateEventsHandler *, id))v5)[2](v5, self, v6);

  }
}

- (id)scrollViewDidEndScrollingAnimationHandler
{
  return self->_scrollViewDidEndScrollingAnimationHandler;
}

- (void)setScrollViewDidEndScrollingAnimationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollViewDidEndScrollingAnimationHandler, 0);
}

@end

@implementation WFTouchCapturingView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void (**v6)(void);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFTouchCapturingView touchCapturedHandler](self, "touchCapturedHandler", a4, a3.x, a3.y));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[WFTouchCapturingView touchCapturedHandler](self, "touchCapturedHandler"));
    v6[2]();

  }
  return 1;
}

- (id)touchCapturedHandler
{
  return self->_touchCapturedHandler;
}

- (void)setTouchCapturedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchCapturedHandler, 0);
}

@end

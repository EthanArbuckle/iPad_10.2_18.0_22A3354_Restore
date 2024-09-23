@implementation _BNPanGestureServiceProxy

- (int64_t)state
{
  return -[BNPanGestureProxyAction state](self->_activePanGestureProxyAction, "state");
}

- (BOOL)didCrossDefaultThreshold
{
  return -[BNPanGestureProxyAction didCrossDefaultThreshold](self->_activePanGestureProxyAction, "didCrossDefaultThreshold");
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxyAction locationInCoordinateSpace:](self->_activePanGestureProxyAction, "locationInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxyAction translationInCoordinateSpace:](self->_activePanGestureProxyAction, "translationInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxyAction visualTranslationInCoordinateSpace:](self->_activePanGestureProxyAction, "visualTranslationInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[BNPanGestureProxyAction velocityInCoordinateSpace:](self->_activePanGestureProxyAction, "velocityInCoordinateSpace:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)sendAction
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  -[_BNPanGestureServiceProxy actionHandler](self, "actionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, _BNPanGestureServiceProxy *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BNPanGestureProxyDelegate)delegate
{
  return (BNPanGestureProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BNPanGestureProxyAction)_activePanGestureProxyAction
{
  return self->_activePanGestureProxyAction;
}

- (void)_setActivePanGestureProxyAction:(id)a3
{
  objc_storeStrong((id *)&self->_activePanGestureProxyAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePanGestureProxyAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end

@implementation HUEffectiveProgressObserver

- (HUEffectiveProgressObserver)initWithTargetEffectiveProgress:(double)a3 observerBlock:(id)a4
{
  id v6;
  HUEffectiveProgressObserver *v7;
  HUEffectiveProgressObserver *v8;
  uint64_t v9;
  id observerBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUEffectiveProgressObserver;
  v7 = -[HUEffectiveProgressObserver init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_targetEffectiveProgress = a3;
    v9 = objc_msgSend(v6, "copy");
    observerBlock = v8->_observerBlock;
    v8->_observerBlock = (id)v9;

  }
  return v8;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (double)targetEffectiveProgress
{
  return self->_targetEffectiveProgress;
}

- (NACancelable)timerCancellationToken
{
  return self->_timerCancellationToken;
}

- (void)setTimerCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_timerCancellationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerCancellationToken, 0);
  objc_storeStrong(&self->_observerBlock, 0);
}

@end

@implementation ARUIManualAnimationSequencer

- (ARUIManualAnimationSequencer)init
{
  ARUIManualAnimationSequencer *v2;
  ARUIObserverStore *v3;
  ARUIObserverStore *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARUIManualAnimationSequencer;
  v2 = -[ARUIManualAnimationSequencer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ARUIObserverStore);
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_animating = 0;
    v2->_timeUntilCompletion = NAN;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  -[ARUIObserverStore addObserver:](self->_observers, "addObserver:", a3);
  self->_animating = -[ARUIObserverStore count](self->_observers, "count") != 0;
}

- (void)removeObserver:(id)a3
{
  -[ARUIObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
  self->_animating = -[ARUIObserverStore count](self->_observers, "count") != 0;
}

- (void)tick
{
  ARUIObserverStore *observers;
  double v4;
  void (**v5)(_QWORD);
  id completion;
  _QWORD v7[5];

  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ARUIManualAnimationSequencer_tick__block_invoke;
  v7[3] = &unk_24CEC6450;
  v7[4] = self;
  -[ARUIObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);
  v4 = self->_timeUntilCompletion + -0.0166666667;
  self->_timeUntilCompletion = v4;
  *(float *)&v4 = v4;
  if (ARUIFloatLess(*(float *)&v4, 0.0))
  {
    v5 = (void (**)(_QWORD))objc_msgSend(self->_completion, "copy");
    completion = self->_completion;
    self->_completion = 0;

    self->_timeUntilCompletion = NAN;
    v5[2](v5);

  }
}

uint64_t __36__ARUIManualAnimationSequencer_tick__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animationSequencer:updatedWithTime:", *(_QWORD *)(a1 + 32), 0.0166666667);
}

- (void)performAfter:(double)a3 completion:(id)a4
{
  void *v6;
  id completion;

  v6 = (void *)objc_msgSend(a4, "copy");
  completion = self->_completion;
  self->_completion = v6;

  self->_timeUntilCompletion = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

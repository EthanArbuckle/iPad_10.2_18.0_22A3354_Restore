@implementation CAStateControllerTransition

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  CAStateControllerDelegate *v6;

  v4 = a4;
  v6 = -[CAStateController delegate](self->_controller, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CAStateControllerDelegate stateController:transitionDidStop:completed:](v6, "stateController:transitionDidStop:completed:", self->_controller, self->_transition, v4);

  self->_masterKey = 0;
  -[CAStateControllerTransition invalidate](self, "invalidate");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[CAStateControllerTransition invalidate](self, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerTransition;
  -[CAStateControllerTransition dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  CAStateController **p_controller;
  NSMutableArray *animations;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CAStateController *controller;
  CALayer *layer;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_controller = &self->_controller;
  if (self->_controller)
  {
    if (self->_masterKey)
    {
      -[CAStateControllerTransition removeAnimationFromLayer:forKey:](self, "removeAnimationFromLayer:forKey:", self->_layer);

      self->_masterKey = 0;
    }
    animations = self->_animations;
    if (animations)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(animations);
            -[CAStateControllerTransition removeAnimationFromLayer:forKey:](self, "removeAnimationFromLayer:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "layer"), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "key"));
            ++v8;
          }
          while (v6 != v8);
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        }
        while (v6);
      }

      self->_animations = 0;
    }
    controller = self->_controller;
    layer = self->_layer;
    *p_controller = 0;
    p_controller[1] = 0;
    -[CAStateController _removeTransition:layer:](controller, "_removeTransition:layer:", self, layer);
  }
}

- (void)removeAnimationFromLayer:(id)a3 forKey:(id)a4
{
  if ((CAStateControllerTransition *)objc_msgSend((id)objc_msgSend(a3, "animationForKey:", a4), "CAStateControllerTransition") == self)objc_msgSend(a3, "removeAnimationForKey:", a4);
}

- (void)addAnimation:(id)a3
{
  NSMutableArray *animations;

  animations = self->_animations;
  if (!animations)
  {
    animations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_animations = animations;
  }
  -[NSMutableArray addObject:](animations, "addObject:", a3);
}

- (CAStateControllerTransition)init
{
  CAStateControllerTransition *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerTransition;
  result = -[CAStateControllerTransition init](&v3, sel_init);
  if (result)
    result->_speed = 1.0;
  return result;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CAStateTransition)transition
{
  return self->_transition;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (double)duration
{
  return self->_duration;
}

- (float)speed
{
  return self->_speed;
}

@end

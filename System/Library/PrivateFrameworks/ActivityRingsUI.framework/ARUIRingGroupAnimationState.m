@implementation ARUIRingGroupAnimationState

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ARUIRingGroupAnimationState)init
{
  ARUIRingGroupAnimationState *v2;
  uint64_t v3;
  NSMutableSet *trackedAnimations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARUIRingGroupAnimationState;
  v2 = -[ARUIRingGroupAnimationState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    trackedAnimations = v2->_trackedAnimations;
    v2->_trackedAnimations = (NSMutableSet *)v3;

  }
  return v2;
}

+ (void)pushAnimationState:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  arui_rings_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroupAnimationState pushAnimationState:].cold.3();

  if (__currentRingGroupAnimationState)
  {
    arui_rings_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ARUIRingGroupAnimationState pushAnimationState:].cold.2();

    objc_msgSend(v3, "setNextAnimationState:", __currentRingGroupAnimationState);
  }
  arui_rings_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroupAnimationState pushAnimationState:].cold.1();

  v7 = (void *)__currentRingGroupAnimationState;
  __currentRingGroupAnimationState = (uint64_t)v3;

}

+ (void)popAnimationState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212DE7000, v0, v1, "ARUIRingGroupAnimationState popping animationState __currentRingGroupAnimationState is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (NSMutableSet)trackedAnimations
{
  return self->_trackedAnimations;
}

- (ARUIRingGroupAnimationState)nextAnimationState
{
  return self->_nextAnimationState;
}

- (id)completion
{
  return self->_completion;
}

+ (id)currentAnimationState
{
  NSObject *v2;

  arui_rings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroupAnimationState currentAnimationState].cold.1();

  return (id)__currentRingGroupAnimationState;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (double)duration
{
  return self->_duration;
}

- (void)addAnimation:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  -[NSMutableSet addObject:](self->_trackedAnimations, "addObject:", v4);

}

- (void)animationDidComplete:(id)a3
{
  void *v4;
  void (**completion)(void);

  -[NSMutableSet removeObject:](self->_trackedAnimations, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_trackedAnimations, "count"))
  {
    objc_msgSend((id)__trackedAnimationStates, "removeObject:", self);
    if (!objc_msgSend((id)__trackedAnimationStates, "count"))
    {
      v4 = (void *)__trackedAnimationStates;
      __trackedAnimationStates = 0;

    }
    completion = (void (**)(void))self->_completion;
    if (completion)
      completion[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong((id *)&self->_nextAnimationState, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

- (void)setNextAnimationState:(id)a3
{
  objc_storeStrong((id *)&self->_nextAnimationState, a3);
}

- (void)setTrackedAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_trackedAnimations, a3);
}

+ (void)pushAnimationState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_212DE7000, v0, v1, "ARUIRingGroupAnimationState pushing animationState: %@ setting __currentRingGroupAnimationState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)pushAnimationState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212DE7000, v0, v1, "ARUIRingGroupAnimationState pushing animationState: %@, __currentRingGroupAnimationState exists: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)pushAnimationState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_212DE7000, v0, v1, "ARUIRingGroupAnimationState pushing animationState: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)currentAnimationState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_212DE7000, v0, v1, "ARUIRingGroupAnimationState returning currentAnimationState: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

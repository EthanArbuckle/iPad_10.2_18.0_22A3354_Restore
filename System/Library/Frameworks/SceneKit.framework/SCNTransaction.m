@implementation SCNTransaction

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 applyBlock:(id)a5
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
    (*((void (**)(id, double))a5 + 2))(a5, 0.0);
  else
    C3DTransactionAddCommandBlock(Current, a3, a4, (const void *)objc_msgSend(a4, "__CFObject"), 0, a5);
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a6 + 2))(a6, 0.0);
    if (a3)
    {
      if (a5)
        C3DTransactionUpdateModelValueForKeypathIfNeeded((uint64_t)a3, (float32x4_t *)objc_msgSend(a4, "__CFObject"), (const __CFString *)a5);
    }
  }
  else
  {
    C3DTransactionAddCommandBlock(Current, a3, a4, (const void *)objc_msgSend(a4, "__CFObject"), a5, a6);
  }
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 applyBlock:(id)a6
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a6 + 2))(a6, 0.0);
    if (a3)
    {
      if (a5)
        C3DTransactionUpdateModelValueForKeyIfNeeded((uint64_t)a3, (float32x4_t *)objc_msgSend(a4, "__CFObject"), (const __CFString *)a5);
    }
  }
  else
  {
    C3DTransactionAddCommandBlock(Current, a3, a4, (const void *)objc_msgSend(a4, "__CFObject"), a5, a6);
  }
}

+ (void)commitImmediate
{
  C3DTransactionCommit(1);
}

+ (void)setImmediateMode:(BOOL)a3
{
  C3DTransactionSetImmediateMode(a3);
}

+ (BOOL)immediateMode
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  return C3DTransactionIsImmediate((uint64_t)Current);
}

+ (void)commit
{
  C3DTransactionCommit(0);
}

+ (void)setImmediateModeRestrictedContext:(__C3DScene *)a3
{
  C3DTransactionSetImmediateModeRestrictedContext((uint64_t)a3);
}

+ (CAMediaTimingFunction)animationTimingFunction
{
  CAMediaTimingFunction *result;

  result = (CAMediaTimingFunction *)C3DTransactionGetTimingFunction();
  if (result)
    return (CAMediaTimingFunction *)CAMediaTimingFunctionFromC3DTimingFunction((uint64_t)result);
  return result;
}

+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)animationTimingFunction
{
  id v3;

  v3 = C3DTimingFunctionFromCAMediaTimingFunction(animationTimingFunction);
  C3DTransactionSetTimingFunction(v3);
}

+ (void)setDisableActions:(BOOL)disableActions
{
  C3DTransactionSetDisableActions(disableActions);
}

+ (void)setCompletionBlock:(void *)completionBlock
{
  C3DTransactionSetCompletionBlock(completionBlock);
}

+ (id)valueForKey:(NSString *)key
{
  return C3DTransactionGetValue(key);
}

+ (void)setValue:(id)value forKey:(NSString *)key
{
  C3DTransactionSetValue(key, value);
}

+ (__C3DScene)immediateModeRestrictedContext
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  return (__C3DScene *)C3DParticleSystemInstanceGetSystem((uint64_t)Current);
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a8 + 2))(a8, 0.0);
    if (a3)
    {
      if (a7)
        C3DTransactionUpdateModelValueForKeyAndSubscriptIndexIfNeeded((uint64_t)a3, (const void *)objc_msgSend(a4, "__CFObject"), (const __CFString *)a5, a6);
    }
  }
  else
  {
    C3DTransactionAddCommandBlock(Current, a3, a4, (const void *)objc_msgSend(a4, "__CFObject"), a7, a8);
  }
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  const void *Current;

  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a8 + 2))(a8, 0.0);
    if (a3)
    {
      if (a7)
        C3DTransactionUpdateModelValueForKeyAndSubscriptKeyIfNeeded((uint64_t)a3, (const void *)objc_msgSend(a4, "__CFObject"), (const __CFString *)a5, a6);
    }
  }
  else
  {
    C3DTransactionAddCommandBlock(Current, a3, a4, (const void *)objc_msgSend(a4, "__CFObject"), a7, a8);
  }
}

+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4
{
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(a3, "scene");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(a3, "sceneRef");
    if (!v8)
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:].cold.1(v9);
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke;
    v11[3] = &unk_1EA5A3AE0;
    v11[4] = a4;
    v11[5] = a2;
    objc_msgSend(a1, "postCommandWithContext:object:applyBlock:", v8, a3, v11);
  }
  else
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:].cold.2();
  }
}

uint64_t __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke(uint64_t a1)
{
  NSObject *v3;

  if (+[SCNTransaction immediateMode](SCNTransaction, "immediateMode"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke_cold_1(a1);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
}

+ (void)performPresentationInstanceQueriesInScene:(id)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "sceneRef");
  v7 = v5;
  if (v5)
  {
    v6 = v5;
    C3DSceneLock(v5);
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v7);
    C3DSceneUnlock(v6);
  }
  else
  {
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v7);
  }
}

+ (unsigned)currentState
{
  return C3DTransactionGetCurrentDepth();
}

- (void)begin
{
  +[SCNTransaction begin](SCNTransaction, "begin");
}

- (void)commit
{
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (void)flush
{
  +[SCNTransaction flush](SCNTransaction, "flush");
}

- (void)lock
{
  +[SCNTransaction lock](SCNTransaction, "lock");
}

- (void)unlock
{
  +[SCNTransaction unlock](SCNTransaction, "unlock");
}

- (void)setAnimationDuration:(double)a3
{
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", a3);
}

- (double)animationDuration
{
  double result;

  +[SCNTransaction animationDuration](SCNTransaction, "animationDuration");
  return result;
}

- (void)setDisableActions:(BOOL)a3
{
  +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", a3);
}

- (BOOL)disableActions
{
  return +[SCNTransaction disableActions](SCNTransaction, "disableActions");
}

- (void)setAnimationTimingFunction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", a3);
  +[SCNTransaction setAnimationTimingFunction:](SCNTransaction, "setAnimationTimingFunction:", a3);
}

- (id)animationTimingFunction
{
  NSLog(CFSTR("animationTimingFunction not implemented for Javascript"), a2);
  return 0;
}

+ (void)enqueueCommandForObject:(os_log_t)log immediateTransactionBlock:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "sceneRef";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

+ (void)enqueueCommandForObject:immediateTransactionBlock:.cold.2()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Unreachable code: Unsupported class %@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Unreachable code: Command enqueued by %@ was expected to be run in immediate mode", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_4();
}

@end

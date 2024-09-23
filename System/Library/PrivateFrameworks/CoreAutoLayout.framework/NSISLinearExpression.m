@implementation NSISLinearExpression

- (BOOL)isConstant
{
  return self->linExp.var_count == 0;
}

- (double)constant
{
  return self->linExp.constant;
}

- (void)setCoefficient:(double)a3 forVariable:(id)a4
{
  uint64_t v7;
  unsigned int v8;
  void *v9;

  -[NSISEngine beginBookkeepingForVariableIfNeeded:](self->engine, "beginBookkeepingForVariableIfNeeded:");
  v7 = 0;
  while ((NSISEngine *)*((_QWORD *)a4 + v7 + 3) != self->engine)
  {
    if (++v7 == 3)
      goto LABEL_6;
  }
  v8 = *((_DWORD *)a4 + v7 + 12);
  if (v8 != -1)
    goto LABEL_9;
LABEL_6:
  if (!*((_QWORD *)a4 + 2) || (v8 = objc_msgSend(a4, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), self, a4, self->engine);
    v8 = 0;
  }
LABEL_9:
  NSISLinExpSetCoefficientForVar(&self->linExp.inline_capacity, v8, a3);
}

- (void)addVariable:(id)a3 coefficient:(double)a4
{
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;

  if (!a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSISLinearExpression addVariable:coefficient:]"), CFSTR("NSISLinearExpression.m"), 791, CFSTR("Attempt to add a nil NSISVariable to an expression.  This is probably a bug in autolayout."));
  }
  -[NSISEngine beginBookkeepingForVariableIfNeeded:](self->engine, "beginBookkeepingForVariableIfNeeded:", a3);
  v7 = 0;
  while ((NSISEngine *)*((_QWORD *)a3 + v7 + 3) != self->engine)
  {
    if (++v7 == 3)
      goto LABEL_8;
  }
  v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1)
    goto LABEL_11;
LABEL_8:
  if (!*((_QWORD *)a3 + 2) || (v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), self, a3, self->engine);
    v8 = 0;
  }
LABEL_11:
  NSISLinExpAddVar(&self->linExp.inline_capacity, v8, a4);
}

- (double)incrementConstant:(double)a3
{
  double result;

  NSISLinExpIncrementConstant((uint64_t)&self->linExp, a3);
  return result;
}

- (NSISEngine)engine
{
  return self->engine;
}

- (void)addExpression:(id)a3 times:(double)a4
{
  NSISLinExpAddExpression(&self->linExp.inline_capacity, (uint64_t)a3 + 16, a4);
}

+ (id)acquireFromPoolForUseCase:(int64_t)a3 engine:(id)a4
{
  uint64_t v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a3 >= 2)
    NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), a2, "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1183);
  if (pthread_getspecific(kPooledLinearExpressionInUseKeys[a3]))
  {
    if (a3 == 1)
      v7 = 64;
    else
      v7 = 6;
    return (id)objc_msgSend(a1, "newExpressionWithCapacity:engine:", v7, a4);
  }
  else
  {
    pthread_setspecific(kPooledLinearExpressionInUseKeys[a3], (const void *)1);
    v9 = pthread_getspecific(kPooledLinearExpressionKeys[a3]);
    if (!v9)
    {
      v10 = a3 == 1 ? 64 : 6;
      v9 = (void *)objc_msgSend(a1, "newExpressionWithCapacity:engine:", v10, a4);
      v11 = pthread_getspecific(kPooledLinearExpressionKeys[a3]);
      v12 = v9;
      pthread_setspecific(kPooledLinearExpressionKeys[a3], v9);
      if (v11)

    }
    *((_QWORD *)v9 + 1) = a4;
    if (*((_DWORD *)v9 + 5))
      NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1200);
    if (*((double *)v9 + 3) != 0.0)
      NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "+[NSISLinearExpression acquireFromPoolForUseCase:engine:]", 1201);
    return v9;
  }
}

- (void)returnToPool
{
  uint64_t v3;
  char i;
  char v5;

  v3 = 0;
  self->linExp.var_count = 0;
  self->linExp.constant = 0.0;
  for (i = 1; ; i = 0)
  {
    v5 = i;
    if (pthread_getspecific(kPooledLinearExpressionKeys[v3]) == self)
      break;
    v3 = 1;
    if ((v5 & 1) == 0)
      return;
  }
  if (!pthread_getspecific(kPooledLinearExpressionInUseKeys[v3]))
    NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "-[NSISLinearExpression returnToPool]", 1131);
  pthread_setspecific(kPooledLinearExpressionInUseKeys[v3], 0);
}

- (_WORD)initWithInlineCapacity:(uint64_t)a3 engine:
{
  _WORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)NSISLinearExpression;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    if (a2 >= 0xFFFF)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithInlineCapacity_engine_, v5, CFSTR("NSISLinearExpression.m"), 1077, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity < UINT16_MAX"));
    v5[8] = a2;
    *((_QWORD *)v5 + 1) = a3;
  }
  return v5;
}

+ (id)newExpressionWithCapacity:(unint64_t)a3 engine:(id)a4
{
  objc_class *v6;
  size_t v7;
  NSUInteger v8;
  id v9;

  v6 = (objc_class *)objc_opt_class();
  v7 = malloc_good_size(12 * a3 + 30);
  if ((v7 - 30) / 0xC > a3)
    a3 = (v7 - 30) / 0xC;
  if (12 * a3 >= 0x31)
    v8 = 12 * a3 - 48;
  else
    v8 = 0;
  v9 = NSAllocateObject(v6, v8, 0);
  return -[NSISLinearExpression initWithInlineCapacity:engine:](v9, a3, (uint64_t)a4);
}

- (void)dealloc
{
  uint64_t v3;
  char v4;
  NSISLinearExpression *v5;
  BOOL v6;
  char v7;
  objc_super v8;

  v3 = 0;
  v4 = 1;
  do
  {
    v5 = (NSISLinearExpression *)pthread_getspecific(kPooledLinearExpressionKeys[v3]);
    if (v5)
      v6 = v5 == self;
    else
      v6 = 0;
    v7 = !v6;
    if ((v4 & 1) == 0)
      break;
    v4 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
  if ((v7 & 1) == 0)
    NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "-[NSISLinearExpression dealloc]", 755);
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E0C9AE50])
    free(self->linExp.data.extern_data.var0);
  v8.receiver = self;
  v8.super_class = (Class)NSISLinearExpression;
  -[NSISLinearExpression dealloc](&v8, sel_dealloc);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_5);
}

uint64_t __34__NSISLinearExpression_initialize__block_invoke()
{
  pthread_key_create(kPooledLinearExpressionKeys, pooled_expression_destructor);
  pthread_key_create(kPooledLinearExpressionInUseKeys, 0);
  pthread_key_create(&kPooledLinearExpressionKeys[1], pooled_expression_destructor);
  return pthread_key_create(&kPooledLinearExpressionInUseKeys[1], 0);
}

- (NSISLinearExpression)init
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISLinearExpression.m"), 639, CFSTR("NSISLinearExpression init is no longer supported."));
  return 0;
}

- (NSISLinearExpression)initWithEngine:(id)a3
{
  objc_super v4;

  if (self)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSISLinearExpression;
    self = -[NSISLinearExpression init](&v4, sel_init);
    if (self)
    {
      self->linExp.inline_capacity = 4;
      self->engine = (NSISEngine *)a3;
    }
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not copyable"), self);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v3, 0));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t var_count;
  double *p_data;
  slab *stored_extern_marker;
  slab *v8;
  unint64_t capacity;
  char *var0;
  BOOL result;
  double *v12;
  slab *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  int v20;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self->engine != (NSISEngine *)*((_QWORD *)a3 + 1))
    return 0;
  var_count = self->linExp.var_count;
  if ((_DWORD)var_count != *((_DWORD *)a3 + 5) || self->linExp.constant != *((double *)a3 + 3))
    return 0;
  p_data = (double *)&self->linExp.data;
  stored_extern_marker = self->linExp.data.extern_data.stored_extern_marker;
  v8 = (slab *)*MEMORY[0x1E0C9AE50];
  if (stored_extern_marker == (slab *)*MEMORY[0x1E0C9AE50])
  {
    var0 = (char *)self->linExp.data.extern_data.var0;
    capacity = self->linExp.data.extern_data.capacity;
  }
  else
  {
    capacity = self->linExp.inline_capacity;
    var0 = (char *)&self->linExp.data;
  }
  v12 = (double *)((char *)a3 + 32);
  v13 = (slab *)*((_QWORD *)a3 + 4);
  if (v13 == v8)
  {
    v15 = (char *)*((_QWORD *)a3 + 5);
    v14 = *((_QWORD *)a3 + 6);
  }
  else
  {
    v14 = *((unsigned __int16 *)a3 + 8);
    v15 = (char *)a3 + 32;
  }
  if (stored_extern_marker == v8)
    p_data = (double *)self->linExp.data.extern_data.var0;
  if (v13 == v8)
    v12 = (double *)*((_QWORD *)a3 + 5);
  if ((_DWORD)var_count)
  {
    v16 = &var0[8 * capacity];
    v17 = &v15[8 * v14];
    result = 1;
    while (1)
    {
      v19 = *(_DWORD *)v16;
      v16 += 4;
      v18 = v19;
      v20 = *(_DWORD *)v17;
      v17 += 4;
      if (v18 != v20 || *p_data != *v12)
        break;
      ++v12;
      ++p_data;
      if (!--var_count)
        return result;
    }
    return 0;
  }
  return 1;
}

- (unint64_t)hash
{
  double *p_data;
  unint64_t constant;
  uint64_t var_count;
  unint64_t capacity;
  double *v6;
  double v7;
  uint64_t v8;

  p_data = (double *)&self->linExp.data;
  constant = (unint64_t)self->linExp.constant;
  var_count = self->linExp.var_count;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E0C9AE50])
  {
    p_data = (double *)self->linExp.data.extern_data.var0;
    capacity = self->linExp.data.extern_data.capacity;
    if (!(_DWORD)var_count)
      return constant;
  }
  else
  {
    capacity = self->linExp.inline_capacity;
    if (!(_DWORD)var_count)
      return constant;
  }
  v6 = &p_data[capacity];
  do
  {
    v7 = *p_data++;
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7), "hash");
    LODWORD(v7) = *(_DWORD *)v6;
    v6 = (double *)((char *)v6 + 4);
    constant = v8 - constant + 32 * constant + (-1640531535 * LODWORD(v7));
    --var_count;
  }
  while (var_count);
  return constant;
}

- (void)removeVariable:(id)a3
{
  uint64_t v4;
  NSISEngine *engine;
  unsigned int v6;

  v4 = 0;
  engine = self->engine;
  while (*((NSISEngine **)a3 + v4 + 3) != engine)
  {
    if (++v4 == 3)
      goto LABEL_6;
  }
  v6 = *((_DWORD *)a3 + v4 + 12);
  if (v6 != -1)
  {
LABEL_8:
    NSISLinExpRemoveVar(&self->linExp.inline_capacity, v6);
    return;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 2))
  {
    v6 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", engine);
    if (v6 != -1)
      goto LABEL_8;
  }
}

- (double)coefficientForVariable:(id)a3
{
  uint64_t v4;
  NSISEngine *engine;
  unsigned int v6;

  v4 = 0;
  engine = self->engine;
  while (*((NSISEngine **)a3 + v4 + 3) != engine)
  {
    if (++v4 == 3)
      goto LABEL_6;
  }
  v6 = *((_DWORD *)a3 + v4 + 12);
  if (v6 != -1)
    return NSISLinExpCoefficientForVar((uint64_t)&self->linExp, v6);
LABEL_6:
  if (*((_QWORD *)a3 + 2))
  {
    v6 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", engine);
    if (v6 != -1)
      return NSISLinExpCoefficientForVar((uint64_t)&self->linExp, v6);
  }
  return 0.0;
}

- (void)replaceVariable:(id)a3 withVariable:(id)a4 coefficient:(double)a5
{
  uint64_t v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;

  -[NSISEngine beginBookkeepingForVariableIfNeeded:](self->engine, "beginBookkeepingForVariableIfNeeded:", a4);
  v9 = 0;
  while ((NSISEngine *)*((_QWORD *)a3 + v9 + 3) != self->engine)
  {
    if (++v9 == 3)
      goto LABEL_6;
  }
  v10 = *((_DWORD *)a3 + v9 + 12);
  if (v10 != -1)
    goto LABEL_9;
LABEL_6:
  if (!*((_QWORD *)a3 + 2) || (v10 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v10 == -1))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), self, a3, self->engine);
    v10 = 0;
  }
LABEL_9:
  v12 = 0;
  while ((NSISEngine *)*((_QWORD *)a4 + v12 + 3) != self->engine)
  {
    if (++v12 == 3)
      goto LABEL_14;
  }
  v13 = *((_DWORD *)a4 + v12 + 12);
  if (v13 != -1)
    goto LABEL_17;
LABEL_14:
  if (!*((_QWORD *)a4 + 2) || (v13 = objc_msgSend(a4, "overflowEngineVarIndexForEngine:"), v13 == -1))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), self, a4, self->engine);
    v13 = 0;
  }
LABEL_17:
  NSISLinExpReplaceVarWithVar(&self->linExp.inline_capacity, v10, v13, a5);
}

- (void)addExpression:(id)a3 times:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  _QWORD v6[6];
  _QWORD v7[6];

  v6[5] = a6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __var_handlers_for_variable_handlers_block_invoke;
  v7[3] = &unk_1E4A48E98;
  v7[4] = self;
  v7[5] = a5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v6[3] = &unk_1E4A48E98;
  v6[4] = self;
  NSISLinExpAddExpressionWithProcessors(&self->linExp.inline_capacity, (uint64_t)a3 + 16, (uint64_t)v7, (uint64_t)v6, a4);
}

- (void)addVariable:(id)a3 coefficient:(double)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  void *v11;
  _QWORD v12[7];
  _QWORD v13[6];
  _QWORD v14[6];

  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSISLinearExpression addVariable:coefficient:processVariableNewToReceiver:processVariableDroppedFromReceiver:]"), CFSTR("NSISLinearExpression.m"), 803, CFSTR("Attempt to add a nil NSISVariable to an expression.  This is probably a bug in autolayout."));
  }
  -[NSISEngine beginBookkeepingForVariableIfNeeded:](self->engine, "beginBookkeepingForVariableIfNeeded:", a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  v12[3] = &unk_1E4A490D0;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[6] = a4;
  v13[5] = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __var_handlers_for_variable_handlers_block_invoke;
  v14[3] = &unk_1E4A48E98;
  v14[4] = self;
  v14[5] = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v13[3] = &unk_1E4A48E98;
  v13[4] = self;
  __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke((uint64_t)v12, (uint64_t)v14, (uint64_t)v13);
}

void __112__NSISLinearExpression_addVariable_coefficient_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  v6 = 0;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD **)(a1 + 40);
  while (v7[v6 + 3] != *(_QWORD *)(v8 + 8))
  {
    if (++v6 == 3)
      goto LABEL_6;
  }
  v9 = *((_DWORD *)v7 + v6 + 12);
  if (v9 != -1)
    goto LABEL_9;
LABEL_6:
  if (!v7[2] || (v9 = objc_msgSend(v7, "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), v8, v7, *(_QWORD *)(v8 + 8));
    v9 = 0;
  }
LABEL_9:
  NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v8 + 16), v9, a2, a3, *(double *)(a1 + 48));
}

- (void)setConstant:(double)a3
{
  self->linExp.constant = a3;
}

- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4
{
  uint64_t v7;
  unsigned int v8;
  void *v9;
  $7F52824FD48E8D369C06271D3369A631 *p_linExp;
  double v11;

  v7 = 0;
  while ((NSISEngine *)*((_QWORD *)a3 + v7 + 3) != self->engine)
  {
    if (++v7 == 3)
      goto LABEL_6;
  }
  v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1)
    goto LABEL_9;
LABEL_6:
  if (!*((_QWORD *)a3 + 2) || (v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:"), v8 == -1))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), self, a3, self->engine);
    v8 = 0;
  }
LABEL_9:
  p_linExp = &self->linExp;
  v11 = NSISLinExpCoefficientForVar((uint64_t)p_linExp, v8) * a4;
  NSISLinExpIncrementConstant((uint64_t)p_linExp, v11);
}

- (void)replaceVariable:(id)a3 withVariablePlusDelta:(double)a4 timesVariable:(id)a5 processVariableNewToReceiver:(id)a6 processVariableDroppedFromReceiver:(id)a7
{
  _QWORD v7[8];
  _QWORD v8[6];
  _QWORD v9[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  v7[3] = &unk_1E4A490F8;
  v7[4] = self;
  v7[5] = a3;
  *(double *)&v7[7] = a4;
  v7[6] = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __var_handlers_for_variable_handlers_block_invoke;
  v9[3] = &unk_1E4A48E98;
  v9[4] = self;
  v9[5] = a6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v8[3] = &unk_1E4A48E98;
  v8[4] = self;
  v8[5] = a7;
  __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke((uint64_t)v7, (uint64_t)v9, (uint64_t)v8);
}

void __140__NSISLinearExpression_replaceVariable_withVariablePlusDelta_timesVariable_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _QWORD *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  double v19;

  v6 = 0;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  while (*(_QWORD *)(v7 + 24 + 8 * v6) != *(_QWORD *)(v8 + 8))
  {
    if (++v6 == 3)
      goto LABEL_6;
  }
  v9 = *(_DWORD *)(v7 + 48 + 4 * v6);
  if (v9 != -1)
    goto LABEL_9;
LABEL_6:
  if (!*(_QWORD *)(v7 + 16) || (v9 = objc_msgSend(*(id *)(a1 + 40), "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), v8, v7, *(_QWORD *)(v8 + 8));
    v9 = 0;
  }
LABEL_9:
  v11 = 0;
  v12 = *(double *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD **)(a1 + 48);
  while (v14[v11 + 3] != *(_QWORD *)(v13 + 8))
  {
    if (++v11 == 3)
      goto LABEL_14;
  }
  v15 = *((_DWORD *)v14 + v11 + 12);
  if (v15 != -1)
    goto LABEL_17;
LABEL_14:
  if (!v14[2] || (v15 = objc_msgSend(v14, "overflowEngineVarIndexForEngine:"), v15 == -1))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), v13, v14, *(_QWORD *)(v13 + 8));
    v15 = 0;
  }
LABEL_17:
  v17 = v9;
  v18 = v15;
  v19 = v12 * NSISLinExpCoefficientForVar(v8 + 16, v17);
  NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v8 + 16), v18, a2, a3, v19);
}

- (void)replaceVariable:(id)a3 withExpression:(id)a4 processVariableNewToReceiver:(id)a5 processVariableDroppedFromReceiver:(id)a6
{
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke;
  v6[3] = &unk_1E4A49120;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __var_handlers_for_variable_handlers_block_invoke;
  v8[3] = &unk_1E4A48E98;
  v8[4] = self;
  v8[5] = a5;
  v7[1] = 3221225472;
  v7[2] = __var_handlers_for_variable_handlers_block_invoke_2;
  v7[3] = &unk_1E4A48E98;
  v7[4] = self;
  v7[5] = a6;
  __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(v6, (uint64_t)v8, (uint64_t)v7);
}

void __119__NSISLinearExpression_replaceVariable_withExpression_processVariableNewToReceiver_processVariableDroppedFromReceiver___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  v6 = 0;
  v8 = a1[4];
  v7 = (_QWORD *)a1[5];
  while (v7[v6 + 3] != *(_QWORD *)(v8 + 8))
  {
    if (++v6 == 3)
      goto LABEL_6;
  }
  v9 = *((_DWORD *)v7 + v6 + 12);
  if (v9 != -1)
    goto LABEL_9;
LABEL_6:
  if (!v7[2] || (v9 = objc_msgSend(v7, "overflowEngineVarIndexForEngine:"), v9 == -1))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISLinExpVar variable_to_linexpvar(NSISLinearExpression *, NSISVariable *)"), CFSTR("NSISLinearExpression.m"), 610, CFSTR("Expression %@ unable to find variable %@ in engine %p"), v8, v7, *(_QWORD *)(v8 + 8));
    v9 = 0;
  }
LABEL_9:
  NSISLinExpReplaceVarWithExpression((unsigned __int16 *)(v8 + 16), v9, a1[6] + 16, a2, a3);
}

- (id)description
{
  return (id)NSISLinExpDescriptionInEngine((uint64_t)&self->linExp, (uint64_t)self->engine);
}

- (void)enumerateVariablesAndCoefficients:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__NSISLinearExpression_enumerateVariablesAndCoefficients___block_invoke;
  v3[3] = &unk_1E4A49198;
  v3[4] = self;
  v3[5] = a3;
  NSISLinExpEnumerateVarsAndCoefficients(&self->linExp.inline_capacity, (uint64_t)v3);
}

uint64_t __58__NSISLinearExpression_enumerateVariablesAndCoefficients___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "variableForEngineVarIndex:", a2), a3);
}

- (void)enumerateVariables:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSISLinearExpression_enumerateVariables___block_invoke;
  v3[3] = &unk_1E4A48E98;
  v3[4] = self;
  v3[5] = a3;
  NSISLinExpEnumerateVars(&self->linExp.inline_capacity, (uint64_t)v3);
}

uint64_t __43__NSISLinearExpression_enumerateVariables___block_invoke(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "variableForEngineVarIndex:", a2));
}

- (BOOL)enumerateVariablesAndCoefficientsUntil:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__NSISLinearExpression_enumerateVariablesAndCoefficientsUntil___block_invoke;
  v4[3] = &unk_1E4A491C0;
  v4[4] = self;
  v4[5] = a3;
  return NSISLinExpEnumerateVarsAndCoefficientsUntil(&self->linExp.inline_capacity, (uint64_t)v4);
}

uint64_t __63__NSISLinearExpression_enumerateVariablesAndCoefficientsUntil___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "variableForEngineVarIndex:", a2), a3);
}

- (unint64_t)variableCount
{
  return self->linExp.var_count;
}

- (id)variablesArray
{
  void *v3;
  _QWORD v5[6];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__NSISLinearExpression_variablesArray__block_invoke;
  v5[3] = &unk_1E4A491E8;
  v5[4] = v3;
  v5[5] = self;
  NSISLinExpEnumerateVars(&self->linExp.inline_capacity, (uint64_t)v5);
  return v3;
}

uint64_t __38__NSISLinearExpression_variablesArray__block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "variableForEngineVarIndex:", a2));
}

- (void)scaleBy:(double)a3
{
  NSISLinExpScaleByWithDroppedColProcessor((double *)&self->linExp.inline_capacity, (uint64_t)&__block_literal_global_38, a3);
}

- (void)verifyInternalIntegrity
{
  id v3;
  $80AF71A73CDF73BE2E307DE655F49DAB *p_data;
  unint64_t var_count;
  unint64_t capacity;
  double *var0;
  uint64_t v8;
  double *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  double *v14;
  _DWORD *v15;
  NSISLinearExpression *v17;
  uint64_t v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_data = &self->linExp.data;
  var_count = self->linExp.var_count;
  v19 = *MEMORY[0x1E0C9AE50];
  v17 = self;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E0C9AE50])
  {
    var0 = (double *)self->linExp.data.extern_data.var0;
    capacity = self->linExp.data.extern_data.capacity;
    if (!(_DWORD)var_count)
      goto LABEL_14;
  }
  else
  {
    capacity = self->linExp.inline_capacity;
    var0 = (double *)&self->linExp.data;
    if (!(_DWORD)var_count)
      goto LABEL_14;
  }
  v8 = 0;
  v9 = &var0[capacity];
  v10 = -1;
  do
  {
    if (var0[v8] == 0.0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("NSISLinearExpression.m"), 1055, CFSTR("Nonzero coefficient expected"));
    if (objc_msgSend(v3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v9 + v8))))objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("NSISLinearExpression.m"), 1056, CFSTR("Variable is in the array twice"));
    v11 = *((unsigned int *)v9 + v8);
    if (v8 && v10 >= v11)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("NSISLinearExpression.m"), 1058, CFSTR("Variables should be in ascending order"));
      v11 = *((unsigned int *)v9 + v8);
    }
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
    ++v8;
    v10 = v11;
  }
  while (var_count != v8);
LABEL_14:

  if (p_data->inline_slab.aligner != v19 && capacity > var_count)
  {
    v13 = capacity - var_count;
    v14 = &var0[var_count];
    v15 = (_DWORD *)&var0[capacity] + var_count;
    do
    {
      if (*v15++)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("NSISLinearExpression.m"), 1068, CFSTR("Nonzero variable in excess capacity"));
      if (*v14 != 0.0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *v14), "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("NSISLinearExpression.m"), 1069, CFSTR("Nonzero coefficient in excess capacity"));
      ++v14;
      --v13;
    }
    while (v13);
  }
}

+ (id)newExpressionWithCapacity:(unint64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSISLinearExpression.m"), 1085, CFSTR("NSISLinearExpression no longer supports newExpressionWithCapacity:"));
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return objc_msgSend(-[NSISLinearExpression variablesArray](self, "variablesArray"), "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)copyContentsAndReturnToPool
{
  uint64_t v2;
  char i;
  char v4;
  unint64_t var_count;
  unsigned __int16 *v7;
  char *p_data;
  unint64_t capacity;
  char *v10;
  uint64_t v11;
  char *v12;

  v2 = 0;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    if (pthread_getspecific(kPooledLinearExpressionKeys[v2]) == self)
      break;
    v2 = 1;
    if ((v4 & 1) == 0)
      return self;
  }
  if (!pthread_getspecific(kPooledLinearExpressionInUseKeys[v2]))
    NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "-[NSISLinearExpression copyContentsAndReturnToPool]", 1143);
  pthread_setspecific(kPooledLinearExpressionInUseKeys[v2], 0);
  var_count = self->linExp.var_count;
  v7 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", var_count, self->engine);
  expression_ensure_capacity(v7 + 8, var_count);
  p_data = (char *)&self->linExp.data;
  if (self->linExp.data.inline_slab.aligner == *MEMORY[0x1E0C9AE50])
  {
    p_data = (char *)self->linExp.data.extern_data.var0;
    capacity = self->linExp.data.extern_data.capacity;
  }
  else
  {
    capacity = self->linExp.inline_capacity;
  }
  v10 = (char *)(v7 + 16);
  if (*((_QWORD *)v7 + 4) == *MEMORY[0x1E0C9AE50])
  {
    v10 = (char *)*((_QWORD *)v7 + 5);
    v11 = *((_QWORD *)v7 + 6);
  }
  else
  {
    v11 = v7[8];
  }
  v12 = &p_data[8 * capacity];
  memmove(&v10[8 * v11], v12, 4 * var_count);
  bzero(v12, 4 * var_count);
  memmove(v10, p_data, 8 * var_count);
  self->linExp.var_count = 0;
  *((_DWORD *)v7 + 5) = var_count;
  *((_QWORD *)v7 + 3) = *(_QWORD *)&self->linExp.constant;
  self->linExp.constant = 0.0;
  self->engine = 0;
  return v7;
}

+ (id)acquireFromPoolForUseCase:(int64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSISLinearExpression.m"), 1178, CFSTR("NSISLinearExpression no longer supports acquireFromPoolForUseCase:"));
  return 0;
}

@end

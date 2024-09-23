@implementation NSISVariable

- (int)orientationHint
{
  return -[NSISVariableDelegate nsis_orientationHintForVariable:](self->_delegate, "nsis_orientationHintForVariable:", self);
}

+ (id)variableMarkingConstraint:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  __CFString *v6;
  id v7;

  if (a4 == 2)
  {
    if (a5)
    {
      v6 = CFSTR("It doesn't make sense to minimize a variable that is restricted to zero");
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (a4 == 1)
  {
LABEL_9:
    v6 = (__CFString *)objc_opt_class();
    goto LABEL_10;
  }
  if (a4)
    v6 = 0;
  else
    v6 = CFSTR("An unrestricted variable cannot be a marker");
LABEL_10:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  v7 = objc_alloc_init((Class)v6);
  objc_msgSend(v7, "setDelegate:", a3);
  return v7;
}

+ (id)variableWithDelegate:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  __CFString *v6;
  id v7;

  if (a4 == 2)
  {
    v6 = CFSTR("A variable that is restricted to take value zero should always be a marker");
    goto LABEL_10;
  }
  if (a4 != 1)
  {
    if (a4)
    {
      v6 = 0;
      goto LABEL_10;
    }
    if (a5)
    {
      v6 = CFSTR("An unrestricted variable cannot be minimized");
      goto LABEL_10;
    }
  }
  v6 = (__CFString *)objc_opt_class();
LABEL_10:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  v7 = objc_alloc_init((Class)v6);
  objc_msgSend(v7, "setDelegate:", a3);
  return v7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSISVariableDelegate *)a3;
}

- (NSISVariable)init
{
  NSISVariable *result;
  unsigned int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSISVariable;
  result = -[NSISVariable init](&v4, sel_init);
  do
    v3 = __ldaxr(&init_sNextIdent);
  while (__stlxr(v3 + 1, &init_sNextIdent));
  result->_ident = v3;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__NSISVariable_dealloc__block_invoke;
  v4[3] = &unk_1E4A484D8;
  v4[4] = self;
  -[NSISVariable _enumerateEngines:]((uint64_t)self, (uint64_t)v4);

  v3.receiver = self;
  v3.super_class = (Class)NSISVariable;
  -[NSISVariable dealloc](&v3, sel_dealloc);
}

- (uint64_t)_enumerateEngines:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = 0;
    v5 = result + 24;
    do
    {
      if (*(_QWORD *)(v5 + v4))
        (*(void (**)(uint64_t))(a2 + 16))(a2);
      v4 += 8;
    }
    while (v4 != 24);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (void *)objc_msgSend(*(id *)(v3 + 16), "keyEnumerator", 0);
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9))
            (*(void (**)(uint64_t))(a2 + 16))(a2);
          ++v9;
        }
        while (v7 != v9);
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSISVariableDelegate)delegate
{
  return self->_delegate;
}

- (unint64_t)hash
{
  return self->_ident;
}

+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5 valueIsUserObservable:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  NSISInlineStorageVariable *v10;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = objc_alloc_init(NSISInlineStorageVariable);
  -[NSISVariable setDelegate:](v10, "setDelegate:", v10);
  -[NSISInlineStorageVariable setName:](v10, "setName:", a3);
  -[NSISInlineStorageVariable setValueRestriction:](v10, "setValueRestriction:", v8);
  -[NSISInlineStorageVariable setShouldBeMinimized:](v10, "setShouldBeMinimized:", v7);
  -[NSISInlineStorageVariable setValueIsUserObservable:](v10, "setValueIsUserObservable:", v6);
  return v10;
}

+ (id)variableWithName:(id)a3 valueRestriction:(int)a4 shouldBeMinimized:(BOOL)a5
{
  return (id)objc_msgSend(a1, "variableWithName:valueRestriction:shouldBeMinimized:valueIsUserObservable:", a3, *(_QWORD *)&a4, a5, 0);
}

uint64_t __23__NSISVariable_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endBookkeepingForVariableIfUnused:", *(_QWORD *)(a1 + 32));
}

- (NSISVariable)initWithCoder:(id)a3
{
  NSISVariable *v5;
  uint64_t v6;
  NSISVariable *v7;

  v5 = -[NSISVariable init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSISVariable_delegate"));
    v5->_delegate = (NSISVariableDelegate *)v6;
    if (!v6)
    {
      v7 = v5;
      if (!v5->_delegate)
      return 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISVariable.m"), 186, CFSTR("NSISVariable (%@) cannot be encoded with delegate (%@) that does not conform to NSCoding"), self, self->_delegate);
  objc_msgSend(a3, "encodeConditionalObject:forKey:", self->_delegate, CFSTR("NSISVariable_delegate"));
}

- (NSArray)engines
{
  NSArray *v3;
  _QWORD v5[5];

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__NSISVariable_engines__block_invoke;
  v5[3] = &unk_1E4A484D8;
  v5[4] = v3;
  -[NSISVariable _enumerateEngines:]((uint64_t)self, (uint64_t)v5);
  return v3;
}

uint64_t __23__NSISVariable_engines__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)overflowEngineVarIndexForEngine:(id)a3
{
  void *value;

  value = 0;
  if (NSMapMember(self->_overflowEngines, a3, 0, &value))
    return ($738B17BD11CC339B30296C0EA03CEC2B)value;
  else
    return ($738B17BD11CC339B30296C0EA03CEC2B)-1;
}

- (uint64_t)_delegateDescription
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 8), "nsis_descriptionOfVariable:", result);
    if (!result)
      return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<orphaned without delegate (bug!):%p>"), v1);
  }
  return result;
}

- (id)descriptionInEngine:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t ident;
  uint64_t value;

  if (self)
  {
    v5 = (void *)-[NSISVariableDelegate nsis_descriptionOfVariable:](self->_delegate, "nsis_descriptionOfVariable:", self);
    if (!v5)
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<orphaned without delegate (bug!):%p>"), self);
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
  v7 = (void *)MEMORY[0x1E0CB3940];
  ident = self->_ident;
  while (self->_engines[v6] != a3)
  {
    if (++v6 == 3)
      goto LABEL_9;
  }
  value = self->_engineVarIndexes[v6].value;
  if ((_DWORD)value != -1)
    return (id)objc_msgSend(v5, "stringByAppendingString:", objc_msgSend(v7, "stringWithFormat:", CFSTR("{id: %u, var: %u}"), ident, value));
LABEL_9:
  if (self->_overflowEngines)
    value = (uint64_t)-[NSISVariable overflowEngineVarIndexForEngine:](self, "overflowEngineVarIndexForEngine:", a3);
  else
    value = 0xFFFFFFFFLL;
  return (id)objc_msgSend(v5, "stringByAppendingString:", objc_msgSend(v7, "stringWithFormat:", CFSTR("{id: %u, var: %u}"), ident, value));
}

- (id)description
{
  void *v3;

  if (self)
  {
    v3 = (void *)-[NSISVariableDelegate nsis_descriptionOfVariable:](self->_delegate, "nsis_descriptionOfVariable:", self);
    if (!v3)
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<orphaned without delegate (bug!):%p>"), self);
  }
  else
  {
    v3 = 0;
  }
  return (id)objc_msgSend(v3, "stringByAppendingString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{id: %u}"), self->_ident));
}

- (BOOL)shouldBeIntegral
{
  return 0;
}

- (double)allowedMagnitudeForIntegralizationAdjustmentOfMarkedConstraint
{
  return 0.0;
}

- (BOOL)markedConstraintIsEligibleForIntegralizationAdjustment
{
  return 0;
}

- (BOOL)valueIsUserVisible
{
  return -[NSISVariableDelegate nsis_valueOfVariableIsUserObservable:](-[NSISVariable delegate](self, "delegate"), "nsis_valueOfVariableIsUserObservable:", self);
}

- (int)valueRestriction
{
  void *v2;
  NSString *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(v2, "stringWithFormat:", CFSTR("Method %@ must be implemented by subclasser %@"), v3, objc_opt_class()), 0);
  objc_exception_throw(v4);
}

- (BOOL)shouldBeMinimized
{
  void *v2;
  NSString *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(v2, "stringWithFormat:", CFSTR("Method %@ must be implemented by subclasser %@"), v3, objc_opt_class()), 0);
  objc_exception_throw(v4);
}

- (id)markedConstraint
{
  void *v2;
  NSString *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(v2, "stringWithFormat:", CFSTR("Method %@ must be implemented by subclasser %@"), v3, objc_opt_class()), 0);
  objc_exception_throw(v4);
}

@end

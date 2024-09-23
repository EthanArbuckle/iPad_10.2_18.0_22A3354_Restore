@implementation CUIKUserOperation

+ (id)operationForContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "objectsBeingEdited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "_currentSpan");

  v8 = (void *)objc_msgSend(v5, "initWithObjects:span:createdAsInverseOfAnotherOperation:", v6, v7, 0);
  return v8;
}

+ (id)operationWithObjects:(id)a3 span:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:span:createdAsInverseOfAnotherOperation:", v6, a4, 1);

  return v7;
}

- (CUIKUserOperation)initWithObjects:(id)a3 span:(int64_t)a4 createdAsInverseOfAnotherOperation:(BOOL)a5
{
  id v9;
  CUIKUserOperation *v10;
  CUIKUserOperation *v11;
  uint64_t v12;
  NSArray *originalObjects;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserOperation;
  v10 = -[CUIKUserOperation init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objects, a3);
    v11->_span = -[CUIKUserOperation _spanFromSpan:objects:](v11, "_spanFromSpan:objects:", a4, v9);
    v12 = objc_msgSend(v9, "copy");
    originalObjects = v11->_originalObjects;
    v11->_originalObjects = (NSArray *)v12;

    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_eventStore, v15);

    v11->_createdAsInverseOfAnotherOperation = a5;
  }

  return v11;
}

- (int64_t)_spanFromSpan:(int64_t)a3 objects:(id)a4
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CUIKUserOperation objects](self, "objects", 1, a4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v4 = 1;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v10, "isFirstOccurrenceIncludingSlices"))
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v4 = 4;
    }

  }
  return v4;
}

- (NSString)actionName
{
  void *v3;

  -[CUIKUserOperation precomputedActionName](self, "precomputedActionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CUIKUserOperation precomputedActionName](self, "precomputedActionName");
  else
    -[CUIKUserOperation _actionName](self, "_actionName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_precomputeActionName
{
  id v3;

  -[CUIKUserOperation _actionName](self, "_actionName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CUIKUserOperation setPrecomputedActionName:](self, "setPrecomputedActionName:", v3);

}

- (BOOL)executeWithUndoDelegate:(id)a3
{
  BOOL v4;
  id v5;
  id v7;

  v7 = 0;
  v4 = -[CUIKUserOperation _executeWithUndoDelegate:error:](self, "_executeWithUndoDelegate:error:", a3, &v7);
  v5 = v7;
  -[CUIKUserOperation setError:](self, "setError:", v5);

  return v4;
}

- (void)_precomputeInverseOperation
{
  void *v3;

  -[CUIKUserOperation _inverseOperation](self, "_inverseOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKUserOperation setPrecomputedInverseOperation:](self, "setPrecomputedInverseOperation:", v3);

  -[CUIKUserOperation setInverseOperationPrecomputed:](self, "setInverseOperationPrecomputed:", 1);
}

- (id)inverseOperation
{
  if (-[CUIKUserOperation inverseOperationPrecomputed](self, "inverseOperationPrecomputed"))
    -[CUIKUserOperation precomputedInverseOperation](self, "precomputedInverseOperation");
  else
    -[CUIKUserOperation _inverseOperation](self, "_inverseOperation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_inverseOperation
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = -[CUIKUserOperation _inverseOperationClass](self, "_inverseOperationClass");
  if (v3)
  {
    -[CUIKUserOperation _objectsForInverse](self, "_objectsForInverse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[objc_class operationWithObjects:span:](v3, "operationWithObjects:span:", v4, -[CUIKUserOperation _inverseOperationSpan](self, "_inverseOperationSpan"));
      v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
      -[CUIKUserOperation originalObjects](self, "originalObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class setOriginalObjects:](v3, "setOriginalObjects:", v5);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)objects
{
  return self->_objects;
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)setEventStore:(id)a3
{
  objc_storeWeak((id *)&self->_eventStore, a3);
}

- (int64_t)span
{
  return self->_span;
}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (void)setOriginalObjects:(id)a3
{
  objc_storeStrong((id *)&self->_originalObjects, a3);
}

- (NSArray)originalSliceDescriptions
{
  return self->_originalSliceDescriptions;
}

- (void)setOriginalSliceDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_originalSliceDescriptions, a3);
}

- (NSString)precomputedActionName
{
  return self->_precomputedActionName;
}

- (void)setPrecomputedActionName:(id)a3
{
  objc_storeStrong((id *)&self->_precomputedActionName, a3);
}

- (CUIKUserOperation)precomputedInverseOperation
{
  return self->_precomputedInverseOperation;
}

- (void)setPrecomputedInverseOperation:(id)a3
{
  objc_storeStrong((id *)&self->_precomputedInverseOperation, a3);
}

- (BOOL)inverseOperationPrecomputed
{
  return self->_inverseOperationPrecomputed;
}

- (void)setInverseOperationPrecomputed:(BOOL)a3
{
  self->_inverseOperationPrecomputed = a3;
}

- (BOOL)createdAsInverseOfAnotherOperation
{
  return self->_createdAsInverseOfAnotherOperation;
}

- (void)setCreatedAsInverseOfAnotherOperation:(BOOL)a3
{
  self->_createdAsInverseOfAnotherOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputedInverseOperation, 0);
  objc_storeStrong((id *)&self->_precomputedActionName, 0);
  objc_storeStrong((id *)&self->_originalSliceDescriptions, 0);
  objc_storeStrong((id *)&self->_originalObjects, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (id)_actionName
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (Class)_inverseOperationClass
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end

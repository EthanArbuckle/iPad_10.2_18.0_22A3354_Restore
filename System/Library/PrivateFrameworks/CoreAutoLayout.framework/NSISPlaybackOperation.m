@implementation NSISPlaybackOperation

- (NSISPlaybackOperation)init
{
  NSISPlaybackOperation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSISPlaybackOperation;
  v2 = -[NSISPlaybackOperation init](&v4, sel_init);
  v2->oldIdentsToNewVariables = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->variableDelegates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (id)unwrapVariable:(id)a3
{
  uint64_t v5;
  id v6;
  NSISPlaybackOperationVariableDelegate *v7;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("ident"));
  v6 = (id)-[NSMutableDictionary objectForKey:](self->oldIdentsToNewVariables, "objectForKey:", v5);
  if (!v6)
  {
    v6 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("class"))));
    v7 = objc_alloc_init(NSISPlaybackOperationVariableDelegate);
    -[NSISPlaybackOperationVariableDelegate setVariableDescription:](v7, "setVariableDescription:", objc_msgSend(a3, "objectForKey:", CFSTR("description")));
    -[NSISPlaybackOperationVariableDelegate setMarkedConstraintDescription:](v7, "setMarkedConstraintDescription:", objc_msgSend(a3, "objectForKey:", CFSTR("markedConstraintDescription")));
    -[NSISPlaybackOperationVariableDelegate setVariableIsUserObservable:](v7, "setVariableIsUserObservable:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("userObservable")), "BOOLValue"));
    -[NSISPlaybackOperationVariableDelegate setOrientationHint:](v7, "setOrientationHint:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("orientationHint")), "intValue"));
    -[NSISPlaybackOperationVariableDelegate setVariable:](v7, "setVariable:", v6);
    objc_msgSend(v6, "setDelegate:", v7);
    -[NSMutableArray addObject:](self->variableDelegates, "addObject:", v7);

    -[NSMutableDictionary setObject:forKey:](self->oldIdentsToNewVariables, "setObject:forKey:", v6, v5);
  }
  return v6;
}

- (id)unwrapLinearExpression:(id)a3 onEngine:(id)a4
{
  NSISLinearExpression *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;

  v6 = -[NSISLinearExpression initWithEngine:]([NSISLinearExpression alloc], "initWithEngine:", a4);
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("variables"));
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("coefficients"));
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      -[NSISLinearExpression addVariable:coefficient:](v6, "addVariable:coefficient:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v7, "objectAtIndex:", i)), NSISUnwrapExactFloat((void *)objc_msgSend(v8, "objectAtIndex:", i)));
  }
  -[NSISLinearExpression incrementConstant:](v6, "incrementConstant:", NSISUnwrapExactFloat((void *)objc_msgSend(a3, "objectForKey:", CFSTR("constant"))));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSISPlaybackOperation;
  -[NSISPlaybackOperation dealloc](&v3, sel_dealloc);
}

- (void)playbackOneAction:(id)a3 onEngine:(id)a4
{
  char *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  double v15;
  uint64_t v16;
  uint64_t v17;

  v7 = (char *)NSSelectorFromString((NSString *)objc_msgSend(a3, "objectForKey:", CFSTR("command")));
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("args"));
  v9 = v8;
  if (v7 == sel_setShouldIntegralize_)
  {
    objc_msgSend(a4, "setValue:forKey:", objc_msgSend(v8, "objectAtIndex:", 0), CFSTR("shouldIntegralize"));
  }
  else if (v7 == sel_optimize)
  {
    objc_msgSend(a4, "optimize");
  }
  else if (v7 == sel__optimizeWithoutRebuilding)
  {
    objc_msgSend(a4, "_optimizeWithoutRebuilding");
  }
  else if (v7 == sel_tryToAddConstraintWithMarker_expression_mutuallyExclusiveConstraints_
         || v7 == sel_tryToAddConstraintWithMarker_expression_integralizationAdjustment_mutuallyExclusiveConstraints_)
  {
    v17 = 0;
    v10 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0));
    v11 = -[NSISPlaybackOperation unwrapLinearExpression:onEngine:](self, "unwrapLinearExpression:onEngine:", objc_msgSend(v9, "objectAtIndex:", 1), a4);
    if (v7 == sel_tryToAddConstraintWithMarker_expression_integralizationAdjustment_mutuallyExclusiveConstraints_)
      v12 = 3;
    else
      v12 = 2;
    if (objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v12), "BOOLValue"))
      v13 = &v17;
    else
      v13 = 0;
    objc_msgSend(a4, "tryToAddConstraintWithMarker:expression:mutuallyExclusiveConstraints:", v10, v11, v13);
  }
  else if (v7 == sel_addVariableToBeOptimized_priority_)
  {
    objc_msgSend(a4, "addVariableToBeOptimized:priority:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0)), NSISUnwrapExactFloat((void *)objc_msgSend(v8, "objectAtIndex:", 1)));
  }
  else if (v7 == sel_removeVariableToBeOptimized_priority_)
  {
    objc_msgSend(a4, "removeVariableToBeOptimized:priority:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0)), NSISUnwrapExactFloat((void *)objc_msgSend(v8, "objectAtIndex:", 1)));
  }
  else if (v7 == sel_changeVariableToBeOptimized_fromPriority_toPriority_)
  {
    v14 = -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0));
    v15 = NSISUnwrapExactFloat((void *)objc_msgSend(v9, "objectAtIndex:", 1));
    objc_msgSend(a4, "changeVariableToBeOptimized:fromPriority:toPriority:", v14, v15, NSISUnwrapExactFloat((void *)objc_msgSend(v9, "objectAtIndex:", 2)));
  }
  else if (v7 == sel_removeConstraintWithMarker_)
  {
    objc_msgSend(a4, "removeConstraintWithMarker:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0)));
  }
  else if (v7 == sel_constraintDidChangeSuchThatMarker_shouldBeReplacedByMarkerPlusDelta_)
  {
    objc_msgSend(a4, "constraintDidChangeSuchThatMarker:shouldBeReplacedByMarkerPlusDelta:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0)), NSISUnwrapExactFloat((void *)objc_msgSend(v8, "objectAtIndex:", 1)));
  }
  else
  {
    if (v7 != sel_tryToChangeConstraintSuchThatMarker_isReplacedByMarkerPlusDelta_undoHandler_)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown playback selector %@"), objc_msgSend(a3, "objectForKey:", CFSTR("command")));
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
    }
    objc_msgSend(a4, "tryToChangeConstraintSuchThatMarker:isReplacedByMarkerPlusDelta:undoHandler:", -[NSISPlaybackOperation unwrapVariable:](self, "unwrapVariable:", objc_msgSend(v8, "objectAtIndex:", 0)), &__block_literal_global_4, NSISUnwrapExactFloat((void *)objc_msgSend(v8, "objectAtIndex:", 1)));
  }
}

@end

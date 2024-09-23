@implementation NSISEngine

- (NSISEngineDelegate)delegate
{
  return self->_delegate;
}

- (CGSize)engineScalingCoefficients
{
  double width;
  double height;
  CGSize result;

  width = self->_engineScalingCoefficients.width;
  height = self->_engineScalingCoefficients.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)variableChangeCount
{
  return self->_variableChangeCount;
}

- (void)performPendingChangeNotifications
{
  BOOL allowUnoptimizedReads;
  _NSISVariableObservable *i;
  _NSISVariableObservable *nextDirtyObservable;
  NSISVariableObservation *dirtyVariableObservations;
  NSISVariableObservation *nextDirtyObservation;
  NSEnumerator *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  NSISObjectTable *variablesObservations;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (_NSConstraintBasedLayoutAriadneTracepoints())
    kdebug_trace();
  -[NSISEngine optimize](self, "optimize");
  if (self->_changeNotificationsDirty)
  {
    self->_changeNotificationsDirty = 0;
    allowUnoptimizedReads = self->_allowUnoptimizedReads;
    self->_allowUnoptimizedReads = 1;
    if (_NSConstraintBasedLayoutTrackDirtyObservables())
    {
      for (i = self->_dirtyObservables; i; i = self->_dirtyObservables)
      {
        nextDirtyObservable = i->_nextDirtyObservable;
        self->_dirtyObservables = nextDirtyObservable;
        if (nextDirtyObservable)
          nextDirtyObservable->_prevDirtyObservable = 0;
        i->_nextDirtyObservable = 0;
        i->_prevDirtyObservable = 0;
        -[_NSISVariableObservable emitValueIfNeeded](i, "emitValueIfNeeded");
      }
      dirtyVariableObservations = self->_dirtyVariableObservations;
      self->_dirtyVariableObservations = 0;
      if (dirtyVariableObservations)
      {
        do
        {
          -[NSISVariableObservation emitValueIfNeededWithEngine:](dirtyVariableObservations, "emitValueIfNeededWithEngine:", self);
          nextDirtyObservation = dirtyVariableObservations->_nextDirtyObservation;
          dirtyVariableObservations->_nextDirtyObservation = 0;
          dirtyVariableObservations->_prevDirtyObservation = 0;

          if (!nextDirtyObservation)
          {
            nextDirtyObservation = self->_dirtyVariableObservations;
            self->_dirtyVariableObservations = 0;
          }
          dirtyVariableObservations = nextDirtyObservation;
        }
        while (nextDirtyObservation);
      }
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = -[NSMapTable objectEnumerator](self->_variableObservables, "objectEnumerator");
      v9 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "emitValueIfNeeded");
          }
          v10 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
      variablesObservations = self->_variablesObservations;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__NSISEngine_performPendingChangeNotifications__block_invoke;
      v14[3] = &unk_1E4A48880;
      v14[4] = self;
      NSISObjectTableForEach((uint64_t)variablesObservations, (uint64_t)v14);
    }
    -[NSObservable receiveObservedValue:](self->_variableChangeTransactionSignal, "receiveObservedValue:", *MEMORY[0x1E0C9AE50]);
    self->_allowUnoptimizedReads = allowUnoptimizedReads;
  }
  if (_NSConstraintBasedLayoutAriadneTracepoints())
    kdebug_trace();
}

- (unint64_t)optimize
{
  unint64_t v3;
  unint64_t v4;

  -[NSISEngine _flushPendingRemovals]();
  if (_NSConstraintBasedLayoutAriadneTracepoints())
  {
    -[NSISEngine delegate](self, "delegate");
    kdebug_trace();
  }
  if (self->_engineNeedsRebuildFromConstraints
    || (v3 = -[NSISEngine _optimizeWithoutRebuilding](self, "_optimizeWithoutRebuilding"),
        self->_engineNeedsRebuildFromConstraints))
  {
    -[NSISEngine rebuildFromConstraints]((uint64_t)self);
    v4 = -[NSISEngine _optimizeWithoutRebuilding](self, "_optimizeWithoutRebuilding");
    if (self->_engineNeedsRebuildFromConstraints)
    {
      NSLog(&CFSTR("Failed to rebuild layout engine without detectable loss of precision.  This should never happen.  Performan"
                   "ce and correctness may suffer.").isa);
    }
    else if (_NSConstraintBasedLayoutLogEngineRebuilds())
    {
      NSLog(CFSTR("Sucessfully rebuilt layout engine."));
    }
  }
  else
  {
    v4 = v3;
  }
  if (_NSConstraintBasedLayoutAriadneTracepoints())
  {
    -[NSISEngine delegate](self, "delegate");
    kdebug_trace();
  }
  return v4;
}

- (BOOL)tryAddingDirectly:(uint64_t)a3
{
  _BOOL8 v6;
  __int128 v7;
  double v8;
  _QWORD *v9;
  __int128 v11;
  char v12;

  if (!a1)
    return 0;
  v12 = 0;
  v11 = 0uLL;
  v6 = -[NSISEngine chooseHeadForRow:chosenCol:outNewToEngine:](a1, a2, a3, &v11, &v12);
  if (v6)
  {
    v7 = v11;
    v8 = -1.0 / NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**((_QWORD **)&v11 + 1) + 16));
    if ((*(_BYTE *)(a3 + 80) & 1) != 0)
      -[NSISObjectiveLinearExpression removeVar:](*(_QWORD *)(a3 + 16), *(_DWORD *)(**((_QWORD **)&v7 + 1) + 16));
    else
      NSISLinExpRemoveVar((unsigned __int16 *)(a3 + 16), *(_DWORD *)(**((_QWORD **)&v7 + 1) + 16));
    NSISLinExpScaleBy((double *)(a3 + 16), v8);
    _substituteOutAllOccurencesOfBodyVar(a1, v7, *((uint64_t *)&v7 + 1), a2, a3);
    v9 = (_QWORD *)**((_QWORD **)&v7 + 1);
    _row_setHead(a2, a3, v7, *((id ***)&v7 + 1));
    _noteValueOfVariableChanged(a1, v7, v9);
  }
  return v6;
}

- (BOOL)chooseHeadForRow:(uint64_t)a3 chosenCol:(_OWORD *)a4 outNewToEngine:(char *)a5
{
  uint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BOOL8 v16;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t *v21;
  _QWORD v22[9];
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  _QWORD v26[9];
  _QWORD v27[3];
  char v28;
  _QWORD v29[3];
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;

  if (!a1)
    return 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v35 = a1;
  v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  *a5 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke;
  v26[3] = &unk_1E4A48938;
  v26[4] = v29;
  v26[5] = &v31;
  v26[7] = v27;
  v26[8] = a5;
  v26[6] = &v37;
  v9 = (unsigned __int16 *)(a3 + 16);
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = ___row_enumerateColsWithCoefficientsUntil_block_invoke;
  v44 = &unk_1E4A48F30;
  v45 = a2;
  v46 = v26;
  NSISLinExpEnumerateVarsAndCoefficientsUntil((unsigned __int16 *)(a3 + 16), (uint64_t)&v41);
  if (!*((_BYTE *)v38 + 24) && NSISLinExpConstant((uint64_t)v9) == 0.0)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 1;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke_2;
    v22[3] = &unk_1E4A48960;
    v22[4] = v23;
    v22[5] = &v37;
    v22[6] = v25;
    v22[7] = &v31;
    v22[8] = a5;
    v41 = v8;
    v42 = 3221225472;
    v43 = ___row_enumerateColsUntil_block_invoke;
    v44 = &unk_1E4A48F58;
    v45 = a2;
    v46 = v22;
    NSISLinExpEnumerateVarsUntil(v9, (uint64_t)&v41);
    if (!*a5)
    {
      if (*((_BYTE *)v38 + 24)
        && (v11 = v32[4],
            v10 = v32[5],
            v12 = v10 + 8,
            v13 = NSBitSetCount(v10 + 8),
            v14 = v10 + 24,
            NSBitSetCount(v14) + v13))
      {
        v18 = NSBitSetCount(v12);
        if (NSBitSetCount(v14) + v18 == 1)
        {
          v19 = *(_DWORD *)(*(_QWORD *)(v11 + 408) + 8);
          if (HIWORD(v19))
            v20 = v19 - 0x40000000;
          else
            v20 = v19;
          if (HIWORD(v19))
            v21 = (uint64_t *)v14;
          else
            v21 = (uint64_t *)v12;
          v15 = NSBitSetContainsIndex(v21, v20);
        }
        else
        {
          v15 = 0;
        }
      }
      else
      {
        v15 = 1;
      }
      *a5 = v15;
    }
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
  }
  *a4 = *((_OWORD *)v32 + 2);
  v16 = *((_BYTE *)v38 + 24) != 0;
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v16;
}

uint64_t __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t *v19;

  v7 = *(_DWORD *)(*(_QWORD *)a3 + 24) & 6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (!v7)
    {
      v8 = NSBitSetCount(a3 + 8);
      if (!(NSBitSetCount(a3 + 24) + v8))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(_QWORD *)(v9 + 32) = a2;
        *(_QWORD *)(v9 + 40) = a3;
        v10 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        result = 1;
LABEL_9:
        **(_BYTE **)(a1 + 64) = v10;
        return result;
      }
    }
    return 0;
  }
  if (!v7)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a2;
    *(_QWORD *)(v12 + 40) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v13 = NSBitSetCount(a3 + 8);
    v10 = NSBitSetCount(a3 + 24) + v13 == 0;
    result = v10;
    goto LABEL_9;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    return 0;
  result = 0;
  if (a4 < 0.0 && v7 != 4)
  {
    v14 = NSBitSetCount(a3 + 8);
    if (!(NSBitSetCount(a3 + 24) + v14))
      goto LABEL_14;
    v16 = NSBitSetCount(a3 + 8);
    if (NSBitSetCount(a3 + 24) + v16 != 1)
      return 0;
    v17 = *(_DWORD *)(*(_QWORD *)(a2 + 408) + 8);
    v18 = HIWORD(v17) ? v17 - 0x40000000 : v17;
    v19 = (uint64_t *)(HIWORD(v17) ? a3 + 24 : a3 + 8);
    result = NSBitSetContainsIndex(v19, v18);
    if ((_DWORD)result)
    {
LABEL_14:
      result = 0;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v15 + 32) = a2;
      *(_QWORD *)(v15 + 40) = a3;
      v10 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_9;
    }
  }
  return result;
}

- (void)beginBookkeepingForVariableIfNeeded:(id)a3
{
  _engineVar_addForVariableIfNeeded((uint64_t)self, a3);
}

- (BOOL)tryToAddConstraintWithMarker:(id)a3 expression:(id)a4 mutuallyExclusiveConstraints:(id *)a5
{
  NSMutableDictionary *recordedOperations;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id **v20;
  $3E203C1A4D83D8254D06B66E229CD352 *rowTables;
  int v22;
  unsigned int *p_freeIndexes;
  unint64_t Index;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  id *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int value;
  uint64_t *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSISVariable *placeholderHeadForExpressionBeingAdded;
  id *v45;

  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  ++self->_totalChangeCount;
  -[NSISEngine _flushPendingRemovals]();
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5 != 0);
    _NSISRecordOperation(recordedOperations, a2, v11, v12, v13, v14, v15, v16, (unsigned int *)a3, (uint64_t)a4);
  }
  if (_NSConstraintBasedLayoutDebug())
    NSLog(CFSTR("engine %p adding constraint %@"), self, objc_msgSend(a3, "markedConstraint"));
  v43 = a4;
  if (_NSConstraintBasedLayoutDebugEngineConsistency()
    && -[NSISEngine hasValue:forVariable:](self, "hasValue:forVariable:", 0, a3))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 2337, CFSTR("It's not legal to add a constraint twice.  %@ is already added."), objc_msgSend(a3, "markedConstraint"));
  }
  placeholderHeadForExpressionBeingAdded = self->_placeholderHeadForExpressionBeingAdded;
  v45 = a5;
  v17 = _engineVar_addForVariableIfNeeded((uint64_t)self, placeholderHeadForExpressionBeingAdded);
  v19 = (_QWORD *)v18;
  if ((*(_BYTE *)(v18 + 24) & 1) != 0)
  {
    v37 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v19);
  }
  v20 = (id **)v19[1];
  rowTables = self->_rowTables;
  v22 = objc_msgSend(a3, "orientationHint");
  p_freeIndexes = (unsigned int *)&self->_rowTables[v22].freeIndexes;
  if (!NSBitSetCount((uint64_t)p_freeIndexes))
    _table_addStorageBlock((void **)&rowTables[v22].blocks, &rowTables[v22].blocksCount, &rowTables[v22].blocksCapacity, 0x17uLL, 88, p_freeIndexes);
  Index = NSBitSetFirstIndex((uint64_t **)p_freeIndexes);
  v25 = Index;
  NSBitSetRemoveIndex((uint64_t *)p_freeIndexes, Index);
  v26 = v25 | (v22 << 30);
  v27 = *((_QWORD *)rowTables[(v26 >> 30) & 1].blocks + (v26 & 0xBFFFFFFF) / 0x17uLL)
      + 88 * ((v26 & 0xBFFFFFFF) % 0x17);
  *(_QWORD *)v27 = 0;
  *(_DWORD *)(v27 + 8) = v26;
  *(_DWORD *)(v27 + 12) = 0;
  *(_WORD *)(v27 + 16) = 4;
  *(_OWORD *)(v27 + 18) = 0u;
  *(_OWORD *)(v27 + 34) = 0u;
  *(_OWORD *)(v27 + 50) = 0u;
  *(_OWORD *)(v27 + 66) = 0u;
  *(_QWORD *)(v27 + 80) = 0;
  _row_rawSetHead((uint64_t)self, (_DWORD *)v27, v17, v20);
  -[NSISEngine copyExpressionSubstitutingRowHeadVariables:intoRow:]((unsigned __int16 *)self, (uint64_t)v43, (uint64_t)self, v27);
  v28 = 0;
  while (*((NSISEngine **)a3 + v28 + 3) != self)
  {
    if (++v28 == 3)
      goto LABEL_17;
  }
  v29 = *((_DWORD *)a3 + v28 + 12);
  if (v29 != -1)
    goto LABEL_20;
LABEL_17:
  if (*((_QWORD *)a3 + 2))
    v29 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v29 = -1;
LABEL_20:
  v30 = (id *)(*(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v29 >> 3) & 0x1FFFFFF8))
             + 32 * (v29 & 0x3F));
  if (*((_DWORD *)v30 + 4) == -1)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*v30 != a3)
  {
    v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v30, a3);
  }
  if ((v19[3] & 1) == 0)
  {
    v40 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 115, CFSTR("Tried accessing the row index for a variable that isn't a row head:%@"), *v19);
  }
  v31 = -[NSISEngine _tryToAddConstraintWithMarkerEngineVar:row:mutuallyExclusiveConstraints:]((uint64_t)self, (uint64_t)self, v30, v17, v19[1], v45);
  if (placeholderHeadForExpressionBeingAdded)
  {
    v32 = 0;
    while (placeholderHeadForExpressionBeingAdded->_engines[v32] != self)
    {
      if (++v32 == 3)
        goto LABEL_32;
    }
    if (placeholderHeadForExpressionBeingAdded->_engineVarIndexes[v32].value != -1)
      goto LABEL_34;
LABEL_32:
    if (!placeholderHeadForExpressionBeingAdded->_overflowEngines
      || -[NSISVariable overflowEngineVarIndexForEngine:](placeholderHeadForExpressionBeingAdded, "overflowEngineVarIndexForEngine:", self) == -1)
    {
      return v31;
    }
LABEL_34:
    v33 = 0;
    while (placeholderHeadForExpressionBeingAdded->_engines[v33] != self)
    {
      if (++v33 == 3)
        goto LABEL_39;
    }
    value = placeholderHeadForExpressionBeingAdded->_engineVarIndexes[v33].value;
    if (value != -1)
      goto LABEL_42;
LABEL_39:
    if (placeholderHeadForExpressionBeingAdded->_overflowEngines)
      value = -[NSISVariable overflowEngineVarIndexForEngine:](placeholderHeadForExpressionBeingAdded, "overflowEngineVarIndexForEngine:", self);
    else
      value = -1;
LABEL_42:
    v35 = (uint64_t *)(*(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)value >> 3) & 0x1FFFFFF8))
                    + 32 * (value & 0x3F));
    if (*((_DWORD *)v35 + 4) == -1)
    {
      v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), placeholderHeadForExpressionBeingAdded, self);
    }
    if ((NSISVariable *)*v35 != placeholderHeadForExpressionBeingAdded)
    {
      v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v35, placeholderHeadForExpressionBeingAdded);
    }
    _engineVar_rawRemove((uint64_t)self, v35);
  }
  return v31;
}

- (void)_flushPendingRemovals
{
  uint64_t v0;
  unsigned __int8 *v1;
  void *v2;
  void *v3;
  unint64_t v4;
  size_t v5;
  int v6;
  _BYTE *v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD *);
  void *v20;
  unsigned __int8 *v21;
  _BYTE v22[32768];
  uint64_t v23;

  v0 = MEMORY[0x1E0C80A78]();
  v23 = *MEMORY[0x1E0C80C00];
  if (v0)
  {
    v1 = (unsigned __int8 *)v0;
    v2 = *(void **)(v0 + 16);
    if (v2)
    {
      v3 = *(void **)(v0 + 24);
      *(_QWORD *)(v0 + 16) = 0;
      *(_QWORD *)(v0 + 24) = 0;
      v4 = objc_msgSend(v2, "count");
      v5 = v4;
      v6 = v1[157];
      if (v1[157])
        v1[157] = 0;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __35__NSISEngine__flushPendingRemovals__block_invoke;
      v20 = &unk_1E4A48A88;
      v21 = v1;
      if (v4 > 0x1000)
      {
        v7 = malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
        objc_msgSend(v2, "getObjects:range:", v7, 0, v5);
      }
      else
      {
        v7 = v22;
        objc_msgSend(v2, "getObjects:range:", v22, 0, v4);
        if (!v5)
        {
LABEL_21:

          if (v6)
            v1[157] = 1;
          return;
        }
      }
      v8 = v5;
      do
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __35__NSISEngine__flushPendingRemovals__block_invoke_2;
        v15 = &unk_1E4A48AB0;
        v16 = &v17;
        if (v8 == v5)
          qsort_b(v7, v5, 8uLL, &v12);
        else
          mergesort_b(v7, v8, 8uLL, &v12);
        v9 = 0;
        v10 = 8 * v8 - 8;
        while (1)
        {
          v11 = *(_QWORD *)&v7[v10];
          if (v9 >= 0x19 && (unint64_t)v19((uint64_t)&v17, *(_QWORD **)&v7[v10]) > 1)
            break;
          objc_msgSend(v1, "removeConstraintWithMarker:", v11, v12, v13, v14, v15, v16, v17, v18);
          ++v9;
          v10 -= 8;
          if (v8 == v9)
            goto LABEL_19;
        }
        v8 -= v9;
      }
      while (v8);
LABEL_19:
      if (v7 != v22)
        free(v7);
      goto LABEL_21;
    }
  }
}

- (uint64_t)_tryToAddConstraintWithMarkerEngineVar:(id *)a3 row:(uint64_t)a4 mutuallyExclusiveConstraints:(uint64_t)a5
{
  _BOOL8 v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, unsigned int);
  void *v28;
  uint64_t v29;
  _QWORD *v30;

  if (!a1)
    return 0;
  v24 = 0;
  if (a6)
    v12 = 1;
  else
    v12 = *(_QWORD *)(a1 + 80) != 0;
  v13 = (uint64_t *)(a5 + 16);
  if (NSISLinExpConstant(a5 + 16) < 0.0)
    NSISLinExpScaleBy((double *)(a5 + 16), -1.0);
  if (-[NSISEngine tryAddingDirectly:](a1, a4, a5))
  {
    if (_NSConstraintBasedLayoutDebug())
    {
      v14 = objc_msgSend(*a3, "markedConstraint");
      v21 = _row_description(a4, a5);
      NSLog(CFSTR("\tengine %p directly added constraint %@ as %@"), a1, v14, v21);
    }
  }
  else
  {
    if (_NSConstraintBasedLayoutVariableChangeTransactions())
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __86__NSISEngine__tryToAddConstraintWithMarkerEngineVar_row_mutuallyExclusiveConstraints___block_invoke;
      v23[3] = &unk_1E4A48B78;
      v23[4] = a1;
      if ((*(_BYTE *)(a5 + 80) & 1) != 0)
      {
        v15 = *v13;
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = ___row_enumerateCols_block_invoke;
        v28 = &unk_1E4A48E98;
        v29 = a4;
        v30 = v23;
        -[NSISObjectiveLinearExpression enumerateVars:](v15, (uint64_t)&v25);
      }
      else
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = ___row_enumerateCols_block_invoke_2;
        v28 = &unk_1E4A48E98;
        v29 = a4;
        v30 = v23;
        NSISLinExpEnumerateVars((unsigned __int16 *)(a5 + 16), (uint64_t)&v25);
      }
    }
    if (!-[NSISEngine tryUsingArtificialVariableToAddConstraintWithMarker:row:usingInfeasibilityHandlingBehavior:mutuallyExclusiveConstraints:](a1, a2, a3, a4, a5, v12, &v24))
    {
      if (a6)
      {
        v17 = 0;
        *a6 = v24;
      }
      else
      {
        v20 = *(_QWORD *)(a1 + 80);
        if (v20)
          (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v24);
        else
          NSLog(CFSTR("Warning: Failed to add constraint even when behavior = NSISBreakConstraint"));
        v17 = 0;
      }
      goto LABEL_18;
    }
    if (_NSConstraintBasedLayoutDebug())
    {
      v16 = objc_msgSend(*a3, "markedConstraint");
      v22 = _row_description(a4, a5);
      NSLog(CFSTR("\tengine %p indirectly added constraint %@ as %@"), a1, v16, v22);
    }
  }
  v17 = 1;
LABEL_18:
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    objc_msgSend((id)a1, "verifyInternalIntegrity");
  -[NSISEngine _optimizeIfNotDisabled](a1);
  v18 = *(void **)(a1 + 56);
  if (v18 && !*(_DWORD *)(a1 + 140))
    objc_msgSend(v18, "constraintsDidChangeInEngine:", a1);
  return v17;
}

- (uint64_t)hasValue:(uint64_t)a3 forEngineVar:(uint64_t)a4
{
  double v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t *v15;
  int v16;
  uint64_t v18;

  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 161) && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    *(_BYTE *)(a1 + 161) = 1;
  if (a2)
  {
    if (*(_BYTE *)(a1 + 158) && !*(_BYTE *)(a1 + 159))
      objc_msgSend((id)a1, "optimize");
    if ((*(_BYTE *)(a4 + 24) & 1) != 0)
    {
      v7 = NSISLinExpConstant(*(_QWORD *)(a4 + 8) + 16);
LABEL_25:
      *a2 = v7;
      goto LABEL_26;
    }
LABEL_12:
    v8 = *(_QWORD *)(a4 + 8);
    v9 = (uint64_t *)(v8 + 8);
    v10 = NSBitSetCount(v8 + 8);
    v11 = v8 + 24;
    v12 = NSBitSetCount(v11);
    if ((unint64_t)(v12 + v10) <= 1)
    {
      if (v12 + v10 != 1)
      {
        v18 = 0;
        goto LABEL_27;
      }
      v13 = *(_DWORD *)(*(_QWORD *)(a1 + 408) + 8);
      if (HIWORD(v13))
        v14 = v13 - 0x40000000;
      else
        v14 = v13;
      if (HIWORD(v13))
        v15 = (uint64_t *)v11;
      else
        v15 = v9;
      v16 = NSBitSetContainsIndex(v15, v14);
      v18 = v16 ^ 1u;
      if (!a2)
        goto LABEL_27;
      v7 = 0.0;
      if ((v16 & 1) != 0)
        goto LABEL_27;
    }
    else
    {
      v7 = 0.0;
      if (!a2)
        goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ((*(_BYTE *)(a4 + 24) & 1) == 0)
    goto LABEL_12;
LABEL_26:
  v18 = 1;
LABEL_27:
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    objc_msgSend((id)a1, "verifyInternalIntegrity");
  return v18;
}

- (unsigned)copyExpressionSubstitutingRowHeadVariables:(uint64_t)a3 intoRow:(uint64_t)a4
{
  unsigned __int16 *v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int16 *v8;
  double v9;
  _QWORD v10[6];

  if (result)
  {
    v5 = result;
    v6 = (uint64_t *)(a4 + 16);
    if ((*(_BYTE *)(a4 + 80) & 1) != 0)
      v7 = -[NSISObjectiveLinearExpression variableCount](*v6);
    else
      v7 = NSISLinExpVarCount(a4 + 16);
    if (v7 || NSISLinExpConstant((uint64_t)v6) != 0.0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_copyExpressionSubstitutingRowHeadVariables_intoRow_, v5, CFSTR("NSISEngine.m"), 1242, CFSTR("Should be copied into an empty row"));
    v8 = (unsigned __int16 *)(a2 + 16);
    v9 = NSISLinExpConstant((uint64_t)v8);
    NSISLinExpIncrementConstant((uint64_t)v6, v9);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__NSISEngine_copyExpressionSubstitutingRowHeadVariables_intoRow___block_invoke;
    v10[3] = &unk_1E4A48588;
    v10[4] = v5;
    v10[5] = v6;
    return NSISLinExpEnumerateVarsAndCoefficients(v8, (uint64_t)v10);
  }
  return result;
}

- (unint64_t)_optimizeWithoutRebuilding
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *recordedOperations;
  unint64_t v11;
  unint64_t v12;
  unsigned int totalChangeCount;
  unsigned int changeCountAtLastOptimization;
  unint64_t v15;
  _BOOL4 engineNeedsOptimization;

  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
    _NSISRecordOperation(recordedOperations, a2, v2, v3, v4, v5, v6, v7, 0, 0);
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if (self->_optimizationInProgress)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 1717, CFSTR("Nested optimization should never be triggered.  This is probably due to autolayout work happening inside an NSISVariable delegate callback, which is not allowed."));
  v11 = 0;
  v12 = 0;
  totalChangeCount = self->_totalChangeCount;
  changeCountAtLastOptimization = self->_changeCountAtLastOptimization;
  while (changeCountAtLastOptimization != totalChangeCount)
  {
    self->_engineNeedsOptimization = 0;
    self->_optimizationInProgress = 1;
    -[NSISEngine fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:]((uint64_t)self, 0);
    v15 = _minimizeConstantInObjectiveRow((uint64_t)self, (uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage);
    if (self->_engineNeedsOptimization)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 1740, CFSTR("Engine still needs optimization after optimizing."));
      engineNeedsOptimization = self->_engineNeedsOptimization;
    }
    else
    {
      engineNeedsOptimization = 0;
    }
    v12 += v15;
    totalChangeCount = self->_totalChangeCount;
    self->_changeCountAtLastOptimization = totalChangeCount;
    self->_optimizationInProgress = 0;
    if (engineNeedsOptimization)
    {
      changeCountAtLastOptimization = totalChangeCount;
      if (v11++ < 0x1D)
        continue;
    }
    if (engineNeedsOptimization)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 1753, CFSTR("Engine still needs optimization after iterating many times."));
    return v12;
  }
  return v12;
}

uint64_t __86__NSISEngine__tryToAddConstraintWithMarkerEngineVar_row_mutuallyExclusiveConstraints___block_invoke(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = NSBitSetCount((uint64_t)(a3 + 1));
  result = NSBitSetCount((uint64_t)(a3 + 3));
  if (!(result + v6))
    return _noteValueOfVariableChanged(*(_QWORD *)(a1 + 32), a2, *a3);
  return result;
}

- (_QWORD)_dirtyListPrependObservation:(_QWORD *)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = (uint64_t)result;
    if (a2[2] || a2[1])
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__dirtyListPrependObservation_, result, CFSTR("NSISEngine.m"), 534, CFSTR("Dirty observable list is corrupt."));
    result = a2;
    a2[1] = *(_QWORD *)(v3 + 176);
    a2[2] = 0;
    v4 = *(_QWORD *)(v3 + 176);
    if (v4)
      *(_QWORD *)(v4 + 16) = a2;
    *(_QWORD *)(v3 + 176) = a2;
  }
  return result;
}

- (uint64_t)fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:(uint64_t)result
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unsigned __int16 *v12;
  double v13;
  int v14;
  char v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[7];

  if (!result)
    return result;
  v3 = result;
  v36 = 0;
  if (!objc_msgSend(*(id *)(result + 8), "count"))
    return v36;
  while (1)
  {
    v4 = (_QWORD *)objc_msgSend(*(id *)(v3 + 8), "objectAtIndex:", 0);
    objc_msgSend(*(id *)(v3 + 8), "removeObjectAtIndex:", 0);
    v5 = 0;
    while (v4[v5 + 3] != v3)
    {
      if (++v5 == 3)
        goto LABEL_8;
    }
    v6 = *((_DWORD *)v4 + v5 + 12);
    if (v6 != -1)
      goto LABEL_11;
LABEL_8:
    if (v4[2])
      v6 = objc_msgSend(v4, "overflowEngineVarIndexForEngine:", v3);
    else
      v6 = -1;
LABEL_11:
    v7 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + (((unint64_t)v6 >> 3) & 0x1FFFFFF8));
    v8 = v6 & 0x3F;
    v9 = v7 + 32 * v8;
    if (*(_DWORD *)(v9 + 16) == -1)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v4, v3);
    }
    if (*(_QWORD **)v9 != v4)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v9, v4);
    }
    v10 = v7 + 32 * v8;
    v11 = (_DWORD *)(v10 + 24);
    if ((*(_BYTE *)(v10 + 24) & 1) == 0)
      goto LABEL_37;
    v12 = *(unsigned __int16 **)(v10 + 8);
    v13 = NSISLinExpConstant((uint64_t)(v12 + 8));
    v14 = (*(_DWORD *)(*(_QWORD *)v12 + 24) >> 1) & 3;
    if (v14 != 2)
      break;
    if (v13 == 0.0)
    {
      if (*(double *)&NSISEpsilon <= 0.0)
        goto LABEL_24;
    }
    else if (fabs(v13) >= *(double *)&NSISEpsilon)
    {
      goto LABEL_24;
    }
LABEL_37:
    if (!objc_msgSend(*(id *)(v3 + 8), "count"))
      return v36;
  }
  if (v14 != 1 || v13 >= 0.0)
    goto LABEL_37;
LABEL_24:
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = 0x409F400000000000;
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0x7FEFFFFFFFFFFFFFLL;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3010000000;
  v26 = 0;
  v27 = 0;
  if ((*v11 & 6) != 4)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __79__NSISEngine_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior___block_invoke;
    v21[3] = &unk_1E4A48910;
    v21[4] = v3;
    v21[5] = &v32;
    v21[6] = &v22;
    v21[7] = &v28;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = ___row_enumerateColsWithCoefficients_block_invoke;
    v37[3] = &unk_1E4A48F08;
    v37[4] = v3;
    v37[5] = v21;
    NSISLinExpEnumerateVarsAndCoefficients(v12 + 8, (uint64_t)v37);
    if (v33[3] != 2000.0)
      goto LABEL_32;
  }
  if (v29[3] != 1.79769313e308)
    goto LABEL_32;
  v15 = -[NSISEngine handleUnsatisfiableRow:usingInfeasibilityHandlingBehavior:prospectiveRowHead:mutuallyExclusiveConstraints:](v3, v3, (uint64_t)v12, a2, v23 + 4, &v36);
  if (a2 == 1)
    v16 = 1;
  else
    v16 = v15;
  if ((v16 & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior_, v3, CFSTR("NSISEngine.m"), 1211, CFSTR("Unable to find an incoming rowHead for row:%@"), _row_description(v3, (uint64_t)v12));
    goto LABEL_32;
  }
  if (a2 != 1)
  {
LABEL_32:
    v17 = v23;
    v18 = v23[4];
    if (!v18)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior_, v3, CFSTR("NSISEngine.m"), 1214, CFSTR("Failed to find an incoming row head for pivot"));
      v17 = v23;
      v18 = v23[4];
    }
    _pivotToMakeColNewHeadOfRow(v3, v18, (uint64_t **)v17[5], v3, (uint64_t)v12, 0);
    if (_NSConstraintBasedLayoutDebugEngineConsistency())
      objc_msgSend((id)v3, "verifyInternalIntegrity");
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    goto LABEL_37;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v36;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

- (uint64_t)rebuildFromConstraints
{
  id *v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];

  if (result)
  {
    v1 = (id *)result;
    *(_BYTE *)(result + 162) = 0;
    if (objc_msgSend(*(id *)(result + 16), "count") || objc_msgSend(v1[3], "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_rebuildFromConstraints, v1, CFSTR("NSISEngine.m"), 1799, CFSTR("Attempt to rebuild engine with a pending list of constraints to remove."));
    v2 = objc_msgSend(v1, "constraints");
    v3 = -[NSISEngine enumerateCols:](v1, (uint64_t)&__block_literal_global_102);
    v4 = MEMORY[0x1E0C809B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__NSISEngine_rebuildFromConstraints__block_invoke_2;
    v6[3] = &unk_1E4A48A38;
    v6[4] = v1;
    objc_msgSend(v1, "enumerateRows:", v6, v3);
    objc_msgSend(v1[1], "removeAllObjects");
    objc_msgSend(v1[8], "removeAllObjects");
    objc_msgSend(v1[9], "removeAllObjects");
    -[NSISEngine _addObjectiveRow]((_QWORD **)v1);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __36__NSISEngine_rebuildFromConstraints__block_invoke_3;
    v5[3] = &unk_1E4A48A60;
    v5[4] = v2;
    v5[5] = v1;
    return objc_msgSend(v1, "withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:", v5);
  }
  return result;
}

- (int)valueRestrictionForEngineVarIndex:(id)a3
{
  return (*(_DWORD *)(*((_QWORD *)self->_engineVarTable.blocks + (a3.var0 >> 6)) + 32 * (a3.var0 & 0x3F) + 24) >> 1) & 3;
}

void __65__NSISEngine_copyExpressionSubstitutingRowHeadVariables_intoRow___block_invoke(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + ((a2 >> 3) & 0x1FFFFFF8)) + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v3 + 24) & 1) != 0)
    NSISLinExpAddExpression(*(unsigned __int16 **)(a1 + 40), *(_QWORD *)(v3 + 8) + 16, a3);
  else
    NSISLinExpAddVar(*(unsigned __int16 **)(a1 + 40), a2, a3);
}

_QWORD *__79__NSISEngine_fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior___block_invoke(_QWORD *result, uint64_t a2, uint64_t *a3, double a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23[13];

  if (a4 > 0.0)
  {
    v23[1] = v7;
    v23[2] = v6;
    v23[11] = v4;
    v23[12] = v5;
    v9 = *a3;
    if ((*(_DWORD *)(*a3 + 24) & 6) != 4)
    {
      v12 = result;
      v22 = 0.0;
      v23[0] = 0.0;
      v13 = result[4];
      v14 = *(_QWORD *)(v13 + 408);
      if ((*(_BYTE *)(v14 + 80) & 1) == 0)
      {
        v20 = *(_QWORD *)(v13 + 400);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(v20, v14));
        v9 = *a3;
      }
      result = -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(_QWORD **)(v14 + 16), v23, &v22, *(_DWORD *)(v9 + 16));
      v15 = *(double *)(*(_QWORD *)(v12[5] + 8) + 24);
      if (v23[0] < v15)
      {
        v16 = *(_QWORD *)(v12[6] + 8);
        *(_QWORD *)(v16 + 32) = a2;
        *(_QWORD *)(v16 + 40) = a3;
        v17 = v22 / a4;
        v18 = v12 + 7;
LABEL_10:
        *(double *)(*(_QWORD *)(*v18 + 8) + 24) = v17;
        return result;
      }
      if (v23[0] == v15)
      {
        v17 = v22 / a4;
        v18 = v12 + 7;
        if (v22 / a4 < *(double *)(*(_QWORD *)(v12[7] + 8) + 24))
        {
          v19 = *(_QWORD *)(v12[6] + 8);
          *(_QWORD *)(v19 + 32) = a2;
          *(_QWORD *)(v19 + 40) = a3;
          goto LABEL_10;
        }
      }
    }
  }
  return result;
}

- (void)withAutomaticOptimizationDisabled:(id)a3
{
  -[NSISEngine withBehaviors:performModifications:](self, "withBehaviors:performModifications:", 1, a3);
}

- (uint64_t)tryUsingArtificialVariableToAddConstraintWithMarker:(id *)a3 row:(uint64_t)a4 usingInfeasibilityHandlingBehavior:(uint64_t)a5 mutuallyExclusiveConstraints:(uint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id **v19;
  void *v20;
  id *v21;
  unint64_t Index;
  uint64_t v23;
  char *v24;
  void *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t **v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  char *v54;
  void *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, unsigned int);
  void *v58;
  uint64_t v59;
  uint64_t *v60;

  if (!result)
    return result;
  v11 = result;
  if (!*(_QWORD *)(result + 424))
    *(_QWORD *)(result + 424) = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:", CFSTR("tempToBeOptimizedToZero"), 1, 1);
  v43 = a3;
  if (!*(_QWORD *)(v11 + 432))
    *(_QWORD *)(v11 + 432) = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:", CFSTR("tempToBeOptimizedToZeroObjective"), 0, 0);
  v12 = *(_QWORD *)(v11 + 440);
  if (v12)
  {
    -[NSISObjectiveLinearExpression cleanupForReuse](v12);
    -[NSISObjectiveLinearExpression addExpression:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](*(unsigned __int16 **)(v11 + 440), (unsigned __int16 *)(a5 + 16), (uint64_t)&__block_literal_global_73, (uint64_t)&__block_literal_global_74, 1.0, 1.0);
  }
  else
  {
    *(_QWORD *)(v11 + 440) = -[NSISObjectiveLinearExpression initWithLinearExpression:priority:engine:]([NSISObjectiveLinearExpression alloc], (unsigned __int16 *)(a5 + 16), v11, 1.0);
  }
  v13 = _engineVar_addForVariableIfNeeded(v11, *(_QWORD **)(v11 + 424));
  v15 = v14;
  v16 = _engineVar_addForVariableIfNeeded(v11, *(_QWORD **)(v11 + 432));
  v18 = v17;
  if ((v15[3] & 1) != 0)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v15);
  }
  v46 = v13;
  _row_setHead(a4, a5, v13, (id **)v15[1]);
  if ((*(_BYTE *)(v18 + 24) & 1) != 0)
  {
    v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)v18);
  }
  v44 = v18;
  v19 = *(id ***)(v18 + 8);
  v20 = *(void **)(v11 + 440);
  v21 = *v19;
  if (!NSBitSetCount(v11 + 256))
    _table_addStorageBlock((void **)(v11 + 232), (unint64_t *)(v11 + 240), (unint64_t *)(v11 + 248), 0x17uLL, 88, (unsigned int *)(v11 + 256));
  Index = NSBitSetFirstIndex((uint64_t **)(v11 + 256));
  NSBitSetRemoveIndex((uint64_t *)(v11 + 256), Index);
  v23 = *(_QWORD *)(*(_QWORD *)(v11 + 232 + 40 * ((Index >> 30) & 1)) + 8 * ((Index & 0xBFFFFFFF) / 0x17))
      + 88 * ((Index & 0xBFFFFFFF) % 0x17);
  *(_QWORD *)v23 = 0;
  *(_QWORD *)(v23 + 8) = Index;
  *(_WORD *)(v23 + 16) = 4;
  *(_OWORD *)(v23 + 18) = 0u;
  *(_OWORD *)(v23 + 34) = 0u;
  *(_OWORD *)(v23 + 50) = 0u;
  *(_OWORD *)(v23 + 66) = 0u;
  *(_QWORD *)(v23 + 80) = 0;
  _row_rawSetHead(v11, (_DWORD *)v23, v16, v19);
  *(_DWORD *)(v23 + 80) |= 1u;
  *(_QWORD *)(v23 + 16) = v20;
  if (((_BYTE)v21[3] & 1) == 0)
  {
    v40 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 115, CFSTR("Tried accessing the row index for a variable that isn't a row head:%@"), *v21);
  }
  v24 = (char *)v21[1];
  v25 = (void *)MEMORY[0x1E0C809B0];
  v49 = MEMORY[0x1E0C809B0];
  v50 = 3221225472;
  v51 = (uint64_t)___objectiveRow_addWithHeadAndBody_block_invoke;
  v52 = (const char *)&__block_descriptor_48_e16_v24__0_________8ls32l8;
  v53 = v16;
  v54 = v24;
  v26 = (unsigned __int16 *)(v24 + 16);
  v27 = v46;
  if ((v24[80] & 1) != 0)
  {
    v28 = *(_QWORD *)v26;
    v55 = (void *)MEMORY[0x1E0C809B0];
    v56 = 3221225472;
    v57 = ___row_enumerateCols_block_invoke;
    v58 = &unk_1E4A48E98;
    v59 = v16;
    v60 = &v49;
    -[NSISObjectiveLinearExpression enumerateVars:](v28, (uint64_t)&v55);
  }
  else
  {
    v55 = (void *)MEMORY[0x1E0C809B0];
    v56 = 3221225472;
    v57 = ___row_enumerateCols_block_invoke_2;
    v58 = &unk_1E4A48E98;
    v59 = v16;
    v60 = &v49;
    NSISLinExpEnumerateVars(v26, (uint64_t)&v55);
  }
  if ((*(_BYTE *)(v44 + 24) & 1) == 0)
  {
    v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 115, CFSTR("Tried accessing the row index for a variable that isn't a row head:%@"), *(_QWORD *)v44);
  }
  v29 = *(_QWORD *)(v44 + 8);
  _minimizeConstantInObjectiveRow(v11, v16, v29);
  while (1)
  {
    if ((*(_BYTE *)(v29 + 80) & 1) == 0)
    {
      v45 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)");
      v33 = _row_description(v16, v29);
      v34 = v32;
      v27 = v46;
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), v33);
    }
    if (-[NSISObjectiveLinearExpression constantTermIsZero](*(_QWORD *)(v29 + 16)))
      break;
    v30 = 0;
    v55 = 0;
    if ((v15[3] & 1) != 0)
    {
      if ((-[NSISEngine handleUnsatisfiableRow:usingInfeasibilityHandlingBehavior:prospectiveRowHead:mutuallyExclusiveConstraints:](v11, v27, v15[1], a6, 0, &v55) & 1) != 0)
      {
        v31 = 1;
        if (a7)
          goto LABEL_33;
        goto LABEL_34;
      }
      v30 = v55;
    }
    if (!objc_msgSend(v30, "count"))
      break;
    v31 = 0;
    if (a7)
LABEL_33:
      *a7 = v55;
LABEL_34:
    if (!v31)
    {
      _row_remove(v11, v16, v29);
      objc_msgSend((id)v11, "removeConstraintWithMarker:", *v43);
      return 0;
    }
    _minimizeConstantInObjectiveRow(v11, v16, v29);
  }
  if ((v15[3] & 1) != 0)
  {
    v35 = v15[1];
    if (NSISLinExpIsConstant(v35 + 16))
    {
      _row_remove(v11, v27, v35);
    }
    else
    {
      v49 = 0;
      v50 = (uint64_t)&v49;
      v51 = 0x3010000000;
      v53 = v11;
      v54 = 0;
      v55 = v25;
      v48[0] = v25;
      v48[1] = 3221225472;
      v48[2] = __134__NSISEngine_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints___block_invoke_3;
      v48[3] = &unk_1E4A489C8;
      v48[4] = &v49;
      v56 = 3221225472;
      v57 = ___row_enumerateColsUntil_block_invoke;
      v58 = &unk_1E4A48F58;
      v59 = v27;
      v60 = v48;
      NSISLinExpEnumerateVarsUntil((unsigned __int16 *)(v35 + 16), (uint64_t)&v55);
      v36 = v50;
      v37 = *(uint64_t ***)(v50 + 40);
      if (!v37)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints_, v11, CFSTR("NSISEngine.m"), 1466, CFSTR("Unable to find a new row head"));
        v36 = v50;
        v37 = *(uint64_t ***)(v50 + 40);
      }
      _pivotToMakeColNewHeadOfRow(v11, *(_QWORD *)(v36 + 32), v37, v27, v35, 0);
      _Block_object_dispose(&v49, 8);
    }
  }
  if ((v15[3] & 1) != 0)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v15);
  }
  _col_removeFromAllRows(v27, v15[1]);
  _row_remove(v11, v16, v29);
  return 1;
}

uint64_t __56__NSISEngine_chooseHeadForRow_chosenCol_outNewToEngine___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  BOOL v4;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *(_DWORD *)(*(_QWORD *)a3 + 24) & 6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v4 = 0;
  else
    v4 = v3 == 4;
  if (v4)
    return 0;
  v8 = NSBitSetCount(a3 + 8);
  v9 = NSBitSetCount(a3 + 24) + v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if ((v3 == 4 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      && v9 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      return 0;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v10 + 32) = a2;
  *(_QWORD *)(v10 + 40) = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 == 4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    return 0;
  }
  result = 1;
  **(_BYTE **)(a1 + 64) = 1;
  return result;
}

BOOL __134__NSISEngine_tryUsingArtificialVariableToAddConstraintWithMarker_row_usingInfeasibilityHandlingBehavior_mutuallyExclusiveConstraints___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = a3;
  return (*(_DWORD *)(*(_QWORD *)a3 + 24) & 6) != 4;
}

- (double)valueForEngineVar:(uint64_t)a3
{
  if (!a1)
    return 0.0;
  if (!a1[161] && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    a1[161] = 1;
  if (a1[158])
  {
    if (!a1[159])
      objc_msgSend(a1, "optimize");
  }
  if ((*(_BYTE *)(a3 + 24) & 1) != 0)
    return NSISLinExpConstant(*(_QWORD *)(a3 + 8) + 16);
  else
    return 0.0;
}

- (unint64_t)pivotCount
{
  return self->_pivotCount;
}

- (void)stopObservingChangesForVariable:(id)a3
{
  NSISVariableObservation *v4;
  NSISVariableObservation *v5;

  v4 = (NSISVariableObservation *)NSISObjectTableDelete((int32x2_t *)self->_variablesObservations, (unint64_t)a3);
  if (v4)
  {
    v5 = v4;
    if (v4->_nextDirtyObservation || v4->_prevDirtyObservation || self->_dirtyVariableObservations == v4)
      -[NSISEngine _dirtyListRemoveObservation:]((uint64_t)self, v4);

  }
}

- (void)_dirtyListRemoveObservation:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  if (a1 && a2)
  {
    v2 = a2[1];
    v3 = a2[2];
    if (v2)
      *(_QWORD *)(v2 + 16) = v3;
    if (v3)
    {
      v4 = (_QWORD *)(v3 + 8);
    }
    else
    {
      v5 = *(_QWORD **)(a1 + 176);
      v4 = (_QWORD *)(a1 + 176);
      if (v5 != a2)
        goto LABEL_9;
    }
    *v4 = v2;
LABEL_9:
    a2[1] = 0;
    a2[2] = 0;

  }
}

- (void)startObservingChangesForVariable:(id)a3
{
  NSISVariableObservation *v5;

  if (a3)
  {
    v5 = -[NSISVariableObservation initWithVariable:]([NSISVariableObservation alloc], "initWithVariable:", a3);
    NSISObjectTableInsert(self->_variablesObservations, a3, v5);

  }
}

- (void)removeVariableToBeOptimized:(id)a3 priority:(double)a4
{
  NSMutableDictionary *recordedOperations;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;

  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    v9 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v10, v11, v12, v13, v14, v15, (unsigned int *)a3, v9);
  }
  ++self->_totalChangeCount;
  if (a3)
  {
    v16 = 0;
    while (*((NSISEngine **)a3 + v16 + 3) != self)
    {
      if (++v16 == 3)
        goto LABEL_9;
    }
    if (*((_DWORD *)a3 + v16 + 12) != -1)
      goto LABEL_11;
LABEL_9:
    if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
      return;
LABEL_11:
    v17 = 0;
    while (*((NSISEngine **)a3 + v17 + 3) != self)
    {
      if (++v17 == 3)
        goto LABEL_16;
    }
    v18 = *((_DWORD *)a3 + v17 + 12);
    if (v18 != -1)
      goto LABEL_19;
LABEL_16:
    if (*((_QWORD *)a3 + 2))
      v18 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
    else
      v18 = -1;
LABEL_19:
    v19 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v18 >> 3) & 0x1FFFFFF8));
    v20 = v18 & 0x3F;
    v21 = v19 + 32 * v20;
    if (*(_DWORD *)(v21 + 16) == -1)
    {
      v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
    }
    if (*(id *)v21 != a3)
    {
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v21, a3);
    }
    v22 = v19 + 32 * v20;
    v23 = (_BYTE *)(v22 + 24);
    if ((*(_BYTE *)(v22 + 24) & 1) != 0)
    {
      _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a4, -1.0, (uint64_t)self, *(_QWORD *)(v22 + 8));
    }
    else
    {
      v24 = *(_QWORD *)(v22 + 8);
      v25 = NSBitSetCount(v24 + 8);
      if (NSBitSetCount(v24 + 24) + v25)
      {
        if (isMaps_once != -1)
          dispatch_once(&isMaps_once, &__block_literal_global_494);
        if (!isMaps_isMaps
          || ((v26 = *((_DWORD *)self->_objectiveRow.storage + 2), !HIWORD(v26))
            ? (v27 = v26)
            : (v27 = v26 - 0x40000000),
              !HIWORD(v26) ? (v28 = (uint64_t *)(v24 + 8)) : (v28 = (uint64_t *)(v24 + 24)),
              NSBitSetContainsIndex(v28, v27)))
        {
          _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a4, -1.0, (uint64_t)self, v24);
        }
      }
    }
    if ((*v23 & 1) == 0)
    {
      v29 = *(_QWORD *)(v19 + 32 * v20 + 8);
      v30 = NSBitSetCount(v29 + 8);
      if (!(NSBitSetCount(v29 + 24) + v30))
        _engineVar_rawRemove((uint64_t)self, (uint64_t *)(v19 + 32 * v20));
    }
  }
}

- (BOOL)tryToChangeConstraintSuchThatMarker:(id)a3 isReplacedByMarkerPlusDelta:(double)a4 undoHandler:(id)a5
{
  double v10;
  NSMutableDictionary *recordedOperations;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**unsatisfiabilityHandler)(id, _QWORD);
  NSISEngineDelegate *delegate;

  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  v10 = fabs(a4);
  if (v10 >= INFINITY && v10 <= INFINITY)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 2798, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(delta)"));
  if (!self->_unsatisfiabilityHandler)
  {
    -[NSISEngine constraintDidChangeSuchThatMarker:shouldBeReplacedByMarkerPlusDelta:](self, "constraintDidChangeSuchThatMarker:shouldBeReplacedByMarkerPlusDelta:", a3, a4);
    return 1;
  }
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    v12 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v13, v14, v15, v16, v17, v18, (unsigned int *)a3, v12);
  }
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, a4);
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    -[NSISEngine verifyInternalIntegrity](self, "verifyInternalIntegrity");
  v19 = -[NSISEngine tryToOptimizeReturningMutuallyExclusiveConstraints]((uint64_t)self);
  if (!v19)
  {
    delegate = self->_delegate;
    if (delegate && !self->_engineDelegateCallsDisabledCount)
      -[NSISEngineDelegate constraintsDidChangeInEngine:](delegate, "constraintsDidChangeInEngine:", self);
    return 1;
  }
  v20 = v19;
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, -a4);
  if (!self->_revertsAfterUnsatisfiabilityHandler)
    (*((void (**)(id))a5 + 2))(a5);
  unsatisfiabilityHandler = (void (**)(id, _QWORD))self->_unsatisfiabilityHandler;
  if (unsatisfiabilityHandler)
    unsatisfiabilityHandler[2](unsatisfiabilityHandler, v20);
  if (self->_revertsAfterUnsatisfiabilityHandler)
    (*((void (**)(id))a5 + 2))(a5);
  return 0;
}

- (void)constraintDidChangeSuchThatMarker:(id)a3 shouldBeReplacedByMarkerPlusDelta:(double)a4
{
  double v8;
  NSMutableDictionary *recordedOperations;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSISEngineDelegate *delegate;

  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  v8 = fabs(a4);
  if (v8 >= INFINITY && v8 <= INFINITY)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 2774, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(delta)"));
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    v10 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v11, v12, v13, v14, v15, v16, (unsigned int *)a3, v10);
  }
  -[NSISEngine _coreReplaceMarker:withMarkerPlusDelta:]((uint64_t)self, a3, a4);
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    -[NSISEngine verifyInternalIntegrity](self, "verifyInternalIntegrity");
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate)
  {
    if (!self->_engineDelegateCallsDisabledCount)
      -[NSISEngineDelegate constraintsDidChangeInEngine:](delegate, "constraintsDidChangeInEngine:", self);
  }
}

- (void)removeConstraintWithMarker:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  int *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *pendingRemovals;
  NSMutableDictionary *recordedOperations;
  int v31;
  uint64_t **v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t *v40;
  unsigned int v41;
  unint64_t v42;
  uint64_t *v43;
  NSISEngineDelegate *delegate;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;

  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if (_NSConstraintBasedLayoutDebugEngineConsistency()
    && !-[NSISEngine hasValue:forVariable:](self, "hasValue:forVariable:", 0, a3))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISEngine.m"), 2624, CFSTR("Trying to remove a constraint which is not present, %@"), objc_msgSend(a3, "markedConstraint"));
    if (!a3)
      return;
  }
  else if (!a3)
  {
    return;
  }
  v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3)
      goto LABEL_9;
  }
  if (*((_DWORD *)a3 + v6 + 12) != -1)
    goto LABEL_11;
LABEL_9:
  if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
    return;
LABEL_11:
  v7 = objc_msgSend(a3, "markedConstraint");
  kdebug_trace();
  v14 = 0;
  ++self->_totalChangeCount;
  while (*((NSISEngine **)a3 + v14 + 3) != self)
  {
    if (++v14 == 3)
      goto LABEL_16;
  }
  v15 = *((_DWORD *)a3 + v14 + 12);
  if (v15 != -1)
    goto LABEL_19;
LABEL_16:
  if (*((_QWORD *)a3 + 2))
    v15 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v15 = -1;
LABEL_19:
  v16 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v15 >> 3) & 0x1FFFFFF8));
  v17 = v15 & 0x3F;
  v18 = (uint64_t *)(v16 + 32 * v17);
  if (*((_DWORD *)v18 + 4) == -1)
  {
    v45 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if ((id)*v18 != a3)
  {
    v46 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v18, a3);
  }
  v19 = v16 + 32 * v17;
  v22 = *(_DWORD *)(v19 + 24);
  v21 = (int *)(v19 + 24);
  v20 = v22;
  if ((v22 & 1) == 0)
  {
    v23 = (void *)v7;
    v24 = *(_QWORD *)(v16 + 32 * v17 + 8);
    v25 = NSBitSetCount(v24 + 8);
    v26 = v24 + 24;
    v27 = v23;
    v18 = (uint64_t *)(v16 + 32 * v17);
    v28 = NSBitSetCount(v26);
    if (self->_accumulatingRemovals && (unint64_t)(v28 + v25) >= 2)
    {
      pendingRemovals = self->_pendingRemovals;
      if (!pendingRemovals)
      {
        self->_pendingRemovals = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        self->_pendingMarkerDelegates = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 0);
        pendingRemovals = self->_pendingRemovals;
      }
      -[NSMutableArray addObject:](pendingRemovals, "addObject:", a3);
      -[NSHashTable addObject:](self->_pendingMarkerDelegates, "addObject:", v27);
      objc_msgSend((id)objc_msgSend(v27, "firstAnchor"), "_accumulateReferenceLayoutItemsIntoTable:", self->_pendingMarkerDelegates);
      objc_msgSend((id)objc_msgSend(v27, "secondAnchor"), "_accumulateReferenceLayoutItemsIntoTable:", self->_pendingMarkerDelegates);
      return;
    }
  }
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
    _NSISRecordOperation(recordedOperations, a2, v8, v9, v10, v11, v12, v13, (unsigned int *)a3, 0);
  if (_NSConstraintBasedLayoutDebug())
    NSLog(CFSTR("engine %p removing constraint %@"), self, objc_msgSend(a3, "markedConstraint"));
  v31 = *v21;
  if ((v20 & 1) != 0)
  {
    if ((v31 & 1) == 0)
    {
      v48 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 115, CFSTR("Tried accessing the row index for a variable that isn't a row head:%@"), *v18);
    }
    _row_remove((uint64_t)self, (uint64_t)self, *(_QWORD *)(v16 + 32 * v17 + 8));
    goto LABEL_66;
  }
  if ((v31 & 1) != 0)
  {
    v47 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v18);
  }
  v32 = *(uint64_t ***)(v16 + 32 * v17 + 8);
  v51 = 0uLL;
  if (!-[NSISEngine outgoingRowHeadForRemovingConstraintWithMarker:outgoingRowHead:]((uint64_t)self, (uint64_t)self, (uint64_t)v32, &v51))
  {
    v33 = *((_DWORD *)self->_objectiveRow.storage + 2);
    if (HIWORD(v33))
      v34 = v33 - 0x40000000;
    else
      v34 = v33;
    if (HIWORD(v33))
      v35 = (uint64_t *)(v32 + 3);
    else
      v35 = (uint64_t *)(v32 + 1);
    if (NSBitSetContainsIndex(v35, v34))
    {
      v36 = NSBitSetCount((uint64_t)(v32 + 1));
      if (NSBitSetCount((uint64_t)(v32 + 3)) + v36)
      {
        v37 = NSBitSetCount((uint64_t)(v32 + 1));
        if (NSBitSetCount((uint64_t)(v32 + 3)) + v37 != 1
          || ((v38 = *((_DWORD *)self->_objectiveRow.storage + 2), !HIWORD(v38))
            ? (v39 = v38)
            : (v39 = v38 - 0x40000000),
              !HIWORD(v38) ? (v40 = (uint64_t *)(v32 + 1)) : (v40 = (uint64_t *)(v32 + 3)),
              (NSBitSetContainsIndex(v40, v39) & 1) == 0))
        {
          v50 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSISEngine removeConstraintWithMarker:]"), CFSTR("NSISEngine.m"), 2688, CFSTR("Marker should not be in a body row."));
        }
      }
      _col_removeFromAllRows((uint64_t)self, (uint64_t)v32);
    }
    v41 = *((_DWORD *)self->_objectiveRow.storage + 2);
    if (HIWORD(v41))
      v42 = v41 - 0x40000000;
    else
      v42 = v41;
    if (HIWORD(v41))
      v43 = (uint64_t *)(v32 + 3);
    else
      v43 = (uint64_t *)(v32 + 1);
    if (NSBitSetContainsIndex(v43, v42))
    {
      v49 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSISEngine removeConstraintWithMarker:]"), CFSTR("NSISEngine.m"), 2691, CFSTR("The marker should no longer be in the objective row."));
    }
LABEL_66:
    _engineVar_rawRemove((uint64_t)self, v18);
    goto LABEL_67;
  }
  _pivotToMakeColNewHeadOfRow((uint64_t)self, (uint64_t)self, v32, v51, *((uint64_t *)&v51 + 1), 1);
LABEL_67:
  v51 = 0uLL;
  if (-[NSISEngine positiveErrorVarForBrokenConstraintWithMarker:errorVar:]((_BOOL8)self, (uint64_t)a3, (uint64_t *)&v51))
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, 1100.0, -1.0, v51, *((uint64_t *)&v51 + 1));
    objc_msgSend(-[NSISEngine _brokenConstraintPositiveErrorsIfAvailable](self, "_brokenConstraintPositiveErrorsIfAvailable"), "removeObjectForKey:", a3);
    _engineVar_rawRemove(v51, **((uint64_t ***)&v51 + 1));
  }
  if (-[NSISEngine negativeErrorVarForBrokenConstraintWithMarker:errorVar:]((_BOOL8)self, (uint64_t)a3, (uint64_t *)&v51))
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, 1100.0, -1.0, v51, *((uint64_t *)&v51 + 1));
    objc_msgSend(-[NSISEngine _brokenConstraintNegativeErrorsIfAvailable](self, "_brokenConstraintNegativeErrorsIfAvailable"), "removeObjectForKey:", a3);
    _engineVar_rawRemove(v51, **((uint64_t ***)&v51 + 1));
  }
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    -[NSISEngine verifyInternalIntegrity](self, "verifyInternalIntegrity");
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate && !self->_engineDelegateCallsDisabledCount)
    -[NSISEngineDelegate constraintsDidChangeInEngine:](delegate, "constraintsDidChangeInEngine:", self);
  kdebug_trace();
}

- (BOOL)hasValue:(double *)a3 forVariable:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (!a4)
    return 0;
  v7 = 0;
  while (*((NSISEngine **)a4 + v7 + 3) != self)
  {
    if (++v7 == 3)
      goto LABEL_7;
  }
  if (*((_DWORD *)a4 + v7 + 12) != -1)
    goto LABEL_9;
LABEL_7:
  if (!*((_QWORD *)a4 + 2) || objc_msgSend(a4, "overflowEngineVarIndexForEngine:", self) == -1)
    return 0;
LABEL_9:
  v8 = 0;
  while (*((NSISEngine **)a4 + v8 + 3) != self)
  {
    if (++v8 == 3)
      goto LABEL_15;
  }
  v10 = *((_DWORD *)a4 + v8 + 12);
  if (v10 != -1)
    goto LABEL_18;
LABEL_15:
  if (*((_QWORD *)a4 + 2))
    v10 = objc_msgSend(a4, "overflowEngineVarIndexForEngine:", self);
  else
    v10 = -1;
LABEL_18:
  v11 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v10 >> 3) & 0x1FFFFFF8))
      + 32 * (v10 & 0x3F);
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a4, self);
  }
  if (*(id *)v11 != a4)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v11, a4);
  }
  return -[NSISEngine hasValue:forEngineVar:]((uint64_t)self, a3, (uint64_t)self, v11);
}

- (void)withBehaviors:(unint64_t)a3 performModifications:(id)a4
{
  char v5;
  _BOOL4 accumulatingRemovals;
  NSISEngine *v8;
  int v9;

  v5 = a3;
  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  if ((v5 & 1) == 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_3;
LABEL_15:
    ++self->_engineDelegateCallsDisabledCount;
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  ++self->_automaticOptimizationDisabledCount;
  if ((v5 & 2) != 0)
    goto LABEL_15;
LABEL_3:
  if ((v5 & 4) != 0)
LABEL_4:
    ++self->_variableDelegateCallsDisabledCount;
LABEL_5:
  accumulatingRemovals = self->_accumulatingRemovals;
  v8 = self;
  (*((void (**)(id))a4 + 2))(a4);
  if (!accumulatingRemovals && self->_accumulatingRemovals)
  {
    self->_accumulatingRemovals = 0;
    -[NSISEngine _flushPendingRemovals]();
  }
  if ((v5 & 1) != 0)
  {
    v9 = self->_automaticOptimizationDisabledCount - 1;
    self->_automaticOptimizationDisabledCount = v9;
    if ((v5 & 8) == 0 && !v9 && self->_engineNeedsOptimization)
    {
      if (_NSConstraintBasedLayoutDeferOptimization())
        -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
      else
        -[NSISEngine optimize](self, "optimize");
      if (_NSConstraintBasedLayoutDebugEngineConsistency())
        -[NSISEngine verifyInternalIntegrity](self, "verifyInternalIntegrity");
    }
  }
  if ((v5 & 2) != 0)
    --self->_engineDelegateCallsDisabledCount;
  if ((v5 & 4) != 0)
    --self->_variableDelegateCallsDisabledCount;

}

- (uint64_t)_optimizeIfNotDisabled
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    _AssertAutoLayoutOnAllowedThreadsOnly(result);
    if (_NSConstraintBasedLayoutDeferOptimization())
    {
      if (!*(_BYTE *)(v1 + 158))
      {
        if (*(_BYTE *)(v1 + 160))
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__optimizeIfNotDisabled, v1, CFSTR("NSISEngine.m"), 2039, CFSTR("Engine marked as needing optimization even though it's already in progress."));
        *(_BYTE *)(v1 + 158) = 1;
        if (!*(_DWORD *)(v1 + 140))
          objc_msgSend(*(id *)(v1 + 56), "solutionDidChangeInEngine:", v1);
      }
      return 0;
    }
    if (*(_DWORD *)(v1 + 136))
    {
      if (*(_BYTE *)(v1 + 160))
        return 0;
      result = 0;
      *(_BYTE *)(v1 + 158) = 1;
    }
    else
    {
      objc_msgSend((id)v1, "optimize");
      return 1;
    }
  }
  return result;
}

- (BOOL)positiveErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (result)
  {
    v4 = result;
    v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)result, "_brokenConstraintPositiveErrorsIfAvailable"), "objectForKey:", a2);
    result = v5 != 0;
    if (a3)
    {
      if (v5)
      {
        v6 = 0;
        while (v5[v6 + 3] != v4)
        {
          if (++v6 == 3)
            goto LABEL_9;
        }
        v7 = *((_DWORD *)v5 + v6 + 12);
        if (v7 != -1)
          goto LABEL_12;
LABEL_9:
        if (v5[2])
          v7 = objc_msgSend(v5, "overflowEngineVarIndexForEngine:", v4);
        else
          v7 = -1;
LABEL_12:
        v8 = *(_QWORD *)(*(_QWORD *)(v4 + 192) + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
        v9 = v7 & 0x3F;
        v10 = (_QWORD *)(v8 + 32 * v9);
        if (*((_DWORD *)v10 + 4) == -1)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v5, v4);
        }
        if ((_QWORD *)*v10 != v5)
        {
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v10, v5);
        }
        v11 = v8 + 32 * v9;
        if ((*(_BYTE *)(v11 + 24) & 1) != 0)
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v10);
        }
        v12 = *(_QWORD *)(v11 + 8);
        *a3 = v4;
        a3[1] = v12;
        return 1;
      }
    }
  }
  return result;
}

- (id)_brokenConstraintPositiveErrorsIfAvailable
{
  if (self->_brokenConstraintPositiveErrors)
    return (id)_NSFaultInObject();
  else
    return 0;
}

- (BOOL)negativeErrorVarForBrokenConstraintWithMarker:(uint64_t *)a3 errorVar:
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (result)
  {
    v4 = result;
    v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)result, "_brokenConstraintNegativeErrorsIfAvailable"), "objectForKey:", a2);
    result = v5 != 0;
    if (a3)
    {
      if (v5)
      {
        v6 = 0;
        while (v5[v6 + 3] != v4)
        {
          if (++v6 == 3)
            goto LABEL_9;
        }
        v7 = *((_DWORD *)v5 + v6 + 12);
        if (v7 != -1)
          goto LABEL_12;
LABEL_9:
        if (v5[2])
          v7 = objc_msgSend(v5, "overflowEngineVarIndexForEngine:", v4);
        else
          v7 = -1;
LABEL_12:
        v8 = *(_QWORD *)(*(_QWORD *)(v4 + 192) + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
        v9 = v7 & 0x3F;
        v10 = (_QWORD *)(v8 + 32 * v9);
        if (*((_DWORD *)v10 + 4) == -1)
        {
          v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v5, v4);
        }
        if ((_QWORD *)*v10 != v5)
        {
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v10, v5);
        }
        v11 = v8 + 32 * v9;
        if ((*(_BYTE *)(v11 + 24) & 1) != 0)
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v10);
        }
        v12 = *(_QWORD *)(v11 + 8);
        *a3 = v4;
        a3[1] = v12;
        return 1;
      }
    }
  }
  return result;
}

- (id)_brokenConstraintNegativeErrorsIfAvailable
{
  if (self->_brokenConstraintNegativeErrors)
    return (id)_NSFaultInObject();
  else
    return 0;
}

- (BOOL)outgoingRowHeadForRemovingConstraintWithMarker:(uint64_t)a3 outgoingRowHead:(_OWORD *)a4
{
  uint64_t **v5;
  unint64_t i;
  uint64_t **v7;
  uint64_t j;
  unint64_t k;
  uint64_t m;
  unint64_t n;
  uint64_t ii;
  _BOOL8 v13;
  _QWORD v18[7];
  _QWORD v19[2];
  void (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, uint64_t, uint64_t);
  void *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  void *v37;
  uint64_t *v38;
  uint64_t *v39;
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  if (!a1)
    return 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3010000000;
  v45 = a1;
  v46 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0x7FEFFFFFFFFFFFFFLL;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke;
  v37 = &unk_1E4A48BA0;
  v5 = (uint64_t **)(a3 + 8);
  v38 = &v47;
  v39 = &v41;
  for (i = NSBitSetFindNext((uint64_t **)(a3 + 8), 0); i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(v5, i + 1))
    v36((uint64_t)v35, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  v7 = (uint64_t **)(a3 + 24);
  for (j = NSBitSetFindNext((uint64_t **)(a3 + 24), 0); j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext(v7, j + 1))
    v36((uint64_t)v35, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  if (!*((_BYTE *)v48 + 24))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v28 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_2;
    v29 = &unk_1E4A48BC8;
    v33 = a2;
    v34 = a3;
    v30 = &v47;
    v31 = v40;
    v32 = &v41;
    for (k = NSBitSetFindNext(v5, 0); k != 0x7FFFFFFFFFFFFFFFLL; k = NSBitSetFindNext(v5, k + 1))
      v28((uint64_t)v27, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((k >> 30) & 1)) + 8 * ((k & 0xBFFFFFFF) / 0x17))+ 88 * ((k & 0xBFFFFFFF) % 0x17));
    for (m = NSBitSetFindNext(v7, 0); m != 0x7FFFFFFFFFFFFFFFLL; m = NSBitSetFindNext(v7, m + 1))
      v28((uint64_t)v27, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((m + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)m + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)m + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  if (!*((_BYTE *)v48 + 24))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v20 = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_3;
    v21 = &unk_1E4A48BC8;
    v25 = a2;
    v26 = a3;
    v22 = &v47;
    v23 = v40;
    v24 = &v41;
    for (n = NSBitSetFindNext(v5, 0); n != 0x7FFFFFFFFFFFFFFFLL; n = NSBitSetFindNext(v5, n + 1))
      v20((uint64_t)v19, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((n >> 30) & 1)) + 8 * ((n & 0xBFFFFFFF) / 0x17))+ 88 * ((n & 0xBFFFFFFF) % 0x17));
    for (ii = NSBitSetFindNext(v7, 0); ii != 0x7FFFFFFFFFFFFFFFLL; ii = NSBitSetFindNext(v7, ii + 1))
      v20((uint64_t)v19, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((ii + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)ii + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)ii + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  if (!*((_BYTE *)v48 + 24))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_4;
    v18[3] = &unk_1E4A48BF0;
    v18[4] = a1;
    v18[5] = &v47;
    v18[6] = &v41;
    _col_enumerateRowsUntil(a2, a3, (uint64_t)v18);
  }
  if (a4)
    *a4 = *((_OWORD *)v42 + 2);
  v13 = *((_BYTE *)v48 + 24) != 0;
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v13;
}

uint64_t __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)a3 + 24) & 6) == 4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v3 + 32) = a2;
    *(_QWORD *)(v3 + 40) = a3;
  }
  return result;
}

void __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)(*(_QWORD *)a3 + 24) & 6) != 0)
  {
    v6 = a3 + 16;
    v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(_QWORD **)(a1 + 64) + 16));
    if (v7 < 0.0)
    {
      v8 = -NSISLinExpConstant(v6) / v7;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (!*(_BYTE *)(v9 + 24) || v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        *(_BYTE *)(v9 + 24) = 1;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        *(_QWORD *)(v10 + 32) = a2;
        *(_QWORD *)(v10 + 40) = a3;
      }
    }
  }
}

void __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)(*(_QWORD *)a3 + 24) & 6) != 0)
  {
    v6 = a3 + 16;
    v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(_QWORD **)(a1 + 64) + 16));
    v8 = NSISLinExpConstant(v6) / v7;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_BYTE *)(v9 + 24) || v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_QWORD *)(v10 + 32) = a2;
      *(_QWORD *)(v10 + 40) = a3;
    }
  }
}

- (uint64_t)_coreReplaceMarker:(double)a3 withMarkerPlusDelta:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Next;
  unint64_t i;
  uint64_t v16;
  uint64_t v17;
  double v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  double (*v23)(uint64_t *, uint64_t, id **);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;

  if (result && a2)
  {
    v5 = result;
    v6 = 0;
    while (a2[v6 + 3] != result)
    {
      if (++v6 == 3)
        goto LABEL_8;
    }
    if (*((_DWORD *)a2 + v6 + 12) == -1)
    {
LABEL_8:
      if (!a2[2])
        return result;
      result = objc_msgSend(a2, "overflowEngineVarIndexForEngine:", result);
      if ((_DWORD)result == -1)
        return result;
    }
    ++*(_DWORD *)(v5 + 148);
    -[NSISEngine _flushPendingRemovals]();
    v7 = 0;
    while (a2[v7 + 3] != v5)
    {
      if (++v7 == 3)
        goto LABEL_15;
    }
    v8 = *((_DWORD *)a2 + v7 + 12);
    if (v8 != -1)
      goto LABEL_18;
LABEL_15:
    if (a2[2])
      v8 = objc_msgSend(a2, "overflowEngineVarIndexForEngine:", v5);
    else
      v8 = -1;
LABEL_18:
    v9 = *(_QWORD *)(*(_QWORD *)(v5 + 192) + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
    v10 = v8 & 0x3F;
    v11 = v9 + 32 * v10;
    if (*(_DWORD *)(v11 + 16) == -1)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a2, v5);
    }
    if (*(_QWORD **)v11 != a2)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v11, a2);
    }
    v12 = v9 + 32 * v10;
    if ((*(_BYTE *)(v12 + 24) & 1) != 0)
    {
      v17 = *(_QWORD *)(v12 + 8);
      result = NSISLinExpIncrementConstant(v17 + 16, -a3);
      v19 = (*(_DWORD *)(*(_QWORD *)v17 + 24) >> 1) & 3;
      if (v19 == 2)
      {
        if (v18 == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0)
            return result;
        }
        else if (fabs(v18) < *(double *)&NSISEpsilon)
        {
          return result;
        }
      }
      else if (v19 != 1 || v18 >= 0.0)
      {
        return result;
      }
      return objc_msgSend(*(id *)(v5 + 8), "addObject:", a2);
    }
    v13 = *(_QWORD *)(v12 + 8);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v23 = __53__NSISEngine__coreReplaceMarker_withMarkerPlusDelta___block_invoke;
    v24 = &unk_1E4A48C18;
    v26 = v5;
    v27 = v13;
    v28 = a3;
    v25 = v5;
    Next = NSBitSetFindNext((uint64_t **)(v13 + 8), 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)(v13 + 8), i + 1))
        v23(v22, v5, (id **)(*(_QWORD *)(*(_QWORD *)(v5 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
    }
    result = NSBitSetFindNext((uint64_t **)(v13 + 24), 0);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = result;
      do
      {
        v23(v22, v5, (id **)(*(_QWORD *)(*(_QWORD *)(v5 + 232 + 40 * (((v16 + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)v16 + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)v16 + 0x40000000) & 0xBFFFFFFF) % 0x17)));
        result = NSBitSetFindNext((uint64_t **)(v13 + 24), v16 + 1);
        v16 = result;
      }
      while (result != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

double __53__NSISEngine__coreReplaceMarker_withMarkerPlusDelta___block_invoke(uint64_t *a1, uint64_t a2, id **a3)
{
  int v6;
  int v7;
  double v8;
  uint64_t v9;
  double result;
  int v11;

  v6 = *((_DWORD *)a3 + 20);
  LOBYTE(v7) = v6;
  if ((v6 & 1) == 0)
  {
    NSISLinExpConstant((uint64_t)(a3 + 2));
    v7 = *((_DWORD *)a3 + 20);
  }
  v8 = *((double *)a1 + 7);
  v9 = a1[6];
  if ((v7 & 1) != 0)
  {
    -[NSISObjectiveLinearExpression replaceVar:withVarPlusDelta:]((unsigned __int16 *)a3[2], *(_DWORD *)(*(_QWORD *)v9 + 16), v8);
    if ((v6 & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  NSISLinExpReplaceVarWithVarPlusDelta((uint64_t)(a3 + 2), *(_DWORD *)(*(_QWORD *)v9 + 16), v8);
  if ((v6 & 1) == 0)
LABEL_7:
    _noteValueOfVariableChanged(a1[4], a2, *a3);
LABEL_8:
  if (((_BYTE)(*a3)[3] & 6) == 0)
    return result;
  result = NSISLinExpConstant((uint64_t)(a3 + 2));
  v11 = (*((_DWORD *)*a3 + 6) >> 1) & 3;
  if (v11 == 2)
  {
    if (result == 0.0)
    {
      result = *(double *)&NSISEpsilon;
      if (*(double *)&NSISEpsilon > 0.0)
        return result;
    }
    else
    {
      result = fabs(result);
      if (result < *(double *)&NSISEpsilon)
        return result;
    }
LABEL_12:
    objc_msgSend(*(id *)(a1[4] + 8), "addObject:", **a3);
    return result;
  }
  if (v11 == 1 && result < 0.0)
    goto LABEL_12;
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NSISEngineDelegate *)a3;
}

- (void)setEngineScalingCoefficients:(CGSize)a3
{
  self->_engineScalingCoefficients = a3;
}

- (double)valueForVariable:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (!a3)
    return 0.0;
  v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3)
      goto LABEL_7;
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1)
    goto LABEL_9;
LABEL_7:
  if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
    return 0.0;
LABEL_9:
  v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3)
      goto LABEL_15;
  }
  v8 = *((_DWORD *)a3 + v6 + 12);
  if (v8 != -1)
    goto LABEL_18;
LABEL_15:
  if (*((_QWORD *)a3 + 2))
    v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v8 = -1;
LABEL_18:
  v9 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8))
     + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*(id *)v9 != a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v9, a3);
  }
  return -[NSISEngine valueForEngineVar:](self, (uint64_t)self, v9);
}

- (void)addVariableToBeOptimized:(id)a3 priority:(double)a4
{
  NSMutableDictionary *recordedOperations;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    v9 = NSISWrapExactFloat(a4);
    _NSISRecordOperation(recordedOperations, a2, v10, v11, v12, v13, v14, v15, (unsigned int *)a3, v9);
  }
  ++self->_totalChangeCount;
  v16 = _engineVar_addForVariableIfNeeded((uint64_t)self, a3);
  v18 = (_QWORD *)v17;
  if ((*(_BYTE *)(v17 + 24) & 1) != 0)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v18);
  }
  v19 = v18[1];
  if (_NSConstraintBasedLayoutVariableChangeTransactions())
  {
    if ((v18[3] & 1) != 0)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v18);
    }
    v20 = v18[1];
    v21 = NSBitSetCount(v20 + 8);
    if (!(NSBitSetCount(v20 + 24) + v21))
      _noteValueOfVariableChanged((uint64_t)self, v16, v18);
  }
  _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a4, 1.0, v16, v19);
}

- (void)setShouldIntegralize:(BOOL)a3
{
  if (a3 && setShouldIntegralize__onceToken != -1)
    dispatch_once(&setShouldIntegralize__onceToken, &__block_literal_global_28);
}

- (unint64_t)rowCount
{
  uint64_t v2;
  unint64_t v3;
  $3E203C1A4D83D8254D06B66E229CD352 *rowTables;
  char v5;
  char v6;
  $3E203C1A4D83D8254D06B66E229CD352 *v7;
  unint64_t blocksCount;
  uint64_t v9;

  v2 = 0;
  v3 = 0;
  rowTables = self->_rowTables;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = &rowTables[v2];
    blocksCount = v7->blocksCount;
    v9 = NSBitSetCount((uint64_t)&v7->freeIndexes);
    v5 = 0;
    v3 = v3 - v9 + 23 * blocksCount;
    v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (uint64_t)handleUnsatisfiableRow:(uint64_t)a3 usingInfeasibilityHandlingBehavior:(uint64_t)a4 prospectiveRowHead:(uint64_t *)a5 mutuallyExclusiveConstraints:(_QWORD *)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  id *v16;
  uint64_t v17;
  double v18;
  int v19;
  uint64_t v20;
  _BOOL4 v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  NSISVariable *v27;
  NSISVariable *v28;
  uint64_t v29;
  unsigned int value;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t **v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[7];
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  _QWORD *v55;

  if (!result)
    return result;
  v11 = result;
  v12 = _mutuallyExclusiveConstraintsForUnsatisfiableRow(a2, a3);
  if (!objc_msgSend(v12, "count"))
  {
    if (!a6)
      return 0;
LABEL_51:
    result = 0;
    *a6 = v12;
    return result;
  }
  if (a4 == 1)
    goto LABEL_51;
  if (a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unknown infeasibility behavior"), 0));
  v13 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v14 = *(void **)(v11 + 56);
    if (v14)
    {
      v15 = (_QWORD *)objc_msgSend(v14, "engine:markerForConstraintToBreakAmongConstraints:", v11, v12);
    }
    else
    {
      v44 = 0;
      v45 = &v44;
      v46 = 0x3052000000;
      v47 = __Block_byref_object_copy__0;
      v48 = __Block_byref_object_dispose__0;
      v49 = 0;
      v16 = *(id **)a3;
      if (objc_msgSend(**(id **)a3, "markedConstraint"))
      {
        v15 = *v16;
        v45[5] = (uint64_t)v15;
      }
      else
      {
        v43[0] = v13;
        v43[1] = 3221225472;
        v43[2] = ___fallbackMarkerForConstraintToBreakInRow_block_invoke;
        v43[3] = &unk_1E4A48EC0;
        v43[4] = &v44;
        if ((*(_BYTE *)(a3 + 80) & 1) != 0)
        {
          v17 = *(_QWORD *)(a3 + 16);
          v50 = v13;
          v51 = 3221225472;
          v52 = (uint64_t)___row_enumerateCols_block_invoke;
          v53 = (const char *)&unk_1E4A48E98;
          v54 = a2;
          v55 = v43;
          -[NSISObjectiveLinearExpression enumerateVars:](v17, (uint64_t)&v50);
        }
        else
        {
          v50 = v13;
          v51 = 3221225472;
          v52 = (uint64_t)___row_enumerateCols_block_invoke_2;
          v53 = (const char *)&unk_1E4A48E98;
          v54 = a2;
          v55 = v43;
          NSISLinExpEnumerateVars((unsigned __int16 *)(a3 + 16), (uint64_t)&v50);
        }
        v15 = (_QWORD *)v45[5];
      }
      _Block_object_dispose(&v44, 8);
    }
    v18 = NSISLinExpConstant(a3 + 16);
    v19 = v18 > 0.0;
    if (v15 != **(id **)a3)
    {
      if (v15)
      {
        v20 = 0;
        while (v15[v20 + 3] != v11)
        {
          if (++v20 == 3)
            goto LABEL_23;
        }
        v22 = *((_DWORD *)v15 + v20 + 12);
        if (v22 != -1)
          goto LABEL_26;
LABEL_23:
        if (v15[2])
          v22 = objc_msgSend(v15, "overflowEngineVarIndexForEngine:", v11);
        else
          v22 = -1;
LABEL_26:
        v23 = *(_QWORD *)(*(_QWORD *)(v11 + 192) + (((unint64_t)v22 >> 3) & 0x1FFFFFF8));
        v24 = v22 & 0x3F;
        v25 = (_QWORD *)(v23 + 32 * v24);
        if (*((_DWORD *)v25 + 4) == -1)
        {
          v40 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v15, v11);
        }
        if ((_QWORD *)*v25 != v15)
        {
          v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v25, v15);
        }
        v26 = v23 + 32 * v24;
        if ((*(_BYTE *)(v26 + 24) & 1) != 0)
        {
          v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v25);
        }
        v21 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(_QWORD **)(v26 + 8) + 16)) > 0.0;
      }
      else
      {
        v21 = 0;
      }
      v19 = (v18 > 0.0) ^ v21;
    }
    objc_msgSend(*(id *)(v11 + 56), "engine:willBreakConstraint:dueToMutuallyExclusiveConstraints:", v11, objc_msgSend(v15, "markedConstraint"), v12);
    v27 = -[NSISEngine errorVariableIntroducedByBreakingConstraintWithMarker:errorIsPositive:]((_QWORD *)v11, v15, v19);
    v28 = v27;
    v29 = 0;
    v50 = 0;
    v51 = (uint64_t)&v50;
    v52 = 0x3010000000;
    v54 = 0;
    v55 = 0;
    while (v27->_engines[v29] != (NSISEngine *)v11)
    {
      if (++v29 == 3)
        goto LABEL_39;
    }
    value = v27->_engineVarIndexes[v29].value;
    if (value != -1)
      goto LABEL_42;
LABEL_39:
    value = v28->_overflowEngines
          ? -[NSISVariable overflowEngineVarIndexForEngine:](v28, "overflowEngineVarIndexForEngine:", v11)
          : -1;
LABEL_42:
    v31 = *(_QWORD *)(*(_QWORD *)(v11 + 192) + (((unint64_t)value >> 3) & 0x1FFFFFF8));
    v32 = value & 0x3F;
    v33 = (_QWORD *)(v31 + 32 * v32);
    if (*((_DWORD *)v33 + 4) == -1)
    {
      v36 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v28, v11);
    }
    if ((NSISVariable *)*v33 != v28)
    {
      v37 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v33, v28);
    }
    v34 = v31 + 32 * v32;
    if ((*(_BYTE *)(v34 + 24) & 1) != 0)
    {
      v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v33);
    }
    v35 = *(uint64_t ***)(v34 + 8);
    v13 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __120__NSISEngine_handleUnsatisfiableRow_usingInfeasibilityHandlingBehavior_prospectiveRowHead_mutuallyExclusiveConstraints___block_invoke;
    v42[3] = &unk_1E4A488E8;
    v42[5] = a2;
    v42[6] = a3;
    v42[4] = &v50;
    if (!_col_enumerateRowsUntil(v11, (uint64_t)v35, (uint64_t)v42))
      break;
    _pivotToMakeColNewHeadOfRow(v11, v11, v35, *(_QWORD *)(v51 + 32), *(_QWORD *)(v51 + 40), 0);
    v12 = _mutuallyExclusiveConstraintsForUnsatisfiableRow(a2, a3);
    _Block_object_dispose(&v50, 8);
  }
  if (a5)
  {
    *a5 = v11;
    a5[1] = (uint64_t)v35;
  }
  _Block_object_dispose(&v50, 8);
  return 1;
}

uint64_t __120__NSISEngine_handleUnsatisfiableRow_usingInfeasibilityHandlingBehavior_prospectiveRowHead_mutuallyExclusiveConstraints___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 48) == a3 || (*(_DWORD *)(*(_QWORD *)a3 + 24) & 6) != 4)
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = a3;
  return 1;
}

BOOL __77__NSISEngine_outgoingRowHeadForRemovingConstraintWithMarker_outgoingRowHead___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1[4] + 408);
  if (a3 != v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v4 = *(_QWORD *)(a1[6] + 8);
    *(_QWORD *)(v4 + 32) = a2;
    *(_QWORD *)(v4 + 40) = a3;
  }
  return a3 != v3;
}

- (NSISVariable)errorVariableIntroducedByBreakingConstraintWithMarker:(int)a3 errorIsPositive:
{
  uint64_t v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  NSISVariable *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;

  if (!a1)
    return 0;
  v6 = 0;
  if (a3)
    v7 = 1.0;
  else
    v7 = -1.0;
  while ((_QWORD *)a2[v6 + 3] != a1)
  {
    if (++v6 == 3)
      goto LABEL_9;
  }
  v8 = *((_DWORD *)a2 + v6 + 12);
  if (v8 != -1)
    goto LABEL_12;
LABEL_9:
  if (a2[2])
    v8 = objc_msgSend(a2, "overflowEngineVarIndexForEngine:", a1);
  else
    v8 = -1;
LABEL_12:
  v9 = *(_QWORD *)(a1[24] + (((unint64_t)v8 >> 3) & 0x1FFFFFF8)) + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a2, a1);
  }
  if (*(_QWORD **)v9 != a2)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v9, a2);
  }
  v10 = +[NSISVariable variableWithDelegate:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithDelegate:valueRestriction:shouldBeMinimized:", a1, 1, 1);
  v11 = _engineVar_addForVariableIfNeeded((uint64_t)a1, v10);
  v13 = (_QWORD *)v12;
  if ((*(_BYTE *)(v12 + 24) & 1) != 0)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v13);
  }
  v14 = v13[1];
  _objectiveRow_addColWithPriorityTimes(a1[50], a1[51], 1100.0, 1.0, v11, v14);
  -[NSISEngine replaceMarker:withMarkerPlusCoefficient:timesCol:]((uint64_t)a1, (uint64_t)a1, v9, v11, v14, v7);
  if (a3)
    -[NSISEngine setPositiveErrorVar:forBrokenConstraintWithMarker:](a1, (uint64_t)v10, (uint64_t)a2);
  else
    -[NSISEngine setNegativeErrorVar:forBrokenConstraintWithMarker:](a1, (uint64_t)v10, (uint64_t)a2);
  return v10;
}

- (void)replaceMarker:(uint64_t)a3 withMarkerPlusCoefficient:(uint64_t)a4 timesCol:(uint64_t)a5
{
  uint64_t v7;
  uint64_t Next;
  unint64_t i;
  uint64_t v10;
  uint64_t j;
  unsigned int v12;
  _QWORD v13[2];
  void (*v14)(double *, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[7];

  if (a1)
  {
    v7 = *(_QWORD *)(a3 + 8);
    if ((*(_BYTE *)(a3 + 24) & 1) != 0)
    {
      v21[5] = *(_QWORD *)(a3 + 8);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = ___row_addColWithCoefficient_block_invoke;
      v22[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
      v22[4] = a2;
      v22[5] = v7;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = ___row_addColWithCoefficient_block_invoke_2;
      v21[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
      v21[4] = a2;
      v12 = *(_DWORD *)(*(_QWORD *)a5 + 16);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = ___row_rawAddCol_block_invoke;
      v24[3] = &unk_1E4A48E98;
      v24[4] = a2;
      v24[5] = v22;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = ___row_rawAddCol_block_invoke_2;
      v23[3] = &unk_1E4A48E98;
      v23[4] = a2;
      v23[5] = v21;
      NSISLinExpAddVarWithProcessors((unsigned __int16 *)(v7 + 16), v12, (uint64_t)v24, (uint64_t)v23, -a6);
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v14 = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke;
      v15 = &__block_descriptor_72_e16_v24__0_________8ls32l8s56l8;
      v16 = a2;
      v17 = v7;
      v18 = a6;
      v19 = a4;
      v20 = a5;
      Next = NSBitSetFindNext((uint64_t **)(v7 + 8), 0);
      if (Next != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)(v7 + 8), i + 1))
          v14((double *)v13, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
      }
      v10 = NSBitSetFindNext((uint64_t **)(v7 + 24), 0);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (j = v10; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext((uint64_t **)(v7 + 24), j + 1))
          v14((double *)v13, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17));
      }
    }
  }
}

void __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke(double *a1, uint64_t a2, uint64_t a3)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, unsigned int);
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, unsigned int);
  void *v23;
  uint64_t v24;
  _QWORD *v25;

  v3 = a1[6];
  v12[5] = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_2;
  v13[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v13[4] = a2;
  v13[5] = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_3;
  v12[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v12[4] = a2;
  v4 = *((_QWORD *)a1 + 5);
  v5 = *((_QWORD *)a1 + 8);
  v6 = (unsigned __int16 *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
  {
    v9 = *(_QWORD *)v6;
    v10 = *(_DWORD *)(*(_QWORD *)v4 + 16);
    v11 = *(_DWORD *)(*(_QWORD *)v5 + 16);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke;
    v23 = &unk_1E4A48E98;
    v24 = a2;
    v25 = v13;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_2;
    v17 = &unk_1E4A48E98;
    v18 = a2;
    v19 = v12;
    -[NSISObjectiveLinearExpression replaceVar:withVarPlusDelta:timesVar:processVarNewToReceiver:processVarDroppedFromReceiver:](v9, v10, v11, (uint64_t)&v20, (uint64_t)&v14, v3);
  }
  else
  {
    v7 = *(_DWORD *)(*(_QWORD *)v4 + 16);
    v8 = *(_DWORD *)(*(_QWORD *)v5 + 16);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_3;
    v23 = &unk_1E4A48E98;
    v24 = a2;
    v25 = v13;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_4;
    v17 = &unk_1E4A48E98;
    v18 = a2;
    v19 = v12;
    NSISLinExpReplaceVarWithVarPlusDeltaTimesNewVar(v6, v7, v8, (uint64_t)&v20, (uint64_t)&v14, v3);
  }
}

void __63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

- (void)setNegativeErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:
{
  if (result)
  {
    if (a2)
      return (void *)objc_msgSend((id)_NSFaultInObject(), "setObject:forKey:", a2, a3);
    else
      return (void *)objc_msgSend((id)objc_msgSend(result, "_brokenConstraintNegativeErrorsIfAvailable"), "removeObjectForKey:", a3);
  }
  return result;
}

- (void)setPositiveErrorVar:(uint64_t)a3 forBrokenConstraintWithMarker:
{
  if (result)
  {
    if (a2)
      return (void *)objc_msgSend((id)_NSFaultInObject(), "setObject:forKey:", a2, a3);
    else
      return (void *)objc_msgSend((id)objc_msgSend(result, "_brokenConstraintPositiveErrorsIfAvailable"), "removeObjectForKey:", a3);
  }
  return result;
}

- (void)dealloc
{
  _NSISVariableObservable *dirtyObservables;
  _NSISVariableObservable *nextDirtyObservable;
  NSISVariableObservation *dirtyVariableObservations;
  NSISVariableObservation *nextDirtyObservation;
  unint64_t v7;
  uint64_t v8;
  $3E203C1A4D83D8254D06B66E229CD352 *colTables;
  $3E203C1A4D83D8254D06B66E229CD352 *rowTables;
  char v11;
  char v12;
  $3E203C1A4D83D8254D06B66E229CD352 *v13;
  unint64_t v14;
  $3E203C1A4D83D8254D06B66E229CD352 *v15;
  unint64_t v16;
  uint64_t v17;
  NSMapTable *brokenConstraintPositiveErrors;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSMapTable *brokenConstraintNegativeErrors;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dirtyObservables = self->_dirtyObservables;
  self->_dirtyObservables = 0;
  if (dirtyObservables)
  {
    do
    {
      nextDirtyObservable = dirtyObservables->_nextDirtyObservable;
      dirtyObservables->_nextDirtyObservable = 0;
      dirtyObservables->_prevDirtyObservable = 0;
      dirtyObservables = nextDirtyObservable;
    }
    while (nextDirtyObservable);
  }
  dirtyVariableObservations = self->_dirtyVariableObservations;
  self->_dirtyVariableObservations = 0;
  if (dirtyVariableObservations)
  {
    do
    {
      nextDirtyObservation = dirtyVariableObservations->_nextDirtyObservation;
      dirtyVariableObservations->_nextDirtyObservation = 0;
      dirtyVariableObservations->_prevDirtyObservation = 0;

      dirtyVariableObservations = nextDirtyObservation;
    }
    while (nextDirtyObservation);
  }
  NSISObjectTableDestroy((void **)self->_variablesObservations);
  self->_variableObservables = 0;
  -[NSISEngine _removeAllVariables]((uint64_t)self);
  if (self->_engineVarTable.blocksCount)
  {
    v7 = 0;
    do
      free(*((void **)self->_engineVarTable.blocks + v7++));
    while (v7 < self->_engineVarTable.blocksCount);
  }
  free(self->_engineVarTable.blocks);
  NSBitSetReset((uint64_t)&self->_engineVarTable.freeIndexes);
  v8 = 0;
  colTables = self->_colTables;
  rowTables = self->_rowTables;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = &colTables[v8];
    if (v13->blocksCount)
    {
      v14 = 0;
      do
        free(*((void **)v13->blocks + v14++));
      while (v14 < v13->blocksCount);
    }
    v15 = &rowTables[v8];
    if (v15->blocksCount)
    {
      v16 = 0;
      do
        free(*((void **)v15->blocks + v16++));
      while (v16 < v15->blocksCount);
    }
    free(v13->blocks);
    free(v15->blocks);
    v17 = v8;
    NSBitSetReset((uint64_t)&colTables[v17].freeIndexes);
    NSBitSetReset((uint64_t)&rowTables[v17].freeIndexes);
    v11 = 0;
    v8 = 1;
  }
  while ((v12 & 1) != 0);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  brokenConstraintPositiveErrors = self->_brokenConstraintPositiveErrors;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](brokenConstraintPositiveErrors, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(brokenConstraintPositiveErrors);
        objc_msgSend(-[NSMapTable objectForKey:](self->_brokenConstraintPositiveErrors, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)), "setDelegate:", 0);
      }
      v20 = -[NSMapTable countByEnumeratingWithState:objects:count:](brokenConstraintPositiveErrors, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v20);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  brokenConstraintNegativeErrors = self->_brokenConstraintNegativeErrors;
  v24 = -[NSMapTable countByEnumeratingWithState:objects:count:](brokenConstraintNegativeErrors, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(brokenConstraintNegativeErrors);
        objc_msgSend(-[NSMapTable objectForKey:](self->_brokenConstraintNegativeErrors, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j)), "setDelegate:", 0);
      }
      v25 = -[NSMapTable countByEnumeratingWithState:objects:count:](brokenConstraintNegativeErrors, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v25);
  }

  v28.receiver = self;
  v28.super_class = (Class)NSISEngine;
  -[NSISEngine dealloc](&v28, sel_dealloc);
}

- (void)_removeAllVariables
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;

  if (a1)
  {
    objc_msgSend((id)a1, "enumerateRows:", &__block_literal_global_32);
    -[NSISEngine enumerateCols:]((_QWORD *)a1, (uint64_t)&__block_literal_global_33);
    -[NSISEngine enumerateEngineVars:]((_QWORD *)a1, (uint64_t)&__block_literal_global_34);
    NSBitSetAddIndexesInRange((unsigned int *)(a1 + 216), 0, *(_QWORD *)(a1 + 200) << 6);
    v2 = 0;
    v3 = a1 + 232;
    v4 = a1 + 312;
    v5 = 1;
    do
    {
      v6 = v5;
      v7 = 5 * v2;
      NSBitSetAddIndexesInRange((unsigned int *)(v3 + 40 * v2 + 24), 0, 23 * *(_QWORD *)(v3 + 40 * v2 + 8));
      NSBitSetAddIndexesInRange((unsigned int *)(v4 + 8 * v7 + 24), 0, 25 * *(_QWORD *)(v4 + 8 * v7 + 8));
      v5 = 0;
      v2 = 1;
    }
    while ((v6 & 1) != 0);
  }
}

- (NSISEngine)init
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSISEngine;
  v2 = -[NSISEngine init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 27) = 0;
    *((_QWORD *)v2 + 28) = 1;
    _table_addStorageBlock((void **)v2 + 24, (unint64_t *)v2 + 25, (unint64_t *)v2 + 26, 0x40uLL, 32, (unsigned int *)v2 + 54);
    *((_QWORD *)v3 + 32) = 0;
    *((_QWORD *)v3 + 33) = 1;
    _table_addStorageBlock((void **)v3 + 29, (unint64_t *)v3 + 30, (unint64_t *)v3 + 31, 0x17uLL, 88, (unsigned int *)v3 + 64);
    *((_QWORD *)v3 + 37) = 0;
    *((_QWORD *)v3 + 38) = 1;
    _table_addStorageBlock((void **)v3 + 34, (unint64_t *)v3 + 35, (unint64_t *)v3 + 36, 0x17uLL, 88, (unsigned int *)v3 + 74);
    *((_QWORD *)v3 + 42) = 0;
    *((_QWORD *)v3 + 43) = 1;
    _table_addStorageBlock((void **)v3 + 39, (unint64_t *)v3 + 40, (unint64_t *)v3 + 41, 0x19uLL, 40, (unsigned int *)v3 + 84);
    *((_QWORD *)v3 + 47) = 0;
    *((_QWORD *)v3 + 48) = 1;
    _table_addStorageBlock((void **)v3 + 44, (unint64_t *)v3 + 45, (unint64_t *)v3 + 46, 0x19uLL, 40, (unsigned int *)v3 + 94);
    *((_QWORD *)v3 + 49) = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:", CFSTR("objective"), 0, 0);
    *((_QWORD *)v3 + 52) = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:", CFSTR("placeholderForExpressionBeingAdded"), 1, 0);
    objc_msgSend(v3, "setVariablesWithValueRestrictionViolations:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
    -[NSISEngine _addObjectiveRow]((_QWORD **)v3);
    *((_BYTE *)v3 + 159) = _NSConstraintBasedLayoutAllowUnoptimizedReads();
    *((_BYTE *)v3 + 161) = 1;
    NSISObjectTableCreate();
    *((_QWORD *)v3 + 21) = v4;
  }
  return (NSISEngine *)v3;
}

- (void)setVariablesWithValueRestrictionViolations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_QWORD)_addObjectiveRow
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  id **v5;
  _QWORD *v6;
  unint64_t Index;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = _engineVar_addForVariableIfNeeded((uint64_t)result, result[49]);
    v4 = (_QWORD *)v3;
    if ((*(_BYTE *)(v3 + 24) & 1) != 0)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v4);
    }
    v5 = (id **)v4[1];
    v6 = -[NSISObjectiveLinearExpression initWithEngine:]([NSISObjectiveLinearExpression alloc], v1);
    if (!NSBitSetCount(v1 + 256))
      _table_addStorageBlock((void **)(v1 + 232), (unint64_t *)(v1 + 240), (unint64_t *)(v1 + 248), 0x17uLL, 88, (unsigned int *)(v1 + 256));
    Index = NSBitSetFirstIndex((uint64_t **)(v1 + 256));
    NSBitSetRemoveIndex((uint64_t *)(v1 + 256), Index);
    v8 = *(_QWORD *)(*(_QWORD *)(v1 + 232 + 40 * ((Index >> 30) & 1)) + 8 * ((Index & 0xBFFFFFFF) / 0x17))
       + 88 * ((Index & 0xBFFFFFFF) % 0x17);
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(v8 + 8) = Index;
    *(_WORD *)(v8 + 16) = 4;
    *(_OWORD *)(v8 + 18) = 0u;
    *(_OWORD *)(v8 + 34) = 0u;
    *(_OWORD *)(v8 + 50) = 0u;
    *(_OWORD *)(v8 + 66) = 0u;
    *(_QWORD *)(v8 + 80) = 0;
    _row_rawSetHead(v1, (_DWORD *)v8, v2, v5);
    *(_DWORD *)(v8 + 80) |= 1u;
    result = v6;
    *(_QWORD *)(v8 + 16) = result;
    *(_QWORD *)(v1 + 400) = v1;
    *(_QWORD *)(v1 + 408) = v8;
  }
  return result;
}

- (double)enumerateEngineVars:(_QWORD *)a1
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t Next;
  uint64_t i;
  double result;
  char v9;
  __int128 v10;

  if (a1)
  {
    v4 = a1 + 27;
    v5 = a1[25] << 6;
    v10 = xmmword_1A373F360;
    NSBitSetAddIndexesInRange((unsigned int *)&v10, 0, v5);
    NSBitSetRemoveIndexes((uint64_t)&v10, v4);
    Next = NSBitSetFindNext((uint64_t **)&v10, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)&v10, i + 1))
      {
        v9 = 0;
        (*(void (**)(uint64_t, _QWORD *, uint64_t, char *))(a2 + 16))(a2, a1, *(_QWORD *)(a1[24] + 8 * (i >> 6)) + 32 * (i & 0x3F), &v9);
        if (v9)
          break;
      }
    }
    return NSBitSetReset((uint64_t)&v10);
  }
  return result;
}

void __33__NSISEngine__removeAllVariables__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSISVariableRemoveEngine(*a3, a2);

  *a3 = 0;
  a3[1] = 0;
}

- (double)enumerateCols:(_QWORD *)a1
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Next;
  unint64_t i;
  uint64_t v10;
  uint64_t j;
  double result;
  __int128 v13;
  __int128 v14;

  if (a1)
  {
    v4 = a1 + 39;
    v5 = a1 + 42;
    v6 = 25 * a1[40];
    v14 = xmmword_1A373F360;
    NSBitSetAddIndexesInRange((unsigned int *)&v14, 0, v6);
    NSBitSetRemoveIndexes((uint64_t)&v14, v5);
    v7 = 25 * a1[45];
    v13 = v14;
    v14 = xmmword_1A373F360;
    NSBitSetAddIndexesInRange((unsigned int *)&v14, 0, v7);
    NSBitSetRemoveIndexes((uint64_t)&v14, a1 + 47);
    Next = NSBitSetFindNext((uint64_t **)&v13, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)&v13, i + 1))
        (*(void (**)(uint64_t, _QWORD *, unint64_t))(a2 + 16))(a2, a1, *(_QWORD *)(v4[5 * ((i >> 30) & 1)] + 8 * ((i & 0xBFFFFFFF) / 0x19)) + 40 * ((i & 0xBFFFFFFF) % 0x19));
    }
    v10 = NSBitSetFindNext((uint64_t **)&v14, 0);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (j = v10; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext((uint64_t **)&v14, j + 1))
        (*(void (**)(uint64_t, _QWORD *, uint64_t))(a2 + 16))(a2, a1, *(_QWORD *)(v4[5 * (((j + 0x40000000) >> 30) & 1)]+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x19uLL))+ 40 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x19));
    }
    NSBitSetReset((uint64_t)&v13);
    return NSBitSetReset((uint64_t)&v14);
  }
  return result;
}

double __33__NSISEngine__removeAllVariables__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSBitSetReset(a3 + 8);
  return NSBitSetReset(a3 + 24);
}

- (void)enumerateRows:(id)a3
{
  $3E203C1A4D83D8254D06B66E229CD352 *rowTables;
  $F40610C1F5DFE1C67032FB35CFDB7CE4 *p_freeIndexes;
  uint64_t v7;
  uint64_t v8;
  uint64_t Next;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  __int128 v14;
  __int128 v15;

  rowTables = self->_rowTables;
  p_freeIndexes = &self->_rowTables[0].freeIndexes;
  v7 = 23 * self->_rowTables[0].blocksCount;
  v15 = xmmword_1A373F360;
  NSBitSetAddIndexesInRange((unsigned int *)&v15, 0, v7);
  NSBitSetRemoveIndexes((uint64_t)&v15, (uint64_t *)p_freeIndexes);
  v8 = 23 * self->_rowTables[1].blocksCount;
  v14 = v15;
  v15 = xmmword_1A373F360;
  NSBitSetAddIndexesInRange((unsigned int *)&v15, 0, v8);
  NSBitSetRemoveIndexes((uint64_t)&v15, (uint64_t *)&self->_rowTables[1].freeIndexes);
  Next = NSBitSetFindNext((uint64_t **)&v14, 0);
  if (Next == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v11 = NSBitSetFindNext((uint64_t **)&v15, 0);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v11; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)&v15, i + 1))
      {
        v13 = 0;
        (*((void (**)(id, NSISEngine *, uint64_t, char *))a3 + 2))(a3, self, *((_QWORD *)rowTables[((i + 0x40000000) >> 30) & 1].blocks+ (((_DWORD)i + 0x40000000) & 0xBFFFFFFF) / 0x17uLL)+ 88 * ((((_DWORD)i + 0x40000000) & 0xBFFFFFFF) % 0x17), &v13);
        if (v13)
          break;
      }
    }
  }
  else
  {
    v10 = Next;
    while (1)
    {
      v13 = 0;
      (*((void (**)(id, NSISEngine *, unint64_t, char *))a3 + 2))(a3, self, *((_QWORD *)rowTables[(v10 >> 30) & 1].blocks + (v10 & 0xBFFFFFFF) / 0x17) + 88 * ((v10 & 0xBFFFFFFF) % 0x17), &v13);
      if (v13)
        break;
      v10 = NSBitSetFindNext((uint64_t **)&v14, v10 + 1);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_5;
    }
  }
  NSBitSetReset((uint64_t)&v14);
  NSBitSetReset((uint64_t)&v15);
}

void __33__NSISEngine__removeAllVariables__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v3;

  v3 = (id *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
  {

    *v3 = 0;
  }
  else
  {
    NSISLinExpFree(a3 + 16);
  }
}

id __45__NSISEngine__brokenConstraintNegativeErrors__block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
}

id __45__NSISEngine__brokenConstraintPositiveErrors__block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
}

- (uint64_t)_brokenConstraintPositiveErrors
{
  if (result)
    return _NSFaultInObject();
  return result;
}

- (uint64_t)_brokenConstraintNegativeErrors
{
  if (result)
    return _NSFaultInObject();
  return result;
}

- (uint64_t)markerForBrokenConstraintWithPositiveErrorVar:(void *)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(a1, "_brokenConstraintPositiveErrorsIfAvailable");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(v3, "objectForKey:", v8) == a2)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_4;
      return 0;
    }
  }
}

- (uint64_t)markerForBrokenConstraintWithNegativeErrorVar:(void *)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(a1, "_brokenConstraintNegativeErrorsIfAvailable");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(v3, "objectForKey:", v8) == a2)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_4;
      return 0;
    }
  }
}

- (uint64_t)nsis_shouldIntegralizeVariable:
{
  return 0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 0;
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  void *v5;
  const __CFString *v6;

  v5 = (void *)-[NSISEngine markerForBrokenConstraintWithPositiveErrorVar:](self, (uint64_t)a3);
  if (v5)
  {
    v6 = CFSTR(".brokenPosError");
    return (id)objc_msgSend((id)objc_msgSend(v5, "description"), "stringByAppendingString:", v6);
  }
  v5 = (void *)-[NSISEngine markerForBrokenConstraintWithNegativeErrorVar:](self, (uint64_t)a3);
  if (v5)
  {
    v6 = CFSTR(".brokenNegError");
    return (id)objc_msgSend((id)objc_msgSend(v5, "description"), "stringByAppendingString:", v6);
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown var (bug!) with engine as delegate:%p>"), a3);
}

- (double)integralizationAdjustmentForMarker:(id)a3
{
  return 0.0;
}

- (BOOL)shouldIntegralize
{
  return 0;
}

void __35__NSISEngine_setShouldIntegralize___block_invoke()
{
  NSLog(CFSTR("NSISEngine integralization is no longer supported, setting shouldIntegralize to YES does nothing."));
}

- (BOOL)_dirtyListContainsObservation:(_BOOL8)result
{
  if (result)
    return *(_QWORD *)(a2 + 8) || *(_QWORD *)(a2 + 16) || *(_QWORD *)(result + 176) == a2;
  return result;
}

- (BOOL)_dirtyListContainsObservable:(_BOOL8)result
{
  if (result)
    return *(_QWORD *)(a2 + 40) || *(_QWORD *)(a2 + 48) || *(_QWORD *)(result + 48) == a2;
  return result;
}

- (uint64_t)_dirtyListPrependObservable:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    if (*(_QWORD *)(a2 + 48) || *(_QWORD *)(a2 + 40))
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__dirtyListPrependObservable_, result, CFSTR("NSISEngine.m"), 577, CFSTR("Dirty observable list is corrupt."));
    *(_QWORD *)(a2 + 40) = *(_QWORD *)(v3 + 48);
    *(_QWORD *)(a2 + 48) = 0;
    v4 = *(_QWORD *)(v3 + 48);
    if (v4)
      *(_QWORD *)(v4 + 48) = a2;
    *(_QWORD *)(v3 + 48) = a2;
  }
  return result;
}

- (uint64_t)_dirtyListRemoveObservable:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = *(_QWORD *)(a2 + 40);
    if (v2)
      *(_QWORD *)(v2 + 48) = *(_QWORD *)(a2 + 48);
    v3 = *(_QWORD *)(a2 + 48);
    if (v3)
    {
      *(_QWORD *)(v3 + 40) = *(_QWORD *)(a2 + 40);
    }
    else if (*(_QWORD *)(result + 48) == a2)
    {
      *(_QWORD *)(result + 48) = v2;
    }
    *(_QWORD *)(a2 + 40) = 0;
    *(_QWORD *)(a2 + 48) = 0;
  }
  return result;
}

uint64_t __47__NSISEngine_performPendingChangeNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "emitValueIfNeededWithEngine:", *(_QWORD *)(a1 + 32));
}

- (void)performPendingChangeNotificationsForItem:(id)a3
{
  BOOL allowUnoptimizedReads;
  NSMapTable *variableObservables;

  -[NSISEngine optimize](self, "optimize");
  allowUnoptimizedReads = self->_allowUnoptimizedReads;
  self->_allowUnoptimizedReads = 1;
  variableObservables = self->_variableObservables;
  if (variableObservables)
  {
    objc_msgSend(-[NSMapTable objectForKey:](variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_minXVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_minYVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_boundsWidthVariable")), "emitValueIfNeeded");
    objc_msgSend(-[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", objc_msgSend(a3, "nsli_boundsHeightVariable")), "emitValueIfNeeded");
  }
  if (NSISObjectTableCount((uint64_t)self->_variablesObservations) >= 1)
  {
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_minXVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_minYVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_boundsWidthVariable")), "emitValueIfNeededWithEngine:", self);
    objc_msgSend((id)NSISObjectTableFind((uint64_t)self->_variablesObservations, objc_msgSend(a3, "nsli_boundsHeightVariable")), "emitValueIfNeededWithEngine:", self);
  }
  -[NSObservable receiveObservedValue:](self->_variableChangeTransactionSignal, "receiveObservedValue:", *MEMORY[0x1E0C9AE50]);
  self->_allowUnoptimizedReads = allowUnoptimizedReads;
}

uint64_t *__63__NSISEngine_replaceMarker_withMarkerPlusCoefficient_timesCol___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

- (void)performModifications:(id)a3 withUnsatisfiableConstraintsHandler:(id)a4
{
  id unsatisfiabilityHandler;

  unsatisfiabilityHandler = self->_unsatisfiabilityHandler;
  self->_unsatisfiabilityHandler = (id)objc_msgSend(a4, "copy");
  (*((void (**)(id))a3 + 2))(a3);

  self->_unsatisfiabilityHandler = unsatisfiabilityHandler;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)engineVarIndexForVariable:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  void *v9;
  void *v10;

  v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3)
      goto LABEL_6;
  }
  v6 = *((_DWORD *)a3 + v5 + 12);
  if (v6 != -1)
    goto LABEL_9;
LABEL_6:
  if (*((_QWORD *)a3 + 2))
    v6 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v6 = -1;
LABEL_9:
  v7 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v6 >> 3) & 0x1FFFFFF8))
     + 32 * (v6 & 0x3F);
  if (*(_DWORD *)(v7 + 16) == -1)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*(id *)v7 != a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v7, a3);
  }
  return *($738B17BD11CC339B30296C0EA03CEC2B *)(v7 + 16);
}

- (id)variableForEngineVarIndex:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)(*((_QWORD *)self->_engineVarTable.blocks + (a3.var0 >> 6))
                                                 + 32 * (a3.var0 & 0x3F)));
}

- (void)beginRecording
{
  if (!self->_recordedOperations)
    self->_recordedOperations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (id)recordedCommandsData
{
  NSMutableDictionary *recordedOperations;

  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
    return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", recordedOperations, 100, 0, 0);
  else
    return 0;
}

- (unint64_t)replayCommandsData:(id)a3 verifyingIntegrity:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  if (!v6)
    return -1;
  v7 = v6;
  if (!_NSIsNSDictionary())
    return -1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSISEngine_replayCommandsData_verifyingIntegrity___block_invoke;
  v10[3] = &unk_1E4A489F0;
  v10[5] = v7;
  v10[6] = &v12;
  v10[4] = self;
  v11 = a4;
  -[NSISEngine withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:](self, "withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:", v10);
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __52__NSISEngine_replayCommandsData_verifyingIntegrity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _NSISPlaybackOperationsOnEngine(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)tryToOptimizeReturningMutuallyExclusiveConstraints
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    _AssertAutoLayoutOnAllowedThreadsOnly(result);
    result = -[NSISEngine fixUpValueRestrictionViolationsWithInfeasibilityHandlingBehavior:](v1, 1);
    if (!result)
    {
      _minimizeConstantInObjectiveRow(v1, *(_QWORD *)(v1 + 400), *(_QWORD *)(v1 + 408));
      return 0;
    }
  }
  return result;
}

double __36__NSISEngine_rebuildFromConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _col_removeFromAllRows(a2, a3);
}

double __36__NSISEngine_rebuildFromConstraints__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _row_remove(*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __36__NSISEngine_rebuildFromConstraints__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_addToEngine:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __35__NSISEngine__flushPendingRemovals__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (!a2)
    return 0;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  while (a2[v4 + 3] != v5)
  {
    if (++v4 == 3)
      goto LABEL_8;
  }
  if (*((_DWORD *)a2 + v4 + 12) != -1)
    goto LABEL_11;
LABEL_8:
  if (!a2[2] || objc_msgSend(a2, "overflowEngineVarIndexForEngine:", v5) == -1)
    return 0;
  v5 = *(_QWORD *)(a1 + 32);
LABEL_11:
  v7 = 0;
  while (a2[v7 + 3] != v5)
  {
    if (++v7 == 3)
      goto LABEL_16;
  }
  v8 = *((_DWORD *)a2 + v7 + 12);
  if (v8 != -1)
    goto LABEL_19;
LABEL_16:
  if (a2[2])
    v8 = objc_msgSend(a2, "overflowEngineVarIndexForEngine:", v5);
  else
    v8 = -1;
LABEL_19:
  v9 = *(_QWORD *)(*(_QWORD *)(v5 + 192) + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
  v10 = v8 & 0x3F;
  v11 = v9 + 32 * v10;
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a2, v5);
  }
  if (*(_QWORD **)v11 != a2)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v11, a2);
  }
  v12 = v9 + 32 * v10;
  if ((*(_BYTE *)(v12 + 24) & 1) == 0)
  {
    v13 = *(_QWORD *)(v12 + 8);
    v14 = NSBitSetCount(v13 + 8);
    return NSBitSetCount(v13 + 24) + v14;
  }
  return 0;
}

uint64_t __35__NSISEngine__flushPendingRemovals__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (v2 < v3) - (v2 > v3);
}

- (void)withoutOptimizingAtEndRunBlockWithAutomaticOptimizationDisabled:(id)a3
{
  -[NSISEngine withBehaviors:performModifications:](self, "withBehaviors:performModifications:", 9, a3);
}

- (void)withDelegateCallsDisabled:(id)a3
{
  -[NSISEngine withBehaviors:performModifications:](self, "withBehaviors:performModifications:", 2, a3);
}

- (BOOL)hasValueForPossiblyDeallocatedVariable:(id)a3
{
  uint64_t v5;
  BOOL v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke;
  v9[3] = &unk_1E4A48AD8;
  v9[4] = a3;
  v9[5] = &v10;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    v6 = 1;
  }
  else
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke_2;
    v8[3] = &unk_1E4A48B00;
    v8[4] = a3;
    v8[5] = &v10;
    -[NSISEngine enumerateCols:](self, (uint64_t)v8);
    v6 = *((_BYTE *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

id __53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke(uint64_t a1, uint64_t a2, id **a3, _BYTE *a4)
{
  id result;

  result = **a3;
  if (result == *(id *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

char *__53__NSISEngine_hasValueForPossiblyDeallocatedVariable___block_invoke_2(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v5;
  char *result;

  v5 = NSBitSetCount((uint64_t)(a3 + 1));
  result = (char *)NSBitSetCount((uint64_t)(a3 + 3));
  if (&result[v5])
  {
    result = (char *)**a3;
    if (result == *(char **)(a1 + 32))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (double)valueForExpression:(id)a3
{
  unsigned __int16 *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  double v11;

  v4 = (unsigned __int16 *)((char *)a3 + 16);
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0.0;
  v11 = NSISLinExpConstant((uint64_t)a3 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__NSISEngine_valueForExpression___block_invoke;
  v7[3] = &unk_1E4A48B28;
  v7[4] = self;
  v7[5] = &v8;
  NSISLinExpEnumerateVarsAndCoefficients(v4, (uint64_t)v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

double __33__NSISEngine_valueForExpression___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  double v5;
  uint64_t v6;
  double result;

  v5 = -[NSISEngine valueForEngineVar:](*(_BYTE **)(a1 + 32), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 8 * (a2 >> 6)) + 32 * (a2 & 0x3F));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v6 + 24) + a3 * v5;
  *(double *)(v6 + 24) = result;
  return result;
}

- (BOOL)hasValue:(double *)a3 forExpression:(id)a4
{
  unsigned __int16 *v6;
  BOOL v7;
  char v8;
  BOOL v9;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  double v15;

  v6 = (unsigned __int16 *)((char *)a4 + 16);
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0.0;
  v15 = NSISLinExpConstant((uint64_t)a4 + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__NSISEngine_hasValue_forExpression___block_invoke;
  v11[3] = &unk_1E4A48B50;
  v11[4] = self;
  v11[5] = &v12;
  v7 = NSISLinExpEnumerateVarsAndCoefficientsUntil(v6, (uint64_t)v11);
  if (a3)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
    *a3 = v13[3];
  v9 = !v7;
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __37__NSISEngine_hasValue_forExpression___block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  int v5;
  double v7;

  v7 = 0.0;
  v5 = -[NSISEngine hasValue:forEngineVar:](*(_QWORD *)(a1 + 32), &v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 8 * (a2 >> 6)) + 32 * (a2 & 0x3F));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3 * v7;
  return v5 ^ 1u;
}

- (BOOL)containsVariable:(id)a3
{
  uint64_t v5;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (!a3)
    return 0;
  v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3)
      goto LABEL_8;
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1)
    goto LABEL_10;
LABEL_8:
  if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
    return 0;
LABEL_10:
  v7 = 0;
  while (*((NSISEngine **)a3 + v7 + 3) != self)
  {
    if (++v7 == 3)
      goto LABEL_16;
  }
  v8 = *((_DWORD *)a3 + v7 + 12);
  if (v8 != -1)
    goto LABEL_19;
LABEL_16:
  if (*((_QWORD *)a3 + 2))
    v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v8 = -1;
LABEL_19:
  v9 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
  v10 = v8 & 0x3F;
  v11 = v9 + 32 * v10;
  if (*(_DWORD *)(v11 + 16) == -1)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*(id *)v11 != a3)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v11, a3);
  }
  v12 = v9 + 32 * v10;
  if ((*(_BYTE *)(v12 + 24) & 1) != 0)
    return 1;
  v13 = *(_QWORD *)(v12 + 8);
  v14 = NSBitSetCount(v13 + 8);
  return NSBitSetCount(v13 + 24) + v14 != 0;
}

- (void)endBookkeepingForVariableIfUnused:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  if (a3)
  {
    v5 = 0;
    while (*((NSISEngine **)a3 + v5 + 3) != self)
    {
      if (++v5 == 3)
        goto LABEL_7;
    }
    if (*((_DWORD *)a3 + v5 + 12) != -1)
      goto LABEL_9;
LABEL_7:
    if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
      return;
LABEL_9:
    v6 = 0;
    while (*((NSISEngine **)a3 + v6 + 3) != self)
    {
      if (++v6 == 3)
        goto LABEL_14;
    }
    v7 = *((_DWORD *)a3 + v6 + 12);
    if (v7 != -1)
      goto LABEL_17;
LABEL_14:
    if (*((_QWORD *)a3 + 2))
      v7 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
    else
      v7 = -1;
LABEL_17:
    v8 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v7 >> 3) & 0x1FFFFFF8));
    v9 = v7 & 0x3F;
    v10 = v8 + 32 * v9;
    if (*(_DWORD *)(v10 + 16) == -1)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
    }
    if (*(id *)v10 != a3)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v10, a3);
    }
    v11 = v8 + 32 * v9;
    if ((*(_BYTE *)(v11 + 24) & 1) == 0)
    {
      v12 = *(_QWORD *)(v11 + 8);
      v13 = NSBitSetCount(v12 + 8);
      if (!(NSBitSetCount(v12 + 24) + v13))
        _engineVar_rawRemove((uint64_t)self, (uint64_t *)(v8 + 32 * v9));
    }
  }
}

+ (BOOL)_dbg_anyEngineContainsVariable:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("_dbg_anyEngineContainsVariable is unsupported, rebuild with TRACK_ENGINES=1"), 0));
}

- (void)changeVariableToBeOptimized:(id)a3 fromPriority:(double)a4 toPriority:(double)a5
{
  NSMutableDictionary *recordedOperations;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSISEngine *engine;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *storage;
  NSISEngineDelegate *delegate;
  void *v28;
  void *v29;

  _AssertAutoLayoutOnAllowedThreadsOnly((uint64_t)self);
  recordedOperations = self->_recordedOperations;
  if (recordedOperations)
  {
    v11 = NSISWrapExactFloat(a4);
    NSISWrapExactFloat(a5);
    _NSISRecordOperation(recordedOperations, a2, v12, v13, v14, v15, v16, v17, (unsigned int *)a3, v11);
  }
  v18 = 0;
  ++self->_totalChangeCount;
  while (*((NSISEngine **)a3 + v18 + 3) != self)
  {
    if (++v18 == 3)
      goto LABEL_8;
  }
  v19 = *((_DWORD *)a3 + v18 + 12);
  if (v19 != -1)
    goto LABEL_11;
LABEL_8:
  if (*((_QWORD *)a3 + 2))
    v19 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v19 = -1;
LABEL_11:
  v20 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v19 >> 3) & 0x1FFFFFF8));
  v21 = v19 & 0x3F;
  v22 = v20 + 32 * v21;
  if (*(_DWORD *)(v22 + 16) == -1)
  {
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*(id *)v22 != a3)
  {
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v22, a3);
  }
  v23 = v20 + 32 * v21;
  v24 = *(_QWORD *)(v23 + 8);
  engine = self->_objectiveRow.engine;
  storage = self->_objectiveRow.storage;
  if ((*(_BYTE *)(v23 + 24) & 1) != 0)
  {
    _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)engine, (uint64_t)storage, a4, -1.0, (uint64_t)self, v24);
    _objectiveRow_addRowBodyWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a5, 1.0, (uint64_t)self, v24);
  }
  else
  {
    _objectiveRow_addColWithPriorityTimes((uint64_t)engine, (uint64_t)storage, a4, -1.0, (uint64_t)self, v24);
    _objectiveRow_addColWithPriorityTimes((uint64_t)self->_objectiveRow.engine, (uint64_t)self->_objectiveRow.storage, a5, 1.0, (uint64_t)self, v24);
  }
  if (_NSConstraintBasedLayoutDebugEngineConsistency())
    -[NSISEngine verifyInternalIntegrity](self, "verifyInternalIntegrity");
  -[NSISEngine _optimizeIfNotDisabled]((uint64_t)self);
  delegate = self->_delegate;
  if (delegate)
  {
    if (!self->_engineDelegateCallsDisabledCount)
      -[NSISEngineDelegate constraintsDidChangeInEngine:](delegate, "constraintsDidChangeInEngine:", self);
  }
}

- (id)observableForVariable:(id)a3
{
  NSMapTable *variableObservables;
  id v6;

  variableObservables = self->_variableObservables;
  if (!variableObservables)
  {
    variableObservables = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 10);
    self->_variableObservables = variableObservables;
  }
  v6 = -[NSMapTable objectForKey:](variableObservables, "objectForKey:", a3);
  if (!v6)
  {
    v6 = +[_NSISVariableObservable observableForVariable:inEngine:](_NSISVariableObservable, "observableForVariable:inEngine:", a3, self);
    -[NSMapTable setObject:forKey:](self->_variableObservables, "setObject:forKey:", v6, a3);
  }
  return v6;
}

- (void)removeObservableForVariable:(id)a3
{
  id v5;

  v5 = -[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:");
  if (v5)
  {
    -[NSISEngine _dirtyListRemoveObservable:]((uint64_t)self, (uint64_t)v5);
    -[NSMapTable removeObjectForKey:](self->_variableObservables, "removeObjectForKey:", a3);
  }
}

- (BOOL)hasObservableForVariable:(id)a3
{
  return -[NSMapTable objectForKey:](self->_variableObservables, "objectForKey:", a3) != 0;
}

- (id)variableChangeTransactionSignal
{
  id result;

  result = self->_variableChangeTransactionSignal;
  if (!result)
  {
    result = (id)objc_opt_new();
    self->_variableChangeTransactionSignal = (NSObservable *)result;
  }
  return result;
}

- (BOOL)isObservingChangesForVariable:(id)a3
{
  return NSISObjectTableFind((uint64_t)self->_variablesObservations, (unint64_t)a3) != 0;
}

+ (void)setEnableEngineTrace:(BOOL)a3
{
  _NSConstraintBasedLayoutSetOutputEngineTrace(a3);
}

+ (NSString)traceFileSuffix
{
  return 0;
}

- ($918B3F39C841E394E687484E57A87E10)traceState
{
  return 0;
}

+ (void)setLogOnInvalidUseFromBGThread:(BOOL)a3
{
  _NSConstraintBasedLayoutSetAllowBGThreads(a3);
}

- (void)enumerateOriginalConstraints:(_QWORD *)a1
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (a1)
  {
    v4 = MEMORY[0x1E0C809B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__NSISEngine_enumerateOriginalConstraints___block_invoke;
    v6[3] = &unk_1E4A48C40;
    v6[4] = a2;
    objc_msgSend(a1, "enumerateRows:", v6);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __43__NSISEngine_enumerateOriginalConstraints___block_invoke_2;
    v5[3] = &unk_1E4A48C68;
    v5[4] = a2;
    -[NSISEngine enumerateCols:](a1, (uint64_t)v5);
  }
}

uint64_t __43__NSISEngine_enumerateOriginalConstraints___block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  id v4;
  uint64_t result;

  if (*a3)
    v4 = **a3;
  else
    v4 = 0;
  result = objc_msgSend(v4, "markedConstraint");
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __43__NSISEngine_enumerateOriginalConstraints___block_invoke_2(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = NSBitSetCount((uint64_t)(a3 + 1));
  result = NSBitSetCount((uint64_t)(a3 + 3));
  if (result + v5)
  {
    result = objc_msgSend(**a3, "markedConstraint");
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (id)constraints
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__NSISEngine_constraints__block_invoke;
  v5[3] = &unk_1E4A48C90;
  v5[4] = v3;
  -[NSISEngine enumerateOriginalConstraints:](self, (uint64_t)v5);
  return v3;
}

uint64_t __25__NSISEngine_constraints__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (unint64_t)colCount
{
  uint64_t v2;
  unint64_t v3;
  $3E203C1A4D83D8254D06B66E229CD352 *colTables;
  char v5;
  char v6;
  $3E203C1A4D83D8254D06B66E229CD352 *v7;
  unint64_t blocksCount;
  uint64_t v9;

  v2 = 0;
  v3 = 0;
  colTables = self->_colTables;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = &colTables[v2];
    blocksCount = v7->blocksCount;
    v9 = NSBitSetCount((uint64_t)&v7->freeIndexes);
    v5 = 0;
    v3 = v3 - v9 + 25 * blocksCount;
    v2 = 1;
  }
  while ((v6 & 1) != 0);
  return v3;
}

- (BOOL)isOptimizationInProgress
{
  return self->_optimizationInProgress;
}

- (uint64_t)allRowHeads
{
  uint64_t v2;
  _QWORD v4[5];

  if (!a1)
    return 0;
  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__NSISEngine_allRowHeads__block_invoke;
  v4[3] = &unk_1E4A48A38;
  v4[4] = v2;
  objc_msgSend(a1, "enumerateRows:", v4);
  return v2;
}

uint64_t __25__NSISEngine_allRowHeads__block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", **a3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[128];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __25__NSISEngine_description__block_invoke;
  v25[3] = &unk_1E4A48A38;
  v25[4] = v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", -[NSISEngine enumerateEngineVars:](self, (uint64_t)v25));
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __25__NSISEngine_description__block_invoke_2;
  v24[3] = &unk_1E4A48A38;
  v24[4] = v5;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v24);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __25__NSISEngine_description__block_invoke_3;
  v23[3] = &unk_1E4A48B78;
  v23[4] = v6;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", -[NSISEngine enumerateCols:](self, (uint64_t)v23));
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __25__NSISEngine_description__block_invoke_4;
  v22[3] = &unk_1E4A48C90;
  v22[4] = v7;
  -[NSISEngine enumerateOriginalConstraints:](self, (uint64_t)v22);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  bzero(v26, 0x408uLL);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __25__NSISEngine_description__block_invoke_5;
  v17[3] = &unk_1E4A48CB8;
  v17[4] = &v18;
  v17[5] = v26;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v17);
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%lu rows. Variable counts:"), v19[3]));
  for (i = 0; i != 128; ++i)
  {
    v10 = v26[i];
    if (v10)
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%3lu -> %3lu"), i, v10));
  }
  if (v27)
    objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t>= %3lu -> %3lu"), 128, v27));
  _Block_object_dispose(&v18, 8);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  bzero(v26, 0x408uLL);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __25__NSISEngine_description__block_invoke_6;
  v16[3] = &unk_1E4A48CE0;
  v16[4] = &v18;
  v16[5] = v26;
  v11 = -[NSISEngine enumerateCols:](self, (uint64_t)v16);
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%lu cols. Variable counts:"), v11, v19[3]));
  for (j = 0; j != 128; ++j)
  {
    v13 = v26[j];
    if (v13)
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%3lu -> %3lu"), j, v13));
  }
  if (v27)
    objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t>= %3lu -> %3lu"), 128, v27));
  _Block_object_dispose(&v18, 8);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>{ delegate:%p\n"), objc_opt_class(), self, -[NSISEngine delegate](self, "delegate"));
  objc_msgSend(v14, "appendString:", CFSTR("EngineVars:\n"));
  objc_msgSend(v14, "appendString:", objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v14, "appendString:", CFSTR("\n\n  Rows:\n"));
  objc_msgSend(v14, "appendString:", objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v14, "appendString:", CFSTR("\n\n  Columns:\n"));
  objc_msgSend(v14, "appendString:", objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v14, "appendString:", CFSTR("\n\n  Constraints:\n"));
  objc_msgSend(v14, "appendString:", objc_msgSend((id)objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v14, "appendString:", CFSTR("\n\n  Statistics:\n"));
  objc_msgSend(v14, "appendString:", objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n")));
  objc_msgSend(v14, "appendString:", CFSTR("\n}"));
  return (NSString *)v14;
}

uint64_t __25__NSISEngine_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", _engineVar_description(a2, a3));
}

uint64_t __25__NSISEngine_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", _row_description(a2, a3));
}

uint64_t __25__NSISEngine_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", _col_description(a2, a3));
}

uint64_t __25__NSISEngine_description__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\t"));
  objc_msgSend(v6, "appendString:", objc_msgSend(a2, "description"));
  objc_msgSend(v6, "appendString:", CFSTR("\t\tMarker:"));
  objc_msgSend(v6, "appendString:", objc_msgSend(a3, "description"));
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

unint64_t __25__NSISEngine_description__block_invoke_5(unint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  if ((*(_BYTE *)(a3 + 80) & 1) == 0)
  {
    v3 = result;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    v4 = (uint64_t *)(a3 + 16);
    if ((*(_BYTE *)(a3 + 80) & 1) != 0)
      result = -[NSISObjectiveLinearExpression variableCount](*v4);
    else
      result = NSISLinExpVarCount((uint64_t)v4);
    v5 = 128;
    if (result < 0x80)
      v5 = result;
    ++*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8 * v5);
  }
  return result;
}

uint64_t __25__NSISEngine_description__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = NSBitSetCount(a3 + 8);
  result = NSBitSetCount(a3 + 24);
  v7 = result + v5;
  if ((unint64_t)(result + v5) >= 0x80)
    v7 = 128;
  ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v7);
  return result;
}

- (void)verifyInternalIntegrity
{
  uint64_t v4;
  void *v5;
  void *v6;
  $3E203C1A4D83D8254D06B66E229CD352 *rowTables;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Next;
  unint64_t i;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *storage;
  NSISEngine *engine;
  void *v29;
  void *v30;
  void *v31;
  BOOL allowUnoptimizedReads;
  SEL v33;
  void *context;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  void *v41;
  _QWORD v42[6];
  _QWORD v43[5];
  _QWORD v44[6];
  _QWORD v45[2];
  uint64_t (*v46)(uint64_t, uint64_t, id **);
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A8593388]();
  allowUnoptimizedReads = self->_allowUnoptimizedReads;
  self->_allowUnoptimizedReads = 1;
  v4 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke;
  v57[3] = &unk_1E4A48D08;
  v57[5] = a2;
  v57[4] = self;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_2;
  v56[3] = &unk_1E4A48D08;
  v56[5] = a2;
  v56[4] = self;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v56, -[NSISEngine enumerateEngineVars:](self, (uint64_t)v57));
  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_4;
  v55[3] = &unk_1E4A48D58;
  v33 = a2;
  v55[4] = self;
  v55[5] = a2;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0, -[NSISEngine enumerateCols:](self, (uint64_t)v55));
  v54[0] = v4;
  v54[1] = 3221225472;
  v54[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_7;
  v54[3] = &unk_1E4A48A38;
  v54[4] = v5;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v54);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_9;
  v53[3] = &unk_1E4A48B78;
  v53[4] = v6;
  v37 = v5;
  objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "keyEnumerator", -[NSISEngine enumerateCols:](self, (uint64_t)v53)), "allObjects"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v6;
  v38 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v38)
  {
    rowTables = self->_rowTables;
    v36 = *(_QWORD *)v50;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD **)(*((_QWORD *)&v49 + 1) + 8 * v8);
        v41 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = 0;
        while ((NSISEngine *)v9[v10 + 3] != self)
        {
          if (++v10 == 3)
            goto LABEL_11;
        }
        v11 = *((_DWORD *)v9 + v10 + 12);
        if (v11 != -1)
          goto LABEL_14;
LABEL_11:
        if (v9[2])
          v11 = objc_msgSend(v9, "overflowEngineVarIndexForEngine:", self);
        else
          v11 = -1;
LABEL_14:
        v39 = v8;
        v40 = v9;
        v12 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v11 >> 3) & 0x1FFFFFF8));
        v13 = v11 & 0x3F;
        v14 = (_QWORD *)(v12 + 32 * v13);
        if (*((_DWORD *)v14 + 4) == -1)
        {
          v30 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v40, self);
        }
        if ((_QWORD *)*v14 != v40)
        {
          v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *v14, v40);
        }
        v15 = v12 + 32 * v13;
        if ((*(_BYTE *)(v15 + 24) & 1) != 0)
        {
          v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v14);
        }
        v16 = *(_QWORD *)(v15 + 8);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v46 = __37__NSISEngine_verifyInternalIntegrity__block_invoke_10;
        v47 = &unk_1E4A48B78;
        v48 = v41;
        Next = NSBitSetFindNext((uint64_t **)(v16 + 8), 0);
        if (Next != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)(v16 + 8), i + 1))
            v46((uint64_t)v45, (uint64_t)self, (id **)(*((_QWORD *)rowTables[(i >> 30) & 1].blocks + (i & 0xBFFFFFFF) / 0x17)+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
        }
        v19 = NSBitSetFindNext((uint64_t **)(v16 + 24), 0);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (j = v19; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext((uint64_t **)(v16 + 24), j + 1))
            v46((uint64_t)v45, (uint64_t)self, (id **)(*((_QWORD *)rowTables[((j + 0x40000000) >> 30) & 1].blocks+ (((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL)+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17)));
        }
        v21 = (void *)objc_msgSend(v37, "objectForKey:", v40);
        if ((objc_msgSend(v41, "isEqual:", v21) & 1) == 0)
        {
          v22 = (id)objc_msgSend(v41, "mutableCopy");
          objc_msgSend(v22, "minusSet:", v21);
          if (objc_msgSend(v22, "count"))
            NSLog(CFSTR("the variable %@ is incorrectly reported to be in rows with heads %@"), v40, v41);
          v23 = (id)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v23, "minusSet:", v41);
          if (objc_msgSend(v23, "count"))
            NSLog(CFSTR("the variable %@ is not reported as being in rows with heads %@"), v40, v41);
        }
        v8 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v38);
  }
  v25 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_11;
  v44[3] = &unk_1E4A48D08;
  v44[4] = self;
  v44[5] = v33;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v44);
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43[0] = v25;
  v43[1] = 3221225472;
  v43[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_13;
  v43[3] = &unk_1E4A48A38;
  v43[4] = v26;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v43);
  objc_msgSend(v26, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_variablesWithValueRestrictionViolations));
  if (objc_msgSend(v26, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v33, self, CFSTR("NSISEngine.m"), 3257, CFSTR("The tracked set of variables with value restriction violations is missing these variables: %@"), v26);
  storage = self->_objectiveRow.storage;
  if ((*((_BYTE *)storage + 80) & 1) == 0)
  {
    engine = self->_objectiveRow.engine;
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description((uint64_t)engine, (uint64_t)storage));
  }
  -[NSISObjectiveLinearExpression verifyInternalIntegrity](*((_QWORD *)storage + 2));
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_14;
  v42[3] = &unk_1E4A48D08;
  v42[4] = self;
  v42[5] = v33;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v42);
  self->_allowUnoptimizedReads = allowUnoptimizedReads;
  objc_autoreleasePoolPop(context);
}

_QWORD *__37__NSISEngine_verifyInternalIntegrity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  int v10;
  int v11;

  result = *(_QWORD **)a3;
  if (!*(_QWORD *)a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a3 + 16), *(_QWORD *)(a1 + 32));
    result = *(_QWORD **)a3;
  }
  v6 = 0;
  while (result[v6 + 3] != *(_QWORD *)(a1 + 32))
  {
    if (++v6 == 3)
      goto LABEL_8;
  }
  v7 = *((unsigned int *)result + v6 + 12);
  if ((_DWORD)v7 != -1)
    goto LABEL_11;
LABEL_8:
  if (result[2])
  {
    result = (_QWORD *)objc_msgSend(result, "overflowEngineVarIndexForEngine:");
    v7 = (uint64_t)result;
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }
LABEL_11:
  if ((_DWORD)v7 != *(_DWORD *)(a3 + 16))
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)a3, *(_QWORD *)(a1 + 32), v7, *(unsigned int *)(a3 + 16));
  v8 = *(unsigned int **)(a3 + 8);
  v9 = *(_QWORD *)v8;
  v10 = *(_DWORD *)(*(_QWORD *)v8 + 16);
  v11 = *(_DWORD *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 24) & 1) != 0)
  {
    if (v10 != v11)
      return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3153, CFSTR("Engine var backpointer in row %u doesn't match engineVarIndex %u != %u"), v8[2], *(unsigned int *)(v9 + 16), *(unsigned int *)(a3 + 16));
  }
  else if (v10 != v11)
  {
    return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3157, CFSTR("Engine var backpointer in col %u doesn't match engineVarIndex %u != %u"), *(unsigned int *)(*(_QWORD *)v8 + 20), *(unsigned int *)(v9 + 16), *(unsigned int *)(a3 + 16));
  }
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned __int16 *result;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, unsigned int);
  void *v20;
  uint64_t v21;
  _QWORD *v22;

  v6 = *a3;
  if ((*(_BYTE *)(*a3 + 24) & 1) == 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISRow _engineVar_row(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 115, CFSTR("Tried accessing the row index for a variable that isn't a row head:%@"), *(_QWORD *)v6);
  }
  v7 = *(_QWORD *)(v6 + 8);
  if (*(_DWORD *)(v7 + 8) != *((_DWORD *)a3 + 2))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3165, CFSTR("Engine var backpointer in row %u doesn't match engineVarIndex %u != %u"), *((unsigned int *)a3 + 2), *(unsigned int *)(v7 + 8), *(unsigned int *)(v6 + 16));
  if (a3 != *(uint64_t **)(*(_QWORD *)(a1 + 32) + 408))
  {
    v8 = a3 + 2;
    if (!((a3[10] & 1) != 0 ? -[NSISObjectiveLinearExpression variableCount](*v8) : NSISLinExpVarCount((uint64_t)v8)))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3166, CFSTR("An empty row is not allowed, it should always contain body variables."));
  }
  result = (unsigned __int16 *)*(id *)*a3;
  if (result != *(unsigned __int16 **)(a2 + 416))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_3;
    v16[3] = &unk_1E4A48C18;
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v16[6] = a3;
    v16[7] = v11;
    v16[4] = v12;
    v16[5] = a2;
    v13 = (unsigned __int16 *)(a3 + 2);
    if ((a3[10] & 1) != 0)
    {
      v14 = *(_QWORD *)v13;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = ___row_enumerateCols_block_invoke;
      v20 = &unk_1E4A48E98;
      v21 = a2;
      v22 = v16;
      return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v14, (uint64_t)&v17);
    }
    else
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = ___row_enumerateCols_block_invoke_2;
      v20 = &unk_1E4A48E98;
      v21 = a2;
      v22 = v16;
      return NSISLinExpEnumerateVars(v13, (uint64_t)&v17);
    }
  }
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t **a3)
{
  uint64_t *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t result;

  v6 = *a3;
  v7 = *(_DWORD *)(a1[6] + 8);
  if (HIWORD(v7))
    v8 = v7 - 0x40000000;
  else
    v8 = v7;
  if (HIWORD(v7))
    v9 = (uint64_t *)(a3 + 3);
  else
    v9 = (uint64_t *)(a3 + 1);
  result = NSBitSetContainsIndex(v9, v8);
  if ((result & 1) == 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("NSISEngine.m"), 3172, CFSTR("Body variable %@ with engineVarIndex %u appear in row %u, but that row doesn't appear in its cross index %@"), (id)*v6, *((unsigned int *)v6 + 4), *(unsigned int *)(a1[6] + 8), _col_description(a2, a3));
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Next;
  unint64_t i;
  uint64_t **v13;
  uint64_t result;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t **v22;
  uint64_t v23;

  v6 = *a3;
  v7 = *a3;
  if (((*a3)[3] & 1) != 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *v6);
    v7 = *a3;
  }
  v8 = v6[1];
  if (*(_DWORD *)(*(_QWORD *)v8 + 20) != *((_DWORD *)v7 + 5))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3181, CFSTR("Engine var backpointer in col %u doesn't match engineVarIndex %u != %u"), *((unsigned int *)*a3 + 5), *(unsigned int *)(*(_QWORD *)v8 + 20), *((unsigned int *)v6 + 4));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = __37__NSISEngine_verifyInternalIntegrity__block_invoke_5;
  v19 = &unk_1E4A48C18;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v22 = a3;
  v23 = v9;
  v20 = v10;
  v21 = a2;
  Next = NSBitSetFindNext(a3 + 1, 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(a3 + 1, i + 1))
      v18((uint64_t)v17, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  v13 = a3 + 3;
  result = NSBitSetFindNext(v13, 0);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = result;
    do
    {
      v18((uint64_t)v17, a2, *(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((v15 + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)v15 + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)v15 + 0x40000000) & 0xBFFFFFFF) % 0x17));
      result = NSBitSetFindNext(v13, v15 + 1);
      v15 = result;
    }
    while (result != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

void __37__NSISEngine_verifyInternalIntegrity__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *v6;
  uint64_t v7;
  _QWORD v8[5];
  __int128 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, unsigned int);
  void *v17;
  uint64_t v18;
  _QWORD *v19;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_6;
  v8[3] = &unk_1E4A48D30;
  v8[4] = &v10;
  v9 = *(_OWORD *)(a1 + 40);
  v6 = (unsigned __int16 *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
  {
    v7 = *(_QWORD *)v6;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___row_enumerateCols_block_invoke;
    v17 = &unk_1E4A48E98;
    v18 = a2;
    v19 = v8;
    -[NSISObjectiveLinearExpression enumerateVars:](v7, (uint64_t)&v14);
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___row_enumerateCols_block_invoke_2;
    v17 = &unk_1E4A48E98;
    v18 = a2;
    v19 = v8;
    NSISLinExpEnumerateVars(v6, (uint64_t)&v14);
  }
  if (!*((_BYTE *)v11 + 24))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("NSISEngine.m"), 3188, CFSTR("Cross index says variable %@ at colIndex %u appears in row %u, but that row only contains:%@"), ***(id ***)(a1 + 48), *(unsigned int *)(**(_QWORD **)(a1 + 48) + 20), *(unsigned int *)(a3 + 8), _row_description(a2, a3));
  _Block_object_dispose(&v10, 8);
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = 1;
  else
    v4 = a3 == *(_QWORD *)(result + 48);
  *(_BYTE *)(v3 + 24) = v4;
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *result;
  unsigned __int16 *v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, unsigned int);
  void *v13;
  uint64_t v14;
  _QWORD *v15;

  result = (unsigned __int16 *)**(id **)a3;
  if (result != *(unsigned __int16 **)(a2 + 416))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_8;
    v9[3] = &unk_1E4A48D80;
    v9[4] = *(_QWORD *)(a1 + 32);
    v9[5] = a2;
    v9[6] = a3;
    v7 = (unsigned __int16 *)(a3 + 16);
    if ((*(_BYTE *)(a3 + 80) & 1) != 0)
    {
      v8 = *(_QWORD *)v7;
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = ___row_enumerateCols_block_invoke;
      v13 = &unk_1E4A48E98;
      v14 = a2;
      v15 = v9;
      return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v8, (uint64_t)&v10);
    }
    else
    {
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = ___row_enumerateCols_block_invoke_2;
      v13 = &unk_1E4A48E98;
      v14 = a2;
      v15 = v9;
      return NSISLinExpEnumerateVars(v7, (uint64_t)&v10);
    }
  }
  return result;
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_8(uint64_t a1, uint64_t a2, id **a3)
{
  id v4;
  void *v5;

  v4 = **a3;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  if (!v5)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);
  }
  return objc_msgSend(v5, "addObject:", ***(id ***)(a1 + 48));
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_9(uint64_t a1, uint64_t a2, id **a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", **a3);
}

uint64_t __37__NSISEngine_verifyInternalIntegrity__block_invoke_10(uint64_t a1, uint64_t a2, id **a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", **a3);
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_11(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, unsigned int);
  void *v15;
  uint64_t v16;
  _QWORD *v17;

  if ((*(_DWORD *)(*(_QWORD *)a3 + 24) & 6) == 4)
  {
    v5 = result;
    result = (unsigned __int16 *)**(id **)a3;
    if (result != *(unsigned __int16 **)(a2 + 416))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_12;
      v8[3] = &unk_1E4A48DA8;
      v9 = *((_OWORD *)v5 + 2);
      v10 = a2;
      v11 = a3;
      v6 = (unsigned __int16 *)(a3 + 16);
      if ((*(_BYTE *)(a3 + 80) & 1) != 0)
      {
        v7 = *(_QWORD *)v6;
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = ___row_enumerateCols_block_invoke;
        v15 = &unk_1E4A48E98;
        v16 = a2;
        v17 = v8;
        return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v7, (uint64_t)&v12);
      }
      else
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = ___row_enumerateCols_block_invoke_2;
        v15 = &unk_1E4A48E98;
        v16 = a2;
        v17 = v8;
        return NSISLinExpEnumerateVars(v6, (uint64_t)&v12);
      }
    }
  }
  return result;
}

_QWORD *__37__NSISEngine_verifyInternalIntegrity__block_invoke_12(_QWORD *result, uint64_t a2, id **a3)
{
  if (((_DWORD)(*a3)[3] & 6) != 4)
    return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", result[5], result[4], CFSTR("NSISEngine.m"), 3241, CFSTR("every variable in a row headed by an NSISRestrictedToZero variable must be NSISRestrictedToZero as well.  The row %@ contains %@ which is not restricted to zero."), _row_description(result[6], result[7]), **a3);
  return result;
}

double __37__NSISEngine_verifyInternalIntegrity__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, double result)
{
  int v6;

  if ((*(_BYTE *)(a3 + 80) & 1) == 0 && **(id **)a3 != *(id *)(a2 + 416))
  {
    result = NSISLinExpConstant(a3 + 16);
    v6 = (*(_DWORD *)(*(_QWORD *)a3 + 24) >> 1) & 3;
    if (v6 == 2)
    {
      if (result == 0.0)
      {
        result = *(double *)&NSISEpsilon;
        if (*(double *)&NSISEpsilon > 0.0)
          return result;
      }
      else
      {
        result = fabs(result);
        if (result < *(double *)&NSISEpsilon)
          return result;
      }
LABEL_6:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", **(id **)a3);
      return result;
    }
    if (v6 == 1 && result < 0.0)
      goto LABEL_6;
  }
  return result;
}

unsigned __int16 *__37__NSISEngine_verifyInternalIntegrity__block_invoke_14(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  if ((*(_BYTE *)(a3 + 80) & 1) == 0)
  {
    v5 = result;
    result = (unsigned __int16 *)**(id **)a3;
    if (result != *(unsigned __int16 **)(a2 + 416))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __37__NSISEngine_verifyInternalIntegrity__block_invoke_15;
      v6[3] = &unk_1E4A48DD0;
      v7 = *((_OWORD *)v5 + 2);
      v8 = a2;
      v9 = a3;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = ___row_enumerateColsWithCoefficients_block_invoke;
      v10[3] = &unk_1E4A48F08;
      v10[4] = a2;
      v10[5] = v6;
      return NSISLinExpEnumerateVarsAndCoefficients((unsigned __int16 *)(a3 + 16), (uint64_t)v10);
    }
  }
  return result;
}

_QWORD *__37__NSISEngine_verifyInternalIntegrity__block_invoke_15(_QWORD *result, double a2)
{
  _QWORD *v3;
  double v4;

  v3 = result;
  v4 = fabs(a2);
  if (v4 >= INFINITY && v4 <= INFINITY)
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", result[5], result[4], CFSTR("NSISEngine.m"), 3268, CFSTR("A row in the engine has an infinite coefficient.  %@"), _row_description(result[6], result[7]));
  if (a2 == 0.0)
  {
    if (*(double *)&NSISEpsilon <= 0.0)
      return result;
    return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&NSISEpsilon), "handleFailureInMethod:object:file:lineNumber:description:", v3[5], v3[4], CFSTR("NSISEngine.m"), 3269, CFSTR("A row in the engine has a near-zero coefficient.  %@"), _row_description(v3[6], v3[7]));
  }
  if (v4 < *(double *)&NSISEpsilon)
    return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&NSISEpsilon), "handleFailureInMethod:object:file:lineNumber:description:", v3[5], v3[4], CFSTR("NSISEngine.m"), 3269, CFSTR("A row in the engine has a near-zero coefficient.  %@"), _row_description(v3[6], v3[7]));
  return result;
}

- (id)constraintsAffectingValueOfVariable:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, unsigned int);
  void *v23;
  NSISEngine *v24;
  _QWORD *v25;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
  {
    v6 = 0;
    while (*((NSISEngine **)a3 + v6 + 3) != self)
    {
      if (++v6 == 3)
        goto LABEL_7;
    }
    if (*((_DWORD *)a3 + v6 + 12) != -1)
      goto LABEL_9;
LABEL_7:
    if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
      return v5;
LABEL_9:
    v7 = 0;
    while (*((NSISEngine **)a3 + v7 + 3) != self)
    {
      if (++v7 == 3)
        goto LABEL_14;
    }
    v8 = *((_DWORD *)a3 + v7 + 12);
    if (v8 != -1)
      goto LABEL_17;
LABEL_14:
    if (*((_QWORD *)a3 + 2))
      v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
    else
      v8 = -1;
LABEL_17:
    v9 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8));
    v10 = v8 & 0x3F;
    v11 = v9 + 32 * v10;
    if (*(_DWORD *)(v11 + 16) == -1)
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
    }
    if (*(id *)v11 != a3)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v11, a3);
    }
    v12 = v9 + 32 * v10;
    if ((*(_BYTE *)(v12 + 24) & 1) != 0)
    {
      v13 = *(_QWORD *)(v12 + 8);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__NSISEngine_constraintsAffectingValueOfVariable___block_invoke;
      v19[3] = &unk_1E4A48B78;
      v19[4] = v5;
      v14 = (unsigned __int16 *)(v13 + 16);
      if ((*(_BYTE *)(v13 + 80) & 1) != 0)
      {
        v15 = *(_QWORD *)v14;
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = ___row_enumerateCols_block_invoke;
        v23 = &unk_1E4A48E98;
        v24 = self;
        v25 = v19;
        -[NSISObjectiveLinearExpression enumerateVars:](v15, (uint64_t)&v20);
      }
      else
      {
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = ___row_enumerateCols_block_invoke_2;
        v23 = &unk_1E4A48E98;
        v24 = self;
        v25 = v19;
        NSISLinExpEnumerateVars(v14, (uint64_t)&v20);
      }
    }
  }
  return v5;
}

uint64_t __50__NSISEngine_constraintsAffectingValueOfVariable___block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t result;

  result = objc_msgSend(**a3, "markedConstraint");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

- (id)candidateRedundantConstraints
{
  void *v3;
  _QWORD v5[6];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NSISEngine_candidateRedundantConstraints__block_invoke;
  v5[3] = &unk_1E4A48E20;
  v5[4] = self;
  v5[5] = v3;
  -[NSISEngine enumerateRows:](self, "enumerateRows:", v5);
  return (id)objc_msgSend(v3, "allObjects");
}

void __43__NSISEngine_candidateRedundantConstraints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, unsigned int);
  void *v20;
  uint64_t v21;
  _QWORD *v22;

  v6 = **(id **)a3;
  if ((objc_msgSend(v6, "valueIsUserVisible") & 1) == 0 && v6 != *(id *)(*(_QWORD *)(a1 + 32) + 392))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    v7 = objc_msgSend(v6, "markedConstraint");
    v12[5] = v7;
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__NSISEngine_candidateRedundantConstraints__block_invoke_206;
    v10[3] = &unk_1E4A48DF8;
    v10[4] = *(_QWORD *)(a1 + 40);
    v10[5] = &v11;
    v8 = (unsigned __int16 *)(a3 + 16);
    if ((*(_BYTE *)(a3 + 80) & 1) != 0)
    {
      v9 = *(_QWORD *)v8;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = ___row_enumerateCols_block_invoke;
      v20 = &unk_1E4A48E98;
      v21 = a2;
      v22 = v10;
      -[NSISObjectiveLinearExpression enumerateVars:](v9, (uint64_t)&v17);
    }
    else
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = ___row_enumerateCols_block_invoke_2;
      v20 = &unk_1E4A48E98;
      v21 = a2;
      v22 = v10;
      NSISLinExpEnumerateVars(v8, (uint64_t)&v17);
    }
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __43__NSISEngine_candidateRedundantConstraints__block_invoke_206(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t result;

  result = objc_msgSend(**a3, "markedConstraint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (uint64_t)bodyVarIsAmbiguous:(uint64_t)a3 withPivotOfOutgoingRowHead:(uint64_t)a4 foundOutgoingRowHead:(_BYTE *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  double v13;
  int v14;
  char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  double v28;

  if (result)
  {
    v28 = 0.0;
    if ((*(_DWORD *)(*(_QWORD *)a3 + 24) & 6) == 4)
    {
LABEL_3:
      result = 0;
      *a5 = 0;
      return result;
    }
    v9 = result;
    v10 = NSBitSetCount(a3 + 8);
    if (!(NSBitSetCount(a3 + 24) + v10))
    {
      *a5 = 0;
      return 1;
    }
    v27 = 0;
    v11 = *(_QWORD *)(v9 + 408);
    if ((*(_BYTE *)(v11 + 80) & 1) == 0)
    {
      v16 = *(_QWORD *)(v9 + 400);
      v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(v16, v11));
    }
    -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(_QWORD **)(v11 + 16), &v27, &v28, *(_DWORD *)(*(_QWORD *)a3 + 16));
    if (v28 != 0.0)
      goto LABEL_3;
    v12 = _chooseOutgoingRowHeadForIncomingRowHead(a2, a3, a4, 0);
    *a5 = v12;
    if (v12)
    {
      v13 = NSISLinExpConstant(*(_QWORD *)(a4 + 8) + 16);
      if (v13 == 0.0)
      {
        if (*(double *)&NSISEpsilon <= 0.0)
          return 1;
      }
      else if (fabs(v13) >= *(double *)&NSISEpsilon)
      {
        return 1;
      }
    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v14 = (*(_DWORD *)(*(_QWORD *)a3 + 24) >> 1) & 3;
    if (v14 == 1)
    {
      v15 = &v26;
    }
    else
    {
      if (v14 != 2)
        goto LABEL_19;
      v15 = &v22;
      v26 = 0;
    }
    *v15 = 0;
LABEL_19:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__NSISEngine_bodyVarIsAmbiguous_withPivotOfOutgoingRowHead_foundOutgoingRowHead___block_invoke;
    v18[3] = &unk_1E4A48E48;
    v18[4] = v9;
    v18[5] = &v23;
    v18[6] = &v19;
    v18[7] = a2;
    v18[8] = a3;
    _col_enumerateRowsUntil(a2, a3, (uint64_t)v18);
    if (!*((_BYTE *)v20 + 24) && !*((_BYTE *)v24 + 24))
    {
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);
      goto LABEL_3;
    }
    *a5 = 0;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
    return 1;
  }
  return result;
}

uint64_t __81__NSISEngine_bodyVarIsAmbiguous_withPivotOfOutgoingRowHead_foundOutgoingRowHead___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  int v6;
  uint64_t v7;
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    return 1;
  }
  if (a3 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408))
    return 0;
  v5 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(_QWORD **)(a1 + 64) + 16));
  if (NSISLinExpConstant(a3 + 16) != 0.0)
    return 0;
  v6 = (*(_DWORD *)(*(_QWORD *)a3 + 24) >> 1) & 3;
  if (v6 != 2)
  {
    if (v6 == 1)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      result = 0;
      if (v5 > 0.0)
      {
        *(_BYTE *)(v7 + 24) = 1;
        return result;
      }
      goto LABEL_12;
    }
    return 0;
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_12:
  *(_BYTE *)(v7 + 24) = 0;
  return result;
}

- (BOOL)incoming:(_OWORD *)a3 andOutgoing:(_BYTE *)a4 foundOutgoing:(uint64_t)a5 rowHeadsThatMakeValueAmbiguousForVariable:(uint64_t)a6
{
  uint64_t v10;
  uint64_t *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  _BOOL8 v14;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  const char *v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, unsigned int);
  void *v39;
  uint64_t v40;
  _QWORD *v41;

  if (!a1)
    return 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3010000000;
  v30 = a1;
  v31 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v25[0] = a1;
  v25[1] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20[0] = 0;
  v10 = *(_QWORD *)(a6 + 8);
  if ((*(_BYTE *)(a6 + 24) & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__NSISEngine_incoming_andOutgoing_foundOutgoing_rowHeadsThatMakeValueAmbiguousForVariable___block_invoke;
    v16[3] = &unk_1E4A48E70;
    v16[4] = a1;
    v16[5] = &v17;
    v16[6] = &v21;
    v16[7] = &v32;
    v16[8] = &v26;
    v12 = (unsigned __int16 *)(v10 + 16);
    if ((*(_BYTE *)(v10 + 80) & 1) != 0)
    {
      v13 = *(_QWORD *)v12;
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = ___row_enumerateCols_block_invoke;
      v39 = &unk_1E4A48E98;
      v40 = a5;
      v41 = v16;
      -[NSISObjectiveLinearExpression enumerateVars:](v13, (uint64_t)&v36);
    }
    else
    {
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = ___row_enumerateCols_block_invoke_2;
      v39 = &unk_1E4A48E98;
      v40 = a5;
      v41 = v16;
      NSISLinExpEnumerateVars(v12, (uint64_t)&v36);
    }
  }
  else if (-[NSISEngine bodyVarIsAmbiguous:withPivotOfOutgoingRowHead:foundOutgoingRowHead:](a1, a5, *(_QWORD *)(a6 + 8), (uint64_t)v25, v20))
  {
    *((_BYTE *)v33 + 24) = 1;
    v11 = v27;
    v27[4] = a5;
    v11[5] = v10;
  }
  if (a2)
    *a2 = *((_OWORD *)v27 + 2);
  if (a3)
    *a3 = *((_OWORD *)v22 + 2);
  if (a4)
    *a4 = *((_BYTE *)v18 + 24);
  v14 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v14;
}

uint64_t *__91__NSISEngine_incoming_andOutgoing_foundOutgoing_rowHeadsThatMakeValueAmbiguousForVariable___block_invoke(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE *v4;
  int v5;
  uint64_t *v8;
  uint64_t v9;

  v3 = *(_QWORD *)(result[5] + 8);
  v5 = *(unsigned __int8 *)(v3 + 24);
  v4 = (_BYTE *)(v3 + 24);
  if (!v5)
  {
    v8 = result;
    result = (uint64_t *)-[NSISEngine bodyVarIsAmbiguous:withPivotOfOutgoingRowHead:foundOutgoingRowHead:](result[4], a2, a3, *(_QWORD *)(result[6] + 8) + 32, v4);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(v8[7] + 8) + 24) = 1;
      v9 = *(_QWORD *)(v8[8] + 8);
      *(_QWORD *)(v9 + 32) = a2;
      *(_QWORD *)(v9 + 40) = a3;
    }
  }
  return result;
}

- (BOOL)valueOfVariableIsAmbiguous:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (!self->_engineNeedsOptimization || self->_allowUnoptimizedReads)
  {
    if (a3)
      goto LABEL_4;
    return 1;
  }
  -[NSISEngine optimize](self, "optimize");
  if (!a3)
    return 1;
LABEL_4:
  v5 = 0;
  while (*((NSISEngine **)a3 + v5 + 3) != self)
  {
    if (++v5 == 3)
      goto LABEL_9;
  }
  if (*((_DWORD *)a3 + v5 + 12) != -1)
    goto LABEL_11;
LABEL_9:
  if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
    return 1;
LABEL_11:
  v6 = 0;
  while (*((NSISEngine **)a3 + v6 + 3) != self)
  {
    if (++v6 == 3)
      goto LABEL_18;
  }
  v8 = *((_DWORD *)a3 + v6 + 12);
  if (v8 != -1)
    goto LABEL_21;
LABEL_18:
  if (*((_QWORD *)a3 + 2))
    v8 = objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self);
  else
    v8 = -1;
LABEL_21:
  v9 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v8 >> 3) & 0x1FFFFFF8))
     + 32 * (v8 & 0x3F);
  if (*(_DWORD *)(v9 + 16) == -1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a3, self);
  }
  if (*(id *)v9 != a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v9, a3);
  }
  return -[NSISEngine incoming:andOutgoing:foundOutgoing:rowHeadsThatMakeValueAmbiguousForVariable:]((uint64_t)self, 0, 0, 0, (uint64_t)self, v9);
}

- (BOOL)exerciseAmbiguityInVariable:(id)a3
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;

  v3 = a3;
  if (a3)
  {
    v5 = 0;
    while (*((NSISEngine **)a3 + v5 + 3) != self)
    {
      if (++v5 == 3)
        goto LABEL_7;
    }
    if (*((_DWORD *)a3 + v5 + 12) != -1)
      goto LABEL_9;
LABEL_7:
    if (!*((_QWORD *)a3 + 2) || objc_msgSend(a3, "overflowEngineVarIndexForEngine:", self) == -1)
    {
      LOBYTE(v3) = 0;
      return (char)v3;
    }
LABEL_9:
    v6 = 0;
    while ((NSISEngine *)v3[v6 + 3] != self)
    {
      if (++v6 == 3)
        goto LABEL_15;
    }
    v7 = *((_DWORD *)v3 + v6 + 12);
    if (v7 != -1)
      goto LABEL_18;
LABEL_15:
    if (v3[2])
      v7 = objc_msgSend(v3, "overflowEngineVarIndexForEngine:", self);
    else
      v7 = -1;
LABEL_18:
    v8 = *(_QWORD *)((char *)self->_engineVarTable.blocks + (((unint64_t)v7 >> 3) & 0x1FFFFFF8))
       + 32 * (v7 & 0x3F);
    if (*(_DWORD *)(v8 + 16) == -1)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), v3, self);
    }
    if (*(_QWORD **)v8 != v3)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v8, v3);
    }
    v15 = 0uLL;
    v14 = 0uLL;
    v13 = 0;
    v9 = -[NSISEngine incoming:andOutgoing:foundOutgoing:rowHeadsThatMakeValueAmbiguousForVariable:]((uint64_t)self, &v15, &v14, &v13, (uint64_t)self, v8);
    if (v13)
      LODWORD(v3) = v9;
    else
      LODWORD(v3) = 0;
    if ((_DWORD)v3 == 1)
      _pivotToMakeColNewHeadOfRow((uint64_t)self, v15, *((uint64_t ***)&v15 + 1), v14, *((uint64_t *)&v14 + 1), 0);
  }
  return (char)v3;
}

- (id)allVariableValues
{
  id v3;
  _QWORD v5[6];

  v3 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__NSISEngine_allVariableValues__block_invoke;
  v5[3] = &unk_1E4A48E20;
  v5[4] = self;
  v5[5] = v3;
  -[NSISEngine enumerateEngineVars:](self, (uint64_t)v5);
  return v3;
}

uint64_t __31__NSISEngine_allVariableValues__block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  id v4;

  v4 = *a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForVariable:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), v4);
}

- (NSMutableArray)variablesWithValueRestrictionViolations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)revertsAfterUnsatisfiabilityHandler
{
  return self->_revertsAfterUnsatisfiabilityHandler;
}

- (void)setRevertsAfterUnsatisfiabilityHandler:(BOOL)a3
{
  self->_revertsAfterUnsatisfiabilityHandler = a3;
}

- (NSISVariable)artificialRowHead
{
  return (NSISVariable *)objc_getProperty(self, a2, 424, 1);
}

- (void)setArtificialRowHead:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSISVariable)artificialObjectiveRowHead
{
  return (NSISVariable *)objc_getProperty(self, a2, 432, 1);
}

- (void)setArtificialObjectiveRowHead:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSISObjectiveLinearExpression)artificialObjectiveRowBody
{
  return (NSISObjectiveLinearExpression *)objc_getProperty(self, a2, 440, 1);
}

- (void)setArtificialObjectiveRowBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (void)_disambiguateFrame:(void *)a3 forAmbiguousItem:(double)a4 withOldFrame:(double)a5
{
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  double v17;
  double v18;

  if (result)
  {
    v13 = result;
    if (objc_msgSend(result, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_minXVariable")))
    {
      *a2 = a4;
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    if (objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_minYVariable")))
    {
      a2[1] = a5;
      ++v14;
    }
    v15 = objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_boundsWidthVariable"));
    v16 = objc_msgSend(v13, "valueOfVariableIsAmbiguous:", objc_msgSend(a3, "nsli_boundsHeightVariable"));
    if (v15)
    {
      v18 = 10.0;
      if (a6 >= 10.0)
        v18 = a6;
      a2[2] = v18;
      ++v14;
      if (v16)
        goto LABEL_9;
    }
    else if (v16)
    {
LABEL_9:
      v17 = 10.0;
      if (a7 >= 10.0)
        v17 = a7;
      a2[3] = v17;
      ++v14;
      goto LABEL_16;
    }
    if (!v14)
    {
      if ((_NSRuntimeResolvedAmbiguityDetected() & 1) == 0)
        return (void *)(v14 != 0);
      goto LABEL_17;
    }
LABEL_16:
    if (!_NSRuntimeAmbiguityDetected())
      return (void *)(v14 != 0);
LABEL_17:
    NSLog(CFSTR("The item marked ambiguous is: %@"), a3);
    return (void *)(v14 != 0);
  }
  return result;
}

@end

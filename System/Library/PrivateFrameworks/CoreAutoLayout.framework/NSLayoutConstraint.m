@implementation NSLayoutConstraint

- (void)_addToEngine:(id)a3
{
  -[NSLayoutConstraint _addToEngine:mutuallyExclusiveConstraints:](self, "_addToEngine:mutuallyExclusiveConstraints:", a3, 0);
}

- (void)setIdentifier:(NSString *)identifier
{
  -[NSLayoutConstraint _setIdentifier:]((uint64_t)self, identifier);
}

- (uint64_t)_addLoweredExpression:(void *)a3 toEngine:(int)a4 lastLoweredConstantWasRounded:(uint64_t)a5 mutuallyExclusiveConstraints:
{
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a3)
    return 1;
  v10 = 0;
  v28 = *(_OWORD *)(a1 + 48);
  v26 = 0;
  v27 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = (void *)*((_QWORD *)&v28 + v10);
    if (objc_msgSend(v13, "shouldBeMinimized", v26, v27, v28))
    {
      objc_msgSend((id)a1, "priorityForVariable:", v13);
      *(&v26 + v10) = v14;
    }
    v11 = 0;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  v15 = 0;
  v16 = 1;
  do
  {
    v17 = v16;
    if (*((double *)&v26 + v15) != 0.0)
      objc_msgSend(a3, "addVariableToBeOptimized:priority:", *((_QWORD *)&v28 + v15));
    v16 = 0;
    v15 = 1;
  }
  while ((v17 & 1) != 0);
  v18 = objc_msgSend(a3, "tryToAddConstraintWithMarker:expression:mutuallyExclusiveConstraints:", *(_QWORD *)(a1 + 48), a2, a5);
  if ((v18 & 1) != 0)
  {
    objc_msgSend(a2, "constant");
    v19 = *(_DWORD *)(a1 + 66);
    *(_QWORD *)(a1 + 40) = v20;
    v21 = 32;
    if (!a4)
      v21 = 0;
    *(_DWORD *)(a1 + 66) = v19 & 0xFFFFFBDF | v21;
  }
  else
  {
    v22 = 0;
    v23 = 1;
    do
    {
      v24 = v23;
      if (*((double *)&v26 + v22) != 0.0)
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", *((_QWORD *)&v28 + v22));
      v23 = 0;
      v22 = 1;
    }
    while ((v24 & 1) != 0);
  }
  return v18;
}

- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4
{
  id firstAnchor;
  int v8;
  id secondAnchor;
  double v10;

  if (!self->_markerAndPositiveExtraVar)
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)self);
  firstAnchor = self->_firstAnchor;
  if (!firstAnchor
    || (v8 = objc_msgSend(firstAnchor, "nsli_lowerIntoExpression:withCoefficient:forConstraint:", a3, self, 1.0)) != 0)
  {
    secondAnchor = self->_secondAnchor;
    if (!secondAnchor
      || (v8 = objc_msgSend(secondAnchor, "nsli_lowerIntoExpression:withCoefficient:forConstraint:", a3, self, -self->_coefficient)) != 0)
    {
      -[NSLayoutConstraint constant](self, "constant");
      objc_msgSend(a3, "incrementConstant:", -v10);
      objc_msgSend(a3, "setCoefficient:forVariable:", self->_markerAndPositiveExtraVar, -1.0);
      if (self->_negativeExtraVar)
        objc_msgSend(a3, "setCoefficient:forVariable:", 1.0);
      *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) |= 0x10u;
      if (a4)
        *a4 = 0;
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (CGFloat)constant
{
  void *v5;
  id v6;
  double v7;

  v6 = 0;
  v7 = 0.0;
  if (!-[NSLayoutConstraint _effectiveConstant:error:](self, "_effectiveConstant:error:", &v7, &v6))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 741, CFSTR("%@"), objc_msgSend(v6, "localizedDescription"));
  }
  return v7;
}

- (BOOL)_effectiveConstant:(double *)a3 error:(id *)a4
{
  id container;
  double *p_constant;
  int v7;
  uint64_t v9;

  if ((*(_DWORD *)((_BYTE *)&self->_layoutConstraintFlags + 2) & 0x300) == 0)
  {
    p_constant = &self->_constant;
    goto LABEL_7;
  }
  v9 = 0;
  container = self->_container;
  if (!container)
  {
    p_constant = (double *)&v9;
    v7 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _referencedLayoutItems](-[NSLayoutConstraint firstAnchor](self, "firstAnchor"), "_referencedLayoutItems"), "anyObject"), "nsli_defaultResolvedValue:forSymbolicConstant:inConstraint:error:", &v9, -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), self, a4);
    if (!v7)
      return v7;
LABEL_7:
    *a3 = *p_constant;
    LOBYTE(v7) = 1;
    return v7;
  }
  p_constant = (double *)&v9;
  if ((objc_msgSend(container, "nsli_resolvedValue:forSymbolicConstant:inConstraint:error:", &v9, -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), self, a4) & 1) != 0)goto LABEL_7;
  LOBYTE(v7) = 0;
  return v7;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  unsigned int v4;
  int result;
  unsigned int v6;

  v4 = -[NSLayoutConstraint firstAttribute](self, "firstAttribute", a3);
  result = 0;
  if (v4 <= 0x25 && ((1 << v4) & 0x2A00119D19) != 0)
  {
    v6 = -[NSLayoutConstraint secondAttribute](self, "secondAttribute");
    return v6 <= 0x25 && ((1 << v6) & 0x2A00119D19) != 0;
  }
  return result;
}

- (NSLayoutAttribute)firstAttribute
{
  return objc_msgSend(self->_firstAnchor, "_constraintAttribute");
}

- (NSLayoutAttribute)secondAttribute
{
  return objc_msgSend(self->_secondAnchor, "_constraintAttribute");
}

- (void)setConstant:(CGFloat)constant
{
  if (_NSConstraintBasedLayoutAriadneTracepoints())
    kdebug_trace();
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, 0, constant, NAN);
  if (_NSConstraintBasedLayoutAriadneTracepoints())
    kdebug_trace();
}

- (void)_setSymbolicConstant:(double)a3 constant:(double)a4 symbolicConstantMultiplier:
{
  double v5;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  _QWORD v20[8];

  if (result)
  {
    v5 = a3;
    v7 = (uint64_t)result;
    v8 = fabs(a3);
    if (v8 >= INFINITY && v8 <= INFINITY)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setSymbolicConstant_constant_symbolicConstantMultiplier_, result, CFSTR("NSLayoutConstraint.m"), 669, CFSTR("%@ constant is not finite!  That's illegal.  constant:%g firstAnchor:%@ secondAnchor:%@"), objc_opt_class(), *(_QWORD *)&v5, objc_msgSend(result, "firstAnchor"), objc_msgSend(result, "secondAnchor"));
    +[NSLayoutConstraint _constraintConstantLimit](NSLayoutConstraint, "_constraintConstantLimit");
    v10 = v9;
    if (v9 < v5 || (v10 = -v9, -v9 > v5))
    {
      _NSLayoutConstraintNumberExceedsLimit();
      v5 = v10;
    }
    v11 = (id)objc_msgSend((id)v7, "_symbolicConstant");
    v12 = *(double *)(v7 + 32);
    objc_msgSend((id)v7, "symbolicConstantMultiplier");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__NSLayoutConstraint__setSymbolicConstant_constant_symbolicConstantMultiplier___block_invoke;
    v20[3] = &unk_1E4A49248;
    v20[4] = v7;
    v20[5] = v11;
    *(double *)&v20[6] = v13;
    *(double *)&v20[7] = v12;
    if (a2)
    {
      if (v11 == a2 && v13 == a4)
        goto LABEL_19;
      *(_QWORD *)(v7 + 32) = 0;
      objc_msgSend((id)v7, "_setSymbolicConstant:", a2);
      -[NSLayoutConstraint _setSymbolicConstantMultiplier:]((_WORD *)v7, a4);
    }
    else
    {
      if (v5 == v12 && !v11)
        goto LABEL_19;
      *(double *)(v7 + 32) = v5;
      objc_msgSend((id)v7, "_setSymbolicConstant:", 0);
      _H0 = *(_WORD *)(v7 + 64);
      __asm { FCVT            S0, H0 }
      if (_S0 == 0.0)
        objc_setAssociatedObject((id)v7, &SymbolicConstantMultiplierKey, 0, (void *)0x303);
      *(_WORD *)(v7 + 64) = 15360;
    }
    -[NSLayoutConstraint _tryToChangeContainerGeometryWithUndoHandler:](v7, (uint64_t)v20);
LABEL_19:

    return 0;
  }
  return result;
}

- (id)_symbolicConstant
{
  id result;

  __asm { BR              X10 }
  return result;
}

- (double)symbolicConstantMultiplier
{
  double result;

  _H0 = self->_layoutConstraintFlags;
  __asm { FCVT            S1, H0 }
  if (_S1 == 0.0)
    objc_msgSend(objc_getAssociatedObject(self, &SymbolicConstantMultiplierKey), "doubleValue");
  else
    __asm { FCVT            D0, H0 }
  return result;
}

- (void)_setSymbolicConstant:(id)a3
{
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  if (a3)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSSpace")) & 1) != 0)
    {
      v5 = 256;
    }
    else
    {
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSLayoutAnchorConstraintSpace")) & 1) == 0)
      {
        v9 = (id)objc_msgSend(a3, "copy");
        os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
        objc_msgSend((id)_NSFaultInObject(), "setObject:forKey:", v9, self);
        *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) |= 0x300u;
        os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);

        return;
      }
      v5 = 512;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
  if ((~(_WORD)v6 & 0x300) != 0)
  {
    v7 = v6 | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
    objc_msgSend((id)_NSFaultInObject(), "removeObjectForKey:", self);
    os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);
    v7 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  }
  v8 = v7 & 0xFFFFFFFFFFFFFCFFLL;
  HIWORD(self->_layoutConstraintFlags) = WORD2(v8);
  *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) = v8 | v5;
}

- (uint64_t)_tryToChangeContainerGeometryWithUndoHandler:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int *v14;
  int v15;
  uint64_t v16;
  id v17;
  char v18;
  unsigned __int8 v19;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 8), "nsli_layoutEngine");
    v5 = objc_msgSend((id)v3, "hasBeenLowered");
    result = 1;
    if (v5)
    {
      if (v4)
      {
        v19 = 0;
        v6 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, v4);
        v7 = objc_msgSend((id)v3, "_lowerIntoExpression:reportingConstantIsRounded:", v6, &v19);
        v8 = *(double *)(v3 + 40);
        objc_msgSend(v6, "constant");
        v10 = v9;
        objc_msgSend(v6, "returnToPool");
        if ((v7 & 1) == 0)
        {
          (*(void (**)(uint64_t))(a2 + 16))(a2);
          return 0;
        }
        v11 = v10 - v8;
        if (v10 - v8 != 0.0)
        {
          v12 = -v11;
          if (v10 == 0.0 || COERCE_UNSIGNED_INT64(-v11) >> 63 != *(_QWORD *)&v8 >> 63)
            goto LABEL_10;
          if (vabdd_f64(v12, v8) <= *(double *)&NSISEpsilon)
            goto LABEL_20;
          v16 = COERCE__INT64(-v11) - *(_QWORD *)&v8;
          if (v16 < 0)
            v16 = *(_QWORD *)&v8 - COERCE__INT64(-v11);
          if (v16 <= NSISMaxUlps)
          {
LABEL_20:
            objc_msgSend((id)v3, "_removeFromEngine:", v4);
            v17 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, v4);
            if ((objc_msgSend((id)v3, "_lowerIntoExpression:reportingConstantIsRounded:", v17, &v19) & 1) == 0)
            {
              objc_msgSend(v17, "returnToPool");
LABEL_24:
              (*(void (**)(uint64_t))(a2 + 16))(a2);
              objc_msgSend((id)v3, "_addToEngine:", v4);
              return 0;
            }
            v18 = -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:](v3, v17, v4, v19, 0);
            objc_msgSend(v17, "returnToPool");
            if ((v18 & 1) == 0)
              goto LABEL_24;
          }
          else
          {
LABEL_10:
            result = objc_msgSend(v4, "tryToChangeConstraintSuchThatMarker:isReplacedByMarkerPlusDelta:undoHandler:", objc_msgSend((id)v3, "_markerAndPositiveExtraVar"), a2, v12);
            if (!(_DWORD)result)
              return result;
          }
          v15 = *(_DWORD *)(v3 + 66);
          v14 = (unsigned int *)(v3 + 66);
          *(double *)((char *)v14 - 26) = v10;
          *v14 = v15 & 0xFFFFFBDF | (32 * (v19 & 7));
        }
        return 1;
      }
    }
  }
  return result;
}

- (void)_setSymbolicConstantMultiplier:(_WORD *)object
{
  double v4;

  if (object)
  {
    _D8 = a2;
    v4 = fabs(a2);
    if (_D8 != 0.0 && v4 <= 1024.0)
    {
      _H0 = object[32];
      __asm { FCVT            S0, H0 }
      if (_S0 == 0.0)
        objc_setAssociatedObject(object, &SymbolicConstantMultiplierKey, 0, (void *)0x303);
      __asm { FCVT            H0, D8 }
    }
    else
    {
      objc_setAssociatedObject(object, &SymbolicConstantMultiplierKey, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", _D8), (void *)0x303);
      _H0 = 0;
    }
    object[32] = _H0;
  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_markerAndPositiveExtraVar, "setDelegate:", 0);

  objc_msgSend(self->_negativeExtraVar, "setDelegate:", 0);
  -[NSLayoutConstraint _setSymbolicConstant:](self, "_setSymbolicConstant:", 0);
  -[NSLayoutConstraint _setIdentifier:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraint;
  -[NSLayoutConstraint dealloc](&v3, sel_dealloc);
}

- (void)_setIdentifier:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  int v5;
  __int16 v6;

  if (a1)
  {
    if (a2)
    {
      v3 = (void *)objc_msgSend(a2, "copy");
      os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
      objc_msgSend((id)_NSFaultInObject(), "setObject:forKey:", v3, a1);
      *(_DWORD *)(a1 + 66) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);

    }
    else if ((*(_DWORD *)(a1 + 66) & 0x80) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
      objc_msgSend((id)_NSFaultInObject(), "removeObjectForKey:", a1);
      v5 = *(_DWORD *)(a1 + 66);
      v4 = a1 + 66;
      v6 = *(_WORD *)(v4 + 4);
      *(_DWORD *)v4 = v5 & 0xFFFFFF7F;
      *(_WORD *)(v4 + 4) = v6;
      os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);
    }
  }
}

- (void)setPriority:(UILayoutPriority)priority
{
  -[NSLayoutConstraint _setPriority:mutuallyExclusiveConstraints:]((uint64_t)self, 0, priority);
}

- (BOOL)_referencesLayoutItem:(id)a3
{
  if (!a3)
    return 0;
  if (-[NSLayoutConstraint firstItem](self, "firstItem") == a3
    || -[NSLayoutConstraint secondItem](self, "secondItem") == a3
    || (objc_msgSend(-[NSLayoutAnchor _referencedLayoutItems](-[NSLayoutConstraint firstAnchor](self, "firstAnchor"), "_referencedLayoutItems"), "containsObject:", a3) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(-[NSLayoutAnchor _referencedLayoutItems](-[NSLayoutConstraint secondAnchor](self, "secondAnchor"), "_referencedLayoutItems"), "containsObject:", a3);
}

- (id)secondItem
{
  return (id)objc_msgSend(self->_secondAnchor, "_constraintItem");
}

- (id)firstItem
{
  return (id)objc_msgSend(self->_firstAnchor, "_constraintItem");
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 constant:(double)a6
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, 0, 0, 0.0, a6);
}

uint64_t __55__NSLayoutConstraint__addOrRemoveConstraints_activate___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;

  do
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActive:", *(unsigned __int8 *)(a1 + 72));
    while (1)
    {
      v2 = *(_QWORD *)(a1 + 64);
      v3 = v2 <= (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
         ? 0
         : objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v3;
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v4)
        break;
      if (*(unsigned __int8 *)(a1 + 72) != objc_msgSend(v4, "isActive"))
      {
        v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        break;
      }
    }
    v5 = *(_QWORD *)(a1 + 40);
    result = -[NSLayoutConstraint _layoutEngine]((uint64_t)v4);
  }
  while (v5 == result);
  return result;
}

- (void)setContainer:(id)a3
{
  if (self->_container != a3)
  {
    self->_container = a3;
    -[NSLayoutConstraint _setContainerDeclaredConstraint:](self, "_setContainerDeclaredConstraint:", 0);
  }
}

- (void)_setContainerDeclaredConstraint:(BOOL)a3
{
  char *v3;
  unsigned int v4;
  unint64_t v5;
  int v6;
  unint64_t v7;

  v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  v3 = (char *)&self->_layoutConstraintFlags + 2;
  v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  v6 = 2048;
  if (!a3)
    v6 = 0;
  v7 = v5 & 0xFFFFFFFFFFFFF7FFLL;
  *(_DWORD *)v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

- (BOOL)_isEqualToConstraintValue:(id)a3 includingConstant:(BOOL)a4 includeOtherMutableProperties:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  char isKindOfClass;
  id firstAnchor;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  int v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  double coefficient;
  double v33;
  id secondAnchor;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  id v43;
  uint64_t v44;
  float priority;
  float v46;
  id v47;
  uint64_t v48;
  int v49;
  id v50;
  uint64_t v51;

  v5 = a5;
  v6 = a4;
  isKindOfClass = objc_opt_isKindOfClass();
  firstAnchor = self->_firstAnchor;
  v11 = (id)objc_msgSend(a3, "firstAnchor");
  v12 = objc_msgSend(firstAnchor, "_anchorType");
  if (v12 == objc_msgSend(v11, "_anchorType"))
  {
    v13 = objc_msgSend(firstAnchor, "_anchorType");
    if (v13 >= 2)
    {
      if (v13 != 2)
        goto LABEL_8;
      v14 = objc_msgSend(firstAnchor, "_proxiedItem");
      if (v14 == objc_msgSend(v11, "_proxiedItem"))
      {
        v15 = objc_msgSend(firstAnchor, "_proxiedAttribute");
        if (v15 == objc_msgSend(v11, "_proxiedAttribute"))
          goto LABEL_8;
      }
    }
    else if (firstAnchor == v11)
    {
LABEL_8:
      v16 = self->_firstAnchor;
      v17 = (id)objc_msgSend(a3, "firstAnchor");
      v18 = objc_msgSend(v16, "_anchorType");
      if (v18 != objc_msgSend(v17, "_anchorType"))
        goto LABEL_66;
      v19 = objc_msgSend(v16, "_anchorType");
      if (v19 >= 2)
      {
        if (v19 == 2)
        {
          v29 = objc_msgSend(v16, "_proxiedItem");
          if (v29 != objc_msgSend(v17, "_proxiedItem"))
            goto LABEL_66;
          v30 = objc_msgSend(v16, "_proxiedAttribute");
          if (v30 != objc_msgSend(v17, "_proxiedAttribute"))
            goto LABEL_66;
        }
      }
      else if (v16 != v17)
      {
        goto LABEL_66;
      }
      v31 = (unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62;
      if (objc_msgSend(a3, "relation") != v31 >> 62)
        goto LABEL_66;
      coefficient = self->_coefficient;
      objc_msgSend(a3, "multiplier");
      if (v33 != coefficient)
        goto LABEL_66;
      secondAnchor = self->_secondAnchor;
      v35 = (id)objc_msgSend(a3, "secondAnchor");
      v36 = objc_msgSend(secondAnchor, "_anchorType");
      if (v36 != objc_msgSend(v35, "_anchorType"))
        goto LABEL_66;
      v37 = objc_msgSend(secondAnchor, "_anchorType");
      if (v37 >= 2)
      {
        if (v37 == 2)
        {
          v38 = objc_msgSend(secondAnchor, "_proxiedItem");
          if (v38 != objc_msgSend(v35, "_proxiedItem"))
            goto LABEL_66;
          v39 = objc_msgSend(secondAnchor, "_proxiedAttribute");
          if (v39 != objc_msgSend(v35, "_proxiedAttribute"))
            goto LABEL_66;
        }
      }
      else if (secondAnchor != v35)
      {
        goto LABEL_66;
      }
      if (v6)
      {
        -[NSLayoutConstraint constant](self, "constant");
        v41 = v40;
        objc_msgSend(a3, "constant");
        if (v41 != v42)
          goto LABEL_66;
        v43 = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant");
        if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
          v44 = objc_msgSend(a3, "_symbolicConstant");
        else
          v44 = 0;
        if (v43 != (id)v44)
        {
          v27 = objc_msgSend(v43, "isEqual:");
          if (!v27)
            return v27;
        }
      }
      goto LABEL_52;
    }
  }
  v20 = self->_firstAnchor;
  v21 = (id)objc_msgSend(a3, "secondAnchor");
  v22 = objc_msgSend(v20, "_anchorType");
  if (v22 != objc_msgSend(v21, "_anchorType"))
    goto LABEL_66;
  v23 = objc_msgSend(v20, "_anchorType");
  if (v23 >= 2)
  {
    if (v23 == 2)
    {
      v24 = objc_msgSend(v20, "_proxiedItem");
      if (v24 != objc_msgSend(v21, "_proxiedItem"))
        goto LABEL_66;
      v25 = objc_msgSend(v20, "_proxiedAttribute");
      if (v25 != objc_msgSend(v21, "_proxiedAttribute"))
        goto LABEL_66;
    }
  }
  else if (v20 != v21)
  {
    goto LABEL_66;
  }
  if ((self->_layoutConstraintFlags & 0x30000) != 0)
    goto LABEL_66;
  if (objc_msgSend(a3, "relation"))
    goto LABEL_66;
  if (self->_coefficient != 1.0)
    goto LABEL_66;
  objc_msgSend(a3, "multiplier");
  if (v26 != 1.0)
    goto LABEL_66;
  v27 = AnchorEqualOrNil(self->_secondAnchor, (void *)objc_msgSend(a3, "firstAnchor"));
  if (!v27)
    return v27;
  if (v6)
  {
    if (self->_constant != 0.0
      || (objc_msgSend(a3, "constant"), v28 != 0.0)
      || -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant")
      || ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0) && objc_msgSend(a3, "_symbolicConstant"))
    {
LABEL_66:
      LOBYTE(v27) = 0;
      return v27;
    }
  }
LABEL_52:
  priority = self->_priority;
  objc_msgSend(a3, "priority");
  if (priority != v46)
    goto LABEL_66;
  if (!v5)
  {
LABEL_74:
    LOBYTE(v27) = 1;
    return v27;
  }
  v47 = -[NSLayoutConstraint _identifier](self, "_identifier");
  if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v48 = objc_msgSend(a3, "_identifier");
  else
    v48 = 0;
  if (v47 == (id)v48 || (v27 = objc_msgSend(v47, "isEqual:")) != 0)
  {
    v49 = -[NSLayoutConstraint shouldBeArchived](self, "shouldBeArchived");
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v49 == objc_msgSend(a3, "shouldBeArchived"))
      {
        v50 = -[NSLayoutConstraint animations](self, "animations");
        if ((isKindOfClass & 1) != 0)
          goto LABEL_70;
        goto LABEL_69;
      }
    }
    else if ((v49 & 1) == 0)
    {
      v50 = -[NSLayoutConstraint animations](self, "animations");
LABEL_69:
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v51 = 0;
        goto LABEL_72;
      }
LABEL_70:
      v51 = objc_msgSend(a3, "animations");
LABEL_72:
      if (v50 == (id)v51)
        goto LABEL_74;
      v27 = objc_msgSend(v50, "isEqual:");
      if (v27)
        goto LABEL_74;
      return v27;
    }
    goto LABEL_66;
  }
  return v27;
}

- (CGFloat)multiplier
{
  return self->_coefficient;
}

- (NSISVariable)_makeExtraVars
{
  NSISVariable *v1;
  unint64_t v2;
  float v3;
  float v4;
  id v5;
  float v6;
  NSISVariable *v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  NSISVariable *v11;
  uint64_t v12;
  uint64_t v13;

  if (!result)
    return result;
  v1 = result;
  v2 = ((unint64_t)*(unsigned int *)((char *)&result[1].super.isa + 2) << 46) & 0xC00000000000;
  if (v2)
  {
    if (v2 == 0xC00000000000)
    {
      -[NSISVariable priority](result, "priority");
      if (v8 == 1000.0)
      {
        v9 = 2;
        v10 = 0;
      }
      else
      {
        v9 = 1;
        v10 = 1;
      }
      v5 = +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v1, v9, v10);
      v11 = v1;
      v12 = 0;
      goto LABEL_16;
    }
    if (v2 != 0x400000000000)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown constraint relation: %d"), (uint64_t)((unint64_t)*(unsigned int *)((char *)&result[1].super.isa + 2) << 62) >> 62);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
    }
    -[NSISVariable priority](result, "priority");
    v4 = v3;
    v5 = +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v1, 1, 0);
    if (v4 != 1000.0)
    {
LABEL_13:
      v11 = v1;
      v12 = 1;
LABEL_16:
      v7 = +[NSISVariable variableWithDelegate:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithDelegate:valueRestriction:shouldBeMinimized:", v11, 1, v12);
      goto LABEL_17;
    }
  }
  else
  {
    -[NSISVariable priority](result, "priority");
    if (v6 != 1000.0)
    {
      v5 = +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v1, 1, 1);
      goto LABEL_13;
    }
    v5 = +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v1, 2, 0);
  }
  v7 = 0;
LABEL_17:
  if (*(_QWORD *)&v1->_engineVarIndexes[0].value)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__makeExtraVars, v1, CFSTR("NSLayoutConstraint.m"), 1754, CFSTR("We are leaking a layout variable"));
  *(_QWORD *)&v1->_engineVarIndexes[0].value = v5;
  if (*(_QWORD *)&v1->_engineVarIndexes[2].value)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__makeExtraVars, v1, CFSTR("NSLayoutConstraint.m"), 1757, CFSTR("We are leaking a layout variable"));
  result = v7;
  *(_QWORD *)&v1->_engineVarIndexes[2].value = result;
  return result;
}

- (UILayoutPriority)priority
{
  return self->_priority;
}

- (NSLayoutRelation)relation
{
  return (uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62;
}

+ (void)_addOrRemoveConstraints:(uint64_t)a3 activate:
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[9];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  objc_opt_self();
  v5 = objc_msgSend(a2, "count");
  if (v5)
  {
    v6 = v5;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    v18 = objc_msgSend(a2, "objectAtIndex:", 0);
    v7 = (void *)v14[5];
    if (v7)
    {
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        while (objc_msgSend(v7, "isActive") != (_DWORD)a3)
        {
          v9 = (void *)-[NSLayoutConstraint _layoutEngine](v14[5]);
          if (!v9)
            break;
          v11[0] = v8;
          v11[1] = 3221225472;
          v11[2] = __55__NSLayoutConstraint__addOrRemoveConstraints_activate___block_invoke;
          v11[3] = &unk_1E4A49298;
          v12 = a3;
          v11[6] = &v13;
          v11[7] = &v19;
          v11[8] = v6;
          v11[4] = a2;
          v11[5] = v9;
          objc_msgSend(v9, "withAutomaticOptimizationDisabled:", v11);
          v7 = (void *)v14[5];
          if (!v7)
            goto LABEL_12;
        }
        objc_msgSend((id)v14[5], "setActive:", a3);
        v10 = *((int *)v20 + 6);
        *((_DWORD *)v20 + 6) = v10 + 1;
        if (v6 <= v10 + 1)
          v7 = 0;
        else
          v7 = (void *)objc_msgSend(a2, "objectAtIndex:");
        v14[5] = (uint64_t)v7;
      }
      while (v7);
    }
LABEL_12:
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
}

- (void)setActive:(BOOL)active
{
  -[NSLayoutConstraint _setActive:mutuallyExclusiveConstraints:](self, "_setActive:mutuallyExclusiveConstraints:", active, 0);
}

- (void)_setActive:(BOOL)a3 mutuallyExclusiveConstraints:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;
  id v8;
  id secondAnchor;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  if (-[NSLayoutConstraint isActive](self, "isActive") != a3)
  {
    if (!v5)
    {
      objc_msgSend(self->_container, "nsli_removeConstraint:", self);
      return;
    }
    v8 = (id)objc_msgSend(self->_firstAnchor, "_nearestAncestorLayoutItem");
    secondAnchor = self->_secondAnchor;
    if (secondAnchor)
    {
      v10 = objc_msgSend(secondAnchor, "_nearestAncestorLayoutItem");
      if (!v8)
        goto LABEL_13;
      v7 = v10;
      if (!v10)
        goto LABEL_13;
      v8 = +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", v8, v10);
    }
    if (v8)
    {
      if (a4)
        objc_msgSend(v8, "nsli_addConstraint:mutuallyExclusiveConstraints:", self, a4);
      else
        objc_msgSend(v8, "nsli_addConstraint:", self);
      return;
    }
LABEL_13:
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to activate constraint with anchors %@ and %@ because they have no common ancestor.  Does the constraint or its anchors reference items in different view hierarchies?  That's illegal."), v7, self->_firstAnchor, self->_secondAnchor);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v11, 0));
  }
}

- (BOOL)isActive
{
  return self->_container != 0;
}

- (id)container
{
  return self->_container;
}

- (NSLayoutAnchor)firstAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (NSLayoutAnchor)secondAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 24, 1);
}

- (uint64_t)_layoutEngine
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "_nearestAncestorLayoutItem"), "nsli_layoutEngine");
    if (!result)
      return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 24), "_nearestAncestorLayoutItem"), "nsli_layoutEngine");
  }
  return result;
}

+ (id)_findCommonAncestorOfItem:(id)a3 andItem:(id)a4
{
  id v5;
  id result;
  id v7;

  if (!a3)
    return a4;
  v5 = a3;
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend(v5, "nsli_ancestorSharedWithItem:", a4);
LABEL_6:
    v7 = a4;
    while (v5 != v7)
    {
      v7 = (id)objc_msgSend(v7, "nsli_superitem");
      if (!v7)
      {
        v5 = (id)objc_msgSend(v5, "nsli_superitem");
        result = 0;
        if (v5)
          goto LABEL_6;
        return result;
      }
    }
  }
  return v5;
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 constant:(double)a8
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, 1.0, a8);
}

+ (void)activateConstraints:(NSArray *)constraints
{
  +[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 1);
}

- (void)_containerGeometryDidChange
{
  id v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double loweredConstant;
  unsigned int *v8;
  int v9;
  char v10;

  if (-[NSLayoutConstraint hasBeenLowered](self, "hasBeenLowered"))
  {
    v10 = 0;
    v3 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, objc_msgSend(self->_container, "nsli_layoutEngine"));
    v4 = -[NSLayoutConstraint _lowerIntoExpression:reportingConstantIsRounded:](self, "_lowerIntoExpression:reportingConstantIsRounded:", v3, &v10);
    objc_msgSend(v3, "constant");
    v6 = v5;
    objc_msgSend(v3, "returnToPool");
    if (v4)
    {
      loweredConstant = self->_loweredConstant;
      if (vabdd_f64(v6, loweredConstant) >= *(double *)&NSISEpsilon)
      {
        objc_msgSend((id)objc_msgSend(self->_container, "nsli_layoutEngine"), "constraintDidChangeSuchThatMarker:shouldBeReplacedByMarkerPlusDelta:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"), -(v6 - loweredConstant));
        v9 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
        v8 = (unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
        *(double *)((char *)v8 - 26) = v6;
        *v8 = v9 & 0xFFFFFBDF | (32 * (v10 & 7));
      }
    }
  }
}

- (uint64_t)_setPriority:(float)a3 mutuallyExclusiveConstraints:
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  int v9;

  if (result)
  {
    v5 = result;
    if (a3 <= 0.0 || a3 > 1000.0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setPriority_mutuallyExclusiveConstraints_, result, CFSTR("NSLayoutConstraint.m"), 274, CFSTR("It's illegal to set priority:%g.  Priorities must be greater than 0 and less or equal to NSLayoutPriorityRequired, which is %f."), a3, 0x408F400000000000);
    result = kdebug_trace();
    if (a2)
      *a2 = 0;
    if (*(float *)(v5 + 76) != a3)
    {
      if ((objc_msgSend((id)v5, "hasBeenLowered") & 1) != 0)
      {
        v7 = objc_msgSend((id)objc_msgSend((id)v5, "container"), "nsli_layoutEngine");
        v8 = (void *)v7;
        if (a3 == 1000.0 || *(float *)(v5 + 76) == 1000.0)
        {
          if (v7)
          {
            objc_msgSend((id)v5, "_removeFromEngine:", v7);
            v9 = *(_DWORD *)(v5 + 76);
            *(float *)(v5 + 76) = a3;
            -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
            objc_msgSend((id)v5, "_addToEngine:mutuallyExclusiveConstraints:", v8, a2);
            if (a2)
            {
              if (objc_msgSend(*a2, "count"))
              {
                *(_DWORD *)(v5 + 76) = v9;
                -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
                objc_msgSend((id)v5, "_addToEngine:mutuallyExclusiveConstraints:", v8, a2);
              }
            }
          }
          else
          {
            *(float *)(v5 + 76) = a3;
            -[NSLayoutConstraint _rebuildExtraVars]((NSISVariable *)v5);
          }
        }
        else
        {
          if (objc_msgSend(*(id *)(v5 + 48), "shouldBeMinimized"))
            objc_msgSend(v8, "changeVariableToBeOptimized:fromPriority:toPriority:", *(_QWORD *)(v5 + 48), *(float *)(v5 + 76), a3);
          if (objc_msgSend(*(id *)(v5 + 56), "shouldBeMinimized"))
            objc_msgSend(v8, "changeVariableToBeOptimized:fromPriority:toPriority:", *(_QWORD *)(v5 + 56), *(float *)(v5 + 76), a3);
          *(float *)(v5 + 76) = a3;
        }
      }
      else
      {
        *(float *)(v5 + 76) = a3;
      }
      return kdebug_trace();
    }
  }
  return result;
}

- (BOOL)_addToEngine:(id)a3 mutuallyExclusiveConstraints:(id *)a4
{
  id v7;
  char v8;
  uint64_t v10;
  unsigned __int8 v11;

  if (!a3)
    return 1;
  kdebug_trace();
  v11 = 0;
  v7 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, a3);
  if (!-[NSLayoutConstraint _lowerIntoExpression:reportingConstantIsRounded:](self, "_lowerIntoExpression:reportingConstantIsRounded:", v7, &v11))
  {
    objc_msgSend(v7, "returnToPool");
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to install constraint on view.  Does the constraint reference something from outside the subtree of the view?  That's illegal. constraint:%@ view:%@"), self, -[NSLayoutConstraint container](self, "container"));
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v10, 0));
  }
  v8 = -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:]((uint64_t)self, v7, a3, v11, (uint64_t)a4);
  objc_msgSend(v7, "returnToPool");
  kdebug_trace();
  return v8;
}

- (void)_removeFromEngine:(id)a3
{
  double v5;
  double v6;

  if ((*(_DWORD *)((_BYTE *)&self->_layoutConstraintFlags + 2) & 0x10) != 0)
  {
    if (objc_msgSend(self->_markerAndPositiveExtraVar, "shouldBeMinimized"))
    {
      -[NSLayoutConstraint priorityForVariable:](self, "priorityForVariable:", self->_markerAndPositiveExtraVar);
      if (v5 != 0.0)
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", self->_markerAndPositiveExtraVar);
    }
    if (objc_msgSend(self->_negativeExtraVar, "shouldBeMinimized"))
    {
      -[NSLayoutConstraint priorityForVariable:](self, "priorityForVariable:", self->_negativeExtraVar);
      if (v6 != 0.0)
        objc_msgSend(a3, "removeVariableToBeOptimized:priority:", self->_negativeExtraVar);
    }
    objc_msgSend(a3, "removeConstraintWithMarker:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"));
  }
}

- (id)_markerAndPositiveExtraVar
{
  return self->_markerAndPositiveExtraVar;
}

- (double)priorityForVariable:(id)a3
{
  return self->_priority;
}

+ (NSLayoutConstraint)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c
{
  char *v16;
  NSLayoutAttribute v18;
  id v19;
  NSLayoutAttribute v20;
  id v21;

  v20 = attr1;
  v21 = view1;
  v18 = attr2;
  v19 = view2;
  ResolveConstraintArguments(&v21, (uint64_t *)&v20, &v19, (uint64_t *)&v18, multiplier);
  v16 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v16 + 66) |= 0x40u;
  objc_msgSend(v16, "_setFirstItem:attribute:", view1, attr1);
  objc_msgSend(v16, "_setRelation:", relation);
  if (view2 && multiplier != 0.0)
  {
    objc_msgSend(v16, "_setMultiplier:", multiplier);
    objc_msgSend(v16, "_setSecondItem:attribute:", view2, attr2);
  }
  objc_msgSend(v16, "setConstant:", c);
  ConstraintDidPerformInitialSetup((uint64_t)v16);
  return (NSLayoutConstraint *)v16;
}

+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 multiplier:(double)a6 constant:(double)a7
{
  uint64_t v12;
  char *v13;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), a4, a5, a6, a7, 0);
    v16 = CFSTR("%@: Constraint must contain a first layout anchor");
    goto LABEL_12;
  }
  if (!a5)
  {
    if ((objc_msgSend(a3, "validateOtherAttribute:", 7) & 1) != 0)
      goto LABEL_6;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), a3);
    v18 = a3;
    v16 = CFSTR("%@: A constraint cannot be made from %@ to a constant. Location anchors require being paired.");
LABEL_12:
    v12 = objc_msgSend(v15, "stringWithFormat:", v16, v17, v18, v19);
LABEL_13:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  if ((objc_msgSend(a3, "isCompatibleWithAnchor:", a5) & 1) == 0)
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: A constraint cannot be made between %@ and %@ because their units are not compatible."), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), a3), a3, a5);
    goto LABEL_13;
  }
LABEL_6:
  v13 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v13 + 66) |= 0x40u;
  objc_msgSend(v13, "_setFirstAnchor:", a3);
  objc_msgSend(v13, "_setRelation:", a4);
  if (a5 && a6 != 0.0)
  {
    objc_msgSend(v13, "_setMultiplier:", a6);
    objc_msgSend(v13, "_setSecondAnchor:", a5);
  }
  objc_msgSend(v13, "setConstant:", a7);
  ConstraintDidPerformInitialSetup((uint64_t)v13);
  return (NSLayoutConstraint *)v13;
}

- (NSLayoutConstraint)init
{
  NSLayoutConstraint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutConstraint;
  result = -[NSLayoutConstraint init](&v3, sel_init);
  if (result)
  {
    LOWORD(result->_layoutConstraintFlags) = 15360;
    *(_QWORD *)&result->_coefficient = 0x447A00003F800000;
  }
  return result;
}

- (void)_setFirstAnchor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)_setSecondAnchor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)_setMultiplier:(double)a3
{
  double v6;
  float v7;

  if (-[NSLayoutConstraint hasBeenLowered](self, "hasBeenLowered"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 239, CFSTR("Unable to change the multiplier after a constraint has been added to a view"));
  v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 240, CFSTR("Multiplier is not finite!  That's illegal.  multiplier:%g"), *(_QWORD *)&a3);
  v7 = a3;
  self->_coefficient = v7;
}

- (void)_setRelation:(int64_t)a3
{
  char v3;

  v3 = a3;
  if (-[NSLayoutConstraint hasBeenLowered](self, "hasBeenLowered"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 233, CFSTR("Unable to change the relation after a constraint has been added to a view"));
  *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2) = *(_DWORD *)((_BYTE *)&self->_layoutConstraintFlags + 2) & 0xFFFFFFFC | v3 & 3;
}

- (BOOL)hasBeenLowered
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 4) & 1;
}

- (void)_setSecondItem:(id)a3 attribute:(int64_t)a4
{
  if (a3)
    a3 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", a3, a4);
  -[NSLayoutConstraint _setSecondAnchor:](self, "_setSecondAnchor:", a3, a4);
}

- (void)_setFirstItem:(id)a3 attribute:(int64_t)a4
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 227, CFSTR("First item cannot be set to a nil value"));
  -[NSLayoutConstraint _setFirstAnchor:](self, "_setFirstAnchor:", +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", a3, a4));
}

- (_QWORD)_setNegativeExtraVar:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[7];
    if (v4 != a2)
    {

      result = a2;
      v3[7] = result;
    }
  }
  return result;
}

- (_QWORD)_setMarkerAndPositiveErrorVar:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[6];
    if (v4 != a2)
    {

      result = a2;
      v3[6] = result;
    }
  }
  return result;
}

- (NSISVariable)_rebuildExtraVars
{
  NSISVariable *v1;

  if (result)
  {
    v1 = result;

    *(_QWORD *)&v1->_engineVarIndexes[0].value = 0;
    *(_QWORD *)&v1->_engineVarIndexes[2].value = 0;
    return -[NSLayoutConstraint _makeExtraVars](v1);
  }
  return result;
}

- (BOOL)_loweredConstantIsRounded
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 5) & 1;
}

+ (void)deactivateConstraints:(NSArray *)constraints
{
  +[NSLayoutConstraint _addOrRemoveConstraints:activate:]((uint64_t)NSLayoutConstraint, constraints, 0);
}

+ (NSArray)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views
{
  return (NSArray *)+[NSLayoutConstraintParser constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraintParser, "constraintsWithVisualFormat:options:metrics:views:", format, opts, metrics, views);
}

- (id)_identifier
{
  id v4;

  if ((*(_DWORD *)((_BYTE *)&self->_layoutConstraintFlags + 2) & 0x80) == 0)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)&identifierTableLock);
  v4 = (id)objc_msgSend((id)_NSFaultInObject(), "objectForKey:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&identifierTableLock);
  return v4;
}

- (void)setShouldBeArchived:(BOOL)shouldBeArchived
{
  char *v3;
  unsigned int v4;
  unint64_t v5;
  int v6;
  unint64_t v7;

  v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  v3 = (char *)&self->_layoutConstraintFlags + 2;
  v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  v6 = 8;
  if (!shouldBeArchived)
    v6 = 0;
  v7 = v5 & 0xFFFFFFFFFFFFFFF7;
  *(_DWORD *)v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

+ (uint64_t)_constraintWithAnchor:(void *)a3 relatedBy:(uint64_t)a4 toAnchor:(void *)a5 withSystemSpacingMultipliedBy:
{
  void *v9;
  void *v10;
  uint64_t result;
  uint64_t v12;

  objc_opt_self();
  if (objc_msgSend(a3, "_anchorType") == 2)
  {
    v9 = a3;
    goto LABEL_5;
  }
  if (objc_msgSend(a5, "_anchorType") == 2)
  {
    v9 = a5;
LABEL_5:
    v10 = (void *)objc_msgSend(v9, "_proxiedItem");
    if (!v10)
      goto LABEL_10;
    goto LABEL_6;
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "_referencedLayoutItems"), "anyObject");
  if (!v10)
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "_referencedLayoutItems"), "anyObject");
    if (!v10)
    {
LABEL_10:
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create a standard spacing constraint between anchors '%@' and '%@': at least one anchor must be associated with a view or a guide"), a3, a5);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
    }
  }
LABEL_6:
  result = objc_msgSend(v10, "nsli_constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:", a3, a4, a5, a1);
  if (!result)
    goto LABEL_10;
  return result;
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9 symbolicConstantMultiplier:(double)a10
{
  char *v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;

  v22 = a4;
  v23 = a3;
  v20 = a7;
  v21 = a6;
  ResolveConstraintArguments(&v23, &v22, &v21, &v20, a8);
  v18 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v18 + 66) |= 0x40u;
  objc_msgSend(v18, "_setFirstItem:attribute:", a3, a4);
  objc_msgSend(v18, "_setRelation:", a5);
  if (a6 && a8 != 0.0)
  {
    objc_msgSend(v18, "_setMultiplier:", a8);
    objc_msgSend(v18, "_setSecondItem:attribute:", a6, a7);
  }
  objc_msgSend(v18, "setSymbolicConstant:", a9);
  objc_msgSend(v18, "setSymbolicConstantMultiplier:", a10);
  ConstraintDidPerformInitialSetup((uint64_t)v18);
  return (NSLayoutConstraint *)v18;
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, 1.0, 0.0);
}

- (void)setSymbolicConstant:(id)a3
{
  double v5;

  -[NSLayoutConstraint symbolicConstantMultiplier](self, "symbolicConstantMultiplier");
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, a3, 0.0, v5);
}

- (void)setSymbolicConstantMultiplier:(double)a3
{
  id v5;

  v5 = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant");
  if (!v5)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set symbolic constant multiplier when the constant is not symbolic"), 0));
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, v5, self->_constant, a3);
}

- (int)_constraintType
{
  uint64_t v2;
  id firstAnchor;
  id secondAnchor;
  BOOL v6;
  BOOL v7;
  unsigned int v8;
  float coefficient;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;

  v2 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2);
  if ((v2 & 4) == 0)
  {
    firstAnchor = self->_firstAnchor;
    secondAnchor = self->_secondAnchor;
    if (firstAnchor)
      v6 = secondAnchor == 0;
    else
      v6 = 1;
    if (v6)
    {
      if (firstAnchor)
        v7 = secondAnchor == 0;
      else
        v7 = 0;
      if (v7)
      {
        v8 = objc_msgSend(self->_firstAnchor, "_constraintAttribute");
        if (v8 > 0x25 || ((1 << v8) & 0x3F001FFE7FLL) == 0)
        {
          LODWORD(v11) = 5;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            LODWORD(v11) = 6;
          else
            LODWORD(v11) = 0;
        }
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    coefficient = self->_coefficient;
    LODWORD(v11) = objc_msgSend(self->_firstAnchor, "isCompatibleWithAnchor:", secondAnchor);
    if (!(_DWORD)v11)
      goto LABEL_44;
    v12 = (void *)objc_msgSend(firstAnchor, "_constraintItem");
    v13 = (void *)objc_msgSend(secondAnchor, "_constraintItem");
    v14 = objc_msgSend(firstAnchor, "_constraintAttribute");
    v15 = objc_msgSend(secondAnchor, "_constraintAttribute");
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      if (coefficient == 1.0)
      {
        LODWORD(v11) = 1;
        if (!v14 || !v15)
          goto LABEL_44;
        if (v14 == v15)
        {
          if ((v14 > 0x25 || ((1 << v14) & 0x3C001D5FD5) == 0)
            && (void *)objc_msgSend(v12, "nsli_superitem") == v13)
          {
            LODWORD(v11) = 3;
            goto LABEL_44;
          }
          if (v14 >= 0x24 || ((0xF001ABFABuLL >> v14) & 1) == 0)
          {
            if ((void *)objc_msgSend(v13, "nsli_superitem") == v12)
              LODWORD(v11) = 4;
            else
              LODWORD(v11) = 1;
            goto LABEL_44;
          }
        }
        else if (v14 >= 0x26 || ((0x3C001D5FD5uLL >> v14) & 1) == 0)
        {
          if (v15 >= 0x24)
            LODWORD(v11) = 2;
          else
            LODWORD(v11) = dword_1A373F3CC[(int)v15];
          goto LABEL_44;
        }
        LODWORD(v11) = 1;
LABEL_44:
        v17 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
        v16 = (char *)&self->_layoutConstraintFlags + 2;
        *((_WORD *)v16 + 2) = *((_WORD *)v16 + 2);
        *(_DWORD *)v16 = v17 & 0xFF00FFFF | ((_DWORD)v11 << 16) | 4;
        return v11;
      }
LABEL_43:
      LODWORD(v11) = 0;
      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
    LODWORD(v11) = 6;
    if (!v14 || !v15)
      goto LABEL_44;
    if (v15 <= 0x25 && ((1 << v15) & 0x2A00119D19) != 0)
    {
      if ((v14 > 0x25) | (0x15FFEE62E6uLL >> v14) & 1)
        goto LABEL_40;
    }
    else if (!((v14 > 0x25) | (0x15FFEE62E6uLL >> v14) & 1))
    {
LABEL_40:
      if (v12 == v13)
        LODWORD(v11) = 7;
      else
        LODWORD(v11) = 8;
      goto LABEL_44;
    }
    LODWORD(v11) = 6;
    goto LABEL_44;
  }
  return (uint64_t)((v2 | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32)) << 40) >> 56;
}

- (NSLayoutConstraint)initWithCoder:(id)a3
{
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  int v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  int v25;
  unint64_t v26;
  float v27;
  void *v29;
  NSString *v30;
  uint64_t v31;
  objc_super v32;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = NSStringFromSelector(a2);
    v31 = objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ - only keyed coders are supported by %@"), v30, objc_opt_class());

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0));
  }
  v32.receiver = self;
  v32.super_class = (Class)NSLayoutConstraint;
  v6 = -[NSLayoutConstraint init](&v32, sel_init);
  v7 = (uint64_t)v6;
  if (v6)
  {
    *(_DWORD *)(v6 + 66) |= 0x40u;
    if (gLegacyDecodingOnly || !objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFirstAnchor")))
    {
      v9 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSFirstItem"));
      if (!v9)
        goto LABEL_12;
      v10 = v9;
      if (gLegacyDecodingOnly
        || (v11 = CFSTR("NSFirstAttributeV2"),
            (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFirstAttributeV2")) & 1) == 0))
      {
        v11 = CFSTR("NSFirstAttribute");
      }
      v8 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", v10, objc_msgSend(a3, "decodeIntegerForKey:", v11));
    }
    else
    {
      v8 = (id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSFirstAnchor"));
    }
    *(_QWORD *)(v7 + 16) = v8;
LABEL_12:
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSRelation")))
      v12 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSRelation")) & 3;
    else
      v12 = 0;
    *(_DWORD *)(v7 + 66) = *(_DWORD *)(v7 + 66) & 0xFFFFFFFC | v12;
    v13 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NSMultiplier"));
    LODWORD(v14) = 1.0;
    if (v13)
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSMultiplier"), v14);
      *(float *)&v14 = v14;
    }
    *(_DWORD *)(v7 + 72) = LODWORD(v14);
    if (gLegacyDecodingOnly || !objc_msgSend(a3, "containsValueForKey:", CFSTR("NSSecondAnchor")))
    {
      v16 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSSecondItem"));
      if (!v16)
        goto LABEL_27;
      v17 = v16;
      if (gLegacyDecodingOnly || (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFirstAttributeV2")) & 1) == 0)
        v18 = CFSTR("NSSecondAttribute");
      else
        v18 = CFSTR("NSSecondAttributeV2");
      v15 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", v17, objc_msgSend(a3, "decodeIntegerForKey:", v18));
    }
    else
    {
      v15 = (id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSSecondAnchor"));
    }
    *(_QWORD *)(v7 + 24) = v15;
LABEL_27:
    if (gLegacyDecodingOnly || (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFirstAttributeV2")) & 1) == 0)
      v19 = CFSTR("NSConstant");
    else
      v19 = CFSTR("NSConstantV2");
    objc_msgSend(a3, "decodeDoubleForKey:", v19);
    v21 = v20;
    v22 = 1.0;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSSymbolicConstantMultiplier")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSSymbolicConstantMultiplier"));
      v22 = v23;
    }
    -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:]((void *)v7, (id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSSymbolicConstant")), v21, v22);
    v24 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSShouldBeArchived"));
    v25 = 8;
    if (!v24)
      v25 = 0;
    v26 = *(_DWORD *)(v7 + 66) & 0xFFFFFFF7 | ((unint64_t)*(unsigned __int16 *)(v7 + 70) << 32);
    *(_DWORD *)(v7 + 66) = *(_DWORD *)(v7 + 66) & 0xFFFFFFF7 | v25;
    *(_WORD *)(v7 + 70) = WORD2(v26);
    -[NSLayoutConstraint _setIdentifier:](v7, (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutIdentifier")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSPriority")))
      v27 = (float)(int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSPriority"));
    else
      v27 = 1000.0;
    *(float *)(v7 + 76) = v27;
    ConstraintDidPerformInitialSetup(v7);
  }
  return (NSLayoutConstraint *)v7;
}

- (_NSConstraintDescriptionLayoutRuleNode)_associatedRuleNode
{
  return (_NSConstraintDescriptionLayoutRuleNode *)objc_getAssociatedObject(self, sel__associatedRuleNode);
}

- (void)_setAssociatedRuleNode:(id)a3
{
  objc_setAssociatedObject(self, sel__associatedRuleNode, a3, 0);
}

- (void)_ancestorRuleNodes
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (!a1)
    return 0;
  v1 = objc_msgSend(a1, "_associatedRuleNode");
  if (!v1)
    return (void *)MEMORY[0x1E0C9AA60];
  v2 = (void *)v1;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  do
  {
    objc_msgSend(v3, "addObject:", v2);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      break;
    v2 = (void *)objc_msgSend(v2, "parentNode");
  }
  while (v2);
  return v3;
}

- (void)sourceRuleHierarchy
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[5];

  if (!a1)
    return 0;
  v1 = -[NSLayoutConstraint _ancestorRuleNodes](a1);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_msgSend(v1, "lastObject");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__NSLayoutConstraint_NSLayoutRuleDebug__sourceRuleHierarchy__block_invoke;
  v5[3] = &unk_1E4A49010;
  v5[4] = v1;
  _NSRuleNodeAppendDebugDescription(v3, v2, 0, (uint64_t)v5);
  return v2;
}

uint64_t __60__NSLayoutConstraint_NSLayoutRuleDebug__sourceRuleHierarchy__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (double)dissatisfaction
{
  double result;

  if (!a1)
    return 0.0;
  NSLog(CFSTR("Warning: use -[NSLayoutConstraint unsatisfaction] instead of -dissatisfaction."));
  objc_msgSend(a1, "unsatisfaction");
  return result;
}

- (double)unsatisfaction
{
  return -[NSLayoutConstraint _unsatisfaction:]((id *)&self->super.isa, 0);
}

- (double)_unsatisfaction:(id *)a1
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  id *v13;
  uint64_t v14;
  double v15;
  double v17;
  double v18;
  double v19;

  if (a1)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "container"), "nsli_layoutEngine");
    if (v4)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "_markerAndPositiveExtraVar"), "shouldBeMinimized"))
      {
        objc_msgSend(v4, "valueForVariable:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
        v6 = v5 + 0.0;
        if (v5 == 0.0)
          v7 = 0;
        else
          v7 = objc_msgSend(a1, "_markerAndPositiveExtraVar");
      }
      else
      {
        v7 = 0;
        v6 = 0.0;
      }
      if (objc_msgSend(a1[7], "shouldBeMinimized"))
      {
        objc_msgSend(v4, "valueForVariable:", a1[7]);
        v6 = v6 - v8;
        if (v8 != 0.0)
          v7 = (uint64_t)a1[7];
      }
    }
    else
    {
      v7 = 0;
      v6 = 0.0;
    }
    v9 = objc_msgSend((id)objc_msgSend(v4, "_brokenConstraintPositiveErrorsIfAvailable"), "objectForKey:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
    if (v9)
    {
      objc_msgSend(v4, "valueForVariable:", v9);
      v6 = v6 + v10;
      v7 = objc_msgSend(a1, "_markerAndPositiveExtraVar");
    }
    v11 = objc_msgSend((id)objc_msgSend(v4, "_brokenConstraintNegativeErrorsIfAvailable"), "objectForKey:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
    if (v11)
    {
      objc_msgSend(v4, "valueForVariable:", v11);
      v6 = v6 - v12;
      v7 = objc_msgSend(a1, "_markerAndPositiveExtraVar");
    }
    if (!a2)
      return -v6;
    if (v7)
    {
      v13 = a1;
      v14 = v7;
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(a1, "_markerAndPositiveExtraVar"), "shouldBeMinimized"))
      {
        v14 = objc_msgSend(a1, "_markerAndPositiveExtraVar");
      }
      else
      {
        if (!objc_msgSend(a1[7], "shouldBeMinimized"))
        {
          objc_msgSend(a1, "priorityForVariable:", objc_msgSend(a1, "_markerAndPositiveExtraVar"));
          v18 = v17;
          objc_msgSend(a1, "priorityForVariable:", a1[7]);
          v15 = fmax(v18, v19);
          goto LABEL_25;
        }
        v14 = (uint64_t)a1[7];
      }
      v13 = a1;
    }
    objc_msgSend(v13, "priorityForVariable:", v14);
LABEL_25:
    *a2 = v15;
    return -v6;
  }
  return 0.0;
}

- (uint64_t)_negativeExtraVar
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)_setLoweredConstantNeedsUpdate:(BOOL)a3
{
  char *v3;
  unsigned int v4;
  unint64_t v5;
  int v6;
  unint64_t v7;

  v4 = *(_DWORD *)((char *)&self->_layoutConstraintFlags + 2);
  v3 = (char *)&self->_layoutConstraintFlags + 2;
  v5 = v4 | ((unint64_t)*((unsigned __int16 *)v3 + 2) << 32);
  v6 = 1024;
  if (!a3)
    v6 = 0;
  v7 = v5 & 0xFFFFFFFFFFFFFBFFLL;
  *(_DWORD *)v3 = v7 | v6;
  *((_WORD *)v3 + 2) = WORD2(v7);
}

- (BOOL)_loweredConstantNeedsUpdate
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 10) & 1;
}

- (BOOL)shouldBeArchived
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 3) & 1;
}

- (BOOL)_isIBPrototypingLayoutConstraint
{
  return 0;
}

- (BOOL)_existsInEngine:(id)a3
{
  id markerAndPositiveExtraVar;

  markerAndPositiveExtraVar = self->_markerAndPositiveExtraVar;
  if (markerAndPositiveExtraVar)
    return objc_msgSend(a3, "containsConstraintWithMarker:", markerAndPositiveExtraVar);
  else
    return 0;
}

- (uint64_t)setHasBeenLowered:(uint64_t)result
{
  unsigned int v2;
  unint64_t v3;
  int v4;
  unint64_t v5;

  if (result)
  {
    v2 = *(_DWORD *)(result + 66);
    result += 66;
    v3 = v2 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32);
    v4 = 16;
    if (!a2)
      v4 = 0;
    v5 = v3 & 0xFFFFFFFFFFFFFFEFLL;
    *(_DWORD *)result = v5 | v4;
    *(_WORD *)(result + 4) = WORD2(v5);
  }
  return result;
}

- (id)animations
{
  return objc_getAssociatedObject(self, CFSTR("NSLayoutConstraintToAnimationsKey"));
}

- (void)setAnimations:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("NSLayoutConstraintToAnimationsKey"), a3, (void *)0x301);
}

- (BOOL)_isFudgeable
{
  return 0;
}

- (double)_fudgeIncrement
{
  return 0.0;
}

- (double)_allowedMagnitudeForIntegralizationAdjustment
{
  return 0.0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 0;
}

- (unint64_t)_deferDTraceLogging
{
  if (result)
    return ((unint64_t)*(unsigned int *)(result + 66) >> 6) & 1;
  return result;
}

- (uint64_t)_setDeferDTraceLogging:(uint64_t)result
{
  unsigned int v2;
  unint64_t v3;
  int v4;
  unint64_t v5;

  if (result)
  {
    v2 = *(_DWORD *)(result + 66);
    result += 66;
    v3 = v2 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32);
    v4 = 64;
    if (!a2)
      v4 = 0;
    v5 = v3 & 0xFFFFFFFFFFFFFFBFLL;
    *(_DWORD *)result = v5 | v4;
    *(_WORD *)(result + 4) = WORD2(v5);
  }
  return result;
}

- (uint64_t)_primitiveConstraintType
{
  if (result)
  {
    if ((*(_DWORD *)(result + 66) & 4) != 0)
      return ((int)(*(_DWORD *)(result + 66) << 8) >> 24);
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)_setPrimitiveConstraintType:(uint64_t)result
{
  int v2;

  if (result)
  {
    v2 = *(_DWORD *)(result + 66);
    result += 66;
    *(_WORD *)(result + 4) = *(_WORD *)(result + 4);
    *(_DWORD *)result = (a2 << 16) | v2 & 0xFF00FFFF | 4;
  }
  return result;
}

- (const)_allocationDescription
{
  __CFString *v1;
  const __CFString *AssociatedObject;
  const __CFString *v3;

  if (result)
  {
    v1 = (__CFString *)result;
    if (_NSConstraintBasedLayoutTrackAllocation())
    {
      AssociatedObject = (const __CFString *)objc_getAssociatedObject(v1, CFSTR("kSavedConstraintAllocationStackKey"));
      v3 = CFSTR("Allocation stack symbols are unexpectedly missing.");
      if (AssociatedObject)
        v3 = AssociatedObject;
      return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
    }
    else
    {
      return CFSTR("Run this application with the argument '-NSConstraintBasedLayoutTrackAllocation YES' in order to enable tracking of constraint allocation.");
    }
  }
  return result;
}

- (void)_clearWeakContainerReference
{
  NSLayoutConstraint *v2;
  int v3;
  __int16 v4;

  v2 = self;
  self->_container = 0;
  -[NSLayoutConstraint _setContainerDeclaredConstraint:](self, "_setContainerDeclaredConstraint:", 0);
  v3 = *(_DWORD *)((char *)&v2->_layoutConstraintFlags + 2);
  v2 = (NSLayoutConstraint *)((char *)v2 + 66);
  v4 = WORD2(v2->super.isa);
  LODWORD(v2->super.isa) = v3 & 0xFFFFFFEF;
  WORD2(v2->super.isa) = v4;
}

- (BOOL)_containerDeclaredConstraint
{
  return ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 11) & 1;
}

+ (double)_constraintConstantLimit
{
  return 1.0e10;
}

double __79__NSLayoutConstraint__setSymbolicConstant_constant_symbolicConstantMultiplier___block_invoke(uint64_t a1)
{
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_setSymbolicConstant:", *(_QWORD *)(a1 + 40));
  -[NSLayoutConstraint _setSymbolicConstantMultiplier:](*(_WORD **)(a1 + 32), *(double *)(a1 + 48));
  result = *(double *)(a1 + 56);
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (id)_descriptionforSymbolicConstant
{
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;

  result = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant");
  if (result)
  {
    v4 = result;
    v6 = 0;
    if (-[NSLayoutConstraint _effectiveConstant:error:](self, "_effectiveConstant:error:", &v6, 0))
      return (id)objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("(%g)"), v6);
    else
      return (id)objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("(unresolvable)"), v5);
  }
  return result;
}

- (id)_constantDescriptionForDTrace
{
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  if (-[NSLayoutConstraint _effectiveConstant:error:](self, "_effectiveConstant:error:", &v4, 0))
  {
    v2 = v4;
  }
  else
  {
    v4 = 0x7FF8000000000000;
    v2 = 0x7FF8000000000000;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g"), v2, v4);
}

- (void)asciiArtDescription
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  float v13;
  float v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "_constraintType");
  v3 = (void *)objc_msgSend(a1[2], "_constraintItem");
  v4 = objc_msgSend(a1[3], "_constraintItem");
  v5 = 0;
  if (v2 <= 0xA && ((1 << v2) & 0x63C) != 0)
  {
    v5 = 0;
    if (v3)
    {
      v6 = (void *)v4;
      if (v4)
      {
        v7 = objc_msgSend(a1[2], "_constraintAttribute");
        v8 = objc_msgSend(a1[3], "_constraintAttribute");
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
        v10 = objc_msgSend(a1, "relation");
        switch(v10)
        {
          case 1:
            v11 = CFSTR(">=");
            break;
          case 0:
LABEL_13:
            if (objc_msgSend(a1, "_descriptionforSymbolicConstant"))
            {
              objc_msgSend(v9, "appendString:", objc_msgSend(a1, "_descriptionforSymbolicConstant"));
            }
            else
            {
              objc_msgSend(a1, "constant");
              objc_msgSend(v9, "appendFormat:", CFSTR("%g"), v12);
            }
            objc_msgSend(a1, "priority");
            if (v13 != 1000.0)
            {
              objc_msgSend(a1, "priority");
              objc_msgSend(v9, "appendFormat:", CFSTR("@%g"), v14);
            }
            objc_msgSend(v9, "appendString:", CFSTR(")"));
            v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v5 = v15;
            v16 = CFSTR("H:");
            if (v7 <= 0x25 && ((1 << v7) & 0x2A00119D19) != 0)
              v16 = CFSTR("V:");
            objc_msgSend(v15, "appendString:", v16);
            switch(v2)
            {
              case 2u:
                objc_msgSend(v5, "appendFormat:", CFSTR("[%@]-%@-[%@]"), objc_msgSend(v6, "nsli_description"), v9, objc_msgSend(v3, "nsli_description"));
                goto LABEL_36;
              case 3u:
                goto LABEL_27;
              case 4u:
                goto LABEL_31;
              case 5u:
                objc_msgSend(v5, "appendFormat:", CFSTR("[%@%@]"), objc_msgSend(v3, "nsli_description"), v9, v20);
                goto LABEL_36;
              case 9u:
                if (v7 > 0x25
                  || ((1 << v7) & 0x2A00119D19) == 0
                  || (objc_msgSend((id)objc_msgSend(v3, "nsli_superitem"), "nsli_isFlipped") & 1) != 0)
                {
LABEL_27:
                  v17 = v3;
                  goto LABEL_35;
                }
                v18 = v3;
                goto LABEL_33;
              case 0xAu:
                if (v8 <= 0x25 && ((1 << v8) & 0x2A00119D19) != 0 && (objc_msgSend(v3, "nsli_isFlipped") & 1) == 0)
                {
                  v17 = v6;
LABEL_35:
                  objc_msgSend(v5, "appendFormat:", CFSTR("|-%@-[%@]"), v9, objc_msgSend(v17, "nsli_description"), v20);
                }
                else
                {
LABEL_31:
                  v18 = v6;
LABEL_33:
                  objc_msgSend(v5, "appendFormat:", CFSTR("[%@]-%@-|"), objc_msgSend(v18, "nsli_description"), v9, v20);
                }
LABEL_36:
                if ((unint64_t)(v7 - 1) <= 1)
                  objc_msgSend(v5, "appendString:", CFSTR("(LTR)"));

                break;
              default:
                goto LABEL_36;
            }
            return v5;
          case -1:
            v11 = CFSTR("<=");
            break;
          default:
            v11 = CFSTR("?=");
            break;
        }
        objc_msgSend(v9, "appendString:", v11);
        goto LABEL_13;
      }
    }
  }
  return v5;
}

- (id)_priorityDescription
{
  float v3;
  void *v4;
  float v5;

  -[NSLayoutConstraint priority](self, "priority");
  if (v3 == 1000.0)
    return &stru_1E4A49B28;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NSLayoutConstraint priority](self, "priority");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("priority:%g"), v5);
}

- (id)descriptionAccessory
{
  return 0;
}

- (uint64_t)equationDescription
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const __CFString *v15;
  void *v16;
  double v17;
  uint64_t v18;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_msgSend(*(id *)(v1 + 16), "_equationDescriptionInParent");
    v4 = &stru_1E4A49B28;
    objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), &stru_1E4A49B28, v3));
    v5 = ((uint64_t)((unint64_t)*(unsigned int *)(v1 + 66) << 62) >> 62) + 1;
    if (v5 > 2)
      v6 = CFSTR("?=");
    else
      v6 = off_1E4A49398[v5];
    objc_msgSend(v2, "addObject:", v6);
    v7 = *(void **)(v1 + 24);
    if (v7)
    {
      v8 = *(float *)(v1 + 72);
      if (v8 < 0.0)
        v4 = CFSTR("-");
      v9 = objc_msgSend(v7, "_equationDescriptionInParent");
      v10 = fabsf(v8);
      if (v10 == 1.0)
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v9, v18);
      else
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%g*%@"), v4, v10, v9);
      objc_msgSend(v2, "addObject:", v11);
    }
    if (objc_msgSend((id)objc_msgSend((id)v1, "_descriptionforSymbolicConstant"), "length"))
    {
      v12 = objc_msgSend((id)v1, "_descriptionforSymbolicConstant");
LABEL_22:
      objc_msgSend(v2, "addObject:", v12);
      return objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
    }
    if (*(_QWORD *)(v1 + 24))
    {
      objc_msgSend((id)v1, "constant");
      if (v13 == 0.0)
        return objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
    }
    objc_msgSend((id)v1, "constant");
    if (v14 >= 0.0)
    {
      if (!*(_QWORD *)(v1 + 24))
      {
LABEL_21:
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)v1, "constant");
        v12 = objc_msgSend(v16, "stringWithFormat:", CFSTR("%g"), fabs(v17));
        goto LABEL_22;
      }
      v15 = CFSTR("+");
    }
    else
    {
      v15 = CFSTR("-");
    }
    objc_msgSend(v2, "addObject:", v15);
    goto LABEL_21;
  }
  return result;
}

- (uint64_t)_deallocSafeDescription
{
  void *v1;
  void *v2;
  objc_class *v3;
  const char *Name;
  uint64_t v5;
  const __CFString *v6;

  if (result)
  {
    v1 = (void *)result;
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = objc_msgSend(v1, "identifier");
    v6 = &stru_1E4A49B28;
    if (v5)
      v6 = (const __CFString *)v5;
    return objc_msgSend(v2, "stringWithFormat:", CFSTR("<%s:%p %@>"), Name, v1, v6);
  }
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  id secondAnchor;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "addObject:", objc_msgSend(v4, "stringWithFormat:", CFSTR("<%s:%p"), class_getName(v5), self));
  v6 = -[NSLayoutConstraint descriptionAccessory](self, "descriptionAccessory");
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  if (-[NSLayoutConstraint identifier](self, "identifier"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), -[NSLayoutConstraint identifier](self, "identifier")));
  v7 = (uint64_t)-[NSLayoutConstraint asciiArtDescription]((id *)&self->super.isa);
  if (!v7)
    v7 = -[NSLayoutConstraint equationDescription]((uint64_t)self);
  objc_msgSend(v3, "addObject:", v7);
  v8 = -[NSLayoutConstraint _priorityDescription](self, "_priorityDescription");
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v3, "addObject:", v8);
  v9 = -[NSLayoutConstraint _constraintType](self, "_constraintType") - 3;
  if (v9 <= 7 && ((0xC3u >> v9) & 1) != 0)
    v10 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.isa + qword_1A373F460[v9]), "_constraintItem"), "nsli_superitem");
  else
    v10 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", objc_msgSend(self->_firstAnchor, "_equationDescriptionLegendEntries"));
  secondAnchor = self->_secondAnchor;
  if (secondAnchor)
    objc_msgSend(v11, "unionOrderedSet:", objc_msgSend(secondAnchor, "_equationDescriptionLegendEntries"));
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_msgSend(v10, "nsli_descriptionIncludesPointer");
    v15 = (void *)objc_msgSend(v10, "nsli_description");
    if ((v14 & 1) == 0)
      v15 = (void *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(":%p"), v10);
    objc_msgSend(v11, "addObject:", objc_msgSend(v13, "stringWithFormat:", CFSTR("'|':%@"), v15));
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  if (-[NSLayoutConstraint isActive](self, "isActive"))
    v17 = CFSTR("active");
  else
    v17 = CFSTR("inactive");
  v18 = objc_msgSend(v11, "count");
  v19 = CFSTR(",");
  if (!v18)
    v19 = CFSTR(")");
  objc_msgSend(v3, "addObject:", objc_msgSend(v16, "stringWithFormat:", CFSTR("  (%@%@"), v17, v19));
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("names:"));
    objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend(v11, "array"), "componentsJoinedByString:", CFSTR(", ")));
    objc_msgSend(v3, "addObject:", CFSTR(")"));
  }
  return (NSString *)objc_msgSend((id)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" ")), "stringByAppendingString:", CFSTR(">"));
}

+ (void)_setLegacyDecodingOnly:(BOOL)a3
{
  gLegacyDecodingOnly = a3;
}

- (void)encodeWithCoder:(id)a3
{
  double constant;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  double v13;
  float coefficient;
  id secondAnchor;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  double v21;
  id v22;
  double v23;
  float priority;
  id v25;
  void *v26;
  NSString *v27;
  void *v28;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = NSStringFromSelector(a2);
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ - only keyed coders are supported by %@"), v27, objc_opt_class()), 0);
    objc_exception_throw(v28);
  }
  constant = self->_constant;
  v7 = (void *)objc_msgSend(self->_firstAnchor, "_constraintItem");
  v8 = objc_msgSend(self->_firstAnchor, "_constraintAttribute");
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_firstAnchor, CFSTR("NSFirstAnchor"));
  }
  else
  {
    v10 = v8;
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSFirstItem"));
    objc_msgSend(a3, "encodeInteger:forKey:", v10, CFSTR("NSFirstAttributeV2"));
    v11 = v10;
    if ((v10 - 13) <= 7)
    {
      v11 = v10;
      if ((unint64_t)(v10 - 13) <= 7)
        v11 = qword_1A373F4A0[v10 - 13];
    }
    objc_msgSend(a3, "encodeInteger:forKey:", v11, CFSTR("NSFirstAttribute"));
    v12 = objc_opt_respondsToSelector();
    if ((v10 - 13) <= 7 && (v12 & 1) != 0)
    {
      objc_msgSend(v7, "nsli_marginOffsetForAttribute:", v10);
      constant = constant - v13;
    }
  }
  if ((((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 46) & 0xC00000000000) != 0)
    objc_msgSend(a3, "encodeInt:forKey:", (uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62, CFSTR("NSRelation"));
  coefficient = self->_coefficient;
  if (coefficient != 1.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSMultiplier"), coefficient);
  secondAnchor = self->_secondAnchor;
  if (secondAnchor)
  {
    v16 = (void *)objc_msgSend(secondAnchor, "_constraintItem");
    v17 = objc_msgSend(self->_secondAnchor, "_constraintAttribute");
    if (v16 && (v18 = v17) != 0)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v16, CFSTR("NSSecondItem"));
      objc_msgSend(a3, "encodeInteger:forKey:", v18, CFSTR("NSSecondAttributeV2"));
      v19 = v18;
      if ((v18 - 13) <= 7)
      {
        v19 = v18;
        if ((unint64_t)(v18 - 13) <= 7)
          v19 = qword_1A373F4A0[v18 - 13];
      }
      objc_msgSend(a3, "encodeInteger:forKey:", v19, CFSTR("NSSecondAttribute"));
      v20 = objc_opt_respondsToSelector();
      if ((v18 - 13) <= 7 && (v20 & 1) != 0)
      {
        objc_msgSend(v16, "nsli_marginOffsetForAttribute:", v18);
        constant = constant + v21;
      }
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:", self->_secondAnchor, CFSTR("NSSecondAnchor"));
    }
  }
  if (self->_constant != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSConstantV2"));
  v22 = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant");
  if (v22)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v22, CFSTR("NSSymbolicConstant"));
    -[NSLayoutConstraint symbolicConstantMultiplier](self, "symbolicConstantMultiplier");
    if (v23 != 1.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSSymbolicConstantMultiplier"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", ((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) >> 3) & 1, CFSTR("NSShouldBeArchived"));
  priority = self->_priority;
  if (priority != 1000.0)
    objc_msgSend(a3, "encodeInt:forKey:", (int)priority, CFSTR("NSPriority"));
  v25 = -[NSLayoutConstraint _identifier](self, "_identifier");
  if (v25)
    objc_msgSend(a3, "encodeObject:forKey:", v25, CFSTR("NSLayoutIdentifier"));
  if (constant != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSConstant"), constant);
}

- (id)_constraintByReplacingItem:(id)a3 withItem:(id)a4
{
  NSLayoutConstraint *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;

  v6 = self;
  if (-[NSLayoutConstraint firstItem](self, "firstItem") == a3
    || -[NSLayoutConstraint secondItem](v6, "secondItem") == a3)
  {
    v7 = a4;
    if (-[NSLayoutConstraint firstItem](v6, "firstItem") != a3)
      v7 = -[NSLayoutConstraint firstItem](v6, "firstItem");
    if (-[NSLayoutConstraint secondItem](v6, "secondItem") != a3)
      a4 = -[NSLayoutConstraint secondItem](v6, "secondItem");
    v8 = -[NSLayoutConstraint _symbolicConstant](v6, "_symbolicConstant");
    v9 = (void *)objc_opt_class();
    v10 = -[NSLayoutConstraint firstAttribute](v6, "firstAttribute");
    v11 = -[NSLayoutConstraint relation](v6, "relation");
    v12 = -[NSLayoutConstraint secondAttribute](v6, "secondAttribute");
    -[NSLayoutConstraint multiplier](v6, "multiplier");
    v14 = v13;
    if (v8)
    {
      v15 = -[NSLayoutConstraint _symbolicConstant](v6, "_symbolicConstant");
      -[NSLayoutConstraint symbolicConstantMultiplier](v6, "symbolicConstantMultiplier");
      v17 = objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:symbolicConstant:symbolicConstantMultiplier:", v7, v10, v11, a4, v12, v15, v14, v16);
    }
    else
    {
      -[NSLayoutConstraint constant](v6, "constant");
      v17 = objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, v10, v11, a4, v12, v14, v18);
    }
    v19 = (void *)v17;
    -[NSLayoutConstraint priority](v6, "priority");
    objc_msgSend(v19, "setPriority:");
    objc_msgSend(v19, "setShouldBeArchived:", -[NSLayoutConstraint shouldBeArchived](v6, "shouldBeArchived"));
    objc_msgSend(v19, "setIdentifier:", -[NSLayoutConstraint identifier](v6, "identifier"));
    objc_msgSend(v19, "setAnimations:", -[NSLayoutConstraint animations](v6, "animations"));
    return v19;
  }
  return v6;
}

- (NSSet)_referencedLayoutItems
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 2, 0);
  -[NSLayoutAnchor _accumulateReferenceLayoutItemsIntoTable:](-[NSLayoutConstraint firstAnchor](self, "firstAnchor"), "_accumulateReferenceLayoutItemsIntoTable:", v3);
  -[NSLayoutAnchor _accumulateReferenceLayoutItemsIntoTable:](-[NSLayoutConstraint secondAnchor](self, "secondAnchor"), "_accumulateReferenceLayoutItemsIntoTable:", v3);
  return (NSSet *)objc_msgSend(v3, "setRepresentation");
}

- (BOOL)_describesSameRestrictionAsConstraint:(id)a3
{
  return -[NSLayoutConstraint _isEqualToConstraintValue:includingConstant:includeOtherMutableProperties:](self, "_isEqualToConstraintValue:includingConstant:includeOtherMutableProperties:", a3, 1, 1);
}

- (unint64_t)_constraintValueHashIncludingConstant:(BOOL)a3 includeOtherMutableProperties:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double constant;
  uint64_t v8;
  float coefficient;
  float priority;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  constant = self->_constant;
  if (a3)
    v8 = objc_msgSend(-[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), "hash");
  else
    v8 = 0;
  coefficient = self->_coefficient;
  priority = self->_priority;
  v11 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  v12 = objc_msgSend(self->_firstAnchor, "hash");
  v13 = objc_msgSend(self->_secondAnchor, "hash");
  if (v4)
  {
    v14 = objc_msgSend(-[NSLayoutConstraint _identifier](self, "_identifier"), "hash");
    v15 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
    v16 = objc_msgSend(-[NSLayoutConstraint animations](self, "animations"), "hash");
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = *(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) | ((unint64_t)HIWORD(self->_layoutConstraintFlags) << 32);
  }
  return _NSLayoutConstraintComparableHash(v5, v4, v8, (uint64_t)(v11 << 62) >> 62, v12, v13, v14, (v15 >> 3) & 1, constant, coefficient, priority, v16);
}

- (void)_setMutablePropertiesFromConstraint:(id)a3
{
  char isKindOfClass;
  double constant;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  char v14;
  double v15;
  double v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  isKindOfClass = objc_opt_isKindOfClass();
  constant = self->_constant;
  objc_msgSend(a3, "constant");
  if (constant != v7
    || ((v8 = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant"), (isKindOfClass & 1) == 0)
     && (objc_opt_respondsToSelector() & 1) == 0
      ? (v9 = 0)
      : (v9 = objc_msgSend(a3, "_symbolicConstant")),
        v8 != (id)v9 && (objc_msgSend(v8, "isEqual:") & 1) == 0))
  {
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(a3, "_symbolicConstant");
      objc_msgSend(a3, "constant");
      v12 = v11;
      if ((isKindOfClass & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(a3, "constant");
      v12 = v13;
      v10 = 0;
    }
    v14 = objc_opt_respondsToSelector();
    v15 = 1.0;
    if ((v14 & 1) == 0)
    {
LABEL_15:
      -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](self, v10, v12, v15);
      goto LABEL_16;
    }
LABEL_14:
    objc_msgSend(a3, "symbolicConstantMultiplier");
    v15 = v16;
    goto LABEL_15;
  }
LABEL_16:
  v17 = -[NSLayoutConstraint identifier](self, "identifier");
  if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(a3, "_identifier");
  else
    v18 = 0;
  if (v17 != (NSString *)v18 && (-[NSString isEqual:](v17, "isEqual:") & 1) == 0)
  {
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(a3, "_identifier");
    else
      v19 = 0;
    -[NSLayoutConstraint setIdentifier:](self, "setIdentifier:", v19);
  }
  if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(a3, "shouldBeArchived");
  else
    v20 = 0;
  -[NSLayoutConstraint setShouldBeArchived:](self, "setShouldBeArchived:", v20);
  v21 = -[NSLayoutConstraint animations](self, "animations");
  if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v22 = objc_msgSend(a3, "animations");
  else
    v22 = 0;
  if (v21 != (id)v22 && (objc_msgSend(v21, "isEqual:") & 1) == 0)
  {
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v23 = objc_msgSend(a3, "animations");
    else
      v23 = 0;
    -[NSLayoutConstraint setAnimations:](self, "setAnimations:", v23);
  }
}

- (id)_constraintValueCopy
{
  char *v3;
  id v4;
  double constant;
  double v6;
  double v7;

  v3 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v3 + 66) |= 0x40u;
  objc_msgSend(v3, "_setFirstAnchor:", self->_firstAnchor);
  objc_msgSend(v3, "_setRelation:", (uint64_t)((unint64_t)*(unsigned int *)((char *)&self->_layoutConstraintFlags + 2) << 62) >> 62);
  objc_msgSend(v3, "_setMultiplier:", self->_coefficient);
  objc_msgSend(v3, "_setSecondAnchor:", self->_secondAnchor);
  v4 = -[NSLayoutConstraint _symbolicConstant](self, "_symbolicConstant");
  constant = self->_constant;
  -[NSLayoutConstraint symbolicConstantMultiplier](self, "symbolicConstantMultiplier");
  -[NSLayoutConstraint _setSymbolicConstant:constant:symbolicConstantMultiplier:](v3, v4, constant, v6);
  *(float *)&v7 = self->_priority;
  objc_msgSend(v3, "setPriority:", v7);
  objc_msgSend(v3, "setIdentifier:", -[NSLayoutConstraint _identifier](self, "_identifier"));
  objc_msgSend(v3, "setShouldBeArchived:", -[NSLayoutConstraint shouldBeArchived](self, "shouldBeArchived"));
  objc_msgSend(v3, "setAnimations:", -[NSLayoutConstraint animations](self, "animations"));
  ConstraintDidPerformInitialSetup((uint64_t)v3);
  return v3;
}

- (CGSize)_engineToContainerScalingCoefficients
{
  id container;
  double v3;
  double v4;
  CGSize result;

  container = self->_container;
  if (container)
  {
    objc_msgSend(container, "nsli_convertSizeFromEngineSpace:", 1.0, 1.0);
  }
  else
  {
    v3 = 1.0;
    v4 = 1.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_loweredExpression
{
  NSISEngine *v3;
  NSISLinearExpression *v4;

  v3 = (NSISEngine *)objc_msgSend(self->_container, "nsli_layoutEngine");
  if (!v3)
    v3 = objc_alloc_init(NSISEngine);
  v4 = -[NSISLinearExpression initWithEngine:]([NSISLinearExpression alloc], "initWithEngine:", v3);
  if (-[NSLayoutConstraint _lowerIntoExpression:reportingConstantIsRounded:](self, "_lowerIntoExpression:reportingConstantIsRounded:", v4, 0))
  {
    return v4;
  }
  else
  {
    return 0;
  }
}

- (void)_tryToActivateMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[NSLayoutConstraint isActive](self, "isActive"))
  {
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot _tryToActivateMeasuringErrors:andMutuallyExclusiveConstraints:, constraint %@ is already active."), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v26, 0));
  }
  v7 = (void *)objc_msgSend((id)-[NSLayoutConstraint _layoutEngine]((uint64_t)self), "constraints");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "unsatisfaction");
        if (v14 != 0.0)
        {
          *(float *)&v14 = v14;
          objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), v13);
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }
  v31 = 0;
  -[NSLayoutConstraint _setActive:mutuallyExclusiveConstraints:](self, "_setActive:mutuallyExclusiveConstraints:", 1, &v31);
  if (objc_msgSend(v31, "count"))
  {
    if (a4)
      *a4 = v31;
    if (a3)
LABEL_15:
      *a3 = 0;
  }
  else
  {
    v15 = (void *)objc_msgSend((id)-[NSLayoutConstraint _layoutEngine]((uint64_t)self), "constraints");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v20, "unsatisfaction");
          v22 = v21;
          objc_msgSend((id)objc_msgSend(v8, "objectForKey:", v20), "floatValue");
          v24 = v22 - v23;
          objc_msgSend(v8, "removeObjectForKey:", v20);
          if (v24 != 0.0)
          {
            *(float *)&v25 = v24;
            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25), v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v17);
    }
    -[NSLayoutConstraint setActive:](self, "setActive:", 0);
    if (a3)
      *a3 = v8;
    a3 = a4;
    if (a4)
      goto LABEL_15;
  }
}

- (void)_forceSatisfactionMeasuringUnsatisfactionChanges:(id *)a3 andMutuallyExclusiveConstraints:(id *)a4
{
  id firstAnchor;
  NSLayoutRelation v8;
  id secondAnchor;
  double v10;
  double v11;
  double v12;
  NSLayoutConstraint *v13;
  double v14;
  id v15;

  firstAnchor = self->_firstAnchor;
  v8 = -[NSLayoutConstraint relation](self, "relation");
  secondAnchor = self->_secondAnchor;
  -[NSLayoutConstraint multiplier](self, "multiplier");
  v11 = v10;
  -[NSLayoutConstraint constant](self, "constant");
  v13 = +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", firstAnchor, v8, secondAnchor, v11, v12);
  LODWORD(v14) = 1148846080;
  -[NSLayoutConstraint setPriority:](v13, "setPriority:", v14);
  -[NSLayoutConstraint _tryToActivateMeasuringUnsatisfactionChanges:andMutuallyExclusiveConstraints:](v13, "_tryToActivateMeasuringUnsatisfactionChanges:andMutuallyExclusiveConstraints:", a3, a4);
  if (*a4)
  {
    v15 = (id)objc_msgSend(*a4, "mutableCopy");
    objc_msgSend(v15, "removeObject:", v13);
    *a4 = v15;
  }
}

- (id)_explainUnsatisfaction
{
  return -[NSLayoutConstraintExplainer initWithConstraint:]([NSLayoutConstraintExplainer alloc], "initWithConstraint:", self);
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  NSString *v9;
  uint64_t v11;

  if (self->_markerAndPositiveExtraVar == a3)
  {
    if (objc_msgSend(a3, "valueRestriction") == 2)
    {
      v5 = CFSTR("marker");
    }
    else
    {
      if (objc_msgSend(a3, "shouldBeMinimized"))
      {
        v6 = objc_msgSend(self->_negativeExtraVar, "shouldBeMinimized");
        v7 = CFSTR("errorMarker");
        v8 = CFSTR("posErrorMarker");
LABEL_10:
        if (v6)
          v5 = v8;
        else
          v5 = v7;
        goto LABEL_15;
      }
      v5 = CFSTR("slackMarker");
    }
  }
  else
  {
    if (self->_negativeExtraVar != a3)
    {
      _NSLayoutConstraintDelegateCallFromUnknownVariable();
      v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown var (bug!):%p>"), a3);
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "shouldBeMinimized"))
    {
      v6 = objc_msgSend(self->_markerAndPositiveExtraVar, "shouldBeMinimized");
      v7 = CFSTR("error");
      v8 = CFSTR("negError");
      goto LABEL_10;
    }
    v5 = CFSTR("slack");
  }
LABEL_15:
  v9 = -[NSLayoutConstraint identifier](self, "identifier");
  if (v9)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p:%@.%@"), self, v9, v5);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p.%@"), self, v5, v11);
}

- (BOOL)_nsib_isRedundantInEngine:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t i;
  BOOL v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[7];
  unsigned __int8 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  objc_msgSend(a3, "optimize");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = +[NSISLinearExpression acquireFromPoolForUseCase:engine:](NSISLinearExpression, "acquireFromPoolForUseCase:engine:", 0, a3);
  -[NSLayoutConstraint _lowerIntoExpression:reportingConstantIsRounded:](self, "_lowerIntoExpression:reportingConstantIsRounded:", v7, &v38);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __48__NSLayoutConstraint__nsib_isRedundantInEngine___block_invoke;
  v37[3] = &unk_1E4A49270;
  v37[4] = v5;
  v37[5] = v6;
  v37[6] = a3;
  objc_msgSend(v7, "enumerateVariables:", v37);
  objc_msgSend(v7, "returnToPool");
  -[NSLayoutConstraint _removeFromEngine:](self, "_removeFromEngine:", a3);
  objc_msgSend(a3, "optimize");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10 + v12), "doubleValue");
        v15 = v14;
        objc_msgSend(a3, "valueForVariable:", v13);
        if (v16 == 0.0)
        {
          v17 = fabs(v15);
          v18 = *(double *)&NSISEpsilon;
          goto LABEL_8;
        }
        v19 = fabs(v16);
        if (v15 != 0.0)
        {
          v17 = vabdd_f64(v16, v15);
          v18 = v19 * *(double *)&NSISEpsilon;
LABEL_8:
          if (v17 >= v18)
            goto LABEL_25;
          goto LABEL_12;
        }
        if (v19 >= *(double *)&NSISEpsilon)
        {
LABEL_25:
          v26 = 0;
          goto LABEL_26;
        }
LABEL_12:
        ++v12;
      }
      while (v9 != v12);
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      v9 = v20;
      v10 += v12;
    }
    while (v20);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    v24 = 0x1E4A47000uLL;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(a3, "valueOfVariableIsAmbiguous:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i)) & 1) != 0)
        {
          v26 = 0;
          goto LABEL_28;
        }
      }
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      v26 = 1;
      if (v22)
        continue;
      break;
    }
  }
  else
  {
    v26 = 1;
LABEL_26:
    v24 = 0x1E4A47000;
  }
LABEL_28:
  v27 = (void *)objc_msgSend(*(id *)(v24 + 3944), "acquireFromPoolForUseCase:engine:", 0, a3);
  -[NSLayoutConstraint _lowerIntoExpression:reportingConstantIsRounded:](self, "_lowerIntoExpression:reportingConstantIsRounded:", v27, &v38);
  -[NSLayoutConstraint _addLoweredExpression:toEngine:lastLoweredConstantWasRounded:mutuallyExclusiveConstraints:]((uint64_t)self, v27, a3, v38, 0);
  objc_msgSend(v27, "returnToPool");

  return v26;
}

uint64_t __48__NSLayoutConstraint__nsib_isRedundantInEngine___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  void *v6;

  result = objc_msgSend(a2, "valueIsUserVisible");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "valueForVariable:", a2);
    return objc_msgSend(v6, "addObject:", objc_msgSend(v5, "numberWithDouble:"));
  }
  return result;
}

- (BOOL)_nsib_isRedundant
{
  return -[NSLayoutConstraint _nsib_isRedundantInEngine:](self, "_nsib_isRedundantInEngine:", objc_msgSend(-[NSLayoutConstraint container](self, "container"), "nsli_layoutEngine"));
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 symbolicConstant:(id)a9
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:symbolicConstant:symbolicConstantMultiplier:", a3, a4, a5, a6, a7, a9, a8, 1.0);
}

+ (NSLayoutConstraint)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, a8, 0.0);
}

+ (NSLayoutConstraint)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 constant:(double)a5
{
  return (NSLayoutConstraint *)objc_msgSend(a1, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", a3, a4, 0, 0.0, a5);
}

@end

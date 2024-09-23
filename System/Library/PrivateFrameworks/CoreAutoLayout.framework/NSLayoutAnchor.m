@implementation NSLayoutAnchor

- (int64_t)_constraintAttribute
{
  return self->_attr;
}

- (NSLayoutAnchor)initWithItem:(id)a3 attribute:(int64_t)a4
{
  uint64_t v8;
  NSLayoutAnchor *result;
  void *v10;
  objc_class *v11;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 540, CFSTR("NSLayoutAnchor cannot be created without an item."));
  v8 = objc_opt_class();
  if (v8 != _AnchorClassForAttribute(a4))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 541, CFSTR("%@ cannot create anchor for proxy attribute %d with item %@"), NSStringFromClass(v11), a4, a3);
  }
  result = -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", 0, a3, a4);
  if (result)
    *((_BYTE *)result + 56) = *((_BYTE *)result + 56) & 0xFC | 2;
  return result;
}

- (NSLayoutAnchor)initWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  NSLayoutAnchor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSLayoutAnchor;
  v8 = -[NSLayoutAnchor init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    v8->_referenceItem = a4;
    v8->_attr = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_referenceItem = 0;

  self->_variable = 0;
  self->_name = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutAnchor;
  -[NSLayoutAnchor dealloc](&v3, sel_dealloc);
}

- (id)_constraintItem
{
  return self->_referenceItem;
}

- (id)_referencedLayoutItems
{
  id cachedReferenceItems;

  cachedReferenceItems = self->_cachedReferenceItems;
  if (!cachedReferenceItems)
  {
    cachedReferenceItems = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 2, 0);
    -[NSLayoutAnchor _accumulateReferenceLayoutItemsIntoTable:](self, "_accumulateReferenceLayoutItemsIntoTable:", cachedReferenceItems);
    self->_cachedReferenceItems = cachedReferenceItems;
  }
  return cachedReferenceItems;
}

- (void)_accumulateReferenceLayoutItemsIntoTable:(id)a3
{
  int64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = -[NSLayoutAnchor _anchorType](self, "_anchorType");
  if (v6)
  {
    if (v6 == 1)
    {
      v7 = -[NSLayoutAnchor _referenceItem](self, "_referenceItem");
    }
    else
    {
      if (v6 != 2)
        return;
      v7 = -[NSLayoutAnchor _proxiedItem](self, "_proxiedItem");
    }
    objc_msgSend(a3, "addObject:", v7);
  }
  else if (self->_cachedReferenceItems)
  {
    objc_msgSend(a3, "unionHashTable:");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)-[NSLayoutAnchor _childAnchors](self, "_childAnchors");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_accumulateReferenceLayoutItemsIntoTable:", a3);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }
  }
  else
  {
  }
}

- (BOOL)nsli_lowerIntoExpression:(id)a3 withCoefficient:(double)a4 forConstraint:(id)a5
{
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  id v19;
  id v20;
  double v21;
  double v22;
  _QWORD v23[3];
  double v24;

  v9 = objc_msgSend(a5, "container");
  v10 = -[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem");
  if ((NSLayoutAnchor *)objc_msgSend(a5, "firstAnchor") == self)
    v11 = (void *)objc_msgSend(a5, "secondAnchor");
  else
    v11 = (void *)objc_msgSend(a5, "firstAnchor");
  v12 = v11;
  v13 = objc_msgSend(v11, "_nearestAncestorLayoutItem");
  if (nsli_lowerIntoExpression_withCoefficient_forConstraint__once != -1)
    dispatch_once(&nsli_lowerIntoExpression_withCoefficient_forConstraint__once, &__block_literal_global_7);
  if ((objc_msgSend(v12, "isCompatibleWithAnchor:", self) & 1) == 0
    && !-[NSLayoutAnchor isCompatibleWithAnchor:](self, "isCompatibleWithAnchor:", v12))
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Constraint improperly relates anchors of incompatible types: %@"), a5);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidLayoutConstraintException"), v15, 0));
  }
  if (v9)
    v14 = (void *)v9;
  else
    v14 = v10;
  objc_msgSend(v14, "nsli_engineToUserScalingCoefficients");
  v17 = v16;
  if (-[NSLayoutAnchor _anchorType](self, "_anchorType") == 2)
    return objc_msgSend(-[NSLayoutAnchor _proxiedItem](self, "_proxiedItem"), "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:", -[NSLayoutAnchor _proxiedAttribute](self, "_proxiedAttribute"), a3, a5, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = (id)objc_msgSend(v10, "nsli_itemDescribingLayoutDirectionForConstraint:toItem:", a5, v13);
  else
    v19 = +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", v10, v13);
  v24 = 0.0;
  v23[0] = _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(self, v12, 0, v19, &v24);
  v23[1] = objc_msgSend(a5, "container");
  v23[2] = objc_msgSend(a3, "engine");
  v20 = -[NSLayoutAnchor _expressionInContext:](self, "_expressionInContext:", v23);
  objc_msgSend(v20, "constant");
  v22 = v21;
  objc_msgSend(v20, "incrementConstant:", -v21);
  objc_msgSend(a3, "addExpression:times:", v20, v17 * v24 * a4);
  objc_msgSend(a3, "incrementConstant:", v22 * (v24 * a4));
  return 1;
}

- (id)_nearestAncestorLayoutItem
{
  int64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[NSLayoutAnchor _anchorType](self, "_anchorType");
  if (v3)
  {
    if (v3 == 1)
      return -[NSLayoutAnchor _referenceItem](self, "_referenceItem");
    if (v3 == 2)
      return -[NSLayoutAnchor _proxiedItem](self, "_proxiedItem");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[NSLayoutAnchor _referencedLayoutItems](self, "_referencedLayoutItems", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v5);
          if ((v9 & 1) != 0)
          {
            if (v8)
              v8 = +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", v8, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          }
          else
          {
            v8 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
          }
          v9 = 1;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
      return v8;
    }
  }
  return 0;
}

- (id)_proxiedItem
{
  if (-[NSLayoutAnchor _anchorType](self, "_anchorType") != 2)
  return self->_referenceItem;
}

- (int64_t)_anchorType
{
  return *((_BYTE *)self + 56) & 3;
}

- (int64_t)_proxiedAttribute
{
  if (-[NSLayoutAnchor _anchorType](self, "_anchorType") != 2)
  return self->_attr;
}

- (id)_referenceItem
{
  if (-[NSLayoutAnchor _anchorType](self, "_anchorType") != 1)
  return self->_referenceItem;
}

+ (id)_anchorForItem:(id)a3 attribute:(int64_t)a4
{
  id result;
  uint64_t v7;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLayoutAnchor.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)objc_msgSend(a3, "nsli_layoutAnchorForAttribute:", a4)) == 0)
  {
    if ((unint64_t)(a4 - 1) > 9)
      return (id)objc_msgSend((id)_AnchorClassForAttribute(a4), "anchorWithItem:attribute:", a3, a4);
    v7 = (uint64_t)*off_1E4A49420[a4 - 1];
    if (!v7)
      return (id)objc_msgSend((id)_AnchorClassForAttribute(a4), "anchorWithItem:attribute:", a3, a4);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return (id)objc_msgSend((id)_AnchorClassForAttribute(a4), "anchorWithItem:attribute:", a3, a4);
    result = (id)objc_msgSend(a3, "performSelector:", v7);
    if (!result)
      return (id)objc_msgSend((id)_AnchorClassForAttribute(a4), "anchorWithItem:attribute:", a3, a4);
  }
  return result;
}

+ (NSLayoutAnchor)anchorWithItem:(id)a3 attribute:(int64_t)a4
{
  return (NSLayoutAnchor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithItem:attribute:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
    return self;
  else
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAnchor:", self);
}

- (NSLayoutAnchor)init
{
  return -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", 0, 0, 0);
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 0, anchor, 1.0, 0.0);
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 0, anchor, 1.0, c);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 1, anchor, 1.0, 0.0);
}

+ (id)anchorNamed:(id)a3 inItem:(id)a4
{
  return (id)objc_msgSend(a1, "anchorNamed:inItem:symbolicAttribute:", a3, a4, 0);
}

+ (id)anchorNamed:(id)a3 inItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLayoutAnchor.m"), 570, CFSTR("NSLayoutAnchor cannot be created without an name."));
    if (a4)
      return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndependentVariableName:item:symbolicAttribute:", a3, a4, a5);
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLayoutAnchor.m"), 571, CFSTR("NSLayoutAnchor cannot be created without an item."));
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndependentVariableName:item:symbolicAttribute:", a3, a4, a5);
  }
  if (!a4)
    goto LABEL_5;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndependentVariableName:item:symbolicAttribute:", a3, a4, a5);
}

- (NSLayoutAnchor)initWithIndependentVariableName:(id)a3 item:(id)a4 symbolicAttribute:(int64_t)a5
{
  NSLayoutAnchor *result;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(a4, "nsli_canHostIndependentVariableAnchor") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 577, CFSTR("NSLayoutAnchor must be related to a view."));
  if (!objc_msgSend(a3, "length"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 578, CFSTR("NSLayoutAnchor should have a name describing the geometry it represents."));
  result = -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", a3, a4, a5);
  if (result)
    *((_BYTE *)result + 56) = *((_BYTE *)result + 56) & 0xFC | 1;
  return result;
}

- (id)_expressionInContext:(id *)a3
{
  int64_t v6;
  id v7;
  int64_t v8;
  id v9;
  NSLayoutConstraint *v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id var1;
  id v21;
  uint64_t v22;
  double v23;

  v6 = -[NSLayoutAnchor _anchorType](self, "_anchorType");
  if (v6)
  {
    if (v6 == 1)
    {
      a2 = (SEL)+[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", 1, a3->var2);
      objc_msgSend((id)a2, "addVariable:coefficient:", -[NSLayoutAnchor _anchorVariable]((NSISVariable *)self), 1.0);
      v19 = -[NSLayoutAnchor _referenceItem](self, "_referenceItem");
      var1 = a3->var1;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v19, "nsli_lowersExpressionRelativeToConstraintContainer"))
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v19 != var1)
          {
            do
            {
              v21 = (id)objc_msgSend(v19, "nsli_superitem");
              if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v21, "nsli_isFlipped"))
              {
                objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v21, "nsli_boundsHeightVariable"), 1.0);
                objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v19, "nsli_minYVariable"), -1.0);
                v22 = objc_msgSend(v19, "nsli_boundsHeightVariable");
                v23 = -1.0;
              }
              else
              {
                v22 = objc_msgSend(v19, "nsli_minYVariable");
                v23 = 1.0;
              }
              objc_msgSend((id)a2, "addVariable:coefficient:", v22, v23);
              v19 = v21;
            }
            while (v21 != var1);
          }
        }
        else if ((objc_opt_isKindOfClass() & 1) != 0 && v19 != var1)
        {
          do
          {
            objc_msgSend((id)a2, "addVariable:coefficient:", objc_msgSend(v19, "nsli_minXVariable"), 1.0);
            v19 = (id)objc_msgSend(v19, "nsli_superitem");
          }
          while (v19 != var1);
        }
      }
    }
    else if (v6 == 2)
    {
      v7 = -[NSLayoutAnchor _proxiedItem](self, "_proxiedItem");
      v8 = -[NSLayoutAnchor _proxiedAttribute](self, "_proxiedAttribute");
      v9 = a3->var1;
      a2 = -[NSISLinearExpression initWithEngine:]([NSISLinearExpression alloc], "initWithEngine:", a3->var2);
      v10 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v7, v8, 0, v7, v8);
      -[NSLayoutConstraint setContainer:](v10, "setContainer:", v9);
      v11 = 1.0;
      objc_msgSend(v7, "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:", v8, a2, v10, 1.0);
      v12 = -[NSLayoutConstraint container](v10, "container");
      if (!v12)
        v12 = v7;
      objc_msgSend(v12, "nsli_engineToUserScalingCoefficients");
      v14 = v13;
      v16 = v15;
      if (objc_msgSend(v7, "nsli_isRTL") && (v8 - 5) <= 0xE)
        v11 = dbl_1A373F5A0[(int)v8 - 5];
      if ((v8 > 0x25) | (0x15FFEE62E6uLL >> v8) & 1)
        v16 = v14;
      objc_msgSend((id)a2, "constant");
      v18 = v17;
      objc_msgSend((id)a2, "incrementConstant:", -v17);
      objc_msgSend((id)a2, "scaleBy:", v11 / v16);
      objc_msgSend((id)a2, "incrementConstant:", v18);
    }
  }
  else
  {
    return 0;
  }
  return (id)a2;
}

- (NSISVariable)_anchorVariable
{
  NSISVariable *v1;

  if (result)
  {
    v1 = result;
    if (-[NSISVariable _anchorType](result, "_anchorType") != 1)
    result = (NSISVariable *)v1->_engines[0];
    if (!result)
    {
      result = +[NSISVariable variableWithName:valueRestriction:shouldBeMinimized:valueIsUserObservable:](NSISVariable, "variableWithName:valueRestriction:shouldBeMinimized:valueIsUserObservable:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%p"), -[NSISVariable _equationDescriptionInParent](v1, "_equationDescriptionInParent"), v1), 0, 0, 1);
      v1->_engines[0] = (NSISEngine *)result;
    }
  }
  return result;
}

- (id)_equationDescriptionInParent
{
  id result;

  if (-[NSString length](-[NSLayoutAnchor name](self, "name"), "length"))
  {
    if (-[NSLayoutAnchor _constraintItem](self, "_constraintItem"))
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"), -[NSLayoutAnchor name](self, "name"));
    else
      return -[NSLayoutAnchor name](self, "name");
  }
  else
  {
    result = -[NSLayoutAnchor equationDescription](self, "equationDescription");
    if (!result)
    {
      return 0;
    }
  }
  return result;
}

- (NSString)name
{
  NSString *result;
  unsigned int v4;
  void *v5;

  result = self->_name;
  if (!result)
  {
    if (-[NSLayoutAnchor _constraintAttribute](self, "_constraintAttribute"))
    {
      v4 = -[NSLayoutAnchor _constraintAttribute](self, "_constraintAttribute");
      if (v4 > 0x25)
        v5 = 0;
      else
        v5 = (void *)qword_1E4A49470[v4];
      result = (NSString *)objc_msgSend(v5, "copy");
      self->_name = result;
    }
    else
    {
      result = self->_name;
    }
  }
  if (!result)
    return (NSString *)&stru_1E4A49B28;
  return result;
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, -1, anchor, 1.0, 0.0);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 1, anchor, 1.0, c);
}

void __73__NSLayoutAnchor_nsli_lowerIntoExpression_withCoefficient_forConstraint___block_invoke()
{
  unint64_t v0;

  _CALSDKVersionInit();
  if ((_CAL_sdk_version_mask & 2) != 0)
  {
    v0 = 3;
  }
  else if ((_CAL_sdk_version_mask & 4) != 0)
  {
    v0 = 2;
  }
  else
  {
    v0 = ((unint64_t)_CAL_sdk_version_mask >> 3) & 1;
  }
  nsli_lowerIntoExpression_withCoefficient_forConstraint__assertionLevel = v0;
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, -1, anchor, 1.0, c);
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  char v7;
  NSISEngine *v8;
  uint64_t v9;
  id v10;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  NSISEngine *v15;

  if (_NSConstraintBasedLayoutAnchorEquivalence())
  {
    if (a3 == self)
    {
      return 1;
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return 0;
      v5 = -[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem");
      v6 = objc_msgSend(a3, "_nearestAncestorLayoutItem");
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5 == (id)v6)
        {
LABEL_15:
          v8 = objc_alloc_init(NSISEngine);
          v9 = objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem"), "nsli_isRTL");
          v13 = v9;
          v14 = 0;
          v15 = v8;
          v10 = -[NSLayoutAnchor _expressionInContext:](self, "_expressionInContext:", &v13);
          v13 = v9;
          v14 = 0;
          v15 = v8;
          v7 = objc_msgSend(v10, "isEqual:", objc_msgSend(a3, "_expressionInContext:", &v13));

          return v7;
        }
        return 0;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return 0;
      v7 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0 && v5 == (id)v6)
        goto LABEL_15;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSLayoutAnchor;
    return -[NSLayoutAnchor isEqual:](&v12, sel_isEqual_, a3);
  }
  return v7;
}

- (id)ruleEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
    return -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, 0, a3, a4, a5);
  return result;
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleGreaterThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
    return -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, 1, a3, a4, a5);
  return result;
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, 0.0);
}

- (double)ruleLessThanOrEqualToAnchor:(double *)result multiplier:(void *)a2 constant:(void *)a3 priority:(double)a4 identifier:(double)a5
{
  if (result)
    return -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:]([NSLayoutAnchorRule alloc], result, a2, -1, a3, a4, a5);
  return result;
}

- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (id)ruleLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5 identifier:(id)a6
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, a3, 0, 1.0, a4);
}

- (void)rulesAffectingLayout
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "constraintsAffectingLayout"), "valueForKey:", CFSTR("_ancestorRuleNodes"));
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v2, "addObjectsFromArray:", v8);
        if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v8, "lastObject")) & 1) == 0)
          objc_msgSend(v3, "addObject:", objc_msgSend(v8, "lastObject"));
      }
      v5 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v3);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __57__NSLayoutAnchor_NSLayoutRuleDebug__rulesAffectingLayout__block_invoke;
        v17[3] = &unk_1E4A49010;
        v17[4] = v2;
        _NSRuleNodeAppendDebugDescription(v15, v9, 0, (uint64_t)v17);
      }
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v11);
  }
  return v9;
}

uint64_t __57__NSLayoutAnchor_NSLayoutRuleDebug__rulesAffectingLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (NSLayoutAnchor)initWithCoder:(id)a3
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSLayoutAnchor *v10;
  void *v12;
  const __CFString *v13;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 190, CFSTR("NSLayoutAnchor decoding requires keyed coding"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_type")))
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLayoutAnchor_type"));
  else
    v6 = 2;
  *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFC | v6 & 3;
  v7 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_name"));
  v8 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_referenceView"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLayoutAnchor_attr")))
  {
    v9 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLayoutAnchor_attr"));
    if (v6)
      goto LABEL_8;
    return -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", v7, v8, v9);
  }
  v9 = 0;
  if (!v6)
    return -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", v7, v8, v9);
LABEL_8:
  if (v6 == 1)
  {
    if (!v8)
    {
LABEL_20:
      v13 = CFSTR("An anchor's reference view was not included in the archive.");
LABEL_22:

      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0CB2D50])));
      return 0;
    }
    if (!v7)
    {
      v13 = CFSTR("An anchor's name was not included in the archive.");
      goto LABEL_22;
    }
    self = -[NSLayoutAnchor initWithIndependentVariableName:item:symbolicAttribute:](self, "initWithIndependentVariableName:item:symbolicAttribute:", v7, v8, v9);
    v12 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutAnchor_variable"));
    if (v12)
    {
      if (!self->_variable)
      {
        self->_variable = (NSISVariable *)v12;
        return self;
      }
      v13 = CFSTR("Can't decode anchor from corrupt archive.");
      goto LABEL_22;
    }
  }
  else if (v6 == 2)
  {
    if (v8)
    {
      v10 = -[NSLayoutAnchor initWithItem:attribute:](self, "initWithItem:attribute:", v8, v9);
      self = v10;
      if (v7)
      {

        self->_name = (NSString *)objc_msgSend(v7, "copy");
      }
      return self;
    }
    goto LABEL_20;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  int64_t attr;
  NSISVariable *variable;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 250, CFSTR("NSLayoutAnchor encoding requires keyed coding"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSLayoutAnchor _anchorType](self, "_anchorType"), CFSTR("NSLayoutAnchor_type"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", self->_referenceItem, CFSTR("NSLayoutAnchor_referenceView"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("NSLayoutAnchor_name"));
  attr = self->_attr;
  if (attr)
    objc_msgSend(a3, "encodeInteger:forKey:", attr, CFSTR("NSLayoutAnchor_attr"));
  variable = self->_variable;
  if (variable)
    objc_msgSend(a3, "encodeObject:forKey:", variable, CFSTR("NSLayoutAnchor_variable"));
}

- (unint64_t)hash
{
  NSISEngine *v3;
  unint64_t v4;
  objc_super v6;
  _QWORD v7[3];

  if (_NSConstraintBasedLayoutAnchorEquivalence())
  {
    v3 = objc_alloc_init(NSISEngine);
    v7[0] = objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem"), "nsli_isRTL");
    v7[1] = 0;
    v7[2] = v3;
    v4 = objc_msgSend(-[NSLayoutAnchor _expressionInContext:](self, "_expressionInContext:", v7), "hash");

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSLayoutAnchor;
    return -[NSLayoutAnchor hash](&v6, sel_hash);
  }
  return v4;
}

- (NSLayoutAnchor)initWithAnchor:(id)a3
{
  uint64_t v6;
  NSLayoutAnchor *v7;
  NSLayoutAnchor *v8;
  char v9;

  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
  v7 = -[NSLayoutAnchor initWithName:referenceItem:symbolicAttribute:](self, "initWithName:referenceItem:symbolicAttribute:", *((_QWORD *)a3 + 4), *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2));
  v8 = v7;
  if (v7)
  {
    v9 = *((_BYTE *)a3 + 56);
    *((_BYTE *)v7 + 56) = *((_BYTE *)v7 + 56) & 0xFC | v9 & 3;
    if ((v9 & 3) == 1)
      v7->_variable = -[NSLayoutAnchor _anchorVariable]((NSISVariable *)a3);
  }
  return v8;
}

- (id)_constituentAnchors
{
  id AssociatedObject;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  AssociatedObject = objc_getAssociatedObject(self, sel__constituentAnchors);
  if (!AssociatedObject)
  {
    AssociatedObject = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = (void *)-[NSLayoutAnchor _childAnchors](self, "_childAnchors", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            objc_msgSend(AssociatedObject, "addObject:", v9);
            v10 = objc_msgSend(v9, "_constituentAnchors");
            if (v10)
              objc_msgSend(AssociatedObject, "addObjectsFromArray:", v10);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }
    }
    objc_setAssociatedObject(self, sel__constituentAnchors, AssociatedObject, (void *)0x303);
  }
  return AssociatedObject;
}

- (id)_expressionInDefaultContextWithEngine:(id)a3
{
  _QWORD v4[3];

  v4[0] = 0;
  v4[1] = 0;
  v4[2] = a3;
  return -[NSLayoutAnchor _expressionInContext:](self, "_expressionInContext:", v4);
}

- (NSLayoutAnchor)anchorWithName:(id)a3 referenceItem:(id)a4 symbolicAttribute:(int64_t)a5
{
  uint64_t v8;

  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAnchor:", self);

  *(_QWORD *)(v8 + 32) = objc_msgSend(a3, "copy");
  *(_QWORD *)(v8 + 8) = a4;
  *(_QWORD *)(v8 + 16) = a5;
  return (NSLayoutAnchor *)(id)v8;
}

- (NSLayoutAnchor)anchorWithName:(id)a3
{
  return -[NSLayoutAnchor anchorWithName:referenceItem:symbolicAttribute:](self, "anchorWithName:referenceItem:symbolicAttribute:", a3, -[NSLayoutAnchor _constraintItem](self, "_constraintItem"), -[NSLayoutAnchor _constraintAttribute](self, "_constraintAttribute"));
}

- (id)item
{
  return self->_referenceItem;
}

- (id)_variableName
{
  if (-[NSLayoutAnchor _anchorType](self, "_anchorType") != 1)
  return self->_name;
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  return 0;
}

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  return 0;
}

- (id)equationDescription
{
  return 0;
}

- (id)_equationDescriptionLegendEntries
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](-[NSLayoutAnchor name](self, "name"), "length")
    && -[NSLayoutAnchor _constraintItem](self, "_constraintItem"))
  {
    if ((objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_descriptionIncludesPointer") & 1) != 0)
    {
      v3 = (void *)MEMORY[0x1E0C99E40];
      return (id)objc_msgSend(v3, "orderedSet");
    }
    return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"), "stringByAppendingFormat:", CFSTR(":%p"), -[NSLayoutAnchor _constraintItem](self, "_constraintItem")));
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v3 = (void *)MEMORY[0x1E0C99E40];
      return (id)objc_msgSend(v3, "orderedSet");
    }
    v4 = (void *)-[NSLayoutAnchor _childAnchors](self, "_childAnchors");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "name"), "length"))
            objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(v10, "_equationDescriptionInParent"), "stringByAppendingFormat:", CFSTR(":%p"), v10));
          else
            objc_msgSend(v5, "unionOrderedSet:", objc_msgSend(v10, "_equationDescriptionLegendEntries"));
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    return v5;
  }
}

- (double)_valueInEngine:(id)a3
{
  int64_t v6;
  double result;

  v6 = -[NSLayoutAnchor _anchorType](self, "_anchorType");
  if (v6)
  {
    if (v6 == 1)
    {
LABEL_5:
      objc_msgSend(a3, "valueForVariable:", -[NSLayoutAnchor _anchorVariable]((NSISVariable *)self));
      return result;
    }
    if (v6 == 2)
    {
      goto LABEL_5;
    }
  }
  else
  {
  }
  return 0.0;
}

- (void)_dependentVariables
{
  void *v1;
  NSISEngine *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(NSISEngine);
    v3 = objc_msgSend((id)objc_msgSend(v1, "_expressionInDefaultContextWithEngine:", v2), "variablesArray");

    return (void *)v3;
  }
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[NSLayoutAnchor _dependentVariables](self);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      if ((v6 & 1) != 0)
        v6 = 1;
      else
        v6 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem", (_QWORD)v10), "nsli_layoutEngine"), "valueOfVariableIsAmbiguous:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (NSArray)constraintsAffectingLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[NSLayoutAnchor _dependentVariables](self);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem", (_QWORD)v11), "nsli_layoutEngine"), "constraintsAffectingValueOfVariable:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        if (v6)
          v6 = -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v9);
        else
          v6 = (NSArray *)v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    return v6;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (uint64_t)_isReferencedByConstraint:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if ((objc_msgSend((id)objc_msgSend(a2, "firstAnchor"), "isEqual:", result) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "secondAnchor"), "isEqual:", v3) & 1) != 0
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "firstAnchor"), "_constituentAnchors"), "containsObject:", v3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "secondAnchor"), "_constituentAnchors"), "containsObject:", v3);
    }
  }
  return result;
}

- (id)_referencingConstraints
{
  id v3;
  id i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[NSLayoutAnchor _nearestAncestorLayoutItem](self, "_nearestAncestorLayoutItem");
  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); v3; v3 = (id)objc_msgSend(v3, "nsli_superitem"))
  {
    v5 = (void *)objc_msgSend(v3, "nsli_installedConstraints");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (j = 0; j != v7; ++j)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * j);
          if (-[NSLayoutAnchor _isReferencedByConstraint:]((uint64_t)self, v10))
            objc_msgSend(i, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return i;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s:%p"), class_getName(v4), self);
  if (-[NSString length](-[NSLayoutAnchor name](self, "name"), "length"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(" \"));
    if (-[NSLayoutAnchor _constraintItem](self, "_constraintItem"))
    {
      objc_msgSend(v5, "appendString:", objc_msgSend(-[NSLayoutAnchor _constraintItem](self, "_constraintItem"), "nsli_description"));
      objc_msgSend(v5, "appendString:", CFSTR("."));
    }
    objc_msgSend(v5, "appendString:", -[NSLayoutAnchor name](self, "name"));
    objc_msgSend(v5, "appendString:", CFSTR("\"));
  }
  v6 = -[NSLayoutAnchor equationDescription](self, "equationDescription");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "appendString:", v7);
    }
  }
  v8 = -[NSLayoutAnchor _equationDescriptionLegendEntries](self, "_equationDescriptionLegendEntries");
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v5, "appendString:", CFSTR(" (names: "));
      objc_msgSend(v5, "appendString:", objc_msgSend((id)objc_msgSend(v9, "array"), "componentsJoinedByString:", CFSTR(", ")));
      objc_msgSend(v5, "appendString:", CFSTR(")"));
    }
  }
  return (id)objc_msgSend(v5, "stringByAppendingString:", CFSTR(">"));
}

- (void)_expressionForValueInItem:(void *)a1
{
  void *v2;
  void *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v2 = a1;
  if (!a1)
    return v2;
  if (!a2)
  v4 = (void *)objc_msgSend(v2, "_nearestAncestorLayoutItem");
  if (v4)
    v5 = +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", v4, a2);
  else
    v5 = 0;
  v6 = objc_msgSend(v4, "nsli_layoutEngine");
  if (!v6)
  if (v6 == objc_msgSend(a2, "nsli_layoutEngine"))
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, CFSTR("NSLayoutAnchor.m"), 1190, CFSTR("Expected anchors (%@)'s ancestor item (%@) and provided item (%@) to be in same layout engine."), v2, v4, a2);
    if (v5)
      goto LABEL_11;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, CFSTR("NSLayoutAnchor.m"), 1191, CFSTR("Expected common ancestor between anchor (%@)'s ancestor item (%@) and provided item (%@)"), v2, v4, a2);
LABEL_11:
  objc_msgSend(a2, "nsli_engineToUserScalingCoefficients");
  v8 = v7;
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", a2, 1);
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a2, "nsli_isFlipped"))
      {
        v11 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", a2, 3);
        v12 = 1.0;
        v8 = v10;
      }
      else
      {
        v8 = -v10;
        v11 = +[NSLayoutAnchor _anchorForItem:attribute:](NSLayoutAnchor, "_anchorForItem:attribute:", a2, 4);
        v12 = -1.0;
      }
      goto LABEL_21;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__expressionForValueInItem_, v2, CFSTR("NSLayoutAnchor.m"), 1217, CFSTR("Unexpected anchor type (%@) is not able to be compared"), v2);
      v11 = 0;
      v8 = 1.0;
    }
  }
  v12 = 1.0;
LABEL_21:
  v13 = _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(v2, 0, 0, v5, 0);
  v17 = v13;
  v18 = v5;
  v19 = v6;
  v2 = (void *)objc_msgSend(v2, "_expressionInContext:", &v17);
  if (v11)
  {
    v17 = v13;
    v18 = v5;
    v19 = v6;
    objc_msgSend(v2, "addExpression:times:", objc_msgSend(v11, "_expressionInContext:", &v17), -1.0);
  }
  objc_msgSend(v2, "constant");
  v15 = v14;
  objc_msgSend(v2, "incrementConstant:", -v14);
  objc_msgSend(v2, "scaleBy:", v8);
  objc_msgSend(v2, "incrementConstant:", v12 * v15);
  return v2;
}

- (double)valueInItem:(id)a3
{
  void *v6;
  double result;

  if (!a3)
  v6 = (void *)objc_msgSend(a3, "nsli_layoutEngine");
  if (!v6)
  objc_msgSend(v6, "valueForExpression:", -[NSLayoutAnchor _expressionForValueInItem:](self, a3));
  return result;
}

- (id)observableValueInItem:(id)a3
{
  uint64_t v6;
  void *v7;
  id result;

  v6 = objc_msgSend(a3, "nsli_layoutEngine");
  if (!v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutAnchor.m"), 1249, CFSTR("Requires layout item to have layout engine"));
  v7 = -[NSLayoutAnchor _expressionForValueInItem:](self, a3);
  if (objc_msgSend(v7, "variableCount"))
    return +[_NSISLinearExpressionObservable observableForExpression:inEngine:](_NSISLinearExpressionObservable, "observableForExpression:inEngine:", v7, v6);
  result = (id)observableValueInItem__nullObservationSource;
  if (!observableValueInItem__nullObservationSource)
  {
    result = (id)objc_opt_new();
    observableValueInItem__nullObservationSource = (uint64_t)result;
  }
  return result;
}

@end

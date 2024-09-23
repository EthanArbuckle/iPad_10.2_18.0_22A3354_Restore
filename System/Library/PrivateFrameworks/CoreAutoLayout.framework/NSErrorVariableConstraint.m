@implementation NSErrorVariableConstraint

- (NSErrorVariableConstraint)initWithVariable:(id)a3 value:(double)a4
{
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSErrorVariableConstraint;
  v7 = -[NSLayoutConstraint init](&v9, sel_init);
  if (v7)
  {
    *((_QWORD *)v7 + 10) = a3;
    *((double *)v7 + 11) = a4;
    *(_DWORD *)(v7 + 66) |= 0x40u;
    objc_msgSend(v7, "_setRelation:", 0);
    objc_msgSend(v7, "setSymbolicConstant:", 0);
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)v7);
    if (objc_msgSend((id)objc_msgSend(v7, "_markerAndPositiveExtraVar"), "valueRestriction") != 2)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("NSLayoutConstraint.m"), 2840, CFSTR("Expected marker restricted to 0."));
    ConstraintDidPerformInitialSetup((uint64_t)v7);
  }
  return (NSErrorVariableConstraint *)v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_errorVariable = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSErrorVariableConstraint;
  -[NSLayoutConstraint dealloc](&v3, sel_dealloc);
}

- (BOOL)_lowerIntoExpression:(id)a3 reportingConstantIsRounded:(BOOL *)a4
{
  if (!-[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"))
    -[NSLayoutConstraint _makeExtraVars]((NSISVariable *)self);
  objc_msgSend(a3, "setCoefficient:forVariable:", self->_errorVariable, 1.0);
  objc_msgSend(a3, "incrementConstant:", -self->_errorValue);
  objc_msgSend(a3, "setCoefficient:forVariable:", -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar"), -1.0);
  *(_DWORD *)((char *)&self->super._layoutConstraintFlags + 2) |= 0x10u;
  if (a4)
    *a4 = 0;
  return 1;
}

- (id)constrainedConstraint
{
  NSISVariableDelegate *v4;

  v4 = -[NSISVariable delegate](self->_errorVariable, "delegate");
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutConstraint.m"), 2880, CFSTR("This should be a constraint if we're constraining an error variable."));
  return v4;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

@end

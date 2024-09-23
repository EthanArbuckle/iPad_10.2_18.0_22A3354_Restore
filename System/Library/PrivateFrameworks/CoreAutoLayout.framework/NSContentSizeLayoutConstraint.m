@implementation NSContentSizeLayoutConstraint

- (double)huggingPriority
{
  return self->_huggingPriority;
}

- (double)compressionResistancePriority
{
  return self->_compressionResistancePriority;
}

- (double)priorityForVariable:(id)a3
{
  id v5;
  int *v6;

  v5 = -[NSLayoutConstraint _markerAndPositiveExtraVar](self, "_markerAndPositiveExtraVar");
  v6 = &OBJC_IVAR___NSContentSizeLayoutConstraint__compressionResistancePriority;
  if (v5 == a3)
    v6 = &OBJC_IVAR___NSContentSizeLayoutConstraint__huggingPriority;
  return *(double *)((char *)&self->super.super.isa + *v6);
}

- (NSContentSizeLayoutConstraint)initWithLayoutItem:(id)a3 value:(double)a4 huggingPriority:(double)a5 compressionResistancePriority:(double)a6 orientation:(int64_t)a7
{
  char *v12;
  NSContentSizeLayoutConstraint *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NSContentSizeLayoutConstraint;
  v12 = -[NSLayoutConstraint init](&v16, sel_init);
  v13 = (NSContentSizeLayoutConstraint *)v12;
  if (v12)
  {
    *(_DWORD *)(v12 + 66) |= 0x40u;
    *((double *)v12 + 10) = a5;
    *((double *)v12 + 11) = a6;
    objc_msgSend(v12, "setConstant:", a4);
    if (a7)
      v14 = 8;
    else
      v14 = 7;
    -[NSLayoutConstraint _setFirstItem:attribute:](v13, "_setFirstItem:attribute:", a3, v14);
    -[NSLayoutConstraint _setMarkerAndPositiveErrorVar:](v13, +[NSISVariable variableMarkingConstraint:valueRestriction:shouldBeMinimized:](NSISVariable, "variableMarkingConstraint:valueRestriction:shouldBeMinimized:", v13, 1, 1));
    -[NSLayoutConstraint _setNegativeExtraVar:](v13, +[NSISVariable variableWithDelegate:valueRestriction:shouldBeMinimized:](NSISVariable, "variableWithDelegate:valueRestriction:shouldBeMinimized:", v13, 1, 1));
    ConstraintDidPerformInitialSetup((uint64_t)v13);
  }
  return v13;
}

- (id)_priorityDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hug:%g CompressionResistance:%g"), *(_QWORD *)&self->_huggingPriority, *(_QWORD *)&self->_compressionResistancePriority);
}

@end

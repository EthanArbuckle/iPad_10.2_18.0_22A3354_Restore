@implementation _FEFocusSpeedBumpRegion

- (_FEFocusSpeedBumpRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_FEFocusSpeedBumpRegion initWithFrame:coordinateSpace:speedBumpEdges:](self, "initWithFrame:coordinateSpace:speedBumpEdges:", a4, 15, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_FEFocusSpeedBumpRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 speedBumpEdges:(unint64_t)a5
{
  _FEFocusSpeedBumpRegion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_FEFocusSpeedBumpRegion;
  result = -[_FEFocusRegion initWithFrame:coordinateSpace:](&v7, sel_initWithFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_speedBumpEdges = a5;
  return result;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_FEFocusSpeedBumpRegion;
  -[_FEFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v7, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5[6] = self->_speedBumpEdges;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_FEFocusSpeedBumpRegion;
  if (-[_FEFocusRegion isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_speedBumpEdges == v4[6];
  else
    v5 = 0;

  return v5;
}

- (BOOL)_canOccludeRegionsBelow
{
  return 0;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  return 0;
}

- (BOOL)_shouldCropRegionToSearchArea
{
  return 0;
}

- (unint64_t)_boundariesBlockingFocusMovementRequest:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "movementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isInitialMovement");

  if ((v5 & 1) != 0)
    return 0;
  else
    return -[_FEFocusSpeedBumpRegion speedBumpEdges](self, "speedBumpEdges");
}

- (unint64_t)speedBumpEdges
{
  return self->_speedBumpEdges;
}

- (void)setSpeedBumpEdges:(unint64_t)a3
{
  self->_speedBumpEdges = a3;
}

@end

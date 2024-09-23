@implementation _FEFocusRegion

- (_FEFocusRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  _FEFocusRegion *v12;
  _FEFocusRegion *v13;
  void *v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusRegion.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusRegion;
  v12 = -[_FEFocusRegion init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_regionFrame.origin.x = x;
    v12->_regionFrame.origin.y = y;
    v12->_regionFrame.size.width = width;
    v12->_regionFrame.size.height = height;
    objc_storeStrong((id *)&v12->_regionCoordinateSpace, a4);
  }

  return v13;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (CGRectIsEmpty(v15))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusRegion.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsEmpty(frame)"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusRegion.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:coordinateSpace:", v10, x, y, width, height);

  return v11;
}

- (id)_descriptionBuilder
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusRegion regionFrame](self, "regionFrame");
  _FEStringFromCGRect(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("frame"));

  -[_FEFocusRegion regionCoordinateSpace](self, "regionCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_FEFocusRegion regionCoordinateSpace](self, "regionCoordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }
    v17 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("coordinateSpace"));

  }
  else
  {
    v16 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("global"), CFSTR("coordinateSpace"));
  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_FEFocusRegion _descriptionBuilder](self, "_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _FEFocusRegion *v4;
  _FEFocusRegion *v5;
  _FECoordinateSpace *regionCoordinateSpace;
  _FECoordinateSpace *v7;
  _FECoordinateSpace *v8;
  _FECoordinateSpace *v9;
  int v10;
  BOOL v11;

  v4 = (_FEFocusRegion *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[_FEFocusRegion isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      regionCoordinateSpace = v5->_regionCoordinateSpace;
      v7 = self->_regionCoordinateSpace;
      v8 = regionCoordinateSpace;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v7 || !v8)
        {

LABEL_13:
          v11 = 0;
          goto LABEL_14;
        }
        v10 = -[_FECoordinateSpace isEqual:](v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_13;
      }
      v11 = CGRectEqualToRect(self->_regionFrame, v5->_regionFrame);
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  int8x16_t v4;

  v3 = -[_FECoordinateSpace hash](self->_regionCoordinateSpace, "hash");
  v4 = vorrq_s8(vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_regionFrame.origin), (int8x16_t)xmmword_23C4C0660), vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_regionFrame.size), (int8x16_t)xmmword_23C4C0650));
  return *(_QWORD *)&vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ v3;
}

- (BOOL)_canOccludeRegionsBelow
{
  return 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  return 1;
}

- (BOOL)_shouldCropRegionToSearchArea
{
  return 1;
}

- (BOOL)_isUnclippable
{
  return 0;
}

- (id)_defaultFocusItem
{
  return 0;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  return 0;
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  return 1;
}

- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  return (id)objc_msgSend(a5, "_cachedNextFocusedItemForRegion:withFocusMovementRequest:inMap:", self, a3, a4);
}

- (unint64_t)_focusableBoundaries
{
  return 0;
}

- (unint64_t)_boundariesBlockingFocusMovementRequest:(id)a3
{
  return 0;
}

- (int64_t)_preferredDistanceComparisonType
{
  return 0;
}

- (float)_focusPriority
{
  return 0.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 0;
}

- (unint64_t)_effectiveFocusableBoundariesForHeading:(unint64_t)a3
{
  return _UIEffectiveFocusRegionBoundariesForHeading(-[_FEFocusRegion _focusableBoundaries](self, "_focusableBoundaries"), a3);
}

- (unint64_t)_effectiveBoundariesBlockingFocusMovementRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[_FEFocusRegion _boundariesBlockingFocusMovementRequest:](self, "_boundariesBlockingFocusMovementRequest:", v4);
  objc_msgSend(v4, "movementInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _UIEffectiveFocusRegionBoundariesForHeading(v5, objc_msgSend(v6, "heading"));
  return v7;
}

- (id)_debugAssociatedObject
{
  return 0;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  return 0;
}

- (CGRect)regionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionFrame.origin.x;
  y = self->_regionFrame.origin.y;
  width = self->_regionFrame.size.width;
  height = self->_regionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_FECoordinateSpace)regionCoordinateSpace
{
  return self->_regionCoordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCoordinateSpace, 0);
}

@end

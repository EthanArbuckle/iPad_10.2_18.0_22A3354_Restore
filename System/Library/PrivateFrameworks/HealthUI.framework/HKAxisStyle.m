@implementation HKAxisStyle

- (void)setTickPositions:(unint64_t)a3
{
  self->_tickPositions = a3;
}

- (void)setShowGridLines:(BOOL)a3
{
  self->_showGridLines = a3;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (void)setLabelStyle:(id)a3
{
  objc_storeStrong((id *)&self->_labelStyle, a3);
}

- (void)setGridLineStyle:(id)a3
{
  objc_storeStrong((id *)&self->_gridLineStyle, a3);
}

- (void)setFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_fillStyle, a3);
}

- (void)setFillOuterPadding:(double)a3
{
  self->_fillOuterPadding = a3;
}

- (void)setFillInnerPadding:(double)a3
{
  self->_fillInnerPadding = a3;
}

- (void)setBorderStyleForFill:(id)a3
{
  objc_storeStrong((id *)&self->_borderStyleForFill, a3);
}

- (void)setAxisLineStyle:(id)a3
{
  objc_storeStrong((id *)&self->_axisLineStyle, a3);
}

+ (id)defaultStyle
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (id *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setLabelStyle:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[7], "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[7], "setFont:", v5);

  objc_msgSend(v2[7], "setHorizontalAlignment:", 1);
  objc_msgSend(v2[7], "setVerticalAlignment:", 1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[HKStrokeStyle copy](self->_gridLineStyle, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[HKStrokeStyle copy](self->_minorGridLineStyle, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[HKStrokeStyle copy](self->_referenceGridLineStyle, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[HKStrokeStyle copy](self->_axisLineStyle, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  v13 = -[HKTickStyle copy](self->_tickStyle, "copy");
  v14 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v13;

  v15 = -[HKAxisLabelStyle copy](self->_labelStyle, "copy");
  v16 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v15;

  *(_QWORD *)(v4 + 64) = self->_tickPositions;
  *(_QWORD *)(v4 + 72) = self->_axisLabelPosition;
  *(_BYTE *)(v4 + 8) = self->_showGridLines;
  objc_storeStrong((id *)(v4 + 80), self->_fillStyle);
  *(double *)(v4 + 88) = self->_fillInnerPadding;
  *(double *)(v4 + 96) = self->_fillOuterPadding;
  v17 = -[HKStrokeStyle copy](self->_borderStyleForFill, "copy");
  v18 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v17;

  *(_QWORD *)(v4 + 112) = self->_location;
  return (id)v4;
}

- (HKStrokeStyle)gridLineStyle
{
  return self->_gridLineStyle;
}

- (HKStrokeStyle)minorGridLineStyle
{
  return self->_minorGridLineStyle;
}

- (void)setMinorGridLineStyle:(id)a3
{
  objc_storeStrong((id *)&self->_minorGridLineStyle, a3);
}

- (HKStrokeStyle)referenceGridLineStyle
{
  return self->_referenceGridLineStyle;
}

- (void)setReferenceGridLineStyle:(id)a3
{
  objc_storeStrong((id *)&self->_referenceGridLineStyle, a3);
}

- (HKStrokeStyle)axisLineStyle
{
  return self->_axisLineStyle;
}

- (HKTickStyle)tickStyle
{
  return self->_tickStyle;
}

- (void)setTickStyle:(id)a3
{
  objc_storeStrong((id *)&self->_tickStyle, a3);
}

- (HKAxisLabelStyle)labelStyle
{
  return self->_labelStyle;
}

- (unint64_t)tickPositions
{
  return self->_tickPositions;
}

- (unint64_t)axisLabelPosition
{
  return self->_axisLabelPosition;
}

- (void)setAxisLabelPosition:(unint64_t)a3
{
  self->_axisLabelPosition = a3;
}

- (BOOL)showGridLines
{
  return self->_showGridLines;
}

- (HKFillStyle)fillStyle
{
  return self->_fillStyle;
}

- (double)fillInnerPadding
{
  return self->_fillInnerPadding;
}

- (double)fillOuterPadding
{
  return self->_fillOuterPadding;
}

- (HKStrokeStyle)borderStyleForFill
{
  return self->_borderStyleForFill;
}

- (int64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderStyleForFill, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
  objc_storeStrong((id *)&self->_labelStyle, 0);
  objc_storeStrong((id *)&self->_tickStyle, 0);
  objc_storeStrong((id *)&self->_axisLineStyle, 0);
  objc_storeStrong((id *)&self->_referenceGridLineStyle, 0);
  objc_storeStrong((id *)&self->_minorGridLineStyle, 0);
  objc_storeStrong((id *)&self->_gridLineStyle, 0);
}

@end

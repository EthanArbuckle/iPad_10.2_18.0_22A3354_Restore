@implementation BKUIJindoPositioningGuideView

- (void)resetValuesToStart
{
  -[BKUIPearlPositioningGuideView setLineWidth:](self, "setLineWidth:", 4.33333333);
  -[BKUIJindoPositioningGuideView _squareLayoutOpenValue](self, "_squareLayoutOpenValue");
  -[BKUIPearlPositioningGuideView setEdgeDistance:](self, "setEdgeDistance:");
  -[BKUIJindoPositioningGuideView _squareLayoutOpenValue](self, "_squareLayoutOpenValue");
  -[BKUIPearlPositioningGuideView setTargetEdgeDistance:](self, "setTargetEdgeDistance:");
  -[BKUIJindoPositioningGuideView _edgeDistanceHeightDifference](self, "_edgeDistanceHeightDifference");
  -[BKUIJindoPositioningGuideView setLineYpositionDifference:](self, "setLineYpositionDifference:");
  -[BKUIPearlPositioningGuideView setCornerRadius:](self, "setCornerRadius:", 17.6666667);
  -[BKUIPearlPositioningGuideView setPostCornerLength:](self, "setPostCornerLength:", 19.0);
  -[BKUIPearlPositioningGuideView setLineAlpha:](self, "setLineAlpha:", 0.0);
  -[BKUIJindoPositioningGuideView center](self, "center");
  -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:");
  -[BKUIJindoPositioningGuideView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v35 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlPositioningGuideView edgeDistance](self, "edgeDistance");
  v9 = v8;
  -[BKUIPearlPositioningGuideView cornerRadius](self, "cornerRadius");
  v11 = v10;
  -[BKUIPearlPositioningGuideView postCornerLength](self, "postCornerLength");
  v13 = v12;
  -[BKUIJindoPositioningGuideView lineYpositionDifference](self, "lineYpositionDifference");
  v15 = v14;
  -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
  v38 = v5 + v9;
  v39 = v16;
  v17 = v7;
  v34 = v7;
  objc_msgSend(v40, "moveToPoint:", v38, v7 + v9 - v11 - v13 + v15);
  v18 = v13 + v7 + v9 - v11 - v13 + v15;
  objc_msgSend(v40, "addLineToPoint:", v38, v18);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v38 - v11, v18, v11, 0.0);
  v19 = v17 + v9;
  v20 = v17 + v9 + v15;
  v37 = v38 - v11 - v13;
  objc_msgSend(v40, "addLineToPoint:");
  v21 = v35 - v9;
  v22 = v35 - v9 + v11;
  v36 = v22 + v13;
  objc_msgSend(v40, "moveToPoint:");
  objc_msgSend(v40, "addLineToPoint:", v22, v20);
  v23 = v19 - v11;
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, v23 + v15, v11, 1.57079633, 3.14159265);
  objc_msgSend(v40, "addLineToPoint:", v21, v23 - v13 + v15);
  v24 = v34 - v9;
  v25 = v34 - v9 + v11;
  v26 = v25 + v13 - v15;
  objc_msgSend(v40, "moveToPoint:", v21, v26);
  v27 = v25 - v15;
  objc_msgSend(v40, "addLineToPoint:", v21, v27);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, v27, v11, 3.14159265, 4.71238898);
  objc_msgSend(v40, "addLineToPoint:", v36, v24 - v15);
  objc_msgSend(v40, "moveToPoint:", v37, v24 - v15);
  objc_msgSend(v40, "addLineToPoint:", v38 - v11, v24 - v15);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v38 - v11, v27, v11, 4.71238898, 0.0);
  objc_msgSend(v40, "addLineToPoint:", v38, v26);
  objc_msgSend(v40, "setLineCapStyle:", 1);
  objc_msgSend(v40, "setLineWidth:", v39 + 1.0);
  v28 = (void *)MEMORY[0x1E0CEA478];
  -[BKUIPearlPositioningGuideView lineAlpha](self, "lineAlpha");
  objc_msgSend(v28, "colorWithWhite:alpha:", 0.0, v29 * 0.25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStroke");

  objc_msgSend(v40, "stroke");
  objc_msgSend(v40, "setLineWidth:", v39);
  v31 = (void *)MEMORY[0x1E0CEA478];
  -[BKUIPearlPositioningGuideView lineAlpha](self, "lineAlpha");
  objc_msgSend(v31, "colorWithWhite:alpha:", 1.0, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStroke");

  objc_msgSend(v40, "stroke");
}

- (double)_squareLayoutOpenValue
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoomEnabled");

  if (v4)
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "mainScreenClass") == 31)
      v6 = 40;
    else
      v6 = 30;
    v7 = (double)v6;

    -[BKUIJindoPositioningGuideView bounds](self, "bounds");
    v9 = v8 + v7 * -2.0;
  }
  else
  {
    -[BKUIJindoPositioningGuideView bounds](self, "bounds");
    v9 = v10 + -90.0;
  }
  return v9 * 0.5;
}

- (double)_edgeDistanceHeightDifference
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  double result;

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mainScreenClass");

  if (v3 != 31)
    return 26.5;
  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isZoomEnabled");

  result = 30.0;
  if (v5)
    return 7.5;
  return result;
}

- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4
{
  double v6;
  double v7;
  double v8;

  if ((unint64_t)a3 >= 3)
  {
    if (a3 == 3)
    {
      -[BKUIPearlPositioningGuideView setTargetLineWidth:](self, "setTargetLineWidth:", 3, a4, 3.5);
      -[BKUIPearlPositioningGuideView ringRadius](self, "ringRadius");
      v7 = v6;
      -[BKUIPearlPositioningGuideView targetLineWidth](self, "targetLineWidth");
      -[BKUIPearlPositioningGuideView setTargetEdgeDistance:](self, "setTargetEdgeDistance:", v7 + v8 * 0.5);
      -[BKUIPearlPositioningGuideView targetEdgeDistance](self, "targetEdgeDistance");
      -[BKUIPearlPositioningGuideView setTargetCornerRadius:](self, "setTargetCornerRadius:");
      -[BKUIPearlPositioningGuideView setTargetPostCornerLength:](self, "setTargetPostCornerLength:", 0.0);
      -[BKUIJindoPositioningGuideView setTargetLineYposition:](self, "setTargetLineYposition:", 0.0);
      -[BKUIPearlPositioningGuideView setTargetLineAlpha:](self, "setTargetLineAlpha:", 0.85);
    }
  }
  else
  {
    -[BKUIPearlPositioningGuideView setTargetLineWidth:](self, "setTargetLineWidth:", 4.33333333);
    -[BKUIJindoPositioningGuideView _squareLayoutOpenValue](self, "_squareLayoutOpenValue");
    -[BKUIPearlPositioningGuideView setTargetEdgeDistance:](self, "setTargetEdgeDistance:");
    -[BKUIPearlPositioningGuideView setTargetCornerRadius:](self, "setTargetCornerRadius:", 17.0);
    -[BKUIPearlPositioningGuideView setTargetPostCornerLength:](self, "setTargetPostCornerLength:", 24.0);
    -[BKUIJindoPositioningGuideView _edgeDistanceHeightDifference](self, "_edgeDistanceHeightDifference");
    -[BKUIJindoPositioningGuideView setTargetLineYposition:](self, "setTargetLineYposition:");
    -[BKUIPearlPositioningGuideView setTargetLineAlpha:](self, "setTargetLineAlpha:", 1.0);
    -[BKUIJindoPositioningGuideView center](self, "center");
    -[BKUIPearlPositioningGuideView setTargetPortalCenter:](self, "setTargetPortalCenter:");
    -[BKUIPearlPositioningGuideView setAnimationCurve:](self, "setAnimationCurve:", a4);
  }
}

- (void)_updateChildrenValuesForDisplayTickProgress:(double)a3
{
  double targetLineYposition;
  double v6;

  targetLineYposition = self->_targetLineYposition;
  -[BKUIJindoPositioningGuideView lineYpositionDifference](self, "lineYpositionDifference");
  -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetLineYposition, v6, self->_startLineYposition, a3);
  -[BKUIJindoPositioningGuideView setLineYpositionDifference:](self, "setLineYpositionDifference:");
}

- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  y = a4.y;
  x = a4.x;
  -[BKUIJindoPositioningGuideView bounds](self, "bounds");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v10 + -1.0, v11 + -1.0, v12 + 2.0, v13 + 2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIJindoPositioningGuideView lineYpositionDifference](self, "lineYpositionDifference");
  v16 = y - a3 - v15;
  -[BKUIJindoPositioningGuideView lineYpositionDifference](self, "lineYpositionDifference");
  objc_msgSend(MEMORY[0x1E0CEA390], "_bezierPathWithArcRoundedRect:cornerRadius:", x - a3, v16, a3 + a3, v17 + v17 + a3 * 2.0, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendPath:", v18);

  return v14;
}

- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  if ((-[BKUIJindoPositioningGuideView isHidden](self, "isHidden") & 1) == 0 && !UIAccessibilityIsReduceMotionEnabled())
    self->_startLineYposition = self->_lineYpositionDifference;
  v7.receiver = self;
  v7.super_class = (Class)BKUIJindoPositioningGuideView;
  -[BKUIPearlPositioningGuideView _startAnimationWithDuration:completion:](&v7, sel__startAnimationWithDuration_completion_, v6, a3);

}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  return 1;
}

- (double)targetLineYposition
{
  return self->_targetLineYposition;
}

- (void)setTargetLineYposition:(double)a3
{
  self->_targetLineYposition = a3;
}

- (double)lineYpositionDifference
{
  return self->_lineYpositionDifference;
}

- (void)setLineYpositionDifference:(double)a3
{
  self->_lineYpositionDifference = a3;
}

- (double)startLineYposition
{
  return self->_startLineYposition;
}

- (void)setStartLineYposition:(double)a3
{
  self->_startLineYposition = a3;
}

@end

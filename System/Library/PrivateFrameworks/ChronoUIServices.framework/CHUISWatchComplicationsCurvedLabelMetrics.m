@implementation CHUISWatchComplicationsCurvedLabelMetrics

- (CHUISWatchComplicationsCurvedLabelMetrics)initWithInterior:(BOOL)a3 tracking:(double)a4 circleCenter:(CGPoint)a5 circleRadius:(double)a6 maximumAngularWidth:(double)a7 centerAngle:(double)a8 fontSize:(double)a9 textColor:(id)a10 accessoryPlacement:(unint64_t)a11 accessoryPadding:(double)a12 accessoryMaxSize:(CGSize)a13
{
  double y;
  double x;
  _BOOL8 v22;
  id v24;
  CHUISWatchComplicationsCurvedLabelMetrics *v25;
  CHUISWatchComplicationsCurvedLabelMetrics *v26;
  objc_super v28;
  double v29;
  double v30;

  y = a5.y;
  x = a5.x;
  v22 = a3;
  v24 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CHUISWatchComplicationsCurvedLabelMetrics;
  v25 = -[CHSWatchComplicationsCurvedLabelMetrics init](&v28, sel_init);
  v26 = v25;
  if (v25)
  {
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setInterior:](v25, "setInterior:", v22);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setTracking:](v26, "setTracking:", a4);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setCircleCenter:](v26, "setCircleCenter:", x, y);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setCircleRadius:](v26, "setCircleRadius:", a6);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setMaximumAngularWidth:](v26, "setMaximumAngularWidth:", a7);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setCenterAngle:](v26, "setCenterAngle:", a8);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setBezierPath:](v26, "setBezierPath:", 0);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setFontSize:](v26, "setFontSize:", a9);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setTextColor:](v26, "setTextColor:", v24);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryPlacement:](v26, "setAccessoryPlacement:", a11);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryPadding:](v26, "setAccessoryPadding:", a12);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryMaxSize:](v26, "setAccessoryMaxSize:", v29, v30);
  }

  return v26;
}

- (CHUISWatchComplicationsCurvedLabelMetrics)initWithPath:(id)a3 fontSize:(double)a4 textColor:(id)a5 accessoryPlacement:(unint64_t)a6 accessoryPadding:(double)a7 accessoryMaxSize:(CGSize)a8
{
  double height;
  double width;
  id v15;
  id v16;
  CHUISWatchComplicationsCurvedLabelMetrics *v17;
  CHUISWatchComplicationsCurvedLabelMetrics *v18;
  void *v19;
  objc_super v21;

  height = a8.height;
  width = a8.width;
  v15 = a3;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHUISWatchComplicationsCurvedLabelMetrics;
  v17 = -[CHSWatchComplicationsCurvedLabelMetrics init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setInterior:](v17, "setInterior:", 0);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setTracking:](v18, "setTracking:", 0.0);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0FFA8]), "initWithCGPath:", objc_msgSend(objc_retainAutorelease(v15), "CGPath"));
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setBezierPath:](v18, "setBezierPath:", v19);

    -[CHSMutableWatchComplicationsCurvedLabelMetrics setFontSize:](v18, "setFontSize:", a4);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setTextColor:](v18, "setTextColor:", v16);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryPlacement:](v18, "setAccessoryPlacement:", a6);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryPadding:](v18, "setAccessoryPadding:", a7);
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryMaxSize:](v18, "setAccessoryMaxSize:", width, height);
  }

  return v18;
}

@end

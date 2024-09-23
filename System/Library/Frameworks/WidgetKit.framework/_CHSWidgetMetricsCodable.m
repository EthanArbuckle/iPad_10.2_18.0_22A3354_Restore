@implementation _CHSWidgetMetricsCodable

- (_CHSWidgetMetricsCodable)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CHSWidgetMetricsCodable();
  return -[CHSWidgetMetrics initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_CHSWidgetMetricsCodable)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10
{
  void *v10;
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  id v23;
  _CHSWidgetMetricsCodable *v24;
  objc_super v26;

  v10 = a10;
  height = a3.height;
  width = a3.width;
  if (a10)
  {
    sub_1908AB890(0, &qword_1EE1EC908);
    sub_1908AB890(0, (unint64_t *)&qword_1ECF6CD48);
    sub_1909D5480((unint64_t *)&qword_1EE1EE350, &qword_1EE1EC908, 0x1E0CB37E8, MEMORY[0x1E0DEFCF8]);
    sub_190A47A28();
    v20 = a7;
    v21 = a9;
    v10 = (void *)sub_190A47A1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = a7;
    v23 = a9;
  }
  v26.receiver = self;
  v26.super_class = (Class)type metadata accessor for CHSWidgetMetricsCodable();
  v24 = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](&v26, sel_initWithSize_cornerRadius_scaleFactor_fontStyle_margins_supportsDynamicText_widgetGroupMargins_nestedContentMetrics_, a6, a7, a8, a9, v10, width, height, a4, a5);

  return v24;
}

@end

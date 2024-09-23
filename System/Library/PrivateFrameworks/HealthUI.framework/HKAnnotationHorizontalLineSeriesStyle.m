@implementation HKAnnotationHorizontalLineSeriesStyle

- (HKStrokeStyle)lineStrokeStyle
{
  return self->_lineStrokeStyle;
}

- (void)setLineStrokeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_lineStrokeStyle, a3);
}

- (HKAxisLabelStyle)valueStyle
{
  return self->_valueStyle;
}

- (void)setValueStyle:(id)a3
{
  objc_storeStrong((id *)&self->_valueStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStyle, 0);
  objc_storeStrong((id *)&self->_lineStrokeStyle, 0);
}

@end

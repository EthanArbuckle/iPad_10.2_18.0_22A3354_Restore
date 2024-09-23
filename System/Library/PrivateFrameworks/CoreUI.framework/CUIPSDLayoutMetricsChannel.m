@implementation CUIPSDLayoutMetricsChannel

- (void)dealloc
{
  objc_super v3;

  -[CUIPSDLayoutMetricsChannel setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayoutMetricsChannel;
  -[CUIPSDLayoutMetricsChannel dealloc](&v3, sel_dealloc);
}

- (void)sanitizeEdgeInsets
{
  if (self->_edgeInsets.origin.x < 0.0)
    self->_edgeInsets.origin.x = 0.0;
  if (self->_edgeInsets.origin.y < 0.0)
    self->_edgeInsets.origin.y = 0.0;
  if (self->_edgeInsets.size.width < 0.0)
    self->_edgeInsets.size.width = 0.0;
  if (self->_edgeInsets.size.height < 0.0)
    self->_edgeInsets.size.height = 0.0;
}

- (CUIPSDLayoutMetricsChannel)initWithEdgeInsets:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIPSDLayoutMetricsChannel *v7;
  CUIPSDLayoutMetricsChannel *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDLayoutMetricsChannel;
  v7 = -[CUIPSDLayoutMetricsChannel init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_edgeInsets.origin.x = x;
    v7->_edgeInsets.origin.y = y;
    v7->_edgeInsets.size.width = width;
    v7->_edgeInsets.size.height = height;
    -[CUIPSDLayoutMetricsChannel sanitizeEdgeInsets](v7, "sanitizeEdgeInsets");
  }
  return v8;
}

- (void)setEdgeInsets:(CGRect)a3
{
  self->_edgeInsets = a3;
  -[CUIPSDLayoutMetricsChannel sanitizeEdgeInsets](self, "sanitizeEdgeInsets");
}

- (CGRect)edgeInsets
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_edgeInsets.origin.x;
  y = self->_edgeInsets.origin.y;
  width = self->_edgeInsets.size.width;
  height = self->_edgeInsets.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end

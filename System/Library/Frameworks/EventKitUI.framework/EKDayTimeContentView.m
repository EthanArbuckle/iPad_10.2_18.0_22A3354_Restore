@implementation EKDayTimeContentView

- (void)setHourRange:(_NSRange)a3
{
  self->_hourRange = a3;
}

- (void)setOwner:(id)a3
{
  self->_owner = (EKDayTimeView *)a3;
}

- (EKDayTimeContentView)init
{
  EKDayTimeContentView *v2;
  EKDayTimeContentView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKDayTimeContentView;
  v2 = -[EKDayTimeContentView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EKDayTimeContentView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v4, "setNeedsDisplay");

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  EKDayTimeView *owner;
  uint64_t v9;
  uint64_t v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  owner = self->_owner;
  v9 = -[EKDayTimeContentView hourRange](self, "hourRange");
  -[EKDayTimeView drawRect:forContentView:withHourRange:](owner, "drawRect:forContentView:withHourRange:", self, v9, v10, x, y, width, height);
}

- (_NSRange)hourRange
{
  _NSRange *p_hourRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_hourRange = &self->_hourRange;
  location = self->_hourRange.location;
  length = p_hourRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (EKDayTimeView)owner
{
  return self->_owner;
}

@end

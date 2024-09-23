@implementation ATMovingAverage

- (ATMovingAverage)initWithWindow:(unint64_t)a3
{
  ATMovingAverage *v4;
  ATMovingAverage *v5;
  double *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATMovingAverage;
  v4 = -[ATMovingAverage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_window = a3;
    v6 = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->_count = 0;
    v5->_index = 0;
    v5->_values = v6;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)ATMovingAverage;
  -[ATMovingAverage dealloc](&v3, sel_dealloc);
}

- (void)update:(double)a3
{
  unint64_t count;
  unint64_t index;

  count = self->_count;
  if (self->_index == self->_window)
    index = 0;
  else
    index = self->_index;
  self->_values[index] = a3;
  self->_count = count + 1;
  self->_index = index + 1;
}

- (void)reset
{
  unint64_t window;

  window = self->_window;
  if (window)
    bzero(self->_values, 8 * window);
  self->_count = 0;
}

- (double)average
{
  unint64_t window;
  double *values;
  double v4;
  unint64_t v5;
  double v6;

  window = self->_window;
  if (window >= self->_count)
    window = self->_count;
  if (window)
  {
    values = self->_values;
    v4 = 0.0;
    v5 = window;
    do
    {
      v6 = *values++;
      v4 = v4 + v6;
      --v5;
    }
    while (v5);
  }
  else
  {
    v4 = 0.0;
  }
  return v4 / (double)window;
}

- (unint64_t)window
{
  return self->_window;
}

@end

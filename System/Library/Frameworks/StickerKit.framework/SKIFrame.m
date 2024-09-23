@implementation SKIFrame

- (SKIFrame)initWithStart:(double)a3 duration:(double)a4 image:(id)a5
{
  id v9;
  SKIFrame *v10;
  SKIFrame *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SKIFrame;
  v10 = -[SKIFrame init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_start = a3;
    v10->_duration = a4;
    objc_storeStrong((id *)&v10->_image, a5);
    v11->_end = v11->_start + v11->_duration;
  }

  return v11;
}

- (double)end
{
  double v3;
  double v4;
  double v5;

  -[SKIFrame start](self, "start");
  v4 = v3;
  -[SKIFrame duration](self, "duration");
  return v4 + v5;
}

- (int64_t)comparisonForTimeInterval:(double)a3
{
  if (self->_start > a3)
    return 1;
  if (self->_end >= a3)
    return 0;
  return -1;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end

@implementation MAChildProgressReporter

- (MAChildProgressReporter)initWithParentProgress:(id)a3 offset:(double)a4 scale:(double)a5
{
  id v9;
  id *v10;
  MAChildProgressReporter *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAChildProgressReporter;
  v10 = -[MAProgressReporter initForSubclasses](&v13, sel_initForSubclasses);
  v11 = (MAChildProgressReporter *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    v11->_offset = a4;
    v11->_scale = a5;
  }

  return v11;
}

- (BOOL)isCancelled
{
  return -[MAProgressReporter isCancelled](self->_parentProgress, "isCancelled");
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  return -[MAProgressReporter isCancelledWithProgress:currentTime:](self->_parentProgress, "isCancelledWithProgress:currentTime:", self->_offset + a3 * self->_scale, a4);
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  double scale;

  scale = self->_scale;
  return -[MAChildProgressReporter initWithParentProgress:offset:scale:]([MAChildProgressReporter alloc], "initWithParentProgress:offset:scale:", self->_parentProgress, self->_offset + a3 * scale, scale * a4);
}

- (MAProgressReporter)parentProgress
{
  return self->_parentProgress;
}

- (double)offset
{
  return self->_offset;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentProgress, 0);
}

@end

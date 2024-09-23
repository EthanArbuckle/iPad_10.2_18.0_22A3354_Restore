@implementation GKDelayOperation

- (GKDelayOperation)initWithDelay:(double)a3 andOperation:(id)a4
{
  id v6;
  GKDelayOperation *v7;
  GKDelayOperation *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKDelayOperation;
  v7 = -[GKDelayOperation init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[GKDelayOperation setDelayInSec:](v7, "setDelayInSec:", a3);
    -[GKDelayOperation setOperation:](v8, "setOperation:", v6);
  }

  return v8;
}

- (void)main
{
  double v3;

  -[GKDelayOperation delayInSec](self, "delayInSec");
  usleep((v3 * 1000.0 * 1000.0));
  if ((-[GKDelayOperation isCancelled](self, "isCancelled") & 1) == 0)
    (*((void (**)(void))self->_operation + 2))();
}

- (double)delayInSec
{
  return self->_delayInSec;
}

- (void)setDelayInSec:(double)a3
{
  self->_delayInSec = a3;
}

- (id)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operation, 0);
}

@end

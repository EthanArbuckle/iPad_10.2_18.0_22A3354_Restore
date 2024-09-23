@implementation ETOptimizerDefSGD

- (ETOptimizerDefSGD)init
{
  ETOptimizerDefSGD *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETOptimizerDefSGD;
  v2 = -[ETOptimizerDef init](&v8, sel_init);
  LODWORD(v3) = 1028443341;
  -[ETOptimizerDefSGD setLr:](v2, "setLr:", v3);
  LODWORD(v4) = 1064514355;
  -[ETOptimizerDefSGD setLr_decay_epoch:](v2, "setLr_decay_epoch:", v4);
  LODWORD(v5) = 1063675494;
  -[ETOptimizerDefSGD setMomentum:](v2, "setMomentum:", v5);
  LODWORD(v6) = 981668463;
  -[ETOptimizerDefSGD setWeight_decay:](v2, "setWeight_decay:", v6);
  return v2;
}

- (float)lr
{
  return *((float *)&self->super._batch_size + 1);
}

- (void)setLr:(float)a3
{
  *((float *)&self->super._batch_size + 1) = a3;
}

- (float)lr_decay_epoch
{
  return self->_lr;
}

- (void)setLr_decay_epoch:(float)a3
{
  self->_lr = a3;
}

- (float)momentum
{
  return self->_lr_decay_epoch;
}

- (void)setMomentum:(float)a3
{
  self->_lr_decay_epoch = a3;
}

- (float)weight_decay
{
  return self->_momentum;
}

- (void)setWeight_decay:(float)a3
{
  self->_momentum = a3;
}

@end

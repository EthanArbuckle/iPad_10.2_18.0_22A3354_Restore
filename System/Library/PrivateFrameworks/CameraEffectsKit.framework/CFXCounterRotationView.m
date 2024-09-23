@implementation CFXCounterRotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setZRotation:(double)a3
{
  void *v5;
  CGAffineTransform v6;
  objc_super v7;
  CGAffineTransform v8;

  if (self->_zRotation != a3)
  {
    self->_zRotation = a3;
    -[CFXCounterRotationView snapshotLayer](self, "snapshotLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setZRotation:", a3);

    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeRotation(&v8, a3);
    v7.receiver = self;
    v7.super_class = (Class)CFXCounterRotationView;
    v6 = v8;
    -[CFXCounterRotationView setTransform:](&v7, sel_setTransform_, &v6);
  }
}

- (double)zRotation
{
  return self->_zRotation;
}

@end

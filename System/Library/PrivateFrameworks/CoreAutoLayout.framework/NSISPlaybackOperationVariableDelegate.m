@implementation NSISPlaybackOperationVariableDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSISPlaybackOperationVariableDelegate;
  -[NSISPlaybackOperationVariableDelegate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSString *v3;
  objc_super v5;

  v3 = -[NSISPlaybackOperationVariableDelegate markedConstraintDescription](self, "markedConstraintDescription");
  if (!-[NSString length](v3, "length"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NSISPlaybackOperationVariableDelegate;
    return -[NSISPlaybackOperationVariableDelegate description](&v5, sel_description);
  }
  return v3;
}

- (id)firstItem
{
  return 0;
}

- (id)secondItem
{
  return 0;
}

- (NSISVariable)variable
{
  return (NSISVariable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVariable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)variableDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVariableDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)markedConstraintDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMarkedConstraintDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)variableIsUserObservable
{
  return self->_variableIsUserObservable;
}

- (void)setVariableIsUserObservable:(BOOL)a3
{
  self->_variableIsUserObservable = a3;
}

- (int)orientationHint
{
  return self->_orientationHint;
}

- (void)setOrientationHint:(int)a3
{
  self->_orientationHint = a3;
}

@end

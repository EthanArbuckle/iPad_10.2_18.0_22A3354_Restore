@implementation BMEventBinarySteppingImplementor

- (BOOL)isStarting
{
  return self->starting;
}

- (void)setStarting:(BOOL)a3
{
  self->starting = a3;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

@end

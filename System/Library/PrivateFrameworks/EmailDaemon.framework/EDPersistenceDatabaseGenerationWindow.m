@implementation EDPersistenceDatabaseGenerationWindow

- (void)insertGeneration:(int64_t)a3
{
  if (self->_earliestGeneration > a3)
    self->_earliestGeneration = a3;
  if (self->_latestGeneration < a3)
    self->_latestGeneration = a3;
}

- (EDPersistenceDatabaseGenerationWindow)init
{
  EDPersistenceDatabaseGenerationWindow *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPersistenceDatabaseGenerationWindow;
  result = -[EDPersistenceDatabaseGenerationWindow init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_earliestGeneration = xmmword_1D317A790;
  return result;
}

- (int64_t)earliestGeneration
{
  return self->_earliestGeneration;
}

- (int64_t)latestGeneration
{
  return self->_latestGeneration;
}

@end

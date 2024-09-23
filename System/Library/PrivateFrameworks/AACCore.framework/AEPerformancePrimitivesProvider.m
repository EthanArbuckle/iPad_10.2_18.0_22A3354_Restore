@implementation AEPerformancePrimitivesProvider

- (AEPerformancePrimitivesProvider)init
{
  AEPerformancePrimitivesProvider *v2;
  uint64_t v3;
  AEOSGestalt *OSGestalt;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEPerformancePrimitivesProvider;
  v2 = -[AEPerformancePrimitivesProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    OSGestalt = v2->_OSGestalt;
    v2->_OSGestalt = (AEOSGestalt *)v3;

  }
  return v2;
}

- (id)makePrimitives
{
  AEConcretePerformancePrimitives *v2;
  void *v3;

  if (self)
    self = (AEPerformancePrimitivesProvider *)self->_OSGestalt;
  if (-[AEPerformancePrimitivesProvider isInternalOS](self, "isInternalOS"))
  {
    v2 = [AEConcretePerformancePrimitives alloc];
    v3 = -[AEConcretePerformancePrimitives initWithSubsystem:](v2, AACLoggingSubsystem);
  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OSGestalt, 0);
}

@end

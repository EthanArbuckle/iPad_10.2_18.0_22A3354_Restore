@implementation IRServiceIdentifierMapping

- (IRServiceIdentifierMapping)initWithServicePackage:(int64_t)a3 observerClientIdentifiers:(id)a4
{
  id v6;
  IRServiceIdentifierMapping *v7;
  IRServiceIdentifierMapping *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceIdentifierMapping;
  v7 = -[IRServiceIdentifierMapping init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[IRServiceIdentifierMapping setServicePackage:](v7, "setServicePackage:", a3);
    v9 = (void *)objc_msgSend(v6, "copy");
    -[IRServiceIdentifierMapping setObserverClientIdentifiers:](v8, "setObserverClientIdentifiers:", v9);

  }
  return v8;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (void)setServicePackage:(int64_t)a3
{
  self->_servicePackage = a3;
}

- (NSArray)observerClientIdentifiers
{
  return self->_observerClientIdentifiers;
}

- (void)setObserverClientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_observerClientIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerClientIdentifiers, 0);
}

@end

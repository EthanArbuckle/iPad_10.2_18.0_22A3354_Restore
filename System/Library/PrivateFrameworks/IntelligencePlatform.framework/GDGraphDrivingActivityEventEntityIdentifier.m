@implementation GDGraphDrivingActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphDrivingActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphDrivingActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](a3, sel_graphDrivingActivityEventFromEntityIdentifier_error_, self);
}

- (NSString)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_stringValue(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithFormat_(v3, v7, (uint64_t)CFSTR("<GDGraphDrivingActivityEventEntityIdentifier: %@>"), v6);

  return (NSString *)v8;
}

- (GDGraphDrivingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphDrivingActivityEventEntityIdentifier *)MEMORY[0x1E0DE7D20](self, sel_initFromGDEntityIdentifier_, a3);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_initWithEntityIdentifier_, a3);
}

@end

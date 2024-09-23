@implementation GDKTSContextRepresentation

- (GDKTSContextRepresentation)initWithOriginContext:(id)a3 ktsContext:(id)a4 destinationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDKTSContextRepresentation *v13;
  uint64_t v14;
  NSArray *originContext;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *ktsContext;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *destinationContext;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDKTSContextRepresentation;
  v13 = -[GDKTSContextRepresentation init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    originContext = v13->_originContext;
    v13->_originContext = (NSArray *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    ktsContext = v13->_ktsContext;
    v13->_ktsContext = (NSArray *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    destinationContext = v13->_destinationContext;
    v13->_destinationContext = (NSArray *)v22;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *originContext;
  id v5;
  void *v6;
  const char *v7;
  NSArray *ktsContext;
  void *v9;
  const char *v10;
  NSArray *destinationContext;
  const char *v12;
  id v13;

  originContext = self->_originContext;
  v5 = a3;
  NSStringFromSelector(sel_originContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)originContext, v6);

  ktsContext = self->_ktsContext;
  NSStringFromSelector(sel_ktsContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)ktsContext, v9);

  destinationContext = self->_destinationContext;
  NSStringFromSelector(sel_destinationContext);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)destinationContext, v13);

}

- (GDKTSContextRepresentation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  GDKTSContextRepresentation *v18;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_originContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_ktsContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_destinationContext);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (GDKTSContextRepresentation *)objc_msgSend_initWithOriginContext_ktsContext_destinationContext_(self, v17, (uint64_t)v8, v12, v16);
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(GDKTSContextRepresentation, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithOriginContext_ktsContext_destinationContext_(v4, v5, (uint64_t)self->_originContext, self->_ktsContext, self->_destinationContext);
}

- (NSArray)activities
{
  return self->activities;
}

- (NSArray)destinationActivities
{
  return self->destinationActivities;
}

- (NSArray)destinationPeople
{
  return self->destinationPeople;
}

- (NSArray)destinationPlaces
{
  return self->destinationPlaces;
}

- (NSArray)originActivities
{
  return self->originActivities;
}

- (NSArray)originPeople
{
  return self->originPeople;
}

- (NSArray)originPlaces
{
  return self->originPlaces;
}

- (NSArray)people
{
  return self->people;
}

- (NSArray)places
{
  return self->places;
}

- (NSArray)originContext
{
  return self->_originContext;
}

- (NSArray)ktsContext
{
  return self->_ktsContext;
}

- (NSArray)destinationContext
{
  return self->_destinationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContext, 0);
  objc_storeStrong((id *)&self->_ktsContext, 0);
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->places, 0);
  objc_storeStrong((id *)&self->people, 0);
  objc_storeStrong((id *)&self->originPlaces, 0);
  objc_storeStrong((id *)&self->originPeople, 0);
  objc_storeStrong((id *)&self->originActivities, 0);
  objc_storeStrong((id *)&self->destinationPlaces, 0);
  objc_storeStrong((id *)&self->destinationPeople, 0);
  objc_storeStrong((id *)&self->destinationActivities, 0);
  objc_storeStrong((id *)&self->activities, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

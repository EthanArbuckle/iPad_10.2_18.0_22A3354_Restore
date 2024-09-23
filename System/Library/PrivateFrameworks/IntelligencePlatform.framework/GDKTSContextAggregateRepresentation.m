@implementation GDKTSContextAggregateRepresentation

- (GDKTSContextAggregateRepresentation)initWithOriginContexts:(id)a3 ktsContexts:(id)a4 destinationContexts:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDKTSContextAggregateRepresentation *v13;
  uint64_t v14;
  NSArray *originContexts;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *ktsContexts;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *destinationContexts;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDKTSContextAggregateRepresentation;
  v13 = -[GDKTSContextAggregateRepresentation init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    originContexts = v13->_originContexts;
    v13->_originContexts = (NSArray *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    ktsContexts = v13->_ktsContexts;
    v13->_ktsContexts = (NSArray *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    destinationContexts = v13->_destinationContexts;
    v13->_destinationContexts = (NSArray *)v22;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *originContexts;
  id v5;
  void *v6;
  const char *v7;
  NSArray *ktsContexts;
  void *v9;
  const char *v10;
  NSArray *destinationContexts;
  const char *v12;
  id v13;

  originContexts = self->_originContexts;
  v5 = a3;
  NSStringFromSelector(sel_originContexts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)originContexts, v6);

  ktsContexts = self->_ktsContexts;
  NSStringFromSelector(sel_ktsContexts);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)ktsContexts, v9);

  destinationContexts = self->_destinationContexts;
  NSStringFromSelector(sel_destinationContexts);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)destinationContexts, v13);

}

- (GDKTSContextAggregateRepresentation)initWithCoder:(id)a3
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
  GDKTSContextAggregateRepresentation *v18;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_originContexts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_ktsContexts);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_destinationContexts);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (GDKTSContextAggregateRepresentation *)objc_msgSend_initWithOriginContexts_ktsContexts_destinationContexts_(self, v17, (uint64_t)v8, v12, v16);
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(GDKTSContextAggregateRepresentation, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithOriginContexts_ktsContexts_destinationContexts_(v4, v5, (uint64_t)self->_originContexts, self->_ktsContexts, self->_destinationContexts);
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

- (NSArray)originContexts
{
  return self->_originContexts;
}

- (NSArray)ktsContexts
{
  return self->_ktsContexts;
}

- (NSArray)destinationContexts
{
  return self->_destinationContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContexts, 0);
  objc_storeStrong((id *)&self->_ktsContexts, 0);
  objc_storeStrong((id *)&self->_originContexts, 0);
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

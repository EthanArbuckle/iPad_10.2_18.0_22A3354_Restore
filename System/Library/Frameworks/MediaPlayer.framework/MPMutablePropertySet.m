@implementation MPMutablePropertySet

- (MPMutablePropertySet)init
{
  return -[MPMutablePropertySet initWithProperties:relationships:](self, "initWithProperties:relationships:", 0, 0);
}

- (MPMutablePropertySet)initWithProperties:(id)a3 relationships:(id)a4
{
  MPMutablePropertySet *v4;
  MPMutablePropertySet *v5;
  uint64_t v6;
  NSSet *properties;
  uint64_t v8;
  NSDictionary *relationships;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPMutablePropertySet;
  v4 = -[MPPropertySet initWithProperties:relationships:](&v11, sel_initWithProperties_relationships_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSSet mutableCopy](v4->super._properties, "mutableCopy");
    properties = v5->super._properties;
    v5->super._properties = (NSSet *)v6;

    v8 = -[NSDictionary mutableCopy](v5->super._relationships, "mutableCopy");
    relationships = v5->super._relationships;
    v5->super._relationships = (NSDictionary *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPPropertySet *v4;
  void *v5;
  MPPropertySet *v6;

  v4 = [MPPropertySet alloc];
  -[NSSet allObjects](self->super._properties, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPPropertySet initWithProperties:relationships:](v4, "initWithProperties:relationships:", v5, self->super._relationships);

  return v6;
}

- (void)addProperty:(id)a3
{
  -[NSSet addObject:](self->super._properties, "addObject:", a3);
}

- (void)removeProperty:(id)a3
{
  -[NSSet removeObject:](self->super._properties, "removeObject:", a3);
}

- (void)addRelationship:(id)a3 properties:(id)a4
{
  NSDictionary *v6;
  id v7;
  id v8;

  v6 = self->super._relationships;
  v7 = a3;
  v8 = (id)objc_msgSend(a4, "copy");
  -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)removeRelationship:(id)a3
{
  -[NSDictionary removeObjectForKey:](self->super._relationships, "removeObjectForKey:", a3);
}

@end

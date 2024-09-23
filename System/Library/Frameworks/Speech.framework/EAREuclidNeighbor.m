@implementation EAREuclidNeighbor

- (EAREuclidNeighbor)initWithEuclidNeighbor:(id)a3
{
  id v4;
  EAREuclidNeighbor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSNumber *distance;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EAREuclidNeighbor;
  v5 = -[EAREuclidNeighbor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "distance");
    v8 = objc_claimAutoreleasedReturnValue();
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distance, CFSTR("distance"));

}

- (EAREuclidNeighbor)initWithCoder:(id)a3
{
  id v4;
  EAREuclidNeighbor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSNumber *distance;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EAREuclidNeighbor;
  v5 = -[EAREuclidNeighbor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distance"));
    v8 = objc_claimAutoreleasedReturnValue();
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

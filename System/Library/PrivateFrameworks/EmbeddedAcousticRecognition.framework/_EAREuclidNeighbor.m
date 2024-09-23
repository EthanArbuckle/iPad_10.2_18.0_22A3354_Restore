@implementation _EAREuclidNeighbor

- (_EAREuclidNeighbor)initWithName:(id)a3 distance:(id)a4
{
  NSString *v6;
  NSNumber *v7;
  NSString *name;
  NSString *v9;
  NSNumber *distance;

  v6 = (NSString *)a3;
  v7 = (NSNumber *)a4;
  name = self->_name;
  self->_name = v6;
  v9 = v6;

  distance = self->_distance;
  self->_distance = v7;

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EAREuclidNeighbor;
  -[_EAREuclidNeighbor description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EAREuclidNeighbor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EAREuclidNeighbor distance](self, "distance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" name=%@, distance=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

@end

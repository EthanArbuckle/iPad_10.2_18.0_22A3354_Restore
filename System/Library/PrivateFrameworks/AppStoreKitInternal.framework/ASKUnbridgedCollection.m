@implementation ASKUnbridgedCollection

- (ASKUnbridgedCollection)initWithCollection:(id)a3
{
  id v5;
  ASKUnbridgedCollection *v6;
  ASKUnbridgedCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKUnbridgedCollection;
  v6 = -[ASKUnbridgedCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_collection, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASKUnbridgedCollection collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ASKUnbridgedCollection collection](self, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ASKUnbridgedCollection collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[ASKUnbridgedCollection collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collection, 0);
}

@end

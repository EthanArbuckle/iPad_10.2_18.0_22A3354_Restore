@implementation _PHFetchRequestWrapper

- (_PHFetchRequestWrapper)initWithFetchRequest:(id)a3 containerIdentifier:(id)a4 fetchPropertySets:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PHFetchRequestWrapper *v12;
  _PHFetchRequestWrapper *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_PHFetchRequestWrapper;
  v12 = -[_PHFetchRequestWrapper init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchRequest, a3);
    objc_msgSend(v9, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v13->_hash = _FastHashForPredicate(v14);
    }
    else
    {
      objc_msgSend(v9, "entityName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_hash = objc_msgSend(v16, "hash");

    }
    objc_storeStrong((id *)&v13->_containerIdentifier, a4);
    objc_storeStrong((id *)&v13->_fetchPropertySets, a5);

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_PHFetchRequestWrapper fetchRequest](self, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqual:", v6))
    {
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[_PHFetchRequestWrapper containerIdentifier](self, "containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      -[_PHFetchRequestWrapper fetchPropertySets](self, "fetchPropertySets", v18, v20);
    }
    else
    {
      -[_PHFetchRequestWrapper containerIdentifier](self, "containerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      -[_PHFetchRequestWrapper fetchPropertySets](self, "fetchPropertySets", v10, v9);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchPropertySets");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

      v11 = 1;
    }
    else
    {
      v14 = (void *)v13;
      -[_PHFetchRequestWrapper fetchPropertySets](self, "fetchPropertySets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fetchPropertySets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "isEqualToSet:", v16);

    }
    v10 = v19;
    v9 = v21;
    if (v7 == v8)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _PHFetchRequestWrapper *v6;
  void *v7;
  _PHFetchRequestWrapper *v8;

  -[_PHFetchRequestWrapper fetchRequest](self, "fetchRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = [_PHFetchRequestWrapper alloc];
  v7 = (void *)-[NSManagedObjectID copy](self->_containerIdentifier, "copy");
  v8 = -[_PHFetchRequestWrapper initWithFetchRequest:containerIdentifier:fetchPropertySets:](v6, "initWithFetchRequest:containerIdentifier:fetchPropertySets:", v5, v7, self->_fetchPropertySets);

  return v8;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSManagedObjectID)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSSet)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end

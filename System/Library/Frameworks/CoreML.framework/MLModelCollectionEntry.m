@implementation MLModelCollectionEntry

- (BOOL)isEqualToModelCollectionEntry:(MLModelCollectionEntry *)entry
{
  MLModelCollectionEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = entry;
  -[MLModelCollectionEntry modelIdentifier](self, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollectionEntry modelIdentifier](v4, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[MLModelCollectionEntry modelURL](self, "modelURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModelCollectionEntry modelURL](v4, "modelURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MLModelCollectionEntry *v4;
  BOOL v5;

  v4 = (MLModelCollectionEntry *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[MLModelCollectionEntry isEqualToModelCollectionEntry:](self, "isEqualToModelCollectionEntry:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MLModelCollectionEntry modelIdentifier](self, "modelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MLModelCollectionEntry modelURL](self, "modelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 37 * v4 + 1147;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollectionEntry modelIdentifier](self, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_initWithModelIdentifier:(id)a3 modelUrl:(id)a4
{
  id v7;
  id v8;
  MLModelCollectionEntry *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelCollectionEntry;
  v9 = -[MLModelCollectionEntry init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

+ (MLModelCollectionEntry)entryWithModelIdentifier:(id)a3 modelURL:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MLModelCollectionEntry _initWithModelIdentifier:modelUrl:]([MLModelCollectionEntry alloc], "_initWithModelIdentifier:modelUrl:", v6, v5);

  return (MLModelCollectionEntry *)v7;
}

@end

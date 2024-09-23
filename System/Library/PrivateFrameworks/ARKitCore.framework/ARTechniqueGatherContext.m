@implementation ARTechniqueGatherContext

- (ARTechniqueGatherContext)initWithParentContext:(id)a3
{
  id v5;
  ARTechniqueGatherContext *v6;
  ARTechniqueGatherContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueGatherContext;
  v6 = -[ARTechniqueGatherContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_parentContext, a3);

  return v7;
}

- (NSArray)gatheredData
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)imageData
{
  void *v2;
  void *v3;

  -[ARTechniqueGatherContext parentContext](self, "parentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)cameraPosition
{
  void *v2;
  int64_t v3;

  -[ARTechniqueGatherContext parentContext](self, "parentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraPosition");

  return v3;
}

- (id)resultDataOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(self->_parentContext, "resultDataOfClass:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARTechniqueGatherContext gatheredData](self, "gatheredData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__ARTechniqueGatherContext_resultDataOfClass___block_invoke;
  v12[3] = &__block_descriptor_40_e41_B24__0___ARResultData__8__NSDictionary_16lu32l8;
  v12[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;

  return v10;
}

uint64_t __46__ARTechniqueGatherContext_resultDataOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)anchorsToAdd
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ARTechniqueGatherContext parentContext](self, "parentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ARTechniqueGatherContext parentContext](self, "parentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchorsToAdd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)anchorsToRemove
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ARTechniqueGatherContext parentContext](self, "parentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ARTechniqueGatherContext parentContext](self, "parentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchorsToRemove");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)ARTechniqueGatherContext;
  -[ARTechniqueGatherContext description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARTechniqueGatherContext gatheredData](self, "gatheredData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("gatheredData: %@\n"), v6);

  -[ARTechniqueGatherContext imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("imageData: %@\n"), v7);

  -[ARTechniqueGatherContext parentContext](self, "parentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("parentContext: %@\n"), v8);

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARTechniqueGatherContext)initWithCoder:(id)a3
{
  id v4;
  ARTechniqueGatherContext *v5;
  uint64_t v6;
  id parentContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueGatherContext;
  v5 = -[ARTechniqueGatherContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("parentContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentContext = v5->_parentContext;
    v5->_parentContext = (id)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_parentContext, CFSTR("parentContext"));
}

- (id)parentContext
{
  return self->_parentContext;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parentContext, 0);
}

@end

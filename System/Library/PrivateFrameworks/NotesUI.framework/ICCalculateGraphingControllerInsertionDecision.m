@implementation ICCalculateGraphingControllerInsertionDecision

+ (id)cache
{
  if (cache_onceToken != -1)
    dispatch_once(&cache_onceToken, &__block_literal_global_61);
  return (id)cache_cache;
}

uint64_t __55__ICCalculateGraphingControllerInsertionDecision_cache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)cache_cache;
  cache_cache = (uint64_t)v0;

  return objc_msgSend((id)cache_cache, "setCountLimit:", 8);
}

- (ICCalculateGraphingControllerInsertionDecision)initWithError:(id)a3 allowsInsertingNewGraph:(BOOL)a4 allowsAddingToGraph:(BOOL)a5
{
  id v9;
  ICCalculateGraphingControllerInsertionDecision *v10;
  ICCalculateGraphingControllerInsertionDecision *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICCalculateGraphingControllerInsertionDecision;
  v10 = -[ICCalculateGraphingControllerInsertionDecision init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_error, a3);
    v11->_allowsInsertingNewGraph = a4;
    v11->_allowsAddingToGraph = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCalculateGraphingControllerInsertionDecision error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCalculateGraphingControllerInsertionDecision allowsInsertingNewGraph](self, "allowsInsertingNewGraph"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCalculateGraphingControllerInsertionDecision allowsAddingToGraph](self, "allowsAddingToGraph"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, error: %@, allowsInsertingNewGraph: %@, allowsAddingToGraph: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)makeMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self, v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICCalculateGraphingControllerInsertionDecision allowsInsertingNewGraph](self, "allowsInsertingNewGraph"))
  {
    v7 = (void *)MEMORY[0x1E0DC3678];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Insert Graph"), CFSTR("Insert Graph"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commandWithTitle:image:action:propertyList:", v8, 0, sel_insertGraph_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v9);
  }
  if (-[ICCalculateGraphingControllerInsertionDecision allowsAddingToGraph](self, "allowsAddingToGraph"))
  {
    v10 = (void *)MEMORY[0x1E0DC3678];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Add to Existing"), CFSTR("Add to Existing"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "commandWithTitle:image:action:propertyList:", v11, 0, sel_addToGraph_, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v12);
  }
  v13 = (unint64_t)objc_msgSend(v6, "count") < 2;
  v14 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Graphs"), CFSTR("Graphs"), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", v15, 0, 0, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)allowsInsertingNewGraph
{
  return self->_allowsInsertingNewGraph;
}

- (BOOL)allowsAddingToGraph
{
  return self->_allowsAddingToGraph;
}

- (BOOL)prefersExistingGraph
{
  return self->_prefersExistingGraph;
}

- (void)setPrefersExistingGraph:(BOOL)a3
{
  self->_prefersExistingGraph = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end

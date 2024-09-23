@implementation HDSimpleGraphNode

- (HDSimpleGraphNode)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 deleted:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  id v16;
  HDSimpleGraphNode *v17;
  HDSimpleGraphNode *v18;
  objc_super v20;

  v8 = a8;
  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HDSimpleGraphNode;
  v17 = -[HDSimpleGraphObject initWithRowID:version:slots:deleted:](&v20, sel_initWithRowID_version_slots_deleted_, a3, a6, a7, v8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_attributes, a4);
    objc_storeStrong((id *)&v18->_relationships, a5);
  }

  return v18;
}

- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5
{
  return -[HDSimpleGraphNode initWithRowID:attributes:relationships:version:slots:deleted:](self, "initWithRowID:attributes:relationships:version:slots:deleted:", a3, a4, a5, 0, 0, 0);
}

- (id)description
{
  NSArray *attributes;
  __CFString *v4;
  NSArray *relationships;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  attributes = self->_attributes;
  if (attributes)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[NSArray count](attributes, "count"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("nil");
  }
  relationships = self->_relationships;
  if (relationships)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[NSArray count](relationships, "count"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)HDSimpleGraphNode;
  -[HDSimpleGraphObject description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ attributes:%@, relationships:%@>"), v8, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end

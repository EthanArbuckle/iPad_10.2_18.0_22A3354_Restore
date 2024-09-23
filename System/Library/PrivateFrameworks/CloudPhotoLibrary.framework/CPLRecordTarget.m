@implementation CPLRecordTarget

- (CPLRecordTarget)initWithScopedIdentifier:(id)a3 otherScopedIdentifier:(id)a4 targetState:(int64_t)a5
{
  id v9;
  id v10;
  CPLRecordTarget *v11;
  CPLRecordTarget *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLRecordTarget;
  v11 = -[CPLRecordTarget init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scopedIdentifier, a3);
    v12->_targetState = a5;
    objc_storeStrong((id *)&v12->_otherScopedIdentifier, a4);
  }

  return v12;
}

- (CPLRecordTarget)initWithScopedIdentifier:(id)a3
{
  return -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](self, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", a3, 0, 1);
}

- (CPLRecordTarget)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CPLRecordTarget *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("o"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));

  v8 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](self, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  CPLScopedIdentifier *scopedIdentifier;
  id v5;

  scopedIdentifier = self->_scopedIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scopedIdentifier, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherScopedIdentifier, CFSTR("o"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_targetState, CFSTR("t"));

}

- (BOOL)shouldUploadToOtherRecord
{
  return self->_targetState > 1uLL;
}

- (NSArray)targetScopedIdentifiers
{
  CPLScopedIdentifier *otherScopedIdentifier;
  void *v3;
  CPLScopedIdentifier **p_scopedIdentifier;
  uint64_t v5;
  CPLScopedIdentifier *v7;
  CPLScopedIdentifier *scopedIdentifier;
  CPLScopedIdentifier *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    scopedIdentifier = self->_scopedIdentifier;
    v9 = otherScopedIdentifier;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_scopedIdentifier = &scopedIdentifier;
    v5 = 2;
  }
  else
  {
    v7 = self->_scopedIdentifier;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_scopedIdentifier = &v7;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", p_scopedIdentifier, v5, v7, scopedIdentifier, v9, v10);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (CPLScopedIdentifier)resourceScopedIdentifier
{
  uint64_t v2;

  v2 = 8;
  if ((self->_targetState & 0xFFFFFFFFFFFFFFFELL) == 2)
    v2 = 24;
  return (CPLScopedIdentifier *)*(id *)((char *)&self->super.isa + v2);
}

- (id)description
{
  CPLScopedIdentifier *otherScopedIdentifier;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  CPLScopedIdentifier *scopedIdentifier;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  CPLScopedIdentifier *v15;
  CPLScopedIdentifier *v16;
  void *v17;
  void *v18;

  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    -[CPLScopedIdentifier identifier](otherScopedIdentifier, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLScopedIdentifier identifier](self->_scopedIdentifier, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      v7 = -[CPLScopedIdentifier scopeIndex](self->_otherScopedIdentifier, "scopeIndex");
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      scopedIdentifier = self->_scopedIdentifier;
      -[CPLScopedIdentifier scopeIdentifier](self->_otherScopedIdentifier, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 < 1)
      {
        +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", self->_targetState);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<Target %@->%@ (%@)>"), scopedIdentifier, v10, v18);

      }
      else
      {
        v11 = -[CPLScopedIdentifier scopeIndex](self->_otherScopedIdentifier, "scopeIndex");
        +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", self->_targetState);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<Target %@->%@(%lu) (%@)>"), scopedIdentifier, v10, v11, v12);

      }
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      v15 = self->_otherScopedIdentifier;
      v16 = self->_scopedIdentifier;
      +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", self->_targetState);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("<Target %@->%@ (%@)>"), v16, v15, v17);

    }
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<Target %@>"), self->_scopedIdentifier);
  }
  return v13;
}

- (NSString)simpleDescription
{
  CPLScopedIdentifier *otherScopedIdentifier;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  CPLScopedIdentifier *v9;
  void *v10;
  void *v11;
  void *v12;

  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    -[CPLScopedIdentifier identifier](otherScopedIdentifier, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLScopedIdentifier identifier](self->_scopedIdentifier, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[CPLScopedIdentifier descriptionWithNoScopeIndex](self->_scopedIdentifier, "descriptionWithNoScopeIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_otherScopedIdentifier;
    if (v6)
      -[CPLScopedIdentifier scopeIdentifier](v9, "scopeIdentifier");
    else
      -[CPLScopedIdentifier descriptionWithNoScopeIndex](v9, "descriptionWithNoScopeIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", self->_targetState);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@->%@ (%@)>"), v8, v11, v12);

  }
  else
  {
    -[CPLScopedIdentifier descriptionWithNoScopeIndex](self->_scopedIdentifier, "descriptionWithNoScopeIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  CPLRecordTarget *v4;
  id v5;
  CPLScopedIdentifier *v6;
  CPLScopedIdentifier *v7;
  BOOL v8;

  v4 = (CPLRecordTarget *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_targetState == self->_targetState
      && -[CPLScopedIdentifier isEqual:](v4->_scopedIdentifier, "isEqual:", self->_scopedIdentifier))
    {
      v5 = v4->_otherScopedIdentifier;
      v6 = self->_otherScopedIdentifier;
      v7 = v6;
      v8 = v5 && v6 && (objc_msgSend(v5, "isEqual:", v6) & 1) != 0 || ((unint64_t)v5 | (unint64_t)v7) == 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (CPLScopedIdentifier)otherScopedIdentifier
{
  return self->_otherScopedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
}

+ (id)descriptionForTargetState:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), a3);
  else
    v3 = off_1E60D8998[a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

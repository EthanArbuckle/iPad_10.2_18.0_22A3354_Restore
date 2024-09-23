@implementation HKSortedQueryAnchor

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 objectID:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSortedQueryAnchor.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortDescriptors"));

  }
  objc_msgSend(v7, "hk_map:", &__block_literal_global_109);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithSortConstraints:objectID:", v8, v10);

  return v11;
}

HKQuerySortConstraint *__69__HKSortedQueryAnchor_sortedQueryAnchorWithSortDescriptors_objectID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuerySortConstraint sortConstraintWithSortDescriptor:predicate:](HKQuerySortConstraint, "sortConstraintWithSortDescriptor:predicate:", a2, 0);
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSortedQueryAnchor.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortDescriptors"));

  }
  objc_msgSend(v5, "hk_map:", &__block_literal_global_12_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSortConstraints:objectID:", v6, 0);

  return v7;
}

HKQuerySortConstraint *__60__HKSortedQueryAnchor_sortedQueryAnchorWithSortDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuerySortConstraint sortConstraintWithSortDescriptor:predicate:](HKQuerySortConstraint, "sortConstraintWithSortDescriptor:predicate:", a2, 0);
}

- (HKSortedQueryAnchor)init
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

- (HKSortedQueryAnchor)initWithSortConstraints:(id)a3 objectID:(id)a4
{
  id v7;
  id v8;
  HKSortedQueryAnchor *v9;
  uint64_t v10;
  NSArray *sortConstraints;
  uint64_t v12;
  NSNumber *objectID;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSortedQueryAnchor.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortConstraints"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HKSortedQueryAnchor;
  v9 = -[HKSortedQueryAnchor init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    sortConstraints = v9->_sortConstraints;
    v9->_sortConstraints = (NSArray *)v10;

    v12 = objc_msgSend(v8, "copy");
    objectID = v9->_objectID;
    v9->_objectID = (NSNumber *)v12;

  }
  return v9;
}

+ (id)sortConstraintsWithSortDescriptors:(id)a3 sample:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HKSortedQueryAnchor_sortConstraintsWithSortDescriptors_sample___block_invoke;
  v9[3] = &unk_1E37F5080;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __65__HKSortedQueryAnchor_sortConstraintsWithSortDescriptors_sample___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3518];
  v4 = a2;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_equalityPredicateWithKey:value:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKQuerySortConstraint sortConstraintWithSortDescriptor:predicate:](HKQuerySortConstraint, "sortConstraintWithSortDescriptor:predicate:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 includingSample:(id)a4 objectID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "sortConstraintsWithSortDescriptors:sample:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc((Class)a1);
  if (v10)
    v12 = v10;
  else
    v12 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithSortConstraints:objectID:", v12, v13);

  return v14;
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 followingSample:(id)a4 objectID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "sortConstraintsWithSortDescriptors:sample:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc((Class)a1);
  if (v10)
    v12 = v10;
  else
    v12 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithSortConstraints:objectID:", v12, v13);

  return v14;
}

+ (id)sortedQueryAnchorRelaxingConstraintsWithAnchor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[3];
  char v17;

  v6 = a3;
  objc_msgSend(v6, "sortConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_reversed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke;
  v15[3] = &unk_1E37F50A8;
  v15[4] = v16;
  objc_msgSend(v8, "hk_map:error:", v15, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_reversed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  objc_msgSend(v10, "hk_filter:", &__block_literal_global_21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to relax query anchor"));
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSortConstraints:objectID:", v10, 0);
LABEL_6:

  _Block_object_dispose(v16, 8);
  return v13;
}

id __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) && (objc_msgSend(v5, "canRelax") & 1) != 0)
  {
    +[HKQuerySortConstraint sortConstraintByRelaxingSortConstraint:error:](HKQuerySortConstraint, "sortConstraintByRelaxingSortConstraint:error:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "canRelax"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      v9 = v8;
    }

  }
  else
  {
    v8 = (void *)objc_msgSend(v6, "copy");
  }

  return v8;
}

BOOL __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)querySortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HKSortedQueryAnchor sortConstraints](self, "sortConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_26_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("HKObjectSortIdentifierDataID"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__HKSortedQueryAnchor_querySortDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sortDescriptor");
}

- (id)predicate
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSortedQueryAnchor sortConstraints](self, "sortConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_28_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __32__HKSortedQueryAnchor_predicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicate");
}

- (BOOL)isCompatibleWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HKSortedQueryAnchor sortConstraints](self, "sortConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_30_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToArray:", v4);

  return v7;
}

uint64_t __55__HKSortedQueryAnchor_isCompatibleWithSortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sortDescriptor");
}

- (BOOL)canRelax
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[HKSortedQueryAnchor sortConstraints](self, "sortConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_filter:", &__block_literal_global_31_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HKSortedQueryAnchor objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v5 + 1;
  else
    v7 = v5;
  return v7 > 1;
}

uint64_t __31__HKSortedQueryAnchor_canRelax__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canRelax");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKSortedQueryAnchor sortConstraints](self, "sortConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSortedQueryAnchor objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKSortedQueryAnchor *v4;
  HKSortedQueryAnchor *v5;
  NSArray *sortConstraints;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  void *v12;
  BOOL v13;
  NSNumber *objectID;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  void *v19;

  v4 = (HKSortedQueryAnchor *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sortConstraints = self->_sortConstraints;
      -[HKSortedQueryAnchor sortConstraints](v5, "sortConstraints");
      v7 = objc_claimAutoreleasedReturnValue();
      if (sortConstraints == (NSArray *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKSortedQueryAnchor sortConstraints](v5, "sortConstraints");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        v11 = self->_sortConstraints;
        -[HKSortedQueryAnchor sortConstraints](v5, "sortConstraints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[NSArray isEqual:](v11, "isEqual:", v12);

        if (!(_DWORD)v11)
          goto LABEL_15;
      }
      objectID = self->_objectID;
      -[HKSortedQueryAnchor objectID](v5, "objectID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (objectID == (NSNumber *)v15)
      {

LABEL_17:
        v13 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKSortedQueryAnchor objectID](v5, "objectID");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v18 = self->_objectID;
        -[HKSortedQueryAnchor objectID](v5, "objectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = -[NSNumber isEqual:](v18, "isEqual:", v19);

        if ((v18 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v13 = 0;
  }
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSortedQueryAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSortedQueryAnchor *v10;
  id *p_isa;
  HKSortedQueryAnchor *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("SortConstraints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObjectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)HKSortedQueryAnchor;
    v10 = -[HKSortedQueryAnchor init](&v14, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_sortConstraints, v8);
      objc_storeStrong(p_isa + 1, v9);
    }
    self = p_isa;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sortConstraints;
  id v5;

  sortConstraints = self->_sortConstraints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sortConstraints, CFSTR("SortConstraints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectID, CFSTR("ObjectID"));

}

- (NSNumber)objectID
{
  return self->_objectID;
}

- (NSArray)sortConstraints
{
  return self->_sortConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortConstraints, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end

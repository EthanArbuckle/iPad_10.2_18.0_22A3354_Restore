@implementation HDQueryDescriptor

- (HDQueryDescriptor)init
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

+ (HDQueryDescriptor)queryDescriptorWithSampleType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:", v6, 0, 0, 0, 0, 0, 0);
  return (HDQueryDescriptor *)v7;
}

+ (HDQueryDescriptor)queryDescriptorWithSampleTypes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:", v4, 0, 0, 0, 0, 0, 0);

  return (HDQueryDescriptor *)v5;
}

- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 samplePredicate:(id)a7
{
  return -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:](self, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:", a3, a4, a5, a6, 0, a7, 0);
}

- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 filter:(id)a7 samplePredicate:(id)a8 deletedObjectsPredicate:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HDQueryDescriptor *v23;
  uint64_t v24;
  NSSet *sampleTypes;
  uint64_t v26;
  NSDictionary *encodingOptions;
  uint64_t v28;
  NSSet *restrictedSourceEntities;
  void *v30;
  id authorizationFilter;
  uint64_t v32;
  _HKFilter *filter;
  uint64_t v34;
  HDSQLitePredicate *samplePredicate;
  uint64_t v36;
  HDSQLitePredicate *deletedObjectsPredicate;
  void *v39;
  void *v40;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryDescriptor.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleTypes"));

  }
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryDescriptor.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleTypes.count"));

  }
  v41.receiver = self;
  v41.super_class = (Class)HDQueryDescriptor;
  v23 = -[HDQueryDescriptor init](&v41, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    sampleTypes = v23->_sampleTypes;
    v23->_sampleTypes = (NSSet *)v24;

    v26 = objc_msgSend(v17, "copy");
    encodingOptions = v23->_encodingOptions;
    v23->_encodingOptions = (NSDictionary *)v26;

    v28 = objc_msgSend(v18, "copy");
    restrictedSourceEntities = v23->_restrictedSourceEntities;
    v23->_restrictedSourceEntities = (NSSet *)v28;

    v30 = _Block_copy(v19);
    authorizationFilter = v23->_authorizationFilter;
    v23->_authorizationFilter = v30;

    v32 = objc_msgSend(v20, "copy");
    filter = v23->_filter;
    v23->_filter = (_HKFilter *)v32;

    v34 = objc_msgSend(v21, "copy");
    samplePredicate = v23->_samplePredicate;
    v23->_samplePredicate = (HDSQLitePredicate *)v34;

    v36 = objc_msgSend(v22, "copy");
    deletedObjectsPredicate = v23->_deletedObjectsPredicate;
    v23->_deletedObjectsPredicate = (HDSQLitePredicate *)v36;

  }
  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[HDQueryDescriptor sampleTypes](self, "sampleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HDQueryDescriptor encodingOptions](self, "encodingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HDQueryDescriptor restrictedSourceEntities](self, "restrictedSourceEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HDQueryDescriptor authorizationFilter](self, "authorizationFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HDQueryDescriptor filter](self, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[HDQueryDescriptor samplePredicate](self, "samplePredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[HDQueryDescriptor deletedObjectsPredicate](self, "deletedObjectsPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  HDQueryDescriptor *v4;
  HDQueryDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;

  v4 = (HDQueryDescriptor *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HDQueryDescriptor sampleTypes](self, "sampleTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor sampleTypes](v5, "sampleTypes");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HDQueryDescriptor sampleTypes](v5, "sampleTypes");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_39;
        v10 = (void *)v9;
        -[HDQueryDescriptor sampleTypes](self, "sampleTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor sampleTypes](v5, "sampleTypes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToSet:", v12);

        if (!v13)
          goto LABEL_40;
      }
      -[HDQueryDescriptor encodingOptions](self, "encodingOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor encodingOptions](v5, "encodingOptions");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HDQueryDescriptor encodingOptions](v5, "encodingOptions");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_39;
        v17 = (void *)v16;
        -[HDQueryDescriptor encodingOptions](self, "encodingOptions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor encodingOptions](v5, "encodingOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_40;
      }
      -[HDQueryDescriptor restrictedSourceEntities](self, "restrictedSourceEntities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor restrictedSourceEntities](v5, "restrictedSourceEntities");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HDQueryDescriptor restrictedSourceEntities](v5, "restrictedSourceEntities");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_39;
        v23 = (void *)v22;
        -[HDQueryDescriptor restrictedSourceEntities](self, "restrictedSourceEntities");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor restrictedSourceEntities](v5, "restrictedSourceEntities");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_40;
      }
      -[HDQueryDescriptor authorizationFilter](self, "authorizationFilter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor authorizationFilter](v5, "authorizationFilter");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v27)
      {

      }
      else
      {
        v8 = (void *)v27;
        -[HDQueryDescriptor authorizationFilter](v5, "authorizationFilter");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_39;
        v29 = (void *)v28;
        -[HDQueryDescriptor authorizationFilter](self, "authorizationFilter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor authorizationFilter](v5, "authorizationFilter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = _Block_copy(v31);
        v33 = objc_msgSend(v30, "isEqual:", v32);

        if (!v33)
          goto LABEL_40;
      }
      -[HDQueryDescriptor filter](self, "filter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor filter](v5, "filter");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v34)
      {

      }
      else
      {
        v8 = (void *)v34;
        -[HDQueryDescriptor filter](v5, "filter");
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_39;
        v36 = (void *)v35;
        -[HDQueryDescriptor filter](self, "filter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor filter](v5, "filter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqual:", v38);

        if (!v39)
          goto LABEL_40;
      }
      -[HDQueryDescriptor samplePredicate](self, "samplePredicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor samplePredicate](v5, "samplePredicate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v40)
      {

      }
      else
      {
        v8 = (void *)v40;
        -[HDQueryDescriptor samplePredicate](v5, "samplePredicate");
        v41 = objc_claimAutoreleasedReturnValue();
        if (!v41)
          goto LABEL_39;
        v42 = (void *)v41;
        -[HDQueryDescriptor samplePredicate](self, "samplePredicate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor samplePredicate](v5, "samplePredicate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_40;
      }
      -[HDQueryDescriptor deletedObjectsPredicate](self, "deletedObjectsPredicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryDescriptor deletedObjectsPredicate](v5, "deletedObjectsPredicate");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v46)
      {

LABEL_44:
        v14 = 1;
        goto LABEL_41;
      }
      v8 = (void *)v46;
      -[HDQueryDescriptor deletedObjectsPredicate](v5, "deletedObjectsPredicate");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        -[HDQueryDescriptor deletedObjectsPredicate](self, "deletedObjectsPredicate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryDescriptor deletedObjectsPredicate](v5, "deletedObjectsPredicate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

        if ((v51 & 1) != 0)
          goto LABEL_44;
LABEL_40:
        v14 = 0;
LABEL_41:

        goto LABEL_42;
      }
LABEL_39:

      goto LABEL_40;
    }
    v14 = 0;
  }
LABEL_42:

  return v14;
}

- (NSSet)sampleTypes
{
  return self->_sampleTypes;
}

- (NSDictionary)encodingOptions
{
  return self->_encodingOptions;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

- (HDSQLitePredicate)samplePredicate
{
  return self->_samplePredicate;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (HDSQLitePredicate)deletedObjectsPredicate
{
  return self->_deletedObjectsPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedObjectsPredicate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_samplePredicate, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
}

@end

@implementation LSClaimBinding

+ (id)new
{
  abort();
}

- (LSClaimBinding)init
{
  abort();
}

- (LSClaimBinding)initWithTypeIdentifier:(id)a3 error:(id *)a4
{
  LSClaimBinding *v6;
  _QWORD v8[22];

  v8[21] = *MEMORY[0x1E0C80C00];
  LaunchServices::BindingEvaluator::CreateWithUTI((LaunchServices::BindingEvaluator *)a3, 0, (LaunchServices::BindingEvaluator *)v8);
  v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithTypeIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[22];

  v8[21] = *MEMORY[0x1E0C80C00];
  LaunchServices::BindingEvaluator::CreateWithUTI((LaunchServices::BindingEvaluator *)a3, 0, (LaunchServices::BindingEvaluator *)v8);
  objc_msgSend(a1, "_claimBindingsForBindingEvaluator:error:", v8, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

- (LSClaimBinding)initWithURL:(id)a3 error:(id *)a4
{
  LSClaimBinding *v6;
  FSNode *v8[22];

  v8[21] = *(FSNode **)MEMORY[0x1E0C80C00];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  FSNode *v8[22];

  v8[21] = *(FSNode **)MEMORY[0x1E0C80C00];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  objc_msgSend(a1, "_claimBindingsForBindingEvaluator:error:", v8, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

- (id)_initWithClaimRecord:(id)a3 typeRecord:(id)a4 bundleRecord:(id)a5
{
  LSClaimBinding *v8;
  id *p_isa;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LSClaimBinding;
  v8 = -[LSClaimBinding init](&v11, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_claimRecord, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  return p_isa;
}

- (id)_initWithContext:(LSContext *)a3 binding:(const LSBinding *)a4 coreTypesBundleRecord:(id *)a5 typeRecord:(id)a6 error:(id *)a7
{
  LSBundleData *bundleData;
  id v15;
  void *v16;
  objc_class *v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSClaimRecord.mm"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("binding != NULL"));

    if (!self)
      goto LABEL_23;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSClaimRecord.mm"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ctx != NULL"));

  if (!a4)
    goto LABEL_22;
LABEL_3:
  if (!self)
  {
LABEL_23:

    if (a7)
    {
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("The claim record was bound to an unknown bundle record.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]", 279, v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
    v15 = 0;
    goto LABEL_26;
  }
LABEL_4:
  bundleData = a4->bundleData;
  if (!bundleData)
    goto LABEL_23;
  if (bundleData->_clas == 11)
  {
    v15 = *a5;
    if (v15)
      goto LABEL_12;
    +[LSBundleRecord coreTypesBundleRecord](LSBundleRecord, "coreTypesBundleRecord");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(a5, v16);
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    if (a4->bundleData->_clas == 2)
      v17 = (objc_class *)objc_opt_class();
    v16 = (void *)objc_msgSend([v17 alloc], "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, a3->db->schema.bundleTable, a4->bundle, a4->bundleData, a7);
  }
  v15 = v16;
  if (!v16)
  {

LABEL_20:
    v20 = 0;
LABEL_26:
    v21 = 0;
    goto LABEL_27;
  }
LABEL_12:
  if (!a4->claimData)
  {
    v20 = 0;
    goto LABEL_16;
  }
  v18 = -[LSRecord _initWithContext:tableID:unitID:]([LSClaimRecord alloc], "_initWithContext:tableID:unitID:", a3, a3->db->schema.claimTable, a4->claim);
  v19 = v18;
  if (!v18)
  {

    if (a7)
    {
      v28 = *MEMORY[0x1E0CB2938];
      v29 = CFSTR("Unable to find this claim record in the Launch Services database.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]", 292, v22);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
  objc_storeWeak(v18 + 4, v15);
  v20 = v19;
LABEL_16:
  v21 = -[LSClaimBinding _initWithClaimRecord:typeRecord:bundleRecord:](self, "_initWithClaimRecord:typeRecord:bundleRecord:", v20, a6, v15);
LABEL_27:
  v26 = v21;

  return v26;
}

+ (id)_claimBindingsForBindingEvaluator:(const void *)a3 error:(id *)a4
{
  _LSDServiceDomain *v6;
  LSContext *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  LSClaimBinding *v11;
  id v12;
  void *v13;
  _LSDServiceDomain *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void **CurrentContext;
  id v26;
  char v27;
  id v28;
  void **v29;

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  v26 = 0;
  v27 = 0;
  v28 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v6, 0);

  if (v7)
  {
    v23 = 0;
    v24 = 0;
    LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)a3, v7, &v23, a4, &v21);
    if (v21 == v22)
    {
      v13 = 0;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = v21;
      for (i = v22; v9 != i; v9 += 48)
      {
        v11 = [LSClaimBinding alloc];
        v12 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:](v11, "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:", v7, v9, &v24, v23, 0);
        if (v12)
          objc_msgSend(v8, "addObject:", v12);

      }
      v13 = (void *)objc_msgSend(v8, "copy");

    }
    v29 = (void **)&v21;
    std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100](&v29);

  }
  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v14, 0);

    if (v15)
      v16 = 0;
    else
      v16 = objc_retainAutorelease(v28);
    v13 = 0;
    *a4 = v16;
  }
  else
  {
    v13 = 0;
  }
  v17 = v13;
  if (CurrentContext && v27)
    _LSContextDestroy(CurrentContext);
  v18 = v26;
  CurrentContext = 0;
  v26 = 0;

  v27 = 0;
  v19 = v28;
  v28 = 0;

  return v17;
}

- (id)_initWithBindingEvaluator:(const void *)a3 error:(id *)a4
{
  _LSDServiceDomain *v7;
  LSContext *v8;
  id v9;
  _LSDServiceDomain *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17[6];
  char v18;
  void *v19;
  id v20;
  void **CurrentContext;
  id v22;
  char v23;
  id v24;

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  v22 = 0;
  v23 = 0;
  v24 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v7, 0);

  if (v8)
  {
    v19 = 0;
    v20 = 0;
    LaunchServices::BindingEvaluator::getBestBinding(v17, (LaunchServices::BindingEvaluator *)a3, v8, &v19, a4);
    if (v18)
    {
      v9 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:](self, "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:", v8, v17, &v20, v19, a4);
    }
    else
    {

      v9 = 0;
    }
    if (v18)
    {

    }
  }
  else
  {

    if (a4)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v10, 0);

      if (v11)
        v12 = 0;
      else
        v12 = objc_retainAutorelease(v24);
      v9 = 0;
      *a4 = v12;
    }
    else
    {
      v9 = 0;
    }
  }
  v13 = v9;
  if (CurrentContext && v23)
    _LSContextDestroy(CurrentContext);
  v14 = v22;
  CurrentContext = 0;
  v22 = 0;

  v23 = 0;
  v15 = v24;
  v24 = 0;

  return v13;
}

- (void)detach
{
  -[LSRecord detach](self->_claimRecord, "detach");
  -[LSRecord detach](self->_typeRecord, "detach");
  -[LSRecord detach](self->_bundleRecord, "detach");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_claimRecord, CFSTR("claimRecord"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_typeRecord, CFSTR("typeRecord"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleRecord, CFSTR("bundleRecord"));
}

- (LSClaimBinding)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  LSClaimBinding *v8;

  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LSClaimBinding _initWithClaimRecord:typeRecord:bundleRecord:](self, "_initWithClaimRecord:typeRecord:bundleRecord:", v5, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = -[LSClaimRecord copyWithZone:](self->_claimRecord, "copyWithZone:");
  v6 = -[LSRecord copyWithZone:](self->_typeRecord, "copyWithZone:", a3);
  v7 = -[LSBundleRecord copyWithZone:](self->_bundleRecord, "copyWithZone:", a3);
  v8 = -[LSClaimBinding _initWithClaimRecord:typeRecord:bundleRecord:](+[LSClaimBinding allocWithZone:](LSClaimBinding, "allocWithZone:", a3), "_initWithClaimRecord:typeRecord:bundleRecord:", v5, v6, v7);

  return v8;
}

- (LSClaimRecord)claimRecord
{
  return (LSClaimRecord *)objc_getProperty(self, a2, 8, 1);
}

- (UTTypeRecord)typeRecord
{
  return (UTTypeRecord *)objc_getProperty(self, a2, 16, 1);
}

- (LSBundleRecord)bundleRecord
{
  return (LSBundleRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleRecord, 0);
  objc_storeStrong((id *)&self->_typeRecord, 0);
  objc_storeStrong((id *)&self->_claimRecord, 0);
}

- (LSClaimBinding)initWithConfiguration:(id)a3 error:(id *)a4
{
  LSClaimBinding *v6;
  _QWORD v8[22];

  v8[21] = *MEMORY[0x1E0C80C00];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithConfiguration:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[22];

  v8[21] = *MEMORY[0x1E0C80C00];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  objc_msgSend(a1, "_claimBindingsForBindingEvaluator:error:", v8, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

@end

@implementation HKStateOfMind

- (id)sanitizedSample:(id)a3 forEntitlements:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v5;
  v9 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.private.healthkit")) & 1) == 0)
    {
      v9 = v8;
      if ((objc_msgSend(v6, "hasPrivateAccessEntitlementWithIdentifier:", CFSTR("mental-health")) & 1) == 0)
      {
        objc_msgSend(v8, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v8;
        if (v10)
        {
          v9 = (void *)objc_msgSend(v8, "_copyByArchiving");

          objc_msgSend(v9, "_setContext:", 0);
        }
      }
    }
  }

  return v9;
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7
{
  return (id)objc_msgSend(a1, "stateOfMindWithDate:kind:valence:labels:associations:metadata:", a3, a4, a6, a7, 0, a5);
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 metadata:(id)a8
{
  return (id)objc_msgSend(a1, "stateOfMindWithDate:kind:valence:labels:associations:context:metadata:", a3, a4, a6, a7, 0, a8, a5);
}

+ (id)stateOfMindWithDate:(id)a3 kind:(int64_t)a4 valence:(double)a5 labels:(id)a6 associations:(id)a7 context:(id)a8 metadata:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  int64_t v33;
  double v34;

  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a3;
  +[HKObjectType stateOfMindType](HKStateOfMindType, "stateOfMindType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    v22 = v19;
  else
    v22 = 0;
  v29[1] = 3221225472;
  v29[2] = __87__HKStateOfMind_stateOfMindWithDate_kind_valence_labels_associations_context_metadata___block_invoke;
  v29[3] = &unk_1E37EF040;
  v34 = a5;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = a4;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___HKStateOfMind;
  v29[0] = MEMORY[0x1E0C809B0];
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = objc_msgSendSuper2(&v28, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v21, v20, v20, 0, v22, v29);

  return v26;
}

void __87__HKStateOfMind_stateOfMindWithDate_kind_valence_labels_associations_context_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;

  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a2 + 104) = *(_QWORD *)(a1 + 64);
  objc_storeStrong((id *)(a2 + 112), *(id *)(a1 + 32));
  v5 = (id *)(id)a2;
  objc_storeStrong(v5 + 15, *(id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
    v4 = *(void **)(a1 + 48);
  else
    v4 = 0;
  objc_storeStrong(v5 + 16, v4);

}

+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 metadata:(id)a8
{
  return (id)objc_msgSend(a1, "stateOfMindWithDate:reflectiveInterval:valence:labels:domains:context:metadata:", a3, a4, a6, a7, 0, a8, a5);
}

+ (id)stateOfMindWithDate:(id)a3 reflectiveInterval:(int64_t)a4 valence:(double)a5 labels:(id)a6 domains:(id)a7 context:(id)a8 metadata:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a3;
  objc_msgSend(a7, "hk_map:", &__block_literal_global_57);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stateOfMindWithDate:kind:valence:labels:associations:context:metadata:", v19, a4, v18, v20, v17, v16, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __96__HKStateOfMind_stateOfMindWithDate_reflectiveInterval_valence_labels_domains_context_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

- (int64_t)valenceClassification
{
  double v4;
  void *v5;
  int64_t v6;
  void *v8;

  -[HKStateOfMind valence](self, "valence");
  HKStateOfMindValenceClassificationForValence(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStateOfMind.m"), 722, CFSTR("Initialized state of mind objects should always hold validated valence values"));

  }
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)reflectiveInterval
{
  return self->_kind;
}

- (NSArray)domains
{
  return (NSArray *)-[NSArray hk_map:](self->_associations, "hk_map:", &__block_literal_global_196);
}

uint64_t __24__HKStateOfMind_domains__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

- (BOOL)hasAnyUnknownLabel
{
  return -[NSArray hk_containsObjectPassingTest:](self->_labels, "hk_containsObjectPassingTest:", &__block_literal_global_198);
}

BOOL __35__HKStateOfMind_hasAnyUnknownLabel__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "integerValue") - 39) < 0xFFFFFFFFFFFFFFDALL;
}

- (BOOL)hasAnyUnknownDomain
{
  void *v2;
  char v3;

  -[HKStateOfMind domains](self, "domains");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hk_containsObjectPassingTest:", &__block_literal_global_199);

  return v3;
}

BOOL __36__HKStateOfMind_hasAnyUnknownDomain__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "integerValue") - 19) < 0xFFFFFFFFFFFFFFEELL;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  char var0;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int64_t kind;
  double valence;
  void *v11;
  objc_super v13;

  var0 = a3.var0;
  v13.receiver = self;
  v13.super_class = (Class)HKStateOfMind;
  -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    kind = self->_kind;
    valence = self->_valence;
    if ((var0 & 0x10) != 0)
      objc_msgSend(v8, "validateArgumentsWithKind:valence:", kind, valence);
    else
      objc_msgSend(v8, "validateArgumentsWithKind:valence:labels:associations:", kind, self->_labels, self->_associations, valence);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;

  return v11;
}

+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4 labels:(id)a5 associations:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a5;
  v10 = a6;
  objc_msgSend((id)objc_opt_class(), "validateArgumentsWithKind:valence:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend((id)objc_opt_class(), "validateLabels:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend((id)objc_opt_class(), "validateAssociations:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

+ (id)validateArgumentsWithKind:(int64_t)a3 valence:(double)a4
{
  void *v5;

  objc_msgSend((id)objc_opt_class(), "validateKind:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "validateValence:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)validateKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Only momentary emotion and daily mood are supported."));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)validateValence:(double)a3
{
  if (a3 >= -1.0 && a3 <= 1.0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Only valence values in the range [-1, +1] are supported."));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)validateLabels:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_210_1))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("One or more HKStateOfMind labels are not supported"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

BOOL __32__HKStateOfMind_validateLabels___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "integerValue") - 39) < 0xFFFFFFFFFFFFFFDALL;
}

+ (id)validateAssociations:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_213))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("One or more HKStateOfMind associations are not supported"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

BOOL __38__HKStateOfMind_validateAssociations___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "integerValue") - 19) < 0xFFFFFFFFFFFFFFEELL;
}

- (void)_setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  BOOL v11;
  objc_super v13;

  v7 = a5;
  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKStateOfMind;
  if (-[HKObject _validateForSavingWithClientEntitlements:applicationSDKVersionToken:isAppleWatch:error:](&v13, sel__validateForSavingWithClientEntitlements_applicationSDKVersionToken_isAppleWatch_error_, v10, a4, v7, a6))
  {
    if ((objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.private.healthkit")) & 1) != 0
      || (objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", CFSTR("mental-health")) & 1) != 0
      || !self->_context)
    {
      v11 = 1;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a6, 2, CFSTR("Unable to save state of mind sample with this configuration"));
  }
  v11 = 0;
LABEL_8:

  return v11;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *context;
  NSString *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HKStateOfMind;
    if (-[HKSample isEquivalent:](&v11, sel_isEquivalent_, v4))
    {
      v5 = v4;
      v6 = v5;
      if (self->_kind != v5[12]
        || self->_valence != *((double *)v5 + 13)
        || !-[NSArray isEqual:](self->_labels, "isEqual:", v5[14])
        || !-[NSArray isEqual:](self->_associations, "isEqual:", v6[15]))
      {
        goto LABEL_11;
      }
      context = self->_context;
      v8 = (NSString *)v6[16];
      if (context == v8)
      {
        v9 = 1;
        goto LABEL_12;
      }
      if (v8)
        v9 = -[NSString isEqual:](context, "isEqual:");
      else
LABEL_11:
        v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  __CFString *v10;
  void *v11;
  double valence;
  __CFString *v13;
  void *v14;
  void *v15;

  -[NSArray hk_map:](self->_labels, "hk_map:", &__block_literal_global_223);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateOfMind domains](self, "domains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_224);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[HKSample startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKStateOfMind reflectiveInterval](self, "reflectiveInterval");
  v10 = CFSTR("<unknown>");
  if (v9 == 2)
    v10 = CFSTR("daily");
  if (v9 == 1)
    v10 = CFSTR("momentary");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  valence = self->_valence;
  v13 = v10;
  objc_msgSend(v11, "numberWithDouble:", valence);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p date: %@, kind: %@, valence: %@, labels: %@, associations: %@>"), v7, self, v8, v13, v14, v3, v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

const __CFString *__28__HKStateOfMind_description__block_invoke(uint64_t a1, void *a2)
{
  return NSStringFromHKStateOfMindLabel(objc_msgSend(a2, "integerValue"));
}

const __CFString *__28__HKStateOfMind_description__block_invoke_2(uint64_t a1, void *a2)
{
  return NSStringFromHKStateOfMindDomain(objc_msgSend(a2, "integerValue"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *context;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKStateOfMind;
  -[HKSample encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_kind, CFSTR("ReflectiveInterval"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Valence"), self->_valence);
  objc_msgSend(v4, "encodeObject:forKey:", self->_labels, CFSTR("Labels"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associations, CFSTR("Domains"));
  context = self->_context;
  if (context)
    objc_msgSend(v4, "encodeObject:forKey:", context, CFSTR("Context"));

}

- (HKStateOfMind)initWithCoder:(id)a3
{
  id v4;
  HKStateOfMind *v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSArray *labels;
  void *v10;
  uint64_t v11;
  NSArray *associations;
  uint64_t v13;
  NSString *context;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKStateOfMind;
  v5 = -[HKSample initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_kind = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ReflectiveInterval"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Valence"));
    v5->_valence = v6;
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("Labels"));
    v8 = objc_claimAutoreleasedReturnValue();
    labels = v5->_labels;
    v5->_labels = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Domains"));
    v11 = objc_claimAutoreleasedReturnValue();
    associations = v5->_associations;
    v5->_associations = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Context"));
    v13 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v13;

  }
  return v5;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)_setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)_setValence:(double)a3
{
  self->_valence = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)_setLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)associations
{
  return self->_associations;
}

- (void)_setAssociations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_associations, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end

@implementation HKUserTrackedConcept

- (HKUserTrackedConcept)init
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

+ (id)_newUserTrackedConceptWithType:(id)a3 config:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD *);
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD *))a4;
  if ((objc_msgSend(a1, "isConcreteUserTrackedConceptClass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUserTrackedConcept.m"), 34, CFSTR("%@ should not be used for abstract class %@"), v15, v16);

  }
  v9 = objc_alloc((Class)a1);
  if (v9)
  {
    v17.receiver = v9;
    v17.super_class = (Class)HKUserTrackedConcept;
    v10 = objc_msgSendSuper2(&v17, sel_init);
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v7, "copy");
  v12 = (void *)v10[1];
  v10[1] = v11;

  if (v8)
    v8[2](v8, v10);

  return v10;
}

+ (BOOL)isConcreteUserTrackedConceptClass
{
  return 0;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKObjectType identifier](self->_userTrackedConceptType, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("User Tracked Concept with data type identifier %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_userTrackedConceptType, CFSTR("UserTrackedConceptType"));
}

- (HKUserTrackedConcept)initWithCoder:(id)a3
{
  id v4;
  HKUserTrackedConcept *v5;
  uint64_t v6;
  HKUserTrackedConceptType *userTrackedConceptType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserTrackedConcept;
  v5 = -[HKUserTrackedConcept init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserTrackedConceptType"));
    v6 = objc_claimAutoreleasedReturnValue();
    userTrackedConceptType = v5->_userTrackedConceptType;
    v5->_userTrackedConceptType = (HKUserTrackedConceptType *)v6;

  }
  return v5;
}

- (HKUserTrackedConceptType)userTrackedConceptType
{
  return self->_userTrackedConceptType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTrackedConceptType, 0);
}

@end

@implementation EKRelation

- (BOOL)toMany
{
  return self->_toMany;
}

- (BOOL)ownsRelatedObject
{
  return self->_ownsRelated;
}

+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v7 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntityName:toMany:inversePropertyNames:ownsRelated:", v11, v7, v10, v6);

  return v12;
}

+ (id)relationWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntityName:toMany:inversePropertyNames:ownsRelated:", v9, v5, v8, 1);

  return v10;
}

- (EKRelation)initWithEntityName:(id)a3 toMany:(BOOL)a4 inversePropertyNames:(id)a5 ownsRelated:(BOOL)a6
{
  id v10;
  id v11;
  EKRelation *v12;
  uint64_t v13;
  NSString *entityName;
  uint64_t v15;
  NSSet *inversePropertyNames;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EKRelation;
  v12 = -[EKRelation init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    entityName = v12->_entityName;
    v12->_entityName = (NSString *)v13;

    v12->_toMany = a4;
    v12->_ownsRelated = a6;
    v15 = objc_msgSend(v11, "copy");
    inversePropertyNames = v12->_inversePropertyNames;
    v12->_inversePropertyNames = (NSSet *)v15;

  }
  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@"), objc_opt_class(), self, self->_entityName);
}

- (NSSet)inversePropertyNames
{
  return self->_inversePropertyNames;
}

- (BOOL)shouldSetInverseProperty:(id)a3 onObject:(id)a4 forObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EKRelation inversePropertyIsApplicable](self, "inversePropertyIsApplicable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[EKRelation inversePropertyIsApplicable](self, "inversePropertyIsApplicable");
    v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13 = ((uint64_t (**)(_QWORD, id, id, id))v12)[2](v12, v8, v9, v10);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)inversePropertyIsApplicable
{
  return self->_inversePropertyIsApplicable;
}

- (void)setInversePropertyIsApplicable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inversePropertyIsApplicable, 0);
  objc_storeStrong((id *)&self->_inversePropertyNames, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

@end

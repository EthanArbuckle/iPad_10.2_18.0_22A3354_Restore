@implementation _HKCompoundUnit

- (BOOL)isEqual:(id)a3
{
  _HKCompoundUnit *v4;
  void *v5;
  char v6;

  v4 = (_HKCompoundUnit *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[_HKCompoundUnit isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_HKCompoundUnit _baseUnits](v4, "_baseUnits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", self->_baseUnits);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_baseUnits
{
  return self->_baseUnits;
}

- (id)unitString
{
  return -[_HKFactorization unitString](self->_baseUnits, "unitString");
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKCompoundUnit;
  -[HKUnit encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (id)unitWithBaseUnits:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBaseUnits:", v4);

  return v5;
}

- (id)_initWithBaseUnits:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCompoundUnit;
  v5 = -[HKUnit _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[6];
    v5[6] = v6;

    *((_DWORD *)v5 + 16) = 0;
  }

  return v5;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  id v6;
  void *v7;
  _HKFactorization *baseUnits;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  +[_HKFactorization factorization](_HKMutableFactorization, "factorization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0x3FF0000000000000;
  baseUnits = self->_baseUnits;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77___HKCompoundUnit__computeBaseUnitReductionAndProportionalSize_withCycleSet___block_invoke;
  v14[3] = &unk_1E37F3920;
  v9 = v6;
  v15 = v9;
  v17 = &v18;
  v10 = v7;
  v16 = v10;
  -[_HKFactorization enumerateFactorsWithHandler:](baseUnits, "enumerateFactorsWithHandler:", v14);
  if (a3)
    *a3 = v19[3];
  v11 = v16;
  v12 = v10;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)dimension
{
  _HKDimension *dimension;
  void *v4;
  _HKFactorization *baseUnits;
  id v6;
  _HKDimension *v7;
  _HKDimension *v8;
  _QWORD v10[4];
  id v11;

  dimension = self->_dimension;
  if (!dimension)
  {
    os_unfair_lock_lock(&self->_dimensionLock);
    if (!self->_dimension)
    {
      +[_HKFactorization factorization](_HKMutableFactorization, "factorization");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      baseUnits = self->_baseUnits;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __28___HKCompoundUnit_dimension__block_invoke;
      v10[3] = &unk_1E37F06D0;
      v11 = v4;
      v6 = v4;
      -[_HKFactorization enumerateFactorsWithHandler:](baseUnits, "enumerateFactorsWithHandler:", v10);
      +[_HKCompoundDimension dimensionWithBaseDimensions:](_HKCompoundDimension, "dimensionWithBaseDimensions:", v6);
      v7 = (_HKDimension *)objc_claimAutoreleasedReturnValue();
      v8 = self->_dimension;
      self->_dimension = v7;

    }
    os_unfair_lock_unlock(&self->_dimensionLock);
    dimension = self->_dimension;
  }
  return dimension;
}

- (unint64_t)hash
{
  return -[_HKFactorization hash](self->_baseUnits, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCompoundUnit)initWithCoder:(id)a3
{
  id v4;
  _HKCompoundUnit *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _HKFactorization *baseUnits;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKCompoundUnit;
  v5 = -[HKUnit initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("HKUnitStringKey")) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HKCompoundUnitBaseUnitsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    baseUnits = v5->_baseUnits;
    v5->_baseUnits = (_HKFactorization *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_baseUnits, 0);
}

@end

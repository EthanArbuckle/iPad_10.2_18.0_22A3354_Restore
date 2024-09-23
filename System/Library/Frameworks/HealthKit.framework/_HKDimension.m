@implementation _HKDimension

- (_HKDimension)init
{
  _HKDimension *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKDimension;
  result = -[_HKDimension init](&v3, sel_init);
  if (result)
    result->_reductionLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)dimensionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (_HKDimensionGrammar_onceToken != -1)
    dispatch_once(&_HKDimensionGrammar_onceToken, &__block_literal_global_210);
  +[_HKFactorization factorizationFromString:factorGrammar:](_HKFactorization, "factorizationFromString:factorGrammar:", v3, _HKDimensionGrammar___grammar);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "factorCount") == 1
    && (objc_msgSend(v4, "anyFactor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "exponentForFactor:", v5),
        v5,
        v6 == 1))
  {
    objc_msgSend(v4, "anyFactor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_HKCompoundDimension dimensionWithBaseDimensions:](_HKCompoundDimension, "dimensionWithBaseDimensions:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)reduction
{
  os_unfair_lock_s *p_reductionLock;
  void *v4;
  void *v5;
  id v6;
  _HKFactorization *v7;
  _HKFactorization *reduction;
  _QWORD v10[4];
  id v11;

  p_reductionLock = &self->_reductionLock;
  os_unfair_lock_lock(&self->_reductionLock);
  if (!self->_reduction)
  {
    +[_HKFactorization factorization](_HKMutableFactorization, "factorization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDimension _baseDimensions](self, "_baseDimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25___HKDimension_reduction__block_invoke;
    v10[3] = &unk_1E37EE528;
    v11 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateFactorsWithHandler:", v10);

    v7 = (_HKFactorization *)objc_msgSend(v6, "copy");
    reduction = self->_reduction;
    self->_reduction = v7;

  }
  os_unfair_lock_unlock(p_reductionLock);
  return self->_reduction;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_HKDimension _baseDimensions](self, "_baseDimensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduction, 0);
}

- (id)_baseDimensions
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

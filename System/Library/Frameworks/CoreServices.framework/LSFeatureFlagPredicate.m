@implementation LSFeatureFlagPredicate

+ (id)featureFlagPredicateForBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[_LSLazyPropertyList lazyPropertyListWithDatabase:unit:](_LSLazyPropertyList, "lazyPropertyListWithDatabase:unit:", a5, a4->base.infoDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("LSRequiredFeatureFlags"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    a6 = -[LSFeatureFlagPredicate initWithDictionary:error:]([LSFeatureFlagPredicate alloc], "initWithDictionary:error:", v8, a6);
  }
  else if (a6)
  {
    v9 = (void *)*MEMORY[0x1E0CB2F90];
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("tried to make reature flag predicate for bundle with no feature flag predicate");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(v9, -43, (uint64_t)"+[LSFeatureFlagPredicate(LSBundleDataPredicate) featureFlagPredicateForBundle:bundleData:database:error:]", 24, v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

- (LSFeatureFlagPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  LSFeatureFlagPredicate *v6;
  LSFeatureFlagPredicate *v7;
  objc_super v9;
  _BYTE v10[56];

  LaunchServices::FeatureFlagPredicateEvaluation::Predicate::parse_dictionary(a3, a4, (uint64_t)v10);
  if (!v10[48])
  {

LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)LSFeatureFlagPredicate;
  v6 = -[LSFeatureFlagPredicate init](&v9, sel_init);
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 12, (uint64_t)"-[LSFeatureFlagPredicate initWithDictionary:error:]", 186, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  LaunchServices::DelayedInitable<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>::emplace<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>((uint64_t)&v6->_predicate, (uint64_t)v10);
LABEL_8:
  std::__optional_destruct_base<LaunchServices::FeatureFlagPredicateEvaluation::Predicate,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v10);
  return v7;
}

- (BOOL)evaluateWithFeatureFlagResolver:(id)a3
{
  return LaunchServices::FeatureFlagPredicateEvaluation::Predicate::evaluate((uint64_t **)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<LaunchServices::FeatureFlagPredicateEvaluation::Predicate,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)&self->_predicate);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

@end

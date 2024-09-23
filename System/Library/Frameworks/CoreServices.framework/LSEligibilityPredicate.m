@implementation LSEligibilityPredicate

- (LSEligibilityPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  LSEligibilityPredicate *v6;
  LSEligibilityPredicate *v7;
  objc_super v9;
  _QWORD v10[3];
  char v11;

  LaunchServices::EligibilityPredicateEvaluation::Predicate::parse_dictionary(a3, a4, (uint64_t)v10);
  if (!v11)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)LSEligibilityPredicate;
  v6 = -[LSEligibilityPredicate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    LaunchServices::DelayedInitable<LaunchServices::EligibilityPredicateEvaluation::Predicate>::emplace<LaunchServices::EligibilityPredicateEvaluation::Predicate>((uint64_t)&v6->_predicate, v10);
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_5;
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 12, (uint64_t)"-[LSEligibilityPredicate initWithDictionary:error:]", 145, 0);
  v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  if (v11)
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy((uint64_t)v10, (_QWORD *)v10[1]);
  return v7;
}

- (id)evaluateWithDomainEligibilityResolver:(id)a3 error:(id *)a4
{
  unsigned __int16 v4;
  id *v6;

  v4 = LaunchServices::EligibilityPredicateEvaluation::Predicate::evaluate(&self->_predicate._storage.var0.__val_._match_map.__tree_.__begin_node_, a3, (uint64_t)a4);
  if (v4 < 0x100u)
    return 0;
  v6 = (id *)MEMORY[0x1E0C9AE40];
  if ((_BYTE)v4)
    v6 = (id *)MEMORY[0x1E0C9AE50];
  return *v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  void *__p[2];
  char v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  LaunchServices::EligibilityPredicateEvaluation::Predicate::to_string((uint64_t *)__p, (LaunchServices::EligibilityPredicateEvaluation::Predicate *)&self->_predicate);
  if (v9 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %s>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p[0]);
  return v6;
}

- (void).cxx_destruct
{
  if (self->_predicate._storage.__engaged_)
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy((uint64_t)&self->_predicate, (_QWORD *)self->_predicate._storage.var0.__val_._match_map.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 32) = 0;
  return self;
}

+ (BOOL)getInstallationPredicate:(id *)a3 uninstallationPredicate:(id *)a4 forBundle:(unsigned int)a5 bundleData:(const LSBundleData *)a6 database:(id)a7 error:(id *)a8
{
  id v12;
  void *v13;
  void *v14;
  LSEligibilityPredicate *v15;
  BOOL v16;
  void *v17;
  LSEligibilityPredicate *v18;
  id v19;
  LSEligibilityPredicate *v20;

  v12 = a7;
  +[_LSLazyPropertyList lazyPropertyListWithDatabase:unit:](_LSLazyPropertyList, "lazyPropertyListWithDatabase:unit:", v12, a6->base.infoDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:ofClass:", CFSTR("LSEligibilityInstallPredicate"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = 0;
LABEL_5:
    objc_msgSend(v13, "objectForKey:ofClass:", CFSTR("LSEligibilityUninstallPredicate"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = -[LSEligibilityPredicate initWithDictionary:error:]([LSEligibilityPredicate alloc], "initWithDictionary:error:", v17, a8);
      if (!v18)
      {
        v16 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v18 = 0;
    }
    objc_storeStrong(a3, v15);
    v19 = *a4;
    *a4 = v18;
    v20 = v18;

    v16 = 1;
    goto LABEL_10;
  }
  v15 = -[LSEligibilityPredicate initWithDictionary:error:]([LSEligibilityPredicate alloc], "initWithDictionary:error:", v14, a8);
  if (v15)
    goto LABEL_5;
  v16 = 0;
LABEL_11:

  return v16;
}

@end

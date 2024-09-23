@implementation FCFeedTransformationBlockFilter

+ (id)blockFilterWithPredicate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPredicate:", v3);

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__FCFeedTransformationBlockFilter_transformFeedItems___block_invoke;
  v8[3] = &unk_1E46464F8;
  v8[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__FCFeedTransformationBlockFilter_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t (**v4)(_QWORD, _QWORD);
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "predicate");
  v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5 = ((uint64_t (**)(_QWORD, id))v4)[2](v4, v3);

  return v5;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
}

@end

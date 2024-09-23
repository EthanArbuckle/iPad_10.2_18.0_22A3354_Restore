@implementation FCFeedTransformationFeedThrottle

+ (id)transformationWithDailyLimit:(unint64_t)a3 timeInterval:(double)a4 condition:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLimit:", (unint64_t)fmax(ceil(a4 / 86400.0 * (double)a3), 1.0));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__FCFeedTransformationFeedThrottle_transformationWithDailyLimit_timeInterval_condition___block_invoke;
  v11[3] = &unk_1E4644578;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "setCondition:", v11);

  return v8;
}

uint64_t __88__FCFeedTransformationFeedThrottle_transformationWithDailyLimit_timeInterval_condition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[4];

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCFeedTransformationFeedThrottle_transformFeedItems___block_invoke;
  v7[3] = &unk_1E4646D08;
  v7[4] = self;
  v7[5] = v8;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);

  return v5;
}

BOOL __55__FCFeedTransformationFeedThrottle_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  int v6;
  uint64_t v7;
  unint64_t v8;
  _BOOL8 v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "condition");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  if (v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(_QWORD *)(v7 + 24) + 1;
    *(_QWORD *)(v7 + 24) = v8;
    v9 = v8 <= objc_msgSend(*(id *)(a1 + 32), "limit");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_condition, 0);
}

@end

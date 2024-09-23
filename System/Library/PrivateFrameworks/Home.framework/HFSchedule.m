@implementation HFSchedule

- (HFSchedule)initWithScheduleRules:(id)a3
{
  id v6;
  HFSchedule *v7;
  HFSchedule *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSchedule.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rules"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFSchedule;
  v7 = -[HFSchedule init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_rules, a3);

  return v8;
}

- (id)allYearDayRules
{
  void *v2;
  void *v3;

  -[HFSchedule rules](self, "rules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __29__HFSchedule_allYearDayRules__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isYearDayRule");
}

- (id)allWeekDayRules
{
  void *v2;
  void *v3;

  -[HFSchedule rules](self, "rules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_6_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __29__HFSchedule_allWeekDayRules__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWeekDayRule");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFSchedule rules](self, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSchedule rules](self, "rules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("rules"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)rules
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end

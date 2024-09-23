@implementation HFScheduleBuilder

- (HFScheduleBuilder)init
{
  char *v2;
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFScheduleBuilder;
  v2 = -[HFScheduleBuilder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    v4 = objc_msgSend(v3, "initWithArray:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v4;

    *((_WORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 24) = xmmword_1DD669910;
  }
  return (HFScheduleBuilder *)v2;
}

+ (id)scheduleBuilderFromType:(unint64_t)a3 withDefaultRules:(BOOL)a4
{
  _BOOL4 v4;
  HFScheduleBuilder *v8;
  HFScheduleBuilder *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a4;
  v8 = objc_alloc_init(HFScheduleBuilder);
  v9 = v8;
  if (a3 == 2)
  {
    -[HFScheduleBuilder setSupportsWeekDayRules:](v8, "setSupportsWeekDayRules:", 1);
    if (v4)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleBuilder.m"), 122, CFSTR("Unknown schedule type"), a3);
      }
      else
      {
        -[HFScheduleBuilder setMinNumberOfRules:](v8, "setMinNumberOfRules:", 0);
        -[HFScheduleBuilder setMaxNumberOfRules:](v9, "setMaxNumberOfRules:", 0);
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFScheduleBuilder setRules:](v9, "setRules:", v10);
      }
      goto LABEL_11;
    }
    -[HFScheduleBuilder setSupportsYearDayRules:](v8, "setSupportsYearDayRules:", 1);
    if (v4)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = 1;
LABEL_9:
      +[HFScheduleRule defaultRuleForType:](HFScheduleRule, "defaultRuleForType:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithObject:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFScheduleBuilder setRules:](v9, "setRules:", v13);

LABEL_11:
    }
  }
  return v9;
}

+ (id)scheduleBuilderFromHomeAccessSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "weekDayRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_13_8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "yearDayRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_15_9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "scheduleBuilderFromYearDayRules:weekDayRules:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "scheduleBuilderFromType:withDefaultRules:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

HFScheduleRule *__59__HFScheduleBuilder_scheduleBuilderFromHomeAccessSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFScheduleRule *v3;

  v2 = a2;
  v3 = -[HFScheduleRule initWithWeekDayRule:]([HFScheduleRule alloc], "initWithWeekDayRule:", v2);

  return v3;
}

HFScheduleRule *__59__HFScheduleBuilder_scheduleBuilderFromHomeAccessSchedule___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HFScheduleRule *v3;

  v2 = a2;
  v3 = -[HFScheduleRule initWithYearDayRule:]([HFScheduleRule alloc], "initWithYearDayRule:", v2);

  return v3;
}

+ (id)scheduleBuilderFromSchedule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleBuilder.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schedule"));

  }
  objc_msgSend(v5, "allYearDayRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allWeekDayRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheduleBuilderFromYearDayRules:weekDayRules:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)scheduleBuilderFromYearDayRules:(id)a3 weekDayRules:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HFScheduleBuilder *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleBuilder.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("yearDayRules"));

    if (v9)
      goto LABEL_3;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleBuilder.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weekDayRules"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_16;
LABEL_3:
  v10 = objc_alloc_init(HFScheduleBuilder);
  if (objc_msgSend(v9, "hmf_isEmpty") && (objc_msgSend(v7, "hmf_isEmpty") & 1) != 0)
  {
    -[HFScheduleBuilder setMinNumberOfRules:](v10, "setMinNumberOfRules:", 0);
    -[HFScheduleBuilder setMaxNumberOfRules:](v10, "setMaxNumberOfRules:", 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
    {
      -[HFScheduleBuilder setSupportsWeekDayRules:](v10, "setSupportsWeekDayRules:", 1);
      objc_msgSend(v11, "addObjectsFromArray:", v9);
    }
    if ((objc_msgSend(v7, "hmf_isEmpty") & 1) == 0)
    {
      -[HFScheduleBuilder setSupportsYearDayRules:](v10, "setSupportsYearDayRules:", 1);
      objc_msgSend(v11, "addObjectsFromArray:", v7);
    }
    v12 = objc_msgSend(v11, "count");
    v13 = -[HFScheduleBuilder maxNumberOfRules](v10, "maxNumberOfRules");
    if (v12 <= v13)
      v14 = v13;
    else
      v14 = v12;
    -[HFScheduleBuilder setMaxNumberOfRules:](v10, "setMaxNumberOfRules:", v14);
  }
  -[HFScheduleBuilder setRules:](v10, "setRules:", v11);

  return v10;
}

- (unint64_t)estimatedScheduleType
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  -[HFScheduleBuilder rules](self, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) != 0)
    return 0;
  -[HFScheduleBuilder rules](self, "rules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isYearDayRule");

  if ((v9 & 1) != 0)
    return 1;
  -[HFScheduleBuilder rules](self, "rules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "isWeekDayRule");

  return 2;
}

- (id)build
{
  HFSchedule *v3;
  void *v4;
  void *v5;
  HFSchedule *v6;

  if (+[HFScheduleValidator isValid:](HFScheduleValidator, "isValid:", self))
  {
    v3 = [HFSchedule alloc];
    -[HFScheduleBuilder rules](self, "rules");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    v6 = -[HFSchedule initWithScheduleRules:](v3, "initWithScheduleRules:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFScheduleBuilder rules](self, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  *((_BYTE *)v4 + 8) = -[HFScheduleBuilder supportsWeekDayRules](self, "supportsWeekDayRules");
  *((_BYTE *)v4 + 9) = -[HFScheduleBuilder supportsYearDayRules](self, "supportsYearDayRules");
  v4[3] = -[HFScheduleBuilder minNumberOfRules](self, "minNumberOfRules");
  v4[4] = -[HFScheduleBuilder maxNumberOfRules](self, "maxNumberOfRules");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HFScheduleBuilder *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;

  v4 = (HFScheduleBuilder *)a3;
  if (self == v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  -[HFScheduleBuilder rules](v4, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFScheduleBuilder rules](self, "rules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToSet:", v6)
    || (v7 = -[HFScheduleBuilder supportsWeekDayRules](v4, "supportsWeekDayRules"),
        v7 != -[HFScheduleBuilder supportsWeekDayRules](self, "supportsWeekDayRules"))
    || (v8 = -[HFScheduleBuilder supportsYearDayRules](v4, "supportsYearDayRules"),
        v8 != -[HFScheduleBuilder supportsYearDayRules](self, "supportsYearDayRules"))
    || (v9 = -[HFScheduleBuilder minNumberOfRules](v4, "minNumberOfRules"),
        v9 != -[HFScheduleBuilder minNumberOfRules](self, "minNumberOfRules")))
  {

    goto LABEL_10;
  }
  v10 = -[HFScheduleBuilder maxNumberOfRules](v4, "maxNumberOfRules");
  v11 = -[HFScheduleBuilder maxNumberOfRules](self, "maxNumberOfRules");

  if (v10 != v11)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_8:
  v12 = 1;
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[HFScheduleBuilder rules](self, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  if (-[HFScheduleBuilder supportsWeekDayRules](self, "supportsWeekDayRules"))
    v5 = 1231;
  else
    v5 = 1237;
  v6 = v5 - v4 + 32 * v4;
  if (-[HFScheduleBuilder supportsYearDayRules](self, "supportsYearDayRules"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = -[HFScheduleBuilder minNumberOfRules](self, "minNumberOfRules") - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  return -[HFScheduleBuilder maxNumberOfRules](self, "maxNumberOfRules") - v8 + 32 * v8 + 28629151;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFScheduleBuilder rules](self, "rules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("rules"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFScheduleBuilder supportsWeekDayRules](self, "supportsWeekDayRules"), CFSTR("supportsWeekDayRules"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFScheduleBuilder supportsYearDayRules](self, "supportsYearDayRules"), CFSTR("supportsYearDayRules"));
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFScheduleBuilder minNumberOfRules](self, "minNumberOfRules"), CFSTR("minNumberOfRules"));
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFScheduleBuilder maxNumberOfRules](self, "maxNumberOfRules"), CFSTR("maxNumberOfRules"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (BOOL)supportsWeekDayRules
{
  return self->_supportsWeekDayRules;
}

- (void)setSupportsWeekDayRules:(BOOL)a3
{
  self->_supportsWeekDayRules = a3;
}

- (BOOL)supportsYearDayRules
{
  return self->_supportsYearDayRules;
}

- (void)setSupportsYearDayRules:(BOOL)a3
{
  self->_supportsYearDayRules = a3;
}

- (unint64_t)minNumberOfRules
{
  return self->_minNumberOfRules;
}

- (void)setMinNumberOfRules:(unint64_t)a3
{
  self->_minNumberOfRules = a3;
}

- (unint64_t)maxNumberOfRules
{
  return self->_maxNumberOfRules;
}

- (void)setMaxNumberOfRules:(unint64_t)a3
{
  self->_maxNumberOfRules = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end

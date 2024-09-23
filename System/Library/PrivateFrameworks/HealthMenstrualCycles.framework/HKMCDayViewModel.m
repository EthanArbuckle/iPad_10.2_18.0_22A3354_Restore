@implementation HKMCDayViewModel

+ (id)unfetchedDayViewModel
{
  if (unfetchedDayViewModel_onceToken != -1)
    dispatch_once(&unfetchedDayViewModel_onceToken, &__block_literal_global_3);
  return (id)unfetchedDayViewModel_viewModel;
}

void __41__HKMCDayViewModel_unfetchedDayViewModel__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;

  LOWORD(v2) = 0;
  v0 = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:]([HKMCDayViewModel alloc], "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", 0, 0, 0, 0, 0, 0, 0, v2);
  v1 = (void *)unfetchedDayViewModel_viewModel;
  unfetchedDayViewModel_viewModel = (uint64_t)v0;

}

+ (id)emptyDayViewModel
{
  if (emptyDayViewModel_onceToken != -1)
    dispatch_once(&emptyDayViewModel_onceToken, &__block_literal_global_184);
  return (id)emptyDayViewModel_viewModel;
}

void __37__HKMCDayViewModel_emptyDayViewModel__block_invoke()
{
  HKMCDayViewModel *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v0 = [HKMCDayViewModel alloc];
  LOWORD(v3) = 256;
  v1 = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:](v0, "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", 0, 0, 0, 0, 0, 0, MEMORY[0x24BDBD1A8], v3);
  v2 = (void *)emptyDayViewModel_viewModel;
  emptyDayViewModel_viewModel = v1;

}

+ (id)dayViewModelWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  uint64_t v21;

  v17 = a9;
  v18 = a8;
  LOWORD(v21) = __PAIR16__(a11, a10);
  v19 = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:]([HKMCDayViewModel alloc], "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", a3, a4, a5, a6, a7, v18, v17, v21);

  return v19;
}

- (id)_initWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11
{
  id v18;
  id v19;
  HKMCDayViewModel *v20;
  HKMCDayViewModel *v21;
  uint64_t v22;
  NSArray *cycleFactors;
  objc_super v25;

  v18 = a8;
  v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HKMCDayViewModel;
  v20 = -[HKMCDayViewModel init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_menstruationLevel = a3;
    v20->_fertileWindowLevel = a4;
    v20->_pregnancyState = a5;
    v20->_bleedingInPregnancyLevel = a6;
    v20->_bleedingAfterPregnancyLevel = a7;
    objc_storeStrong((id *)&v20->_daySummary, a8);
    v22 = objc_msgSend(v19, "copy");
    cycleFactors = v21->_cycleFactors;
    v21->_cycleFactors = (NSArray *)v22;

    v21->_partiallyLoggedPeriod = a10;
    v21->_fetched = a11;
  }

  return v21;
}

- (unint64_t)defaultLoggingBleedingType
{
  unint64_t v2;

  v2 = self->_pregnancyState - 1;
  if (v2 > 4)
    return 0;
  else
    return qword_218AC7EB8[v2];
}

- (unint64_t)bleedingTypesWithFlowLogged
{
  unint64_t menstruationLevel;
  unint64_t bleedingInPregnancyLevel;
  unint64_t bleedingAfterPregnancyLevel;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t result;

  menstruationLevel = self->_menstruationLevel;
  bleedingInPregnancyLevel = self->_bleedingInPregnancyLevel;
  bleedingAfterPregnancyLevel = self->_bleedingAfterPregnancyLevel;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", menstruationLevel == 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", bleedingInPregnancyLevel == 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue") + v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", bleedingAfterPregnancyLevel == 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + objc_msgSend(v9, "integerValue");

  if (!v10)
    return 0;
  if (v10 != 1)
    return 4;
  v11 = 2;
  if (bleedingInPregnancyLevel != 1)
    v11 = 3;
  if (menstruationLevel == 4)
    result = 1;
  else
    result = v11;
  if (menstruationLevel != 4 && bleedingInPregnancyLevel != 1 && bleedingAfterPregnancyLevel != 1)
    return 0;
  return result;
}

- (BOOL)isSupplementaryDataLogged
{
  return -[HKMCDaySummary isSupplementaryDataLogged](self->_daySummary, "isSupplementaryDataLogged");
}

- (BOOL)isEqual:(id)a3
{
  HKMCDayViewModel *v4;
  HKMCDayViewModel *v5;
  HKMCDayViewModel *v6;
  BOOL v7;

  v4 = (HKMCDayViewModel *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v7 = self->_menstruationLevel == v5->_menstruationLevel
        && self->_fertileWindowLevel == v5->_fertileWindowLevel
        && self->_partiallyLoggedPeriod == v5->_partiallyLoggedPeriod
        && self->_fetched == v5->_fetched
        && -[HKMCDaySummary isEqual:](self->_daySummary, "isEqual:", v5->_daySummary)
        && self->_pregnancyState == v6->_pregnancyState;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  HKMCDaySummary *daySummary;
  NSUInteger v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = self->_menstruationLevel - 1;
  if (v5 > 4)
    v6 = CFSTR("None");
  else
    v6 = off_24D99E140[v5];
  v7 = self->_fertileWindowLevel - 1;
  if (v7 > 2)
    v8 = CFSTR("None");
  else
    v8 = off_24D99E168[v7];
  v9 = self->_pregnancyState - 1;
  if (v9 > 4)
    v10 = CFSTR("None -- No recently ended pregnancy");
  else
    v10 = off_24D99E180[v9];
  daySummary = self->_daySummary;
  v12 = -[NSArray count](self->_cycleFactors, "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_partiallyLoggedPeriod);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fetched);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p menstruationLevel:%@ fertileWindowLevel:%@ pregnancyState:%@ supplementaryDataLogged summary:%@ cycleFactors:%lu partialPeriod:%@ fetched:%@>"), v4, self, v6, v8, v10, daySummary, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_daySummary != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fetched);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p has summary:%@ fetched:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)accessibilityIdentifier
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;

  v3 = self->_menstruationLevel - 1;
  if (v3 > 4)
    v4 = CFSTR("None");
  else
    v4 = off_24D99E140[v3];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = self->_fertileWindowLevel - 1;
  if (v6 > 2)
    v7 = CFSTR("None");
  else
    v7 = off_24D99E168[v6];
  v8 = -[HKMCDayViewModel isSupplementaryDataLogged](self, "isSupplementaryDataLogged");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = self->_pregnancyState - 1;
  if (v10 > 4)
    v11 = CFSTR("None -- No recently ended pregnancy");
  else
    v11 = off_24D99E180[v10];
  return (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("menstruationLevel:%@|fertileWindowLevel:%@|supplementaryDataLogged:%@|pregnancyState:%@"), v4, v7, v9, v11);
}

- (unint64_t)menstruationLevel
{
  return self->_menstruationLevel;
}

- (unint64_t)fertileWindowLevel
{
  return self->_fertileWindowLevel;
}

- (unint64_t)pregnancyState
{
  return self->_pregnancyState;
}

- (unint64_t)bleedingInPregnancyLevel
{
  return self->_bleedingInPregnancyLevel;
}

- (unint64_t)bleedingAfterPregnancyLevel
{
  return self->_bleedingAfterPregnancyLevel;
}

- (BOOL)isFetched
{
  return self->_fetched;
}

- (BOOL)isPartiallyLoggedPeriod
{
  return self->_partiallyLoggedPeriod;
}

- (HKMCDaySummary)daySummary
{
  return self->_daySummary;
}

- (NSArray)cycleFactors
{
  return self->_cycleFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_daySummary, 0);
}

@end

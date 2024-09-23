@implementation HKPopulationNormsAbstractViewModel

- (HKPopulationNormsAbstractViewModel)initWithHealthStore:(id)a3
{
  id v5;
  HKPopulationNormsAbstractViewModel *v6;
  HKPopulationNormsAbstractViewModel *v7;
  uint64_t v8;
  OS_dispatch_queue *sampleQueryQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKPopulationNormsAbstractViewModel;
  v6 = -[HKPopulationNormsAbstractViewModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    sampleQueryQueue = v7->_sampleQueryQueue;
    v7->_sampleQueryQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)_requireConcreteImplementationOfSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("-[%@ %@] not implemented"), self, v6);

}

- (id)associatedSampleType
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0;
}

- (id)classificationIndexForSampleValue:(double)a3 age:(int64_t)a4 sex:(int64_t)a5
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2, a5, a3);
  return 0;
}

- (id)footerText
{
  return 0;
}

- (unint64_t)numberOfBiologicalSexSegments
{
  return 3;
}

- (id)localizedBiologicalSexTitles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX_FEMALE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX_MALE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX_ALL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)currentLocalizedClassificationDescription
{
  return -[HKPopulationNormsAbstractViewModel localizedClassificationDescriptionForIndex:](self, "localizedClassificationDescriptionForIndex:", -[HKPopulationNormsAbstractViewModel currentClassificationIndex](self, "currentClassificationIndex"));
}

- (id)currentLocalizedClassificationTitle
{
  return -[HKPopulationNormsAbstractViewModel localizedClassificationTitleForIndex:](self, "localizedClassificationTitleForIndex:", -[HKPopulationNormsAbstractViewModel currentClassificationIndex](self, "currentClassificationIndex"));
}

- (id)currentLocalizedClassificationName
{
  return -[HKPopulationNormsAbstractViewModel localizedClassificationNameForIndex:](self, "localizedClassificationNameForIndex:", -[HKPopulationNormsAbstractViewModel currentClassificationIndex](self, "currentClassificationIndex"));
}

- (int64_t)_biologicalSexForSexSegmentIndex:(unint64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = 3;
  if (a3)
    return v3;
  else
    return 1;
}

- (unint64_t)_biologicalSexSegmentIndexForSex:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 != 2)
    v3 = 2;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

- (int64_t)currentBiologicalSex
{
  return -[HKPopulationNormsAbstractViewModel _biologicalSexForSexSegmentIndex:](self, "_biologicalSexForSexSegmentIndex:", -[HKPopulationNormsAbstractViewModel currentBiologicalSexSegmentIndex](self, "currentBiologicalSexSegmentIndex"));
}

- (unint64_t)currentBiologicalSexSegmentIndex
{
  NSNumber *cacheBiologicalSexSegmentIndex;
  HKHealthStore *healthStore;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNumber *v16;
  NSNumber *v17;
  id v19;

  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  if (!cacheBiologicalSexSegmentIndex)
  {
    healthStore = self->_healthStore;
    v19 = 0;
    -[HKHealthStore biologicalSexWithError:](healthStore, "biologicalSexWithError:", &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;
    if (v5)
    {
      if (objc_msgSend(v5, "biologicalSex"))
      {
        v7 = (void *)MEMORY[0x1E0CB37E8];
        v8 = objc_msgSend(v5, "biologicalSex");
LABEL_8:
        objc_msgSend(v7, "numberWithUnsignedInteger:", -[HKPopulationNormsAbstractViewModel _biologicalSexSegmentIndexForSex:](self, "_biologicalSexSegmentIndexForSex:", v8));
        v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v17 = self->_cacheBiologicalSexSegmentIndex;
        self->_cacheBiologicalSexSegmentIndex = v16;

        cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
        return -[NSNumber unsignedIntegerValue](cacheBiologicalSexSegmentIndex, "unsignedIntegerValue");
      }
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
        -[HKPopulationNormsAbstractViewModel currentBiologicalSexSegmentIndex].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
    v8 = 0;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_8;
  }
  return -[NSNumber unsignedIntegerValue](cacheBiologicalSexSegmentIndex, "unsignedIntegerValue");
}

- (void)setBiologicalSexSegmentIndex:(unint64_t)a3
{
  NSNumber *v6;
  NSNumber *cacheBiologicalSexSegmentIndex;
  void *v8;

  if (-[HKPopulationNormsAbstractViewModel numberOfBiologicalSexSegments](self, "numberOfBiologicalSexSegments") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPopulationNormsAbstractViewModel.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("biologicalSexSegmentIndex >= 0 && biologicalSexSegmentIndex < [self numberOfBiologicalSexSegments]"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  self->_cacheBiologicalSexSegmentIndex = v6;

}

- (BOOL)isCurrentClassificationAvailable
{
  return self->_cacheClassificationIndex != 0;
}

- (unint64_t)currentClassificationIndex
{
  NSNumber *cacheClassificationIndex;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  float v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *v12;

  cacheClassificationIndex = self->_cacheClassificationIndex;
  if (!cacheClassificationIndex)
  {
    -[HKPopulationNormsAbstractViewModel userLatestSampleValue](self, "userLatestSampleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPopulationNormsAbstractViewModel currentAgeInYears](self, "currentAgeInYears");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      v7 = -[HKPopulationNormsAbstractViewModel _biologicalSexForSexSegmentIndex:](self, "_biologicalSexForSexSegmentIndex:", -[HKPopulationNormsAbstractViewModel currentBiologicalSexSegmentIndex](self, "currentBiologicalSexSegmentIndex"));
      objc_msgSend(v4, "floatValue");
      -[HKPopulationNormsAbstractViewModel classificationIndexForSampleValue:age:sex:](self, "classificationIndexForSampleValue:age:sex:", objc_msgSend(v6, "integerValue"), v7, v8);
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v10 = self->_cacheClassificationIndex;
      self->_cacheClassificationIndex = v9;

    }
    if (!self->_cacheClassificationIndex)
    {
      if (-[HKPopulationNormsAbstractViewModel numberOfClassifications](self, "numberOfClassifications"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (-[HKPopulationNormsAbstractViewModel numberOfClassifications](self, "numberOfClassifications") - 1) >> 1);
        v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (NSNumber *)&unk_1E9CEB270;
      }
      v12 = self->_cacheClassificationIndex;
      self->_cacheClassificationIndex = v11;

    }
    cacheClassificationIndex = self->_cacheClassificationIndex;
  }
  return -[NSNumber unsignedIntegerValue](cacheClassificationIndex, "unsignedIntegerValue");
}

- (void)setClassificationIndex:(unint64_t)a3
{
  NSNumber *v6;
  NSNumber *cacheClassificationIndex;
  void *v8;

  if (-[HKPopulationNormsAbstractViewModel numberOfClassifications](self, "numberOfClassifications") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPopulationNormsAbstractViewModel.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("classificationIndex >= 0 && classificationIndex < [self numberOfClassifications]"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cacheClassificationIndex = self->_cacheClassificationIndex;
  self->_cacheClassificationIndex = v6;

}

- (unint64_t)classificationIndexForLevelIndex:(unint64_t)a3
{
  return -[HKPopulationNormsAbstractViewModel numberOfClassifications](self, "numberOfClassifications") + ~a3;
}

- (id)currentAgeInYears
{
  NSNumber *cacheAgeInYears;
  HKHealthStore *healthStore;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  cacheAgeInYears = self->_cacheAgeInYears;
  if (!cacheAgeInYears)
  {
    healthStore = self->_healthStore;
    v19 = 0;
    -[HKHealthStore dateOfBirthComponentsWithError:](healthStore, "dateOfBirthComponentsWithError:", &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v5, "hk_ageWithCurrentDate:", v8));
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v10 = self->_cacheAgeInYears;
      self->_cacheAgeInYears = v9;

    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
        -[HKPopulationNormsAbstractViewModel currentAgeInYears].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
    }

    cacheAgeInYears = self->_cacheAgeInYears;
  }
  return cacheAgeInYears;
}

- (id)userAgeBucketIndex
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;

  v3 = *MEMORY[0x1E0CB7568];
  -[HKPopulationNormsAbstractViewModel currentAgeInYears](self, "currentAgeInYears");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v3 <= v5)
    v6 = v5;
  else
    v6 = v3;
  -[HKPopulationNormsAbstractViewModel currentDataForBiologicalSex](self, "currentDataForBiologicalSex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v14 = v13;

      if (v6 >= v12 && v6 - v12 < v14)
        break;
      if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      -[HKPopulationNormsAbstractViewModel userAgeBucketIndex].cold.1(v15);
    v16 = 0;
  }

  return v16;
}

- (id)userLatestSampleValue
{
  NSNumber *cacheLatestSampleValue;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  HKPopulationNormsAbstractViewModel *v14;
  dispatch_semaphore_t v15;

  cacheLatestSampleValue = self->_cacheLatestSampleValue;
  if (!cacheLatestSampleValue)
  {
    if (self->_userHasDataPointAvailable)
      return 0;
    self->_userHasDataPointAvailable = (NSNumber *)&unk_1E9CEB270;

    dispatch_assert_queue_V2((dispatch_queue_t)self->_sampleQueryQueue);
    v5 = dispatch_semaphore_create(0);
    -[HKPopulationNormsAbstractViewModel associatedSampleType](self, "associatedSampleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB6780];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __59__HKPopulationNormsAbstractViewModel_userLatestSampleValue__block_invoke;
    v13 = &unk_1E9C41BD8;
    v14 = self;
    v15 = v5;
    v8 = v5;
    objc_msgSend(v7, "queryForMostRecentSampleOfType:predicate:completion:", v6, 0, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9, v10, v11, v12, v13, v14);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    cacheLatestSampleValue = self->_cacheLatestSampleValue;
  }
  return cacheLatestSampleValue;
}

void __59__HKPopulationNormsAbstractViewModel_userLatestSampleValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5 != 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v7;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "BOOLValue"))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "quantity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_value");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 48);
    *(_QWORD *)(v13 + 48) = v12;

  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v6;
      _os_log_impl(&dword_1D7813000, v15, OS_LOG_TYPE_DEFAULT, "Failed to fetch latest VO2 max sample with error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)clearUserCharacteristicCache
{
  NSNumber *cacheBiologicalSexSegmentIndex;
  NSNumber *cacheClassificationIndex;
  NSNumber *cacheAgeInYears;
  NSNumber *cacheLatestSampleValue;
  NSNumber *userHasDataPointAvailable;

  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  self->_cacheBiologicalSexSegmentIndex = 0;

  cacheClassificationIndex = self->_cacheClassificationIndex;
  self->_cacheClassificationIndex = 0;

  cacheAgeInYears = self->_cacheAgeInYears;
  self->_cacheAgeInYears = 0;

  cacheLatestSampleValue = self->_cacheLatestSampleValue;
  self->_cacheLatestSampleValue = 0;

  userHasDataPointAvailable = self->_userHasDataPointAvailable;
  self->_userHasDataPointAvailable = 0;

}

- (void)prepareUserCharacteristicCacheWithHandler:(id)a3
{
  id v4;
  NSObject *sampleQueryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sampleQueryQueue = self->_sampleQueryQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke;
  v7[3] = &unk_1E9C40068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sampleQueryQueue, v7);

}

void __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[6])
    v3 = (id)objc_msgSend(v2, "userLatestSampleValue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke_2;
  block[3] = &unk_1E9C41C00;
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)viewTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)chartTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)levelsTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)quantityUnitTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)ageBucketsTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)seriesHighlightedColor
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0;
}

- (unint64_t)numberOfClassifications
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0;
}

- (BOOL)shouldShowClassificationTitle
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0;
}

- (id)localizedClassificationTitleForIndex:(unint64_t)a3
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)classificationIdentifierForIndex:(unint64_t)a3
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)localizedClassificationNameForIndex:(unint64_t)a3
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)localizedClassificationDescriptionForIndex:(unint64_t)a3
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (id)currentDataForBiologicalSex
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return (id)MEMORY[0x1E0C9AA70];
}

- (unint64_t)maximumUserAgeBucketIndex
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0;
}

- (double)maximumSampleValueQuantity
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0.0;
}

- (double)minimumSampleValueQuantity
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return 0.0;
}

- (id)hk_UIAutomationIdentifier
{
  -[HKPopulationNormsAbstractViewModel _requireConcreteImplementationOfSelector:](self, "_requireConcreteImplementationOfSelector:", a2);
  return &stru_1E9C4C428;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (OS_dispatch_queue)sampleQueryQueue
{
  return self->_sampleQueryQueue;
}

- (NSNumber)cacheBiologicalSexSegmentIndex
{
  return self->_cacheBiologicalSexSegmentIndex;
}

- (void)setCacheBiologicalSexSegmentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_cacheBiologicalSexSegmentIndex, a3);
}

- (NSNumber)cacheClassificationIndex
{
  return self->_cacheClassificationIndex;
}

- (void)setCacheClassificationIndex:(id)a3
{
  objc_storeStrong((id *)&self->_cacheClassificationIndex, a3);
}

- (NSNumber)cacheAgeInYears
{
  return self->_cacheAgeInYears;
}

- (void)setCacheAgeInYears:(id)a3
{
  objc_storeStrong((id *)&self->_cacheAgeInYears, a3);
}

- (NSNumber)cacheLatestSampleValue
{
  return self->_cacheLatestSampleValue;
}

- (void)setCacheLatestSampleValue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLatestSampleValue, a3);
}

- (NSNumber)userHasDataPointAvailable
{
  return self->_userHasDataPointAvailable;
}

- (void)setUserHasDataPointAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_userHasDataPointAvailable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHasDataPointAvailable, 0);
  objc_storeStrong((id *)&self->_cacheLatestSampleValue, 0);
  objc_storeStrong((id *)&self->_cacheAgeInYears, 0);
  objc_storeStrong((id *)&self->_cacheClassificationIndex, 0);
  objc_storeStrong((id *)&self->_cacheBiologicalSexSegmentIndex, 0);
  objc_storeStrong((id *)&self->_sampleQueryQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)currentBiologicalSexSegmentIndex
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Unable to retrieve biological sex: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)currentAgeInYears
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Unable to retrieve date of birth: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)userAgeBucketIndex
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "Unable to determine user age bucket index", v1, 2u);
}

@end

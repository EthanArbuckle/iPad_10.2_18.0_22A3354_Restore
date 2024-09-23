@implementation HDValueHistogramCollectionCalculator

- (HDValueHistogramCollectionCalculator)initWithQuantityType:(id)a3 quantityRanges:(id)a4 intervalCollection:(id)a5
{
  id v10;
  id v11;
  id v12;
  HDValueHistogramCollectionCalculator *v13;
  uint64_t v14;
  HKUnit *canonicalUnit;
  HDValueHistogramCollectionCalculator *v16;
  uint64_t v17;
  NSArray *valueRangesInCanonicalUnit;
  NSDateInterval *currentInterval;
  NSNumber *currentIntervalIndex;
  uint64_t v21;
  NSMutableArray *currentIntervalCountsByValueRange;
  unint64_t v23;
  uint64_t v24;
  NSMutableDictionary *finalizedHistogramsByDateIntervalIndex;
  void *v27;
  _QWORD v28[4];
  HDValueHistogramCollectionCalculator *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HDValueHistogramCollectionCalculator;
  v13 = -[HDValueHistogramCollectionCalculator init](&v30, sel_init);
  if (v13)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB6A38], "areRangesDisjoint:", v11) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("HDValueHistogramCollectionCalculator.m"), 130, CFSTR("Quantity ranges must be disjoint"));

    }
    objc_storeStrong((id *)&v13->_quantityType, a3);
    objc_storeStrong((id *)&v13->_quantityRanges, a4);
    objc_msgSend(v10, "canonicalUnit");
    v14 = objc_claimAutoreleasedReturnValue();
    canonicalUnit = v13->_canonicalUnit;
    v13->_canonicalUnit = (HKUnit *)v14;

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __95__HDValueHistogramCollectionCalculator_initWithQuantityType_quantityRanges_intervalCollection___block_invoke;
    v28[3] = &unk_1E6CF9030;
    v16 = v13;
    v29 = v16;
    objc_msgSend(v11, "hk_map:", v28);
    v17 = objc_claimAutoreleasedReturnValue();
    valueRangesInCanonicalUnit = v16->_valueRangesInCanonicalUnit;
    v16->_valueRangesInCanonicalUnit = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_intervalCollection, a5);
    currentInterval = v16->_currentInterval;
    v16->_currentInterval = 0;

    currentIntervalIndex = v16->_currentIntervalIndex;
    v16->_currentIntervalIndex = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v13->_quantityRanges, "count"));
    v21 = objc_claimAutoreleasedReturnValue();
    currentIntervalCountsByValueRange = v16->_currentIntervalCountsByValueRange;
    v16->_currentIntervalCountsByValueRange = (NSMutableArray *)v21;

    if (-[NSArray count](v13->_quantityRanges, "count"))
    {
      v23 = 0;
      do
      {
        -[NSMutableArray addObject:](v16->_currentIntervalCountsByValueRange, "addObject:", &unk_1E6DFC4B8);
        ++v23;
      }
      while (v23 < -[NSArray count](v13->_quantityRanges, "count"));
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    finalizedHistogramsByDateIntervalIndex = v16->_finalizedHistogramsByDateIntervalIndex;
    v16->_finalizedHistogramsByDateIntervalIndex = (NSMutableDictionary *)v24;

  }
  return v13;
}

uint64_t __95__HDValueHistogramCollectionCalculator_initWithQuantityType_quantityRanges_intervalCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueRangeWithUnit:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)addSampleValue:(double)a3 startTime:(double)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDateInterval *currentInterval;
  NSNumber *v12;
  NSNumber *currentIntervalIndex;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  NSNumber *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[_HKDateIntervalCollection dateIntervalContainingDate:index:](self->_intervalCollection, "dateIntervalContainingDate:index:", v7, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_valueRangesInCanonicalUnit, "count"))
  {
    v9 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_valueRangesInCanonicalUnit, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "contains:", a3) & 1) != 0)
        break;

      if (++v9 >= -[NSArray count](self->_valueRangesInCanonicalUnit, "count"))
        goto LABEL_5;
    }
    if (v10)
    {
      currentInterval = self->_currentInterval;
      if (!currentInterval)
      {
        objc_storeStrong((id *)&self->_currentInterval, v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
        v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        currentIntervalIndex = self->_currentIntervalIndex;
        self->_currentIntervalIndex = v12;

        currentInterval = self->_currentInterval;
      }
      if ((objc_msgSend(v8, "isEqual:", currentInterval) & 1) == 0)
      {
        objc_msgSend(v8, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateInterval startDate](self->_currentInterval, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "compare:", v15);

        if (v16 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDValueHistogramCollectionCalculator.m"), 174, CFSTR("Samples must be added in ascending order by start date"));

        }
        -[HDValueHistogramCollectionCalculator _currentHistogram]((id *)&self->super.isa);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_finalizedHistogramsByDateIntervalIndex, "setObject:forKeyedSubscript:", v17, self->_currentIntervalIndex);

        objc_storeStrong((id *)&self->_currentInterval, v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
        v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v19 = self->_currentIntervalIndex;
        self->_currentIntervalIndex = v18;

        if (-[NSMutableArray count](self->_currentIntervalCountsByValueRange, "count"))
        {
          v20 = 0;
          do
            -[NSMutableArray setObject:atIndexedSubscript:](self->_currentIntervalCountsByValueRange, "setObject:atIndexedSubscript:", &unk_1E6DFC4B8, v20++);
          while (v20 < -[NSMutableArray count](self->_currentIntervalCountsByValueRange, "count"));
        }
      }
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[NSMutableArray objectAtIndexedSubscript:](self->_currentIntervalCountsByValueRange, "objectAtIndexedSubscript:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](self->_currentIntervalCountsByValueRange, "setObject:atIndexedSubscript:", v23, v9);

    }
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

}

- (id)_currentHistogram
{
  id *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[2], "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1[2], "count"))
    {
      v3 = 0;
      do
      {
        objc_msgSend(v1[2], "objectAtIndexedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1[6], "objectAtIndexedSubscript:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "integerValue");

        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D90]), "initWithQuantityRange:count:", v4, v6);
        objc_msgSend(v2, "addObject:", v7);

        ++v3;
      }
      while (v3 < objc_msgSend(v1[2], "count"));
    }
    v1 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D78]), "initWithSegments:dateInterval:", v2, v1[7]);

  }
  return v1;
}

- (id)result
{
  void *v3;
  void *v4;
  id v5;
  NSArray *quantityRanges;
  void *v7;
  void *v8;
  void *v9;

  -[HDValueHistogramCollectionCalculator _currentHistogram]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableDictionary mutableCopy](self->_finalizedHistogramsByDateIntervalIndex, "mutableCopy");
  if (objc_msgSend(v3, "totalSampleCount") >= 1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, self->_currentIntervalIndex);
  v5 = objc_alloc(MEMORY[0x1E0CB6D80]);
  quantityRanges = self->_quantityRanges;
  -[_HKDateIntervalCollection anchorDate](self->_intervalCollection, "anchorDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKDateIntervalCollection intervalComponents](self->_intervalCollection, "intervalComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithQuantityRanges:valueHistogramsByDateIntervalIndex:anchorDate:intervalComponents:", quantityRanges, v4, v7, v8);

  return v9;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (_HKDateIntervalCollection)intervalCollection
{
  return self->_intervalCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizedHistogramsByDateIntervalIndex, 0);
  objc_storeStrong((id *)&self->_currentIntervalIndex, 0);
  objc_storeStrong((id *)&self->_currentInterval, 0);
  objc_storeStrong((id *)&self->_currentIntervalCountsByValueRange, 0);
  objc_storeStrong((id *)&self->_valueRangesInCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_intervalCollection, 0);
  objc_storeStrong((id *)&self->_quantityRanges, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end

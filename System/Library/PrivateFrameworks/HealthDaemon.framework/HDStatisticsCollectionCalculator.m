@implementation HDStatisticsCollectionCalculator

+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6
{
  id v9;
  id v10;
  HDStatisticsCollectionCalculator *v11;
  uint64_t v12;
  _QWORD *v13;

  v9 = a3;
  v10 = a4;
  v11 = [HDStatisticsCollectionCalculator alloc];
  v12 = _HKStatisticsComputationMethodForQuantityType(v9, a5);
  v13 = -[HDStatisticsCollectionCalculator initForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:](v11, v9, v10, a5, a6, v12);

  return v13;
}

- (_QWORD)initForQuantityType:(void *)a3 intervalCollection:(uint64_t)a4 options:(uint64_t)a5 mergeStrategy:(uint64_t)a6 computationMethod:
{
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  id v37;
  _QWORD *v38;
  id v39;
  id v40;
  _QWORD *v41;
  id v42;
  id v43;
  _QWORD *v44;
  id v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  objc_super v51;

  v11 = a2;
  v12 = a3;
  if (a1)
  {
    v51.receiver = a1;
    v51.super_class = (Class)HDStatisticsCollectionCalculator;
    v13 = objc_msgSendSuper2(&v51, sel_init);
    a1 = v13;
    if (v13)
    {
      v13[3] = a6;
      switch(a6)
      {
        case 0:
          v14 = v11;
          v15 = v12;
          v16 = a1;
          v17 = v14;
          v18 = v15;
          v19 = v16;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsCumulative,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsCumulative,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCumulative>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCumulative>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 1:
          v21 = v11;
          v22 = v12;
          v23 = a1;
          v17 = v21;
          v18 = v22;
          v19 = v23;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsDiscrete>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsDiscrete>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 2:
          v24 = v11;
          v25 = v12;
          v26 = a1;
          v17 = v24;
          v18 = v25;
          v19 = v26;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 3:
          v27 = v11;
          v28 = v12;
          v29 = a1;
          v17 = v27;
          v18 = v28;
          v19 = v29;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporallyWeightedDiscrete<HDStatisticsTemporallyWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsTemporallyWeightedDiscrete<HDStatisticsTemporallyWeightedDiscreteParameters>,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsTemporallyWeightedDiscrete<HDStatisticsTemporallyWeightedDiscreteParameters>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsTemporallyWeightedDiscrete<HDStatisticsTemporallyWeightedDiscreteParameters>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 4:
          v30 = v11;
          v31 = v12;
          v32 = a1;
          v17 = v30;
          v18 = v31;
          v19 = v32;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTimeInterval,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsTimeInterval,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsTimeInterval>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 5:
          v33 = v11;
          v34 = v12;
          v35 = a1;
          v17 = v33;
          v18 = v34;
          v19 = v35;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsNoiseLevel,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsNoiseLevel,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsNoiseLevel>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsNoiseLevel>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 6:
          v36 = v11;
          v37 = v12;
          v38 = a1;
          v17 = v36;
          v18 = v37;
          v19 = v38;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsAverageSampleDuration,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsAverageSampleDuration,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsAverageSampleDuration>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsAverageSampleDuration>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 7:
          v39 = v11;
          v40 = v12;
          v41 = a1;
          v17 = v39;
          v18 = v40;
          v19 = v41;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsPercentiles,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsPercentiles,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsPercentiles>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsPercentiles>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 8:
          v42 = v11;
          v43 = v12;
          v44 = a1;
          v17 = v42;
          v18 = v43;
          v19 = v44;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsPresence,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsPresence,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsPresence>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsPresence>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          goto LABEL_74;
        case 9:
          v45 = v11;
          v46 = v12;
          v47 = a1;
          v17 = v45;
          v18 = v46;
          v19 = v47;
          if ((a4 & 0x40) != 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsSleepStages,HDStatisticsTimeInterval>>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
            else
            {
              v20 = operator new();
              _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsCombined<HDStatisticsSleepStages,HDStatisticsTimeInterval>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
            }
          }
          else if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0)
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
          else
          {
            v20 = operator new();
            _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_HDConcreteStatisticsCollectionCalculatorImplementation(v20, v17, a4, a5, v18, v19);
          }
LABEL_74:

          v48 = v19[1];
          v19[1] = v20;
          if (v48)
            (*(void (**)(uint64_t))(*(_QWORD *)v48 + 8))(v48);
          break;
        default:
          break;
      }
      objc_storeWeak((id *)(a1[1] + 8), a1);
      v49 = (void *)a1[4];
      a1[4] = MEMORY[0x1E0C9AA60];

    }
  }

  return a1;
}

+ (id)calculatorForCategoryType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:", v10, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v13, v11, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6 computationMethod:(int64_t)a7
{
  id v11;
  id v12;
  _QWORD *v13;

  v11 = a3;
  v12 = a4;
  v13 = -[HDStatisticsCollectionCalculator initForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:]([HDStatisticsCollectionCalculator alloc], v11, v12, a5, a6, a7);

  return v13;
}

- (HKQuantityType)quantityType
{
  return (HKQuantityType *)*((id *)self->_implementation.__ptr_.__value_ + 2);
}

- (_HKDateIntervalCollection)intervalCollection
{
  return (_HKDateIntervalCollection *)*((id *)self->_implementation.__ptr_.__value_ + 5);
}

- (unint64_t)options
{
  return *((_QWORD *)self->_implementation.__ptr_.__value_ + 3);
}

- (unint64_t)mergeStrategy
{
  return *((_QWORD *)self->_implementation.__ptr_.__value_ + 4);
}

- (double)mergeGranularity
{
  double result;

  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                            + 16))(self->_implementation.__ptr_.__value_);
  return result;
}

- (BOOL)setMaskedIntervals:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  NSArray *maskedIntervals;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  char v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p;
  void *v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  maskedIntervals = self->_maskedIntervals;
  self->_maskedIntervals = v7;

  __p = 0;
  v28 = 0;
  v29 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "startDate", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceReferenceDate");
        v16 = v15;
        objc_msgSend(v13, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        if (v18 >= v16)
          v19 = v16;
        else
          v19 = v18;
        if (v16 >= v18)
          v20 = v16;
        else
          v20 = v18;
        HKIntervalMask<double>::_insertInterval((uint64_t *)&__p, v19, v20);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v10);
  }

  v21 = (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, void **, id *))(*(_QWORD *)self->_implementation.__ptr_.__value_ + 64))(self->_implementation.__ptr_.__value_, &__p, a4);
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }

  return v21;
}

- (void)setMergeGranularity:(double)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, double))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                    + 24))(self->_implementation.__ptr_.__value_, a3);
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)(*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_ + 32))(self->_implementation.__ptr_.__value_);
}

- (void)setDateInterval:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                + 40))(self->_implementation.__ptr_.__value_, a3);
}

- (void)configureMergeAnchor:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                + 48))(self->_implementation.__ptr_.__value_, a3);
}

- (void)setStatisticsHandler:(id)a3
{
  id v4;
  void *v5;
  id statisticsHandler;
  _HDStatisticsCollectionCalculatorImplementation *value;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  statisticsHandler = self->_statisticsHandler;
  self->_statisticsHandler = v5;

  if (v4)
  {
    objc_initWeak(&location, self);
    value = self->_implementation.__ptr_.__value_;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__HDStatisticsCollectionCalculator_setStatisticsHandler___block_invoke;
    v8[3] = &unk_1E6D04550;
    v9 = v4;
    objc_copyWeak(&v10, &location);
    (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, _QWORD *))(*(_QWORD *)value + 72))(value, v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, _QWORD))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                      + 72))(self->_implementation.__ptr_.__value_, 0);
  }

}

void __57__HDStatisticsCollectionCalculator_setStatisticsHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (HDStatisticsCollectionCalculatorDataSource)dataSource
{
  return (HDStatisticsCollectionCalculatorDataSource *)(*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_ + 80))(self->_implementation.__ptr_.__value_);
}

- (void)setDataSource:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                + 88))(self->_implementation.__ptr_.__value_, a3);
}

- (void)setStatisticsConfiguration:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                + 56))(self->_implementation.__ptr_.__value_, a3);
}

- (BOOL)addSampleValue:(double)a3 startTime:(double)a4 endTime:(double)a5 sourceID:(int64_t)a6 error:(id *)a7
{
  void *v10;
  double v11;
  _QWORD v13[4];
  char v14;
  BOOL v15;

  *(double *)v13 = a3;
  *(double *)&v13[1] = a4;
  *(double *)&v13[2] = a5;
  v13[3] = a6;
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v15 = v11 <= a5;

  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, _QWORD *, id *))(*(_QWORD *)self->_implementation.__ptr_.__value_ + 104))(self->_implementation.__ptr_.__value_, v13, a7);
}

- (BOOL)performAddSampleTransaction:(id)a3 error:(id *)a4
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, id, id *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                                + 112))(self->_implementation.__ptr_.__value_, a3, a4);
}

- (BOOL)performInitialStatisticsTransaction:(id)a3 error:(id *)a4
{
  id v6;
  _HDStatisticsCollectionCalculatorImplementation *value;
  uint64_t (*v8)(_HDStatisticsCollectionCalculatorImplementation *, _QWORD *, id *);
  id v9;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  value = self->_implementation.__ptr_.__value_;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__HDStatisticsCollectionCalculator_performInitialStatisticsTransaction_error___block_invoke;
  v11[3] = &unk_1E6D04578;
  v11[4] = self;
  v12 = v6;
  v8 = *(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, _QWORD *, id *))(*(_QWORD *)value + 112);
  v9 = v6;
  LOBYTE(a4) = v8(value, v11, a4);

  return (char)a4;
}

uint64_t __78__HDStatisticsCollectionCalculator_performInitialStatisticsTransaction_error___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 8));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)queryForInitialStatisticsWithError:(id *)a3
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, HDStatisticsCollectionCalculator *, id *))(*(_QWORD *)self->_implementation.__ptr_.__value_ + 136))(self->_implementation.__ptr_.__value_, self, a3);
}

- (BOOL)invalidateInterval:(id)a3 error:(id *)a4
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, id, id *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                                + 128))(self->_implementation.__ptr_.__value_, a3, a4);
}

- (void)reset
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                            + 144))(self->_implementation.__ptr_.__value_);
}

- (id)currentStatistics
{
  return (id)(*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                          + 96))(self->_implementation.__ptr_.__value_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", *((_QWORD *)self->_implementation.__ptr_.__value_ + 2), CFSTR("quantity_type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_computationMethod, CFSTR("computation_method"));
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                            + 32))(self->_implementation.__ptr_.__value_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("date_interval"));

  objc_msgSend(v5, "encodeInteger:forKey:", *((_QWORD *)self->_implementation.__ptr_.__value_ + 3), CFSTR("options"));
  objc_msgSend(v5, "encodeInteger:forKey:", *((_QWORD *)self->_implementation.__ptr_.__value_ + 4), CFSTR("merge_strategy"));
  objc_msgSend(v5, "encodeObject:forKey:", *((_QWORD *)self->_implementation.__ptr_.__value_ + 5), CFSTR("interval_collection"));
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                            + 16))(self->_implementation.__ptr_.__value_);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("merge_granularity"));
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(_QWORD *)self->_implementation.__ptr_.__value_
                                                                                + 152))(self->_implementation.__ptr_.__value_, v5);

}

- (HDStatisticsCollectionCalculator)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval_collection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merge_strategy"));
  v9 = _HKStatisticsComputationMethodForQuantityType(v5, v7);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("computation_method")))
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("computation_method"));
  objc_msgSend((id)objc_opt_class(), "calculatorForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:", v5, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date_interval"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend((id)v10, "setDateInterval:", v11);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("merge_granularity"));
    objc_msgSend((id)v10, "setMergeGranularity:");
    (*(void (**)(_QWORD, id))(**(_QWORD **)(v10 + 8) + 160))(*(_QWORD *)(v10 + 8), v4);

  }
  return (HDStatisticsCollectionCalculator *)v10;
}

- (id)archivedRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)calculatorForArchivedRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bundleIdentifierForSourceID:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceOrderProvider);
  objc_msgSend(WeakRetained, "sourceForSourceID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sourceForSourceID:(int64_t)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceOrderProvider);
  objc_msgSend(WeakRetained, "sourceForSourceID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)orderSourceIDs:(void *)a3
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  uint64_t *v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  unint64_t v85;
  void *v86;
  void *v87;
  unint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  void *v110;
  unint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  unint64_t v116;
  void *v117;
  void *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  BOOL v122;
  char v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  unint64_t v130;
  void *v131;
  void *v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  unint64_t v139;
  void *v140;
  void *v141;
  unint64_t v142;
  uint64_t *v143;
  int64_t v144;
  int64_t v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  void *v151;
  void *v152;
  unint64_t v153;
  void *v154;
  void *v155;
  unint64_t v156;
  uint64_t *v157;
  uint64_t *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  unint64_t v162;
  void *v163;
  void *v164;
  unint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t *v170;
  void *v171;
  void *v172;
  unint64_t v173;
  void *v174;
  void *v175;
  unint64_t v176;
  void *v177;
  void *v178;
  unint64_t v179;
  void *v180;
  void *v181;
  unint64_t v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  int64_t v186;
  uint64_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  void *v192;
  void *v193;
  unint64_t v194;
  void *v195;
  void *v196;
  unint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t *v201;
  uint64_t *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  unint64_t v206;
  void *v207;
  void *v208;
  unint64_t v209;
  uint64_t *v210;
  uint64_t *v211;
  void *v212;
  void *v213;
  unint64_t v214;
  void *v215;
  void *v216;
  unint64_t v217;
  BOOL v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  unint64_t v223;
  void *v224;
  void *v225;
  unint64_t v226;
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  unint64_t v232;
  void *v233;
  void *v234;
  unint64_t v235;
  uint64_t *v236;
  unint64_t v237;
  int64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t *v242;
  uint64_t *v243;
  uint64_t v244;
  int64_t v245;
  int64_t v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;

- (int64_t)computationMethod
{
  return self->_computationMethod;
}

- (NSArray)maskedIntervals
{
  return self->_maskedIntervals;
}

- (id)statisticsHandler
{
  return self->_statisticsHandler;
}

- (HDStatisticsCollectionCalculatorSourceOrderProvider)sourceOrderProvider
{
  return (HDStatisticsCollectionCalculatorSourceOrderProvider *)objc_loadWeakRetained((id *)&self->_sourceOrderProvider);
}

- (void)setSourceOrderProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sourceOrderProvider, a3);
}

- (void).cxx_destruct
{
  _HDStatisticsCollectionCalculatorImplementation *value;

  objc_destroyWeak((id *)&self->_sourceOrderProvider);
  objc_storeStrong((id *)&self->_maskedIntervals, 0);
  objc_storeStrong(&self->_statisticsHandler, 0);
  value = self->_implementation.__ptr_.__value_;
  self->_implementation.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

@implementation HDStatisticsCollectionCalculatorAttenuatedDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 attenuationType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  HDQuantitySampleAttenuationProvider *v18;
  void *v19;
  HDQuantitySampleAttenuationEngine *v20;
  void *v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDStatisticsCollectionCalculatorAttenuatedDataSource;
  v17 = -[HDStatisticsCollectionCalculatorDefaultDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:](&v23, sel_initForProfile_quantityType_predicate_restrictedSourceEntities_, v12, v13, v14, v15);
  if (v17)
  {
    v18 = -[HDQuantitySampleAttenuationProvider initWithQuantityType:profile:]([HDQuantitySampleAttenuationProvider alloc], "initWithQuantityType:profile:", v16, v12);
    v19 = (void *)v17[12];
    v17[12] = v18;

    v20 = -[HDQuantitySampleAttenuationEngine initWithAttenuationEngineDelegate:]([HDQuantitySampleAttenuationEngine alloc], "initWithAttenuationEngineDelegate:", v17[12]);
    v21 = (void *)v17[13];
    v17[13] = v20;

  }
  return v17;
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  HDQuantitySampleAttenuationEngine *attenuationEngine;
  BOOL v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  objc_super v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;

  v12 = a6;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v28[3] = &unk_1E6D10008;
  v28[4] = self;
  v15 = v12;
  v29 = v15;
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v26[3] = &unk_1E6CFC2C0;
  v16 = v13;
  v27 = v16;
  v25.receiver = self;
  v25.super_class = (Class)HDStatisticsCollectionCalculatorAttenuatedDataSource;
  if (-[HDStatisticsCollectionCalculatorDefaultDataSource collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:](&v25, sel_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler_, a3, a4, a5, v28, v26))
  {
    attenuationEngine = self->_attenuationEngine;
    v24 = 0;
    v18 = -[HDQuantitySampleAttenuationEngine delegateLoadingWasSuccessful:](attenuationEngine, "delegateLoadingWasSuccessful:", &v24);
    v19 = v24;
    v20 = v19;
    if (!v18)
    {
      v21 = v19;
      v22 = v21;
      if (v21)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4, double a5, double a6)
{
  double v8;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  __int128 v30;
  _QWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  uint64_t v37;
  _QWORD v38[3];
  char v39;
  _BYTE v40[7];
  uint64_t v41;
  _QWORD v42[3];
  char v43;
  _BYTE v44[7];
  uint64_t v45;
  _QWORD v46[3];
  char v47;
  _BYTE v48[7];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[3];
  char v54;
  _BYTE v55[7];
  uint64_t v56;
  _QWORD v57[3];
  char v58;
  _BYTE v59[7];
  uint64_t v60;
  _QWORD v61[3];
  char v62;
  _BYTE v63[7];
  uint64_t v64;
  _DWORD v65[6];

  v8 = a5;
  *(_DWORD *)((char *)v65 + 3) = 0;
  v65[0] = 0;
  if (a3)
  {
    v11 = *(void **)(a1 + 32);
    *(double *)v61 = a5;
    *(double *)&v61[1] = a6;
    *(double *)&v61[2] = a4;
    v62 = 1;
    memset(v63, 0, sizeof(v63));
    v64 = a2;
    objc_msgSend(v11, "_attenuationSamplesWindowAdvanceToSample:", v61);
  }
  v12 = *(void **)(a1 + 32);
  *(double *)v57 = v8;
  *(double *)&v57[1] = a6;
  *(double *)&v57[2] = a4;
  v58 = 1;
  memset(v59, 0, sizeof(v59));
  v60 = a2;
  v13 = objc_msgSend(v12, "_attenuationSamplesWindowContainsSample:", v57);
  v14 = *(void **)(a1 + 32);
  *(double *)v53 = v8;
  *(double *)&v53[1] = a6;
  *(double *)&v53[2] = a4;
  v54 = 1;
  memset(v55, 0, sizeof(v55));
  v56 = a2;
  v15 = objc_msgSend(v14, "_attenuationSamplesWindowContainsSampleStart:", v53);
  if ((v13 & 1) != 0 || v15)
  {
    v29 = v15;
    v17 = *(void **)(a1 + 32);
    *(double *)v46 = v8;
    *(double *)&v46[1] = a6;
    *(double *)&v46[2] = a4;
    v47 = 1;
    memset(v48, 0, sizeof(v48));
    v49 = a2;
    if (v17)
    {
      objc_msgSend(v17, "_extractAttenuatedSamplesFrom:", v46);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
    }
    while (*((_QWORD *)&v52 + 1))
    {
      v18 = (double *)(*(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * ((unint64_t)v52 / 0x66))
                     + 40 * ((unint64_t)v52 % 0x66));
      v19 = *v18;
      v20 = v18[1];
      v21 = v18[2];
      *(_QWORD *)&v52 = v52 + 1;
      --*((_QWORD *)&v52 + 1);
      if ((unint64_t)v52 >= 0xCC)
      {
        operator delete(**((void ***)&v50 + 1));
        *((_QWORD *)&v50 + 1) += 8;
        *(_QWORD *)&v52 = v52 - 102;
      }
      if (((*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v21, v19, v20) & 1) == 0)
      {
        std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&v50);
        return 0;
      }
    }
    std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&v50);
    v15 = v29;
    if ((v13 & 1) != 0)
      return 1;
  }
  else if ((v13 & 1) != 0)
  {
    return 1;
  }
  v22 = *(_QWORD **)(a1 + 32);
  v23 = a2;
  if (v15)
  {
    v23 = 0;
    v24 = v22[19] + v22[18] - 1;
    v8 = *(double *)(*(_QWORD *)(v22[15] + 8 * (v24 / 0x66)) + 40 * (v24 % 0x66) + 8);
  }
  *(_QWORD *)&v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v25 = (void *)v22[13];
  *(double *)v42 = v8;
  *(double *)&v42[1] = a6;
  *(double *)&v42[2] = a4;
  v16 = 1;
  v43 = 1;
  memset(v44, 0, sizeof(v44));
  v45 = v23;
  if (v25)
  {
    objc_msgSend(v25, "attenuateSample:", v42);
    if (*((double *)&v50 + 1) - *(double *)&v50 > 0.000001)
    {
      v30 = xmmword_1B7F3E600;
      do
      {
        v26 = *(void **)(a1 + 32);
        *(double *)v38 = v8;
        *(double *)&v38[1] = a6;
        *(double *)&v38[2] = a4;
        v39 = 1;
        *(_DWORD *)v40 = v65[0];
        *(_DWORD *)&v40[3] = *(_DWORD *)((char *)v65 + 3);
        v41 = v23;
        v36[0] = v50;
        v36[1] = v51;
        v37 = v52;
        objc_msgSend(v26, "_appendToAttenuationSamplesWindowUsingSourceSample:attenuatedSample:", v38, v36, (_QWORD)v30);
        v16 = (*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)&v51, *(double *)&v50, *((double *)&v50 + 1));
        if (!(_DWORD)v16 || a6 - *((double *)&v50 + 1) <= 0.000001)
          break;
        v27 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        v31[0] = *((_QWORD *)&v50 + 1);
        *(double *)&v31[1] = a6;
        *(double *)&v31[2] = a4;
        v32 = v30;
        if (v27)
        {
          objc_msgSend(v27, "attenuateSample:", v31);
        }
        else
        {
          v35 = 0;
          v33 = 0u;
          v34 = 0u;
        }
        v50 = v33;
        v51 = v34;
        *(_QWORD *)&v52 = v35;
      }
      while (*((double *)&v33 + 1) - *(double *)&v33 > 0.000001);
    }
  }
  return v16;
}

uint64_t __127__HDStatisticsCollectionCalculatorAttenuatedDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_appendToAttenuationSamplesWindowUsingSourceSample:(id *)a3 attenuatedSample:(id *)a4
{
  __int128 v4;
  double v5;
  __int128 v6;

  v4 = *(_OWORD *)&a4->var0;
  v5 = a3->var2 - a4->var2;
  v6 = xmmword_1B7F3E600;
  std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(&self->_attenuationSamplesWindow.__map_.__first_, (uint64_t)&v4);
}

- (BOOL)_attenuationSamplesWindowContainsSample:(id *)a3
{
  unint64_t value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **begin;
  unint64_t start;
  BOOL result;

  value = self->_attenuationSamplesWindow.__size_.__value_;
  result = value
        && (begin = self->_attenuationSamplesWindow.__map_.__begin_,
            start = self->_attenuationSamplesWindow.__start_,
            *((double *)begin[start / 0x66] + 5 * (start % 0x66)) <= a3->var0)
        && *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1) >= a3->var1;
  return result;
}

- (BOOL)_attenuationSamplesWindowContainsSampleStart:(id *)a3
{
  unint64_t value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **begin;
  unint64_t start;
  double v6;
  BOOL result;

  value = self->_attenuationSamplesWindow.__size_.__value_;
  result = value
        && (begin = self->_attenuationSamplesWindow.__map_.__begin_,
            start = self->_attenuationSamplesWindow.__start_,
            *((double *)begin[start / 0x66] + 5 * (start % 0x66)) <= a3->var0)
        && (v6 = *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1), v6 < a3->var1)
        && a3->var0 < v6;
  return result;
}

- (queue<HDQuantitySampleAttenuationEngineSample,)_extractAttenuatedSamplesFrom:()queue<HDQuantitySampleAttenuationEngineSample
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 ***p_end;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double var0;
  double var1;
  BOOL v15;
  double v16;
  BOOL v17;
  BOOL var3;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  int64_t var4;

  *(_OWORD *)&retstr->var0.__map_.__end_ = 0u;
  *(_OWORD *)&retstr->var0.__start_ = 0u;
  *(_OWORD *)&retstr->var0.__map_.__first_ = 0u;
  p_end = &self[2].var0.__map_.__end_;
  if (self[3].var0.__map_.__begin_)
  {
    v7 = 0;
    do
    {
      v8 = (double *)((char *)p_end[1][((unint64_t)p_end[4] + v7) / 0x66]
                    + 40 * (((unint64_t)p_end[4] + v7) % 0x66));
      v9 = *v8;
      v10 = v8[1];
      v11 = fmax(a4->var2 - v8[2], 0.0);
      var0 = a4->var0;
      if (*v8 > a4->var0 || v10 <= var0)
      {
        if (v9 >= var0)
        {
          var1 = a4->var1;
          if (v10 <= var1)
          {
            v19 = *v8;
            v20 = v10;
            v21 = v11;
            var3 = a4->var3;
            var4 = a4->var4;
            v22 = var3;
            std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
          }
          else if (v9 < var1)
          {
            if (v10 < var1)
              var1 = v8[1];
            v19 = *v8;
            v20 = var1;
            v21 = v11;
            v15 = a4->var3;
            var4 = a4->var4;
            v22 = v15;
            std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
          }
        }
      }
      else
      {
        v16 = a4->var1;
        if (v10 < v16)
          v16 = v8[1];
        v19 = a4->var0;
        v20 = v16;
        v21 = v11;
        v17 = a4->var3;
        var4 = a4->var4;
        v22 = v17;
        std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(retstr, (uint64_t)&v19);
      }
      if (v10 >= a4->var1)
        break;
      ++v7;
    }
    while ((unint64_t)p_end[5] > v7);
  }
  return self;
}

- (void)_attenuationSamplesWindowAdvanceToSample:(id *)a3
{
  deque<HDQuantitySampleAttenuationEngineSample, std::allocator<HDQuantitySampleAttenuationEngineSample>> *p_attenuationSamplesWindow;
  unint64_t value;
  void **begin;
  unint64_t start;
  double *v8;
  double var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **end;
  unint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v12;
  uint64_t v13;

  p_attenuationSamplesWindow = &self->_attenuationSamplesWindow;
  value = self->_attenuationSamplesWindow.__size_.__value_;
  if (value)
  {
    begin = (void **)self->_attenuationSamplesWindow.__map_.__begin_;
    start = self->_attenuationSamplesWindow.__start_;
    v8 = (double *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    var0 = a3->var0;
    if (*v8 > a3->var0 || *((double *)begin[(value + start - 1) / 0x66] + 5 * ((value + start - 1) % 0x66) + 1) <= var0)
    {
      end = self->_attenuationSamplesWindow.__map_.__end_;
      self->_attenuationSamplesWindow.__size_.__value_ = 0;
      v11 = (char *)end - (char *)begin;
      if (v11 >= 0x11)
      {
        do
        {
          operator delete(*begin);
          v12 = p_attenuationSamplesWindow->__map_.__end_;
          begin = (void **)(p_attenuationSamplesWindow->__map_.__begin_ + 1);
          p_attenuationSamplesWindow->__map_.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)begin;
          v11 = (char *)v12 - (char *)begin;
        }
        while (v11 > 0x10);
      }
      if (v11 >> 3 == 1)
      {
        v13 = 51;
      }
      else
      {
        if (v11 >> 3 != 2)
          return;
        v13 = 102;
      }
      p_attenuationSamplesWindow->__start_ = v13;
    }
    else if (v8[1] <= var0)
    {
      do
      {
        if (*((double *)begin[start / 0x66] + 5 * (start % 0x66) + 1) > a3->var0)
          break;
        --value;
        p_attenuationSamplesWindow->__start_ = ++start;
        p_attenuationSamplesWindow->__size_.__value_ = value;
        if (start >= 0xCC)
        {
          operator delete(*begin);
          begin = (void **)(p_attenuationSamplesWindow->__map_.__begin_ + 1);
          p_attenuationSamplesWindow->__map_.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)begin;
          value = p_attenuationSamplesWindow->__size_.__value_;
          start = p_attenuationSamplesWindow->__start_ - 102;
          p_attenuationSamplesWindow->__start_ = start;
        }
      }
      while (value);
    }
  }
}

- (HDQuantitySampleAttenuationProvider)attenuationProvider
{
  return self->_attenuationProvider;
}

- (HDQuantitySampleAttenuationEngine)attenuationEngine
{
  return self->_attenuationEngine;
}

- (deque<HDQuantitySampleAttenuationEngineSample,)attenuationSamplesWindow
{
  unint64_t start;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v6;
  __int128 *v7;
  unint64_t v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v9;
  unint64_t v10;
  unint64_t v11;

  *(_OWORD *)&retstr->__map_.__first_ = 0u;
  *(_OWORD *)&retstr->__map_.__end_ = 0u;
  *(_OWORD *)&retstr->__start_ = 0u;
  start = self->_attenuationSamplesWindow.__start_;
  begin = self->_attenuationSamplesWindow.__map_.__begin_;
  v6 = &begin[start / 0x66];
  if (self->_attenuationSamplesWindow.__map_.__end_ == begin)
  {
    v7 = 0;
    v10 = 0;
    v9 = &begin[(self->_attenuationSamplesWindow.__size_.__value_ + start) / 0x66];
  }
  else
  {
    v7 = (__int128 *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    v8 = self->_attenuationSamplesWindow.__size_.__value_ + start;
    v9 = &begin[v8 / 0x66];
    v10 = (unint64_t)*v9 + 40 * (v8 % 0x66);
  }
  if ((__int128 *)v10 == v7)
    v11 = 0;
  else
    v11 = 102 * (v9 - v6)
        - 0x3333333333333333 * ((uint64_t)(v10 - (_QWORD)*v9) >> 3)
        + 0x3333333333333333 * (((char *)v7 - (char *)*v6) >> 3);
  return (deque<HDQuantitySampleAttenuationEngineSample, std::allocator<HDQuantitySampleAttenuationEngineSample>> *)std::deque<HDQuantitySampleAttenuationEngineSample>::__append_with_size[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>>(retstr, v6, v7, v11);
}

- (void)setAttenuationSamplesWindow:()deque<HDQuantitySampleAttenuationEngineSample
{
  deque<HDQuantitySampleAttenuationEngineSample, std::allocator<HDQuantitySampleAttenuationEngineSample>> *p_attenuationSamplesWindow;
  unint64_t start;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **begin;
  uint64_t *v6;
  __int128 *v7;
  unint64_t v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t value;
  __compressed_pair<unsigned long, std::allocator<HDQuantitySampleAttenuationEngineSample>> *p_size;
  uint64_t *v14;
  __int128 *v15;
  unint64_t v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v22;
  unint64_t v23;
  uint64_t *v24;
  __int128 *v25;
  unint64_t v26;
  unint64_t v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v28;
  uint64_t end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v39;
  uint64_t v40;
  uint64_t *v41;
  __int128 *v42;

  p_attenuationSamplesWindow = &self->_attenuationSamplesWindow;
  if (&self->_attenuationSamplesWindow == a3)
    return;
  start = a3->__start_;
  begin = a3->__map_.__begin_;
  v6 = (uint64_t *)&begin[start / 0x66];
  if (a3->__map_.__end_ == begin)
  {
    v7 = 0;
    v10 = 0;
    v9 = &begin[(a3->__size_.__value_ + start) / 0x66];
  }
  else
  {
    v7 = (__int128 *)((char *)begin[start / 0x66] + 40 * (start % 0x66));
    v8 = a3->__size_.__value_ + start;
    v9 = &begin[v8 / 0x66];
    v10 = (unint64_t)*v9 + 40 * (v8 % 0x66);
  }
  if ((__int128 *)v10 == v7)
  {
    v11 = 0;
    p_size = &self->_attenuationSamplesWindow.__size_;
  }
  else
  {
    v11 = 102 * (((char *)v9 - (char *)v6) >> 3)
        - 0x3333333333333333 * ((uint64_t)(v10 - (_QWORD)*v9) >> 3)
        + 0x3333333333333333 * (((uint64_t)v7 - *v6) >> 3);
    p_size = &self->_attenuationSamplesWindow.__size_;
    value = self->_attenuationSamplesWindow.__size_.__value_;
    if (value < v11)
    {
      v41 = v6;
      v42 = v7;
      std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, value);
      v14 = v41;
      v15 = v42;
      v16 = p_attenuationSamplesWindow->__start_;
      v17 = p_attenuationSamplesWindow->__map_.__begin_;
      v18 = (uint64_t *)&v17[v16 / 0x66];
      if (p_attenuationSamplesWindow->__map_.__end_ == v17)
        v19 = 0;
      else
        v19 = *v18 + 40 * (v16 % 0x66);
      v41 = v18;
      v42 = (__int128 *)v19;
      std::__for_each_segment[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>>>(v6, v7, v14, v15, (uint64_t)&v41);
      std::deque<HDQuantitySampleAttenuationEngineSample>::__append_with_size[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>>(p_attenuationSamplesWindow, v14, v15, v11 - p_attenuationSamplesWindow->__size_.__value_);
      return;
    }
  }
  v20 = self->_attenuationSamplesWindow.__start_;
  v21 = self->_attenuationSamplesWindow.__map_.__begin_;
  v22 = &v21[v20 / 0x66];
  if (self->_attenuationSamplesWindow.__map_.__end_ == v21)
    v23 = 0;
  else
    v23 = (unint64_t)*v22 + 40 * (v20 % 0x66);
  v41 = v6;
  v42 = v7;
  std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, v11);
  v24 = v41;
  v25 = v42;
  v41 = (uint64_t *)v22;
  v42 = (__int128 *)v23;
  std::__for_each_segment[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>>>(v6, v7, v24, v25, (uint64_t)&v41);
  v26 = p_attenuationSamplesWindow->__start_;
  v27 = p_attenuationSamplesWindow->__size_.__value_;
  v28 = p_attenuationSamplesWindow->__map_.__begin_;
  end = (uint64_t)p_attenuationSamplesWindow->__map_.__end_;
  v30 = &v28[(v26 + v27) / 0x66];
  if (($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28)
    v31 = 0;
  else
    v31 = (unint64_t)*v30 + 40 * ((v26 + v27) % 0x66);
  if ((__int128 *)v31 != v42)
  {
    v32 = 102 * (((char *)v30 - (char *)v41) >> 3) - 0x3333333333333333 * ((uint64_t)(v31 - (_QWORD)*v30) >> 3);
    v33 = ((uint64_t)v42 - *v41) >> 3;
    v34 = v32 + 0x3333333333333333 * v33;
    if (v34 >= 1)
    {
      v35 = &v28[v26 / 0x66];
      v36 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28 ? 0 : (unint64_t)*v35 + 40 * (v26 % 0x66);
      v37 = v42 == (__int128 *)v36
          ? 0
          : 102 * (((char *)v41 - (char *)v35) >> 3)
          - 0x3333333333333333 * v33
          + 0x3333333333333333 * ((uint64_t)(v36 - (_QWORD)*v35) >> 3);
      v41 = (uint64_t *)&v28[v26 / 0x66];
      v42 = (__int128 *)v36;
      v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v28 ? 0 : 102 * ((end - (uint64_t)v28) >> 3) - 1;
      std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v41, v37);
      p_size->__value_ = v27 - v34;
      if (v38 - v26 - (v27 - v34) >= 0xCC)
      {
        do
        {
          operator delete(*(void **)(end - 8));
          v39 = p_attenuationSamplesWindow->__map_.__begin_;
          end = (uint64_t)(p_attenuationSamplesWindow->__map_.__end_ - 1);
          v40 = 102 * ((end - (uint64_t)v39) >> 3) - 1;
          p_attenuationSamplesWindow->__map_.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end;
          if (($8EF4127CF77ECA3DDB612FCF233DC3A8 **)end == v39)
            v40 = 0;
        }
        while (v40 - (p_attenuationSamplesWindow->__size_.__value_ + p_attenuationSamplesWindow->__start_) > 0xCB);
      }
    }
  }
}

- (void).cxx_destruct
{
  std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&self->_attenuationSamplesWindow.__map_.__first_);
  objc_storeStrong((id *)&self->_attenuationEngine, 0);
  objc_storeStrong((id *)&self->_attenuationProvider, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  return self;
}

@end

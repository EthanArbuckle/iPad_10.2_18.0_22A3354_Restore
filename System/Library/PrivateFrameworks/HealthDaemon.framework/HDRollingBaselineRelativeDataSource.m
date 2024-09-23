@implementation HDRollingBaselineRelativeDataSource

- (HDRollingBaselineRelativeDataSource)initWithProfile:(id)a3 quantityType:(id)a4 configuration:(id)a5 queryPrefetchWindow:(double)a6 currentDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDRollingBaselineRelativeDataSource *v16;
  HDRollingBaselineRelativeDataSource *v17;
  HDRollingBaselineRelativeQuantityCalculator *v18;
  HDRollingBaselineRelativeQuantityCalculator *baselineCalculator;
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *v20;
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *canonicalSourceMap;
  unint64_t value;
  uint64_t i;
  void **v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDRollingBaselineRelativeDataSource;
  v16 = -[HDRollingBaselineRelativeDataSource init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v12);
    objc_storeStrong((id *)&v17->_quantityType, a4);
    v18 = -[HDRollingBaselineRelativeQuantityCalculator initWithConfiguration:]([HDRollingBaselineRelativeQuantityCalculator alloc], "initWithConfiguration:", v14);
    baselineCalculator = v17->_baselineCalculator;
    v17->_baselineCalculator = v18;

    v20 = -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap initWithProfile:quantityType:]([_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap alloc], "initWithProfile:quantityType:", v12, v13);
    canonicalSourceMap = v17->_canonicalSourceMap;
    v17->_canonicalSourceMap = v20;

    v17->_queryPrefetchWindow = a6;
    objc_storeStrong((id *)&v17->_currentDate, a7);
    if (v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_)
    {
      std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node((id *)v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_);
      v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_ = 0;
      value = v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (i = 0; i != value; ++i)
          v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_ = 0;
    }
    v24 = v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_ = 0;
    if (v24)
      operator delete(v24);
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p1_.__value_.__next_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p2_.__value_ = 0;
    v17->_prefetchedSamplesByBaselineCompatibilityID.__table_.__p3_.__value_ = 1.0;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node(0);
  }

  return v17;
}

- (id)computeRelativeValueForSample:(HDRawQuantitySample *)a3 error:(id *)a4
{
  void *v7;
  __int128 v8;
  _BOOL4 v9;
  HDRollingBaselineRelativeQuantityCalculator *baselineCalculator;
  double var0;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;

  -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap baselineCompatibilityIDForSourceID:](self->_canonicalSourceMap, "baselineCompatibilityIDForSourceID:", a3->var3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->var2;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v8;
  v22 = *(_QWORD *)&a3->var4;
  if (!-[HDRollingBaselineRelativeDataSource _primeBaselineCalculatorWithPriorSamplesForSample:baselineCompatibilityID:error:](self, "_primeBaselineCalculatorWithPriorSamplesForSample:baselineCompatibilityID:error:", v21, v7, a4))goto LABEL_10;
  v9 = -[HDRollingBaselineRelativeQuantityCalculator hasSufficientDataToBaselineSampleWithSourceID:](self->_baselineCalculator, "hasSufficientDataToBaselineSampleWithSourceID:", v7);
  baselineCalculator = self->_baselineCalculator;
  var0 = a3->var0;
  if (v9)
  {
    -[HDRollingBaselineRelativeQuantityCalculator baselineRelativeValueForSampleValue:sourceID:](baselineCalculator, "baselineRelativeValueForSampleValue:sourceID:", v7, var0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v12;
    goto LABEL_11;
  }
  -[HDRollingBaselineRelativeQuantityCalculator addSupplementarySampleValue:startTime:sourceID:](baselineCalculator, "addSupplementarySampleValue:startTime:sourceID:", v7, var0, a3->var1);
  if (-[HDRollingBaselineRelativeQuantityCalculator hasSufficientDataToBaselineSampleWithSourceID:](self->_baselineCalculator, "hasSufficientDataToBaselineSampleWithSourceID:", v7))
  {
    -[HDRollingBaselineRelativeQuantityCalculator baselineRelativeValueForSampleValue:sourceID:](self->_baselineCalculator, "baselineRelativeValueForSampleValue:sourceID:", v7, a3->var0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v14;
  v20 = *(_QWORD *)&a3->var4;
  if (!-[HDRollingBaselineRelativeDataSource _supplementCalculatorWithSubsequentSamplesForSample:baselineCompatibilityID:error:](self, "_supplementCalculatorWithSubsequentSamplesForSample:baselineCompatibilityID:error:", v19, v7, a4))
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (-[HDRollingBaselineRelativeQuantityCalculator hasSufficientDataToBaselineSampleWithSourceID:](self->_baselineCalculator, "hasSufficientDataToBaselineSampleWithSourceID:", v7))
  {
    -[HDRollingBaselineRelativeQuantityCalculator baselineRelativeValueForSampleValue:sourceID:](self->_baselineCalculator, "baselineRelativeValueForSampleValue:sourceID:", v7, a3->var0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v16 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v16;
  v18 = *(_QWORD *)&a3->var4;
  if (-[HDRollingBaselineRelativeDataSource _couldSampleEverResolveToDeterminateValue:](self, "_couldSampleEverResolveToDeterminateValue:", v17))
  {
    v13 = &unk_1E6DFEC40;
  }
  else
  {
    v13 = &unk_1E6DFEC50;
  }
LABEL_11:

  return v13;
}

- (BOOL)_primeBaselineCalculatorWithPriorSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t **v9;
  uint64_t *v10;
  void **v11;
  unint64_t v12;
  double *v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double var1;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id WeakRetained;
  __int128 v25;
  BOOL v26;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id v33;

  v8 = a4;
  v33 = v8;
  -[HDRollingBaselineRelativeQuantityCalculator pruneForNextSampleStartTime:sourceID:](self->_baselineCalculator, "pruneForNextSampleStartTime:sourceID:", v8, a3->var1);
  if (std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v33))
  {
    v9 = std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v33);
    if (!v9)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    while (1)
    {
      v10 = v9[8];
      if (!v10)
        break;
      v11 = (void **)v9[4];
      v12 = (unint64_t)v9[7];
      v13 = (double *)((char *)v11[v12 / 0x66] + 40 * (v12 % 0x66));
      v14 = v13[1];
      if (v14 >= a3->var1)
      {
        v26 = 1;
        goto LABEL_12;
      }
      v15 = v12 + 1;
      v9[7] = (uint64_t *)v15;
      v9[8] = (uint64_t *)((char *)v10 - 1);
      if (v15 >= 0xCC)
      {
        operator delete(*v11);
        ++v9[4];
        v9[7] = (uint64_t *)((char *)v9[7] - 102);
        v14 = v13[1];
      }
      -[HDRollingBaselineRelativeQuantityCalculator addNextSampleValue:startTime:sourceID:](self->_baselineCalculator, "addNextSampleValue:startTime:sourceID:", v8, *v13, v14);
    }
  }
  -[HDRollingBaselineRelativeQuantityCalculator mostRecentSampleStartTimeForSourceID:](self->_baselineCalculator, "mostRecentSampleStartTimeForSourceID:", v8);
  v17 = v16;
  var1 = a3->var1;
  -[HDRollingBaselineRelativeQuantityCalculator configuration](self->_baselineCalculator, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "maximumWindowDuration");
  v21 = var1 - v20;

  if (v17 >= v21)
    v21 = v17;
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", v21, a3->var1 + self->_queryPrefetchWindow);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRollingBaselineRelativeDataSource _predicateForSamplesStartingWithinDateInterval:sourceID:isIntervalStartDateInclusive:](self, "_predicateForSamplesStartingWithinDateInterval:sourceID:isIntervalStartDateInclusive:", v22, a3->var3, v21 != v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __119__HDRollingBaselineRelativeDataSource__primeBaselineCalculatorWithPriorSamplesForSample_baselineCompatibilityID_error___block_invoke;
  v28[3] = &unk_1E6D0C890;
  v25 = *(_OWORD *)&a3->var2;
  v30 = *(_OWORD *)&a3->var0;
  v31 = v25;
  v32 = *(_QWORD *)&a3->var4;
  v28[4] = self;
  v29 = v8;
  v26 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v23, WeakRetained, 0, a5, v28);

LABEL_12:
  return v26;
}

uint64_t __119__HDRollingBaselineRelativeDataSource__primeBaselineCalculatorWithPriorSamplesForSample_baselineCompatibilityID_error___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v12;
  uint64_t v16;
  uint64_t v17;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  void **v25;
  char *v26;
  unint64_t v27;
  _QWORD *v28;
  float v29;
  float v30;
  _BOOL8 v31;
  unint64_t v32;
  unint64_t v33;
  int8x8_t prime;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint8x8_t v40;
  unint64_t v41;
  uint8x8_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  char *v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  int64_t v83;
  char *v84;
  char *v85;
  uint64_t i;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  void *v116;
  unint64_t v117;
  void *v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  void *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  int64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;

  v16 = a1;
  v17 = *(_QWORD *)(a1 + 32);
  if (*(double *)(a1 + 56) <= a2)
  {
    v20 = objc_msgSend(*(id *)(a1 + 40), "hash");
    v21 = v20;
    v22 = *(_QWORD *)(v17 + 56);
    v159 = a9;
    v160 = v16;
    if (v22)
    {
      v23 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
      v23.i16[0] = vaddlv_u8(v23);
      v24 = v23.u32[0];
      if (v23.u32[0] > 1uLL)
      {
        v12 = v20;
        if (v20 >= v22)
          v12 = v20 % v22;
      }
      else
      {
        v12 = (v22 - 1) & v20;
      }
      v25 = *(void ***)(*(_QWORD *)(v17 + 48) + 8 * v12);
      if (v25)
      {
        v26 = (char *)*v25;
        if (*v25)
        {
          do
          {
            v27 = *((_QWORD *)v26 + 1);
            if (v27 == v21)
            {
              if ((std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>::operator()[abi:ne180100](*((void **)v26 + 2), *(void **)(v16 + 40)) & 1) != 0)
              {
                v103 = a12;
                goto LABEL_76;
              }
            }
            else
            {
              if (v24 > 1)
              {
                if (v27 >= v22)
                  v27 %= v22;
              }
              else
              {
                v27 &= v22 - 1;
              }
              if (v27 != v12)
                break;
            }
            v26 = *(char **)v26;
          }
          while (v26);
        }
      }
    }
    v28 = (_QWORD *)(v17 + 64);
    v26 = (char *)operator new(0x48uLL);
    *(_QWORD *)v26 = 0;
    *((_QWORD *)v26 + 1) = v21;
    *((_QWORD *)v26 + 2) = *(id *)(v16 + 40);
    *(_OWORD *)(v26 + 24) = 0u;
    *(_OWORD *)(v26 + 40) = 0u;
    *(_OWORD *)(v26 + 56) = 0u;
    v29 = (float)(unint64_t)(*(_QWORD *)(v17 + 72) + 1);
    v30 = *(float *)(v17 + 80);
    if (v22 && (float)(v30 * (float)v22) >= v29)
    {
LABEL_66:
      v47 = *(_QWORD *)(v17 + 48);
      v48 = *(_QWORD **)(v47 + 8 * v12);
      if (v48)
      {
        *(_QWORD *)v26 = *v48;
      }
      else
      {
        *(_QWORD *)v26 = *v28;
        *v28 = v26;
        *(_QWORD *)(v47 + 8 * v12) = v28;
        if (!*(_QWORD *)v26)
        {
LABEL_75:
          v103 = a12;
          ++*(_QWORD *)(v17 + 72);
LABEL_76:
          v50 = (char *)*((_QWORD *)v26 + 5);
          v51 = (char *)*((_QWORD *)v26 + 4);
          v52 = (v50 - v51) >> 3;
          if (v50 == v51)
            v53 = 0;
          else
            v53 = 102 * v52 - 1;
          v55 = *((_QWORD *)v26 + 7);
          v54 = *((_QWORD *)v26 + 8);
          v56 = v54 + v55;
          if (v53 != v54 + v55)
          {
            a12 = v103;
            v16 = v160;
LABEL_149:
            v117 = *(_QWORD *)&v51[8 * (v56 / 0x66)] + 40 * (v56 % 0x66);
            *(double *)v117 = a4;
            *(double *)(v117 + 8) = a2;
            *(double *)(v117 + 16) = a3;
            *(_QWORD *)(v117 + 24) = v159;
            *(_WORD *)(v117 + 32) = 1;
            *((_QWORD *)v26 + 8) = v54 + 1;
            return objc_msgSend(*(id *)(v16 + 32), "_shouldContinueWithError:", a12);
          }
          if (v55 >= 0x66)
          {
            *((_QWORD *)v26 + 7) = v55 - 102;
            v59 = *(_QWORD *)v51;
            v57 = v51 + 8;
            v58 = v59;
            *((_QWORD *)v26 + 4) = v57;
            if (v50 == *((char **)v26 + 6))
            {
              v74 = *((_QWORD *)v26 + 3);
              v75 = (uint64_t)&v57[-v74];
              a12 = v103;
              if ((unint64_t)v57 <= v74)
              {
                v105 = (uint64_t)&v50[-v74];
                v95 = v105 == 0;
                v106 = v105 >> 2;
                if (v95)
                  v107 = 1;
                else
                  v107 = v106;
                v108 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v107);
                v110 = &v108[8 * (v107 >> 2)];
                v111 = (uint64_t *)*((_QWORD *)v26 + 4);
                v50 = v110;
                v112 = *((_QWORD *)v26 + 5) - (_QWORD)v111;
                v16 = v160;
                if (v112)
                {
                  v50 = &v110[v112 & 0xFFFFFFFFFFFFFFF8];
                  v113 = 8 * (v112 >> 3);
                  v114 = &v108[8 * (v107 >> 2)];
                  do
                  {
                    v115 = *v111++;
                    *(_QWORD *)v114 = v115;
                    v114 += 8;
                    v113 -= 8;
                  }
                  while (v113);
                }
                v116 = (void *)*((_QWORD *)v26 + 3);
                *((_QWORD *)v26 + 3) = v108;
                *((_QWORD *)v26 + 4) = v110;
                *((_QWORD *)v26 + 5) = v50;
                *((_QWORD *)v26 + 6) = &v108[8 * v109];
                if (v116)
                {
                  operator delete(v116);
                  v50 = (char *)*((_QWORD *)v26 + 5);
                }
              }
              else
              {
                v76 = v75 >> 3;
                v77 = v75 >> 3 < -1;
                v78 = (v75 >> 3) + 2;
                if (v77)
                  v79 = v78;
                else
                  v79 = v76 + 1;
                v80 = -(v79 >> 1);
                v81 = v79 >> 1;
                v82 = &v57[-8 * v81];
                v83 = v50 - v57;
                v16 = v160;
                if (v50 != v57)
                {
                  memmove(&v57[-8 * v81], v57, v50 - v57);
                  v50 = (char *)*((_QWORD *)v26 + 4);
                }
                v84 = &v50[8 * v80];
                v50 = &v82[v83];
                *((_QWORD *)v26 + 4) = v84;
                *((_QWORD *)v26 + 5) = &v82[v83];
              }
            }
            else
            {
              a12 = v103;
              v16 = v160;
            }
            *(_QWORD *)v50 = v58;
            goto LABEL_147;
          }
          v60 = (char *)*((_QWORD *)v26 + 6);
          v61 = (char *)*((_QWORD *)v26 + 3);
          if (v52 < (v60 - v61) >> 3)
          {
            v62 = operator new(0xFF0uLL);
            v63 = v62;
            if (v60 != v50)
            {
              *(_QWORD *)v50 = v62;
              *((_QWORD *)v26 + 5) += 8;
              a12 = v103;
              v16 = v160;
LABEL_148:
              v54 = *((_QWORD *)v26 + 8);
              v51 = (char *)*((_QWORD *)v26 + 4);
              v56 = *((_QWORD *)v26 + 7) + v54;
              goto LABEL_149;
            }
            a12 = v103;
            if (v51 == v61)
            {
              if (v50 == v51)
                v124 = 1;
              else
                v124 = (v60 - v51) >> 2;
              v125 = 2 * v124;
              v126 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v124);
              v51 = &v126[(v125 + 6) & 0xFFFFFFFFFFFFFFF8];
              v128 = (uint64_t *)*((_QWORD *)v26 + 4);
              v129 = v51;
              v130 = *((_QWORD *)v26 + 5) - (_QWORD)v128;
              v16 = v160;
              if (v130)
              {
                v129 = &v51[v130 & 0xFFFFFFFFFFFFFFF8];
                v131 = 8 * (v130 >> 3);
                v132 = &v126[(v125 + 6) & 0xFFFFFFFFFFFFFFF8];
                do
                {
                  v133 = *v128++;
                  *(_QWORD *)v132 = v133;
                  v132 += 8;
                  v131 -= 8;
                }
                while (v131);
              }
              v134 = (void *)*((_QWORD *)v26 + 3);
              *((_QWORD *)v26 + 3) = v126;
              *((_QWORD *)v26 + 4) = v51;
              *((_QWORD *)v26 + 5) = v129;
              *((_QWORD *)v26 + 6) = &v126[8 * v127];
              if (v134)
              {
                operator delete(v134);
                v51 = (char *)*((_QWORD *)v26 + 4);
              }
            }
            else
            {
              v16 = v160;
            }
            *((_QWORD *)v51 - 1) = v63;
            v135 = (char *)*((_QWORD *)v26 + 4);
            v136 = (char *)*((_QWORD *)v26 + 5);
            *((_QWORD *)v26 + 4) = v135 - 8;
            v137 = *((_QWORD *)v135 - 1);
            *((_QWORD *)v26 + 4) = v135;
            if (v136 == *((char **)v26 + 6))
            {
              v138 = *((_QWORD *)v26 + 3);
              v139 = (uint64_t)&v135[-v138];
              if ((unint64_t)v135 <= v138)
              {
                v147 = (uint64_t)&v136[-v138];
                v95 = v147 == 0;
                v148 = v147 >> 2;
                if (v95)
                  v149 = 1;
                else
                  v149 = v148;
                v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v149);
                v152 = &v150[8 * (v149 >> 2)];
                v153 = (uint64_t *)*((_QWORD *)v26 + 4);
                v136 = v152;
                v154 = *((_QWORD *)v26 + 5) - (_QWORD)v153;
                if (v154)
                {
                  v136 = &v152[v154 & 0xFFFFFFFFFFFFFFF8];
                  v155 = 8 * (v154 >> 3);
                  v156 = &v150[8 * (v149 >> 2)];
                  do
                  {
                    v157 = *v153++;
                    *(_QWORD *)v156 = v157;
                    v156 += 8;
                    v155 -= 8;
                  }
                  while (v155);
                }
                v158 = (void *)*((_QWORD *)v26 + 3);
                *((_QWORD *)v26 + 3) = v150;
                *((_QWORD *)v26 + 4) = v152;
                *((_QWORD *)v26 + 5) = v136;
                *((_QWORD *)v26 + 6) = &v150[8 * v151];
                if (v158)
                {
                  operator delete(v158);
                  v136 = (char *)*((_QWORD *)v26 + 5);
                }
              }
              else
              {
                v140 = v139 >> 3;
                v77 = v139 >> 3 < -1;
                v141 = (v139 >> 3) + 2;
                if (v77)
                  v142 = v141;
                else
                  v142 = v140 + 1;
                v143 = -(v142 >> 1);
                v144 = v142 >> 1;
                v145 = &v135[-8 * v144];
                v146 = v136 - v135;
                if (v136 != v135)
                {
                  memmove(&v135[-8 * v144], v135, v136 - v135);
                  v135 = (char *)*((_QWORD *)v26 + 4);
                }
                v136 = &v145[v146];
                *((_QWORD *)v26 + 4) = &v135[8 * v143];
                *((_QWORD *)v26 + 5) = &v145[v146];
              }
            }
            *(_QWORD *)v136 = v137;
LABEL_147:
            *((_QWORD *)v26 + 5) += 8;
            goto LABEL_148;
          }
          if (v60 == v61)
            v64 = 1;
          else
            v64 = (v60 - v61) >> 2;
          v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v64);
          v67 = v66;
          v68 = operator new(0xFF0uLL);
          v69 = &v65[8 * v52];
          v70 = &v65[8 * v67];
          if (v52 == v67)
          {
            v71 = 8 * v52;
            a12 = v103;
            if (v50 - v51 < 1)
            {
              v119 = v68;
              v120 = v71 >> 2;
              if (v50 == v51)
                v121 = 1;
              else
                v121 = v120;
              v16 = v160;
              v122 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v121);
              v69 = &v122[8 * (v121 >> 2)];
              v70 = &v122[8 * v123];
              if (v65)
                operator delete(v65);
              v65 = v122;
              v68 = v119;
              goto LABEL_105;
            }
            v72 = v71 >> 3;
            if (v72 >= -1)
              v73 = v72 + 1;
            else
              v73 = v72 + 2;
            v69 -= 8 * (v73 >> 1);
          }
          else
          {
            a12 = v103;
          }
          v16 = v160;
LABEL_105:
          *(_QWORD *)v69 = v68;
          v85 = v69 + 8;
          for (i = *((_QWORD *)v26 + 5); i != *((_QWORD *)v26 + 4); i -= 8)
          {
            if (v69 == v65)
            {
              if (v85 >= v70)
              {
                if (v70 == v65)
                  v91 = 1;
                else
                  v91 = (v70 - v65) >> 2;
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v91);
                v94 = v92;
                v69 = &v92[(2 * v91 + 6) & 0xFFFFFFFFFFFFFFF8];
                v96 = v85 - v65;
                v95 = v85 == v65;
                v85 = v69;
                if (!v95)
                {
                  v85 = &v69[v96 & 0xFFFFFFFFFFFFFFF8];
                  v97 = 8 * (v96 >> 3);
                  v98 = v69;
                  v99 = (uint64_t *)v65;
                  do
                  {
                    v100 = *v99++;
                    *(_QWORD *)v98 = v100;
                    v98 += 8;
                    v97 -= 8;
                  }
                  while (v97);
                }
                v70 = &v92[8 * v93];
                if (v65)
                  operator delete(v65);
                v65 = v94;
              }
              else
              {
                v87 = (v70 - v85) >> 3;
                if (v87 >= -1)
                  v88 = v87 + 1;
                else
                  v88 = v87 + 2;
                v89 = v88 >> 1;
                v69 = &v65[8 * (v88 >> 1)];
                v90 = v65;
                if (v85 != v65)
                {
                  memmove(v69, v65, v85 - v65);
                  v90 = v85;
                }
                v85 = &v90[8 * v89];
              }
            }
            v101 = *(_QWORD *)(i - 8);
            *((_QWORD *)v69 - 1) = v101;
            v69 -= 8;
          }
          v102 = (void *)*((_QWORD *)v26 + 3);
          *((_QWORD *)v26 + 3) = v65;
          *((_QWORD *)v26 + 4) = v69;
          *((_QWORD *)v26 + 5) = v85;
          *((_QWORD *)v26 + 6) = v70;
          if (v102)
            operator delete(v102);
          goto LABEL_148;
        }
        v49 = *(_QWORD *)(*(_QWORD *)v26 + 8);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v49 >= v22)
            v49 %= v22;
        }
        else
        {
          v49 &= v22 - 1;
        }
        v48 = (_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * v49);
      }
      *v48 = v26;
      goto LABEL_75;
    }
    v31 = 1;
    if (v22 >= 3)
      v31 = (v22 & (v22 - 1)) != 0;
    v32 = v31 | (2 * v22);
    v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33)
      prime = (int8x8_t)v33;
    else
      prime = (int8x8_t)v32;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v22 = *(_QWORD *)(v17 + 56);
    if (*(_QWORD *)&prime > v22)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v22)
    {
      v41 = vcvtps_u32_f32((float)*(unint64_t *)(v17 + 72) / *(float *)(v17 + 80));
      if (v22 < 3 || (v42 = (uint8x8_t)vcnt_s8((int8x8_t)v22), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        v41 = std::__next_prime(v41);
      }
      else
      {
        v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2)
          v41 = v43;
      }
      if (*(_QWORD *)&prime <= v41)
        prime = (int8x8_t)v41;
      if (*(_QWORD *)&prime >= v22)
      {
        v22 = *(_QWORD *)(v17 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v35 = operator new(8 * *(_QWORD *)&prime);
          v36 = *(void **)(v17 + 48);
          *(_QWORD *)(v17 + 48) = v35;
          if (v36)
            operator delete(v36);
          v37 = 0;
          *(int8x8_t *)(v17 + 56) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * v37++) = 0;
          while (*(_QWORD *)&prime != v37);
          v38 = (_QWORD *)*v28;
          if (*v28)
          {
            v39 = v38[1];
            v40 = (uint8x8_t)vcnt_s8(prime);
            v40.i16[0] = vaddlv_u8(v40);
            if (v40.u32[0] > 1uLL)
            {
              if (v39 >= *(_QWORD *)&prime)
                v39 %= *(_QWORD *)&prime;
            }
            else
            {
              v39 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * v39) = v28;
            v44 = (_QWORD *)*v38;
            if (*v38)
            {
              do
              {
                v45 = v44[1];
                if (v40.u32[0] > 1uLL)
                {
                  if (v45 >= *(_QWORD *)&prime)
                    v45 %= *(_QWORD *)&prime;
                }
                else
                {
                  v45 &= *(_QWORD *)&prime - 1;
                }
                if (v45 != v39)
                {
                  v46 = *(_QWORD *)(v17 + 48);
                  if (!*(_QWORD *)(v46 + 8 * v45))
                  {
                    *(_QWORD *)(v46 + 8 * v45) = v38;
                    goto LABEL_57;
                  }
                  *v38 = *v44;
                  *v44 = **(_QWORD **)(*(_QWORD *)(v17 + 48) + 8 * v45);
                  **(_QWORD **)(*(_QWORD *)(v17 + 48) + 8 * v45) = v44;
                  v44 = v38;
                }
                v45 = v39;
LABEL_57:
                v38 = v44;
                v44 = (_QWORD *)*v44;
                v39 = v45;
              }
              while (v44);
            }
          }
          v22 = (unint64_t)prime;
          goto LABEL_61;
        }
        v104 = *(void **)(v17 + 48);
        *(_QWORD *)(v17 + 48) = 0;
        if (v104)
          operator delete(v104);
        v22 = 0;
        *(_QWORD *)(v17 + 56) = 0;
      }
    }
LABEL_61:
    if ((v22 & (v22 - 1)) != 0)
    {
      if (v21 >= v22)
        v12 = v21 % v22;
      else
        v12 = v21;
    }
    else
    {
      v12 = (v22 - 1) & v21;
    }
    goto LABEL_66;
  }
  objc_msgSend(*(id *)(v17 + 16), "addNextSampleValue:startTime:sourceID:", *(_QWORD *)(a1 + 40), a4, a5);
  return objc_msgSend(*(id *)(v16 + 32), "_shouldContinueWithError:", a12);
}

- (BOOL)_supplementCalculatorWithSubsequentSamplesForSample:(HDRawQuantitySample *)a3 baselineCompatibilityID:(id)a4 error:(id *)a5
{
  id v8;
  double var1;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t **v14;
  uint64_t **v15;
  uint64_t *v16;
  unint64_t i;
  double *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id WeakRetained;
  BOOL v25;
  BOOL v26;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  id v35;

  v8 = a4;
  v35 = v8;
  var1 = a3->var1;
  -[HDRollingBaselineRelativeQuantityCalculator configuration](self->_baselineCalculator, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maximumWindowDuration");
  v12 = v11;

  v13 = var1 + v12;
  if (std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v35))
  {
    v14 = std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(&self->_prefetchedSamplesByBaselineCompatibilityID.__table_.__bucket_list_.__ptr_.__value_, &v35);
    v15 = v14;
    if (!v14)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    v16 = v14[8];
    if (v16)
    {
      for (i = 0; (unint64_t)v16 > i; ++i)
      {
        v18 = (double *)(v15[4][((unint64_t)v15[7] + i) / 0x66] + 40 * (((unint64_t)v15[7] + i) % 0x66));
        v19 = v18[1];
        if (v19 > a3->var1)
        {
          if (v19 >= v13
            || (-[HDRollingBaselineRelativeQuantityCalculator addSupplementarySampleValue:startTime:sourceID:](self->_baselineCalculator, "addSupplementarySampleValue:startTime:sourceID:", v8, *v18), -[HDRollingBaselineRelativeQuantityCalculator hasSufficientDataToBaselineSampleWithSourceID:](self->_baselineCalculator, "hasSufficientDataToBaselineSampleWithSourceID:", v8)))
          {
            v26 = 1;
            goto LABEL_16;
          }
          v16 = v15[8];
        }
      }
    }
  }
  v20 = a3->var1;
  -[HDRollingBaselineRelativeQuantityCalculator mostRecentSupplementarySampleStartTimeForSourceID:](self->_baselineCalculator, "mostRecentSupplementarySampleStartTimeForSourceID:", v8);
  if (v20 >= v21)
    v21 = v20;
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", v21, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRollingBaselineRelativeDataSource _predicateForSamplesStartingWithinDateInterval:sourceID:isIntervalStartDateInclusive:](self, "_predicateForSamplesStartingWithinDateInterval:sourceID:isIntervalStartDateInclusive:", v22, a3->var3, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __121__HDRollingBaselineRelativeDataSource__supplementCalculatorWithSubsequentSamplesForSample_baselineCompatibilityID_error___block_invoke;
  v28[3] = &unk_1E6D0C8B8;
  v28[4] = self;
  v29 = v8;
  v30 = &v31;
  v25 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v23, WeakRetained, 0, a5, v28);

  v26 = v25 || *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

LABEL_16:
  return v26;
}

uint64_t __121__HDRollingBaselineRelativeDataSource__supplementCalculatorWithSubsequentSamplesForSample_baselineCompatibilityID_error___block_invoke(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addSupplementarySampleValue:startTime:sourceID:", *(_QWORD *)(a1 + 40), a4, a2);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasSufficientDataToBaselineSampleWithSourceID:", *(_QWORD *)(a1 + 40)))return objc_msgSend(*(id *)(a1 + 32), "_shouldContinueWithError:", a11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return 0;
}

- (BOOL)_shouldContinueWithError:(id *)a3
{
  uint64_t (**shouldContinueHandler)(id, id *);

  shouldContinueHandler = (uint64_t (**)(id, id *))self->_shouldContinueHandler;
  if (shouldContinueHandler)
    return shouldContinueHandler[2](shouldContinueHandler, a3);
  else
    return 1;
}

- (id)_predicateForSamplesStartingWithinDateInterval:(id)a3 sourceID:(int64_t)a4 isIntervalStartDateInclusive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v5 = a5;
  v19[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  HDSampleEntityPredicateForDataType(self->_quantityType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate(3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    HDSampleEntityPredicateForStartDate(6);
  else
    HDSampleEntityPredicateForStartDate(5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:](self->_canonicalSourceMap, "predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29840];
  v19[0] = v9;
  v19[1] = v11;
  v19[2] = v13;
  v19[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_couldSampleEverResolveToDeterminateValue:(HDRawQuantitySample *)a3
{
  HDRollingBaselineRelativeDataSource *v4;
  double v5;
  double v6;
  double var1;
  void *v8;
  double v9;

  v4 = self;
  -[NSDate timeIntervalSinceReferenceDate](self->_currentDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  var1 = a3->var1;
  -[HDRollingBaselineRelativeQuantityCalculator configuration](v4->_baselineCalculator, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumWindowDuration");
  LOBYTE(v4) = v6 - var1 <= v9;

  return (char)v4;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_destroyWeak((id *)&self->_profile);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::~__hash_table((uint64_t)&self->_prefetchedSamplesByBaselineCompatibilityID);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_canonicalSourceMap, 0);
  objc_storeStrong((id *)&self->_baselineCalculator, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end

@implementation HDQuantityDistributionCalculator

- (HDQuantityDistributionCalculator)initWithStartDate:(id)a3 endDate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 histogramBucketAnchor:(double)a7 histogramBucketSize:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDQuantityDistributionCalculator *v18;
  HDQuantityDistributionCalculator *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *i;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  uint64_t begin;
  uint64_t *p_histogramState;
  __compressed_pair<HistogramBucket *, std::allocator<HistogramBucket>> *p_end_cap;
  unint64_t v36;
  HistogramBucket *end;
  uint64_t v38;
  HistogramBucket *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  HistogramBucket *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  HistogramBucket *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  HDQuantityDistributionCalculator *v65;
  objc_super v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  __compressed_pair<HistogramBucket *, std::allocator<HistogramBucket>> *v71;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v66.receiver = self;
  v66.super_class = (Class)HDQuantityDistributionCalculator;
  v18 = -[HDQuantityDistributionCalculator init](&v66, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_40;
  v65 = v18;
  v20 = v14;
  v63 = v15;
  v21 = v15;
  v62 = v16;
  v22 = v16;
  v61 = v17;
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v22;
  v60 = v14;
  if ((objc_msgSend(v20, "hk_isBeforeDate:") & 1) != 0)
  {
    objc_msgSend(v23, "hk_negativeComponents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = v64; objc_msgSend(i, "hk_isAfterDate:", v20); i = (void *)v27)
    {
      objc_msgSend(v24, "dateByAddingComponents:toDate:options:", v25, i, 4);
      v27 = objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    for (i = v64; ; i = v25)
    {
      objc_msgSend(v24, "dateByAddingComponents:toDate:options:", v23, i, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "hk_isAfterDate:", v20) & 1) != 0)
        break;

    }
  }

  v28 = i;
  v29 = 0;
  v30 = 0;
  for (j = v28; objc_msgSend(j, "hk_isBeforeDate:", v21); j = (void *)v32)
  {
    objc_msgSend(v24, "dateByAddingComponents:toDate:options:", v23, j, 0);
    v32 = objc_claimAutoreleasedReturnValue();

    --v30;
    v29 -= 64;
  }
  p_histogramState = (uint64_t *)&v65->_histogramState;
  begin = (uint64_t)v65->_histogramState._dateBuckets.__begin_;
  p_end_cap = &v65->_histogramState._dateBuckets.__end_cap_;
  v36 = -v30;
  if (-v30 > (unint64_t)(((uint64_t)v65->_histogramState._dateBuckets.__end_cap_.__value_ - begin) >> 6))
  {
    if (v36 >> 58)
      goto LABEL_41;
    v58 = v65->_histogramState._dateBuckets.__begin_;
    end = v65->_histogramState._dateBuckets.__end_;
    v71 = &v65->_histogramState._dateBuckets.__end_cap_;
    v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HistogramBucket>>(v36);
    v68 = &v67[end - v58];
    v69 = v68;
    v70 = &v67[64 * v38];
    std::vector<HistogramBucket>::__swap_out_circular_buffer(p_histogramState, &v67);
    std::__split_buffer<HistogramBucket>::~__split_buffer((uint64_t)&v67);
    begin = *p_histogramState;
    p_end_cap = &v65->_histogramState._dateBuckets.__end_cap_;
    v36 = -v30;
  }
  v39 = v65->_histogramState._dateBuckets.__end_;
  v40 = ((uint64_t)v39 - begin) >> 6;
  if (v40 >= v36)
  {
    if (v40 > v36)
    {
      v47 = (HistogramBucket *)(begin - v29);
      while (v47 != v39)
      {
        v48 = (void *)*((_QWORD *)v39 - 3);
        if (v48)
        {
          *((_QWORD *)v39 - 2) = v48;
          operator delete(v48);
        }
        v39 = (HistogramBucket *)((char *)v39 - 64);
      }
      v65->_histogramState._dateBuckets.__end_ = v47;
    }
    goto LABEL_32;
  }
  if (-(uint64_t)(v40 + v30) > (unint64_t)((p_end_cap->__value_ - v39) >> 6))
  {
    if (!(v36 >> 58))
    {
      v41 = ((uint64_t)v39 - begin) >> 6;
      v42 = (uint64_t)p_end_cap->__value_ - begin;
      v43 = v42 >> 5;
      if (v42 >> 5 <= v36)
        v43 = v36;
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFC0)
        v44 = 0x3FFFFFFFFFFFFFFLL;
      else
        v44 = v43;
      v71 = p_end_cap;
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HistogramBucket>>(v44);
      v67 = v45;
      v68 = &v45[64 * v41];
      v70 = &v45[64 * v46];
      bzero(v68, -(v29 + (v41 << 6)));
      v69 = &v45[-v29];
      std::vector<HistogramBucket>::__swap_out_circular_buffer(p_histogramState, &v67);
      std::__split_buffer<HistogramBucket>::~__split_buffer((uint64_t)&v67);
      goto LABEL_32;
    }
LABEL_41:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  v49 = ((uint64_t)v39 - begin) >> 6;
  bzero(v65->_histogramState._dateBuckets.__end_, -(uint64_t)(v29 + (v40 << 6)));
  v65->_histogramState._dateBuckets.__end_ = (HistogramBucket *)((char *)v39 - v29 + -64 * v49);
LABEL_32:
  v50 = v28;

  v51 = 0;
  v52 = 0;
  v59 = v50;
  while (1)
  {
    v53 = v50;
    if (!objc_msgSend(v50, "hk_isBeforeDate:", v21, v58))
      break;
    objc_msgSend(v50, "timeIntervalSinceReferenceDate");
    v55 = *p_histogramState;
    if (v51)
      *(_QWORD *)(v55 + v52 - 56) = v54;
    *(_QWORD *)(v55 + v52) = v54;
    objc_msgSend(v24, "dateByAddingComponents:toDate:options:", v23, v50, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();

    v52 += 64;
    --v51;
  }
  if (v51)
  {
    objc_msgSend(v50, "timeIntervalSinceReferenceDate");
    *(_QWORD *)(*p_histogramState + v52 - 56) = v56;
  }

  v19 = v65;
  v65->_histogramState._histogramBucketAnchor = a7;
  v65->_histogramState._histogramBucketSize = a8;
  v14 = v60;
  v17 = v61;
  v16 = v62;
  v15 = v63;
LABEL_40:

  return v19;
}

- (void)addDataPoint:(double)a3 startTime:(double)a4 endTime:(double)a5
{
  HistogramBucket *begin;
  uint64_t v6;
  int64_t currentStartDateBucket;
  uint64_t v11;
  double *i;
  double v13;
  _BOOL4 v14;
  char *v16;
  char **v17;
  uint64_t *v18;
  char **v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char **v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  char *v75;
  uint64_t *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  BOOL v84;
  double v85;
  char *v86;
  uint64_t v87;
  int64x2_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v92;
  _QWORD v93[9];

  v93[7] = *MEMORY[0x1E0C80C00];
  begin = self->_histogramState._dateBuckets.__begin_;
  v6 = self->_histogramState._dateBuckets.__end_ - begin;
  currentStartDateBucket = self->_histogramState._currentStartDateBucket;
  if (currentStartDateBucket < v6 >> 6)
  {
    v11 = v6 >> 6;
    for (i = (double *)((char *)begin + 64 * currentStartDateBucket + 8); *i <= a4; i += 8)
    {
      self->_histogramState._currentStartDateBucket = ++currentStartDateBucket;
      if (v11 == currentStartDateBucket)
        return;
    }
    if (currentStartDateBucket < v11)
    {
      v13 = *(i - 1);
      if (v13 <= a4)
      {
        v14 = a4 == a5;
        if (v13 != a5)
          v14 = 0;
        if (v13 < a5 || v14)
        {
          v89 = v11 - 1;
          v88 = vdupq_lane_s64(*(uint64_t *)&a3, 0);
          while (1)
          {
            v92 = vcvtmd_s64_f64((a3 - self->_histogramState._histogramBucketAnchor) / self->_histogramState._histogramBucketSize);
            v16 = (char *)begin + 64 * currentStartDateBucket;
            v17 = (char **)(v16 + 40);
            v19 = (char **)(v16 + 48);
            v18 = (uint64_t *)*((_QWORD *)v16 + 6);
            if (v18 == *((uint64_t **)v16 + 5))
            {
              v23 = *((_QWORD *)v16 + 7);
              v22 = v16 + 56;
              if ((unint64_t)(v23 - (_QWORD)v18) > 0x1FF)
              {
                v24 = v17[1];
              }
              else
              {
                v24 = (char *)operator new(0x200uLL);
                *v17 = v24;
                *v19 = v24;
                *v22 = v24 + 512;
                if (v18)
                {
                  operator delete(v18);
                  v24 = *v19;
                }
              }
              v25 = 0;
              *((_QWORD *)begin + 8 * currentStartDateBucket + 4) = 32 - v92;
              v18 = (uint64_t *)v24;
              do
              {
                if ((unint64_t)v18 >= *v22)
                {
                  v26 = *v17;
                  v27 = ((char *)v18 - *v17) >> 3;
                  v28 = v27 + 1;
                  if ((unint64_t)(v27 + 1) >> 61)
                    goto LABEL_100;
                  v29 = *v22 - (_QWORD)v26;
                  if (v29 >> 2 > v28)
                    v28 = v29 >> 2;
                  v30 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
                  v31 = 0x1FFFFFFFFFFFFFFFLL;
                  if (!v30)
                    v31 = v28;
                  if (v31)
                  {
                    v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v31);
                    v18 = (uint64_t *)*v19;
                    v26 = *v17;
                  }
                  else
                  {
                    v32 = 0;
                  }
                  v33 = (char *)(v31 + 8 * v27);
                  *(_QWORD *)v33 = 0;
                  v34 = v33 + 8;
                  while (v18 != (uint64_t *)v26)
                  {
                    v35 = *--v18;
                    *((_QWORD *)v33 - 1) = v35;
                    v33 -= 8;
                  }
                  *v17 = v33;
                  *v19 = v34;
                  *v22 = v31 + 8 * v32;
                  if (v26)
                    operator delete(v26);
                  v18 = (uint64_t *)v34;
                }
                else
                {
                  *v18++ = 0;
                }
                *v19 = (char *)v18;
                ++v25;
              }
              while (v25 != 64);
              *((int64x2_t *)begin + 4 * currentStartDateBucket + 1) = v88;
            }
            else
            {
              v20 = *((double *)v16 + 2);
              v21 = *((double *)v16 + 3);
              if (v20 >= a3)
                v20 = a3;
              if (v21 < a3)
                v21 = a3;
              *((double *)v16 + 2) = v20;
              *((double *)v16 + 3) = v21;
            }
            v36 = (char *)begin + 64 * currentStartDateBucket;
            v37 = *((_QWORD *)v36 + 4) + v92;
            if (v37 < 0)
            {
              v58 = 16 - v37;
              v90 = v36 + 32;
              *((_QWORD *)v36 + 4) = 16 - v92;
              v59 = *v17;
              v93[0] = 0;
              v62 = *((_QWORD *)v36 + 7);
              v61 = (char **)(v36 + 56);
              v60 = v62;
              v63 = ((char *)v18 - v59) >> 3;
              if (16 - v37 > (unint64_t)((v62 - (uint64_t)v18) >> 3))
              {
                v87 = 16 - v37;
                v64 = v63 + v58;
                if ((v63 + v58) >> 61)
LABEL_100:
                  std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
                v65 = v60 - (_QWORD)v59;
                if (v65 >> 2 > v64)
                  v64 = v65 >> 2;
                if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF8)
                  v66 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v66 = v64;
                if (v66)
                {
                  v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v66);
                  v69 = v68;
                  v53 = *v17;
                  bzero(v67, 128 - 8 * v37);
                  v70 = &v67[8 * v69];
                  if (v53 != v59)
                  {
                    v71 = 0;
                    v72 = 16 - v37;
                    do
                    {
                      *(_QWORD *)&v67[v71 - 8] = *(_QWORD *)&v59[v71 - 8];
                      v71 -= 8;
                    }
                    while (&v59[v71] != v53);
                    v73 = &v67[v71];
LABEL_89:
                    v81 = &v67[8 * v72];
                    v82 = *v19 - v59;
                    if (*v19 != v59)
                    {
                      v83 = v70;
                      memmove(v81, v59, *v19 - v59);
                      v70 = v83;
                      v53 = *v17;
                    }
                    *v17 = v73;
                    *v19 = &v81[v82];
                    *v61 = v70;
                    if (!v53)
                      goto LABEL_93;
                    goto LABEL_92;
                  }
                  v53 = v59;
                  v73 = v67;
                }
                else
                {
                  bzero(0, 128 - 8 * v37);
                  v70 = 0;
                  v67 = 0;
                  v73 = 0;
                  v53 = v59;
                }
                v72 = v87;
                goto LABEL_89;
              }
              v74 = v58 - v63;
              if (v58 <= v63)
              {
                v75 = (char *)v18;
                v63 = 16 - v37;
LABEL_74:
                v76 = (uint64_t *)&v75[-8 * v58];
                v77 = v75;
                while (v76 < v18)
                {
                  v78 = *v76++;
                  *(_QWORD *)v77 = v78;
                  v77 += 8;
                }
                v79 = &v59[8 * v58];
                *v19 = v77;
                if (v75 != v79)
                  memmove(&v75[-8 * ((v75 - v79) >> 3)], v59, v75 - v79);
                v80 = v93[0];
                if (v59 > (char *)v93)
                  v80 = 0;
                do
                {
                  *(_QWORD *)v59 = v80;
                  v59 += 8;
                  --v63;
                }
                while (v63);
                goto LABEL_93;
              }
              bzero(v18, 128 - 8 * (v63 + v37));
              v75 = (char *)&v18[v74];
              *v19 = v75;
              if (v18 != (uint64_t *)v59)
              {
                v58 = 16 - v37;
                goto LABEL_74;
              }
            }
            else
            {
              v38 = *v17;
              v39 = (char *)v18 - *v17;
              if (v37 < (unint64_t)(v39 >> 3))
                goto LABEL_94;
              v90 = v36 + 32;
              v40 = v39 >> 3;
              v41 = v37 + 16;
              v42 = v37 + 16 - v40;
              v43 = (char *)begin + 64 * currentStartDateBucket;
              v46 = *((_QWORD *)v43 + 7);
              v45 = v43 + 56;
              v44 = v46;
              if (v42 > (v46 - (uint64_t)v18) >> 3)
              {
                v86 = v45;
                if ((unint64_t)v37 >= 0x1FFFFFFFFFFFFFF0)
                  goto LABEL_100;
                v47 = v44 - (_QWORD)v38;
                if (v47 >> 2 > v41)
                  v41 = v47 >> 2;
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
                  v48 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v48 = v41;
                v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v48);
                v51 = v50;
                v52 = *v19;
                v53 = *v17;
                v54 = &v49[8 * v40];
                bzero(v54, 8 * v42);
                v55 = v54;
                if (v52 == v53)
                {
                  v56 = v86;
                }
                else
                {
                  v56 = v86;
                  do
                  {
                    v57 = *((_QWORD *)v52 - 1);
                    v52 -= 8;
                    *((_QWORD *)v55 - 1) = v57;
                    v55 -= 8;
                  }
                  while (v52 != v53);
                }
                *v17 = v55;
                *v19 = &v54[8 * v42];
                *(_QWORD *)v56 = &v49[8 * v51];
                if (!v53)
                  goto LABEL_93;
LABEL_92:
                operator delete(v53);
                goto LABEL_93;
              }
              bzero(v18, 8 * v42);
              *v19 = (char *)&v18[v42];
            }
LABEL_93:
            v37 = *v90 + v92;
            v38 = *v17;
LABEL_94:
            ++*(_QWORD *)&v38[8 * v37];
            if (currentStartDateBucket != v89)
            {
              v84 = a4 == a5;
              ++currentStartDateBucket;
              begin = self->_histogramState._dateBuckets.__begin_;
              v85 = *((double *)begin + 8 * currentStartDateBucket);
              if (v85 != a5)
                v84 = 0;
              if (v85 < a5 || v84)
                continue;
            }
            return;
          }
        }
      }
    }
  }
}

- (id)quantityDistributionsWithUnit:(id)a3
{
  HistogramBucket *begin;
  unint64_t v5;
  double histogramBucketAnchor;
  double histogramBucketSize;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  HDQuantityDistributionCalculator *v31;
  HistogramBucket *end;
  id v33;
  void *v34;
  void *v35;
  void *v36;

  v33 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  begin = self->_histogramState._dateBuckets.__begin_;
  end = self->_histogramState._dateBuckets.__end_;
  if (begin != end)
  {
    v5 = 0x1E0C99000uLL;
    v31 = self;
    do
    {
      histogramBucketAnchor = self->_histogramState._histogramBucketAnchor;
      histogramBucketSize = self->_histogramState._histogramBucketSize;
      v8 = v33;
      v9 = v8;
      if (*((_QWORD *)begin + 6) == *((_QWORD *)begin + 5))
      {

        v22 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(v5 + 3432), "dateWithTimeIntervalSinceReferenceDate:", *(double *)begin);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 3432), "dateWithTimeIntervalSinceReferenceDate:", *((double *)begin + 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v9, *((double *)begin + 2));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v9, *((double *)begin + 3));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *((_QWORD *)begin + 5);
        v15 = (*((_QWORD *)begin + 6) - v14) >> 3;
        if (*((_QWORD *)begin + 6) == v14)
        {
LABEL_10:
          v16 = 0;
        }
        else
        {
          v16 = 0;
          if ((unint64_t)v15 <= 1)
            v17 = 1;
          else
            v17 = (*((_QWORD *)begin + 6) - v14) >> 3;
          while (!*(_QWORD *)(v14 + 8 * v16))
          {
            if (v17 == ++v16)
              goto LABEL_10;
          }
        }
        v35 = (void *)v10;
        v36 = v9;
        v18 = (((*((_QWORD *)begin + 6) - v14) >> 3) & ((*((_QWORD *)begin + 6) - v14) >> 63)) - 1;
        v19 = v14 - 8;
        while (1)
        {
          v20 = v15 - 1;
          if (v15 < 1)
            break;
          if (*(_QWORD *)(v19 + 8 * v15--))
            goto LABEL_17;
        }
        v20 = v18;
LABEL_17:
        v34 = (void *)v13;
        v23 = v20 & ~(v20 >> 63);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23 - v16 + 1);
        if (v23 >= v16)
        {
          v25 = v23 + 1;
          v26 = v16;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(*((_QWORD *)begin + 5) + 8 * v26));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v27);

            ++v26;
          }
          while (v25 != v26);
        }
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v36, histogramBucketAnchor + (double)(v16 - *((_QWORD *)begin + 4)) * histogramBucketSize);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7000]), "initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:", v35, v11, v28, v12, v34, 0, 0, v24);

        if (v22)
          objc_msgSend(v30, "addObject:", v22);
        self = v31;
        v5 = 0x1E0C99000;
      }

      begin = (HistogramBucket *)((char *)begin + 64);
    }
    while (begin != end);
  }

  return v30;
}

- (BOOL)validateDateSequenceForTesting:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  HistogramBucket *begin;
  double v16;

  v4 = a3;
  if (objc_msgSend(v4, "count") - 1 == (self->_histogramState._dateBuckets.__end_
                                       - self->_histogramState._dateBuckets.__begin_) >> 6)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v4, "count") - 1;
      v8 = v6 >= v7;
      if (v6 >= v7)
        break;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v10;

      objc_msgSend(v4, "objectAtIndexedSubscript:", v6 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      begin = self->_histogramState._dateBuckets.__begin_;
      if (*(double *)((char *)begin + v5) != v11)
        break;
      v16 = *(double *)((char *)begin + v5 + 8);
      v5 += 64;
      ++v6;
    }
    while (v16 == v14);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  HistogramBucket *begin;
  HistogramBucket *end;
  HistogramBucket *v5;
  void *v6;

  begin = self->_histogramState._dateBuckets.__begin_;
  if (begin)
  {
    end = self->_histogramState._dateBuckets.__end_;
    v5 = self->_histogramState._dateBuckets.__begin_;
    if (end != begin)
    {
      do
      {
        v6 = (void *)*((_QWORD *)end - 3);
        if (v6)
        {
          *((_QWORD *)end - 2) = v6;
          operator delete(v6);
        }
        end = (HistogramBucket *)((char *)end - 64);
      }
      while (end != begin);
      v5 = self->_histogramState._dateBuckets.__begin_;
    }
    self->_histogramState._dateBuckets.__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

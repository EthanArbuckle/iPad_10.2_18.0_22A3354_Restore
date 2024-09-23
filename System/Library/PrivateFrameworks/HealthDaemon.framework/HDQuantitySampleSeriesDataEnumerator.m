@implementation HDQuantitySampleSeriesDataEnumerator

- (HDQuantitySampleSeriesDataEnumerator)initWithTransaction:(id)a3 persistentID:(int64_t)a4 dataTypeCode:(int64_t)a5 UUIDBytes:(unsigned __int8)a6[16] startTime:(double)a7 endTime:(double)a8 count:(int64_t)a9 sourceID:(int64_t)a10 HFDKey:(int64_t)a11 bufferSize:(unint64_t)a12
{
  id v21;
  HDQuantitySampleSeriesDataEnumerator *v22;
  HDQuantitySampleSeriesDataEnumerator *v23;
  unint64_t start;
  void **begin;
  uint64_t end;
  void **v27;
  unint64_t v28;
  __compressed_pair<unsigned long, std::allocator<std::tuple<double, double, float>>> *p_size;
  unint64_t value;
  void **v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;
  uint64_t v41;
  NSError *fatalError;
  objc_super v44;
  _QWORD v45[2];

  v21 = a3;
  v44.receiver = self;
  v44.super_class = (Class)HDQuantitySampleSeriesDataEnumerator;
  v22 = -[HDQuantitySampleSeriesDataEnumerator init](&v44, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_transaction, a3);
    v23->_persistentID = a4;
    v23->_dataTypeCode = a5;
    uuid_copy(v23->_UUIDBytes, a6);
    v23->_startTime = a7;
    v23->_endTime = a8;
    v23->_count = a9;
    v23->_sourceID = a10;
    v23->_HFDKey = a11;
    v23->_bufferSize = a12;
    v23->_index = 0;
    v23->_previousEndTime = a7;
    *(_DWORD *)&v23->_hasFetchedData = 0;
    v23->_hasDuration = 0;
    start = v23->_data.__start_;
    begin = v23->_data.__map_.__begin_;
    end = (uint64_t)v23->_data.__map_.__end_;
    v27 = &begin[start / 0xAA];
    if ((void **)end == begin)
    {
      v28 = 0;
      v32 = 0;
      p_size = &v23->_data.__size_;
      value = v23->_data.__size_.__value_;
      v31 = &begin[(value + start) / 0xAA];
    }
    else
    {
      v28 = (unint64_t)*v27 + 24 * (start % 0xAA);
      p_size = &v23->_data.__size_;
      value = v23->_data.__size_.__value_;
      v31 = &begin[(value + start) / 0xAA];
      v32 = (unint64_t)*v31 + 24 * ((value + start) % 0xAA);
    }
    if (v28 != v32)
    {
      v33 = 170 * (v31 - v27) - 0x5555555555555555 * ((uint64_t)(v32 - (_QWORD)*v31) >> 3);
      v34 = *v27;
      v35 = (uint64_t)(v28 - (_QWORD)*v27) >> 3;
      v36 = v33 + 0x5555555555555555 * v35;
      if (v36 >= 1)
      {
        v37 = (uint64_t)v34 + 24 * (start % 0xAA);
        if ((void **)end == begin)
          v37 = 0;
        if (v28 == v37)
          v38 = 0;
        else
          v38 = 0xAAAAAAAAAAAAAAABLL * v35 + 0x5555555555555555 * ((v37 - (uint64_t)v34) >> 3);
        v45[0] = &begin[start / 0xAA];
        v45[1] = v37;
        if ((void **)end == begin)
          v39 = 0;
        else
          v39 = 170 * ((end - (uint64_t)begin) >> 3) - 1;
        std::__deque_iterator<std::tuple<double,double,float>,std::tuple<double,double,float>*,std::tuple<double,double,float>&,std::tuple<double,double,float>**,long,170l>::operator+=[abi:ne180100](v45, v38);
        p_size->__value_ = value - v36;
        if (v39 - start - (value - v36) >= 0x154)
        {
          do
          {
            operator delete(*(void **)(end - 8));
            v40 = v23->_data.__map_.__begin_;
            end = (uint64_t)(v23->_data.__map_.__end_ - 1);
            v41 = 170 * ((end - (uint64_t)v40) >> 3) - 1;
            v23->_data.__map_.__end_ = (void **)end;
            if ((void **)end == v40)
              v41 = 0;
          }
          while (v41 - (v23->_data.__size_.__value_ + v23->_data.__start_) > 0x153);
        }
      }
    }
    fatalError = v23->_fatalError;
    v23->_fatalError = 0;

  }
  return v23;
}

- (double)nextDatumTime
{
  double *p_previousEndTime;
  void *v6;

  if (!self->_hasFetchedData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesDataEnumerator.mm"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasFetchedData"));

  }
  if (-[HDQuantitySampleSeriesDataEnumerator done](self, "done") || self->_fatalError)
    return INFINITY;
  if (self->_hasDuration)
    p_previousEndTime = (double *)((char *)self->_data.__map_.__begin_[self->_data.__start_ / 0xAA]
                                 + 24 * (self->_data.__start_ % 0xAA));
  else
    p_previousEndTime = &self->_previousEndTime;
  return *p_previousEndTime;
}

- (BOOL)primeEnumeratorWithError:(id *)a3
{
  BOOL v3;
  id v6;
  void *v7;
  NSError *v8;
  NSError *fatalError;
  id v10;
  id v12;

  if (self->_hasFetchedData)
    return 1;
  if (self->_fatalError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 3, CFSTR("This enumerator has experienced a fatal error"));
    return 0;
  }
  else
  {
    v12 = 0;
    v3 = -[HDQuantitySampleSeriesDataEnumerator _fillValueBufferWithError:]((uint64_t)self, (uint64_t)&v12);
    v6 = v12;
    v7 = v6;
    if (v3)
    {
      if (self->_data.__size_.__value_)
        self->_hasDuration = *((float *)self->_data.__map_.__begin_[self->_data.__start_ / 0xAA]
                             + 6 * (self->_data.__start_ % 0xAA)
                             + 4) != -1.0;
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Enumerator experienced fatal error while filling value buffer"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = (NSError *)objc_msgSend(v7, "copy");
      fatalError = self->_fatalError;
      self->_fatalError = v8;

      v10 = v7;
      v7 = v10;
      if (v10)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

    }
  }
  return v3;
}

- (BOOL)_fillValueBufferWithError:(uint64_t)a1
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(*(id *)(a1 + 8), "protectedDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[HDQuantitySampleSeriesEntity _hasSeriesDataWithDatabase:hfdKey:error:](HDQuantitySampleSeriesEntity, "_hasSeriesDataWithDatabase:hfdKey:error:", v4, *(_QWORD *)(a1 + 168), a2);

    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 168);
      if (*(_BYTE *)(a1 + 75))
        v7 = 2;
      else
        v7 = 1;
      *(_QWORD *)(a1 + 192) = v7;
      *(_QWORD *)(a1 + 200) = v6;
      *(_BYTE *)(a1 + 74) = 1;
      goto LABEL_8;
    }
    return 0;
  }
LABEL_8:
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HDQuantitySampleSeriesDataEnumerator__fillValueBufferFromSQLiteWithError___block_invoke;
  v13[3] = &unk_1E6CFD9D0;
  v13[4] = a1;
  v13[5] = &v14;
  v8 = _Block_copy(v13);
  v9 = *(_QWORD *)(a1 + 168);
  if (*(_BYTE *)(a1 + 72))
    v10 = +[HDQuantitySeriesDataEntity enumerateSeries:after:inclusive:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:after:inclusive:transaction:error:handler:", v9, 0, *(_QWORD *)(a1 + 8), a2, v8, *(double *)(a1 + 176));
  else
    v10 = +[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", v9, *(_QWORD *)(a1 + 8), a2, v8);
  v11 = v10;
  if (v10 && !*((_BYTE *)v15 + 24))
    *(_BYTE *)(a1 + 73) = 1;

  _Block_object_dispose(&v14, 8);
  *(_BYTE *)(a1 + 72) = 1;
  return v11;
}

- (BOOL)enumerateDataToTime:(double)a3 error:(id *)a4 handler:(id)a5
{
  uint64_t (**v9)(id, int64_t, double, double, double);
  BOOL v10;
  double v12;
  _BOOL4 hasFetchedAllData;
  int v14;
  BOOL v15;
  id v16;
  void *v17;
  void **begin;
  unint64_t start;
  void **v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double previousEndTime;
  double v26;
  int64x2_t v27;
  char v28;
  double v29;
  unint64_t v30;
  NSError *v31;
  NSError *fatalError;
  id v33;
  void *v34;
  void *v35;
  id v36;

  v9 = (uint64_t (**)(id, int64_t, double, double, double))a5;
  if (!self->_hasFetchedData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesDataEnumerator.mm"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasFetchedData"));

  }
  if (self->_fatalError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a4, 3, CFSTR("This enumerator has experienced a fatal error"));
    goto LABEL_7;
  }
  if (-[HDQuantitySampleSeriesDataEnumerator done](self, "done"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("This enumerator is already done"));
    goto LABEL_7;
  }
  -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](self, "nextDatumTime");
  if (v12 > a3)
  {
LABEL_10:
    v10 = 1;
    goto LABEL_8;
  }
  hasFetchedAllData = self->_hasFetchedAllData;
  while (hasFetchedAllData)
  {
    v14 = 1;
LABEL_18:
    begin = self->_data.__map_.__begin_;
    if (self->_data.__map_.__end_ != begin)
    {
      start = self->_data.__start_;
      v20 = &begin[start / 0xAA];
      v21 = (unint64_t)*v20 + 24 * (start % 0xAA);
      v22 = (unint64_t)begin[(self->_data.__size_.__value_ + start) / 0xAA]
          + 24 * ((self->_data.__size_.__value_ + start) % 0xAA);
      while (v21 != v22)
      {
        v23 = *(double *)v21;
        if (self->_hasDuration)
        {
          v24 = v23 + *(float *)(v21 + 16);
          previousEndTime = *(double *)v21;
        }
        else
        {
          previousEndTime = self->_previousEndTime;
          v24 = *(double *)v21;
        }
        v26 = *(double *)(v21 + 8);
        v27 = vaddq_s64(*(int64x2_t *)&self->_data.__start_, (int64x2_t)xmmword_1B7F3A670);
        *(int64x2_t *)&self->_data.__start_ = v27;
        if (v27.i64[0] >= 0x154uLL)
        {
          operator delete(*self->_data.__map_.__begin_);
          ++self->_data.__map_.__begin_;
          self->_data.__start_ -= 170;
        }
        v28 = v9[2](v9, self->_index, previousEndTime, v24, v26);
        ++self->_index;
        self->_previousEndTime = v23;
        if ((v28 & 1) == 0)
          goto LABEL_10;
        -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](self, "nextDatumTime");
        if (v29 > a3)
          goto LABEL_10;
        hasFetchedAllData = self->_hasFetchedAllData;
        if (!self->_hasFetchedAllData && self->_data.__size_.__value_ < 2)
        {
          hasFetchedAllData = 0;
          break;
        }
        v21 += 24;
        if (v21 - (_QWORD)*v20 == 4080)
        {
          v30 = (unint64_t)v20[1];
          ++v20;
          v21 = v30;
        }
      }
    }
    v10 = 1;
    if (v14)
      goto LABEL_8;
  }
  if (self->_data.__size_.__value_ > 1)
  {
    hasFetchedAllData = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v36 = 0;
  v15 = -[HDQuantitySampleSeriesDataEnumerator _fillValueBufferWithError:]((uint64_t)self, (uint64_t)&v36);
  v16 = v36;
  v17 = v16;
  if (v15)
  {

    hasFetchedAllData = self->_hasFetchedAllData;
    v14 = hasFetchedAllData;
    goto LABEL_18;
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Enumerator experienced fatal error while filling value buffer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (NSError *)objc_msgSend(v17, "copy");
  fatalError = self->_fatalError;
  self->_fatalError = v31;

  v33 = v17;
  v34 = v33;
  if (v33)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v33);
    else
      _HKLogDroppedError();
  }

LABEL_7:
  v10 = 0;
LABEL_8:

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  void *v11;

  v5 = a3;
  if (!self->_hasFetchedData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesDataEnumerator.mm"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasFetchedData"));

  }
  -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](self, "nextDatumTime");
  v7 = v6;
  objc_msgSend(v5, "nextDatumTime");
  if (v7 >= v8)
  {
    if (v7 <= v8)
      v9 = HKCompareUUIDBytes();
    else
      v9 = 1;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (BOOL)done
{
  void *v5;

  if (!self->_hasFetchedData)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesDataEnumerator.mm"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasFetchedData"));

  }
  return self->_hasFetchedAllData && self->_data.__size_.__value_ == 0;
}

- (unsigned)UUIDBytesPtr
}

- (id)description
{
  void *v3;
  void *v4;
  HDDatabaseTransaction *transaction;
  int64_t persistentID;
  int64_t dataTypeCode;
  void *v8;
  int64_t sourceID;
  int64_t HFDKey;
  double startTime;
  double endTime;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;
  objc_super v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)HDQuantitySampleSeriesDataEnumerator;
  -[HDQuantitySampleSeriesDataEnumerator description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  persistentID = self->_persistentID;
  dataTypeCode = self->_dataTypeCode;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_UUIDBytes);
  sourceID = self->_sourceID;
  HFDKey = self->_HFDKey;
  startTime = self->_startTime;
  endTime = self->_endTime;
  -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](self, "nextDatumTime");
  v14 = v13;
  v15 = -[HDQuantitySampleSeriesDataEnumerator done](self, "done");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ transaction:%@ persistentID:%lld dataTypeCode:%ld UUID:%@ sourceID:%lld HFDKey:%lld startTime:%f endTime:%f nextDatumTime:%f done:%@>"), v4, transaction, persistentID, dataTypeCode, v8, sourceID, HFDKey, *(_QWORD *)&startTime, *(_QWORD *)&endTime, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __76__HDQuantitySampleSeriesDataEnumerator__fillValueBufferFromSQLiteWithError___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v6;
  float v7;
  uint64_t result;
  float v9;
  double v10;
  double v11;

  v6 = *(_QWORD *)(a1 + 32);
  v10 = a3;
  v11 = a2;
  v7 = a4;
  v9 = v7;
  if (v6)
  {
    std::deque<std::tuple<double,double,float>>::emplace_back<double &,double &,float &>((_QWORD *)(v6 + 24), &v11, &v10, &v9);
    if (*(_QWORD *)(v6 + 64) < *(_QWORD *)(v6 + 16))
      return 1;
    *(double *)(v6 + 176) = a2;
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)_unitTesting_addToBufferTimestamp:(double)a3 value:(double)a4 duration:(float)a5 isLastDatum:(BOOL)a6
{
  float v6;
  double v7;
  double v8;

  v8 = a3;
  v7 = a4;
  v6 = a5;
  self->_hasFetchedData = 1;
  if (a6)
    self->_hasFetchedAllData = 1;
  self->_lastFetchedDatumTime = a3;
  std::deque<std::tuple<double,double,float>>::emplace_back<double &,double &,float &>(&self->_data.__map_.__first_, &v8, &v7, &v6);
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)dataTypeCode
{
  return self->_dataTypeCode;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (int64_t)HFDKey
{
  return self->_HFDKey;
}

- (void).cxx_destruct
{
  void **begin;
  void **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void **v9;
  void **v10;
  void **first;

  objc_storeStrong((id *)&self->_fatalError, 0);
  begin = self->_data.__map_.__begin_;
  end = self->_data.__map_.__end_;
  self->_data.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_data.__map_.__end_;
      begin = self->_data.__map_.__begin_ + 1;
      self->_data.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 85;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 170;
LABEL_7:
    self->_data.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_data.__map_.__begin_;
    v9 = self->_data.__map_.__end_;
    if (v9 != v10)
      self->_data.__map_.__end_ = (void **)((char *)v9 + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_data.__map_.__first_;
  if (first)
    operator delete(first);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  return self;
}

@end

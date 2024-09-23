@implementation HDSortedSampleIterator

- (HDSortedSampleIterator)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HDSortedSampleIterator)initWithQueryDescriptor:(id)a3 includeDeletedObjects:(BOOL)a4 sortDescriptors:(id)a5 anchor:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8
{
  _BOOL4 includeDeletedObjects;
  id v15;
  id v16;
  id v17;
  id v18;
  HDSortedSampleIterator *v19;
  HDSortedSampleIterator *v20;
  uint64_t v21;
  HDQueryDescriptor *queryDescriptor;
  uint64_t v23;
  NSArray *sortDescriptors;
  uint64_t v25;
  HKSortedQueryAnchor *anchor;
  HKSample *value__2;
  HKDeletedObject *v28;
  NSError *lastError;
  _BYTE *begin;
  _BYTE *end;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *value;
  _BYTE *v41;
  _BYTE *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  objc_super v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *p_end_cap;

  includeDeletedObjects = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v54.receiver = self;
  v54.super_class = (Class)HDSortedSampleIterator;
  v19 = -[HDSortedSampleIterator init](&v54, sel_init);
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v15, "copy");
    queryDescriptor = v19->_queryDescriptor;
    v19->_queryDescriptor = (HDQueryDescriptor *)v21;

    if (includeDeletedObjects && objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("HDSortedSampleIterator.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("includeDeletedObjects == NO || (includeDeletedObjects && sortDescriptors.count == 0)"));

    }
    v19->_includeDeletedObjects = includeDeletedObjects;
    v23 = objc_msgSend(v16, "copy");
    sortDescriptors = v19->_sortDescriptors;
    v19->_sortDescriptors = (NSArray *)v23;

    v25 = objc_msgSend(v17, "copy");
    anchor = v19->_anchor;
    v19->_anchor = (HKSortedQueryAnchor *)v25;

    v19->_bufferSize = a7;
    objc_storeWeak((id *)&v19->_profile, v18);
    value__2 = v19->_currentSample.__base_.__value__2;
    v19->_currentSample.__base_.__value_ = 0;
    v19->_currentSample.__base_.__value__2 = 0;

    v28 = v19->_currentDeletedObject.__base_.__value__2;
    v19->_currentDeletedObject.__base_.__value_ = 0;
    v19->_currentDeletedObject.__base_.__value__2 = 0;

    lastError = v19->_lastError;
    v19->_lastError = 0;

    begin = v19->_sampleBuffer.__begin_;
    v20->_isComplete = 0;
    v20->_includeDeletedObjects = includeDeletedObjects;
    if (a7 > (unint64_t)(((char *)v20->_sampleBuffer.__end_cap_.__value_ - (char *)begin) >> 4))
    {
      if ((unint64_t)a7 >> 60)
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      end = v20->_sampleBuffer.__end_;
      p_end_cap = &v20->_sampleBuffer.__end_cap_;
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)&v20->_sampleBuffer.__end_cap_, a7);
      v35 = (char *)v20->_sampleBuffer.__begin_;
      v34 = (char *)v20->_sampleBuffer.__end_;
      v36 = &v32[end - begin];
      if (v34 != v35)
      {
        v36 = &v32[end - begin];
        v37 = (char *)v20->_sampleBuffer.__end_;
        do
        {
          v38 = *((_QWORD *)v37 - 2);
          v37 -= 16;
          *((_QWORD *)v36 - 2) = v38;
          v36 -= 16;
          v39 = *((_QWORD *)v37 + 1);
          *((_QWORD *)v37 + 1) = 0;
          *((_QWORD *)v36 + 1) = v39;
        }
        while (v37 != v35);
      }
      v20->_sampleBuffer.__begin_ = v36;
      v20->_sampleBuffer.__end_ = &v32[end - begin];
      value = v20->_sampleBuffer.__end_cap_.__value_;
      v20->_sampleBuffer.__end_cap_.__value_ = &v32[16 * v33];
      v57 = v34;
      v58 = value;
      v55 = v35;
      v56 = v35;
      std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v55);
      includeDeletedObjects = v20->_includeDeletedObjects;
    }
    if (includeDeletedObjects)
    {
      v41 = v20->_deletedObjectsBuffer.__begin_;
      if (a7 > (unint64_t)(((char *)v20->_deletedObjectsBuffer.__end_cap_.__value_ - (char *)v41) >> 4))
      {
        if ((unint64_t)a7 >> 60)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v42 = v20->_deletedObjectsBuffer.__end_;
        p_end_cap = &v20->_deletedObjectsBuffer.__end_cap_;
        v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)&v20->_deletedObjectsBuffer.__end_cap_, a7);
        v46 = (char *)v20->_deletedObjectsBuffer.__begin_;
        v45 = (char *)v20->_deletedObjectsBuffer.__end_;
        v47 = &v43[v42 - v41];
        if (v45 != v46)
        {
          v47 = &v43[v42 - v41];
          v48 = (char *)v20->_deletedObjectsBuffer.__end_;
          do
          {
            v49 = *((_QWORD *)v48 - 2);
            v48 -= 16;
            *((_QWORD *)v47 - 2) = v49;
            v47 -= 16;
            v50 = *((_QWORD *)v48 + 1);
            *((_QWORD *)v48 + 1) = 0;
            *((_QWORD *)v47 + 1) = v50;
          }
          while (v48 != v46);
        }
        v20->_deletedObjectsBuffer.__begin_ = v47;
        v20->_deletedObjectsBuffer.__end_ = &v43[v42 - v41];
        v51 = v20->_deletedObjectsBuffer.__end_cap_.__value_;
        v20->_deletedObjectsBuffer.__end_cap_.__value_ = &v43[16 * v44];
        v57 = v45;
        v58 = v51;
        v55 = v46;
        v56 = v46;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v55);
      }
    }
  }

  return v20;
}

- (BOOL)advanceWithError:(id *)a3
{
  _QWORD *end;
  _QWORD *begin;
  _QWORD *v8;
  _QWORD *v9;
  _BOOL4 includeDeletedObjects;
  id *v11;
  id *v12;
  id *v13;
  HDQueryDescriptor *queryDescriptor;
  NSArray *sortDescriptors;
  HKSortedQueryAnchor *anchor;
  _BOOL8 v17;
  int64_t bufferSize;
  id WeakRetained;
  id *v20;
  id *v21;
  id *v22;
  id *v23;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  if (!self)
    return 0;
  begin = self->_sampleBuffer.__begin_;
  end = self->_sampleBuffer.__end_;
  if (begin == end)
  {
    includeDeletedObjects = self->_includeDeletedObjects;
    if (!self->_includeDeletedObjects || self->_deletedObjectsBuffer.__begin_ == self->_deletedObjectsBuffer.__end_)
    {
      if (self->_isComplete)
        goto LABEL_23;
      v12 = (id *)self->_deletedObjectsBuffer.__begin_;
      v11 = (id *)self->_deletedObjectsBuffer.__end_;
      self->_sampleBuffer.__end_ = begin;
      if (v11 != v12)
      {
        do
        {
          v13 = v11 - 2;

          v11 = v13;
        }
        while (v13 != v12);
        includeDeletedObjects = self->_includeDeletedObjects;
      }
      self->_deletedObjectsBuffer.__end_ = v12;
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__29;
      v33 = __Block_byref_object_dispose__29;
      v34 = 0;
      queryDescriptor = self->_queryDescriptor;
      sortDescriptors = self->_sortDescriptors;
      anchor = self->_anchor;
      v17 = includeDeletedObjects;
      bufferSize = self->_bufferSize;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v28[1] = 3221225472;
      v28[2] = __64__HDSortedSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke;
      v28[3] = &unk_1E6CECEF0;
      v28[4] = self;
      v28[5] = &v29;
      v28[6] = &v35;
      v28[0] = MEMORY[0x1E0C809B0];
      +[_HDSortedSampleIteratorInternalPager getSamplesWithQueryDescriptor:sortDescriptors:anchor:limit:includeDeletedObjects:profile:resultsHandler:](_HDSortedSampleIteratorInternalPager, "getSamplesWithQueryDescriptor:sortDescriptors:anchor:limit:includeDeletedObjects:profile:resultsHandler:", queryDescriptor, sortDescriptors, anchor, bufferSize, v17, WeakRetained, v28);

      if (!*((_BYTE *)v36 + 24))
      {
        v25 = (id)v30[5];
        v26 = v25;
        if (v25)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v25);
          else
            _HKLogDroppedError();
        }

        goto LABEL_34;
      }
      if (self->_sampleBuffer.__begin_ == self->_sampleBuffer.__end_
        && (!self->_includeDeletedObjects || self->_deletedObjectsBuffer.__begin_ == self->_deletedObjectsBuffer.__end_)
        && self->_isComplete)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 900, CFSTR("Sorted sample iterator is exhausted"));
LABEL_34:
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(&v35, 8);
        return 0;
      }
      _Block_object_dispose(&v29, 8);

      _Block_object_dispose(&v35, 8);
      begin = self->_sampleBuffer.__begin_;
      end = self->_sampleBuffer.__end_;
    }
  }
  if (begin != end)
  {
    if (!self->_includeDeletedObjects)
      goto LABEL_19;
    v9 = self->_deletedObjectsBuffer.__begin_;
    v8 = self->_deletedObjectsBuffer.__end_;
LABEL_17:
    if (v9 != v8)
    {
      self->_currentDeletedObject.__base_.__value_ = *(v8 - 2);
      objc_storeStrong((id *)&self->_currentDeletedObject.__base_.__value__2, (id)*(v8 - 1));
      -[HDSortedSampleIterator setHead:]((uint64_t)self, self->_currentDeletedObject.__base_.__value__2);
      v20 = (id *)self->_deletedObjectsBuffer.__end_;
      v21 = v20 - 2;

      self->_deletedObjectsBuffer.__end_ = v21;
      return 1;
    }
LABEL_19:
    self->_currentSample.__base_.__value_ = *(end - 2);
    objc_storeStrong((id *)&self->_currentSample.__base_.__value__2, (id)*(end - 1));
    -[HDSortedSampleIterator setHead:]((uint64_t)self, self->_currentSample.__base_.__value__2);
    v22 = (id *)self->_sampleBuffer.__end_;
    v23 = v22 - 2;

    self->_sampleBuffer.__end_ = v23;
    return 1;
  }
  if (self->_includeDeletedObjects)
  {
    v9 = self->_deletedObjectsBuffer.__begin_;
    v8 = self->_deletedObjectsBuffer.__end_;
    if (v9 != v8)
      goto LABEL_17;
  }
  if (!self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSortedSampleIterator.mm"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isComplete"));

  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 900, CFSTR("Sorted sample iterator is exhausted"));
  return 0;
}

- (void)setHead:(uint64_t)a1
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(a1 + 160), a2);

}

void __64__HDSortedSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke(_QWORD *a1, char a2, _QWORD *a3, _QWORD *a4, void *a5, char a6, void *a7)
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  __int128 v32;
  uint64_t v33;
  void **v34;
  char v35;

  v14 = a5;
  v15 = a7;
  if ((a2 & 1) != 0)
  {
    v31 = a6;
    v18 = a3;
    v16 = *a3;
    v17 = v18[1];
    v33 = 0;
    v32 = 0uLL;
    v34 = (void **)&v32;
    v35 = 0;
    if (v17 != v16)
    {
      v30 = v14;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__vallocate[abi:ne180100](&v32, (v17 - v16) >> 4);
      v19 = 0;
      v20 = *((_QWORD *)&v32 + 1);
      do
      {
        v21 = *(_QWORD *)(v17 - 16);
        v17 -= 16;
        *(_QWORD *)(v20 + v19) = v21;
        *(_QWORD *)(v20 + v19 + 8) = *(id *)(v17 + 8);
        v19 += 16;
      }
      while (v17 != v16);
      *((_QWORD *)&v32 + 1) = v20 + v19;
      v14 = v30;
    }
    v22 = a1[4];
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v22 + 80));
    *(_OWORD *)(v22 + 80) = v32;
    *(_QWORD *)(v22 + 96) = v33;
    v33 = 0;
    v32 = 0uLL;
    v34 = (void **)&v32;
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v34);
    v25 = a4;
    v23 = *a4;
    v24 = v25[1];
    v33 = 0;
    v32 = 0uLL;
    v34 = (void **)&v32;
    v35 = 0;
    if (v24 != v23)
    {
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__vallocate[abi:ne180100](&v32, (v24 - v23) >> 4);
      v26 = 0;
      v27 = *((_QWORD *)&v32 + 1);
      do
      {
        v28 = *(_QWORD *)(v24 - 16);
        v24 -= 16;
        *(_QWORD *)(v27 + v26) = v28;
        *(_QWORD *)(v27 + v26 + 8) = *(id *)(v24 + 8);
        v26 += 16;
      }
      while (v24 != v23);
      *((_QWORD *)&v32 + 1) = v27 + v26;
    }
    v29 = a1[4];
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v29 + 104));
    *(_OWORD *)(v29 + 104) = v32;
    *(_QWORD *)(v29 + 120) = v33;
    v33 = 0;
    v32 = 0uLL;
    v34 = (void **)&v32;
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v34);
    objc_storeStrong((id *)(a1[4] + 32), a5);
    *(_BYTE *)(a1[4] + 72) = v31;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a7);
  }

}

- (id)object
{
  return self->_currentHead;
}

- (HKSample)sample
{
  HKSample *value__2;
  HKSample *v3;

  value__2 = self->_currentSample.__base_.__value__2;
  if (value__2)
    v3 = value__2;
  return value__2;
}

- (HKDeletedObject)deletedObject
{
  HKDeletedObject *value__2;
  HKDeletedObject *v3;

  value__2 = self->_currentDeletedObject.__base_.__value__2;
  if (value__2)
    v3 = value__2;
  return value__2;
}

- (int64_t)objectID
{
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  -[HDSortedSampleIterator object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = 128;
  if ((isKindOfClass & 1) != 0)
    v5 = 144;
  return *(int64_t *)((char *)&self->super.isa + v5);
}

- (HKSortedQueryAnchor)nextAnchor
{
  void *v3;
  NSArray *sortDescriptors;
  void *v5;
  HKSortedQueryAnchor *v6;

  if (self->_currentHead)
  {
    v3 = (void *)MEMORY[0x1E0CB6C10];
    sortDescriptors = self->_sortDescriptors;
    -[HDSortedSampleIterator sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedQueryAnchorWithSortDescriptors:followingSample:objectID:", sortDescriptors, v5, -[HDSortedSampleIterator objectID](self, "objectID"));
    v6 = (HKSortedQueryAnchor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_anchor;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  _BOOL8 isComplete;
  _BOOL8 includeDeletedObjects;
  void *v10;
  unint64_t v11;

  v3 = -[HDQueryDescriptor hash](self->_queryDescriptor, "hash");
  v4 = -[NSArray hash](self->_sortDescriptors, "hash");
  -[HDSortedSampleIterator sample](self, "sample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[HDSortedSampleIterator objectID](self, "objectID");
  isComplete = self->_isComplete;
  includeDeletedObjects = self->_includeDeletedObjects;
  -[HDSortedSampleIterator nextAnchor](self, "nextAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4 ^ v3 ^ v6 ^ v7 ^ isComplete ^ includeDeletedObjects ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HDSortedSampleIterator *v4;
  HDSortedSampleIterator *v5;
  HDQueryDescriptor *queryDescriptor;
  HDQueryDescriptor *v7;
  NSArray *sortDescriptors;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (HDSortedSampleIterator *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      queryDescriptor = self->_queryDescriptor;
      v7 = v5->_queryDescriptor;
      if (queryDescriptor != v7 && (!v7 || !-[HDQueryDescriptor isEqual:](queryDescriptor, "isEqual:")))
        goto LABEL_22;
      sortDescriptors = self->_sortDescriptors;
      v9 = v5->_sortDescriptors;
      if (sortDescriptors != v9 && (!v9 || !-[NSArray isEqual:](sortDescriptors, "isEqual:")))
        goto LABEL_22;
      -[HDSortedSampleIterator sample](self, "sample");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSortedSampleIterator sample](v5, "sample");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        -[HDSortedSampleIterator sample](v5, "sample");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v16 = 0;
          goto LABEL_26;
        }
        -[HDSortedSampleIterator sample](self, "sample");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSortedSampleIterator sample](v5, "sample");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
LABEL_22:
          v16 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      v17 = -[HDSortedSampleIterator objectID](self, "objectID");
      if (v17 != -[HDSortedSampleIterator objectID](v5, "objectID")
        || self->_isComplete != v5->_isComplete
        || self->_includeDeletedObjects != v5->_includeDeletedObjects)
      {
        goto LABEL_22;
      }
      -[HDSortedSampleIterator nextAnchor](self, "nextAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSortedSampleIterator nextAnchor](v5, "nextAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v16 = 1;
        v11 = v10;
      }
      else
      {
        -[HDSortedSampleIterator nextAnchor](v5, "nextAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[HDSortedSampleIterator nextAnchor](self, "nextAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDSortedSampleIterator nextAnchor](v5, "nextAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v19, "isEqual:", v20);

        }
        else
        {
          v16 = 0;
        }

      }
LABEL_26:

      goto LABEL_23;
    }
    v16 = 0;
  }
LABEL_24:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  HDQueryDescriptor *queryDescriptor;
  _BOOL8 includeDeletedObjects;
  NSArray *sortDescriptors;
  HKSortedQueryAnchor *anchor;
  int64_t bufferSize;
  id WeakRetained;
  uint64_t v11;
  HKSample *value__2;
  HKDeletedObject *v13;
  __int128 v15;
  uint64_t v16;
  void **v17;

  v4 = objc_alloc((Class)objc_opt_class());
  queryDescriptor = self->_queryDescriptor;
  includeDeletedObjects = self->_includeDeletedObjects;
  sortDescriptors = self->_sortDescriptors;
  anchor = self->_anchor;
  bufferSize = self->_bufferSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = objc_msgSend(v4, "initWithQueryDescriptor:includeDeletedObjects:sortDescriptors:anchor:bufferSize:profile:", queryDescriptor, includeDeletedObjects, sortDescriptors, anchor, bufferSize, WeakRetained);

  value__2 = self->_currentSample.__base_.__value__2;
  *(_QWORD *)(v11 + 128) = self->_currentSample.__base_.__value_;
  objc_storeStrong((id *)(v11 + 136), value__2);
  v13 = self->_currentDeletedObject.__base_.__value__2;
  *(_QWORD *)(v11 + 144) = self->_currentDeletedObject.__base_.__value_;
  objc_storeStrong((id *)(v11 + 152), v13);
  objc_storeStrong((id *)(v11 + 160), self->_currentHead);
  *(_BYTE *)(v11 + 72) = self->_isComplete;
  v15 = 0uLL;
  v16 = 0;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(&v15, (uint64_t *)self->_sampleBuffer.__begin_, (uint64_t *)self->_sampleBuffer.__end_, ((char *)self->_sampleBuffer.__end_ - (char *)self->_sampleBuffer.__begin_) >> 4);
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v11 + 80));
  *(_OWORD *)(v11 + 80) = v15;
  *(_QWORD *)(v11 + 96) = v16;
  v16 = 0;
  v15 = 0uLL;
  v17 = (void **)&v15;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);
  v15 = 0uLL;
  v16 = 0;
  std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(&v15, (uint64_t *)self->_deletedObjectsBuffer.__begin_, (uint64_t *)self->_deletedObjectsBuffer.__end_, ((char *)self->_deletedObjectsBuffer.__end_ - (char *)self->_deletedObjectsBuffer.__begin_) >> 4);
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v11 + 104));
  *(_OWORD *)(v11 + 104) = v15;
  *(_QWORD *)(v11 + 120) = v16;
  v16 = 0;
  v15 = 0uLL;
  v17 = (void **)&v15;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);
  *(_BYTE *)(v11 + 16) = self->_includeDeletedObjects;
  return (id)v11;
}

- (void).cxx_destruct
{
  void **p_begin;

  objc_storeStrong(&self->_currentHead, 0);

  p_begin = &self->_deletedObjectsBuffer.__begin_;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_sampleBuffer.__begin_;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

@end

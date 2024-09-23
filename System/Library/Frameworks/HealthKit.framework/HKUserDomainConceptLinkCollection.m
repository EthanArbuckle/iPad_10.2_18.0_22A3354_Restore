@implementation HKUserDomainConceptLinkCollection

- (HKUserDomainConceptLinkCollection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptLinkCollection)initWithLinkSetWrapper:(id)a3 epoch:(int64_t)a4
{
  id v7;
  HKUserDomainConceptLinkCollection *v8;
  HKUserDomainConceptLinkCollection *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLinkCollection;
  v8 = -[HKUserDomainConceptLinkCollection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_orderedSet, a3);
    v9->_epoch = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)_initWithLinks:(id)a3
{
  id v4;
  void *v5;
  HKLinkSetWrapper *v6;
  HKUserDomainConceptLinkCollection *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_wrappedUDCLinks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKLinkSetWrapper initWithLinks:]([HKLinkSetWrapper alloc], "initWithLinks:", v5);
  v7 = -[HKUserDomainConceptLinkCollection initWithLinkSetWrapper:epoch:](self, "initWithLinkSetWrapper:epoch:", v6, 0);

  return v7;
}

- (id)_copyWithLinkSetWrapper:(id)a3
{
  id v4;
  HKUserDomainConceptLinkCollection *v5;

  v4 = a3;
  v5 = -[HKUserDomainConceptLinkCollection initWithLinkSetWrapper:epoch:]([HKUserDomainConceptLinkCollection alloc], "initWithLinkSetWrapper:epoch:", v4, self->_epoch);

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t epoch;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  epoch = self->_epoch;
  -[HKUserDomainConceptLinkCollection links](self, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %ld %@>"), v4, epoch, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)links
{
  os_unfair_lock_s *p_lock;
  NSArray *lock_arrayRepresentation;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_arrayRepresentation = self->_lock_arrayRepresentation;
  if (!lock_arrayRepresentation)
  {
    -[HKLinkSetWrapper elements](self->_orderedSet, "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_map:", &__block_literal_global_51);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_lock_arrayRepresentation;
    self->_lock_arrayRepresentation = v6;

    lock_arrayRepresentation = self->_lock_arrayRepresentation;
  }
  v8 = lock_arrayRepresentation;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

HKUserDomainConceptLink *__42__HKUserDomainConceptLinkCollection_links__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKUserDomainConceptLink *v3;

  v2 = a2;
  v3 = -[HKUserDomainConceptLink initWithLinkStructWrapper:]([HKUserDomainConceptLink alloc], "initWithLinkStructWrapper:", v2);

  return v3;
}

- (int64_t)count
{
  return -[HKLinkSetWrapper count](self->_orderedSet, "count");
}

- (id)collectionByAppendingLink:(id)a3
{
  HKLinkSetWrapper *orderedSet;
  id v5;
  HKUserDomainConceptLinkStructWrapper *v6;
  void *v7;
  id v8;

  orderedSet = self->_orderedSet;
  v5 = a3;
  v6 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v5);

  -[HKLinkSetWrapper appendingElement:](orderedSet, "appendingElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v7);
  return v8;
}

- (id)collectionByAppendingLinks:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_194);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLinkSetWrapper appendingElements:](self->_orderedSet, "appendingElements:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v5);

  return v6;
}

HKUserDomainConceptLinkStructWrapper *__64__HKUserDomainConceptLinkCollection_collectionByAppendingLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKUserDomainConceptLinkStructWrapper *v3;

  v2 = a2;
  v3 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v2);

  return v3;
}

- (id)collectionByInsertingLink:(id)a3 atIndex:(unint64_t)a4
{
  HKLinkSetWrapper *orderedSet;
  id v8;
  HKLinkSetWrapper *v9;
  HKUserDomainConceptLinkStructWrapper *v10;
  void *v11;
  id v12;
  void *v14;

  orderedSet = self->_orderedSet;
  v8 = a3;
  if (-[HKLinkSetWrapper count](orderedSet, "count") < a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index <= _orderedSet.count"));

  }
  v9 = self->_orderedSet;
  v10 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v8);

  -[HKLinkSetWrapper insertingElement:index:](v9, "insertingElement:index:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v11);
  return v12;
}

- (id)collectionByMovingLinkFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  HKUserDomainConceptLinkCollection *v8;
  void *v9;
  void *v11;
  void *v12;

  if (-[HKLinkSetWrapper count](self->_orderedSet, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _orderedSet.count"));

  }
  if (-[HKLinkSetWrapper count](self->_orderedSet, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination < _orderedSet.count"));

  }
  if (a3 == a4)
  {
    v8 = self;
  }
  else
  {
    -[HKLinkSetWrapper movingElementFrom:to:](self->_orderedSet, "movingElementFrom:to:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v9);

  }
  return v8;
}

- (id)collectionByRemovingLinkAtIndex:(unint64_t)a3
{
  void *v6;
  id v7;
  void *v9;

  if (-[HKLinkSetWrapper count](self->_orderedSet, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _orderedSet.count"));

  }
  -[HKLinkSetWrapper removingAtIndex:](self->_orderedSet, "removingAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v6);

  return v7;
}

- (id)collectionByRemovingLinksWithTargetUUID:(id)a3
{
  void *v4;
  id v5;

  -[HKLinkSetWrapper removingLinksWithUUID:](self->_orderedSet, "removingLinksWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v4);

  return v5;
}

- (id)collectionByRemovingAllLinks
{
  void *v3;
  id v4;

  -[HKLinkSetWrapper removingAll](self->_orderedSet, "removingAll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v3);

  return v4;
}

- (id)collectionByReplacingLinkAtIndex:(unint64_t)a3 withLink:(id)a4
{
  HKLinkSetWrapper *orderedSet;
  id v8;
  HKLinkSetWrapper *v9;
  HKUserDomainConceptLinkStructWrapper *v10;
  void *v11;
  id v12;
  void *v14;

  orderedSet = self->_orderedSet;
  v8 = a4;
  if (-[HKLinkSetWrapper count](orderedSet, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _orderedSet.count"));

  }
  v9 = self->_orderedSet;
  v10 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v8);

  -[HKLinkSetWrapper replacingElementAt:withElement:](v9, "replacingElementAt:withElement:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v11);
  return v12;
}

- (id)collectionByRetargetingLinksWithUUID:(id)a3 withNewUUID:(id)a4
{
  id v6;
  id v7;
  HKUserDomainConceptLinkCollection *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqual:", v6))
  {
    v8 = self;
  }
  else
  {
    -[HKLinkSetWrapper retargetingLinksWithUUID:newUUID:](self->_orderedSet, "retargetingLinksWithUUID:newUUID:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v9);

  }
  return v8;
}

- (id)collectionBySwappingLinksAtIndex:(unint64_t)a3 otherIndex:(unint64_t)a4
{
  void *v8;
  id v9;
  void *v11;
  void *v12;

  if (-[HKLinkSetWrapper count](self->_orderedSet, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("idx1 < _orderedSet.count"));

  }
  if (-[HKLinkSetWrapper count](self->_orderedSet, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("idx2 < _orderedSet.count"));

  }
  -[HKLinkSetWrapper swappingElementsAt:andAt:](self->_orderedSet, "swappingElementsAt:andAt:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v8);

  return v9;
}

+ (id)collectionByMergingCollection:(id)a3 otherCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "collectionByMergingCollection:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (id)collectionByMergingCollection:(id)a3
{
  _QWORD *v4;
  int64_t epoch;
  int64_t v6;
  NSObject *v7;
  int64_t v8;
  int64_t v9;
  HKUserDomainConceptLinkCollection *v10;
  NSObject *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  HKUserDomainConceptLinkCollection *v15;
  int v17;
  HKUserDomainConceptLinkCollection *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  epoch = self->_epoch;
  v6 = v4[4];
  if (epoch > v6)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_epoch;
      v9 = v4[4];
      v17 = 138543874;
      v18 = self;
      v19 = 2048;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: returning self because epoch %ld is higher than other epoch %ld", (uint8_t *)&v17, 0x20u);
    }

    v10 = self;
LABEL_10:
    v15 = v10;
    goto LABEL_11;
  }
  if (epoch < v6)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v4[4];
      v13 = self->_epoch;
      v17 = 138543874;
      v18 = self;
      v19 = 2048;
      v20 = v12;
      v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: returning other because epoch %ld is higher than self epoch %ld", (uint8_t *)&v17, 0x20u);
    }

    v10 = v4;
    goto LABEL_10;
  }
  -[HKLinkSetWrapper mergingLinkSet:](self->_orderedSet, "mergingLinkSet:", v4[1]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v14);

LABEL_11:
  return v15;
}

- (id)collectionByMergingInLegacyArrayOfLinks:(id)a3
{
  void *v4;
  void *v5;
  HKUserDomainConceptLinkCollection *v6;
  HKUserDomainConceptLinkCollection *v7;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_210_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLinkSetWrapper mergingLegacyElementsArray:](self->_orderedSet, "mergingLegacyElementsArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self->_orderedSet))
    v6 = self;
  else
    v6 = -[HKUserDomainConceptLinkCollection _copyWithLinkSetWrapper:](self, "_copyWithLinkSetWrapper:", v5);
  v7 = v6;

  return v7;
}

HKUserDomainConceptLinkStructWrapper *__77__HKUserDomainConceptLinkCollection_collectionByMergingInLegacyArrayOfLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKUserDomainConceptLinkStructWrapper *v3;

  v2 = a2;
  v3 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v2);

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKUserDomainConceptLinkCollection links](self, "links");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptLinkCollection *v4;
  BOOL v5;

  v4 = (HKUserDomainConceptLinkCollection *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKLinkSetWrapper isEqual:](self->_orderedSet, "isEqual:", v4->_orderedSet);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKLinkSetWrapper *orderedSet;
  void *v7;
  id v8;
  NSObject *v9;
  HKLinkSetWrapper *v10;
  void *v11;
  NSObject *v12;
  HKUserDomainConceptLinkCollection *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  HKUserDomainConceptLinkCollection *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC7968]();
  orderedSet = self->_orderedSet;
  v17 = 0;
  -[HKLinkSetWrapper serializedDataWithError:](orderedSet, "serializedDataWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    if ((unint64_t)objc_msgSend(v7, "length") < 0x32000)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("links"));
      objc_msgSend(v4, "encodeInteger:forKey:", self->_epoch, CFSTR("epoch"));
      goto LABEL_10;
    }
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_opt_class();
      v15 = -[HKLinkSetWrapper count](self->_orderedSet, "count");
      v16 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 138544386;
      v19 = v14;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = v16;
      v26 = 2048;
      v27 = 204800;
      _os_log_fault_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_FAULT, "<%{public}@:%p %ld>: Dropping history because serialized data length %ld > %ld", buf, 0x34u);
    }

    v10 = [HKLinkSetWrapper alloc];
    -[HKLinkSetWrapper elements](self->_orderedSet, "elements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKLinkSetWrapper initWithLinks:](v10, "initWithLinks:", v11);

    v13 = -[HKUserDomainConceptLinkCollection initWithLinkSetWrapper:epoch:]([HKUserDomainConceptLinkCollection alloc], "initWithLinkSetWrapper:epoch:", v12, self->_epoch + 1);
    -[HKUserDomainConceptLinkCollection encodeWithCoder:](v13, "encodeWithCoder:", v4);

  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HKUserDomainConceptLinkCollection encodeWithCoder:].cold.1();
  }

LABEL_10:
  objc_autoreleasePoolPop(v5);

}

- (HKUserDomainConceptLinkCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  HKUserDomainConceptLinkCollection *v8;
  HKUserDomainConceptLinkCollection *v9;
  HKUserDomainConceptLinkCollection *v10;
  NSObject *v11;
  objc_super v13;
  id v14;

  v4 = a3;
  v14 = 0;
  -[HKUserDomainConceptLinkCollection _orderedSetWithDecoder:error:](self, "_orderedSetWithDecoder:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v5)
  {
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("epoch"));
    v13.receiver = self;
    v13.super_class = (Class)HKUserDomainConceptLinkCollection;
    v8 = -[HKUserDomainConceptLinkCollection init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_orderedSet, v5);
      v9->_epoch = v7;
      v9->_lock._os_unfair_lock_opaque = 0;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HKUserDomainConceptLinkCollection initWithCoder:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (id)_orderedSetWithDecoder:(id)a3 error:(id *)a4
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HKLinkSetWrapper *v13;
  HKLinkSetWrapper *v14;
  void *v15;
  void *v16;
  HKLinkSetWrapper *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0C99E60];
  v8 = a3;
  v9 = [v7 alloc];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v11, CFSTR("links"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = -[HKLinkSetWrapper initWithSerializedData:error:]([HKLinkSetWrapper alloc], "initWithSerializedData:error:", v12, a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = [HKLinkSetWrapper alloc];
      objc_msgSend((id)objc_opt_class(), "_wrappedUDCLinks:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKLinkSetWrapper initWithLinks:](v14, "initWithLinks:", v15);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [HKLinkSetWrapper alloc];
        objc_msgSend((id)objc_opt_class(), "_wrappedUDCLinks:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HKLinkSetWrapper initWithLinks:](v17, "initWithLinks:", v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLinkCollection.m"), 356, CFSTR("Unreachable code has been executed"));

        v13 = 0;
      }
    }
  }

  return v13;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HKUserDomainConceptLinkCollection links](self, "links");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

+ (id)_wrappedUDCLinks:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_221);
}

HKUserDomainConceptLinkStructWrapper *__54__HKUserDomainConceptLinkCollection__wrappedUDCLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKUserDomainConceptLinkStructWrapper *v3;

  v2 = a2;
  v3 = -[HKUserDomainConceptLinkStructWrapper initWithLink:]([HKUserDomainConceptLinkStructWrapper alloc], "initWithLink:", v2);

  return v3;
}

- (void)unitTesting_setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_arrayRepresentation, 0);
  objc_storeStrong((id *)&self->_orderedSet, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_opt_class();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v0, v1, "%{public}@: unable to encode %{public}@: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_8();
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_opt_class();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_10(&dword_19A0E6000, v0, v1, "%{public}@: unable to decode %{public}@: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_8();
}

@end

@implementation CKDistributedTimestampImmutableClockVector

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampImmutableClockVector)init
{
  CKDistributedTimestampImmutableClockVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampImmutableClockVector;
  v2 = -[CKDistributedTimestampImmutableClockVector init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);

  }
  return v2;
}

- (CKDistributedTimestampImmutableClockVector)initWithCoder:(id)a3
{
  id v4;
  CKDistributedTimestampImmutableClockVector *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CKDPDistributedTimestamps *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  CKDistributedTimestampImmutableClockVector *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDistributedTimestampImmutableClockVector;
  v5 = -[CKDistributedTimestampImmutableClockVector init](&v29, sel_init);
  if (!v5)
    goto LABEL_11;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("backingVectorProtobuf"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v22 = objc_opt_class();
    NSStringFromSelector(sel_backingVector);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setBackingState_(v5, v25, (uint64_t)v24, v26);

    goto LABEL_10;
  }
  v9 = [CKDPDistributedTimestamps alloc];
  v12 = (void *)objc_msgSend_initWithData_(v9, v10, (uint64_t)v8, v11);
  v28 = 0;
  objc_msgSend_attributedVectorFromPDistributedTimestamps_error_(CKDistributedTimestampAttributedVector, v13, (uint64_t)v12, (uint64_t)&v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  objc_msgSend__setBackingState_(v5, v16, (uint64_t)v14, v17);

  if (!v15)
  {
LABEL_10:

LABEL_11:
    v21 = v5;
    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v15;
    _os_log_error_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_ERROR, "Error initializing distributed timestamp vector from data in coder: %@", buf, 0xCu);
  }
  objc_msgSend_failWithError_(v4, v19, (uint64_t)v15, v20);

  v21 = 0;
LABEL_12:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pDistributedTimestampsFromAttributedVector_(CKDistributedTimestampAttributedVector, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_data(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v15, (uint64_t)CFSTR("backingVectorProtobuf"));

  objc_autoreleasePoolPop(v4);
}

- (void)_setBackingState:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);

}

- (void)__setBackingStateNoCopy:(id)a3
{
  objc_storeStrong((id *)&self->_backingVector, a3);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)mutableCopy
{
  return (id)((uint64_t (*)(CKDistributedTimestampImmutableClockVector *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKDistributedTimestampImmutableClockVector *v4;
  CKDistributedTimestampImmutableClockVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  char isEqual;

  v4 = (CKDistributedTimestampImmutableClockVector *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_backingVector(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v9);
      objc_msgSend_backingVector(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v13);
      objc_msgSend_backingVector(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_backingVector(v5, v18, v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v24)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_backingVector(self, v21, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_backingVector(v5, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);

      }
      objc_sync_exit(v13);

      objc_sync_exit(v9);
    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_backingVector(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)allSiteIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_backingVector(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)timestampCount
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_backingVector(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_timestampCount(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)timestampCountForSiteIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_timestampCountForSiteIdentifier_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)includesTimestamp:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_clockVector_includesTimestamp_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (unsigned)clockTypeForTimestamp:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_attributeForTimestamp_(v8, v9, (uint64_t)v4, v10);

  return BYTE1(v11);
}

- (int64_t)compareToVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int64_t v18;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_vectorExpansionState(self, v13, v14, v15);
  v18 = objc_msgSend_clockVector_compareToVector_withExpansionState_(v8, v17, (uint64_t)v12, v16);

  return v18;
}

- (BOOL)isGreaterThanOrEqualToVector:(id)a3
{
  uint64_t v3;

  return (unint64_t)objc_msgSend_compareToVector_(self, a2, (uint64_t)a3, v3) < 2;
}

- (BOOL)hasTimestampsNotInVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_vectorExpansionState(self, v13, v14, v15);
  LOBYTE(self) = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v8, v17, (uint64_t)v12, v16);

  return (char)self;
}

- (unsigned)vectorExpansionState
{
  return 0;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockValuesForSiteIdentifier_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a3;
  v6 = a4;
  objc_msgSend_backingVector(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A7F7C08;
  v14[3] = &unk_1E1F65F70;
  v11 = v6;
  v15 = v11;
  objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v10, v12, (uint64_t)v13, (uint64_t)v14);

}

- (void)enumerateAllClockValuesUsingBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7F7CD4;
  v12[3] = &unk_1E1F65F98;
  v11 = v4;
  v13 = v11;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v8, v9, (uint64_t)v12, v10);

}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredBySiteIdentifiers_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFilteredByModifier:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByModifier_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFilteredByClockType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_vectorFilteredByClockType_(v9, v10, v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v5, v13, (uint64_t)v12, v14);

  return v5;
}

- (id)vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;

  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_vectorExpansionState(self, v9, v10, v11);
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v8, v13, (uint64_t)v4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)clockVector
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_copy(self, a2, v2, v3);
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  BOOL v10;

  v5 = a3;
  objc_msgSend_backingVector(self, a2, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A7F8084;
  v9[3] = &unk_1E1F65FB8;
  v10 = a4;
  sub_18A7F5B7C(v6, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (CKDistributedTimestampAttributedVector)backingVector
{
  return self->_backingVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingVector, 0);
}

@end

@implementation CKQuery

- (CKQuery)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate
{
  NSString *v6;
  NSPredicate *v7;
  char v8;
  id v9;
  CKQuery *v10;
  const char *v11;
  uint64_t v12;
  CKQuery *v13;
  const char *v14;
  uint64_t v15;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  CKException *v29;
  const char *v30;
  id v31;
  objc_super v32;
  id v33;

  v6 = recordType;
  v7 = predicate;
  v33 = 0;
  v8 = _CKCheckArgument((uint64_t)"recordType", v6, 1, 1, 0, &v33);
  v9 = v33;
  if ((v8 & 1) == 0)
  {
    v17 = v9;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  if (!v7)
  {
    v29 = [CKException alloc];
    v31 = (id)objc_msgSend_initWithCode_format_(v29, v30, 12, (uint64_t)CFSTR("predicate can not be nil. Use [NSPredicate predicateWithFormat:@\"TRUEPREDICATE\"] to query for all records of a given type"));
    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)CKQuery;
  v10 = -[CKQuery init](&v32, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend__setRecordType_(v10, v11, (uint64_t)v6, v12);
    objc_msgSend__setPredicate_(v13, v14, (uint64_t)v7, v15);
  }

  return v13;
}

- (void)_setRecordType:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSString *recordType;
  CKException *v12;
  const char *v13;
  id v14;
  id v15;

  v15 = a3;
  if (!objc_msgSend_length(v15, v4, v5, v6))
  {
    v12 = [CKException alloc];
    v14 = (id)objc_msgSend_initWithName_format_(v12, v13, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Query must have a valid recordType"));
    objc_exception_throw(v14);
  }
  v10 = (NSString *)objc_msgSend_copy(v15, v7, v8, v9);
  recordType = self->_recordType;
  self->_recordType = v10;

}

- (void)_setPredicate:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *predicate;
  const char *v10;
  char v11;
  id v12;
  void *v13;
  NSPredicate *v14;
  CKException *v15;
  const char *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  if ((CKCurrentProcessLinkChecke0fc00bd437646efa0e6635c2beaaea9() & 1) != 0)
    goto LABEL_4;
  objc_msgSend_sharedValidator(CKPredicateValidator, v6, v7, v8);
  predicate = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v11 = objc_msgSend_validate_error_(predicate, v10, (uint64_t)v4, (uint64_t)&v18);
  v12 = v18;
  v13 = v12;
  if ((v11 & 1) != 0)
  {

LABEL_4:
    objc_msgSend_CKDeepCopy(v4, v6, v7, v8);
    v14 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    predicate = self->_predicate;
    self->_predicate = v14;
    goto LABEL_7;
  }
  if (CKShouldUseNewPredicateValidation())
  {
    v15 = [CKException alloc];
    v17 = (id)objc_msgSend_initWithCode_format_(v15, v16, 12, (uint64_t)CFSTR("Invalid predicate: %@ (%@)"), v4, v13);
    objc_exception_throw(v17);
  }

LABEL_7:
  objc_autoreleasePoolPop(v5);

}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  NSArray *v4;
  NSArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  CKQuery *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  CKException *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  id v24;
  CKException *v25;
  const char *v26;
  id v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = sortDescriptors;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [CKException alloc];
      v27 = (id)objc_msgSend_initWithCode_format_(v25, v26, 12, (uint64_t)CFSTR("sortDescriptors must be an array"));
      objc_exception_throw(v27);
    }
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v4;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = [CKException alloc];
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (id)objc_msgSend_initWithCode_format_(v16, v23, 12, (uint64_t)CFSTR("sortDescriptor items must be of class %@ or %@, not %@"), v18, v20, v22);

            objc_exception_throw(v24);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v10, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v7);
  }

  v11 = self;
  objc_sync_enter(v11);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_18A6EBDA8;
  v28[3] = &unk_1E1F61A20;
  v28[4] = v11;
  objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(v5, v12, (uint64_t)v28, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v11->_sortDescriptors;
  v11->_sortDescriptors = (NSArray *)v14;

  objc_sync_exit(v11);
}

- (NSArray)sortDescriptors
{
  CKQuery *v2;
  NSArray *sortDescriptors;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  v2 = self;
  objc_sync_enter(v2);
  sortDescriptors = v2->_sortDescriptors;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6EBDE8;
  v8[3] = &unk_1E1F61A20;
  v8[4] = v2;
  objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(sortDescriptors, v4, (uint64_t)v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (CKRecordType)recordType
{
  return (CKRecordType)objc_getProperty(self, a2, 24, 1);
}

- (NSPredicate)predicate
{
  uint64_t v2;
  uint64_t v3;

  return (NSPredicate *)objc_msgSend_CKDeepCopy(self->_predicate, a2, v2, v3);
}

- (CKQuery)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CKQuery *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  objc_super v29;

  v4 = aDecoder;
  v29.receiver = self;
  v29.super_class = (Class)CKQuery;
  v5 = -[CKQuery init](&v29, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    CKAcceptablePredicateValueClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v8, (uint64_t)v7, (uint64_t)CFSTR("predicateData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPredicate_(v5, v10, (uint64_t)v9, v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v16, v13, v17, v14, v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("sortDescriptorsData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSortDescriptors_(v5, v21, (uint64_t)v20, v22);

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("recordType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setRecordType_(v5, v26, (uint64_t)v25, v27);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend__sortDescriptorsWithoutCopy(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, (uint64_t)CFSTR("sortDescriptorsData"));

  objc_msgSend__predicateWithoutCopy(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, (uint64_t)CFSTR("predicateData"));

  objc_msgSend_recordType(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, (uint64_t)CFSTR("recordType"));

  objc_autoreleasePoolPop(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKQuery *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = [CKQuery alloc];
  objc_msgSend_recordType(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__predicateWithoutCopy(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)objc_msgSend_initWithRecordType_predicate_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  objc_msgSend__sortDescriptorsWithoutCopy(self, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v14[2];
  v14[2] = v18;

  return v14;
}

- (id)_sortDescriptorsWithoutCopy
{
  CKQuery *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sortDescriptors;
  objc_sync_exit(v2);

  return v3;
}

- (id)_predicateWithoutCopy
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKQuery)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("You must call -[%@ initWithRecordType:predicate:sortDescriptors:]"), v5);

  objc_exception_throw(v7);
}

+ (id)copySortDescriptor:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;

  v3 = a3;
  v7 = (id)objc_msgSend_copy(v3, v4, v5, v6);
  if (v7 == v3)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3928]);
    objc_msgSend_key(v3, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_ascending(v3, v13, v14, v15);
    v7 = (id)objc_msgSend_initWithKey_ascending_(v8, v17, (uint64_t)v12, v16);

  }
  return v7;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = (void *)objc_opt_new();
  objc_msgSend_recordType(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("recordType"));

  objc_msgSend_predicate(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateFormat(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, (uint64_t)CFSTR("predicate"));

  objc_msgSend_properties(v3, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v21;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;

  v5 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_description(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithString_(v5, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__sortDescriptorsWithoutCopy(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (v13)
  {
    objc_msgSend_description(v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend_stringByAppendingString_(v9, v19, (uint64_t)v18, v20);

  }
  return v9;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordType(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__predicateWithoutCopy(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("recordType=%@, predicate=%@"), v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKQuery *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end

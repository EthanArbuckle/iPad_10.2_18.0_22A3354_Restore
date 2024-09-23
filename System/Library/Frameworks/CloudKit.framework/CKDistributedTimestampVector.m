@implementation CKDistributedTimestampVector

- (CKDistributedTimestampVector)initWithTimestamps:(id)a3
{
  id v4;
  CKDistributedTimestampVector *v5;
  uint64_t v6;
  NSMutableArray *timestampArray;
  const char *v8;
  uint64_t v9;
  _QWORD v11[4];
  CKDistributedTimestampVector *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDistributedTimestampVector;
  v5 = -[CKDistributedTimestampVector init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    timestampArray = v5->_timestampArray;
    v5->_timestampArray = (NSMutableArray *)v6;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A798900;
    v11[3] = &unk_1E1F65030;
    v12 = v5;
    objc_msgSend_enumerateObjectsUsingBlock_(v4, v8, (uint64_t)v11, v9);

  }
  return v5;
}

- (CKDistributedTimestampVector)initWithTimestampClockVector:(id)a3 fillingInGaps:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDistributedTimestampVector *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t Index;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v39;
  uint64_t v40;
  uint64_t v42;
  id obj;
  _QWORD v44[5];
  CKDistributedTimestampVector *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = (CKDistributedTimestampVector *)objc_msgSend_initWithTimestamps_(self, v7, 0, v8);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_allSiteIdentifiers(v6, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v13;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v47;
    v42 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend_clockValuesForSiteIdentifier_(v6, v15, v20, v16, v42);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v21;
        if (!a4 && objc_msgSend_count(v21, v22, v23, v24))
        {
          Index = objc_msgSend_firstIndex(v25, v26, v27, v28);
          v33 = objc_msgSend_lastIndex(v25, v30, v31, v32);
          if (v33 != objc_msgSend_count(v25, v34, v35, v36) - 1 || Index != 0)
            objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v37, v42, (uint64_t)CFSTR("Sparse timestamp vector is discontiguous and incompatible with conventional timestamp vector"));
        }
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = sub_18A798B6C;
        v44[3] = &unk_1E1F624F8;
        v44[4] = v20;
        v45 = v9;
        objc_msgSend_enumerateRangesUsingBlock_(v25, v39, (uint64_t)v44, v40);

      }
      v13 = obj;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v46, (uint64_t)v50, 16);
    }
    while (v17);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampVector)initWithCoder:(id)a3
{
  id v4;
  CKDistributedTimestampVector *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *timestampArray;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDistributedTimestampVector;
  v5 = -[CKDistributedTimestampVector init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_timestamps);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v11, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v15, (uint64_t)v14, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    timestampArray = v5->_timestampArray;
    v5->_timestampArray = (NSMutableArray *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_timestampArray(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamps);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v11, v10, (uint64_t)v8, (uint64_t)v9);

  objc_autoreleasePoolPop(v4);
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

  objc_msgSend_timestampArray(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (id)timestampAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_timestampArray(self, a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)indexForTimestampForSiteIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend_timestampArray(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A798FA0;
  v14[3] = &unk_1E1F65058;
  v9 = v4;
  v15 = v9;
  v16 = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v14, v11);

  v12 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)timestampForSiteIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  v10 = objc_msgSend_indexForTimestampForSiteIdentifier_(self, v5, (uint64_t)v4, v6);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_timestampArray(self, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v12, v13, v10, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)sequentialSiteIdentifiers
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend_timestampArray(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A799178;
  v12[3] = &unk_1E1F65030;
  v8 = v3;
  v13 = v8;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  return v8;
}

- (id)timestamps
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_timestampArray(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (BOOL)_isGreaterThanOrEqualToTimestamp:(id)a3
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  objc_msgSend_sequentialSiteIdentifiers(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sequentialSiteIdentifiers(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isSubsetOfSet_(v12, v13, (uint64_t)v8, v14) & 1) != 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    objc_msgSend_timestamps(v4, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18A79935C;
    v23[3] = &unk_1E1F65058;
    v23[4] = self;
    v23[5] = &v24;
    objc_msgSend_enumerateObjectsUsingBlock_(v18, v19, (uint64_t)v23, v20);

    v21 = *((_BYTE *)v25 + 24) == 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int64_t)compareToTimestampVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int64_t v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  if (objc_msgSend__isGreaterThanOrEqualToTimestamp_(v4, v5, (uint64_t)self, v6)
    && (objc_msgSend__isGreaterThanOrEqualToTimestamp_(self, v7, (uint64_t)v4, v8) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((objc_msgSend__isGreaterThanOrEqualToTimestamp_(v4, v7, (uint64_t)self, v8) & 1) != 0)
  {
    v9 = -1;
  }
  else if (objc_msgSend__isGreaterThanOrEqualToTimestamp_(self, v10, (uint64_t)v4, v11))
  {
    v9 = 1;
  }
  else
  {
    v9 = 2;
  }

  return v9;
}

- (void)addTimestamp:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  id v39;

  v39 = a3;
  if (objc_msgSend_modifier(v39, v5, v6, v7))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, CFSTR("CKDistributedTime.mm"), 373, CFSTR("Non-zero modifiers for ordered timestamps not yet supported"));

  }
  objc_msgSend_siteIdentifier(v39, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_indexForTimestampForSiteIdentifier_(self, v12, (uint64_t)v11, v13);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_timestampArray(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v18, v19, (uint64_t)v39, v20);
LABEL_7:

    goto LABEL_8;
  }
  v21 = objc_msgSend_clockValue(v39, v15, v16, v17);
  objc_msgSend_timestampArray(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v25, v26, v14, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_clockValue(v28, v29, v30, v31);

  if (v21 > v32)
  {
    objc_msgSend_timestampArray(self, v33, v34, v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_atIndexedSubscript_(v18, v36, (uint64_t)v39, v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend_timestamps(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18A7996EC;
    v12[3] = &unk_1E1F65080;
    v12[4] = self;
    v13 = v11;
    objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, (uint64_t)v12, v10);

    v4 = v11;
  }

}

- (id)minimalTimestampWith:(id)a3
{
  id v5;
  CKDistributedTimestampVector *v6;
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v29;
  const char *v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v5 = a3;
  v6 = [CKDistributedTimestampVector alloc];
  v9 = (void *)objc_msgSend_initWithTimestamps_(v6, v7, 0, v8);
  objc_msgSend_timestamps(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v13, v14, v15, v16);

  if (v17)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, CFSTR("CKDistributedTime.mm"), 399, CFSTR("Didn't expect non-zero timestamps"));

  }
  objc_msgSend_timestampArray(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A7998C4;
  v31[3] = &unk_1E1F65080;
  v22 = v5;
  v32 = v22;
  v23 = v9;
  v33 = v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v21, v24, (uint64_t)v31, v25);

  v26 = v33;
  v27 = v23;

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  v12 = ((v4 != 0) & objc_opt_isKindOfClass()) != 0
     && (v7 = objc_msgSend_compareToTimestampVector_(self, v5, (uint64_t)v4, v6),
         v7 == objc_msgSend_compareToTimestampVector_(v4, v8, (uint64_t)self, v9))
     && objc_msgSend_compareToTimestampVector_(self, v10, (uint64_t)v4, v11) == 0;

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend_timestampArray(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A799AF4;
  v9[3] = &unk_1E1F650A8;
  v9[4] = &v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v9, v6);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  _QWORD v34[4];
  id v35;
  void *v36;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timestampArray(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v9, v10, v11, v12);

  if (v13)
  {
    objc_msgSend_timestampArray(self, v14, v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v17, v18, (uint64_t)&unk_1E1F55A48, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_18A799D74;
    v34[3] = &unk_1E1F65080;
    v25 = v24;
    v35 = v25;
    v36 = v20;
    v26 = v20;
    objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, (uint64_t)v34, v28);
    v29 = v36;
    v30 = v25;

    objc_msgSend_appendFormat_(v5, v31, (uint64_t)CFSTR("[%@]"), v32, v30);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_timestampArray(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc((Class)objc_opt_class());
  v12 = (void *)objc_msgSend_initWithTimestamps_(v9, v10, (uint64_t)v8, v11);

  return v12;
}

- (NSMutableArray)timestampArray
{
  return self->_timestampArray;
}

- (void)setTimestampArray:(id)a3
{
  objc_storeStrong((id *)&self->_timestampArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampArray, 0);
}

@end

@implementation CKMultiValueRegister

- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4
{
  void *v4;
  id v5;
  CKMultiValueRegister *v6;
  CKMultiValueRegister *v7;
  CKMultiValueRegister *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v19;

  v19 = 0;
  v4 = (void *)objc_msgSend_initWithIdentifier_vector_contents_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, &v19);
  v5 = v19;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v5, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v9, v17, v10, (uint64_t)CFSTR("Failed to initialize %@: %@"), v12, v16);

  }
  return v7;
}

- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKMultiValueRegister *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUUID *identifier;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int isEqual;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *timestampToContents;
  uint64_t v35;
  NSMutableDictionary *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  CKMultiValueRegister *v55;
  CKMultiValueRegister *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  _QWORD v66[4];
  id v67;
  objc_super v68;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v68.receiver = self;
  v68.super_class = (Class)CKMultiValueRegister;
  v16 = -[CKMultiValueRegister init](&v68, sel_init);
  if (!v16)
    goto LABEL_13;
  v17 = (void *)objc_msgSend_mutableCopy(v11, v13, v14, v15);
  v21 = objc_msgSend_copy(v10, v18, v19, v20);
  identifier = v16->_identifier;
  v16->_identifier = (NSUUID *)v21;

  v23 = (void *)objc_opt_new();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_18A6B545C;
  v66[3] = &unk_1E1F5F808;
  v24 = v23;
  v67 = v24;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v25, (uint64_t)v66, v26);
  isEqual = objc_msgSend_isEqual_(v24, v27, (uint64_t)v17, v28);
  objc_storeStrong((id *)&v16->_vector, v17);
  if (isEqual)
  {
    if (v12)
      v33 = objc_msgSend_mutableCopy(v12, v30, v31, v32);
    else
      v33 = objc_msgSend_mutableCopy(MEMORY[0x1E0C9AA70], v30, v31, v32);
    timestampToContents = v16->_timestampToContents;
    v16->_timestampToContents = (NSMutableDictionary *)v33;
    goto LABEL_7;
  }
  v35 = objc_opt_new();
  v36 = v16->_timestampToContents;
  v16->_timestampToContents = (NSMutableDictionary *)v35;

  objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(v16, v37, 2, v38);
  if (!objc_msgSend_count(v12, v39, v40, v41))
    goto LABEL_12;
  timestampToContents = (void *)objc_msgSend_mutableCopy(v24, v42, v43, v44);
  objc_msgSend_clockVector(v16->_vector, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(timestampToContents, v49, (uint64_t)v48, v50);

  if (objc_msgSend_timestampCount(timestampToContents, v51, v52, v53))
  {
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Data dictionary includes timestamps that are not present in vector"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  v57 = [CKMultiValueRegister alloc];
  v58 = (void *)objc_opt_class();
  objc_msgSend_placeholderIdentifier(v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend_initWithIdentifier_vector_contents_error_(v57, v63, (uint64_t)v62, (uint64_t)v24, v12, a6);

  if (!v64 || (objc_msgSend_merge_error_(v16, v65, (uint64_t)v64, (uint64_t)a6) & 1) == 0)
  {

LABEL_19:
    v55 = 0;
    goto LABEL_14;
  }

LABEL_7:
LABEL_12:

LABEL_13:
  v55 = v16;
LABEL_14:

  return v55;
}

- (unint64_t)nextClockValue
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  objc_msgSend_siteIdentifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vector(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockValuesForSiteIdentifier_(v9, v10, (uint64_t)v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v12, v13, v14, v15);

  if (v16)
  {
    objc_msgSend_vector(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockValuesForSiteIdentifier_(v20, v21, (uint64_t)v5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_lastIndex(v23, v24, v25, v26) + 1;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)siteIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CKDistributedSiteIdentifier *v9;
  const char *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v13[1] = 0;
  objc_msgSend_identifier(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUUIDBytes_(v4, v5, (uint64_t)v13, v6);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v7, (uint64_t)v13, 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CKDistributedSiteIdentifier alloc];
  v11 = (void *)objc_msgSend_initWithIdentifier_modifier_(v9, v10, (uint64_t)v8, 0);

  return v11;
}

- (BOOL)isConsumedState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  objc_msgSend_vector(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByAtomState_(v4, v5, 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_timestampCount(v7, v8, v9, v10) != 0;

  return v11;
}

- (unint64_t)replaceVectorStateForPresentOrTombstonedTimestamps:(unsigned __int8)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v15[6];
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_vector(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v6, v7, v8, v9);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A6B575C;
  v15[3] = &unk_1E1F5F830;
  v16 = a3;
  v15[4] = self;
  v15[5] = &v17;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v10, v11, (uint64_t)v15, v12);
  v13 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (NSArray)contents
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_timestampToContents(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (void)setContents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ClockValue;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  CKDistributedTimestamp *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_timestampToContents(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v8, v9, v10, v11);

  if (v4)
  {
    if (objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(self, v12, 3, v13))
    {
      ClockValue = objc_msgSend_nextClockValue(self, v14, v15, v16);
      objc_msgSend_siteIdentifier(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(self, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v26, ClockValue, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v25, v29, (uint64_t)v28, 3, v21);

    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = v4;
    obj = v4;
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v31)
    {
      v35 = v31;
      v36 = *(_QWORD *)v63;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v63 != v36)
            objc_enumerationMutation(obj);
          v38 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v37);
          v39 = objc_msgSend_nextClockValue(self, v32, v33, v34, v60);
          objc_msgSend_siteIdentifier(self, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = [CKDistributedTimestamp alloc];
          v46 = (void *)objc_msgSend_initWithSiteIdentifierObject_clockValue_(v44, v45, (uint64_t)v43, v39);
          objc_msgSend_timestampToContents(self, v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v50, v51, v38, (uint64_t)v46);

          objc_msgSend_vector(self, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v56, v39, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v55, v59, (uint64_t)v58, 1, v43);

          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v62, (uint64_t)v66, 16);
      }
      while (v35);
    }

    v4 = v60;
  }
  else
  {
    objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(self, v12, 2, v13);
  }

}

- (BOOL)merge:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int isConsumedState;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, void *);
  void *v74;
  CKMultiValueRegister *v75;
  id v76;
  _QWORD v77[5];
  id v78;

  v6 = a3;
  isConsumedState = objc_msgSend_isConsumedState(v6, v7, v8, v9);
  if (isConsumedState)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Other register is in consumed state and should not be merged"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_timestampToContents(self, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timestampToContents(v6, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v14, v19, (uint64_t)v18, v20);

    objc_msgSend_vector(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vector(v6, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionStateVector_(v24, v29, (uint64_t)v28, v30);

    v31 = (void *)objc_opt_new();
    objc_msgSend_timestampToContents(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = sub_18A6B5CD8;
    v77[3] = &unk_1E1F5F858;
    v77[4] = self;
    v78 = v31;
    v37 = v31;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v35, v38, (uint64_t)v77, v39);

    objc_msgSend_timestampToContents(self, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsForKeys_(v43, v44, (uint64_t)v37, v45);

    v46 = (void *)objc_opt_new();
    objc_msgSend_timestampToContents(self, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v36;
    v72 = 3221225472;
    v73 = sub_18A6B5D44;
    v74 = &unk_1E1F5F858;
    v75 = self;
    v76 = v46;
    v51 = v46;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v50, v52, (uint64_t)&v71, v53);

    objc_msgSend_vector(self, v54, v55, v56, v71, v72, v73, v74, v75);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockVector(v51, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusVector_(v57, v62, (uint64_t)v61, v63);

    objc_msgSend_vector(self, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionStateVector_(v67, v68, (uint64_t)v51, v69);

  }
  return isConsumedState ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CKMultiValueRegister *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKMultiValueRegister *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  char isEqual;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v44;

  v5 = (CKMultiValueRegister *)a3;
  if (self == v5)
  {
    isEqual = 1;
  }
  else
  {
    v6 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v5, v7, v6, v8))
    {
      v9 = v5;
      objc_msgSend_vector(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(v9, v14, v15, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v20)
      {
        objc_msgSend_vector(self, v17, v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vector(v9, v22, v23, v24);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v21, v25, (uint64_t)v3, v26))
        {
          isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v44 = v21;
      }
      objc_msgSend_timestampToContents(self, v17, v18, v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timestampToContents(v9, v29, v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v35)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_timestampToContents(self, v32, v33, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timestampToContents(v9, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v36, v41, (uint64_t)v40, v42);

      }
      v21 = v44;
      if (v13 == v20)
        goto LABEL_14;
      goto LABEL_13;
    }
    isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_vector(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_timestampToContents(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMultiValueRegister *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMultiValueRegister *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v4 = a3;
  objc_msgSend_vector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("vector"), (uint64_t)v8, 0);

  objc_msgSend_timestampToContents(self, v10, v11, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v18, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, (uint64_t)CFSTR("timestamps"), (uint64_t)v16, 0);

}

+ (id)placeholderIdentifier
{
  id v2;
  const char *v3;
  uint64_t v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
  return (id)objc_msgSend_initWithUUIDBytes_(v2, v3, (uint64_t)v6, v4);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CKDistributedTimestampStateVector)vector
{
  return self->_vector;
}

- (NSMutableDictionary)timestampToContents
{
  return self->_timestampToContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampToContents, 0);
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

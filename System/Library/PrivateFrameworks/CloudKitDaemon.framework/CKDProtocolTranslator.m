@implementation CKDProtocolTranslator

- (BOOL)_isDefaultUserNameFromClient:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  char isEqualToString;

  v4 = a3;
  objc_msgSend_containerScopedUserID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4) & 1) != 0)
    isEqualToString = 1;
  else
    isEqualToString = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E0C94730], v9, (uint64_t)v4);

  return isEqualToString;
}

- (id)pRecordZoneIdentifierFromRecordZoneID:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_zoneName(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_Zone(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  objc_msgSend_ownerName(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pUserIdentifierFromUserRecordName_(self, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOwnerIdentifier_(v5, v18, (uint64_t)v17);

  v21 = objc_msgSend_databaseScope(v4, v19, v20);
  if (!v21)
    v21 = objc_msgSend_databaseScope(self, v22, v23);
  if (v21 > 4)
    objc_msgSend_setDatabaseType_(v5, v22, 1);
  else
    objc_msgSend_setDatabaseType_(v5, v22, dword_1BECBC1A8[v21]);
  return v5;
}

- (id)pQueryFromQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CKDPRecordType *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_predicate(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend_CKDPQueryFiltersWithTranslator_error_(v10, v11, (uint64_t)self, &v48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v48;

  if (!v12)
    goto LABEL_4;
  CKVerifyFilters(v12);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v13 = (id)v14;
LABEL_4:
    if (a4)
    {
      v13 = objc_retainAutorelease(v13);
      *a4 = v13;
    }

    v15 = 0;
    goto LABEL_22;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v12;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v44, v50, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v45;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend_addFilters_(v7, v18, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v44, v50, 16);
    }
    while (v19);
  }

  v22 = objc_alloc_init(CKDPRecordType);
  objc_msgSend_recordType(v6, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v22, v26, (uint64_t)v25);

  objc_msgSend_addTypes_(v7, v27, (uint64_t)v22);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend_sortDescriptors(v6, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v40, v49, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v30);
        objc_msgSend_CKDPQuerySort(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v36), v32, v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSorts_(v7, v38, (uint64_t)v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v40, v49, 16);
    }
    while (v34);
  }

  v15 = v7;
LABEL_22:

  return v15;
}

- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4 requireContainerScopedUserID:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  CKDProtocolTranslator *inited;
  void *v44;
  const char *v45;

  v5 = a5;
  v9 = a3;
  objc_msgSend_containerScopedUserID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 && v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, CFSTR("CKDProtocolTranslator.m"), 109, CFSTR("Without a user id, this translator won't do what you want"));

  }
  objc_msgSend_options(v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_addDatabaseScopeToZoneIDs(v15, v16, v17);

  if ((v18 & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    objc_msgSend_containerID(v9, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_specialContainerType(v22, v23, v24) == 5;

  }
  objc_msgSend_containerScopedUserID(v9, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orgAdminUserID(v9, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_directoryContext(v9, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageStagingDirectory(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (CKDProtocolTranslator *)objc_msgSend_initInternalWithContainerScopedUserID_orgAdminUserID_packageStagingDirectory_databaseScope_addDatabaseScopeToZoneIDs_pcsManager_(self, v41, (uint64_t)v25, v28, v37, a4, v21, v40);

  return inited;
}

- (id)fieldValueFromObject:(id)a3 forCache:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  void *v11;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    v8 = objc_msgSend_fieldValueTypeFromObject_(self, v6, (uint64_t)v7);
    if (objc_msgSend_objectIsAnEncryptedType_(self, v9, (uint64_t)v7))
      objc_msgSend_encryptedFieldValueOfType_withObject_(self, v10, v8, v7);
    else
      objc_msgSend_fieldValueOfType_withObject_forCache_(self, v10, v8, v7, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)objectIsAnEncryptedType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char isEncrypted;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_firstObject(v3, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEncrypted = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_valueID(v3, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      isEncrypted = objc_msgSend_isEncrypted(v10, v11, v12);

    }
    else
    {
      isEncrypted = 0;
    }
  }

  return isEncrypted;
}

- (int)fieldValueTypeFromObject:(id)a3
{
  const __CFNumber *v4;
  BOOL v5;
  int v6;
  int v7;
  const char *v8;
  const __CFNumber *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int isEncrypted;
  id v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  objc_class *v29;
  const char *v30;

  v4 = (const __CFNumber *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = CFNumberIsFloatType(v4) == 0;
    v6 = 7;
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 2;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 3;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 1;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend_fieldValueTypeFromEncryptedDataObject_isInList_(self, v8, (uint64_t)v4, 0);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    if (!objc_msgSend_count(v9, v10, v11))
    {
      v7 = 9;
      goto LABEL_26;
    }
    objc_msgSend_objectAtIndexedSubscript_(v9, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 13;
LABEL_20:

LABEL_26:
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 11;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend_fieldValueTypeFromEncryptedDataObject_isInList_(self, v15, (uint64_t)v13, 1);
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 10;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 12;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (CFNumberIsFloatType((CFNumberRef)v13))
        v7 = 18;
      else
        v7 = 17;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 15;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 14;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 25;
      goto LABEL_20;
    }
    v28 = objc_alloc(MEMORY[0x1E0C94D90]);
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_initWithCode_format_(v28, v30, 1006, CFSTR("Can't encode array %@ of unknown child class: %@"), v9, v24);
LABEL_57:
    v27 = v26;

    objc_exception_throw(v27);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 5;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 6;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 19;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 4;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 24;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = objc_alloc(MEMORY[0x1E0C94D90]);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_initWithCode_format_(v22, v25, 1006, CFSTR("Can't encode object %@ of class %@"), v4, v24);
    goto LABEL_57;
  }
  objc_msgSend_valueID(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEncrypted = objc_msgSend_isEncrypted(v18, v19, v20);

  v5 = isEncrypted == 0;
  v6 = 28;
LABEL_3:
  if (v5)
    v7 = v6;
  else
    v7 = v6 + 1;
LABEL_27:

  return v7;
}

- (id)fieldValueOfType:(int)a3 withObject:(id)a4 forCache:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  id v62;
  const char *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v72 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend_setType_(v10, v11, v6);
  switch((int)v6)
  {
    case 1:
      objc_msgSend_setBytesValue_(v10, v12, (uint64_t)v9);
      goto LABEL_37;
    case 2:
      v27 = objc_alloc_init(MEMORY[0x1E0C94C60]);
      objc_msgSend_setDateValue_(v10, v28, (uint64_t)v27);

      objc_msgSend_timeIntervalSinceReferenceDate(v9, v29, v30);
      v32 = v31;
      objc_msgSend_dateValue(v10, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTime_(v35, v36, v37, v32);
      goto LABEL_23;
    case 3:
      objc_msgSend_setStringValue_(v10, v12, (uint64_t)v9);
      goto LABEL_37;
    case 4:
      objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E0C9E3B8], v12, (uint64_t)v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLocationValue_(v10, v38, (uint64_t)v35);
      goto LABEL_23;
    case 5:
      v25 = (void *)objc_opt_new();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_recordID(v9, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordIdentifierFromRecordID_(self, v42, (uint64_t)v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRecordIdentifier_(v25, v44, (uint64_t)v43);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_pRecordIdentifierFromRecordID_(self, v57, (uint64_t)v9);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRecordIdentifier_(v25, v58, (uint64_t)v41);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_35;
          objc_msgSend_pReferenceFromReference_error_(self, v60, (uint64_t)v9, 0);
          v41 = v25;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

LABEL_35:
      objc_msgSend_setReferenceValue_(v10, v60, (uint64_t)v25);
      goto LABEL_36;
    case 6:
      objc_msgSend_pAssetFromAsset_(self, v12, (uint64_t)v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetValue_(v10, v45, (uint64_t)v35);
      goto LABEL_23;
    case 7:
      v46 = objc_msgSend_longLongValue(v9, v12, v13);
      objc_msgSend_setSignedValue_(v10, v47, v46);
      goto LABEL_37;
    case 8:
      objc_msgSend_doubleValue(v9, v12, v13);
      objc_msgSend_setCkDoubleValue_(v10, v48, v49);
      goto LABEL_37;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
    case 25:
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v14 = v9;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v65, v69, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(v14);
            v20 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v62 = objc_alloc(MEMORY[0x1E0C94D90]);
              v64 = (id)objc_msgSend_initWithCode_format_(v62, v63, 1006, CFSTR("Nesting arrays not supported"), (_QWORD)v65);
              objc_exception_throw(v64);
            }
            objc_msgSend_fieldValueFromObject_forCache_(self, v21, v20, v5, (_QWORD)v65);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addListValue_(v10, v23, (uint64_t)v22);

          }
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v24, (uint64_t)&v65, v69, 16);
        }
        while (v17);
      }

      goto LABEL_37;
    case 19:
      objc_msgSend_pPackageFromPackage_(self, v12, (uint64_t)v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPackageValue_(v10, v50, (uint64_t)v35);
      goto LABEL_23;
    case 20:
    case 21:
    case 29:
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDRecordFieldConversion.m"), 474, CFSTR("Did not expect encrypted types while creating field value"));
      goto LABEL_36;
    case 24:
      objc_msgSend_pStreamingAssetFromStreamingAsset_forCache_(self, v12, (uint64_t)v9, v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStreamingAssetValue_(v10, v51, (uint64_t)v35);
LABEL_23:

      goto LABEL_37;
    case 28:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_valueID(v9, v52, v53);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pMergeableValueFromMergeableValueID_(self, v54, (uint64_t)v25);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setMergeableValue_(v10, v56, (uint64_t)v55);

LABEL_36:
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v59 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v9;
          _os_log_fault_impl(&dword_1BE990000, v59, OS_LOG_TYPE_FAULT, "Trying to create a mergeable value field from something that isn't a mergeable record value: %@", buf, 0xCu);
        }
      }
LABEL_37:

      return v10;
    default:
      goto LABEL_37;
  }
}

- (id)fieldValueFromObject:(id)a3
{
  return (id)objc_msgSend_fieldValueFromObject_forCache_(self, a2, (uint64_t)a3, 0);
}

- (int64_t)databaseScope
{
  uint64_t v2;
  int64_t result;

  result = objc_msgSend_overriddenDatabaseScope(self, a2, v2);
  if (!result)
    return self->_databaseScope;
  return result;
}

- (int64_t)overriddenDatabaseScope
{
  return self->_overriddenDatabaseScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorizationMap, 0);
  objc_storeStrong((id *)&self->_overriddenContainerScopedUserID, 0);
  objc_destroyWeak((id *)&self->_identityDelegate);
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_packageStagingDirectory, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
}

- (id)userNameFromPIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int isDefaultUserNameFromServer;
  id v20;

  v5 = a3;
  objc_msgSend_name(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CKCheckArgument();

  if (v9)
  {
    objc_msgSend_name(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasName(v5, v13, v14))
    {
      objc_msgSend_name(v5, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v18, (uint64_t)v17);

      if (isDefaultUserNameFromServer)
      {
        v20 = (id)*MEMORY[0x1E0C94730];

        v12 = v20;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setIdentityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_identityDelegate, a3);
}

- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)recordZoneIDFromPRecordZoneIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v8 = a3;
  v9 = a4;
  objc_msgSend_ownerIdentifier(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userNameFromPIdentifier_error_(self, v13, (uint64_t)v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_value(v8, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _CKCheckArgument();

    if (v21)
    {
      if (objc_msgSend_addDatabaseScopeToZoneIDs(self, v22, v23))
      {
        v26 = objc_msgSend_databaseScope(self, v24, v25);
        if (!objc_msgSend_hasDatabaseType(v8, v27, v28))
        {
LABEL_9:
          v33 = objc_alloc(MEMORY[0x1E0C95098]);
          objc_msgSend_value(v8, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(v33, v40, (uint64_t)v39, v14, v9, v26);

          goto LABEL_10;
        }
        v31 = objc_msgSend_databaseType(v8, v29, v30) - 1;
        if (v31 <= 3)
        {
          v26 = qword_1BECBC188[v31];
          goto LABEL_9;
        }
      }
      v26 = 0;
      goto LABEL_9;
    }
  }
  v32 = 0;
LABEL_10:

  return v32;
}

- (id)pUserIdentifierFromUserRecordName:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    if (objc_msgSend_databaseScope(self, v6, v7) == 1 || objc_msgSend_databaseScope(self, v8, v9) == 4)
    {
      v12 = (id)*MEMORY[0x1E0C94A68];
    }
    else
    {
      objc_msgSend_containerScopedUserID(self, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v4 = v13;
  }
  objc_msgSend_CKDPIdentifier_User(v4, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)overriddenContainerScopedUserID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (CKDProtocolTranslator)initWithContainer:(id)a3 databaseScope:(int64_t)a4
{
  return (CKDProtocolTranslator *)objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(self, a2, (uint64_t)a3, a4, a4 != 1);
}

- (NSString)containerScopedUserID
{
  uint64_t v2;
  NSString *v4;
  NSString *containerScopedUserID;
  NSString *v6;

  objc_msgSend_overriddenContainerScopedUserID(self, a2, v2);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerScopedUserID = v4;
  if (!v4)
  {
    containerScopedUserID = self->_containerScopedUserID;
    if (!containerScopedUserID)
      containerScopedUserID = (NSString *)*MEMORY[0x1E0C94A68];
  }
  v6 = containerScopedUserID;

  return v6;
}

- (void)consumeResponseHeader:(id)a3
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id obj;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend_assetAuthorizationResponses(a3, a2, (uint64_t)a3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v47, v52, 16);
  if (v4)
  {
    v7 = v4;
    v41 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend_responseHeaders(v9, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v43, v51, 16);
        if (v15)
        {
          v18 = v15;
          v19 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v44 != v19)
                objc_enumerationMutation(v13);
              v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_msgSend_headerValue(v21, v16, v17);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_headerKey(v21, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v10, v26, (uint64_t)v22, v25);

            }
            v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v43, v51, 16);
          }
          while (v18);
        }

        v27 = objc_alloc(MEMORY[0x1E0C94BC0]);
        objc_msgSend_responseUUID(v9, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_authGetResponseBody(v9, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend_initWithResponseUUID_contentResponseHeaders_contentResponseBody_(v27, v34, (uint64_t)v30, v10, v33);

        objc_msgSend_responseUUID(v9, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDownloadPreauthorization_forResponseUUID_(self, v39, (uint64_t)v35, v38);

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v47, v52, 16);
    }
    while (v7);
  }

}

- (BOOL)addDatabaseScopeToZoneIDs
{
  return self->_addDatabaseScopeToZoneIDs;
}

- (BOOL)_isDefaultUserNameFromServer:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  char isEqualToString;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_containerScopedUserID(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v6) & 1) != 0)
      isEqualToString = 1;
    else
      isEqualToString = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E0C94A68], v9, (uint64_t)v6);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (int)fieldValueTypeFromEncryptedDataObject:(id)a3 isInList:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  int v10;

  v4 = a4;
  v5 = a3;
  if (v4)
    v6 = 21;
  else
    v6 = 20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 2;
    v9 = 10;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 3;
    v9 = 15;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 7;
    v9 = 17;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 8;
    v9 = 18;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 5;
    v9 = 13;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = !v4;
    v8 = 4;
    v9 = 12;
LABEL_16:
    if (v7)
      v10 = v8;
    else
      v10 = v9;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = 15;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = 17;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = 18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = 12;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v10 = 9;
            else
              v10 = v6;
          }
        }
      }
    }
  }
LABEL_19:

  return v10;
}

- (id)encryptedFieldValueOfType:(int)a3 withObject:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  int v17;
  __CFString *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v32;
  const char *v33;
  NSObject *v34;
  id v35;
  const char *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v4 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend_setType_(v8, v9, v4);
  objc_msgSend_setIsEncrypted_(v8, v10, 1);
  switch((int)v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
    case 15:
    case 17:
    case 18:
    case 20:
      objc_msgSend_encryptedData(v7, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBytesValue_(v8, v14, (uint64_t)v13);
      goto LABEL_3;
    case 6:
    case 13:
    case 14:
    case 16:
    case 19:
    case 24:
    case 25:
    case 28:
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v4 - 6;
      if ((v4 - 6) < 0x17 && ((0x4CFFFFu >> v17) & 1) != 0)
      {
        v18 = off_1E78326E0[v17];
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v15, (uint64_t)a2, self, CFSTR("CKDRecordFieldConversion.m"), 371, CFSTR("Invalid type %@ on encrypted field object %@"), v18, v7);
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("(unknown: %i)"), v4);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v19, (uint64_t)a2, self, CFSTR("CKDRecordFieldConversion.m"), 371, CFSTR("Invalid type %@ on encrypted field object %@"), v18, v7);
      }

      break;
    case 9:
      objc_msgSend_setBytesValue_(v8, v11, 0);
      break;
    case 11:
    case 21:
      objc_msgSend_setIsEncrypted_(v8, v11, 0);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v7;
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v20);
            v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = objc_alloc(MEMORY[0x1E0C94D90]);
              v37 = (id)objc_msgSend_initWithCode_format_(v35, v36, 1006, CFSTR("Nesting arrays not supported"));
              objc_exception_throw(v37);
            }
            objc_msgSend_fieldValueFromObject_(self, v27, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addListValue_(v8, v29, (uint64_t)v28);

          }
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v30, (uint64_t)&v38, v44, 16);
        }
        while (v23);
      }

      break;
    case 29:
      objc_msgSend_setIsEncrypted_(v8, v11, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_pEncryptedMergeableValueFromRecordValue_(self, v32, (uint64_t)v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEncryptedMergeableValue_(v8, v33, (uint64_t)v13);
LABEL_3:

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v34 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v7;
          _os_log_fault_impl(&dword_1BE990000, v34, OS_LOG_TYPE_FAULT, "Trying to create a mergeable value field from something that isn't a mergeable: %@", buf, 0xCu);
        }
      }
      break;
    default:
      break;
  }

  return v8;
}

- (id)fieldValueOfType:(int)a3 withObject:(id)a4
{
  return (id)objc_msgSend_fieldValueOfType_withObject_forCache_(self, a2, *(uint64_t *)&a3, a4, 0);
}

- (id)locationFieldValueWithLatitude:(double)a3 longitude:(double)a4
{
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v15;
  const char *v16;
  id v17;

  v6 = (void *)objc_opt_new();
  objc_msgSend_setType_(v6, v7, 4);
  if (a4 > 180.0 || a3 < -90.0 || a3 > 90.0 || a4 < -180.0)
  {
    v15 = objc_alloc(MEMORY[0x1E0C94D90]);
    v17 = (id)objc_msgSend_initWithCode_format_(v15, v16, 1006, CFSTR("Invalid latitude/longitude value in location"));
    objc_exception_throw(v17);
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend_setLatitude_(v8, v9, v10, a3);
  objc_msgSend_setLongitude_(v8, v11, v12, a4);
  objc_msgSend_setLocationValue_(v6, v13, (uint64_t)v8);

  return v6;
}

- (id)encryptedObjectRepresentationFromFieldValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v22;
  const char *v23;
  int v24;
  __CFString *v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6 = 0;
  switch(objc_msgSend_type(v3, v4, v5))
  {
    case 1u:
    case 0x14u:
      v10 = (objc_class *)MEMORY[0x1E0C94D18];
      goto LABEL_19;
    case 2u:
      v10 = (objc_class *)MEMORY[0x1E0C94D20];
      goto LABEL_19;
    case 3u:
      v10 = (objc_class *)MEMORY[0x1E0C94D70];
      goto LABEL_19;
    case 4u:
      v10 = (objc_class *)MEMORY[0x1E0C94D48];
      goto LABEL_19;
    case 5u:
      v10 = (objc_class *)MEMORY[0x1E0C94D68];
      goto LABEL_19;
    case 6u:
    case 0xBu:
    case 0xDu:
    case 0xEu:
    case 0x10u:
    case 0x13u:
    case 0x15u:
    case 0x18u:
    case 0x19u:
    case 0x1Cu:
    case 0x1Du:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v7 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v22 = objc_msgSend_type(v3, v8, v9);
        v24 = v22 - 1;
        if ((v22 - 1) < 0x1D && ((0x199FFFFFu >> v24) & 1) != 0)
        {
          v25 = off_1E7832798[v24];
        }
        else
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("(unknown: %i)"), v22);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        v27 = v25;
        _os_log_fault_impl(&dword_1BE990000, v7, OS_LOG_TYPE_FAULT, "Did not expect %@ field to have encrypted flag set", buf, 0xCu);

      }
      v6 = 0;
      break;
    case 7u:
      v10 = (objc_class *)MEMORY[0x1E0C94D58];
      goto LABEL_19;
    case 8u:
      v10 = (objc_class *)MEMORY[0x1E0C94D30];
      goto LABEL_19;
    case 9u:
      v11 = objc_alloc(MEMORY[0x1E0C94D40]);
      objc_msgSend_data(MEMORY[0x1E0C99D50], v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_initWithData_(v11, v15, (uint64_t)v14);
      goto LABEL_20;
    case 0xAu:
      v10 = (objc_class *)MEMORY[0x1E0C94D28];
      goto LABEL_19;
    case 0xCu:
      v10 = (objc_class *)MEMORY[0x1E0C94D50];
      goto LABEL_19;
    case 0xFu:
      v10 = (objc_class *)MEMORY[0x1E0C94D78];
      goto LABEL_19;
    case 0x11u:
      v10 = (objc_class *)MEMORY[0x1E0C94D60];
      goto LABEL_19;
    case 0x12u:
      v10 = (objc_class *)MEMORY[0x1E0C94D38];
LABEL_19:
      v17 = [v10 alloc];
      objc_msgSend_bytesValue(v3, v18, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_initWithEncryptedData_(v17, v20, (uint64_t)v14);
LABEL_20:
      v6 = (void *)v16;

      break;
    default:
      break;
  }

  return v6;
}

- (id)objectRepresentationFromFieldValue:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_setValue_(v5, v6, (uint64_t)v4);

  objc_msgSend_objectRepresentationFromField_inRecord_asAnonymousCKUserID_(self, v7, (uint64_t)v5, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectRepresentationFromField:(id)a3 inRecord:(id)a4 asAnonymousCKUserID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  id v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  id v56;
  NSObject *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  id v64;
  NSObject *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[6];
  __int128 buf;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_value(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEncrypted(v13, v14, v15))
  {
    objc_msgSend_encryptedObjectRepresentationFromFieldValue_(self, v16, (uint64_t)v13);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v19 = (void *)v18;
  }
  else
  {
    objc_msgSend_listValues(v13, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v73 = 0x2020000000;
      v74 = 0;
      objc_msgSend_listValues(v13, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = sub_1BEAA58AC;
      v71[3] = &unk_1E78326C0;
      v71[4] = self;
      v71[5] = &buf;
      objc_msgSend_CKCompactMap_(v22, v23, (uint64_t)v71);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      switch(objc_msgSend_type(v13, v20, v21))
      {
        case 1u:
          objc_msgSend_bytesValue(v13, v25, v26);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        case 2u:
          v31 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend_dateValue(v13, v25, v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_time(v32, v33, v34);
          objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v31, v35, v36);
          v37 = objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        case 3u:
          objc_msgSend_stringValue(v13, v25, v26);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        case 4u:
          v38 = (void *)MEMORY[0x1E0C9E3B8];
          objc_msgSend_locationValue(v13, v25, v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKLocationFromPLocationCoordinate_(v38, v39, (uint64_t)v32);
          v37 = objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        case 5u:
          objc_msgSend_referenceValue(v13, v25, v26);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0;
          objc_msgSend_referenceFromPReference_error_(self, v41, (uint64_t)v40, &v70);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v70;

          if (v42 || !v19)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v43 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v42;
              _os_log_error_impl(&dword_1BE990000, v43, OS_LOG_TYPE_ERROR, "Invalid field value (record identifier) from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 6u:
          objc_msgSend_assetValue(v13, v25, v26);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0;
          objc_msgSend_assetFromPAsset_error_(self, v45, (uint64_t)v44, &v69);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v69;

          if (!v19 && v46)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v47 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v46;
              _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Invalid asset type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 7u:
          v48 = (void *)MEMORY[0x1E0CB37E8];
          v49 = objc_msgSend_signedValue(v13, v25, v26);
          objc_msgSend_numberWithLongLong_(v48, v50, v49);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        case 8u:
          v51 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_ckDoubleValue(v13, v25, v26);
          objc_msgSend_numberWithDouble_(v51, v52, v53);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        case 9u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
        case 0xEu:
        case 0xFu:
        case 0x10u:
        case 0x11u:
        case 0x12u:
        case 0x15u:
        case 0x19u:
          objc_msgSend_array(MEMORY[0x1E0C99D20], v25, v26);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        case 0x13u:
          objc_msgSend_packageValue(v13, v25, v26);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0;
          objc_msgSend_packageFromPPackage_error_(self, v55, (uint64_t)v54, &v68);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v68;

          if (!v19 && v56)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v57 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v56;
              _os_log_error_impl(&dword_1BE990000, v57, OS_LOG_TYPE_ERROR, "Invalid package type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 0x14u:
          v58 = objc_alloc(MEMORY[0x1E0C94D18]);
          objc_msgSend_bytesValue(v13, v59, v60);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend_initWithEncryptedData_(v58, v61, (uint64_t)v32);
LABEL_45:
          v19 = (void *)v37;

          break;
        case 0x18u:
          objc_msgSend_streamingAssetValue(v13, v25, v26);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0;
          objc_msgSend_streamingAssetFromPStreamingAsset_error_(self, v63, (uint64_t)v62, &v67);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v67;

          if (!v19 && v64)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v65 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v64;
              _os_log_error_impl(&dword_1BE990000, v65, OS_LOG_TYPE_ERROR, "Invalid streaming asset type from server: %@", (uint8_t *)&buf, 0xCu);
            }
          }

          break;
        case 0x1Cu:
        case 0x1Du:
          if (v9)
          {
            objc_msgSend_recordIdentifier(v9, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 0;
            objc_msgSend_mergeableRecordValueFromPRecordField_inPRecordIdentifier_asAnonymousCKUserID_error_(self, v28, (uint64_t)v8, v27, v10, &v66);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v66;

            if (!v19 || v29)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v30 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v29;
                _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "Invalid mergeable value type from server: %@", (uint8_t *)&buf, 0xCu);
              }
            }

          }
          else
          {
            v19 = 0;
          }
          break;
        default:
          break;
      }
    }
  }

  return v19;
}

- (id)pFieldWithKey:(id)a3 value:(id)a4 forCache:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  id v41;
  const char *v42;
  void *v43;
  id v44;
  const char *v45;
  id v46;
  const char *v47;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend_fieldValueFromObject_forCache_(self, v10, (uint64_t)v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CKProcessIndexedArrayKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!v15)
    {
      v21 = (void *)objc_opt_new();
      v22 = (void *)objc_opt_new();
      objc_msgSend_setIdentifier_(v21, v23, (uint64_t)v22);

      objc_msgSend_identifier(v21, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v26, v27, (uint64_t)v8);

      objc_msgSend_setValue_(v21, v28, (uint64_t)v11);
LABEL_14:

      goto LABEL_15;
    }
    if (v12)
    {
      v41 = objc_alloc(MEMORY[0x1E0C94D90]);
      v43 = (void *)objc_msgSend_initWithCode_format_(v41, v42, 2018, CFSTR("Could not parse key for indexed list field operation: %@"), v12);
      goto LABEL_19;
    }
    objc_msgSend_listValues(v11, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else if (objc_msgSend_type(v11, v17, v18) != 9)
    {
      v46 = objc_alloc(MEMORY[0x1E0C94D90]);
      v43 = (void *)objc_msgSend_initWithCode_format_(v46, v47, 1006, CFSTR("Invalid value type for indexed list field key %@"), v8);
      goto LABEL_19;
    }
    objc_msgSend_listValues(v11, v19, v20);
    v29 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v29;
    if (v29)
      objc_msgSend_pFieldActionWithLocation_length_values_(self, v30, 0, 0, v29);
    else
      objc_msgSend_pFieldActionWithLocation_length_values_(self, v30, 0, 0, MEMORY[0x1E0C9AA60]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v21 = (void *)objc_opt_new();
      v33 = (void *)objc_opt_new();
      objc_msgSend_setIdentifier_(v21, v34, (uint64_t)v33);

      objc_msgSend_identifier(v21, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v37, v38, (uint64_t)v15);

      objc_msgSend_addAction_(v21, v39, (uint64_t)v32);
      goto LABEL_14;
    }
    v44 = objc_alloc(MEMORY[0x1E0C94D90]);
    v43 = (void *)objc_msgSend_initWithCode_format_(v44, v45, 2018, CFSTR("Could not produce action for indexed list field key %@"), v8);
LABEL_19:
    objc_exception_throw(v43);
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (id)pFieldWithKey:(id)a3 value:(id)a4
{
  return (id)objc_msgSend_pFieldWithKey_value_forCache_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)pFieldActionWithLocation:(int64_t)a3 length:(unint64_t)a4 values:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;

  v7 = a5;
  v10 = v7;
  if (a3 == -1 && !a4)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend_setIndex_(v11, v12, 0);
    objc_msgSend_setIsReversed_(v11, v13, 1);
    v14 = (void *)objc_opt_new();
    objc_msgSend_setPosition_(v14, v15, (uint64_t)v11);
    objc_msgSend_setInsertAfter_(v14, v16, 1);
LABEL_8:
    v40 = (void *)objc_msgSend_mutableCopy(v10, v17, v18);
    objc_msgSend_setValues_(v14, v41, (uint64_t)v40);

    v34 = (void *)objc_opt_new();
    objc_msgSend_setInsertIntoList_(v34, v42, (uint64_t)v14);
    goto LABEL_11;
  }
  if (!a4)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend_setIndex_(v11, v36, a3);
    objc_msgSend_setIsReversed_(v11, v37, 0);
    v14 = (void *)objc_opt_new();
    objc_msgSend_setPosition_(v14, v38, (uint64_t)v11);
    objc_msgSend_setInsertAfter_(v14, v39, 0);
    goto LABEL_8;
  }
  v19 = a4 + a3;
  v20 = objc_msgSend_count(v7, v8, v9);
  v11 = (void *)objc_opt_new();
  objc_msgSend_setIndex_(v11, v21, a3);
  objc_msgSend_setIsReversed_(v11, v22, 0);
  v14 = (void *)objc_opt_new();
  objc_msgSend_setIndex_(v14, v23, (v19 - 1));
  objc_msgSend_setIsReversed_(v14, v24, 0);
  v25 = (void *)objc_opt_new();
  objc_msgSend_setLeft_(v25, v26, (uint64_t)v11);
  objc_msgSend_setRight_(v25, v27, (uint64_t)v14);
  v28 = (void *)objc_opt_new();
  objc_msgSend_setRange_(v28, v29, (uint64_t)v25);
  if (v20)
  {
    v32 = (void *)objc_msgSend_mutableCopy(v10, v30, v31);
    objc_msgSend_setValues_(v28, v33, (uint64_t)v32);

    v34 = (void *)objc_opt_new();
    objc_msgSend_setReplaceListRange_(v34, v35, (uint64_t)v28);
  }
  else
  {
    v34 = (void *)objc_opt_new();
    objc_msgSend_setDeleteListRange_(v34, v43, (uint64_t)v28);
  }

LABEL_11:
  return v34;
}

- (id)initInternalWithContainerScopedUserID:(id)a3 orgAdminUserID:(id)a4 packageStagingDirectory:(id)a5 databaseScope:(int64_t)a6 addDatabaseScopeToZoneIDs:(BOOL)a7 pcsManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  CKDProtocolTranslator *v20;
  uint64_t v21;
  NSString *containerScopedUserID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *orgAdminUserID;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *packageStagingDirectory;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CKDProtocolTranslator;
  v20 = -[CKDProtocolTranslator init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_copy(v14, v18, v19);
    containerScopedUserID = v20->_containerScopedUserID;
    v20->_containerScopedUserID = (NSString *)v21;

    v25 = objc_msgSend_copy(v15, v23, v24);
    orgAdminUserID = v20->_orgAdminUserID;
    v20->_orgAdminUserID = (NSString *)v25;

    v20->_databaseScope = a6;
    v29 = objc_msgSend_copy(v16, v27, v28);
    packageStagingDirectory = v20->_packageStagingDirectory;
    v20->_packageStagingDirectory = (NSString *)v29;

    v20->_addDatabaseScopeToZoneIDs = a7;
    objc_storeStrong((id *)&v20->_pcsManager, a8);
  }

  return v20;
}

+ (id)standaloneTranslatorWithPackageStagingDirectory:(id)a3 databaseScope:(int64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  void *inited;
  const char *v10;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  inited = (void *)objc_msgSend_initInternalWithContainerScopedUserID_orgAdminUserID_packageStagingDirectory_databaseScope_addDatabaseScopeToZoneIDs_pcsManager_(v7, v8, 0, 0, v6, a4, 0, 0);

  objc_msgSend_setOverriddenContainerScopedUserID_(inited, v10, *MEMORY[0x1E0C94A68]);
  return inited;
}

- (BOOL)haveDownloadPreauthorizations
{
  CKDProtocolTranslator *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_downloadPreauthorizationMap != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)downloadPreauthorizationForResponseUUID:(id)a3
{
  id v4;
  CKDProtocolTranslator *v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_objectForKeyedSubscript_(v5->_downloadPreauthorizationMap, v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v7;
}

- (void)setDownloadPreauthorization:(id)a3 forResponseUUID:(id)a4
{
  id v6;
  id v7;
  CKDProtocolTranslator *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *downloadPreauthorizationMap;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_downloadPreauthorizationMap)
  {
    if (v6)
    {
LABEL_3:
      objc_msgSend_setObject_forKeyedSubscript_(v8->_downloadPreauthorizationMap, v9, (uint64_t)v6, v7);
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    downloadPreauthorizationMap = v8->_downloadPreauthorizationMap;
    v8->_downloadPreauthorizationMap = (NSMutableDictionary *)v11;

    if (v6)
      goto LABEL_3;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "Download Preauthorization Failed to Init", v14, 2u);
  }
LABEL_9:
  objc_sync_exit(v8);

}

- (CKDPIdentifier)pUserID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_containerScopedUserID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_User(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDPIdentifier *)v6;
}

- (id)recordIDFromPUserName:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend__isDefaultUserNameFromServer_(self, v6, (uint64_t)v5))
  {
    v7 = (id)*MEMORY[0x1E0C94730];

    v5 = v7;
  }
  if (_CKCheckArgument())
  {
    v8 = objc_alloc(MEMORY[0x1E0C95070]);
    v10 = (void *)objc_msgSend_initWithRecordName_(v8, v9, (uint64_t)v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pIdentifierFromUserRecordID:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_recordName(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    objc_msgSend_containerScopedUserID(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend_CKDPIdentifier_User(v4, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pContainerScopedUserIdentifierFromPUserIdentifier:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromServer_(self, v5, (uint64_t)v4))
  {
    objc_msgSend_containerScopedUserID(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend_CKDPIdentifier_User(v4, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pRecordIdentifierFromUserRecordName:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend__isDefaultUserNameFromClient_(self, v5, (uint64_t)v4))
  {
    objc_msgSend_containerScopedUserID(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend_CKDPIdentifier_Record(v4, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)recordIDFromPRecordIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int isDefaultUserNameFromServer;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char v42;
  int v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  int v53;
  id v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;

  v8 = a3;
  v9 = a4;
  objc_msgSend_defaultRecordZone(MEMORY[0x1E0C95088], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_copy(v15, v16, v17);

  objc_msgSend_zoneIdentifier(v8, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerIdentifier(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v28, (uint64_t)v27);

  if (objc_msgSend_hasZoneIdentifier(v8, v30, v31))
  {
    objc_msgSend_zoneIdentifier(v8, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_value(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_isEqualToString_(v40, v41, *MEMORY[0x1E0C94A30]) ^ 1;

  }
  else
  {
    v42 = 0;
  }
  v43 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v32, v33);
  if (!isDefaultUserNameFromServer || (v42 & 1) != 0 || v43)
  {
    objc_msgSend_zoneIdentifier(v8, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v47, (uint64_t)v46, v9, a5);
    v48 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v48;
    if (!v48)
      goto LABEL_10;
  }
  objc_msgSend_value(v8, v44, v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = _CKCheckArgument();

  if (v53)
  {
    v54 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend_value(v8, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend_initWithRecordName_zoneID_(v54, v61, (uint64_t)v60, v18);

  }
  else
  {
LABEL_10:
    v62 = 0;
  }

  return v62;
}

- (id)recordIDFromPRecordIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)pRecordIdentifierFromRecordID:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_recordName(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromUserRecordName_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v11, (uint64_t)v10);

  objc_msgSend_zoneID(v4, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v17, (uint64_t)v16);

  return v5;
}

- (id)pContainerScopedRecordIdentifierWithPRecordIdentifier:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_value(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v9, (uint64_t)v8);

  objc_msgSend_zoneIdentifier(v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pContainerScopedRecordZoneIdentifierFromFromPRecordZoneIdentifier_(self, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v15, (uint64_t)v14);

  objc_msgSend_zoneIdentifier(v5, v16, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
    v18 = v5;

  return v18;
}

- (id)pContainerScopedRecordZoneIdentifierFromFromPRecordZoneIdentifier:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_value(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v9, (uint64_t)v8);

  objc_msgSend_ownerIdentifier(v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pContainerScopedUserIdentifierFromPUserIdentifier_(self, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOwnerIdentifier_(v5, v18, (uint64_t)v17);

  objc_msgSend_ownerIdentifier(v5, v19, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (objc_msgSend_hasDatabaseType(v4, v22, v23))
    {
      v26 = objc_msgSend_databaseType(v4, v24, v25);
      objc_msgSend_setDatabaseType_(v5, v27, v26);
    }
    v21 = v5;
  }

  return v21;
}

- (id)pShareIdentifierFromRecordID:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_recordName(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_ShareId(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  objc_msgSend_zoneID(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v18, (uint64_t)v17);

  return v5;
}

- (id)recordIDFromPShareIdentifier:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  objc_msgSend_zoneIdentifier(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    && (objc_msgSend_value(v8, v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_name(v17, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = _CKCheckArgument(),
        v20,
        v17,
        v21))
  {
    v22 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend_value(v8, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_initWithRecordName_zoneID_(v22, v29, (uint64_t)v28, v14);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)recordIDFromPShareIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)referenceFromPReference:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_referenceFromPReference_asAnonymousCKUserID_error_, a3);
}

- (id)referenceFromPReference:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_recordIdentifier(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v27;
  if (v14)
  {
    if (objc_msgSend_hasType(v8, v15, v16))
    {
      v20 = objc_msgSend_type(v8, v18, v19);
      v21 = sub_1BEB101D0(v20);
    }
    else
    {
      v21 = 0;
    }
    v24 = objc_alloc(MEMORY[0x1E0C950C0]);
    v23 = (void *)objc_msgSend_initWithRecordID_action_(v24, v25, (uint64_t)v14, v21);
    if (a5)
LABEL_12:
      *a5 = objc_retainAutorelease(v17);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2112;
      v31 = v17;
      _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "Invalid record identifier from server %{public}@: %@", buf, 0x16u);
    }
    v23 = 0;
    if (a5)
      goto LABEL_12;
  }

  return v23;
}

- (id)pReferenceFromReference:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  unsigned int v17;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend_recordID(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromRecordID_(self, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIdentifier_(v6, v12, (uint64_t)v11);

  v15 = objc_msgSend_referenceAction(v5, v13, v14);
  if (*MEMORY[0x1E0C94A40] == v15)
    v17 = 3;
  else
    v17 = 2;
  if (v15 == 1)
    objc_msgSend_setType_(v6, v16, 1);
  else
    objc_msgSend_setType_(v6, v16, v17);
  return v6;
}

- (id)recordFromPRecord:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)recordFromPRecord:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int isEqualToString;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *inited;
  id v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  int hasEncryptedPublicSharingKey;
  const char *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  int v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  void *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  int v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  void *v195;
  const char *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  char v249;
  void *v250;
  const char *v251;
  void *v252;
  id v253;
  const char *v254;
  void *v255;
  const char *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  void *v274;
  id v275;
  const char *v276;
  void *v277;
  const char *v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  void *v286;
  const char *v287;
  const char *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  id v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  void *v297;
  const char *v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t k;
  void *v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  char hasPrefix;
  void *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  void *v326;
  const char *v327;
  const char *v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  void *v332;
  const char *v333;
  const char *v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  id v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t m;
  void *v354;
  void *v355;
  const char *v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  const char *v365;
  void *v366;
  const char *v367;
  const char *v368;
  const char *v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  void *v380;
  const char *v381;
  void *v382;
  NSObject *v383;
  const char *v384;
  uint64_t v385;
  void *v386;
  void *v387;
  NSObject *v388;
  NSObject *v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  void *v396;
  id v397;
  id *v398;
  void *v399;
  uint64_t v400;
  id v401;
  void *v402;
  void *v403;
  CKDProtocolTranslator *v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  _BYTE v421[128];
  uint8_t v422[128];
  uint8_t buf[4];
  void *v424;
  _BYTE v425[128];
  _BYTE v426[128];
  uint64_t v427;

  v427 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_recordIdentifier(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v403 = v9;
  v404 = self;
  objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v13, (uint64_t)v12, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_type(v8, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v400 = *MEMORY[0x1E0C94A20];
    isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x1E0C94A20]);

    if (isEqualToString)
    {
      objc_msgSend_shareInfo(v8, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(v404, v26, (uint64_t)v25, v403, a5);
      inited = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = objc_alloc(MEMORY[0x1E0C95048]);
      objc_msgSend_type(v8, v30, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v25, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      inited = (void *)objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(v29, v35, (uint64_t)v34, v14);

    }
    if (!inited)
      goto LABEL_121;
    if (objc_msgSend_hasStableUrl(v8, v36, v37))
    {
      objc_msgSend_stableUrl(v8, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_hasRoutingKey(v40, v41, v42) & 1) != 0)
      {
        objc_msgSend_stableUrl(v8, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_routingKey(v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRoutingKey_(inited, v49, (uint64_t)v48);

      }
      else
      {
        objc_msgSend_setRoutingKey_(inited, v43, 0);
      }

      objc_msgSend_stableUrl(v8, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      hasEncryptedPublicSharingKey = objc_msgSend_hasEncryptedPublicSharingKey(v52, v53, v54);

      if (hasEncryptedPublicSharingKey)
      {
        v58 = objc_alloc(MEMORY[0x1E0C94D18]);
        objc_msgSend_stableUrl(v8, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encryptedPublicSharingKey(v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend_initWithEncryptedData_(v58, v65, (uint64_t)v64);
        objc_msgSend_setMutableEncryptedPSK_(inited, v67, (uint64_t)v66);

      }
      objc_msgSend_stableUrl(v8, v56, v57);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_displayedHostname(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDisplayedHostname_(inited, v72, (uint64_t)v71);

    }
    v401 = v8;
    v402 = inited;
    v399 = v14;
    if (objc_msgSend_hasOneTimeStableUrlInfo(v8, v38, v39))
    {
      objc_msgSend_recordID(inited, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_isEqualToString_(v78, v79, *MEMORY[0x1E0C949F0]);

      if (v80)
      {
        v398 = a5;
        v397 = inited;
        v81 = (void *)objc_opt_new();
        v417 = 0u;
        v418 = 0u;
        v419 = 0u;
        v420 = 0u;
        objc_msgSend_oneTimeStableUrlInfo(v8, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_oneTimeUrls(v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v417, v426, 16);
        if (v89)
        {
          v92 = v89;
          v93 = *(_QWORD *)v418;
          do
          {
            for (i = 0; i != v92; ++i)
            {
              if (*(_QWORD *)v418 != v93)
                objc_enumerationMutation(v87);
              v95 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * i);
              if (objc_msgSend_hasEncryptedFullTokenInfo(v95, v90, v91, v397)
                && objc_msgSend_participantIdsCount(v95, v90, v91))
              {
                v96 = objc_alloc(MEMORY[0x1E0C94D18]);
                objc_msgSend_encryptedFullTokenInfo(v95, v97, v98);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = (void *)objc_msgSend_initWithEncryptedData_(v96, v100, (uint64_t)v99);

                v102 = objc_alloc(MEMORY[0x1E0C94F68]);
                objc_msgSend_participantIds(v95, v103, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstObject(v105, v106, v107);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v110 = (void *)objc_msgSend_initWithEncryptedOneTimeFullToken_participantID_(v102, v109, (uint64_t)v101, v108);

                objc_msgSend_participantIds(v95, v111, v112);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstObject(v113, v114, v115);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v81, v117, (uint64_t)v110, v116);

              }
            }
            v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v417, v426, 16);
          }
          while (v92);
        }

        v121 = v397;
        if (objc_msgSend_count(v81, v118, v119))
        {
          objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v397, v120, (uint64_t)v81);
          v415 = 0u;
          v416 = 0u;
          v413 = 0u;
          v414 = 0u;
          objc_msgSend_allParticipants(v397, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v413, v425, 16);
          if (v126)
          {
            v129 = v126;
            v130 = *(_QWORD *)v414;
            do
            {
              for (j = 0; j != v129; ++j)
              {
                if (*(_QWORD *)v414 != v130)
                  objc_enumerationMutation(v124);
                v132 = *(void **)(*((_QWORD *)&v413 + 1) + 8 * j);
                objc_msgSend_allKeys(v81, v127, v128, v397);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_participantID(v132, v134, v135);
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = objc_msgSend_containsObject_(v133, v137, (uint64_t)v136);

                if (v138)
                  objc_msgSend_setUsesOneTimeURL_(v132, v127, 1);
              }
              v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v127, (uint64_t)&v413, v425, 16);
            }
            while (v129);
          }

        }
        v8 = v401;
        inited = v402;
        a5 = v398;
        v14 = v399;
      }
    }
    objc_msgSend_etag(v8, v73, v74, v397);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(inited, v140, (uint64_t)v139);

    if (objc_msgSend_hasTimeStatistics(v8, v141, v142))
    {
      objc_msgSend_timeStatistics(v8, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_hasCreation(v145, v146, v147) & 1) != 0)
      {
        v150 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend_timeStatistics(v8, v148, v149);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_creation(v151, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v154, v155, v156);
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v150, v157, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCreationDate_(inited, v160, (uint64_t)v159);

      }
      else
      {
        objc_msgSend_setCreationDate_(inited, v148, 0);
      }

      objc_msgSend_timeStatistics(v8, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_hasModification(v163, v164, v165) & 1) != 0)
      {
        v168 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend_timeStatistics(v8, v166, v167);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_modification(v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v172, v173, v174);
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v168, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setModificationDate_(inited, v178, (uint64_t)v177);

      }
      else
      {
        objc_msgSend_setModificationDate_(inited, v166, 0);
      }

    }
    if (objc_msgSend_hasCreatedBy(v8, v143, v144))
    {
      objc_msgSend_createdBy(v8, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v181, v182, v183);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPUserName_error_(v404, v185, (uint64_t)v184, 0);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCreatorUserRecordID_(inited, v187, (uint64_t)v186);

    }
    if (objc_msgSend_hasModifiedBy(v8, v179, v180))
    {
      objc_msgSend_modifiedBy(v8, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v190, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPUserName_error_(v404, v194, (uint64_t)v193, 0);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastModifiedUserRecordID_(inited, v196, (uint64_t)v195);

    }
    if (objc_msgSend_hasModifiedByDevice(v8, v188, v189))
    {
      objc_msgSend_modifiedByDevice(v8, v197, v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModifiedByDevice_(inited, v200, (uint64_t)v199);

    }
    if (objc_msgSend_hasExpirationTime(v8, v197, v198))
    {
      v203 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_expirationTime(v8, v201, v202);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_time(v204, v205, v206);
      objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v203, v207, v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpirationDate_(inited, v210, (uint64_t)v209);

    }
    if (objc_msgSend_hasExpired(v8, v201, v202))
    {
      v213 = objc_msgSend_expired(v8, v211, v212);
      objc_msgSend_setExpired_(inited, v214, v213);
    }
    if (objc_msgSend_hasProtectionInfo(v8, v211, v212))
    {
      objc_msgSend_protectionInfo(v8, v215, v216);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfo(v217, v218, v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = objc_msgSend_length(v220, v221, v222);

      if (v223)
      {
        objc_msgSend_protectionInfo(v8, v215, v216);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionInfo(v224, v225, v226);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionData_(inited, v228, (uint64_t)v227);

        objc_msgSend_protectionInfo(v8, v229, v230);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionInfoTag(v231, v232, v233);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionEtag_(inited, v235, (uint64_t)v234);

      }
    }
    if (objc_msgSend_hasZoneishPrimaryKeyId(v8, v215, v216))
    {
      objc_msgSend_zoneishPrimaryKeyId(v8, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishKeyID_(inited, v239, (uint64_t)v238);

    }
    objc_msgSend_setTrackChanges_(inited, v236, 0);
    if (!objc_msgSend_hasShareId(v8, v240, v241))
      goto LABEL_66;
    objc_msgSend_type(v8, v242, v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v244, v245, v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = objc_msgSend_isEqualToString_(v247, v248, v400);

    if ((v249 & 1) != 0)
      goto LABEL_66;
    objc_msgSend_shareId(v8, v242, v243);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(v404, v251, (uint64_t)v250, v403, a5);
    v252 = (void *)objc_claimAutoreleasedReturnValue();

    if (v252)
    {
      v253 = objc_alloc(MEMORY[0x1E0C950C0]);
      v255 = (void *)objc_msgSend_initWithRecordID_action_(v253, v254, (uint64_t)v252, 0);
      objc_msgSend_setShare_(inited, v256, (uint64_t)v255);

      objc_msgSend_share(inited, v257, v258);
      v259 = (void *)objc_claimAutoreleasedReturnValue();

      if (v259)
      {

LABEL_66:
        if (!objc_msgSend_hasChainParent(v8, v242, v243))
        {
LABEL_73:
          objc_msgSend_tombstonedPublicKeyIDs(v8, v260, v261);
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTombstonedPublicKeyIDs_(inited, v287, (uint64_t)v286);

          if (objc_msgSend_hasChainPrivateKey(v8, v288, v289))
          {
            v292 = objc_alloc(MEMORY[0x1E0C94D18]);
            objc_msgSend_chainPrivateKey(v8, v293, v294);
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            v297 = (void *)objc_msgSend_initWithEncryptedData_(v292, v296, (uint64_t)v295);
            objc_msgSend_setChainPrivateKey_(inited, v298, (uint64_t)v297);

          }
          if (objc_msgSend_hasChainProtectionInfo(v8, v290, v291))
          {
            objc_msgSend_chainProtectionInfo(v8, v299, v300);
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_protectionInfo(v301, v302, v303);
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setChainProtectionInfo_(inited, v305, (uint64_t)v304);

          }
          v411 = 0u;
          v412 = 0u;
          v409 = 0u;
          v410 = 0u;
          objc_msgSend_fields(v8, v299, v300);
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v307, (uint64_t)&v409, v422, 16);
          if (v308)
          {
            v311 = v308;
            v312 = *(_QWORD *)v410;
            do
            {
              for (k = 0; k != v311; ++k)
              {
                if (*(_QWORD *)v410 != v312)
                  objc_enumerationMutation(v306);
                v314 = *(void **)(*((_QWORD *)&v409 + 1) + 8 * k);
                objc_msgSend_identifier(v314, v309, v310);
                v315 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_name(v315, v316, v317);
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                hasPrefix = objc_msgSend_hasPrefix_(v318, v319, (uint64_t)CFSTR("_"));

                if ((hasPrefix & 1) == 0)
                {
                  objc_msgSend_identifier(v314, v309, v310);
                  v321 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_name(v321, v322, v323);
                  v324 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_objectRepresentationFromField_inRecord_asAnonymousCKUserID_(v404, v325, (uint64_t)v314, v8, v403);
                  v326 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend_objectIsAnEncryptedType_(v404, v327, (uint64_t)v326) & 1) != 0
                    || objc_msgSend__valueTypeIsAnEncryptedBytesTypeForField_(v404, v328, (uint64_t)v314))
                  {
                    objc_msgSend_encryptedValueStore(v402, v328, v329);
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend_valueStore(v402, v328, v329);
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v332 = v330;
                  objc_msgSend_setObjectNoValidate_forKey_(v330, v331, (uint64_t)v326, v324);

                  v8 = v401;
                }
              }
              v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v309, (uint64_t)&v409, v422, 16);
            }
            while (v311);
          }

          inited = v402;
          objc_msgSend_setTrackChanges_(v402, v333, 1);
          if (objc_msgSend_pluginFieldsCount(v8, v334, v335))
          {
            v338 = objc_alloc(MEMORY[0x1E0C99E08]);
            v341 = objc_msgSend_pluginFieldsCount(v8, v339, v340);
            v343 = (void *)objc_msgSend_initWithCapacity_(v338, v342, v341);
            v405 = 0u;
            v406 = 0u;
            v407 = 0u;
            v408 = 0u;
            objc_msgSend_pluginFields(v8, v344, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v346, v347, (uint64_t)&v405, v421, 16);
            if (v348)
            {
              v351 = v348;
              v352 = *(_QWORD *)v406;
              do
              {
                for (m = 0; m != v351; ++m)
                {
                  if (*(_QWORD *)v406 != v352)
                    objc_enumerationMutation(v346);
                  v354 = *(void **)(*((_QWORD *)&v405 + 1) + 8 * m);
                  objc_msgSend_value(v354, v349, v350);
                  v355 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectRepresentationFromFieldValue_(v404, v356, (uint64_t)v355);
                  v357 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_identifier(v354, v358, v359);
                  v360 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_name(v360, v361, v362);
                  v363 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v343, v364, (uint64_t)v357, v363);

                }
                v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v346, v349, (uint64_t)&v405, v421, 16);
              }
              while (v351);
            }

            inited = v402;
            objc_msgSend_setPluginFields_(v402, v365, (uint64_t)v343);

          }
          objc_msgSend_conflictLoserEtags(v8, v336, v337);
          v366 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setConflictLoserEtags_(inited, v367, (uint64_t)v366);

          objc_msgSend_setKnownToServer_(inited, v368, 1);
          if (objc_msgSend_hasPermission(v8, v369, v370))
          {
            if (objc_msgSend_permission(v8, v371, v372) == 1)
              v373 = 2;
            else
              v373 = 1;
          }
          else
          {
            v373 = 0;
          }
          v14 = v399;
          objc_msgSend_setPermission_(inited, v371, v373);
          if (objc_msgSend_hasProtectionInfoKeysToRemove(v8, v374, v375))
          {
            objc_msgSend_protectionInfoKeysToRemove(v8, v376, v377);
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(v404, v379, (uint64_t)v378);
            v380 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPcsKeysToRemove_(inited, v381, (uint64_t)v380);

          }
          v28 = inited;
          goto LABEL_122;
        }
        objc_msgSend_chainParent(v8, v260, v261);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_hasReference(v252, v262, v263))
        {
LABEL_70:
          if (objc_msgSend_hasPublicKeyID(v252, v264, v265))
          {
            objc_msgSend_publicKeyID(v252, v282, v283);
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setChainParentPublicKeyID_(inited, v285, (uint64_t)v284);

          }
          goto LABEL_73;
        }
        objc_msgSend_chainParent(v8, v264, v265);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_reference(v266, v267, v268);
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordIdentifier(v269, v270, v271);
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v404, v273, (uint64_t)v272, v403, a5);
        v274 = (void *)objc_claimAutoreleasedReturnValue();

        v275 = objc_alloc(MEMORY[0x1E0C950C0]);
        v277 = (void *)objc_msgSend_initWithRecordID_action_(v275, v276, (uint64_t)v274, 0);
        objc_msgSend_setParent_(inited, v278, (uint64_t)v277);

        objc_msgSend_parent(inited, v279, v280);
        v281 = (void *)objc_claimAutoreleasedReturnValue();

        if (v281)
        {

          goto LABEL_70;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v387 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v390 = v387;
          objc_msgSend_chainParent(v8, v391, v392);
          v393 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_reference(v393, v394, v395);
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v424 = v396;
          _os_log_debug_impl(&dword_1BE990000, v390, OS_LOG_TYPE_DEBUG, "Couldn't convert parent record ID: %{public}@", buf, 0xCu);

        }
        goto LABEL_120;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v388 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v424 = v252;
        _os_log_debug_impl(&dword_1BE990000, v388, OS_LOG_TYPE_DEBUG, "Couldn't create a share reference for share %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v382 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v383 = v382;
        objc_msgSend_shareId(v8, v384, v385);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v424 = v386;
        _os_log_debug_impl(&dword_1BE990000, v383, OS_LOG_TYPE_DEBUG, "Couldn't convert share ID for record: %{public}@", buf, 0xCu);

      }
    }
LABEL_120:

LABEL_121:
    v28 = 0;
LABEL_122:

    goto LABEL_123;
  }
  v28 = 0;
LABEL_123:

  return v28;
}

- (id)pProtectionInfoKeysToRemoveFromPCSKeysToRemove:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_etag(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtectionInfoTag_(v4, v8, (uint64_t)v7);

  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_keys(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v12, v13, v14);
  objc_msgSend_arrayWithCapacity_(v9, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeysToRemoves_(v4, v18, (uint64_t)v17);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend_keys(v3, v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v42, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v26);
        v28 = (void *)objc_opt_new();
        objc_msgSend_pcsKeyID(v27, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKeyId_(v28, v32, (uint64_t)v31);

        v35 = objc_msgSend_keyType(v27, v33, v34);
        if ((unint64_t)(v35 - 1) <= 2)
          objc_msgSend_setKeyType_(v28, v36, v35);
        objc_msgSend_keysToRemoves(v4, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v38, v39, (uint64_t)v28);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v40, (uint64_t)&v42, v46, 16);
    }
    while (v24);
  }

  return v4;
}

- (id)pcsKeysToRemoveFromPProtectionInfoKeysToRemove:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_once_t *v24;
  os_log_t *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  id v42;
  const char *v43;
  void *v44;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_hasProtectionInfoTag(v3, v4, v5))
  {
    objc_msgSend_protectionInfoTag(v3, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v46 = (void *)v8;
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = objc_msgSend_keysToRemovesCount(v3, v10, v11);
  v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v47 = v3;
  objc_msgSend_keysToRemoves(v3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v54, 16);
  if (v19)
  {
    v22 = v19;
    v23 = *(_QWORD *)v49;
    v24 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v25 = (os_log_t *)MEMORY[0x1E0C952B0];
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v49 != v23)
          objc_enumerationMutation(v17);
        v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v26);
        if (objc_msgSend_hasKeyId(v27, v20, v21, v46)
          && objc_msgSend_hasKeyType(v27, v28, v29))
        {
          v32 = objc_msgSend_keyType(v27, v30, v31) - 1;
          if (v32 < 3)
            v33 = v32 + 1;
          else
            v33 = 0;
          v34 = objc_alloc(MEMORY[0x1E0C94FB8]);
          objc_msgSend_keyId(v27, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend_initWithKeyID_keyType_(v34, v38, (uint64_t)v37, v33);

          objc_msgSend_addObject_(v14, v40, (uint64_t)v39);
        }
        else
        {
          if (*v24 != -1)
            dispatch_once(v24, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v41 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v53 = v27;
            _os_log_impl(&dword_1BE990000, v41, OS_LOG_TYPE_INFO, "Warn: Ignoring PCS key to remove because key type and/or key ID is not specified: %{public}@", buf, 0xCu);
          }
        }
        ++v26;
      }
      while (v22 != v26);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v48, v54, 16);
    }
    while (v22);
  }

  v42 = objc_alloc(MEMORY[0x1E0C94FC0]);
  v44 = (void *)objc_msgSend_initWithEtag_keys_(v42, v43, (uint64_t)v46, v14);

  return v44;
}

- (BOOL)_valueTypeIsAnEncryptedBytesTypeForField:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend_value(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v6, v7, v8) == 20)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend_value(v3, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_type(v12, v13, v14) == 21;

  }
  return v11;
}

- (id)_pRecordFromRecordSansValues:(id)a3 forCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  double v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t isExpired;
  const char *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  const char *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  id v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t i;
  uint64_t v199;
  void *v200;
  const char *v201;
  void *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  const char *v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  id v264;
  const char *v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  void *v272;
  const char *v273;
  void *v274;
  id v275;
  const char *v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  void *v288;
  NSObject *v289;
  const char *v290;
  uint64_t v291;
  void *v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  const char *v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  const char *v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  const char *v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  const char *v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  void *v371;
  CKDProtocolTranslator *v372;
  _BOOL4 v373;
  id v374;
  void *v375;
  id obj;
  id v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  uint8_t buf[4];
  void *v383;
  void *v384;
  _BYTE v385[128];
  uint64_t v386;

  v4 = a4;
  v386 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_etag(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEtag_(v7, v11, (uint64_t)v10);

  objc_msgSend_recordID(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromRecordID_(self, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIdentifier_(v7, v17, (uint64_t)v16);

  v18 = (void *)objc_opt_new();
  objc_msgSend_setType_(v7, v19, (uint64_t)v18);

  objc_msgSend_recordType(v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(v7, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v25, v26, (uint64_t)v22);

  objc_msgSend_conflictLoserEtags(v6, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend_mutableCopy(v29, v30, v31);
  objc_msgSend_setConflictLoserEtags_(v7, v33, (uint64_t)v32);

  if (!v4)
    goto LABEL_19;
  objc_msgSend_creationDate(v6, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {

LABEL_5:
    v42 = (void *)objc_opt_new();
    objc_msgSend_setTimeStatistics_(v7, v43, (uint64_t)v42);

    goto LABEL_6;
  }
  objc_msgSend_modificationDate(v6, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    goto LABEL_5;
LABEL_6:
  objc_msgSend_creationDate(v6, v40, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v47 = (void *)objc_opt_new();
    objc_msgSend_timeStatistics(v7, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreation_(v50, v51, (uint64_t)v47);

    objc_msgSend_creationDate(v6, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v54, v55, v56);
    v58 = v57;
    objc_msgSend_timeStatistics(v7, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_creation(v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTime_(v64, v65, v66, v58);

  }
  objc_msgSend_modificationDate(v6, v45, v46);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v70 = (void *)objc_opt_new();
    objc_msgSend_timeStatistics(v7, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModification_(v73, v74, (uint64_t)v70);

    objc_msgSend_modificationDate(v6, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v77, v78, v79);
    v81 = v80;
    objc_msgSend_timeStatistics(v7, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modification(v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTime_(v87, v88, v89, v81);

  }
  objc_msgSend_creatorUserRecordID(v6, v68, v69);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend_creatorUserRecordID(v6, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pIdentifierFromUserRecordID_(self, v94, (uint64_t)v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatedBy_(v7, v96, (uint64_t)v95);

  }
  objc_msgSend_lastModifiedUserRecordID(v6, v91, v92);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend_lastModifiedUserRecordID(v6, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pIdentifierFromUserRecordID_(self, v101, (uint64_t)v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModifiedBy_(v7, v103, (uint64_t)v102);

  }
  objc_msgSend_modifiedByDevice(v6, v98, v99);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend_modifiedByDevice(v6, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModifiedByDevice_(v7, v108, (uint64_t)v107);

  }
  objc_msgSend_expirationDate(v6, v105, v106);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    v112 = (void *)objc_opt_new();
    objc_msgSend_setExpirationTime_(v7, v113, (uint64_t)v112);

    objc_msgSend_expirationDate(v6, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v116, v117, v118);
    v120 = v119;
    objc_msgSend_expirationTime(v7, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTime_(v123, v124, v125, v120);

  }
  isExpired = objc_msgSend_isExpired(v6, v110, v111);
  objc_msgSend_setExpired_(v7, v127, isExpired);
LABEL_19:
  objc_msgSend_protectionData(v6, v34, v35);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
  {
    v131 = (void *)objc_opt_new();
    objc_msgSend_setProtectionInfo_(v7, v132, (uint64_t)v131);

    objc_msgSend_protectionData(v6, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v7, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v138, v139, (uint64_t)v135);

    objc_msgSend_protectionEtag(v6, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v7, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoTag_(v145, v146, (uint64_t)v142);

  }
  objc_msgSend_zoneishKeyID(v6, v129, v130);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  if (v147)
  {
    objc_msgSend_zoneishKeyID(v6, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishPrimaryKeyId_(v7, v151, (uint64_t)v150);

    objc_msgSend_setProtectionInfo_(v7, v152, 0);
  }
  objc_msgSend_share(v6, v148, v149);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (v153)
  {
    objc_msgSend_share(v6, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v156, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pShareIdentifierFromRecordID_(self, v160, (uint64_t)v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareId_(v7, v162, (uint64_t)v161);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v165 = v6;
    objc_msgSend_currentUserParticipant(v165, v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v168;
    if (v4)
    {
      objc_msgSend_pShareFromShare_forCache_(self, v169, (uint64_t)v165, 1);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setShareInfo_(v7, v173, (uint64_t)v172);

    }
    else
    {
      if (objc_msgSend_role(v168, v169, v170) == 1 || objc_msgSend_role(v171, v176, v177) == 2)
      {
        objc_msgSend_pShareFromShare_forCache_(self, v176, (uint64_t)v165, 0);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareInfo_(v7, v180, (uint64_t)v179);

      }
      if (!objc_msgSend_isZoneWideShare(v165, v176, v178))
        goto LABEL_43;
      objc_msgSend_oneTimeURLMetadatasByParticipantID(v165, v181, v182);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = objc_msgSend_count(v183, v184, v185);

      if (!v186)
        goto LABEL_43;
    }
    v372 = self;
    v373 = v4;
    v374 = v6;
    if ((objc_msgSend_hasOneTimeStableUrlInfo(v7, v174, v175) & 1) == 0)
    {
      v187 = (void *)objc_opt_new();
      objc_msgSend_setOneTimeStableUrlInfo_(v7, v188, (uint64_t)v187);

    }
    v371 = v171;
    v375 = v7;
    v189 = (void *)objc_opt_new();
    v378 = 0u;
    v379 = 0u;
    v380 = 0u;
    v381 = 0u;
    objc_msgSend_oneTimeURLMetadatasByParticipantID(v165, v190, v191);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v192, (uint64_t)&v378, v385, 16);
    if (v193)
    {
      v196 = v193;
      v197 = *(_QWORD *)v379;
      do
      {
        for (i = 0; i != v196; ++i)
        {
          if (*(_QWORD *)v379 != v197)
            objc_enumerationMutation(obj);
          v199 = *(_QWORD *)(*((_QWORD *)&v378 + 1) + 8 * i);
          objc_msgSend_oneTimeURLMetadatasByParticipantID(v165, v194, v195);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v200, v201, v199);
          v202 = (void *)objc_claimAutoreleasedReturnValue();

          v203 = (void *)objc_opt_new();
          objc_msgSend_encryptedOneTimeFullToken(v202, v204, v205);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encryptedData(v206, v207, v208);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEncryptedFullTokenInfo_(v203, v210, (uint64_t)v209);

          objc_msgSend_participantID(v202, v211, v212);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v384 = v213;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v214, (uint64_t)&v384, 1);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = (void *)objc_msgSend_mutableCopy(v215, v216, v217);
          objc_msgSend_setParticipantIds_(v203, v219, (uint64_t)v218);

          objc_msgSend_encryptedOneTimeFullTokenData(v202, v220, v221);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectedFullToken_(v203, v223, (uint64_t)v222);

          objc_msgSend_oneTimeShortSharingTokenHashData(v202, v224, v225);
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setShortTokenHash_(v203, v227, (uint64_t)v226);

          objc_msgSend_addObject_(v189, v228, (uint64_t)v203);
        }
        v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v194, (uint64_t)&v378, v385, 16);
      }
      while (v196);
    }

    v7 = v375;
    objc_msgSend_oneTimeStableUrlInfo(v375, v229, v230);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOneTimeUrls_(v231, v232, (uint64_t)v189);

    v6 = v374;
    v4 = v373;
    v171 = v371;
    self = v372;
LABEL_43:

  }
  objc_msgSend_chainPrivateKey(v6, v163, v164);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedData(v233, v234, v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();

  if (v236)
  {
    objc_msgSend_chainPrivateKey(v6, v237, v238);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedData(v239, v240, v241);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChainPrivateKey_(v7, v243, (uint64_t)v242);

  }
  objc_msgSend_chainProtectionInfo(v6, v237, v238);
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  if (v244)
  {
    v247 = (void *)objc_opt_new();
    objc_msgSend_setChainProtectionInfo_(v7, v248, (uint64_t)v247);

    objc_msgSend_chainProtectionInfo(v6, v249, v250);
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chainProtectionInfo(v7, v252, v253);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v254, v255, (uint64_t)v251);

  }
  if ((objc_msgSend_hasUpdatedParent(v6, v245, v246) & 1) != 0 || v4)
  {
    v258 = (void *)objc_opt_new();
    objc_msgSend_setChainParent_(v7, v259, (uint64_t)v258);

    objc_msgSend_parent(v6, v260, v261);
    v262 = (void *)objc_claimAutoreleasedReturnValue();

    if (v262)
    {
      if (objc_msgSend_dontCreateValidatingParentReferences(self, v256, v257))
        v263 = 0;
      else
        v263 = *MEMORY[0x1E0C94A40];
      v264 = objc_alloc(MEMORY[0x1E0C950C0]);
      objc_msgSend_parent(v6, v265, v266);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = (void *)objc_msgSend_initWithRecordID_action_(v264, v271, (uint64_t)v270, v263);

      v377 = 0;
      objc_msgSend_pReferenceFromReference_error_(self, v273, (uint64_t)v272, &v377);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v275 = v377;
      objc_msgSend_chainParent(v7, v276, v277);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReference_(v278, v279, (uint64_t)v274);

      objc_msgSend_chainParent(v7, v280, v281);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_reference(v282, v283, v284);
      v285 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v285 || v275)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v288 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v289 = v288;
          objc_msgSend_recordID(v6, v290, v291);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v383 = v292;
          _os_log_impl(&dword_1BE990000, v289, OS_LOG_TYPE_INFO, "Warn: Couldn't create a parent reference for record %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend_chainParentPublicKeyID(v6, v286, v287);
      v293 = (void *)objc_claimAutoreleasedReturnValue();

      if (v293)
      {
        objc_msgSend_chainParentPublicKeyID(v6, v294, v295);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_chainParent(v7, v297, v298);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPublicKeyID_(v299, v300, (uint64_t)v296);

      }
    }
  }
  if (v4)
  {
    objc_msgSend_tombstonedPublicKeyIDs(v6, v256, v257);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = (void *)objc_msgSend_mutableCopy(v301, v302, v303);
    objc_msgSend_setTombstonedPublicKeyIDs_(v7, v305, (uint64_t)v304);

  }
  if (objc_msgSend_hasUpdatedExpirationTimeInterval(v6, v256, v257))
  {
    v308 = (void *)objc_opt_new();
    objc_msgSend_setStorageExpiration_(v7, v309, (uint64_t)v308);

    objc_msgSend_updatedExpirationTimeInterval(v6, v310, v311);
    v312 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_storageExpiration(v7, v313, v314);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = v315;
    if (v312)
    {
      objc_msgSend_setOperationType_(v315, v316, 2);

      objc_msgSend_updatedExpirationTimeInterval(v6, v318, v319);
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      v322 = objc_msgSend_unsignedLongLongValue(v317, v320, v321);
      objc_msgSend_storageExpiration(v7, v323, v324);
      v325 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDuration_(v325, v326, v322);

    }
    else
    {
      objc_msgSend_setOperationType_(v315, v316, 1);
    }

  }
  if (v4
    || objc_msgSend_canHostServerURLInfo(v6, v306, v307)
    && (objc_msgSend_shortSharingTokenHashData(v6, v327, v328),
        v329 = (void *)objc_claimAutoreleasedReturnValue(),
        v329,
        v329))
  {
    if ((objc_msgSend_hasStableUrl(v7, v306, v307) & 1) == 0)
    {
      v332 = (void *)objc_opt_new();
      objc_msgSend_setStableUrl_(v7, v333, (uint64_t)v332);

    }
    objc_msgSend_mutableEncryptedPSK(v6, v330, v331);
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedData(v334, v335, v336);
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stableUrl(v7, v338, v339);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEncryptedPublicSharingKey_(v340, v341, (uint64_t)v337);

    objc_msgSend_encryptedFullTokenData(v6, v342, v343);
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stableUrl(v7, v345, v346);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectedFullToken_(v347, v348, (uint64_t)v344);

    objc_msgSend_routingKey(v6, v349, v350);
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stableUrl(v7, v352, v353);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoutingKey_(v354, v355, (uint64_t)v351);

    objc_msgSend_shortSharingTokenHashData(v6, v356, v357);
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stableUrl(v7, v359, v360);
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShortTokenHash_(v361, v362, (uint64_t)v358);

    objc_msgSend_displayedHostname(v6, v363, v364);
    v365 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stableUrl(v7, v366, v367);
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(v368, v369, (uint64_t)v365);

  }
  return v7;
}

- (id)pRecordFromRecord:(id)a3 forCache:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  int v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  id obj;
  id obja;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v4 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  objc_msgSend__pRecordFromRecordSansValues_forCache_(self, v6, (uint64_t)v82, v4);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  objc_msgSend_valueStore(v82, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v91, v97, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v92;
    obj = v12;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v92 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v19);
        objc_msgSend_valueStore(v82, v15, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v21, v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_pFieldWithKey_value_forCache_(self, v24, v20, v23, v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_actions(v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_count(v28, v29, v30);
        if (v14)
          v32 = 1;
        else
          v32 = v31 == 0;
        v33 = !v32;

        if (v33)
          v14 = (void *)objc_opt_new();
        sub_1BEC4831C(v81, v25, v14);

        ++v19;
      }
      while (v17 != v19);
      v12 = obj;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v91, v97, 16);
    }
    while (v17);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend_encryptedValueStore(v82, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v36, v37, v38);
  obja = (id)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v87, v96, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v88;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v88 != v43)
          objc_enumerationMutation(obja);
        v45 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v44);
        objc_msgSend_encryptedValueStore(v82, v40, v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v46, v47, v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_pFieldWithKey_value_forCache_(self, v49, v45, v48, v4);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_actions(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend_count(v53, v54, v55);
        if (v14)
          v57 = 1;
        else
          v57 = v56 == 0;
        v58 = !v57;

        if (v58)
          v14 = (void *)objc_opt_new();
        sub_1BEC4831C(v81, v50, v14);

        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v40, (uint64_t)&v87, v96, 16);
    }
    while (v42);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_pluginFields(v82, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v83, v95, 16);
  if (v68)
  {
    v69 = *(_QWORD *)v84;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v84 != v69)
          objc_enumerationMutation(v64);
        v71 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v70);
        objc_msgSend_pluginFields(v82, v66, v67);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v72, v73, v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_pFieldWithKey_value_forCache_(self, v75, v71, v74, v4);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPluginFields_(v81, v77, (uint64_t)v76);

        ++v70;
      }
      while (v68 != v70);
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v83, v95, 16);
    }
    while (v68);
  }

  return v81;
}

- (id)pRecordFromRecord:(id)a3
{
  return (id)objc_msgSend_pRecordFromRecord_forCache_(self, a2, (uint64_t)a3, 0);
}

- (id)deltaPRecordFromRecord:(id)a3 withAllFields:(BOOL)a4 outDeletedMergeFields:(id *)a5 outKeysToSend:(id *)a6
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  BOOL v75;
  int v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  BOOL v96;
  int v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t k;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  id v123;
  id *v125;
  id v127;
  id v128;
  id obj;
  id obja;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v125 = a5;
  v6 = a4;
  v148 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v131 = (id)objc_opt_new();
  objc_msgSend__pRecordFromRecordSansValues_forCache_(self, v9, (uint64_t)v8, 0);
  v132 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueStore(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changedKeys(v12, v13, v14);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_encryptedValueStore(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changedKeys(v17, v18, v19);
  v127 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v20, (uint64_t)obj);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    if (v21)
    {
      v25 = v21;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v22, v23);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v25;

    objc_msgSend_valueStore(v8, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v33;
    v36 = MEMORY[0x1E0C9AA60];
    if (v33)
      objc_msgSend_addObjectsFromArray_(v27, v34, v33, v125);
    else
      objc_msgSend_addObjectsFromArray_(v27, v34, MEMORY[0x1E0C9AA60], v125);

    objc_msgSend_allObjects(v27, v37, v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v39, (uint64_t)v127);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v40;
    if (v40)
    {
      v44 = v40;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v41, v42);
      v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    v45 = v44;

    objc_msgSend_encryptedValueStore(v8, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v48, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v51;
    if (v51)
      objc_msgSend_addObjectsFromArray_(v45, v52, v51);
    else
      objc_msgSend_addObjectsFromArray_(v45, v52, v36);

    objc_msgSend_allObjects(v45, v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();

    v127 = (id)v56;
  }
  else
  {
    v26 = obj;
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  obja = v26;
  v58 = 0;
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v57, (uint64_t)&v141, v147, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v142 != v62)
          objc_enumerationMutation(obja);
        v64 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i);
        objc_msgSend_valueStore(v8, v59, v60, v125);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v65, v66, v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          objc_msgSend_pFieldWithKey_value_forCache_(self, v68, v64, v67, 0);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_actions(v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v72, v73, v74))
            v75 = v58 == 0;
          else
            v75 = 0;
          v76 = v75;

          if (v76)
            v58 = (void *)objc_opt_new();
          sub_1BEC4831C(v132, v69, v58);
        }
        else
        {
          v69 = (void *)objc_opt_new();
          objc_msgSend_setName_(v69, v77, v64);
          objc_msgSend_addObject_(v131, v78, (uint64_t)v69);
        }

      }
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v59, (uint64_t)&v141, v147, 16);
    }
    while (v61);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v128 = v127;
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v79, (uint64_t)&v137, v146, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v82; ++j)
      {
        if (*(_QWORD *)v138 != v83)
          objc_enumerationMutation(v128);
        v85 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * j);
        objc_msgSend_encryptedValueStore(v8, v80, v81, v125);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawValueForKey_(v86, v87, v85);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          objc_msgSend_pFieldWithKey_value_forCache_(self, v89, v85, v88, 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_actions(v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v93, v94, v95))
            v96 = v58 == 0;
          else
            v96 = 0;
          v97 = v96;

          if (v97)
            v58 = (void *)objc_opt_new();
          sub_1BEC4831C(v132, v90, v58);
        }
        else
        {
          v90 = (void *)objc_opt_new();
          objc_msgSend_setName_(v90, v98, v85);
          objc_msgSend_addObject_(v131, v99, (uint64_t)v90);
        }

      }
      v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v80, (uint64_t)&v137, v146, 16);
    }
    while (v82);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  objc_msgSend_pluginFields(v8, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v106, (uint64_t)&v133, v145, 16);
  if (v109)
  {
    v110 = *(_QWORD *)v134;
    do
    {
      for (k = 0; k != v109; ++k)
      {
        if (*(_QWORD *)v134 != v110)
          objc_enumerationMutation(v105);
        v112 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * k);
        objc_msgSend_pluginFields(v8, v107, v108, v125);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v113, v114, v112);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_pFieldWithKey_value_forCache_(self, v116, v112, v115, 0);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPluginFields_(v132, v118, (uint64_t)v117);

      }
      v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v107, (uint64_t)&v133, v145, 16);
    }
    while (v109);
  }

  if (v125 && objc_msgSend_count(v131, v119, v120))
    *v125 = objc_retainAutorelease(v131);
  if (a6)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v119, (uint64_t)obja);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v121, v122, (uint64_t)v128);
    v123 = objc_retainAutorelease(v121);
    *a6 = v123;

  }
  return v132;
}

- (id)assetFromPAsset:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *inited;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C94BB8]);
  inited = (void *)objc_msgSend_initInternal(v6, v7, v8);
  objc_msgSend_signature(v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSignature_(inited, v13, (uint64_t)v12);

  v16 = objc_msgSend_size(v5, v14, v15);
  objc_msgSend_setPaddedFileSize_(inited, v17, v16);
  v20 = objc_msgSend_size(v5, v18, v19);
  objc_msgSend_setSize_(inited, v21, v20);
  v22 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend_contentBaseURL(v5, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v22, v26, (uint64_t)v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentBaseURL_(inited, v28, (uint64_t)v27);

  objc_msgSend_owner(v5, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOwner_(inited, v32, (uint64_t)v31);

  objc_msgSend_requestor(v5, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestor_(inited, v36, (uint64_t)v35);

  objc_msgSend_downloadToken(v5, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAuthToken_(inited, v40, (uint64_t)v39);

  if (objc_msgSend_hasAssetAuthorizationResponseUUID(v5, v41, v42)
    && objc_msgSend_haveDownloadPreauthorizations(self, v43, v44))
  {
    objc_msgSend_assetAuthorizationResponseUUID(v5, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_downloadPreauthorizationForResponseUUID_(self, v46, (uint64_t)v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend_setDownloadPreauthorization_(inited, v48, (uint64_t)v47);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v49 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v108 = v49;
        objc_msgSend_assetAuthorizationResponseUUID(v5, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = 138543362;
        v113 = v111;
        _os_log_error_impl(&dword_1BE990000, v108, OS_LOG_TYPE_ERROR, "Download Preauthorization For Response UUID %{public}@ Not Found", (uint8_t *)&v112, 0xCu);

      }
    }

  }
  objc_msgSend_uploadReceipt(v5, v43, v44);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploadReceipt_(inited, v51, (uint64_t)v50);

  if ((objc_msgSend_hasDownloadBaseURL(v5, v52, v53) & 1) != 0
    || objc_msgSend_hasConstructedAssetDownloadURL(v5, v54, v55))
  {
    objc_msgSend_downloadBaseURL(v5, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDownloadBaseURL_(inited, v57, (uint64_t)v56);

    objc_msgSend_constructedAssetDownloadURL(v5, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstructedAssetDownloadURLTemplate_(inited, v61, (uint64_t)v60);

    if (objc_msgSend_hasDownloadURLExpiration(v5, v62, v63))
    {
      v64 = (void *)MEMORY[0x1E0C99D68];
      v65 = objc_msgSend_downloadURLExpiration(v5, v54, v55);
      objc_msgSend_dateWithTimeIntervalSince1970_(v64, v66, v67, (double)v65);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDownloadURLExpiration_(inited, v69, (uint64_t)v68);

    }
  }
  if (objc_msgSend_hasConstructedAssetDownloadURL(v5, v54, v55))
  {
    objc_msgSend_constructedAssetDownloadURL(v5, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstructedAssetDownloadURLTemplate_(inited, v73, (uint64_t)v72);

    if (objc_msgSend_hasConstructedAssetDownloadEstimatedSize(v5, v74, v75))
      v78 = objc_msgSend_constructedAssetDownloadEstimatedSize(v5, v76, v77);
    else
      v78 = objc_msgSend_size(v5, v76, v77);
    objc_msgSend_setConstructedAssetEstimatedSize_(inited, v79, v78);
  }
  if (objc_msgSend_hasConstructedAssetDownloadParameters(v5, v70, v71))
  {
    objc_msgSend_constructedAssetDownloadParameters(v5, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstructedAssetDownloadParameters_(inited, v83, (uint64_t)v82);

  }
  objc_msgSend_referenceSignature(v5, v80, v81);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReferenceSignature_(inited, v85, (uint64_t)v84);

  objc_msgSend_protectionInfo(v5, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWrappedAssetKey_(inited, v92, (uint64_t)v91);

  if (objc_msgSend_hasClearAssetKey(v5, v93, v94))
  {
    objc_msgSend_clearAssetKey(v5, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClearAssetKey_(inited, v98, (uint64_t)v97);

    objc_msgSend_clearAssetKey(inited, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetKey_(inited, v102, (uint64_t)v101);

  }
  if (objc_msgSend_hasDownloadTokenExpiration(v5, v95, v96))
  {
    v105 = objc_msgSend_downloadTokenExpiration(v5, v103, v104);
    objc_msgSend_setDownloadTokenExpiration_(inited, v106, v105);
  }

  return inited;
}

- (id)pAssetFromAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;

  v4 = a3;
  objc_msgSend_record(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend_signature(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSignature_(v8, v12, (uint64_t)v11);

  v15 = objc_msgSend_paddedFileSize(v4, v13, v14);
  objc_msgSend_setSize_(v8, v16, v15);
  if (v7)
  {
    objc_msgSend_recordID(v7, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pRecordIdentifierFromRecordID_(self, v20, (uint64_t)v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordId_(v8, v22, (uint64_t)v21);

  }
  objc_msgSend_uploadReceipt(v4, v17, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploadReceipt_(v8, v24, (uint64_t)v23);

  objc_msgSend_wrappedAssetKey(v4, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v30 = (void *)objc_opt_new();
    objc_msgSend_setProtectionInfo_(v8, v31, (uint64_t)v30);

    objc_msgSend_wrappedAssetKey(v4, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v8, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v37, v38, (uint64_t)v34);

  }
  objc_msgSend_clearAssetKey(v4, v28, v29);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_clearAssetKey(v4, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClearAssetKey_(v8, v43, (uint64_t)v42);

  }
  objc_msgSend_referenceSignature(v4, v40, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend_referenceSignature(v4, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReferenceSignature_(v8, v48, (uint64_t)v47);

  }
  objc_msgSend_downloadPreauthorization(v4, v45, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend_downloadPreauthorization(v4, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_responseUUID(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetAuthorizationResponseUUID_(v8, v56, (uint64_t)v55);

  }
  return v8;
}

- (id)packageFromPPackage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  id v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C94FC8];
  objc_msgSend_packageStagingDirectory(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageInDaemonWithBasePath_error_(v7, v11, (uint64_t)v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_sections(v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_count(v15, v16, v17) + 1;

    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v21 = (void *)objc_msgSend_initWithCapacity_(v19, v20, v18);
    objc_msgSend_manifest(v6, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetFromPAsset_error_(self, v25, (uint64_t)v24, a4);
    v26 = objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v42 = v12;
      objc_msgSend_addObject_(v21, v27, v26);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend_sections(v6, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v43, v47, 16);
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v44;
        while (2)
        {
          v36 = 0;
          v37 = (void *)v26;
          do
          {
            if (*(_QWORD *)v44 != v35)
              objc_enumerationMutation(v30);
            objc_msgSend_assetFromPAsset_error_(self, v33, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v36), a4);
            v26 = objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              v40 = 0;
              v12 = v42;
              goto LABEL_14;
            }
            objc_msgSend_addObject_(v21, v38, v26);
            ++v36;
            v37 = (void *)v26;
          }
          while (v34 != v36);
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v43, v47, 16);
          if (v34)
            continue;
          break;
        }
      }

      v12 = v42;
      objc_msgSend_setAssets_(v42, v39, (uint64_t)v21);
      v40 = v42;
      v30 = (void *)v26;
LABEL_14:

    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)pPackageFromPackage:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_assets(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectEnumerator(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_nextObject(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAssetFromAsset_(self, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setManifest_(v5, v17, (uint64_t)v16);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v11;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v18);
        objc_msgSend_pAssetFromAsset_(self, v21, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24), (_QWORD)v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSections_(v5, v26, (uint64_t)v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  return v5;
}

- (id)pStreamingAssetFromStreamingAsset:(id)a3 forCache:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend_owner(v5, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = (void *)v9;
    objc_msgSend_fileSignature(v5, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v16 = (void *)v13;
      objc_msgSend_referenceSignature(v5, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_6;
      v12 = (void *)objc_opt_new();
      objc_msgSend_referenceSignature(v5, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReferenceSignature_(v12, v21, (uint64_t)v20);

      objc_msgSend_fileSignature(v5, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileSignature_(v12, v25, (uint64_t)v24);

      objc_msgSend_owner(v5, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOwner_(v12, v29, (uint64_t)v28);

      objc_msgSend_setAssetId_(v6, v30, (uint64_t)v12);
    }

  }
LABEL_6:
  if (!v4)
    goto LABEL_17;
  objc_msgSend_downloadURL(v5, v10, v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {

  }
  else if (!objc_msgSend_hasSize(v5, v32, v33))
  {
    goto LABEL_17;
  }
  v34 = (void *)objc_opt_new();
  objc_msgSend_downloadURL(v5, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_downloadURL(v5, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDownloadURL_(v34, v44, (uint64_t)v43);

  }
  if (objc_msgSend_hasSize(v5, v38, v39))
  {
    v47 = objc_msgSend_size(v5, v45, v46);
    objc_msgSend_setSize_(v34, v48, v47);
  }
  objc_msgSend_downloadURLExpirationDate(v5, v45, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend_downloadURLExpirationDate(v5, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v52, v53, v54);
    objc_msgSend_setDownloadURLExpirationTimeSeconds_(v34, v56, (uint64_t)v55);

  }
  objc_msgSend_setRetrieveAssetResponse_(v6, v50, (uint64_t)v34);

LABEL_17:
  v57 = (void *)objc_opt_new();
  objc_msgSend_setRequestedSize_(v57, v58, 0x7FFFFFFFFFFFFFFFLL);
  if (objc_msgSend_hasSize(v5, v59, v60))
  {
    v63 = objc_msgSend_size(v5, v61, v62);
    objc_msgSend_setUploadedSize_(v57, v64, v63);
  }
  objc_msgSend_uploadReceipt(v5, v61, v62);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_uploadReceipt(v5, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUploadReceipt_(v57, v69, (uint64_t)v68);

  }
  objc_msgSend_setSaveAssetRequest_(v6, v66, (uint64_t)v57);

  return v6;
}

- (id)streamingAssetFromPStreamingAsset:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *inited;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C95148]);
  inited = (void *)objc_msgSend_initInternal(v5, v6, v7);
  if (objc_msgSend_hasAssetId(v4, v9, v10))
  {
    objc_msgSend_assetId(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasOwner(v13, v14, v15))
    {
      objc_msgSend_owner(v13, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOwner_(inited, v19, (uint64_t)v18);

    }
    if (objc_msgSend_hasFileSignature(v13, v16, v17))
    {
      objc_msgSend_fileSignature(v13, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileSignature_(inited, v23, (uint64_t)v22);

    }
    if (objc_msgSend_hasReferenceSignature(v13, v20, v21))
    {
      objc_msgSend_referenceSignature(v13, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReferenceSignature_(inited, v27, (uint64_t)v26);

    }
  }
  if (objc_msgSend_hasSaveAssetResponse(v4, v11, v12))
  {
    objc_msgSend_saveAssetResponse(v4, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasUploadURL(v30, v31, v32))
    {
      v35 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend_uploadURL(v30, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_(v35, v37, (uint64_t)v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUploadURL_(inited, v39, (uint64_t)v38);

    }
    if (objc_msgSend_hasReservedSize(v30, v33, v34))
    {
      v42 = objc_msgSend_reservedSize(v30, v40, v41);
      objc_msgSend_setReservedSize_(inited, v43, v42);
    }
    if (objc_msgSend_hasUploadURLExpirationTimeSeconds(v30, v40, v41))
    {
      v46 = (void *)MEMORY[0x1E0C99D68];
      v47 = objc_msgSend_uploadURLExpirationTimeSeconds(v30, v44, v45);
      objc_msgSend_dateWithTimeIntervalSince1970_(v46, v48, v49, (double)v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUploadURLExpirationDate_(inited, v51, (uint64_t)v50);

    }
  }
  if (objc_msgSend_hasRetrieveAssetResponse(v4, v28, v29))
  {
    objc_msgSend_retrieveAssetResponse(v4, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasSize(v54, v55, v56))
    {
      v59 = objc_msgSend_size(v54, v57, v58);
      objc_msgSend_setSize_(inited, v60, v59);
    }
    if (objc_msgSend_hasDownloadURL(v54, v57, v58))
    {
      v63 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend_downloadURL(v54, v61, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_(v63, v65, (uint64_t)v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDownloadURL_(inited, v67, (uint64_t)v66);

    }
    if (objc_msgSend_hasDownloadURLExpirationTimeSeconds(v54, v61, v62))
    {
      v70 = (void *)MEMORY[0x1E0C99D68];
      v71 = objc_msgSend_downloadURLExpirationTimeSeconds(v54, v68, v69);
      objc_msgSend_dateWithTimeIntervalSince1970_(v70, v72, v73, (double)v71);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDownloadURLExpirationDate_(inited, v75, (uint64_t)v74);

    }
  }

  return inited;
}

- (id)pMergeableValueIdentifierFromMergeableValueID:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_name(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_MergeableValue(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v5, v12, (uint64_t)v11);

  objc_msgSend_zoneID(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v18, (uint64_t)v17);

  return v5;
}

- (id)mergeableValueIDFromPMergeableValueIdentifier:(id)a3 recordName:(id)a4 fieldName:(id)a5 encrypted:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  id v34;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a3;
  objc_msgSend_value(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneIdentifier(v14, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(self, v24, (uint64_t)v23, &v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v34;

  if (v26)
  {
    v27 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v26);
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0C95070]);
    v30 = (void *)objc_msgSend_initWithRecordName_zoneID_(v28, v29, (uint64_t)v12, v25);
    v31 = objc_alloc(MEMORY[0x1E0C94ED8]);
    v27 = (void *)objc_msgSend_initWithName_recordID_key_encrypted_(v31, v32, (uint64_t)v20, v30, v13, v8);

  }
  return v27;
}

- (id)mergeableRecordValueFromPRecordField:(id)a3 inPRecordIdentifier:(id)a4 asAnonymousCKUserID:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  id v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v62;
  unsigned int v63;
  id v64;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend_value(v11, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_type(v16, v17, v18);
  if (v19 == 29)
  {
    objc_msgSend_encryptedMergeableValue(v16, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_encryptedMergeableValue(v16, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 1;
      objc_msgSend_identifier(v25, v28, v29);
      goto LABEL_7;
    }
    v63 = 1;
LABEL_12:
    objc_msgSend_name(v22, v23, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = _CKCheckArgument();

    if (v32)
    {
      objc_msgSend_name(v22, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        if (v12)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v36, v37);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)a2, self, CFSTR("CKDProtocolTranslator.m"), 1170, CFSTR("Convincing clang"));

        if (v12)
        {
LABEL_15:
          v64 = 0;
          objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(self, v36, (uint64_t)v12, v13, &v64);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v64;
          if (v38)
          {
            v40 = objc_alloc(MEMORY[0x1E0C94ED8]);
            objc_msgSend_name(v22, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v11, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v46, v47, v48);
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = v38;
            v62 = (void *)v38;
            v51 = v12;
            v52 = v13;
            v53 = v39;
            v54 = (void *)v49;
            v56 = (void *)objc_msgSend_initWithName_recordID_key_encrypted_(v40, v55, (uint64_t)v43, v50, v49, v63);

            v39 = v53;
            v13 = v52;
            v12 = v51;

            v30 = objc_alloc_init(MEMORY[0x1E0C94ED0]);
            objc_msgSend_setValueID_(v30, v57, (uint64_t)v56);
            objc_msgSend_setIsValueIDKnownToServer_(v30, v58, 1);

LABEL_24:
            goto LABEL_25;
          }
LABEL_21:
          if (a6)
          {
            objc_msgSend_errorWithDomain_code_userInfo_error_format_(MEMORY[0x1E0C94FF8], v36, *MEMORY[0x1E0C94B20], 1017, 0, v39, CFSTR("No zone ID for mergeable value"));
            v30 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v30 = 0;
          }
          goto LABEL_24;
        }
      }
      v39 = 0;
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v19 == 28)
  {
    objc_msgSend_mergeableValue(v16, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_mergeableValue(v16, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend_identifier(v25, v26, v27);
LABEL_7:
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v63 = 0;
    goto LABEL_12;
  }
  if (!a6)
  {
    v22 = 0;
LABEL_18:
    v30 = 0;
    goto LABEL_25;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 1005, CFSTR("Invalid field value type"));
  v22 = 0;
  v30 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v30;
}

- (id)pMergeableValueFromMergeableValueID:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v17;
  const char *v18;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDProtocolTranslator.m"), 1197, CFSTR("Trying to create a mergeable value proto without a mergeable value ID"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend_name(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_MergeableValue(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v8, v15, (uint64_t)v14);

  return v8;
}

- (id)pEncryptedMergeableValueFromRecordValue:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v23;
  const char *v24;

  v5 = a3;
  objc_msgSend_valueID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDProtocolTranslator.m"), 1204, CFSTR("Trying to create a mergeable value proto without a mergeable value ID"));

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend_valueID(v5, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_name(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_MergeableValue(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v11, v21, (uint64_t)v20);

  return v11;
}

- (id)mergeableDeltaFromPDelta:(id)a3 valueID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  id v41;
  id v42;
  const char *v43;
  id v45;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend_hasMetadata(v8, v10, v11) & 1) != 0)
  {
    objc_msgSend_metadata(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeableDeltaMetadataFromPMetadata_mergeableValueID_error_(self, v15, (uint64_t)v14, v9, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      switch(objc_msgSend_payload(v8, v17, v18))
      {
        case 0u:
          if (!a5)
            goto LABEL_11;
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 1017, CFSTR("Unknown or missing mergeable delta payload"));
          v26 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          break;
        case 1u:
          v27 = objc_alloc(MEMORY[0x1E0C94EB8]);
          objc_msgSend_data(v8, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_initWithValueID_metadata_data_(v27, v31, (uint64_t)v9, v16, v30);
          goto LABEL_14;
        case 2u:
          v33 = objc_alloc(MEMORY[0x1E0C94EB8]);
          objc_msgSend_encryptedData(v8, v34, v35);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_initWithValueID_metadata_encryptedData_(v33, v36, (uint64_t)v9, v16, v30);
LABEL_14:
          v26 = (void *)v32;

          break;
        case 3u:
        case 4u:
          objc_msgSend_asset(v8, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          if (v21)
          {
            v25 = v21;
          }
          else
          {
            objc_msgSend_encryptedAsset(v8, v22, v23);
            v25 = (id)objc_claimAutoreleasedReturnValue();
          }
          v37 = v25;

          v45 = 0;
          objc_msgSend_assetFromPAsset_error_(self, v38, (uint64_t)v37, &v45);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v45;
          if (v39)
          {
            v42 = objc_alloc(MEMORY[0x1E0C94EB8]);
            v26 = (void *)objc_msgSend_initWithValueID_metadata_asset_(v42, v43, (uint64_t)v9, v16, v39);
          }
          else if (a5)
          {
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v40, *MEMORY[0x1E0C94B20], 2005, v41, CFSTR("Failed to parse asset from server"));
            v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }

          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      v26 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 1017, CFSTR("Missing mergeable delta metadata: %@"), v8);
    v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)pMergeableDeltaFromDelta:(id)a3 error:(id *)a4
{
  id v6;
  CKDPMergeableDelta *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int isEncrypted;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  CKDPMergeableDelta *v45;
  id v47;

  v6 = a3;
  v7 = objc_alloc_init(CKDPMergeableDelta);
  objc_msgSend_valueID(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEncrypted = objc_msgSend_isEncrypted(v10, v11, v12);

  if (isEncrypted)
  {
    objc_msgSend_encryptedData(v6, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_encryptedData(v6, v17, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEncryptedData_(v7, v20, (uint64_t)v19);
      goto LABEL_11;
    }
    objc_msgSend_asset(v6, v17, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend_asset(v6, v28, v29);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pAssetFromAsset_(self, v30, (uint64_t)v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEncryptedAsset_(v7, v31, (uint64_t)v25);
      goto LABEL_10;
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 1017, CFSTR("No encrypted data on delta %@"), v6);
      v45 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_24:
    v45 = 0;
    goto LABEL_18;
  }
  objc_msgSend_asset(v6, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v47 = 0;
    objc_msgSend_dataWithError_(v6, v22, (uint64_t)&v47);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v47;
    if (v25)
    {
      objc_msgSend_setData_(v7, v32, (uint64_t)v25);
      goto LABEL_10;
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v32, *MEMORY[0x1E0C94B20], 1017, v19, CFSTR("Failed to get data from mergeable delta %@"), v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_24;
  }
  objc_msgSend_asset(v6, v22, v23);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAssetFromAsset_(self, v24, (uint64_t)v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAsset_(v7, v26, (uint64_t)v25);
LABEL_10:

LABEL_11:
  objc_msgSend_metadata(v6, v33, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v35, *MEMORY[0x1E0C94B20], 1017, CFSTR("No metadata on delta %@"), v6);
      v45 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    v45 = 0;
    goto LABEL_17;
  }
  objc_msgSend_valueID(v6, v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pMergeableDeltaMetadataFromMetadata_mergeableValueID_error_(self, v39, (uint64_t)v37, v38, a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadata_(v7, v41, (uint64_t)v40);

  objc_msgSend_metadata(v7, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
    goto LABEL_16;
  v45 = v7;
LABEL_17:

LABEL_18:
  return v45;
}

- (id)mergeableDeltaMetadataFromPMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  id v84;
  const char *v85;
  void *v87;
  void *v88;
  void *v89;

  v8 = a3;
  v9 = a4;
  objc_msgSend_identifier(v8, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_opt_new();
    v89 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v88 = (void *)objc_opt_new();
    objc_msgSend_replacedDeltaIdentifiers(v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_count(v18, v19, v20);

    if (v21)
    {
      v24 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_replacedDeltaIdentifiers(v8, v22, v23);
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v24, v27, (uint64_t)v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v25;
    }
    if (objc_msgSend_isEncrypted(v9, v22, v23))
    {
      v30 = objc_alloc(MEMORY[0x1E0C94EC0]);
      v31 = objc_alloc(MEMORY[0x1E0C94EC8]);
      v87 = v14;
      v32 = v15;
      v34 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v31, v33, (uint64_t)v14, v89, v15, v88);
      v36 = (id)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v30, v35, (uint64_t)v13, v34, v21);

      if (!objc_msgSend_hasProtectionInfo(v8, v37, v38)
        || (objc_msgSend_protectionInfo(v8, v39, v40),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_protectionInfo(v41, v42, v43),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v47 = objc_msgSend_length(v44, v45, v46),
            v44,
            v41,
            !v47))
      {
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v39, *MEMORY[0x1E0C94B20], 1017, CFSTR("Missing protection info for delta metadata"));
          v78 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v78 = 0;
        }
        v14 = v87;
        v15 = v32;
        goto LABEL_39;
      }
      objc_msgSend_protectionInfo(v8, v39, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfo(v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEnvelope_(v36, v53, (uint64_t)v52);

      if ((objc_msgSend_hasTimestamps(v8, v54, v55) & 1) != 0
        || (objc_msgSend_hasEncryptedTimestamps(v8, v56, v57) & 1) != 0)
      {
        v15 = v32;
        if (!objc_msgSend_hasTimestamps(v8, v56, v57))
        {
LABEL_12:
          if (!objc_msgSend_hasEncryptedTimestamps(v8, v58, v59))
          {
            v14 = v87;
            goto LABEL_31;
          }
          objc_msgSend_encryptedTimestamps(v8, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEncryptedTimestamps_(v36, v77, (uint64_t)v76);
          v14 = v87;
LABEL_20:

LABEL_31:
          v36 = v36;
          v78 = v36;
          goto LABEL_39;
        }
        if (objc_msgSend_hasTimestampsAuthTag(v8, v58, v59))
        {
          v61 = objc_alloc(MEMORY[0x1E0C951F8]);
          objc_msgSend_timestamps(v8, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_data(v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timestampsAuthTag(v8, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend_initWithObject1_object2_(v61, v71, (uint64_t)v67, v70);
          objc_msgSend_setAuthenticatedTimestamps_(v36, v73, (uint64_t)v72);

          v15 = v32;
          goto LABEL_12;
        }
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v60, *MEMORY[0x1E0C94B20], 1017, CFSTR("Missing authentication tag for timestamps"));
          goto LABEL_36;
        }
      }
      else
      {
        v15 = v32;
        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v56, *MEMORY[0x1E0C94B20], 1017, CFSTR("No version vectors in delta metadata proto"));
LABEL_36:
          v78 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
          v14 = v87;
          goto LABEL_39;
        }
      }
      v78 = 0;
      goto LABEL_38;
    }
    if ((objc_msgSend_hasTimestamps(v8, v28, v29) & 1) != 0)
    {
      objc_msgSend_timestamps(v8, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(self, v82, (uint64_t)v81, a5);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76 && (objc_msgSend__validate_(v76, v83, (uint64_t)a5) & 1) != 0)
      {
        v84 = objc_alloc(MEMORY[0x1E0C94EC0]);
        v36 = (id)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v84, v85, (uint64_t)v13, v76, v21);
        goto LABEL_20;
      }

    }
    else if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v79, *MEMORY[0x1E0C94B20], 1017, CFSTR("No version vectors in delta metadata proto"));
      v36 = 0;
      v78 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

      goto LABEL_40;
    }
    v36 = 0;
    v78 = 0;
    goto LABEL_39;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 1017, CFSTR("No identifier in delta metadata proto"));
    v78 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = 0;
  }
LABEL_40:

  return v78;
}

- (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v19;

  v19 = 0;
  objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(MEMORY[0x1E0C94EC8], a2, (uint64_t)a3, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v9 = v6;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 0;
  v11 = !v10;
  if (a4 && v11)
  {
    v12 = (void *)MEMORY[0x1E0C94FF8];
    v13 = *MEMORY[0x1E0C94B20];
    objc_msgSend_userInfo(v6, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v12, v17, v13, 1017, CFSTR("%@"), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)pMergeableDeltaMetadataFromMetadata:(id)a3 mergeableValueID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (id)objc_opt_new();
  objc_msgSend_identifier(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v9, v13, (uint64_t)v12);

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend_replacedDeltaIdentifiers(v7, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v71, v75, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v72 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend_addReplacedDeltaIdentifiers_(v9, v19, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v71, v75, 16);
    }
    while (v20);
  }

  if (!objc_msgSend_isEncrypted(v8, v23, v24))
  {
    v35 = (void *)MEMORY[0x1E0C94EC8];
    objc_msgSend_vectors(v7, v25, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(v35, v37, (uint64_t)v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamps_(v9, v39, (uint64_t)v38);

    v34 = 0;
    v40 = v9;
LABEL_21:

    v68 = v34;
    v9 = v40;
LABEL_22:
    if (a5)
      *a5 = objc_retainAutorelease(v68);
    v9 = v9;
    v34 = v68;
    v69 = v9;
    goto LABEL_25;
  }
  objc_msgSend_envelope(v7, v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend_setProtectionInfo_(v29, v30, (uint64_t)v28);
    objc_msgSend_setProtectionInfo_(v9, v31, (uint64_t)v29);

    v34 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 1017, CFSTR("No envelope on metadata: %@"), v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_encryptedTimestamps(v7, v32, v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

    goto LABEL_16;
  }
  objc_msgSend_authenticatedTimestamps(v7, v42, v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
LABEL_16:
    objc_msgSend_encryptedTimestamps(v7, v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend_encryptedTimestamps(v7, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEncryptedTimestamps_(v9, v51, (uint64_t)v50);

    }
    objc_msgSend_authenticatedTimestamps(v7, v48, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = objc_alloc(MEMORY[0x1E0C94C68]);
      objc_msgSend_authenticatedTimestamps(v7, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v56, v57, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend_initWithData_(v53, v59, (uint64_t)v58);
      objc_msgSend_setTimestamps_(v9, v61, (uint64_t)v60);

      objc_msgSend_authenticatedTimestamps(v7, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v64, v65, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestampsAuthTag_(v9, v67, (uint64_t)v66);

    }
    v40 = 0;
    v68 = 0;
    v36 = v9;
    if (!v34)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v44, *MEMORY[0x1E0C94B20], 1017, CFSTR("No version vectors in delta metadata"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v69 = 0;
LABEL_25:

  return v69;
}

- (id)subscriptionFromPSubscription:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  void *v60;
  const char *v61;
  id v62;
  const char *v63;
  void *v64;
  const char *v65;
  id v66;
  const char *v67;
  id v68;
  id v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t shouldBadge;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t shouldSendContentAvailable;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t shouldSendMutableContent;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  const char *v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  const char *v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  _BOOL4 v296;

  v6 = a3;
  objc_msgSend_identifier(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_hasZoneIdentifier(v6, v13, v14))
  {
    objc_msgSend_zoneIdentifier(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(self, v18, (uint64_t)v17, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = 0;
LABEL_4:
      v21 = 0;
LABEL_5:
      v22 = 0;
      goto LABEL_58;
    }
  }
  else
  {
    v19 = 0;
  }
  if (objc_msgSend_hasEvaluationType(v6, v15, v16))
  {
    v25 = objc_msgSend_evaluationType(v6, v23, v24);
    v26 = (uint64_t)v12;
    if (v25 > 3)
    {
      v27 = 0;
      v28 = 0;
      v296 = 0;
    }
    else
    {
      v27 = (v25 & 0xF) == 1;
      v28 = v25 == 2;
      v296 = v25 == 3;
    }
  }
  else
  {
    v26 = (uint64_t)v12;
    v28 = 0;
    v296 = 0;
    v27 = 1;
  }
  if (objc_msgSend_filtersCount(v6, v23, v24))
  {
    v31 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend_filters(v6, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithCKDPQueryFilters_translator_(v31, v33, (uint64_t)v32, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend_evaluationType(v6, v29, v30) == 1)
  {
    objc_msgSend_predicateWithValue_(MEMORY[0x1E0CB3880], v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend_recordTypes(v6, v34, v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend_recordTypes(v6, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_count(v38, v39, v40);

    if (v41)
    {
      objc_msgSend_recordTypes(v6, v36, v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v44, v45, v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
  }
  if (objc_msgSend_mutationTriggers(v6, v36, v37) && objc_msgSend_mutationTriggersCount(v6, v47, v48))
  {
    v49 = 0;
    v50 = 0;
    do
    {
      v53 = *(_DWORD *)(objc_msgSend_mutationTriggers(v6, v47, v48) + 4 * v49);
      v54 = v50 | 2;
      v55 = v50 | 1;
      if (v53 != 1)
        v55 = v50;
      if (v53 != 2)
        v54 = v55;
      if (v53 == 3)
        v50 |= 4uLL;
      else
        v50 = v54;
      ++v49;
    }
    while (v49 < objc_msgSend_mutationTriggersCount(v6, v51, v52));
  }
  else
  {
    v50 = 0;
  }
  if (objc_msgSend_fireOnce(v6, v47, v48))
    v50 |= 8uLL;
  if (v27)
  {
    v12 = (void *)v26;
    if (v20)
    {
      if (v21)
      {
        v58 = objc_alloc(MEMORY[0x1E0C95040]);
        v60 = (void *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v58, v59, (uint64_t)v20, v21, v26, v50);
        objc_msgSend_setZoneID_(v60, v61, (uint64_t)v19);
        goto LABEL_49;
      }
      if (!a4)
        goto LABEL_4;
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v56, *MEMORY[0x1E0C947D8], 2019, CFSTR("Subscription from server didn't have a predicate"));
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
    }
    else
    {
      if (!a4)
      {
        v20 = 0;
        goto LABEL_5;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v56, *MEMORY[0x1E0C947D8], 2019, CFSTR("Subscription from server didn't have a record type"));
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
LABEL_57:
    v22 = 0;
    *a4 = v68;
    goto LABEL_58;
  }
  if (v28)
  {
    if (!v19)
    {
      v12 = (void *)v26;
      if (!a4)
      {
        v19 = 0;
        goto LABEL_5;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v56, *MEMORY[0x1E0C947D8], 2019, CFSTR("Subscription from server didn't have a zone id"));
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      goto LABEL_57;
    }
    v62 = objc_alloc(MEMORY[0x1E0C950B0]);
    v12 = (void *)v26;
    v64 = (void *)objc_msgSend_initWithZoneID_subscriptionID_(v62, v63, (uint64_t)v19, v26);
    goto LABEL_45;
  }
  if (v296)
  {
    v66 = objc_alloc(MEMORY[0x1E0C94CB8]);
    v12 = (void *)v26;
    v64 = (void *)objc_msgSend_initWithSubscriptionID_(v66, v67, v26);
LABEL_45:
    v60 = v64;
    objc_msgSend_setRecordType_(v64, v65, (uint64_t)v20);
    goto LABEL_49;
  }
  v60 = 0;
  v12 = (void *)v26;
LABEL_49:
  if (objc_msgSend_hasNotification(v6, v56, v57))
  {
    v69 = objc_alloc_init(MEMORY[0x1E0C94F50]);
    objc_msgSend_setNotificationInfo_(v60, v70, (uint64_t)v69);

    objc_msgSend_notification(v6, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    shouldBadge = objc_msgSend_shouldBadge(v73, v74, v75);
    objc_msgSend_notificationInfo(v60, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldBadge_(v79, v80, shouldBadge);

    objc_msgSend_notification(v6, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(v83, v84, v85);
    objc_msgSend_notificationInfo(v60, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldSendContentAvailable_(v89, v90, shouldSendContentAvailable);

    objc_msgSend_notification(v6, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(v93, v94, v95);
    objc_msgSend_notificationInfo(v60, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldSendMutableContent_(v99, v100, shouldSendMutableContent);

    objc_msgSend_notification(v6, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_collapseIdKey(v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notificationInfo(v60, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCollapseIDKey_(v109, v110, (uint64_t)v106);

    objc_msgSend_notification(v6, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_additionalFields(v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notificationInfo(v60, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDesiredKeys_(v119, v120, (uint64_t)v116);

    objc_msgSend_notification(v6, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v116) = objc_msgSend_hasAlert(v123, v124, v125);

    if ((_DWORD)v116)
    {
      objc_msgSend_notification(v6, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_text(v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertBody_(v137, v138, (uint64_t)v134);

      objc_msgSend_notification(v6, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedKey(v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertLocalizationKey_(v150, v151, (uint64_t)v147);

      objc_msgSend_notification(v6, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedArguments(v157, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertLocalizationArgs_(v163, v164, (uint64_t)v160);

      objc_msgSend_notification(v6, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v167, v168, v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_title(v170, v171, v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTitle_(v176, v177, (uint64_t)v173);

      objc_msgSend_notification(v6, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v180, v181, v182);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_titleLocalizedKey(v183, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTitleLocalizationKey_(v189, v190, (uint64_t)v186);

      objc_msgSend_notification(v6, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v193, v194, v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_titleLocalizedArguments(v196, v197, v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v200, v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTitleLocalizationArgs_(v202, v203, (uint64_t)v199);

      objc_msgSend_notification(v6, v204, v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v206, v207, v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitle(v209, v210, v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSubtitle_(v215, v216, (uint64_t)v212);

      objc_msgSend_notification(v6, v217, v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v219, v220, v221);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitleLocalizedKey(v222, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v226, v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSubtitleLocalizationKey_(v228, v229, (uint64_t)v225);

      objc_msgSend_notification(v6, v230, v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v232, v233, v234);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitleLocalizedArguments(v235, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v239, v240);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSubtitleLocalizationArgs_(v241, v242, (uint64_t)v238);

      objc_msgSend_notification(v6, v243, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v245, v246, v247);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_actionLocKey(v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v252, v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertActionLocalizationKey_(v254, v255, (uint64_t)v251);

      objc_msgSend_notification(v6, v256, v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v258, v259, v260);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_launchImage(v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v265, v266);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertLaunchImage_(v267, v268, (uint64_t)v264);

      objc_msgSend_notification(v6, v269, v270);
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v271, v272, v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_soundName(v274, v275, v276);
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v278, v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSoundName_(v280, v281, (uint64_t)v277);

      objc_msgSend_notification(v6, v282, v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alert(v284, v285, v286);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_category(v287, v288, v289);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationInfo(v60, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCategory_(v293, v294, (uint64_t)v290);

    }
  }
  v22 = v60;
LABEL_58:

  return v22;
}

- (id)pSubscriptionFromSubscription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  unint64_t SubscriptionOptions;
  char v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  unsigned int v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t shouldBadge;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t shouldSendContentAvailable;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t shouldSendMutableContent;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  const char *v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  id v324;
  _BYTE v325[128];
  uint64_t v326;

  v326 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_subscriptionID(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_Subscription(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v7, v14, (uint64_t)v13);

  if (objc_msgSend_subscriptionType(v6, v15, v16) == 1)
  {
    v19 = v6;
    objc_msgSend_zoneID(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_zoneID(v19, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v26, (uint64_t)v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneIdentifier_(v7, v28, (uint64_t)v27);

    }
    objc_msgSend_predicate(v19, v23, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v324 = 0;
    objc_msgSend_CKDPQueryFiltersWithTranslator_error_(v29, v30, (uint64_t)self, &v324);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v324;

    if (!v31 && v32)
    {
      if (!a4)
      {
LABEL_8:

        v33 = 0;
        goto LABEL_43;
      }
LABEL_7:
      v32 = objc_retainAutorelease(v32);
      *a4 = v32;
      goto LABEL_8;
    }
    CKVerifyFilters(v31);
    v45 = objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v32 = (id)v45;
      if (!a4)
        goto LABEL_8;
      goto LABEL_7;
    }
    v322 = 0u;
    v323 = 0u;
    v320 = 0u;
    v321 = 0u;
    v51 = v31;
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v57, (uint64_t)&v320, v325, 16);
    if (v58)
    {
      v60 = v58;
      v61 = *(_QWORD *)v321;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v321 != v61)
            objc_enumerationMutation(v51);
          objc_msgSend_addFilters_(v7, v59, *(_QWORD *)(*((_QWORD *)&v320 + 1) + 8 * i), (_QWORD)v320);
        }
        v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v59, (uint64_t)&v320, v325, 16);
      }
      while (v60);
    }

    v63 = (void *)objc_opt_new();
    objc_msgSend_recordType(v19, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v63, v67, (uint64_t)v66);

    objc_msgSend_addRecordTypes_(v7, v68, (uint64_t)v63);
    SubscriptionOptions = objc_msgSend_querySubscriptionOptions(v19, v69, v70);
    v72 = SubscriptionOptions;
    objc_msgSend_setFireOnce_(v7, v73, (SubscriptionOptions >> 3) & 1);
    if ((v72 & 1) != 0)
    {
      objc_msgSend_addMutationTriggers_(v7, v74, 1);
      if ((v72 & 2) == 0)
      {
LABEL_29:
        if ((v72 & 4) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:
        objc_msgSend_addMutationTriggers_(v7, v74, 3, (_QWORD)v320);
        goto LABEL_31;
      }
    }
    else if ((v72 & 2) == 0)
    {
      goto LABEL_29;
    }
    objc_msgSend_addMutationTriggers_(v7, v74, 2, (_QWORD)v320);
    if ((v72 & 4) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (objc_msgSend_subscriptionType(v6, v17, v18) == 2)
  {
    v19 = v6;
    objc_msgSend_zoneID(v19, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_zoneID(v19, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v42, (uint64_t)v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneIdentifier_(v7, v44, (uint64_t)v43);

    }
    objc_msgSend_recordType(v19, v39, v40);
    goto LABEL_18;
  }
  if (objc_msgSend_subscriptionType(v6, v34, v35) == 3)
  {
    v19 = v6;
    objc_msgSend_recordType(v19, v48, v49);
LABEL_18:
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
LABEL_33:

      goto LABEL_34;
    }
    v51 = (id)objc_opt_new();
    objc_msgSend_recordType(v19, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setName_(v51, v55, (uint64_t)v54);

    objc_msgSend_addRecordTypes_(v7, v56, (uint64_t)v51);
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:
  v75 = objc_msgSend_subscriptionType(v6, v46, v47, (_QWORD)v320);
  if (v75 == 3)
    v77 = 3;
  else
    v77 = 1;
  if (v75 == 2)
    objc_msgSend_setEvaluationType_(v7, v76, 2);
  else
    objc_msgSend_setEvaluationType_(v7, v76, v77);
  objc_msgSend_notificationInfo(v6, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    v81 = (void *)objc_opt_new();
    objc_msgSend_setNotification_(v7, v82, (uint64_t)v81);

    v83 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_notificationInfo(v6, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredKeys(v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v83, v90, (uint64_t)v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAdditionalFields_(v94, v95, (uint64_t)v91);

    objc_msgSend_notificationInfo(v6, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    shouldBadge = objc_msgSend_shouldBadge(v98, v99, v100);
    objc_msgSend_notification(v7, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldBadge_(v104, v105, shouldBadge);

    objc_msgSend_notificationInfo(v6, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(v108, v109, v110);
    objc_msgSend_notification(v7, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldSendContentAvailable_(v114, v115, shouldSendContentAvailable);

    objc_msgSend_notificationInfo(v6, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(v118, v119, v120);
    objc_msgSend_notification(v7, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShouldSendMutableContent_(v124, v125, shouldSendMutableContent);

    objc_msgSend_notificationInfo(v6, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_collapseIDKey(v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCollapseIdKey_(v134, v135, (uint64_t)v131);

    v136 = (void *)objc_opt_new();
    objc_msgSend_notification(v7, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlert_(v139, v140, (uint64_t)v136);

    objc_msgSend_notificationInfo(v6, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertBody(v143, v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v149, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setText_(v152, v153, (uint64_t)v146);

    objc_msgSend_notificationInfo(v6, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertLocalizationKey(v156, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalizedKey_(v165, v166, (uint64_t)v159);

    v167 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_notificationInfo(v6, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertLocalizationArgs(v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v167, v174, (uint64_t)v173);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalizedArguments_(v181, v182, (uint64_t)v175);

    objc_msgSend_notificationInfo(v6, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_title(v185, v186, v187);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v191, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v194, v195, (uint64_t)v188);

    objc_msgSend_notificationInfo(v6, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_titleLocalizationKey(v198, v199, v200);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v202, v203);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitleLocalizedKey_(v207, v208, (uint64_t)v201);

    v209 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_notificationInfo(v6, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_titleLocalizationArgs(v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v209, v216, (uint64_t)v215);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v218, v219);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v220, v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitleLocalizedArguments_(v223, v224, (uint64_t)v217);

    objc_msgSend_notificationInfo(v6, v225, v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subtitle(v227, v228, v229);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v231, v232);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v233, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSubtitle_(v236, v237, (uint64_t)v230);

    objc_msgSend_notificationInfo(v6, v238, v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subtitleLocalizationKey(v240, v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v244, v245);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v246, v247, v248);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSubtitleLocalizedKey_(v249, v250, (uint64_t)v243);

    v251 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_notificationInfo(v6, v252, v253);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subtitleLocalizationArgs(v254, v255, v256);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v251, v258, (uint64_t)v257);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v260, v261);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v262, v263, v264);
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSubtitleLocalizedArguments_(v265, v266, (uint64_t)v259);

    objc_msgSend_notificationInfo(v6, v267, v268);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertActionLocalizationKey(v269, v270, v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v273, v274);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v275, v276, v277);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActionLocKey_(v278, v279, (uint64_t)v272);

    objc_msgSend_notificationInfo(v6, v280, v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alertLaunchImage(v282, v283, v284);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v286, v287);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v288, v289, v290);
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLaunchImage_(v291, v292, (uint64_t)v285);

    objc_msgSend_notificationInfo(v6, v293, v294);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_soundName(v295, v296, v297);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v299, v300);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v301, v302, v303);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSoundName_(v304, v305, (uint64_t)v298);

    objc_msgSend_notificationInfo(v6, v306, v307);
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_category(v308, v309, v310);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notification(v7, v312, v313);
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alert(v314, v315, v316);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCategory_(v317, v318, (uint64_t)v311);

  }
  v33 = v7;
LABEL_43:

  return v33;
}

- (id)recordZoneFromPRecordZone:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_recordZoneFromPRecordZone_asAnonymousCKUserID_databaseScope_error_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (id)recordZoneFromPRecordZone:(id)a3 asAnonymousCKUserID:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  int v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  int v110;
  unsigned int *v111;
  int v112;
  const char *v113;
  uint64_t v114;
  id *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  id *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  id v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  id *v136;
  const char *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  id v152;
  CKDPZoneCryptoFeatureRequirements *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  int v166;
  unsigned int *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  NSObject *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  void *v195;
  const char *v196;
  const char *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  void *v202;
  id v203;
  id v204;
  const char *v205;
  void *v206;
  const char *v207;
  void *v208;
  const char *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  const char *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  const char *v221;
  NSObject *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  int v232;
  unsigned int v233;
  NSObject *v234;
  const char *v235;
  uint64_t v236;
  void *v237;
  NSObject *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  NSObject *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  NSObject *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  int v252;
  unsigned int v253;
  uint64_t v254;
  int v255;
  id *v256;
  id v257;
  void *v258;
  id v259;
  id v260;
  id v261;
  uint8_t buf[4];
  void *v263;
  __int16 v264;
  _WORD v265[9];

  *(_QWORD *)&v265[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_defaultRecordZone(MEMORY[0x1E0C95088], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);

  objc_msgSend_zoneIdentifier(v9, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_CKCheckArgument())
    goto LABEL_72;
  objc_msgSend_zoneIdentifier(v9, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = 0;
  objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(self, v29, (uint64_t)v28, v10, &v261);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v261;
  objc_msgSend_setZoneID_(v16, v32, (uint64_t)v30);

  objc_msgSend_zoneID(v16, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    if (objc_msgSend_hasProtectionInfo(v9, v36, v37))
    {
      objc_msgSend_protectionInfo(v9, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfo(v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_length(v43, v44, v45);

      if (v46)
      {
        objc_msgSend_protectionInfo(v9, v38, v39);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionInfo(v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionData_(v16, v51, (uint64_t)v50);

        objc_msgSend_protectionInfo(v9, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionInfoTag(v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionEtag_(v16, v58, (uint64_t)v57);

        if (objc_msgSend_hasZoneProtectionInfoKeysToRemove(v9, v59, v60))
        {
          objc_msgSend_zoneProtectionInfoKeysToRemove(v9, v38, v39);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(self, v62, (uint64_t)v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZonePCSKeysToRemove_(v16, v64, (uint64_t)v63);

        }
      }
    }
    if (objc_msgSend_hasRecordProtectionInfo(v9, v38, v39))
    {
      objc_msgSend_recordProtectionInfo(v9, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionInfo(v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_length(v70, v71, v72);

      if (v73)
      {
        objc_msgSend_recordProtectionInfo(v9, v65, v66);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_protectionInfo(v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZoneishProtectionData_(v16, v78, (uint64_t)v77);

        if (objc_msgSend_hasRecordProtectionInfoKeysToRemove(v9, v79, v80))
        {
          objc_msgSend_recordProtectionInfoKeysToRemove(v9, v65, v66);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsKeysToRemoveFromPProtectionInfoKeysToRemove_(self, v82, (uint64_t)v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneishPCSKeysToRemove_(v16, v84, (uint64_t)v83);

        }
      }
    }
    if (!objc_msgSend_hasSignedCryptoRequirements(v9, v65, v66))
      goto LABEL_55;
    objc_msgSend_signedCryptoRequirements(v9, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serializedRequirements(v87, v88, v89);
    v90 = objc_claimAutoreleasedReturnValue();
    v258 = v25;
    if (v90)
    {
      v93 = (void *)v90;
      v257 = v10;
      objc_msgSend_signedCryptoRequirements(v9, v91, v92);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v94, v95, v96);
      v97 = objc_claimAutoreleasedReturnValue();
      if (v97)
      {
        v100 = (void *)v97;
        objc_msgSend_signedCryptoRequirements(v9, v98, v99);
        v256 = a6;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend_version(v101, v102, v103);

        a6 = v256;
        v10 = v257;
        if (v104)
        {
          objc_msgSend_signedCryptoRequirements(v9, v105, v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend_version(v107, v108, v109);
          v111 = (unsigned int *)MEMORY[0x1E0C95410];
          v112 = *MEMORY[0x1E0C95410];

          if (v110 > v112)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v115 = v256;
            v116 = (void *)*MEMORY[0x1E0C952D8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
            {
              v223 = v116;
              objc_msgSend_zoneID(v16, v224, v225);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_signedCryptoRequirements(v9, v227, v228);
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              v232 = objc_msgSend_version(v229, v230, v231);
              v233 = *v111;
              *(_DWORD *)buf = 138543874;
              v263 = v226;
              v264 = 1024;
              *(_DWORD *)v265 = v232;
              v265[2] = 1024;
              *(_DWORD *)&v265[3] = v233;
              _os_log_error_impl(&dword_1BE990000, v223, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Unsupported signed requirements version: %d. The current OS supports versions up to %d.", buf, 0x18u);

              v115 = v256;
              if (!v256)
                goto LABEL_31;
              goto LABEL_20;
            }
            if (v256)
            {
LABEL_20:
              v119 = (void *)MEMORY[0x1E0C94FF8];
              v120 = *MEMORY[0x1E0C94B20];
              objc_msgSend_zoneID(v16, v117, v118);
              v121 = v115;
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_signedCryptoRequirements(v9, v123, v124);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v128 = objc_msgSend_version(v125, v126, v127);
              objc_msgSend_errorWithDomain_code_format_(v119, v129, v120, 5021, CFSTR("Failed to parse required features for zone with ID %@. Version %d is required; the current OS only supports versions up to %d."),
                v122,
                v128,
                *v111);
              *v121 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
            }
LABEL_31:
            v130 = 0;
LABEL_32:
            v25 = v258;
            goto LABEL_74;
          }
          objc_msgSend_pcsManager(self, v113, v114);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signedCryptoRequirements(v9, v139, v140);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signature(v141, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signedCryptoRequirements(v9, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_serializedRequirements(v147, v148, v149);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v260 = v31;
          v255 = objc_msgSend_validateFullPublicKeySignature_forSignedData_error_(v138, v151, (uint64_t)v144, v150, &v260);
          v152 = v260;

          if (v255 && !v152)
          {
            v153 = [CKDPZoneCryptoFeatureRequirements alloc];
            objc_msgSend_signedCryptoRequirements(v9, v154, v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_serializedRequirements(v156, v157, v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = (void *)objc_msgSend_initWithData_(v153, v160, (uint64_t)v159);

            v10 = v257;
            if (v161)
            {
              v25 = v258;
              if (objc_msgSend_hasMinimumSchemaVersion(v161, v162, v163))
              {
                v166 = objc_msgSend_minimumSchemaVersion(v161, v164, v165);
                v167 = (unsigned int *)MEMORY[0x1E0C95350];
                if (v166 > *MEMORY[0x1E0C95350])
                {
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v168 = (void *)*MEMORY[0x1E0C952B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                  {
                    v246 = v168;
                    objc_msgSend_zoneID(v16, v247, v248);
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    v252 = objc_msgSend_minimumSchemaVersion(v161, v250, v251);
                    v253 = *v167;
                    *(_DWORD *)buf = 138543874;
                    v263 = v249;
                    v264 = 1024;
                    *(_DWORD *)v265 = v252;
                    v265[2] = 1024;
                    *(_DWORD *)&v265[3] = v253;
                    _os_log_error_impl(&dword_1BE990000, v246, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Unsupported minimum schema version: %d. The current OS supports schema versions up to %d.", buf, 0x18u);

                    v25 = v258;
                  }
                  if (!v256)
                    goto LABEL_71;
                  v171 = (void *)MEMORY[0x1E0C94FF8];
                  v172 = *MEMORY[0x1E0C94B20];
                  objc_msgSend_zoneID(v16, v169, v170);
                  v173 = (void *)objc_claimAutoreleasedReturnValue();
                  v254 = objc_msgSend_minimumSchemaVersion(v161, v174, v175);
                  objc_msgSend_errorWithDomain_code_format_(v171, v176, v172, 5021, CFSTR("Failed to parse required features for zone with ID %@. Schema version %d or higher is required; the current OS only supports schema versions up to %d."),
                    v173,
                    v254,
                    *v167);
                  goto LABEL_70;
                }
              }
              if (objc_msgSend_hasRequiredAdopterFeatures(v161, v164, v165))
              {
                objc_msgSend_requiredAdopterFeatures(v161, v188, v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();

                if (v190)
                {
                  objc_msgSend_requiredAdopterFeatures(v161, v191, v192);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_requiredFeatureSetFromPAdopterFeatureSet_(self, v194, (uint64_t)v193);
                  v195 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_setRequiredFeatures_(v16, v196, (uint64_t)v195);
                  objc_msgSend_setOriginalRequiredFeatures_(v16, v197, (uint64_t)v195);

                  v25 = v258;
                  v31 = 0;
LABEL_55:
                  if (objc_msgSend_hasShareId(v9, v85, v86))
                  {
                    objc_msgSend_shareId(v9, v198, v199);
                    v200 = (void *)objc_claimAutoreleasedReturnValue();
                    v259 = v31;
                    objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, v201, (uint64_t)v200, v10, &v259);
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    v203 = v259;

                    if (v202)
                    {
                      v204 = objc_alloc(MEMORY[0x1E0C950C0]);
                      v206 = (void *)objc_msgSend_initWithRecordID_action_(v204, v205, (uint64_t)v202, 0);
                      objc_msgSend_setShare_(v16, v207, (uint64_t)v206);

                    }
                    v31 = v203;
                  }
                  objc_msgSend_protectionInfoKeysToRemoves(v9, v198, v199);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setInvitedKeysToRemove_(v16, v209, (uint64_t)v208);

                  v130 = v16;
                  goto LABEL_74;
                }
              }
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v216 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                v242 = v216;
                objc_msgSend_zoneID(v16, v243, v244);
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v263 = v245;
                _os_log_error_impl(&dword_1BE990000, v242, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: The required features are missing.", buf, 0xCu);

                v25 = v258;
                if (!v256)
                  goto LABEL_71;
                goto LABEL_69;
              }
              if (v256)
              {
LABEL_69:
                v219 = (void *)MEMORY[0x1E0C94FF8];
                v220 = *MEMORY[0x1E0C94B20];
                objc_msgSend_zoneID(v16, v217, v218);
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_format_(v219, v221, v220, 1005, CFSTR("Failed to parse required features for zone with ID %@. The required features are missing."), v173);
                goto LABEL_70;
              }
LABEL_71:

LABEL_72:
              v31 = 0;
              goto LABEL_73;
            }
            v25 = v258;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v210 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v238 = v210;
              objc_msgSend_zoneID(v16, v239, v240);
              v241 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v263 = v241;
              _os_log_error_impl(&dword_1BE990000, v238, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Failed to parse the required features from the signed blob.", buf, 0xCu);

              v25 = v258;
              if (!v256)
                goto LABEL_71;
            }
            else if (!v256)
            {
              goto LABEL_71;
            }
            v213 = (void *)MEMORY[0x1E0C94FF8];
            v214 = *MEMORY[0x1E0C94B20];
            objc_msgSend_zoneID(v16, v211, v212);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v213, v215, v214, 1005, CFSTR("Failed to parse the required features for zone with ID %@."), v173);
LABEL_70:
            *v256 = (id)objc_claimAutoreleasedReturnValue();

            v25 = v258;
            goto LABEL_71;
          }
          v10 = v257;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v177 = (void *)*MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          {
            v234 = v177;
            objc_msgSend_zoneID(v16, v235, v236);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v263 = v237;
            v264 = 2112;
            *(_QWORD *)v265 = v152;
            _os_log_error_impl(&dword_1BE990000, v234, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Signature validation failed: %@", buf, 0x16u);

            if (!v256)
              goto LABEL_49;
          }
          else if (!v256)
          {
LABEL_49:
            v130 = 0;
            v31 = v152;
            goto LABEL_32;
          }
          v180 = (void *)MEMORY[0x1E0C94FF8];
          v181 = *MEMORY[0x1E0C94B20];
          objc_msgSend_zoneID(v16, v178, v179);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_error_format_(v180, v183, v181, 5022, v152, CFSTR("Failed to validate the cryptographic signature of the required features for zone with ID %@."), v182);
          *v256 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_49;
        }
LABEL_25:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v131 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v184 = v131;
          objc_msgSend_zoneID(v16, v185, v186);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v263 = v187;
          _os_log_error_impl(&dword_1BE990000, v184, OS_LOG_TYPE_ERROR, "Failed to parse required features for zone %{public}@: Requirements, signature or version is missing.", buf, 0xCu);

          if (!a6)
            goto LABEL_31;
        }
        else if (!a6)
        {
          goto LABEL_31;
        }
        v134 = (void *)MEMORY[0x1E0C94FF8];
        v135 = *MEMORY[0x1E0C94B20];
        objc_msgSend_zoneID(v16, v132, v133);
        v136 = a6;
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v134, v137, v135, 1000, CFSTR("Failed to parse required features for zone with ID %@. Missing attributes."), v122);
        *v136 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }

      v10 = v257;
    }

    goto LABEL_25;
  }
  if (!a6)
  {
LABEL_73:
    v130 = 0;
    goto LABEL_74;
  }
  v31 = objc_retainAutorelease(v31);
  v130 = 0;
  *a6 = v31;
LABEL_74:

  return v130;
}

- (id)pRecordZoneFromRecordZone:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_zoneID(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v11, (uint64_t)v10);

  objc_msgSend_protectionData(v4, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (_BYTE *)MEMORY[0x1E0C95280];
  if (v14)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend_setProtectionInfo_(v5, v19, (uint64_t)v18);

    objc_msgSend_protectionData(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v5, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v25, v26, (uint64_t)v22);

    objc_msgSend_protectionEtag(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v5, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoTag_(v32, v33, (uint64_t)v29);

    if (*v17)
    {
      if (objc_msgSend_applyPCSKeysToRemoveForTesting(v4, v15, v16))
      {
        objc_msgSend_zonePCSKeysToRemove(v4, v15, v16);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend_protectionEtag(v4, v15, v16);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zonePCSKeysToRemove(v4, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEtag_(v38, v39, (uint64_t)v35);

          objc_msgSend_zonePCSKeysToRemove(v4, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(self, v43, (uint64_t)v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneProtectionInfoKeysToRemove_(v5, v45, (uint64_t)v44);

        }
      }
    }
  }
  objc_msgSend_zoneishProtectionData(v4, v15, v16);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v49 = (void *)objc_opt_new();
    objc_msgSend_setRecordProtectionInfo_(v5, v50, (uint64_t)v49);

    objc_msgSend_zoneishProtectionData(v4, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordProtectionInfo(v5, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v56, v57, (uint64_t)v53);

    if (*v17)
    {
      if (objc_msgSend_applyPCSKeysToRemoveForTesting(v4, v47, v48))
      {
        objc_msgSend_zoneishPCSKeysToRemove(v4, v47, v48);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          objc_msgSend_zoneishProtectionData(v4, v47, v48);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_etagFromPCSData_(CKDPCSManager, v60, (uint64_t)v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneishPCSKeysToRemove(v4, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEtag_(v64, v65, (uint64_t)v61);

          objc_msgSend_zoneishPCSKeysToRemove(v4, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(self, v69, (uint64_t)v68);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRecordProtectionInfoKeysToRemove_(v5, v71, (uint64_t)v70);

        }
      }
    }
  }
  if (objc_msgSend_hasUpdatedExpirationTimeInterval(v4, v47, v48))
  {
    v72 = (void *)objc_opt_new();
    objc_msgSend_setStorageExpiration_(v5, v73, (uint64_t)v72);

    objc_msgSend_updatedExpirationTimeInterval(v4, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_storageExpiration(v5, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v79;
    if (v76)
    {
      objc_msgSend_setOperationType_(v79, v80, 2);

      objc_msgSend_updatedExpirationTimeInterval(v4, v82, v83);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_unsignedLongLongValue(v81, v84, v85);
      objc_msgSend_storageExpiration(v5, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDuration_(v89, v90, v86);

    }
    else
    {
      objc_msgSend_setOperationType_(v79, v80, 1);
    }

  }
  return v5;
}

- (unint64_t)capabilitiesFromPZoneCapabilities:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;

  v3 = a3;
  if (objc_msgSend_atomicSaves(v3, v4, v5))
    v8 = 2;
  else
    v8 = 0;
  v9 = v8 | objc_msgSend_fetchChanges(v3, v6, v7);
  if (objc_msgSend_hierarchicalSharing(v3, v10, v11))
    v14 = v9 | 4;
  else
    v14 = v9;
  v15 = objc_msgSend_zoneSharing(v3, v12, v13);

  if (v15)
    return v14 | 8;
  else
    return v14;
}

- (id)featureSetFromPAdopterFeatureSet:(id)a3 ofFeatureClass:(Class)a4
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  id v25;
  const char *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
        v14 = [a4 alloc];
        objc_msgSend_key(v13, v15, v16, (_QWORD)v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v13, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend_initWithName_value_(v14, v21, (uint64_t)v17, v20);
        objc_msgSend_addObject_(v6, v23, (uint64_t)v22);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v29, v33, 16);
    }
    while (v10);
  }

  v25 = objc_alloc(MEMORY[0x1E0C94D98]);
  v27 = (void *)objc_msgSend_initWithFeatures_(v25, v26, (uint64_t)v6);

  return v27;
}

- (id)pAdopterFeatureSetFromFeatureSet:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_features(v3, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        v14 = (void *)objc_opt_new();
        objc_msgSend_name(v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKey_(v14, v18, (uint64_t)v17);

        objc_msgSend_value(v13, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_(v14, v22, (uint64_t)v21);

        objc_msgSend_addObject_(v4, v23, (uint64_t)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v24, (uint64_t)&v26, v30, 16);
    }
    while (v10);
  }

  return v4;
}

- (id)pAdopterFeatureSetFromRequiredFeatures:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_fieldFeatures(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v10, v11, v12);
  objc_msgSend_setFieldFeatures_(v5, v14, (uint64_t)v13);

  objc_msgSend_recordFeatures(v4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v18, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_mutableCopy(v19, v20, v21);
  objc_msgSend_setRecordFeatures_(v5, v23, (uint64_t)v22);

  objc_msgSend_zoneFeatures(v4, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pAdopterFeatureSetFromFeatureSet_(self, v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_mutableCopy(v28, v29, v30);
  objc_msgSend_setZoneFeatures_(v5, v32, (uint64_t)v31);

  return v5;
}

- (id)requiredFeatureSetFromPAdopterFeatureSet:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;

  v4 = a3;
  objc_msgSend_fieldFeatures(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v9, (uint64_t)v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordFeatures(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v15, (uint64_t)v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneFeatures(v4, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  objc_msgSend_featureSetFromPAdopterFeatureSet_ofFeatureClass_(self, v21, (uint64_t)v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0C950D0]);
  objc_msgSend_features(v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_features(v16, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_features(v10, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_initWithZoneFeatures_recordFeatures_fieldFeatures_(v23, v33, (uint64_t)v26, v29, v32);

  return v34;
}

- (id)pZoneCryptoFeatureRequirmentsFromZone:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_requiredFeatures(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAdopterFeatureSetFromRequiredFeatures_(self, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequiredAdopterFeatures_(v5, v11, (uint64_t)v10);

  objc_msgSend_zoneID(v4, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(self, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIdentifier_(v5, v17, (uint64_t)v16);

  objc_msgSend_setMinimumSchemaVersion_(v5, v18, *MEMORY[0x1E0C95358]);
  return v5;
}

- (id)containerPrivacySettingsFromPContainerPrivacySettings:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  int isEqual;
  const char *v30;
  uint64_t v31;
  CKDContainerPrivacySettings *v32;
  const char *v33;
  void *v34;

  v3 = a3;
  objc_msgSend_applicationContainer(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_applicationContainerEnvironment(v3, v7, v8) == 1)
    v9 = 1;
  else
    v9 = 2;
  v10 = objc_alloc(MEMORY[0x1E0C94C40]);
  v12 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v10, v11, (uint64_t)v6, v9);
  objc_msgSend_userPrivacySettings(v3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_discoverable(v15, v16, v17);

  objc_msgSend_applicationBundles(v3, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_applicationBundles(v3, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v24, v26, (uint64_t)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v22, (uint64_t)&unk_1E78AF4E0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v21, v28, (uint64_t)v27);

  if (isEqual)
  {
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v30, (uint64_t)v6);
    v31 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v31;
  }
  v32 = [CKDContainerPrivacySettings alloc];
  v34 = (void *)objc_msgSend_initWithContainerID_applicationBundleIDs_discoverable_(v32, v33, (uint64_t)v12, v21, v18);

  return v34;
}

- (id)shareFromPShare:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(self, a2, (uint64_t)a3, 0, a4);
}

- (id)shareFromPShare:(id)a3 asAnonymousCKUserID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  CKDProtocolTranslator *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  id v76;
  const char *v77;
  int isEqualToString;
  const char *v79;
  const char *v80;
  id v81;
  const char *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  int v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  id v174;
  NSObject *v175;
  void *v176;
  id *v177;
  NSObject *v178;
  id v179;
  NSObject *v180;
  NSObject *v181;
  const char *v182;
  void *v183;
  NSObject *v184;
  const char *v185;
  NSObject *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  id *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  id obj;
  void *v196;
  void *inited;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  id v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  uint8_t v212[128];
  uint8_t buf[4];
  uint64_t v214;
  __int16 v215;
  void *v216;
  __int16 v217;
  id v218;
  _BYTE v219[128];
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend_hasShareId(v8, v10, v11) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v175 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v214 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1BE990000, v175, OS_LOG_TYPE_DEBUG, "Share has no share ID: %@", buf, 0xCu);
    }
    v174 = 0;
    goto LABEL_88;
  }
  objc_msgSend_shareId(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDFromPShareIdentifier_asAnonymousCKUserID_error_(self, v15, (uint64_t)v14, v9, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v176 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v187 = v176;
      objc_msgSend_shareId(v8, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v214 = (uint64_t)v190;
      _os_log_debug_impl(&dword_1BE990000, v187, OS_LOG_TYPE_DEBUG, "Couldn't create a record ID from share ID %{public}@", buf, 0xCu);

    }
    v174 = 0;
    goto LABEL_87;
  }
  v17 = objc_alloc(MEMORY[0x1E0C95110]);
  inited = (void *)objc_msgSend_initInternalWithShareRecordID_(v17, v18, (uint64_t)v16);
  if (!inited)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v180 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v214 = (uint64_t)v16;
      _os_log_debug_impl(&dword_1BE990000, v180, OS_LOG_TYPE_DEBUG, "Couldn't create a share with ID %{public}@. Giving up.", buf, 0xCu);
    }
    v174 = 0;
    goto LABEL_86;
  }
  if (objc_msgSend_hasEtag(v8, v19, v20))
  {
    objc_msgSend_etag(v8, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(inited, v24, (uint64_t)v23);

  }
  v26 = objc_msgSend_publicAccess(v8, v21, v22) - 1;
  if (v26 < 4)
    v27 = v26 + 1;
  else
    v27 = 0;
  objc_msgSend__setPublicPermissionNoSideEffects_(inited, v25, v27);
  objc_msgSend_invitedKeyToRemoves(v8, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedKeysToRemove_(inited, v31, (uint64_t)v30);

  if (objc_msgSend_hasPublisherModelType(v8, v32, v33))
  {
    v36 = objc_msgSend_publisherModelType(v8, v34, v35) - 1;
    if (v36 <= 3)
      objc_msgSend_setParticipantVisibility_(inited, v34, qword_1BECBC1C0[v36]);
  }
  v191 = a5;
  v192 = v16;
  if (objc_msgSend_hasParticipantSelfRemovalBehavior(v8, v34, v35))
  {
    v39 = objc_msgSend_participantSelfRemovalBehavior(v8, v37, v38) - 1;
    if (v39 <= 2)
      objc_msgSend_setParticipantSelfRemovalBehavior_(inited, v37, v39 + 1);
  }
  v40 = objc_msgSend_anonymousPublicAccess(v8, v37, v38);
  objc_msgSend_setAllowsAnonymousPublicAccess_(inited, v41, v40);
  v42 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_participants(v8, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_count(v45, v46, v47);
  v196 = (void *)objc_msgSend_initWithCapacity_(v42, v49, v48);

  objc_msgSend_resetFetchedParticipants(inited, v50, v51);
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  v193 = v8;
  objc_msgSend_participants(v8, v52, v53);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v207, v219, 16);
  if (v55)
  {
    v57 = v55;
    v194 = *(_QWORD *)v208;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v208 != v194)
          objc_enumerationMutation(obj);
        v59 = *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * i);
        v206 = 0;
        objc_msgSend_shareParticipantFromPParticipant_error_(self, v56, v59, &v206);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v206;
        if (!v60)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v16 = v192;
          v8 = v193;
          v177 = v191;
          v178 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v214 = v59;
            v215 = 2114;
            v216 = v192;
            v217 = 2112;
            v218 = v63;
            _os_log_debug_impl(&dword_1BE990000, v178, OS_LOG_TYPE_DEBUG, "Failed to convert participant %@ for share %{public}@: %@", buf, 0x20u);
            if (!v191)
              goto LABEL_84;
          }
          else if (!v191)
          {
            goto LABEL_84;
          }
          v179 = objc_retainAutorelease(v63);
          v63 = v179;
          goto LABEL_77;
        }
        v64 = self;
        if (objc_msgSend_role(v60, v61, v62) == 4)
        {
          v67 = objc_msgSend_publicPermission(inited, v65, v66);
          objc_msgSend_setPermission_(v60, v68, v67);
        }
        objc_msgSend_userIdentity(v60, v65, v66);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v9;
        isEqualToString = objc_msgSend_isEqualToString_(v9, v77, (uint64_t)v75);

        if (isEqualToString)
          objc_msgSend_setIsCurrentUser_(v60, v79, 1);
        objc_msgSend_addObject_(v196, v79, (uint64_t)v60);
        objc_msgSend_registerFetchedParticipant_(inited, v80, (uint64_t)v60);

        v9 = v76;
        self = v64;
      }
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v207, v219, 16);
    }
    while (v57);
  }
  v81 = v9;

  objc_msgSend_setAllParticipants_(inited, v82, (uint64_t)v196);
  v83 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = v193;
  objc_msgSend_requestingAccess(v193, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend_requestingAccessUsersCount(v86, v87, v88);
  obj = (id)objc_msgSend_initWithCapacity_(v83, v90, v89);

  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  objc_msgSend_requestingAccess(v193, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestingAccessUsers(v93, v94, v95);
  v63 = (id)objc_claimAutoreleasedReturnValue();

  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v96, (uint64_t)&v202, v212, 16);
  if (!v97)
    goto LABEL_35;
  v99 = v97;
  v100 = *(_QWORD *)v203;
  do
  {
    for (j = 0; j != v99; ++j)
    {
      if (*(_QWORD *)v203 != v100)
        objc_enumerationMutation(v63);
      v102 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * j);
      objc_msgSend_shareRequesterFromPRequester_(self, v98, v102);
      v103 = objc_claimAutoreleasedReturnValue();
      if (!v103)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v9 = v81;
        v177 = v191;
        v16 = v192;
        v181 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          if (v191)
            goto LABEL_76;
LABEL_84:
          v174 = 0;
          goto LABEL_85;
        }
        *(_DWORD *)buf = 138412546;
        v214 = v102;
        v215 = 2114;
        v216 = v192;
        _os_log_debug_impl(&dword_1BE990000, v181, OS_LOG_TYPE_DEBUG, "Failed to convert requester %@ for share %{public}@", buf, 0x16u);
        if (!v191)
          goto LABEL_84;
LABEL_76:
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v182, *MEMORY[0x1E0C94B20], 1005, CFSTR("Unable to parse requester"));
        v179 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:
        v174 = 0;
        *v177 = v179;
        goto LABEL_85;
      }
      v105 = (void *)v103;
      objc_msgSend_addObject_(obj, v104, v103);

    }
    v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v98, (uint64_t)&v202, v212, 16);
  }
  while (v99);
LABEL_35:

  objc_msgSend_setRequesters_(inited, v106, (uint64_t)obj);
  v107 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_blockedRequestingAccess(v193, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend_blockedUsersCount(v110, v111, v112);
  v63 = (id)objc_msgSend_initWithCapacity_(v107, v114, v113);

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  objc_msgSend_blockedRequestingAccess(v193, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_blockedUsers(v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v121, (uint64_t)&v198, v211, 16);
  if (!v122)
    goto LABEL_43;
  v124 = v122;
  v125 = *(_QWORD *)v199;
  while (2)
  {
    v126 = 0;
    while (2)
    {
      if (*(_QWORD *)v199 != v125)
        objc_enumerationMutation(v120);
      v127 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * v126);
      objc_msgSend_blockedIdentityFromPBlockedUser_(self, v123, v127);
      v128 = objc_claimAutoreleasedReturnValue();
      if (!v128)
      {
        v183 = v120;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v9 = v81;
        v16 = v192;
        v184 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v214 = v127;
          v215 = 2114;
          v216 = v192;
          _os_log_debug_impl(&dword_1BE990000, v184, OS_LOG_TYPE_DEBUG, "Failed to convert blocked identity %@ for share %{public}@", buf, 0x16u);
          if (!v191)
            goto LABEL_83;
        }
        else if (!v191)
        {
LABEL_83:

          goto LABEL_84;
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v185, *MEMORY[0x1E0C94B20], 1005, CFSTR("Unable to parse blocked user"));
        *v191 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_83;
      }
      v130 = (void *)v128;
      objc_msgSend_addObject_(v63, v129, v128);

      if (v124 != ++v126)
        continue;
      break;
    }
    v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v123, (uint64_t)&v198, v211, 16);
    if (v124)
      continue;
    break;
  }
LABEL_43:

  objc_msgSend_setBlockedIdentities_(inited, v131, (uint64_t)v63);
  v134 = objc_msgSend_denyAccessRequests(v193, v132, v133);
  objc_msgSend_setAccessRequestsEnabled_(inited, v135, v134 ^ 1u);
  if (objc_msgSend_hasShortTokenRoutingKey(v193, v136, v137))
  {
    objc_msgSend_shortTokenRoutingKey(v193, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoutingKey_(inited, v141, (uint64_t)v140);

  }
  v16 = v192;
  if (objc_msgSend_hasDisplayedHostname(v193, v138, v139))
  {
    objc_msgSend_displayedHostname(v193, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(inited, v145, (uint64_t)v144);

  }
  if (objc_msgSend_hasInvitedPcs(v193, v142, v143))
  {
    objc_msgSend_invitedPcs(v193, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvitedProtectionData_(inited, v152, (uint64_t)v151);

    objc_msgSend_invitedPcs(v193, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfoTag(v155, v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvitedProtectionEtag_(inited, v159, (uint64_t)v158);

  }
  if (objc_msgSend_hasSelfAddedPcs(v193, v146, v147))
  {
    objc_msgSend_selfAddedPcs(v193, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicProtectionData_(inited, v166, (uint64_t)v165);

    objc_msgSend_selfAddedPcs(v193, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfoTag(v169, v170, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicProtectionEtag_(inited, v173, (uint64_t)v172);

  }
  v174 = inited;
  v9 = v81;
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_88:
  return v174;
}

- (id)pShareFromShare:(id)a3 forCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  const char *v61;
  void *v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  const char *v79;
  void *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  void *v147;
  void *v148;
  void *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  uint64_t v165;

  v4 = a4;
  v165 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_recordID(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pShareIdentifierFromRecordID_(self, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareId_(v7, v13, (uint64_t)v12);

  objc_msgSend_etag(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v7;
  objc_msgSend_setEtag_(v7, v17, (uint64_t)v16);

  v149 = (void *)objc_opt_new();
  objc_msgSend_removedParticipants(v6, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v20, v21, (uint64_t)CFSTR("participantID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v147 = v6;
  objc_msgSend_allParticipants(v6, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v158, v164, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v159;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v159 != v30)
          objc_enumerationMutation(v25);
        v32 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
        objc_msgSend_pParticipantFromShareParticipant_forCache_(self, v28, (uint64_t)v32, v4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v32, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_containsObject_(v22, v37, (uint64_t)v36);

        if (v38)
          objc_msgSend_setState_(v33, v39, 3);
        objc_msgSend_addObject_(v149, v39, (uint64_t)v33);

      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v158, v164, 16);
    }
    while (v29);
  }

  objc_msgSend_setParticipants_(v148, v40, (uint64_t)v149);
  v43 = objc_msgSend_accessRequestsEnabled(v147, v41, v42);
  objc_msgSend_setDenyAccessRequests_(v148, v44, v43 ^ 1u);
  v45 = (void *)objc_opt_new();
  objc_msgSend_requesters(v147, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_approvedRequesters(v147, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v48, v52, (uint64_t)v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v54 = v53;
  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v154, v163, 16);
  if (v56)
  {
    v58 = v56;
    v59 = *(_QWORD *)v155;
    do
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v155 != v59)
          objc_enumerationMutation(v54);
        objc_msgSend_pRequesterFromShareRequester_(self, v57, *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * j));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
          objc_msgSend_addObject_(v45, v61, (uint64_t)v62);

      }
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v154, v163, 16);
    }
    while (v58);
  }

  v63 = (void *)objc_opt_new();
  objc_msgSend_setRequestingAccess_(v148, v64, (uint64_t)v63);

  objc_msgSend_requestingAccess(v148, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestingAccessUsers_(v67, v68, (uint64_t)v45);

  v69 = (void *)objc_opt_new();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  objc_msgSend_blockedIdentities(v147, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v150, v162, 16);
  if (v74)
  {
    v76 = v74;
    v77 = *(_QWORD *)v151;
    do
    {
      for (k = 0; k != v76; ++k)
      {
        if (*(_QWORD *)v151 != v77)
          objc_enumerationMutation(v72);
        objc_msgSend_pBlockedUserFromShareBlockedIdentity_(self, v75, *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * k));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
          objc_msgSend_addObject_(v69, v79, (uint64_t)v80);

      }
      v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v150, v162, 16);
    }
    while (v76);
  }

  v81 = (void *)objc_opt_new();
  objc_msgSend_setBlockedRequestingAccess_(v148, v82, (uint64_t)v81);

  objc_msgSend_blockedRequestingAccess(v148, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlockedUsers_(v85, v86, (uint64_t)v69);

  v89 = objc_msgSend_publicPermission(v147, v87, v88);
  v92 = sub_1BEB10F48(v89, v90, v91);
  objc_msgSend_setPublicAccess_(v148, v93, v92);
  v96 = objc_msgSend_participantVisibility(v147, v94, v95);
  v98 = 1;
  switch(v96)
  {
    case 0:
      goto LABEL_33;
    case 1:
      if (objc_msgSend_publicPermission(v147, v97, 1) == 1)
        objc_msgSend_setPublisherModelType_(v148, v97, 2);
      break;
    case 2:
      objc_msgSend_setPublisherModelType_(v148, v97, 3);
      break;
    case 3:
      v98 = 4;
LABEL_33:
      objc_msgSend_setPublisherModelType_(v148, v97, v98);
      break;
    default:
      break;
  }
  v99 = objc_msgSend_participantSelfRemovalBehavior(v147, v97, v98);
  if ((unint64_t)(v99 - 1) <= 2)
    objc_msgSend_setParticipantSelfRemovalBehavior_(v148, v100, v99);
  v102 = objc_msgSend_allowsAnonymousPublicAccess(v147, v100, v101);
  objc_msgSend_setAnonymousPublicAccess_(v148, v103, v102);
  objc_msgSend_displayedHostname(v147, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayedHostname_(v148, v107, (uint64_t)v106);

  objc_msgSend_invitedProtectionData(v147, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    v113 = (void *)objc_opt_new();
    objc_msgSend_setInvitedPcs_(v148, v114, (uint64_t)v113);

    objc_msgSend_invitedProtectionData(v147, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invitedPcs(v148, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v120, v121, (uint64_t)v117);

    objc_msgSend_invitedProtectionEtag(v147, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invitedPcs(v148, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoTag_(v127, v128, (uint64_t)v124);

  }
  objc_msgSend_publicProtectionData(v147, v111, v112);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  if (v129)
  {
    v130 = (void *)objc_opt_new();
    objc_msgSend_setSelfAddedPcs_(v148, v131, (uint64_t)v130);

    objc_msgSend_publicProtectionData(v147, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selfAddedPcs(v148, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v137, v138, (uint64_t)v134);

    objc_msgSend_publicProtectionEtag(v147, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selfAddedPcs(v148, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoTag_(v144, v145, (uint64_t)v141);

  }
  return v148;
}

- (id)shareParticipantFromPParticipant:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *inited;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int hasName;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int hasEmailAddress;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  int hasPhoneNumber;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  int hasContainerScopedUserId;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  int v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  const char *v119;
  id v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  char isDefaultUserNameFromServer;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  char isEqualToString;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  int v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  char v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  uint64_t isAnonymousInvitedParticipant;
  const char *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t isApprovedRequester;
  const char *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  double v244;
  double v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C95210]);
  inited = (void *)objc_msgSend_initInternal(v7, v8, v9);
  objc_msgSend_userId(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  hasName = objc_msgSend_hasName(v13, v14, v15);

  if (hasName)
  {
    objc_msgSend_userId(v6, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDFromPUserName_error_(self, v23, (uint64_t)v22, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v117 = 0;
      goto LABEL_57;
    }
    objc_msgSend_setUserRecordID_(inited, v25, (uint64_t)v24);
  }
  else
  {
    v24 = 0;
  }
  if (objc_msgSend_hasContactInformation(v6, v17, v18))
  {
    objc_msgSend_contactInformation(v6, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    hasEmailAddress = objc_msgSend_hasEmailAddress(v28, v29, v30);

    if (hasEmailAddress)
    {
      v34 = objc_alloc(MEMORY[0x1E0C95218]);
      objc_msgSend_contactInformation(v6, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_emailAddress(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend_initWithEmailAddress_(v34, v41, (uint64_t)v40);
      objc_msgSend_setLookupInfo_(inited, v43, (uint64_t)v42);

    }
    objc_msgSend_contactInformation(v6, v32, v33);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    hasPhoneNumber = objc_msgSend_hasPhoneNumber(v44, v45, v46);

    if (hasPhoneNumber)
    {
      v50 = objc_alloc(MEMORY[0x1E0C95218]);
      objc_msgSend_contactInformation(v6, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumber(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend_initWithPhoneNumber_(v50, v57, (uint64_t)v56);
      objc_msgSend_setLookupInfo_(inited, v59, (uint64_t)v58);

    }
    objc_msgSend_contactInformation(v6, v48, v49);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    hasContainerScopedUserId = objc_msgSend_hasContainerScopedUserId(v60, v61, v62);

    if (hasContainerScopedUserId)
    {
      v66 = objc_alloc(MEMORY[0x1E0C95218]);
      objc_msgSend_contactInformation(v6, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerScopedUserId(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPUserName_error_(self, v73, (uint64_t)v72, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)objc_msgSend_initWithUserRecordID_(v66, v75, (uint64_t)v74);
      objc_msgSend_setLookupInfo_(inited, v77, (uint64_t)v76);

    }
    objc_msgSend_contactInformation(v6, v64, v65);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstName(v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameComponents(inited, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v84, v85, (uint64_t)v81);

    objc_msgSend_contactInformation(v6, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastName(v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameComponents(inited, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v94, v95, (uint64_t)v91);

  }
  if (objc_msgSend_hasOutOfNetworkPrivateKey(v6, v26, v27))
  {
    objc_msgSend_outOfNetworkPrivateKey(v6, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOutOfNetworkPrivateKey_(inited, v99, (uint64_t)v98);

  }
  if (objc_msgSend_hasPublicKey(v6, v96, v97))
  {
    objc_msgSend_publicKey(v6, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicSharingKey_(inited, v106, (uint64_t)v105);

  }
  v107 = objc_msgSend_publicKeyVersion(v6, v100, v101);
  objc_msgSend_setPublicKeyVersion_(inited, v108, v107);
  if (objc_msgSend_hasIsInNetwork(v6, v109, v110))
  {
    v113 = objc_msgSend_isInNetwork(v6, v111, v112);
    objc_msgSend_setHasiCloudAccount_(inited, v114, v113);
  }
  else if ((objc_msgSend_hasOutOfNetworkKeyType(v6, v111, v112) & 1) != 0)
  {
    objc_msgSend_setHasiCloudAccount_(inited, v115, 0);
  }
  else
  {
    v118 = objc_msgSend_hasOutOfNetworkPrivateKey(v6, v115, v116) ^ 1;
    objc_msgSend_setHasiCloudAccount_(inited, v119, v118);
  }
  v120 = objc_alloc(MEMORY[0x1E0C95130]);
  v117 = (void *)objc_msgSend_initInternalWithUserIdentity_(v120, v121, (uint64_t)inited);
  objc_msgSend_participantId(v6, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParticipantID_(v117, v128, (uint64_t)v127);

  if (objc_msgSend_hasInviterId(v6, v129, v130))
  {
    objc_msgSend_inviterId(v6, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v133, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInviterID_(v117, v137, (uint64_t)v136);

  }
  if (objc_msgSend_hasParticipantType(v6, v131, v132)
    && (v140 = objc_msgSend_participantType(v6, v138, v139) - 1, v140 <= 3))
  {
    objc_msgSend_setRole_(v117, v138, v140 + 1);
  }
  else
  {
    objc_msgSend_setRole_(v117, v138, 0);
  }
  if (objc_msgSend_hasState(v6, v141, v142))
  {
    v146 = objc_msgSend_state(v6, v143, v144) - 2;
    v147 = v146 >= 3;
    v148 = v146 + 2;
    if (v147)
      objc_msgSend_setAcceptanceStatus_(v117, v145, 1);
    else
      objc_msgSend_setAcceptanceStatus_(v117, v145, v148);
  }
  else
  {
    v151 = 2 * (objc_msgSend_role(v117, v143, v144) == 1);
    objc_msgSend_setAcceptanceStatus_(v117, v152, v151);
  }
  v154 = objc_msgSend_permission(v6, v149, v150) - 1;
  if (v154 < 4)
    objc_msgSend_setPermission_(v117, v153, v154 + 1);
  else
    objc_msgSend_setPermission_(v117, v153, 0);
  objc_msgSend_recordName(v24, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  isDefaultUserNameFromServer = objc_msgSend__isDefaultUserNameFromServer_(self, v158, (uint64_t)v157);

  if ((isDefaultUserNameFromServer & 1) != 0)
    goto LABEL_40;
  objc_msgSend_userIdentity(v117, v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userRecordID(v162, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v168, v169, *MEMORY[0x1E0C94730]);

  if ((isEqualToString & 1) != 0)
    goto LABEL_40;
  objc_msgSend_identityDelegate(self, v160, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicKey(v6, v173, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v175, v176, v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend_sharingFingerprintsContainPublicKeyWithData_error_(v172, v179, (uint64_t)v178, 0);

  if (v180)
LABEL_40:
    objc_msgSend_setIsCurrentUser_(v117, v160, 1);
  objc_msgSend_userIdentity(v117, v160, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userRecordID(v182, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v185, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orgAdminUserID(self, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend_isEqualToString_(v188, v192, (uint64_t)v191);

  if ((v193 & 1) != 0 || objc_msgSend_isOrgUser(v6, v194, v195))
    objc_msgSend_setIsOrgAdminUser_(v117, v194, 1);
  objc_msgSend_protectionInfo(v6, v194, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectionInfo(v197, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = objc_msgSend_length(v200, v201, v202);

  if (v203)
  {
    objc_msgSend_protectionInfo(v6, v204, v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v206, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v117, v210, (uint64_t)v209);

  }
  objc_msgSend_protectionInfoPublicKey(v6, v204, v205);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = objc_msgSend_length(v211, v212, v213);

  if (v214)
  {
    objc_msgSend_protectionInfoPublicKey(v6, v215, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoPublicKey_(v117, v218, (uint64_t)v217);

  }
  if (objc_msgSend_hasKeyHealth(v6, v215, v216))
  {
    v222 = objc_msgSend_keyHealth(v6, v219, v220) - 1;
    if (v222 < 3)
      objc_msgSend_setMutableInvitationTokenStatus_(v117, v221, v222 + 1);
    else
      objc_msgSend_setMutableInvitationTokenStatus_(v117, v221, 0);
  }
  v223 = objc_msgSend_createdInProcess(v6, v219, v220);
  objc_msgSend_setCreatedInProcess_(v117, v224, v223);
  v227 = objc_msgSend_acceptedInProcess(v6, v225, v226);
  objc_msgSend_setAcceptedInProcess_(v117, v228, v227);
  isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v6, v229, v230);
  objc_msgSend_setIsAnonymousInvitedParticipant_(v117, v232, isAnonymousInvitedParticipant);
  if (objc_msgSend_hasIsApprovedRequester(v6, v233, v234))
  {
    isApprovedRequester = objc_msgSend_isApprovedRequester(v6, v235, v236);
    objc_msgSend_setIsApprovedRequester_(v117, v238, isApprovedRequester);
  }
  if (objc_msgSend_hasInviteTimestampDate(v6, v235, v236))
  {
    objc_msgSend_inviteTimestampDate(v6, v239, v240);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_time(v241, v242, v243);
    v245 = v244 / 1000.0;

    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v246, v247, v245);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvitationDate_(v117, v249, (uint64_t)v248);

  }
LABEL_57:

  return v117;
}

- (id)pParticipantFromShareParticipant:(id)a3 forCache:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  char isEqualToString;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  void *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  _BYTE *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  const char *v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  const char *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  const char *v270;
  uint64_t v271;
  uint64_t isAnonymousInvitedParticipant;
  const char *v273;
  const char *v274;
  uint64_t v275;
  uint64_t isApprovedRequester;
  const char *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;

  v4 = a4;
  v5 = a3;
  v8 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend_userIdentity(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pUserIdentifierFromUserRecordName_(self, v16, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserId_(v8, v18, (uint64_t)v17);

  }
  v19 = objc_msgSend_role(v5, v6, v7);
  v22 = sub_1BEB11000(v19, v20, v21);
  objc_msgSend_setParticipantType_(v8, v23, v22);
  if (objc_msgSend_role(v5, v24, v25) != 4)
  {
    v28 = objc_msgSend_permission(v5, v26, v27);
    v31 = sub_1BEB10F48(v28, v29, v30);
    objc_msgSend_setPermission_(v8, v32, v31);
  }
  objc_msgSend_userIdentity(v5, v26, v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isAnonymousInvitedParticipant(v5, v34, v35)
    || objc_msgSend_forceSendPublicKeyForAnonymousParticipants(v5, v36, v37))
  {
    objc_msgSend_lookupInfo(v33, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v38, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v44 = (void *)v41;
      v45 = objc_msgSend_role(v5, v42, v43);

      if (v45 != 1)
      {
        v48 = (void *)objc_opt_new();
        objc_msgSend_setContactInformation_(v8, v49, (uint64_t)v48);

        objc_msgSend_lookupInfo(v33, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pUserIdentifierFromUserRecordName_(self, v59, (uint64_t)v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v60, v61, v62);
        v63 = v33;
        v64 = v4;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contactInformation(v8, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setContainerScopedUserId_(v68, v69, (uint64_t)v65);

        v4 = v64;
        v33 = v63;

        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend_lookupInfo(v33, v46, v47);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      v76 = (void *)objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v77, (uint64_t)v76);

      objc_msgSend_lookupInfo(v33, v78, v79);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_emailAddress(v52, v80, v81);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contactInformation(v8, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEmailAddress_(v84, v85, (uint64_t)v55);

    }
    else
    {
      objc_msgSend_lookupInfo(v33, v74, v75);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumber(v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v89)
        goto LABEL_16;
      v92 = (void *)objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v93, (uint64_t)v92);

      objc_msgSend_lookupInfo(v33, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumber(v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEC0FF08(v99);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_contactInformation(v8, v100, v101);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPhoneNumber_(v55, v102, (uint64_t)v52);
    }
LABEL_15:

LABEL_16:
    if (v4)
    {
      objc_msgSend_lookupInfo(v33, v90, v91);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_emailAddress(v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contactInformation(v8, v107, v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEmailAddress_(v109, v110, (uint64_t)v106);

      objc_msgSend_lookupInfo(v33, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumber(v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contactInformation(v8, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPhoneNumber_(v119, v120, (uint64_t)v116);

    }
    objc_msgSend_contactInformation(v8, v90, v91);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_nameComponents(v33, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_familyName(v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v127;
    if (v121)
    {
      objc_msgSend_contactInformation(v8, v128, v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastName_(v131, v132, (uint64_t)v130);

    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v127, v128, (uint64_t)&stru_1E7838F48) & 1) != 0)
      {
        objc_msgSend_nameComponents(v33, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_givenName(v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v140, v141, (uint64_t)&stru_1E7838F48);

        if ((isEqualToString & 1) != 0)
          goto LABEL_26;
      }
      else
      {

      }
      v143 = (void *)objc_opt_new();
      objc_msgSend_setContactInformation_(v8, v144, (uint64_t)v143);

      objc_msgSend_nameComponents(v33, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_familyName(v147, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contactInformation(v8, v151, v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastName_(v153, v154, (uint64_t)v150);

    }
    objc_msgSend_nameComponents(v33, v133, v134);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_givenName(v155, v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contactInformation(v8, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstName_(v161, v162, (uint64_t)v158);

LABEL_26:
    v163 = (void *)objc_opt_new();
    objc_msgSend_setPublicKey_(v8, v164, (uint64_t)v163);

    objc_msgSend_publicSharingKey(v33, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicKey(v8, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v170, v171, (uint64_t)v167);

  }
  objc_msgSend_userIdentity(v5, v36, v37);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = objc_msgSend_publicKeyVersion(v172, v173, v174);
  objc_msgSend_setPublicKeyVersion_(v8, v176, v175);

  objc_msgSend_participantID(v5, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend_length(v179, v180, v181);

  if (v182)
  {
    objc_msgSend_participantID(v5, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDPIdentifier_User(v185, v186, v187);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParticipantId_(v8, v189, (uint64_t)v188);

  }
  objc_msgSend_inviterID(v5, v183, v184);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend_length(v190, v191, v192);

  if (v193)
  {
    objc_msgSend_inviterID(v5, v194, v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDPIdentifier_User(v196, v197, v198);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInviterId_(v8, v200, (uint64_t)v199);

  }
  v201 = (_BYTE *)MEMORY[0x1E0C95280];
  if (v4
    || objc_msgSend_acceptanceStatus(v5, v194, v195) == 3
    || (v202 = objc_msgSend_role(v5, v194, v195), *v201)
    || v202 != 4)
  {
    v203 = objc_msgSend_acceptanceStatus(v5, v194, v195);
    if ((unint64_t)(v203 - 2) >= 3)
      objc_msgSend_setState_(v8, v204, 1);
    else
      objc_msgSend_setState_(v8, v204, v203);
  }
  if ((objc_msgSend_isOrgAdminUser(v5, v194, v195) & 1) != 0)
  {
    objc_msgSend_setIsOrgUser_(v8, v205, 1);
  }
  else
  {
    objc_msgSend_userIdentity(v5, v205, v206);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v209, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orgAdminUserID(self, v216, v217);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = objc_msgSend_isEqualToString_(v215, v219, (uint64_t)v218);

    objc_msgSend_setIsOrgUser_(v8, v221, v220);
  }
  objc_msgSend_protectionInfo(v5, v207, v208);
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  if (v222)
  {
    v225 = (void *)objc_opt_new();
    objc_msgSend_setProtectionInfo_(v8, v226, (uint64_t)v225);

    objc_msgSend_protectionInfo(v5, v227, v228);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v8, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfo_(v232, v233, (uint64_t)v229);

  }
  objc_msgSend_userIdentity(v5, v223, v224);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outOfNetworkPrivateKey(v234, v235, v236);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = objc_msgSend_length(v237, v238, v239);

  if (v240)
  {
    objc_msgSend_userIdentity(v5, v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outOfNetworkPrivateKey(v243, v244, v245);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOutOfNetworkPrivateKey_(v8, v247, (uint64_t)v246);

    objc_msgSend_setOutOfNetworkKeyType_(v8, v248, 0);
  }
  objc_msgSend_protectionInfoPublicKey(v5, v241, v242);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = objc_msgSend_length(v249, v250, v251);

  if (v252)
  {
    objc_msgSend_protectionInfoPublicKey(v5, v253, v254);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionInfoPublicKey_(v8, v256, (uint64_t)v255);

  }
  v257 = objc_msgSend_createdInProcess(v5, v253, v254);
  objc_msgSend_setCreatedInProcess_(v8, v258, v257);
  v261 = objc_msgSend_acceptedInProcess(v5, v259, v260);
  objc_msgSend_setAcceptedInProcess_(v8, v262, v261);
  v265 = objc_msgSend_invitationTokenStatus(v5, v263, v264);
  v268 = sub_1BEB10EA4(v265, v266, v267);
  objc_msgSend_setKeyHealth_(v8, v269, v268);
  isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v5, v270, v271);
  objc_msgSend_setIsAnonymousInvitedParticipant_(v8, v273, isAnonymousInvitedParticipant);
  isApprovedRequester = objc_msgSend_isApprovedRequester(v5, v274, v275);
  objc_msgSend_setIsApprovedRequester_(v8, v277, isApprovedRequester);
  if (*v201)
  {
    objc_msgSend_userIdentity(v5, v278, v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v283 = objc_msgSend_hasiCloudAccount(v280, v281, v282);
    objc_msgSend_setIsInNetwork_(v8, v284, v283);

  }
  return v8;
}

- (id)shareRequesterFromPRequester:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *inited;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int hasEmailAddress;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int hasPhoneNumber;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int hasFirstName;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  int hasLastName;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  id v72;
  const char *v73;
  void *v74;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C95210]);
    inited = (void *)objc_msgSend_initInternal(v5, v6, v7);
    v9 = objc_alloc(MEMORY[0x1E0C95218]);
    v12 = (void *)objc_msgSend_initInternal(v9, v10, v11);
    if (objc_msgSend_hasUserId(v4, v13, v14))
    {
      objc_msgSend_userId(v4, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPUserName_error_(self, v18, (uint64_t)v17, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUserRecordID_(v12, v20, (uint64_t)v19);

    }
    if (objc_msgSend_hasContactInformation(v4, v15, v16))
    {
      objc_msgSend_contactInformation(v4, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      hasEmailAddress = objc_msgSend_hasEmailAddress(v23, v24, v25);

      if (hasEmailAddress)
      {
        objc_msgSend_contactInformation(v4, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_emailAddress(v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEmailAddress_(v12, v33, (uint64_t)v32);

      }
      objc_msgSend_contactInformation(v4, v27, v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      hasPhoneNumber = objc_msgSend_hasPhoneNumber(v34, v35, v36);

      if (hasPhoneNumber)
      {
        objc_msgSend_contactInformation(v4, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneNumber(v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPhoneNumber_(v12, v44, (uint64_t)v43);

      }
      objc_msgSend_contactInformation(v4, v38, v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      hasFirstName = objc_msgSend_hasFirstName(v45, v46, v47);

      if (hasFirstName)
      {
        objc_msgSend_contactInformation(v4, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstName(v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameComponents(inited, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setGivenName_(v57, v58, (uint64_t)v54);

      }
      objc_msgSend_contactInformation(v4, v49, v50);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      hasLastName = objc_msgSend_hasLastName(v59, v60, v61);

      if (hasLastName)
      {
        objc_msgSend_contactInformation(v4, v21, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastName(v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameComponents(inited, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFamilyName_(v70, v71, (uint64_t)v67);

      }
    }
    objc_msgSend_setLookupInfo_(inited, v21, (uint64_t)v12);
    v72 = objc_alloc(MEMORY[0x1E0C95118]);
    v74 = (void *)objc_msgSend_initWithUserIdentity_(v72, v73, (uint64_t)inited);

  }
  else
  {
    v74 = 0;
  }

  return v74;
}

- (id)blockedIdentityFromPBlockedUser:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *inited;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int hasEmailAddress;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int hasPhoneNumber;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int hasFirstName;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  int hasLastName;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  id v72;
  const char *v73;
  void *v74;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C95210]);
    inited = (void *)objc_msgSend_initInternal(v5, v6, v7);
    v9 = objc_alloc(MEMORY[0x1E0C95218]);
    v12 = (void *)objc_msgSend_initInternal(v9, v10, v11);
    if (objc_msgSend_hasUserId(v4, v13, v14))
    {
      objc_msgSend_userId(v4, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPUserName_error_(self, v18, (uint64_t)v17, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUserRecordID_(v12, v20, (uint64_t)v19);

    }
    if (objc_msgSend_hasContactInformation(v4, v15, v16))
    {
      objc_msgSend_contactInformation(v4, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      hasEmailAddress = objc_msgSend_hasEmailAddress(v23, v24, v25);

      if (hasEmailAddress)
      {
        objc_msgSend_contactInformation(v4, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_emailAddress(v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEmailAddress_(v12, v33, (uint64_t)v32);

      }
      objc_msgSend_contactInformation(v4, v27, v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      hasPhoneNumber = objc_msgSend_hasPhoneNumber(v34, v35, v36);

      if (hasPhoneNumber)
      {
        objc_msgSend_contactInformation(v4, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneNumber(v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPhoneNumber_(v12, v44, (uint64_t)v43);

      }
      objc_msgSend_contactInformation(v4, v38, v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      hasFirstName = objc_msgSend_hasFirstName(v45, v46, v47);

      if (hasFirstName)
      {
        objc_msgSend_contactInformation(v4, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstName(v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameComponents(inited, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setGivenName_(v57, v58, (uint64_t)v54);

      }
      objc_msgSend_contactInformation(v4, v49, v50);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      hasLastName = objc_msgSend_hasLastName(v59, v60, v61);

      if (hasLastName)
      {
        objc_msgSend_contactInformation(v4, v21, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastName(v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameComponents(inited, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFamilyName_(v70, v71, (uint64_t)v67);

      }
    }
    objc_msgSend_setLookupInfo_(inited, v21, (uint64_t)v12);
    v72 = objc_alloc(MEMORY[0x1E0C95120]);
    v74 = (void *)objc_msgSend_initWithUserIdentity_(v72, v73, (uint64_t)inited);

  }
  else
  {
    v74 = 0;
  }

  return v74;
}

- (id)pRequesterFromShareRequester:(id)a3
{
  id v4;
  CKDPUserInformationRequestAccess *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  CKDPContactInformation *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(CKDPUserInformationRequestAccess);
    objc_msgSend_userIdentity(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lookupInfo(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pUserIdentifierFromUserRecordName_(self, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserId_(v5, v23, (uint64_t)v22);

    v24 = objc_alloc_init(CKDPContactInformation);
    objc_msgSend_nameComponents(v8, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_givenName(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstName_(v24, v31, (uint64_t)v30);

    objc_msgSend_nameComponents(v8, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_familyName(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastName_(v24, v38, (uint64_t)v37);

    objc_msgSend_lookupInfo(v8, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEmailAddress_(v24, v45, (uint64_t)v44);

    objc_msgSend_lookupInfo(v8, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneNumber(v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhoneNumber_(v24, v52, (uint64_t)v51);

    objc_msgSend_setContactInformation_(v5, v53, (uint64_t)v24);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)pBlockedUserFromShareBlockedIdentity:(id)a3
{
  id v4;
  CKDPUserInformationBlockedRequestAccess *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  CKDPContactInformation *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(CKDPUserInformationBlockedRequestAccess);
    objc_msgSend_userIdentity(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lookupInfo(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pUserIdentifierFromUserRecordName_(self, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserId_(v5, v23, (uint64_t)v22);

    v24 = objc_alloc_init(CKDPContactInformation);
    objc_msgSend_nameComponents(v8, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_givenName(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstName_(v24, v31, (uint64_t)v30);

    objc_msgSend_nameComponents(v8, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_familyName(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastName_(v24, v38, (uint64_t)v37);

    objc_msgSend_lookupInfo(v8, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEmailAddress_(v24, v45, (uint64_t)v44);

    objc_msgSend_lookupInfo(v8, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneNumber(v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhoneNumber_(v24, v52, (uint64_t)v51);

    objc_msgSend_setContactInformation_(v5, v53, (uint64_t)v24);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)notificationFromPPushMessage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *inited;
  NSObject *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  id v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  const char *v63;
  const char *v64;
  void *v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  uint8_t buf[4];
  id v107;
  __int16 v108;
  id v109;
  uint64_t v110;
  _QWORD v111[2];

  v111[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_payload(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v6, v7, v8);

  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend_payload(v3, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(v12, v14, (uint64_t)v13, 4, &v105);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v105;

    if (v15)
    {
      v110 = *MEMORY[0x1E0C953F0];
      v111[0] = v15;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v111, &v110, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x1E0C94F40], v19, (uint64_t)v18);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v16;
        _os_log_error_impl(&dword_1BE990000, v26, OS_LOG_TYPE_ERROR, "Unable to convert payload message: %@", buf, 0xCu);
      }
      v18 = 0;
      objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x1E0C94F40], v27, 0);
    }
    inited = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0C94F40]);
    inited = (void *)objc_msgSend_initInternal(v20, v21, v22);
  }
  objc_msgSend_uuid(v3, v23, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v31 = objc_alloc(MEMORY[0x1E0C94F48]);
    objc_msgSend_uuid(v3, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend_initWithNotificationUUID_(v31, v35, (uint64_t)v34);

    objc_msgSend_setNotificationID_(inited, v37, (uint64_t)v36);
  }
  if (objc_msgSend_hasDialog(v3, v29, v30))
  {
    v40 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend_dialog(v3, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataUsingEncoding_(v41, v42, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(v40, v44, (uint64_t)v43, 4, &v104);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v104;

    if (v45)
    {
      v47 = v45;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v47, v48, *MEMORY[0x1E0C953B0]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertBody_(inited, v51, (uint64_t)v50);

        objc_msgSend_objectForKeyedSubscript_(v47, v52, *MEMORY[0x1E0C953C8]);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertLocalizationKey_(inited, v54, (uint64_t)v53);

        objc_msgSend_objectForKeyedSubscript_(v47, v55, *MEMORY[0x1E0C953C0]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertLocalizationArgs_(inited, v57, (uint64_t)v56);

        objc_msgSend_objectForKeyedSubscript_(v47, v58, *MEMORY[0x1E0C953E8]);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTitleLocalizationKey_(inited, v60, (uint64_t)v59);

        objc_msgSend_objectForKeyedSubscript_(v47, v61, *MEMORY[0x1E0C953E0]);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTitleLocalizationArgs_(inited, v63, (uint64_t)v62);

        objc_msgSend_objectForKeyedSubscript_(v47, v64, *MEMORY[0x1E0C953D8]);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSubtitleLocalizationKey_(inited, v66, (uint64_t)v65);

        objc_msgSend_objectForKeyedSubscript_(v47, v67, *MEMORY[0x1E0C953D0]);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSubtitleLocalizationArgs_(inited, v69, (uint64_t)v68);

        objc_msgSend_objectForKeyedSubscript_(v47, v70, *MEMORY[0x1E0C953A8]);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertActionLocalizationKey_(inited, v72, (uint64_t)v71);

        objc_msgSend_objectForKeyedSubscript_(v47, v73, *MEMORY[0x1E0C953B8]);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertLaunchImage_(inited, v75, (uint64_t)v74);
      }
      else
      {
        objc_msgSend_dialog(v3, v48, v49);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAlertBody_(inited, v80, (uint64_t)v74);
      }

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v76 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v100 = v76;
        objc_msgSend_dialog(v3, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v107 = v103;
        v108 = 2112;
        v109 = v46;
        _os_log_error_impl(&dword_1BE990000, v100, OS_LOG_TYPE_ERROR, "Unable to parse dialog body %@: %@", buf, 0x16u);

      }
      objc_msgSend_dialog(v3, v77, v78);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlertBody_(inited, v79, (uint64_t)v47);
    }

  }
  objc_msgSend_sound(v3, v38, v39);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoundName_(inited, v82, (uint64_t)v81);

  if (objc_msgSend_hasBadgeCount(v3, v83, v84))
  {
    v87 = (void *)MEMORY[0x1E0CB37E8];
    v88 = objc_msgSend_badgeCount(v3, v85, v86);
    objc_msgSend_numberWithInt_(v87, v89, v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBadge_(inited, v91, (uint64_t)v90);

  }
  objc_msgSend_category(v3, v85, v86);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCategory_(inited, v93, (uint64_t)v92);

  if (objc_msgSend_hasIsRead(v3, v94, v95) && objc_msgSend_isRead(v3, v96, v97))
    objc_msgSend_setNotificationType_(inited, v98, 3);

  return inited;
}

- (id)pAliasWithIdentityLookupInfo:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;

  v5 = a3;
  if (objc_msgSend_lookupField(v5, v6, v7) == 1)
  {
    objc_msgSend_emailAddress(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pAliasWithEmailAddress_(self, v11, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend_lookupField(v5, v8, v9) == 2)
  {
    objc_msgSend_userRecordID(v5, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pAliasWithUserRecordID_(self, v15, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend_lookupField(v5, v13, v14) != 3)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_lookupField(v5, v22, v23);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v25, (uint64_t)a2, self, CFSTR("CKDProtocolTranslator.m"), 2595, CFSTR("Unknown lookup field in CKUserIdentityLookupInfo: %ld"), v24);

    }
    objc_msgSend_phoneNumber(v5, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pAliasWithPhoneNumber_(self, v18, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v12;

  return v19;
}

- (id)pAliasWithEmailAddress:(id)a3
{
  return (id)objc_msgSend_pAliasWithHashedStringID_type_(self, a2, (uint64_t)a3, 1);
}

- (id)pAliasWithPhoneNumber:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  sub_1BEC0FF08(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pAliasWithHashedStringID_type_(self, v5, (uint64_t)v4, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pAliasWithHashedStringID:(id)a3 type:(int)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const void *v14;
  const char *v15;
  CC_LONG v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)MEMORY[0x1E0C99D50];
  v6 = a3;
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v5, v7, (uint64_t)&v24, 32, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v6, v9, v10, v24, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (const void *)objc_msgSend_UTF8String(v11, v12, v13);
  v16 = objc_msgSend_lengthOfBytesUsingEncoding_(v11, v15, 4);
  CC_SHA256(v14, v16, (unsigned __int8 *)&v24);
  objc_msgSend_CKLowercaseHexStringWithoutSpaces(v8, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend_setIdentifier_(v20, v21, (uint64_t)v19);
    objc_msgSend_setType_(v20, v22, v4);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)pAliasWithUserRecordID:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_recordName(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__isDefaultUserNameFromClient_(self, v9, (uint64_t)v8) & 1) != 0)
    objc_msgSend_containerScopedUserID(self, v10, v11);
  else
    objc_msgSend_recordName(v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v5, v13, (uint64_t)v12);

  objc_msgSend_setType_(v5, v14, 2);
  return v5;
}

- (id)identityFromPUser:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *inited;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C95210]);
    inited = (void *)objc_msgSend_initInternal(v4, v5, v6);
    objc_msgSend_lastName(v3, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameComponents(inited, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v13, v14, (uint64_t)v10);

    objc_msgSend_firstName(v3, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameComponents(inited, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v20, v21, (uint64_t)v17);

    objc_msgSend_identifier(v3, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend_hasName(v24, v25, v26);

    if ((_DWORD)v20)
    {
      v27 = objc_alloc(MEMORY[0x1E0C95070]);
      objc_msgSend_identifier(v3, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend_initWithRecordName_(v27, v34, (uint64_t)v33);
      objc_msgSend_setUserRecordID_(inited, v36, (uint64_t)v35);

    }
  }
  else
  {
    inited = 0;
  }

  return inited;
}

- (BOOL)dontCreateValidatingParentReferences
{
  return self->_dontCreateValidatingParentReferences;
}

- (void)setDontCreateValidatingParentReferences:(BOOL)a3
{
  self->_dontCreateValidatingParentReferences = a3;
}

- (NSString)packageStagingDirectory
{
  return self->_packageStagingDirectory;
}

- (NSString)orgAdminUserID
{
  return self->_orgAdminUserID;
}

- (CKDProtocolTranslatorIdentityDelegate)identityDelegate
{
  return (CKDProtocolTranslatorIdentityDelegate *)objc_loadWeakRetained((id *)&self->_identityDelegate);
}

- (void)setOverriddenContainerScopedUserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setOverriddenDatabaseScope:(int64_t)a3
{
  self->_overriddenDatabaseScope = a3;
}

- (NSMutableDictionary)downloadPreauthorizationMap
{
  return self->_downloadPreauthorizationMap;
}

- (CKDPCSManager)pcsManager
{
  return self->_pcsManager;
}

@end

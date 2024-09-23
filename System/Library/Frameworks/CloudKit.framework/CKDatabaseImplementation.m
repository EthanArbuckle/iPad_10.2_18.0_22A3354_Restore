@implementation CKDatabaseImplementation

- (int64_t)scope
{
  return self->_scope;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (id)initInternalWithContainerImplementation:(id)a3 scope:(int64_t)a4
{
  id v6;
  CKDatabaseImplementation *v7;
  CKDatabaseImplementation *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *underlyingDispatchQueue;
  uint64_t v24;
  NSOperationQueue *operationQueue;
  const char *v26;
  uint64_t v27;
  objc_super v29;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDatabaseImplementation;
  v7 = -[CKDatabaseImplementation init](&v29, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containerImplementation, v6);
    v8->_scope = a4;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v6, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v14, (uint64_t)CFSTR("%@.%@"), v15, CFSTR("com.apple.cloudkit.database-queue"), v13);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v20, v21);
    underlyingDispatchQueue = v8->_underlyingDispatchQueue;
    v8->_underlyingDispatchQueue = (OS_dispatch_queue *)v22;

    v24 = objc_opt_new();
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = (NSOperationQueue *)v24;

    objc_msgSend_setUnderlyingQueue_(v8->_operationQueue, v26, (uint64_t)v8->_underlyingDispatchQueue, v27);
  }

  return v8;
}

- (CKContainerImplementation)containerImplementation
{
  return (CKContainerImplementation *)objc_loadWeakRetained((id *)&self->_containerImplementation);
}

- (void)addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5
{
  objc_msgSend__addOperation_wrappingDatabase_convenienceConfiguration_isConvenience_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0);
}

- (void)_addOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 isConvenience:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CKException *v37;
  const char *v38;
  id v39;
  int v40;
  void *v41;
  uint64_t v42;

  v6 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [CKException alloc];
    v39 = (id)objc_msgSend_initWithCode_format_(v37, v38, 12, (uint64_t)CFSTR("Only CKDatabaseOperations must be submitted to a CKDatabase"));
    objc_exception_throw(v39);
  }
  objc_msgSend_databaseScope(self, v13, v14, v15);
  objc_msgSend_setDatabase_(v10, v16, (uint64_t)v11, v17);
  objc_msgSend_applyConvenienceConfiguration_(v10, v18, (uint64_t)v12, v19);
  objc_msgSend_containerImplementation(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23;
  if (!v6)
    goto LABEL_9;
  if (!v23)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v32 = v28;
      objc_msgSend_operationID(v10, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138412290;
      v41 = v36;
      _os_log_error_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_ERROR, "No container found while enqueuing CKDatabase convenience operation %@", (uint8_t *)&v40, 0xCu);

    }
LABEL_9:
    objc_msgSend_operationQueue(self, v24, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v29, v30, (uint64_t)v10, v31);

    goto LABEL_10;
  }
  objc_msgSend__addPreparedConvenienceOperation_(v23, v24, (uint64_t)v10, v26);
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_containerImplementation);
  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_scope(self, a2, v2, v3);
  if (v6 > 4)
    v10 = CFSTR("INVALID_SCOPE");
  else
    v10 = off_1E1F64FF8[v6];
  objc_msgSend_containerImplementation(self, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v12, (uint64_t)CFSTR("databaseScope=%@, containerImplementation=%@"), v13, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDatabaseImplementation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (unint64_t)countAssetCacheItems
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  objc_msgSend_containerImplementation(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A790A18;
  v9[3] = &unk_1E1F64EA0;
  v9[4] = self;
  v9[5] = &v10;
  if (v5)
    sub_18A5ECA88(v5, 1, (void *)1, 0, &unk_1E1F58818, v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)clearAssetCache
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend_containerImplementation(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A790CC8;
  v7[3] = &unk_1E1F60BB8;
  v7[4] = self;
  if (v5)
    sub_18A5ECA88(v5, 1, (void *)1, 0, &unk_1E1F58EB8, v7);

}

- (void)showAssetCache
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend_containerImplementation(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A790F20;
  v7[3] = &unk_1E1F60BB8;
  v7[4] = self;
  if (v5)
    sub_18A5ECA88(v5, 0, (void *)1, 0, &unk_1E1F64EC0, v7);

}

- (void)clearRecordCache
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend_containerImplementation(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A791090;
  v7[3] = &unk_1E1F60BB8;
  v7[4] = self;
  if (v5)
    sub_18A5ECA88(v5, 0, (void *)1, 0, &unk_1E1F59078, v7);

}

- (void)clearAuthTokensForRecordWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CKDatabaseImplementation *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend_containerImplementation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A7911B4;
  v14[3] = &unk_1E1F5F958;
  v15 = v4;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = sub_18A7912A0;
  v11[3] = &unk_1E1F60A98;
  v12 = v15;
  v13 = self;
  v10 = v15;
  if (v8)
    sub_18A5ECA88(v8, 0, (void *)1, 0, v14, v11);

}

- (void)getCorruptRecordsForAllZonesWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend_containerImplementation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A791434;
  v10[3] = &unk_1E1F609D8;
  v11 = v4;
  v9 = v4;
  if (v8)
    sub_18A5ECA88(v8, 0, (void *)1, 0, &unk_1E1F591B8, v10);

}

- (void)clearCachesWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v6 = a4;
  objc_msgSend_containerImplementation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A79159C;
  v12[3] = &unk_1E1F64EE8;
  v13 = v6;
  v14 = a3;
  v12[4] = self;
  v11 = v6;
  if (v10)
    sub_18A5ECA88(v10, 0, (void *)1, 0, &unk_1E1F59258, v12);

}

- (void)clearCacheEntriesForRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKDatabaseImplementation *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_containerImplementation(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A791770;
  v14[3] = &unk_1E1F61120;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  if (v11)
    sub_18A5ECA88(v11, 0, (void *)1, 0, &unk_1E1F59358, v14);

}

- (void)clearCacheEntriesForZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKDatabaseImplementation *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_containerImplementation(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A791940;
  v14[3] = &unk_1E1F61120;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  if (v11)
    sub_18A5ECA88(v11, 0, (void *)1, 0, &unk_1E1F59398, v14);

}

- (void)fetchPCSFromCacheForZoneWithID:(id)a3 localCacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CKDatabaseImplementation *v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend_containerImplementation(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A791B20;
  v16[3] = &unk_1E1F64F10;
  v17 = v8;
  v18 = self;
  v20 = a4;
  v19 = v9;
  v14 = v9;
  v15 = v8;
  if (v13)
    sub_18A5ECA88(v13, 0, (void *)1, 0, &unk_1E1F59438, v16);

}

- (void)fetchPCSFromCacheForShareWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKDatabaseImplementation *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_containerImplementation(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A791CF4;
  v14[3] = &unk_1E1F61120;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  if (v11)
    sub_18A5ECA88(v11, 0, (void *)1, 0, &unk_1E1F59458, v14);

}

- (void)fetchPCSFromCacheForRecordWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKDatabaseImplementation *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_containerImplementation(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A791EC4;
  v14[3] = &unk_1E1F61120;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  if (v11)
    sub_18A5ECA88(v11, 0, (void *)1, 0, &unk_1E1F59578, v14);

}

- (void)clearInvalidatedPCSCacheEntriesIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend_containerImplementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    sub_18A5ECA88(v4, 0, (void *)1, 0, &unk_1E1F59678, &unk_1E1F596D8);
    v4 = v5;
  }

}

- (id)CKStatusReportArray
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_operationQueue(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_operationCount(v8, v9, v10, v11);
  objc_msgSend_operationQueue(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_maxConcurrentOperationCount(v16, v17, v18, v19);
  objc_msgSend_stringWithFormat_(v4, v21, (uint64_t)CFSTR("%@, %lu/%ld operations"), v22, self, v12, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  objc_msgSend_operationQueue(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_operationCount(v29, v30, v31, v32);

  if (v33)
  {
    objc_msgSend_addObject_(v3, v34, (uint64_t)CFSTR("\nOperations: {"), v35);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend_operationQueue(self, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v61, 16);
    if (v45)
    {
      v48 = v45;
      v49 = *(_QWORD *)v58;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v58 != v49)
            objc_enumerationMutation(v43);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v46, (uint64_t)CFSTR("\t%@"), v47, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v50));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v52, (uint64_t)v51, v53);

          ++v50;
        }
        while (v48 != v50);
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v61, 16);
      }
      while (v48);
    }

    objc_msgSend_addObject_(v3, v54, (uint64_t)CFSTR("}"), v55);
  }
  return v3;
}

- (void)_scheduleConvenienceOperation:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v16 = a3;
  objc_msgSend_databaseScope(self, v10, v11, v12);
  objc_msgSend_configureConvenience_(v16, v13, (uint64_t)v8, v14);
  objc_msgSend__addOperation_wrappingDatabase_convenienceConfiguration_isConvenience_(self, v15, (uint64_t)v16, (uint64_t)v9, v8, 1);

}

- (void)fetchRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKFetchRecordsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  CKException *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42 = 0;
  v14 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 1, 0, &v42);
  v15 = v42;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v28 = [CKException alloc];
    v32 = objc_msgSend_code(v16, v29, v30, v31);
    objc_msgSend_localizedDescription(v16, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, (uint64_t)CFSTR("%@"), v36);

    objc_exception_throw(v38);
  }

  v17 = [CKFetchRecordsOperation alloc];
  v43[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithRecordIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_18A792488;
  v39[3] = &unk_1E1F64FB0;
  v40 = v10;
  v41 = v13;
  v23 = v13;
  v24 = v10;
  objc_msgSend_setFetchRecordsCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);

}

- (void)saveRecord:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifyRecordsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"record", v10, 0, 0, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifyRecordsOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A792828;
  v38[3] = &unk_1E1F64F38;
  v39 = v10;
  v40 = v13;
  v22 = v13;
  v23 = v10;
  objc_msgSend_setModifyRecordsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)deleteRecordWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifyRecordsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 1, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifyRecordsOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A792BB8;
  v38[3] = &unk_1E1F64F38;
  v39 = v10;
  v40 = v13;
  v22 = v13;
  v23 = v10;
  objc_msgSend_setModifyRecordsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)performQuery:(id)a3 inZoneWithID:(id)a4 wrappingDatabase:(id)a5 convenienceConfiguration:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  CKQueryOperation *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  id v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  CKException *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v52 = 0;
  v17 = _CKCheckArgument((uint64_t)"query", v12, 0, 0, 0, &v52);
  v18 = v52;
  v19 = v18;
  if ((v17 & 1) == 0)
  {
    v36 = [CKException alloc];
    v40 = objc_msgSend_code(v19, v37, v38, v39);
    objc_msgSend_localizedDescription(v19, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)objc_msgSend_initWithCode_format_(v36, v45, v40, (uint64_t)CFSTR("%@"), v44);

    objc_exception_throw(v46);
  }

  v20 = (void *)objc_opt_new();
  v21 = [CKQueryOperation alloc];
  v24 = (void *)objc_msgSend_initWithQuery_(v21, v22, (uint64_t)v12, v23);
  objc_msgSend_setZoneID_(v24, v25, (uint64_t)v13, v26);
  v27 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_18A792F30;
  v50[3] = &unk_1E1F64F60;
  v28 = v20;
  v51 = v28;
  objc_msgSend_setRecordMatchedBlock_(v24, v29, (uint64_t)v50, v30);
  v47[0] = v27;
  v47[1] = 3221225472;
  v47[2] = sub_18A792FC8;
  v47[3] = &unk_1E1F64F88;
  v48 = v28;
  v49 = v16;
  v31 = v28;
  v32 = v16;
  objc_msgSend_setQueryCompletionBlock_(v24, v33, (uint64_t)v47, v34);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v35, (uint64_t)v24, (uint64_t)v14, v15);

}

- (void)fetchAllRecordZonesWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_fetchAllRecordZonesOperation(CKFetchRecordZonesOperation, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A7930C0;
  v19[3] = &unk_1E1F61148;
  v20 = v8;
  v15 = v8;
  objc_msgSend_setFetchRecordZonesCompletionBlock_(v14, v16, (uint64_t)v19, v17);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v18, (uint64_t)v14, (uint64_t)v10, v9);

}

- (void)fetchRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKFetchRecordZonesOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  CKException *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42 = 0;
  v14 = _CKCheckArgument((uint64_t)"zoneID", v10, 0, 1, 0, &v42);
  v15 = v42;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v28 = [CKException alloc];
    v32 = objc_msgSend_code(v16, v29, v30, v31);
    objc_msgSend_localizedDescription(v16, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, (uint64_t)CFSTR("%@"), v36);

    objc_exception_throw(v38);
  }

  v17 = [CKFetchRecordZonesOperation alloc];
  v43[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithRecordZoneIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_18A79332C;
  v39[3] = &unk_1E1F64FB0;
  v40 = v10;
  v41 = v13;
  v23 = v10;
  v24 = v13;
  objc_msgSend_setFetchRecordZonesCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);

}

- (void)saveRecordZone:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifyRecordZonesOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"zone", v10, 0, 0, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifyRecordZonesOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A7935CC;
  v38[3] = &unk_1E1F64220;
  v39 = v10;
  v40 = v13;
  v22 = v10;
  v23 = v13;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)deleteRecordZoneWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifyRecordZonesOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"zoneID", v10, 0, 1, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifyRecordZonesOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A79386C;
  v38[3] = &unk_1E1F64220;
  v39 = v10;
  v40 = v13;
  v22 = v10;
  v23 = v13;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)saveSubscription:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifySubscriptionsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"subscription", v10, 0, 0, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifySubscriptionsOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v17, v20, (uint64_t)v19, 0);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A793AF8;
  v38[3] = &unk_1E1F64F38;
  v39 = v10;
  v40 = v13;
  v22 = v13;
  v23 = v10;
  objc_msgSend_setModifySubscriptionsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)checkSupportedDeviceCapabilitiesInZone:(id)a3 desiredCapabilities:(id)a4 options:(id)a5 wrappingDatabase:(id)a6 convenienceConfiguration:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  CKCheckSupportedDeviceCapabilitiesOperation *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  CKException *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v59 = 0;
  v20 = _CKCheckArgument((uint64_t)"zone", v14, 0, 0, 0, &v59);
  v21 = v59;
  v22 = v21;
  if ((v20 & 1) == 0)
  {
    v44 = [CKException alloc];
    v48 = objc_msgSend_code(v22, v45, v46, v47);
    objc_msgSend_localizedDescription(v22, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (id)objc_msgSend_initWithCode_format_(v44, v53, v48, (uint64_t)CFSTR("%@"), v52);

    objc_exception_throw(v54);
  }

  v23 = [CKCheckSupportedDeviceCapabilitiesOperation alloc];
  objc_msgSend_zoneID(v14, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v60, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_initWithDesiredCapabilities_zoneIDs_options_(v23, v30, (uint64_t)v15, (uint64_t)v29, v16);

  objc_msgSend_resolvedConfiguration(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestOriginator_(v35, v36, 4, v37);

  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_18A793ED8;
  v55[3] = &unk_1E1F64FD8;
  v57 = v15;
  v58 = v19;
  v56 = v14;
  v38 = v15;
  v39 = v14;
  v40 = v19;
  objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlock_(v31, v41, (uint64_t)v55, v42);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v43, (uint64_t)v31, (uint64_t)v17, v18);

}

- (void)deleteSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKModifySubscriptionsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  CKException *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41 = 0;
  v14 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v41);
  v15 = v41;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v27 = [CKException alloc];
    v31 = objc_msgSend_code(v16, v28, v29, v30);
    objc_msgSend_localizedDescription(v16, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend_initWithCode_format_(v27, v36, v31, (uint64_t)CFSTR("%@"), v35);

    objc_exception_throw(v37);
  }

  v17 = [CKModifySubscriptionsOperation alloc];
  v42[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v17, v20, 0, (uint64_t)v19);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_18A794188;
  v38[3] = &unk_1E1F64F38;
  v39 = v10;
  v40 = v13;
  v22 = v13;
  v23 = v10;
  objc_msgSend_setModifySubscriptionsCompletionBlock_(v21, v24, (uint64_t)v38, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v26, (uint64_t)v21, (uint64_t)v11, v12);

}

- (void)fetchSubscriptionWithID:(id)a3 wrappingDatabase:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKFetchSubscriptionsOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  CKException *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42 = 0;
  v14 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v42);
  v15 = v42;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v28 = [CKException alloc];
    v32 = objc_msgSend_code(v16, v29, v30, v31);
    objc_msgSend_localizedDescription(v16, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id)objc_msgSend_initWithCode_format_(v28, v37, v32, (uint64_t)CFSTR("%@"), v36);

    objc_exception_throw(v38);
  }

  v17 = [CKFetchSubscriptionsOperation alloc];
  v43[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithSubscriptionIDs_(v17, v20, (uint64_t)v19, v21);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_18A7944E0;
  v39[3] = &unk_1E1F64FB0;
  v40 = v10;
  v41 = v13;
  v23 = v13;
  v24 = v10;
  objc_msgSend_setFetchSubscriptionCompletionBlock_(v22, v25, (uint64_t)v39, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v27, (uint64_t)v22, (uint64_t)v11, v12);

}

- (void)fetchAllSubscriptionsWithWrappingDatabase:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_fetchAllSubscriptionsOperation(CKFetchSubscriptionsOperation, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A794728;
  v19[3] = &unk_1E1F61148;
  v20 = v8;
  v15 = v8;
  objc_msgSend_setFetchSubscriptionCompletionBlock_(v14, v16, (uint64_t)v19, v17);
  objc_msgSend__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_(self, v18, (uint64_t)v14, (uint64_t)v10, v9);

}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

@end

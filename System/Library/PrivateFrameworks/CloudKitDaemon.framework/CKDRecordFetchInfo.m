@implementation CKDRecordFetchInfo

- (CKDRecordFetchInfo)initWithAggregator:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDRecordFetchInfo *v7;
  uint64_t v8;
  OS_dispatch_source *recordReadySource;
  const char *v10;
  uint64_t v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKDRecordFetchInfo;
  v7 = -[CKDRecordFetchInfo init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend_recordReadySource(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    recordReadySource = v7->_recordReadySource;
    v7->_recordReadySource = (OS_dispatch_source *)v8;

    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v10, v11);
    v7->_startDate = v12;
  }

  return v7;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v3;

  self->_state = a3;
  if (a3 == 3)
  {
    objc_msgSend_recordReadySource(self, a2, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_merge_data(v3, 1uLL);

  }
}

- (void)performCallback
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2) != 3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 129, CFSTR("Fetch info isn't in the needs callback state: %@"), self);

  }
  objc_msgSend_record(self, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_4;
  objc_msgSend_error(self, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v38, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 130, CFSTR("Calling back for record %@ without a fetched record or an error: %@"), v37, self);

LABEL_4:
  }
  objc_msgSend_completionBlock(self, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_completionBlock(self, v14, v15);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(self, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && !objc_msgSend_ignoreErrors(self, v22, v23))
    {
      v26 = 0;
      v25 = 0;
    }
    else
    {
      objc_msgSend_record(self, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 1;
    }
    objc_msgSend_error(self, v22, v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v16)[2](v16, v19, v25, v33);

    if (v26)
    objc_msgSend_setCompletionBlock_(self, v34, 0);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v29 = v27;
      objc_msgSend_recordID(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_impl(&dword_1BE990000, v29, OS_LOG_TYPE_INFO, "Warn: No completion block was set for the fetch of record %@", buf, 0xCu);

    }
  }
  objc_msgSend_setState_(self, v28, 4);
}

- (id)CKPropertiesDescription
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t Order;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  Order = objc_msgSend_fetchOrder(self, v5, v6);
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("fetchOrder=%lu"), Order);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  objc_msgSend_recordID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_recordID(self, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("recordID=%@"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);

  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = objc_msgSend_state(self, v14, v15);
  if ((unint64_t)(v25 - 1) > 3)
    objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("state=%@"), CFSTR("Not Started"));
  else
    objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("state=%@"), off_1E7835978[v25 - 1]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_record(self, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = CFSTR("YES");
  if (!v33)
    v34 = CFSTR("NO");
  objc_msgSend_stringWithFormat_(v29, v32, (uint64_t)CFSTR("hasRecord=%@"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v36, (uint64_t)v35);

  v37 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_etag(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v37, v41, (uint64_t)CFSTR("etag=%@"), v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v43, (uint64_t)v42);

  objc_msgSend_error(self, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_error(self, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v49, v51, (uint64_t)CFSTR("error=%@"), v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v53, (uint64_t)v52);

  }
  objc_msgSend_componentsJoinedByString_(v3, v47, (uint64_t)CFSTR(", "));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordFetchInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (double)startDate
{
  return self->_startDate;
}

- (unint64_t)fetchOrder
{
  return self->_fetchOrder;
}

- (void)setFetchOrder:(unint64_t)a3
{
  self->_fetchOrder = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_source)recordReadySource
{
  return self->_recordReadySource;
}

- (void)setRecordReadySource:(id)a3
{
  objc_storeStrong((id *)&self->_recordReadySource, a3);
}

- (BOOL)ignoreErrors
{
  return self->_ignoreErrors;
}

- (void)setIgnoreErrors:(BOOL)a3
{
  self->_ignoreErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordReadySource, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end

@implementation APCoordinatedRetryBox

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_requestDelegate);
}

- (APCoordinatedRetryBox)initWithType:(int64_t)a3 delegate:(id)a4
{
  id v6;
  APCoordinatedRetryBox *v7;
  APCoordinatedRetryBox *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  NSUUID *requestID;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  NSUUID *requesterID;
  objc_super v26;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)APCoordinatedRetryBox;
  v7 = -[APCoordinatedRetryBox init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_requestType = a3;
    objc_storeWeak((id *)&v7->_requestDelegate, v6);
    v8->_canRetry = 1;
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v9, v10, v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    requestID = v8->_requestID;
    v8->_requestID = (NSUUID *)v15;

    objc_msgSend_requesterID(v6, v17, v18, v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    requesterID = v8->_requesterID;
    v8->_requesterID = (NSUUID *)v23;

  }
  return v8;
}

- (NSUUID)requesterID
{
  return self->_requesterID;
}

- (APRequestCoordinatorDelegate)requestDelegate
{
  return (APRequestCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_requestDelegate);
}

- (NSDictionary)diagnosticReportPayload
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t canRetry;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  double v69;
  void *v70;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend_requestType(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_numberWithInteger_(v4, v12, v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v18, (uint64_t)v17, (uint64_t)CFSTR("kAPCoordinatedRetryBoxRequestType"), v19, v20, v21);

  v22 = (void *)MEMORY[0x24BDD16E0];
  canRetry = objc_msgSend_canRetry(self, v23, v24, v25, v26, v27, v28);
  objc_msgSend_numberWithBool_(v22, v30, canRetry, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v36, (uint64_t)v35, (uint64_t)CFSTR("kAPCoordinatedRetryBoxCanRetry"), v37, v38, v39);

  objc_msgSend_requestID(self, v40, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend_requestID(self, v47, v48, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v3, v54, (uint64_t)v53, (uint64_t)CFSTR("kAPCoordinatedRetryBoxRequestID"), v55, v56, v57);

  }
  objc_msgSend_requesterID(self, v47, v48, v49, v50, v51, v52);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_requesterID(self, v59, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v3, v66, (uint64_t)v65, (uint64_t)CFSTR("kAPCoordinatedRetryBoxRequesterID"), v67, v68, v69);

  }
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v59, (uint64_t)v3, v61, v62, v63, v64);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v70;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  char isEqual;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_requestID(self, v5, v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestID(v4, v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v11, v19, (uint64_t)v18, v20, v21, v22, v23);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (BOOL)canRetry
{
  return self->_canRetry;
}

- (void)setCanRetry:(BOOL)a3
{
  self->_canRetry = a3;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

@end

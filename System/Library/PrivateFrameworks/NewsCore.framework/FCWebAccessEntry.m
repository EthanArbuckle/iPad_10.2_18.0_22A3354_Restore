@implementation FCWebAccessEntry

- (_QWORD)initWithEntryID:(void *)a3 tagID:(void *)a4 purchaseID:(void *)a5 lastRetryAttemptTime:(void *)a6 email:(void *)a7 purchaseReceipt:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!a1)
    goto LABEL_12;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("web access entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:]";
    v38 = 2080;
    v39 = "FCPurchaseController.m";
    v40 = 1024;
    v41 = 1805;
    v42 = 2114;
    v43 = v33;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v14)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("web access entry must have an tag ID"));
        *(_DWORD *)buf = 136315906;
        v37 = "-[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:]";
        v38 = 2080;
        v39 = "FCPurchaseController.m";
        v40 = 1024;
        v41 = 1806;
        v42 = 2114;
        v43 = v34;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v14)
  {
    goto LABEL_5;
  }
  v35.receiver = a1;
  v35.super_class = (Class)FCWebAccessEntry;
  v19 = objc_msgSendSuper2(&v35, sel_init);
  a1 = v19;
  if (v19)
  {
    if (v13)
    {
      v20 = objc_msgSend(v13, "copy");
      v21 = (void *)a1[5];
      a1[5] = v20;

      v22 = objc_msgSend(v14, "copy");
      v23 = (void *)a1[6];
      a1[6] = v22;

      v24 = objc_msgSend(v15, "copy");
      v25 = (void *)a1[2];
      a1[2] = v24;

      v26 = objc_msgSend(v16, "copy");
      v27 = (void *)a1[4];
      a1[4] = v26;

      v28 = objc_msgSend(v17, "copy");
      v29 = (void *)a1[1];
      a1[1] = v28;

      v30 = objc_msgSend(v18, "copy");
      v31 = (void *)a1[3];
      a1[3] = v30;
    }
    else
    {
      v31 = v19;
      a1 = 0;
    }

  }
LABEL_12:

  return a1;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (NSString)purchaseReceipt
{
  return self->_purchaseReceipt;
}

- (NSDate)lastRetryAttemptTime
{
  return self->_lastRetryAttemptTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastRetryAttemptTime, 0);
  objc_storeStrong((id *)&self->_purchaseReceipt, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end

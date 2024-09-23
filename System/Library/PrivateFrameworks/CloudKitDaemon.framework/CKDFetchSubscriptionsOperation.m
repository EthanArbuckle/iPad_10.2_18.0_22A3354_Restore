@implementation CKDFetchSubscriptionsOperation

- (CKDFetchSubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchSubscriptionsOperation *v9;
  uint64_t v10;
  NSArray *subscriptionIDs;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchSubscriptionsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v15, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_subscriptionIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    subscriptionIDs = v9->_subscriptionIDs;
    v9->_subscriptionIDs = (NSArray *)v10;

    v9->_isFetchAllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(v6, v12, v13);
  }

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-subscriptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleSubscriptionFetched:(id)a3 withID:(id)a4 responseCode:(id)a5
{
  unint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  uint8_t buf[16];

  v8 = (unint64_t)a3;
  v9 = a4;
  v10 = a5;
  v13 = objc_msgSend_code(v10, v11, v12);
  v16 = (uint64_t *)MEMORY[0x1E0C94B20];
  if (v13 == 1)
  {
    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C94FF8];
    v19 = *MEMORY[0x1E0C94B20];
    v20 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v23, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v18, v25, v19, v20, v24, CFSTR("Error fetching subscription %@"), v9);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  if (!(v8 | v17))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v26, OS_LOG_TYPE_ERROR, "Unexpectedly received no subscription but also a successful error code", buf, 2u);
    }
    v27 = (void *)MEMORY[0x1E0C94FF8];
    v28 = *v16;
    v29 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v32, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v34, v28, v29, v33, CFSTR("Error fetching subscription %@"), v9);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_callbackQueue(self, v14, v15);
  v35 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB1F2B0;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v40 = (id)v8;
  v41 = v9;
  v42 = (id)v17;
  v36 = (id)v17;
  v37 = v9;
  v38 = (id)v8;
  dispatch_async(v35, block);

}

- (int)operationType
{
  return 301;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char AllSubscriptionsOperation;
  const char *v10;
  CKDFetchSubscriptionsURLRequest *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  id from;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  objc_msgSend_subscriptionIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {

LABEL_4:
    objc_initWeak(&location, self);
    v11 = [CKDFetchSubscriptionsURLRequest alloc];
    objc_msgSend_subscriptionIDs(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithOperation_subscriptionIDs_(v11, v15, (uint64_t)self, v14);

    v17 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_1BEB1F590;
    v35[3] = &unk_1E7833C50;
    objc_copyWeak(&v36, &location);
    objc_msgSend_setSubscriptionFetchedBlock_(v16, v18, (uint64_t)v35);
    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = sub_1BEB1F608;
    v33[3] = &unk_1E7833C78;
    objc_copyWeak(&v34, &location);
    objc_msgSend_setErrorFetchingAllSubscriptionsBlock_(v16, v19, (uint64_t)v33);
    objc_initWeak(&from, v16);
    v26 = v17;
    v27 = 3221225472;
    v28 = sub_1BEB1F834;
    v29 = &unk_1E782E468;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    objc_msgSend_setCompletionBlock_(v16, v20, (uint64_t)&v26);
    objc_msgSend_setRequest_(self, v21, (uint64_t)v16, v26, v27, v28, v29);
    objc_msgSend_container(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v24, v25, (uint64_t)v16);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
    return;
  }
  AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v7, v8);

  if ((AllSubscriptionsOperation & 1) != 0)
    goto LABEL_4;
  objc_msgSend_finishWithError_(self, v10, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setSubscriptionFetchedProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchSubscriptionsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)subscriptionFetchedProgressBlock
{
  return self->_subscriptionFetchedProgressBlock;
}

- (void)setSubscriptionFetchedProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDs, a3);
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchAllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_subscriptionFetchedProgressBlock, 0);
}

@end

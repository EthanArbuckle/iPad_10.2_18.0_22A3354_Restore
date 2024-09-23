@implementation FCReceiptRefresher

- (id)refreshForPurchase:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D60AE8]);
  -[FCReceiptRefresher setPendingPromise:](self, "setPendingPromise:", v5);

  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReceiptRefresher setRestoreBundleID:](self, "setRestoreBundleID:", v6);

  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v7 = (void *)_MergedGlobals_175;
  v34 = _MergedGlobals_175;
  if (!_MergedGlobals_175)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __getSKReceiptRefreshRequestClass_block_invoke;
    v29 = &unk_1E46406D0;
    v30 = &v31;
    __getSKReceiptRefreshRequestClass_block_invoke((uint64_t)&v26);
    v7 = (void *)v32[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v31, 8);
  v9 = objc_alloc_init(v8);
  -[FCReceiptRefresher setRequest:](self, "setRequest:", v9);

  FCDeviceIdentifierForVendor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v11 = (void *)qword_1ED0F8430;
  v34 = qword_1ED0F8430;
  if (!qword_1ED0F8430)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __getSKPaymentQueueClientClass_block_invoke_0;
    v29 = &unk_1E46406D0;
    v30 = &v31;
    __getSKPaymentQueueClientClass_block_invoke_0((uint64_t)&v26);
    v11 = (void *)v32[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v31, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v13, "setBundleIdentifier:", CFSTR("com.apple.news"));
  objc_msgSend(v4, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProductsRequestBundleIdentifier:", v14);

  objc_msgSend(v4, "appAdamID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStoreItemIdentifier:", v15);

  objc_msgSend(v13, "setBundleVersion:", CFSTR("1.0"));
  objc_msgSend(v4, "storeExternalVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStoreExternalVersion:", v16);

  objc_msgSend(v13, "setVendorIdentifier:", v10);
  -[FCReceiptRefresher restoreBundleID](self, "restoreBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FCPurchaseReceiptDirectoryURL(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReceiptDirectoryPath:", v19);

  -[FCReceiptRefresher request](self, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaymentQueueClient:", v13);

  -[FCReceiptRefresher request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[FCReceiptRefresher request](self, "request");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "start");

  -[FCReceiptRefresher pendingPromise](self, "pendingPromise");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "promise");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)requestDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD);
  id v11;

  -[FCReceiptRefresher restoreBundleID](self, "restoreBundleID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCPurchaseReceiptDirectoryURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("/StoreKit/receipt"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FCReceiptRefresher pendingPromise](self, "pendingPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolve");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.refresh.receipt"), 1001, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCReceiptRefresher pendingPromise](self, "pendingPromise");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reject");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v8);

  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v5 = a4;
  -[FCReceiptRefresher pendingPromise](self, "pendingPromise");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reject");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);

}

- (NSString)restoreBundleID
{
  return self->_restoreBundleID;
}

- (void)setRestoreBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SKReceiptRefreshRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NFPendingPromise)pendingPromise
{
  return self->_pendingPromise;
}

- (void)setPendingPromise:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPromise, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_restoreBundleID, 0);
}

@end

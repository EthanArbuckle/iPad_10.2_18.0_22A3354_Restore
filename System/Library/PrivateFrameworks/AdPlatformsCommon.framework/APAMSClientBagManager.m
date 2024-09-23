@implementation APAMSClientBagManager

+ (NSString)bagSubProfile
{
  if (qword_253D8AE98 != -1)
    dispatch_once(&qword_253D8AE98, &unk_24DC80620);
  return (NSString *)(id)qword_253D8AE90;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_253D8AEA8 != -1)
    dispatch_once(&qword_253D8AEA8, &unk_24DC80838);
  return (NSString *)(id)qword_253D8AEA0;
}

+ (id)adprivacydBag
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;

  v7 = (void *)MEMORY[0x24BE08050];
  objc_msgSend_bagSubProfile(APAMSClientBagManager, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bagSubProfileVersion(APAMSClientBagManager, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bagForProfile_profileVersion_(v7, v16, (uint64_t)v8, (uint64_t)v15, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (BOOL)isSubsequentAdsFetchDisabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v8;
  dispatch_semaphore_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  dispatch_time_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  BOOL v38;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_adprivacydBag(a1, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_semaphore_create(0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  objc_msgSend_BOOLForKey_(v8, v10, (uint64_t)CFSTR("disablePromotedContentDaemonSubsequentAdsFetch"), v11, v12, COERCE_DOUBLE(0x2020000000), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valuePromise(v14, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = sub_21A21C8D4;
  v40[3] = &unk_24DC80860;
  v42 = &v44;
  v43 = a1;
  v22 = v9;
  v41 = v22;
  objc_msgSend_addFinishBlock_(v21, v23, (uint64_t)v40, v24, v25, v26, v27);
  v28 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v22, v28))
  {
    APLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v49 = v30;
      v31 = v30;
      _os_log_impl(&dword_21A211000, v29, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'disablePromotedContentDaemonSubsequentAdsFetch' key from the bag in time.", buf, 0xCu);

    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v32, (uint64_t)CFSTR("Failed to get the 'disablePromotedContentDaemonSubsequentAdsFetch' key from the bag in time."), v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    CreateDiagnosticReport();

  }
  v38 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  return v38;
}

+ (void)isSubsequentAdsFetchDisabled:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v11 = a4;
  if (!v6)
  {
    objc_msgSend_adprivacydBag(a1, v7, v8, v9, v10, v12, v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_BOOLForKey_(v6, v7, (uint64_t)CFSTR("disablePromotedContentDaemonSubsequentAdsFetch"), v9, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_21A21CA98;
  v21[3] = &unk_24DC80888;
  v22 = v11;
  v23 = a1;
  v15 = v11;
  objc_msgSend_valueWithCompletion_(v14, v16, (uint64_t)v21, v17, v18, v19, v20);

}

+ (void)isDisabledAdsPrefetch:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v11 = a4;
  if (!v6)
  {
    objc_msgSend_adprivacydBag(a1, v7, v8, v9, v10, v12, v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_BOOLForKey_(v6, v7, (uint64_t)CFSTR("disableAdsPreFetch7006"), v9, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_21A21CC64;
  v21[3] = &unk_24DC808B0;
  v22 = v11;
  v15 = v11;
  objc_msgSend_valueWithCompletion_(v14, v16, (uint64_t)v21, v17, v18, v19, v20);

}

@end

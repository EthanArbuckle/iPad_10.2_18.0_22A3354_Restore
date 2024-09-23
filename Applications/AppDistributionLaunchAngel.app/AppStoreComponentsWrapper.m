@implementation AppStoreComponentsWrapper

- (AppStoreComponentsWrapper)initWithLogKey:(id)a3
{
  id v5;
  AppStoreComponentsWrapper *v6;
  AppStoreComponentsWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppStoreComponentsWrapper;
  v6 = -[AppStoreComponentsWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logKey, a3);

  return v7;
}

- (id)lockupWithItemID:(id)a3 versionID:(id)a4 distributorID:(id)a5 isForAppStore:(BOOL)a6 delegate:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  objc_class *v20;
  id v21;
  objc_class *v22;
  objc_class *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  _Unwind_Exception *v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_storeWeak((id *)&self->_delegate, v15);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v16 = (void *)qword_1000496D0;
  v44 = qword_1000496D0;
  if (!qword_1000496D0)
  {
    v36 = _NSConcreteStackBlock;
    v37 = 3221225472;
    v38 = (uint64_t)sub_100004578;
    v39 = &unk_100041420;
    v40 = &v41;
    sub_100004578((uint64_t)&v36);
    v16 = (void *)v42[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v41, 8);
  v18 = objc_msgSend([v17 alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v18, "setDelegate:", self);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v19 = (void *)qword_1000496E0;
  v44 = qword_1000496E0;
  if (!qword_1000496E0)
  {
    v36 = _NSConcreteStackBlock;
    v37 = 3221225472;
    v38 = (uint64_t)sub_10000467C;
    v39 = &unk_100041420;
    v40 = &v41;
    sub_10000467C((uint64_t)&v36);
    v19 = (void *)v42[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v41, 8);
  v21 = objc_msgSend([v20 alloc], "initWithStringValue:", v12);
  v22 = (objc_class *)sub_100004090();
  v23 = v22;
  if (!v8)
  {
    v30 = sub_100004148();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v36 = 0;
    v37 = (uint64_t)&v36;
    v38 = 0x2020000000;
    v31 = (_QWORD *)qword_100049700;
    v39 = (void *)qword_100049700;
    if (!qword_100049700)
    {
      v32 = (void *)sub_1000045CC();
      v31 = dlsym(v32, "ASCLockupContextAppDistributionInstall");
      *(_QWORD *)(v37 + 24) = v31;
      qword_100049700 = (uint64_t)v31;
    }
    _Block_object_dispose(&v36, 8);
    if (v31)
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(-[objc_class _requestWithID:kind:context:appVersionId:distributorId:](v23, "_requestWithID:kind:context:appVersionId:distributorId:", v21, v26, *v31, v13, v14));
      goto LABEL_14;
    }
LABEL_16:
    v35 = (_Unwind_Exception *)sub_1000314AC();
    _Block_object_dispose(&v36, 8);
    _Unwind_Resume(v35);
  }
  v24 = [v22 alloc];
  v25 = sub_100004148();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v27 = (_QWORD *)qword_1000496F8;
  v39 = (void *)qword_1000496F8;
  if (!qword_1000496F8)
  {
    v28 = (void *)sub_1000045CC();
    v27 = dlsym(v28, "ASCLockupContextAppStoreInstall");
    *(_QWORD *)(v37 + 24) = v27;
    qword_1000496F8 = (uint64_t)v27;
  }
  _Block_object_dispose(&v36, 8);
  if (!v27)
  {
    sub_1000314AC();
    goto LABEL_16;
  }
  v29 = objc_msgSend(v24, "initWithID:kind:context:", v21, v26, *v27);
LABEL_14:
  v33 = v29;

  objc_msgSend(v18, "setRequest:", v33);
  return v18;
}

- (id)presentingViewControllerForMiniProductPageView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSString *logKey;
  int v10;
  NSString *v11;
  __int16 v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "miniProductPagePresentingViewController"));

  v6 = sub_100003C70(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v10 = 138543618;
    v11 = logKey;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page asked for it's presenting controller, returning %@", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (void)miniProductPageViewDidBeginRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logKey;
  int v7;
  NSString *v8;

  v4 = sub_100003C70(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v7 = 138543362;
    v8 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page began request", (uint8_t *)&v7, 0xCu);
  }

}

- (void)miniProductPageViewDidFinishRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logKey;
  id WeakRetained;
  int v8;
  NSString *v9;

  v4 = sub_100003C70(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v8 = 138543362;
    v9 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page finished request", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "miniProductPageRequestDidFinish");

}

- (void)miniProductPageView:(id)a3 didFailRequestWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  v6 = sub_100003C70(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1000314CC((uint64_t)self, (uint64_t)v5, v7);

}

- (void)miniProductPageViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = sub_100003C70(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100031550((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(v4, "setNeedsLayout");
}

- (void)miniProductPageViewDidPresentDescription:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;

  v4 = sub_100003C70(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000315B8((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "moreButtonPressed");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end

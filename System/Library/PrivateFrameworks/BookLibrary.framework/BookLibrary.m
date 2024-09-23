uint64_t sub_21324077C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_253E79BD8;
  v6 = qword_253E79BD8;
  if (!qword_253E79BD8)
  {
    v7 = xmmword_24CF70C80;
    v8 = *(_OWORD *)&off_24CF70C90;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_253E79BD8 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21324082C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_2132408CC()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_253E79BE0;
  v7 = qword_253E79BE0;
  if (!qword_253E79BE0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213240A58;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213240A58((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21324096C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213240984(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_new();
  v3 = (void *)qword_253E79BF8;
  qword_253E79BF8 = v2;

  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = qword_253E79BF8;
    _os_log_impl(&dword_21323F000, v4, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: using singelton instance: %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend_overrideSharedInstance_(*(void **)(a1 + 32), v5, qword_253E79BF8);
}

Class sub_213240A58(uint64_t a1)
{
  Class result;

  sub_213240AAC();
  result = objc_getClass("MPMediaQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213249108();
  qword_253E79BE0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_213240AAC()
{
  uint64_t v0;
  void *v2;

  v0 = sub_21324077C();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_213240B04()
{
  if (qword_254B8C300 != -1)
    dispatch_once(&qword_254B8C300, &unk_24CF70A50);
  return (id)qword_254B8C2F8;
}

uint64_t sub_213240B44()
{
  id v0;
  void *v1;
  const char *v2;
  const char *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)qword_254B8C2F8;
  qword_254B8C2F8 = (uint64_t)v0;

  objc_msgSend_setMaxConcurrentOperationCount_((void *)qword_254B8C2F8, v2, -1);
  objc_msgSend_setQualityOfService_((void *)qword_254B8C2F8, v3, 25);
  return MEMORY[0x24BEDD108](qword_254B8C2F8, sel_setName_, CFSTR("com.apple.BookLibrary.NSOperationQueue.HLS"));
}

void sub_213240D6C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadQueue(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BLDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v4;
    _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: most recent uiManagerDelegate: %@", buf, 0xCu);
  }

  if (!v4)
  {
LABEL_6:
    objc_msgSend__topMostViewController(*(void **)(a1 + 32), v12, v13);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_7:
    sub_213242898();
    if (objc_opt_class())
    {
      if (v15)
      {
        BLDefaultLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v15;
          _os_log_impl(&dword_21323F000, v18, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: use in-process authenticate with presenter %@", buf, 0xCu);
        }

        sub_213242898();
        v19 = objc_alloc((Class)objc_opt_class());
        v21 = (void *)objc_msgSend_initWithRequest_presentingViewController_(v19, v20, *(_QWORD *)(a1 + 40), v15);
        objc_msgSend_performAuthentication(v21, v22, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = sub_213241070;
        v28[3] = &unk_24CF70A78;
        v29 = *(id *)(a1 + 48);
        objc_msgSend_addFinishBlock_(v24, v25, (uint64_t)v28);

      }
      else
      {
        objc_msgSend_fallback(*(void **)(a1 + 32), v16, v17);
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleAuthenticateRequest_withReply_(v24, v27, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
    }
    else
    {
      BLDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21323F000, v24, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
      }
    }
    goto LABEL_19;
  }
  if ((objc_msgSend_downloadQueue_shouldShowAuthenticateForRequest_(v4, v12, (uint64_t)v7, v10) & 1) != 0)
  {
    objc_msgSend_downloadQueue_viewControllerToPresentAuthenticateUIForRequest_(v4, v14, (uint64_t)v7, v10);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_7;
    goto LABEL_6;
  }
  BLDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v26, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected authenticate request.", buf, 2u);
  }

  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 48));
  if (v15)
  {
    BLError();
    v24 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSObject *))v15)[2](v15, 0, v24);
LABEL_19:

  }
}

void sub_213241070(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 32));
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);

}

uint64_t sub_2132410D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2132411F8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void (**v33)(_QWORD, _QWORD, _QWORD);
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadQueue(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(*(void **)(a1 + 32), v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_4:
    objc_msgSend__topMostViewController(*(void **)(a1 + 32), v10, v11);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_5:
    sub_2132429A4();
    if (objc_opt_class())
    {
      sub_213242AB0();
      if (objc_opt_class())
      {
        if (v14)
        {
          BLDefaultLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v14;
            _os_log_impl(&dword_21323F000, v17, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use in-process dialog with presenter %@", buf, 0xCu);
          }

          sub_2132429A4();
          v18 = objc_alloc((Class)objc_opt_class());
          v20 = (void *)objc_msgSend_initWithRequest_presentingViewController_(v18, v19, *(_QWORD *)(a1 + 40), v14);
          objc_msgSend_present(v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = sub_2132414D4;
          v29[3] = &unk_24CF70AF0;
          v30 = *(id *)(a1 + 40);
          v31 = *(id *)(a1 + 48);
          objc_msgSend_addFinishBlock_(v23, v24, (uint64_t)v29);

        }
        else
        {
          objc_msgSend_fallback(*(void **)(a1 + 32), v15, v16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleDialogRequest_withReply_(v27, v28, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

        }
        goto LABEL_18;
      }
    }
    BLDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21323F000, v25, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if ((objc_msgSend_downloadQueue_shouldShowDialogForRequest_(v4, v10, (uint64_t)v7, v12) & 1) != 0)
  {
    objc_msgSend_downloadQueue_viewControllerToPresentDialogUIForRequest_(v4, v13, (uint64_t)v7, v12);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_5;
    goto LABEL_4;
  }
  BLDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v26, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected dialog request.", buf, 2u);
  }

  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 48));
  if (v14)
  {
    BLError();
    v25 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSObject *))v14)[2](v14, 0, v25);
    goto LABEL_17;
  }
LABEL_18:

}

void sub_2132414D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = 138412290;
    v17 = v6;
    v9 = "[UIHostServiceProxy] received error from AMSSystemAlertDialogTask:  %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(void **)(a1 + 32);
    v16 = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v5;
    v9 = "[UIHostServiceProxy] received result from AMSSystemAlertDialogTask for request %@ and calling replay block with result %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 22;
  }
  _os_log_impl(&dword_21323F000, v10, v11, v9, (uint8_t *)&v16, v12);
LABEL_7:

  v14 = MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 40));
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

uint64_t sub_213241614(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_213241734(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  const char *v18;
  const char *v19;
  uint64_t shouldShowEngagementForRequest;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *);
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;

  objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadQueue(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_2132418C0;
  v24 = &unk_24CF70B40;
  v11 = v4;
  v25 = v11;
  v12 = v7;
  v26 = v12;
  v13 = v10;
  v27 = v13;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v30 = v14;
  v28 = v15;
  v29 = v16;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199AEBD8](&v21);
  if (!v11)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      shouldShowEngagementForRequest = objc_msgSend_downloadQueue_shouldShowEngagementForRequest_(v11, v19, (uint64_t)v12, v13, v21, v22, v23, v24, v25, v26, v27, v28);
      v17[2](v17, shouldShowEngagementForRequest);
      goto LABEL_7;
    }
LABEL_6:
    v17[2](v17, 1);
    goto LABEL_7;
  }
  objc_msgSend_downloadQueue_shouldShowEngagementForRequest_engagementRequest_completion_(v11, v18, (uint64_t)v12, v13, *(_QWORD *)(a1 + 40), v17, v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_7:

}

void sub_2132418C0(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend_downloadQueue_viewControllerToPresentEngagementUIForRequest_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend__topMostViewController(*(void **)(a1 + 56), v3, v4);
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    }
    sub_213242BBC();
    if (objc_opt_class())
    {
      BLDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_DWORD *)buf = 138412290;
          v26 = v5;
          _os_log_impl(&dword_21323F000, v6, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use in-process engagement with presenter %@", buf, 0xCu);
        }

        objc_msgSend_defaultBag(MEMORY[0x24BE0FBF8], v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        sub_213242BBC();
        v11 = objc_alloc((Class)objc_opt_class());
        v13 = (void *)objc_msgSend_initWithRequest_bag_presentingViewController_(v11, v12, *(_QWORD *)(a1 + 64), v10, v5);
        objc_msgSend_presentEngagement(v13, v14, v15);
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21323F000, v6, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: Presenter not found for engagement request", buf, 2u);
        }

        v20 = (void *)MEMORY[0x24BE08340];
        BLError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_promiseWithError_(v20, v21, (uint64_t)v10);
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      }

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = sub_213241BCC;
      v23[3] = &unk_24CF70B18;
      v24 = *(id *)(a1 + 72);
      objc_msgSend_addFinishBlock_(v16, v22, (uint64_t)v23);

    }
    else
    {
      BLDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21323F000, v18, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
      }

      v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 72));
      if (v16)
      {
        BLError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v16)[2](v16, 0, v19);

      }
    }
    goto LABEL_21;
  }
  BLDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v17, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected engagement request.", buf, 2u);
  }

  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 72));
  if (v5)
  {
    BLError();
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v16);
LABEL_21:

  }
}

void sub_213241BCC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 32));
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);

}

uint64_t sub_213241C34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_213241D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213241D9C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_213241DAC(uint64_t a1)
{

}

void sub_213241DB4(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  int isEqualToString;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  sub_213242298();
  v2 = (void *)objc_opt_class();
  objc_msgSend_sharedApplication(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectedScenes(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v60, v64, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v61;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v15);
        if (!objc_msgSend_activationState(v16, v11, v12))
        {
          objc_msgSend_session(v16, v11, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_role(v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          sub_213242758();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v20, v22, (uint64_t)v21);

          if (isEqualToString)
          {
            objc_msgSend_delegate(v16, v11, v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) == 0
              || (objc_msgSend_window(v24, v25, v26),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_rootViewController(v27, v28, v29),
                  v30 = (id)objc_claimAutoreleasedReturnValue(),
                  v27,
                  !v30))
            {
              v33 = 0;
              goto LABEL_13;
            }
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
            {
              v33 = v30;
LABEL_13:

              goto LABEL_14;
            }
            while (2)
            {
              objc_msgSend_presentedViewController(v30, v31, v32);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend_presentedViewController(v30, v36, v37);
                v38 = objc_claimAutoreleasedReturnValue();
                goto LABEL_31;
              }
              sub_2132423A4();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_visibleViewController(v30, v39, v40);
                v38 = objc_claimAutoreleasedReturnValue();
                goto LABEL_31;
              }
              sub_2132424B0();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = v30;
                objc_msgSend_viewControllerForColumn_(v30, v41, 2);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_viewControllerForColumn_(v30, v42, 3);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_traitCollection(v30, v44, v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = v14;
                v50 = v24;
                v51 = a1;
                v52 = v8;
                v53 = objc_msgSend_horizontalSizeClass(v46, v47, v48);

                if (v43)
                  v54 = v53 == 1;
                else
                  v54 = 0;
                v8 = v52;
                a1 = v51;
                v24 = v50;
                v14 = v49;
                if (v54)
                  v55 = v43;
                else
                  v55 = v59;
                v33 = v55;

              }
              else
              {
                sub_2132425BC();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_selectedViewController(v30, v56, v57);
                  v38 = objc_claimAutoreleasedReturnValue();
LABEL_31:
                  v33 = (id)v38;
                }
                else
                {
                  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
                  v33 = v30;
                  v30 = *(id *)(v34 + 40);
                  *(_QWORD *)(v34 + 40) = v33;
                }
              }

              v30 = v33;
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
                goto LABEL_13;
              continue;
            }
          }
        }
LABEL_14:
        ++v15;
      }
      while (v15 != v13);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v60, v64, 16);
      v13 = v58;
    }
    while (v58);
  }

}

uint64_t sub_213242178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_254B8C308;
  v6 = qword_254B8C308;
  if (!qword_254B8C308)
  {
    v7 = xmmword_24CF70B88;
    v8 = *(_OWORD *)&off_24CF70B98;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_254B8C308 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213242228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213242240()
{
  uint64_t v0;
  void *v2;

  v0 = sub_213242178();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_213242298()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C310;
  v7 = qword_254B8C310;
  if (!qword_254B8C310)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242350;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242350((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242350(uint64_t a1)
{
  Class result;

  sub_213242240();
  result = objc_getClass("UIApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213248F5C();
  qword_254B8C310 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132423A4()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C318;
  v7 = qword_254B8C318;
  if (!qword_254B8C318)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_21324245C;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_21324245C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21324245C(uint64_t a1)
{
  Class result;

  sub_213242240();
  result = objc_getClass("UINavigationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213248F80();
  qword_254B8C318 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132424B0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C320;
  v7 = qword_254B8C320;
  if (!qword_254B8C320)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242568;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242568((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242568(uint64_t a1)
{
  Class result;

  sub_213242240();
  result = objc_getClass("UISplitViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213248FA4();
  qword_254B8C320 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132425BC()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C328;
  v7 = qword_254B8C328;
  if (!qword_254B8C328)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242674;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242674((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21324265C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242674(uint64_t a1)
{
  Class result;

  sub_213242240();
  result = objc_getClass("UITabBarController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213248FC8();
  qword_254B8C328 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_2132426C8()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C330;
  v6 = qword_254B8C330;
  if (!qword_254B8C330)
  {
    v1 = (void *)sub_213242240();
    v0 = dlsym(v1, "UIWindowSceneSessionRoleApplication");
    v4[3] = (uint64_t)v0;
    qword_254B8C330 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213242740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213242758()
{
  id *v0;

  v0 = (id *)sub_2132426C8();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

uint64_t sub_213242778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_254B8C338;
  v6 = qword_254B8C338;
  if (!qword_254B8C338)
  {
    v7 = xmmword_24CF70BA8;
    v8 = *(_OWORD *)&off_24CF70BB8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_254B8C338 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213242828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_213242840()
{
  uint64_t v0;
  void *v2;

  v0 = sub_213242778();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_213242898()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C340;
  v7 = qword_254B8C340;
  if (!qword_254B8C340)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242950;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242950((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242950(uint64_t a1)
{
  Class result;

  sub_213242840();
  result = objc_getClass("AMSUIAuthenticateTask");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_21324900C();
  qword_254B8C340 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132429A4()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C348;
  v7 = qword_254B8C348;
  if (!qword_254B8C348)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242A5C;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242A5C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242A5C(uint64_t a1)
{
  Class result;

  sub_213242840();
  result = objc_getClass("AMSUIAlertDialogTask");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213249030();
  qword_254B8C348 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_213242AB0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C350;
  v7 = qword_254B8C350;
  if (!qword_254B8C350)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242B68;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242B68((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242B68(uint64_t a1)
{
  Class result;

  sub_213242840();
  result = objc_getClass("AMSSystemAlertDialogTask");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213249054();
  qword_254B8C350 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_213242BBC()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C358;
  v7 = qword_254B8C358;
  if (!qword_254B8C358)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213242C74;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213242C74((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213242C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213242C74(uint64_t a1)
{
  Class result;

  sub_213242840();
  result = objc_getClass("AMSUIEngagementTask");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_213249078();
  qword_254B8C358 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_213242CC8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_initWithBlock_, &unk_24CF70BE8);
}

void sub_213242CD4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  id v19;
  const char *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;

  v2 = (void *)MEMORY[0x24BEC8A58];
  v3 = a2;
  objc_msgSend_activeAccount(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentity_(v3, v7, (uint64_t)v6);

  objc_msgSend_defaultIdentityStore(MEMORY[0x24BEC8A60], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentityStore_(v3, v11, (uint64_t)v10);

  v12 = objc_alloc(MEMORY[0x24BEC8770]);
  v14 = (void *)objc_msgSend_initWithSystemApplicationType_(v12, v13, 2);
  objc_msgSend_setClientInfo_(v3, v15, (uint64_t)v14);

  v16 = objc_alloc(MEMORY[0x24BEC8A08]);
  v25 = (id)objc_msgSend_initWithUserInteractionLevel_(v16, v17, 5);
  objc_msgSend_setAuthenticationProvider_(v3, v18, (uint64_t)v25);
  v19 = objc_alloc_init(MEMORY[0x24BEC89D0]);
  objc_msgSend_setAllowsHandlingNonAuthenticationDialogs_(v19, v20, 0);
  v21 = objc_alloc(MEMORY[0x24BEC89C8]);
  v23 = (void *)objc_msgSend_initWithConfiguration_(v21, v22, (uint64_t)v19);
  objc_msgSend_setStoreDialogResponseHandler_(v3, v24, (uint64_t)v23);

}

void sub_213242EF8(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 304);
  *(_QWORD *)(v2 + 304) = 0;

}

void sub_213242FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213243018(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t v13[16];

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (!v6 || v7)
  {
    BLHLSKeyFetchingLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve acquireSlot URL from the bag.", v13, 2u);
    }

    if (!v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v12, *MEMORY[0x24BE0FB88], 28, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_finishWithError_(v10, v12, (uint64_t)v7);

  }
  else
  {
    objc_msgSend__acquireSlotWithURL_(WeakRetained, v9, (uint64_t)v6);
  }

}

void sub_2132433FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21324342C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE0FB88];
    objc_msgSend_userInfo(v6, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v13, v11, 40, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    objc_msgSend_parsedBodyDictionary(v5, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("status"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_integerValue(v20, v21, v22);

    if (!v23)
      goto LABEL_9;
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BE0FB88];
    objc_msgSend_parsedBodyDictionary(v5, v24, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, v27, 40, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v14)
  {
    BLHLSKeyFetchingLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v34 = 138412290;
      v35 = v14;
      _os_log_impl(&dword_21323F000, v29, OS_LOG_TYPE_ERROR, "AcquireSlot returned an error. %@", (uint8_t *)&v34, 0xCu);
    }

    objc_msgSend_finishWithError_(WeakRetained, v30, (uint64_t)v14);
    goto LABEL_12;
  }
LABEL_9:
  BLHLSKeyFetchingLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_21323F000, v31, OS_LOG_TYPE_INFO, "AcquireSlot was successful.", (uint8_t *)&v34, 2u);
  }

  objc_msgSend_finish(WeakRetained, v32, v33);
LABEL_12:

}

id sub_213243698()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C360;
  v7 = qword_254B8C360;
  if (!qword_254B8C360)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213243750;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213243750((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213243738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213243750(uint64_t a1)
{
  Class result;

  sub_213240AAC();
  result = objc_getClass("MPMediaItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_21324909C();
  qword_254B8C360 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132437A4()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C368;
  v7 = qword_254B8C368;
  if (!qword_254B8C368)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_21324385C;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_21324385C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213243844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21324385C(uint64_t a1)
{
  Class result;

  sub_213240AAC();
  result = objc_getClass("MPMediaPlaylist");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_2132490C0();
  qword_254B8C368 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2132438B0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_254B8C370;
  v7 = qword_254B8C370;
  if (!qword_254B8C370)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_213243968;
    v3[3] = &unk_24CF70B68;
    v3[4] = &v4;
    sub_213243968((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_213243950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_213243968(uint64_t a1)
{
  Class result;

  sub_213240AAC();
  result = objc_getClass("MPMediaPropertyPredicate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_2132490E4();
  qword_254B8C370 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_2132439BC()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C378;
  v6 = qword_254B8C378;
  if (!qword_254B8C378)
  {
    v1 = (void *)sub_213240AAC();
    v0 = dlsym(v1, "MPMediaItemPropertyBitRate");
    v4[3] = (uint64_t)v0;
    qword_254B8C378 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213243A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213243A4C()
{
  id *v0;

  v0 = (id *)sub_2132439BC();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

void *sub_213243A6C()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C380;
  v6 = qword_254B8C380;
  if (!qword_254B8C380)
  {
    v1 = (void *)sub_213240AAC();
    v0 = dlsym(v1, "MPMediaItemPropertyHLSOfflinePlaybackKeys");
    v4[3] = (uint64_t)v0;
    qword_254B8C380 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213243AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213243AFC()
{
  id *v0;

  v0 = (id *)sub_213243A6C();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

void *sub_213243B1C()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C388;
  v6 = qword_254B8C388;
  if (!qword_254B8C388)
  {
    v1 = (void *)sub_213240AAC();
    v0 = dlsym(v1, "MPMediaItemPropertyHLSPlaylistURL");
    v4[3] = (uint64_t)v0;
    qword_254B8C388 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213243B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213243BAC()
{
  id *v0;

  v0 = (id *)sub_213243B1C();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

void *sub_213243BCC()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C390;
  v6 = qword_254B8C390;
  if (!qword_254B8C390)
  {
    v1 = (void *)sub_213240AAC();
    v0 = dlsym(v1, "MPMediaItemPropertyStoreRedownloadParameters");
    v4[3] = (uint64_t)v0;
    qword_254B8C390 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213243C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213243C5C()
{
  id *v0;

  v0 = (id *)sub_213243BCC();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

void *sub_213243C7C()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_254B8C398;
  v6 = qword_254B8C398;
  if (!qword_254B8C398)
  {
    v1 = (void *)sub_213240AAC();
    v0 = dlsym(v1, "MPMediaItemPropertyPersistentID");
    v4[3] = (uint64_t)v0;
    qword_254B8C398 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_213243CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_213243D0C()
{
  id *v0;

  v0 = (id *)sub_213243C7C();
  if (!v0)
    sub_213248FEC();
  return *v0;
}

void sub_213243E34()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_254B8C3A0;
  qword_254B8C3A0 = (uint64_t)v0;

}

void sub_213243FDC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLHLSKeyFetchingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_21323F000, v4, OS_LOG_TYPE_DEFAULT, "Fetch completed for online keys for %llu.", (uint8_t *)&v8, 0xCu);
  }

  if (v3)
  {
    BLHLSKeyFetchingLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218242;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_21323F000, v6, OS_LOG_TYPE_ERROR, "Failed to load streaming HLS key for %llu with error  %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void sub_2132443A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLHLSKeyFetchingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(*(void **)(a1 + 32), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v10;
    _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_DEFAULT, "Fetch completed for offline keys for '%@'.", (uint8_t *)&v17, 0xCu);

  }
  if (v6)
  {
    BLHLSKeyFetchingLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_title(*(void **)(a1 + 32), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_ERROR, "Failed to load offline HLS key for '%@' with error  %@", (uint8_t *)&v17, 0x16u);

    }
  }
  v15 = MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 40));
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void sub_213244844(uint64_t a1)
{
  BLUIHostServiceProxy *v2;
  const char *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v2 = [BLUIHostServiceProxy alloc];
  v10 = (id)objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v2, v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
    v4 = *(void **)(a1 + 56);
  else
    v4 = &unk_24CF70D28;
  v5 = (void *)MEMORY[0x2199AEBD8](v4);
  objc_msgSend_serviceProxy(*(void **)(a1 + 48), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDownloadsWithManifestRequest_uiHostProxy_reply_(v8, v9, *(_QWORD *)(a1 + 40), v10, v5);

}

void sub_2132449FC(uint64_t a1)
{
  void *v2;
  BLUIHostServiceProxy *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  if (*(_QWORD *)(a1 + 48))
    v2 = *(void **)(a1 + 48);
  else
    v2 = &unk_24CF70D90;
  v10 = (id)MEMORY[0x2199AEBD8](v2);
  v3 = [BLUIHostServiceProxy alloc];
  v5 = (void *)objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v3, v4, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend_serviceProxy(*(void **)(a1 + 40), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAutomaticDownloadEnabled_uiHostProxy_reply_(v8, v9, *(unsigned __int8 *)(a1 + 56), v5, v10);

}

void sub_213244C58(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend_setDelegate_queue_(*(void **)(*(_QWORD *)(a1 + 32) + 304), v2, 0, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 352);
  *(_QWORD *)(v3 + 352) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 304);
  *(_QWORD *)(v7 + 304) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 328);
  *(_QWORD *)(v9 + 328) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 344);
  *(_QWORD *)(v11 + 344) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 392);
  *(_QWORD *)(v13 + 392) = 0;

}

void sub_213244F6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_bodyData(a2, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v8, v9, v10))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), v8);
    objc_msgSend__createSPCData(*(void **)(a1 + 32), v11, v12);
  }
  else
  {
    BLHLSKeyFetchingLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_21323F000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to load certificate data with error:  %@", buf, 0x16u);
    }

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC8580];
    if (v5)
    {
      v22 = *MEMORY[0x24BDD1398];
      v23 = v5;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)&v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, v17, -7300, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v15, *MEMORY[0x24BEC8580], -7300, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v21, (uint64_t)v20);

  }
}

void sub_213245154()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_254B8C3A8;
  qword_254B8C3A8 = v0;

}

void sub_213245868(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 312);
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = sub_213245934;
  v13[3] = &unk_24CF70E28;
  v13[1] = 3221225472;
  v14 = v5;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

void sub_213245934(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  uint64_t v34;
  const char *v35;
  id v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  const char *v57;
  NSObject *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  NSObject *v62;
  uint64_t v63;
  const char *v64;
  NSObject *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_parsedBodyDictionary(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_msgSend_objectForKey_(v4, v7, (uint64_t)CFSTR("fairplay-streaming-response"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
      BLHLSKeyFetchingLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v81 = v30;
        _os_log_impl(&dword_21323F000, v29, OS_LOG_TYPE_ERROR, "[%{public}@]: Invalid response format.", buf, 0xCu);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v31, *MEMORY[0x24BE0FB88], 39, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(*(void **)(a1 + 48), v32, (uint64_t)v10);
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("streaming-keys"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v11 = v10;
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v74, v84, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v75;
LABEL_6:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v75 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v16);
          if ((_NSIsNSDictionary() & 1) != 0)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v18, (uint64_t)&v74, v84, 16);
            if (v14)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
        v36 = v17;

        if (!v36)
          goto LABEL_30;
        objc_opt_class();
        objc_msgSend_objectForKey_(v36, v37, (uint64_t)CFSTR("status"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        BUDynamicCast();
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v42 = objc_msgSend_integerValue(v39, v40, v41);
          if (v42 == -1004)
          {
            BLHLSKeyFetchingLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v63 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v81 = v63;
              v82 = 2114;
              v83 = v36;
              _os_log_impl(&dword_21323F000, v62, OS_LOG_TYPE_ERROR, "[%{public}@]: Received transfer lock in response: %{public}@", buf, 0x16u);
            }

            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v64, *MEMORY[0x24BE0FB88], 40, 0);
          }
          else
          {
            if (!v42)
              goto LABEL_28;
            BLHLSKeyFetchingLog();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v81 = v66;
              v82 = 2114;
              v83 = v36;
              _os_log_impl(&dword_21323F000, v65, OS_LOG_TYPE_ERROR, "[%{public}@]: Received failure in response: %{public}@", buf, 0x16u);
            }

            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v67, *MEMORY[0x24BE0FB88], 39, 0);
          }
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_finishWithError_(*(void **)(a1 + 48), v68, (uint64_t)v43);
LABEL_59:

          goto LABEL_34;
        }
LABEL_28:
        objc_msgSend_objectForKey_(v36, v40, (uint64_t)CFSTR("ckc"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v44 = objc_alloc(MEMORY[0x24BDBCE50]);
          v46 = (id)objc_msgSend_initWithBase64EncodedString_options_(v44, v45, (uint64_t)v43, 0);
        }
        else
        {
          if (!_NSIsNSData())
            goto LABEL_44;
          v46 = v43;
        }
        v51 = v46;
        if (v46)
        {
          v52 = *(void **)(a1 + 40);
          v73 = 0;
          objc_msgSend_persistableContentKeyFromKeyVendorResponse_options_error_(v52, v47, (uint64_t)v51, 0, &v73);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v73;

          if (v54)
          {
            BLHLSKeyFetchingLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543362;
              v81 = v56;
              _os_log_impl(&dword_21323F000, v55, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to create persistable content key from content key context data.", buf, 0xCu);
            }

            objc_msgSend_finishWithError_(*(void **)(a1 + 48), v57, (uint64_t)v54);
          }
          else
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 328), v53);
            BLHLSKeyFetchingLog();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              v70 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543362;
              v81 = v70;
              _os_log_impl(&dword_21323F000, v69, OS_LOG_TYPE_INFO, "[%{public}@]: Loaded successfully.", buf, 0xCu);
            }

            objc_msgSend_finish(*(void **)(a1 + 48), v71, v72);
          }

LABEL_58:
          goto LABEL_59;
        }
LABEL_44:
        BLHLSKeyFetchingLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          v81 = v59;
          _os_log_impl(&dword_21323F000, v58, OS_LOG_TYPE_ERROR, "[%{public}@]: Missing content key context data in response.", buf, 0xCu);
        }

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v60, *MEMORY[0x24BE0FB88], 39, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(*(void **)(a1 + 48), v61, (uint64_t)v53);
        goto LABEL_58;
      }
LABEL_12:

LABEL_30:
      BLHLSKeyFetchingLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      v48 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v81 = v48;
      v35 = "[%{public}@]: Missing streaming key dictionary in response.";
    }
    else
    {
      BLHLSKeyFetchingLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      v34 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v81 = v34;
      v35 = "[%{public}@]: Missing second-level dictionary key in response.";
    }
    _os_log_impl(&dword_21323F000, v33, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
LABEL_33:

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v49, *MEMORY[0x24BE0FB88], 39, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(*(void **)(a1 + 48), v50, (uint64_t)v36);
LABEL_34:

    goto LABEL_35;
  }
  BLHLSKeyFetchingLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    v81 = v20;
    v82 = 2112;
    v83 = v21;
    _os_log_impl(&dword_21323F000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]: Key server request returned error:  %@", buf, 0x16u);
  }

  v23 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BE0FB88];
  v25 = *(_QWORD *)(a1 + 56);
  if (v25)
  {
    v78 = *MEMORY[0x24BDD1398];
    v79 = v25;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)&v79, &v78, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, v24, 39, v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, *MEMORY[0x24BE0FB88], 39, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_finishWithError_(*(void **)(a1 + 48), v28, (uint64_t)v8);
LABEL_36:

}

void sub_21324638C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 312);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_213246454;
  v12[3] = &unk_24CF70E28;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t sub_213246454(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && !*(_QWORD *)(a1 + 40))
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 48), sel__ksq_fetchCKCDataUsingSPC_forKeyRequest_, v2);
  BLHLSKeyFetchingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 384);
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_21323F000, v3, OS_LOG_TYPE_ERROR, "Failed to create SPC data for %@ with error:  %@", (uint8_t *)&v8, 0x16u);
  }

  return objc_msgSend_processContentKeyResponseError_(*(void **)(a1 + 56), v6, *(_QWORD *)(a1 + 40));
}

void sub_213246924(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  BLServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_URLRequest(a1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v20 = a1;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_21323F000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadManifestRequest] Start download manifest request %p: urlRequest=%@", buf, 0x16u);

  }
  objc_msgSend_sharedInstance(BLDownloadQueue, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_213246A7C;
  v17[3] = &unk_24CF70EA0;
  v17[4] = a1;
  v18 = v6;
  v15 = v6;
  objc_msgSend_addDownloadsWithManifestRequest_uiManager_completion_(v14, v16, (uint64_t)a1, v7, v17);

}

void sub_213246A7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    v16 = 134218242;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p returned error:  %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(_QWORD *)(a1 + 32);
    v16 = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v5;
    v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p completed with response %@.";
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_21323F000, v11, v12, v10, (uint8_t *)&v16, 0x16u);
LABEL_7:

  v14 = MEMORY[0x2199AEBD8](*(_QWORD *)(a1 + 40));
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

void sub_213247368(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 304);
  *(_QWORD *)(v2 + 304) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 312);
  *(_QWORD *)(v4 + 312) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 328);
  *(_QWORD *)(v8 + 328) = 0;

}

void sub_2132474A0(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    BLHLSKeyFetchingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_21323F000, v8, OS_LOG_TYPE_ERROR, "Metadata request for item %@ failed with error  %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v10, (uint64_t)v7);
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend_hlsAsset(a2, v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__performStreamingKeyRequestForHLSAsset_(v11, v13, (uint64_t)v12);

  }
}

void sub_2132476D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  const char *v6;
  const char *v7;
  id v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
  v8 = a3;
  objc_msgSend_finishAssetResourceLoadingRequest_withError_(a2, v6, v5, v8);
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v8);

}

void sub_2132478D0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328))
  {
    BLHLSKeyFetchingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21323F000, v4, OS_LOG_TYPE_DEFAULT, "metadata request - returning nil store metadata", v13, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 304);
  *(_QWORD *)(v7 + 304) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 328);
  *(_QWORD *)(v9 + 328) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 312);
  *(_QWORD *)(v11 + 312) = 0;

}

void sub_213247B4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      BLError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    BLHLSKeyFetchingLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v8;
      _os_log_impl(&dword_21323F000, v30, OS_LOG_TYPE_ERROR, "Failed to retreive bag with error  %@", buf, 0xCu);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v31, (uint64_t)v8);
  }
  else
  {
    objc_msgSend_stringForBagKey_(v5, v7, (uint64_t)CFSTR("fps-cert"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForBagKey_(v5, v9, (uint64_t)CFSTR("audiobook-fps-request"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BLHLSKeyFetchingLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 312), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v14;
      _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_DEFAULT, "Received bag for '%@'.", buf, 0xCu);

    }
    if (objc_msgSend_length(v8, v15, v16) && objc_msgSend_length(v10, v17, v18))
    {
      objc_msgSend__responseDictionaryForKeyCertificateURL_keyServerURL_(*(void **)(a1 + 32), v19, (uint64_t)v8, v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BEC89F0]);
      v23 = (void *)objc_msgSend_initWithItemResponseDictionary_urlBag_(v21, v22, (uint64_t)v20, v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), v23);
      BLHLSKeyFetchingLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 312), v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v27;
        _os_log_impl(&dword_21323F000, v24, OS_LOG_TYPE_DEFAULT, "Successfully read meta data for '%@' from the bag", buf, 0xCu);

      }
      objc_msgSend_finish(*(void **)(a1 + 32), v28, v29);

    }
    else
    {
      v32 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      sub_213243C5C();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForProperty_(v32, v34, (uint64_t)v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend_length(v20, v35, v36))
      {
        BLHLSKeyFetchingLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 312), v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v52 = v40;
          _os_log_impl(&dword_21323F000, v37, OS_LOG_TYPE_ERROR, "Missing buy parameters for item %@", buf, 0xCu);

        }
      }
      v41 = objc_alloc(MEMORY[0x24BEC8768]);
      v43 = objc_msgSend_initWithRequestContext_buyParametersString_includeKeybagSyncData_(v41, v42, *(_QWORD *)(a1 + 40), v20, 1);
      v44 = *(_QWORD *)(a1 + 32);
      v45 = *(void **)(v44 + 320);
      *(_QWORD *)(v44 + 320) = v43;

      v46 = *(_QWORD *)(a1 + 32);
      v47 = *(void **)(v46 + 320);
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = sub_213247F18;
      v49[3] = &unk_24CF70F40;
      v49[4] = v46;
      v50 = v5;
      objc_msgSend_performRequestWithResponseHandler_(v47, v48, (uint64_t)v49);

    }
  }

}

void sub_213247F18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    BLHLSKeyFetchingLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      v30 = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_ERROR, "Purchase request for item %@ failed with error  %@", (uint8_t *)&v30, 0x16u);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v9, (uint64_t)v6);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BEC8848]);
    objc_msgSend_date(MEMORY[0x24BDBCE60], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_initWithResponseDictionary_requestDate_urlBag_(v10, v14, (uint64_t)v5, v13, *(_QWORD *)(a1 + 40));

    objc_msgSend_items(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 328);
    *(_QWORD *)(v22 + 328) = v21;

    BLHLSKeyFetchingLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 312), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v27;
      _os_log_impl(&dword_21323F000, v24, OS_LOG_TYPE_DEFAULT, "Successfully fetched meta data from buy product request for '%@'", (uint8_t *)&v30, 0xCu);

    }
    objc_msgSend_finish(*(void **)(a1 + 32), v28, v29);

  }
}

void sub_21324872C(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend_defaultIdentityStore(MEMORY[0x24BEC8A60], v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronize(v4, v5, v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 352);
  *(_QWORD *)(v7 + 352) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 304);
  *(_QWORD *)(v9 + 304) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 312);
  *(_QWORD *)(v11 + 312) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 344);
  *(_QWORD *)(v13 + 344) = 0;

}

void sub_213248964(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  _QWORD *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend_hlsAsset(v5, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 320);
  *(_QWORD *)(v10 + 320) = v9;

  BLHLSKeyFetchingLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 336), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412802;
    v27 = v15;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_21323F000, v12, OS_LOG_TYPE_DEFAULT, "Received asset info for '%@' (%@, %@).", (uint8_t *)&v26, 0x20u);

  }
  if (!v6)
  {
    v23 = *(_QWORD **)(a1 + 32);
    if (v23[40])
    {
      objc_msgSend__performOfflineKeyRequest(v23, v16, v17);
      goto LABEL_9;
    }
    BLError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend__performOfflineKeyRequest(*(void **)(a1 + 32), v24, v25);
      goto LABEL_9;
    }
  }
  BLHLSKeyFetchingLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_title(*(void **)(*(_QWORD *)(a1 + 32) + 336), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v21;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_21323F000, v18, OS_LOG_TYPE_ERROR, "Metadata request for '%@' failed with error  %@", (uint8_t *)&v26, 0x16u);

  }
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v22, (uint64_t)v6);

LABEL_9:
}

void sub_213248E4C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  const char *v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 352), a2);
  v6 = a2;
  v8 = a3;
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v8);

}

void sub_213248F5C()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213248F80(v0);
}

void sub_213248F80()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213248FA4(v0);
}

void sub_213248FA4()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213248FC8(v0);
}

void sub_213248FC8()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213248FEC(v0);
}

void sub_213248FEC()
{
  dlerror();
  abort_report_np();
  sub_21324900C();
}

void sub_21324900C()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213249030(v0);
}

void sub_213249030()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213249054(v0);
}

void sub_213249054()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_213249078(v0);
}

void sub_213249078()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_21324909C(v0);
}

void sub_21324909C()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_2132490C0(v0);
}

void sub_2132490C0()
{
  uint64_t v0;

  v0 = abort_report_np();
  sub_2132490E4(v0);
}

void sub_2132490E4()
{
  abort_report_np();
  sub_213249108();
}

void sub_213249108()
{
  abort_report_np();
  BLDefaultLog();
}

uint64_t BLDefaultLog()
{
  return MEMORY[0x24BE0FB78]();
}

uint64_t BLError()
{
  return MEMORY[0x24BE0FB80]();
}

uint64_t BLHLSKeyFetchingLog()
{
  return MEMORY[0x24BE0FB90]();
}

uint64_t BLServiceLog()
{
  return MEMORY[0x24BE0FB98]();
}

uint64_t BUDynamicCast()
{
  return MEMORY[0x24BE0FBC0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x24BDBD150]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x24BDBD158]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x24BDBD168]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x24BDBD178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}


void sub_100004AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004B1C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004B2C(uint64_t a1)
{

}

void sub_100004B34(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serialNumber"));
  if (!objc_msgSend(v5, "isEqualToString:", a1[4]))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v8, "isEqualToString:", a1[5]);

  v7 = v8;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
LABEL_5:
    v7 = v8;
  }

}

void sub_100004F14(id a1)
{
  FMDAutomationHelperFactory *v1;
  void *v2;

  v1 = objc_alloc_init(FMDAutomationHelperFactory);
  v2 = (void *)qword_100042C80;
  qword_100042C80 = (uint64_t)v1;

}

id sub_100005190()
{
  if (qword_100042C90 != -1)
    dispatch_once(&qword_100042C90, &stru_1000346A8);
  return (id)qword_100042C98;
}

void sub_1000051D0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "magSafe");
  v2 = (void *)qword_100042C98;
  qword_100042C98 = (uint64_t)v1;

}

NSError *__cdecl sub_100005200(id a1, SEL a2, id a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  id v10;

  v9 = NSLocalizedDescriptionKey;
  v10 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 0, v4));

  return (NSError *)v7;
}

void sub_100005E78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006488(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v55 = v7;
    v56 = 2112;
    v57 = v8;
    v58 = 2112;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: download task completed with %@ %@ %@", buf, 0x20u);
  }

  v12 = *(void **)(a1 + 32);
  v53 = 0;
  v13 = objc_msgSend(v12, "isValidReponse:validationError:", v8, &v53);
  v14 = v53;
  if (!v14)
  {
    if ((v13 & 1) == 0)
    {
      v40 = sub_100005190();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_10001EE00(a1, v8, v41);

      v23 = *(_QWORD *)(a1 + 64);
      v24 = 0;
      goto LABEL_23;
    }
    v25 = v8;
    if (v9
      || (v26 = objc_opt_class(NSHTTPURLResponse), (objc_opt_isKindOfClass(v25, v26) & 1) == 0)
      || objc_msgSend(v25, "statusCode") != (id)200)
    {
      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, v9);
      goto LABEL_24;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "stringByDeletingLastPathComponent"));
    v28 = sub_100005190();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: dir location = %@", buf, 0xCu);
    }

    if ((objc_msgSend(*(id *)(a1 + 56), "fileExistsAtPath:", v27) & 1) == 0)
    {
      v30 = *(void **)(a1 + 56);
      v52 = 0;
      v31 = objc_msgSend(v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v52);
      v32 = v52;
      v33 = v32;
      if ((v31 & 1) == 0)
      {
        v42 = sub_100005190();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          sub_10001ED98(v43, v44, v45, v46, v47, v48, v49, v50);

        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, 0);
        goto LABEL_30;
      }

    }
    v34 = *(void **)(a1 + 56);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(a1 + 48)));
    v51 = 0;
    objc_msgSend(v34, "moveItemAtURL:toURL:error:", v7, v35, &v51);
    v33 = v51;

    v36 = sub_100005190();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v33;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: copy completed with error %@", buf, 0xCu);
    }

    v38 = *(_QWORD *)(a1 + 64);
    if (v33)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
      (*(void (**)(uint64_t, _QWORD, void *))(v38 + 16))(v38, 0, v39);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v38 + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), 0);
    }
LABEL_30:

    goto LABEL_24;
  }
  v15 = sub_100005190();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_10001EED4((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);

  v23 = *(_QWORD *)(a1 + 64);
  v24 = 1;
LABEL_23:
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydevice.RemoteAsset"), v24, 0));
  (*(void (**)(uint64_t, _QWORD, id))(v23 + 16))(v23, 0, v25);
LABEL_24:

}

void sub_100006B40(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10001EF38();

}

void sub_100006D18(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10001EF38();

}

id sub_100006F68(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "did not get accessory showing attach screen", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "progressFlowWithState:", 1);
}

id sub_100006FDC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "did not get accessory ending setup", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setupEnded");
}

void sub_10000742C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));
  if (v2
    && (v3 = (void *)v2,
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard")),
        v5 = objc_msgSend(v4, "isBeingPresented"),
        v4,
        v3,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000751C;
    v8[3] = &unk_100034760;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPresentedCard:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteVCProxy"));
    objc_msgSend(v7, "deactivate");

  }
}

void sub_10000751C(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setPresentedCard:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteVCProxy"));
  objc_msgSend(v2, "deactivate");

}

void sub_100007B90(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  NSObject *v10;
  FMDRemoteAsset *v11;
  void *v12;
  void *v13;
  FMDRemoteAsset *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  NSObject *v20;
  FMDRemoteAsset *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  FMDRemoteAsset *v25;
  void *v26;
  void *v27;
  FMDRemoteAsset *v28;
  NSObject *v29;
  dispatch_time_t v30;
  id v31;
  NSObject *v32;
  unsigned int v33;
  FMDRemoteAsset *v34;
  void *v35;
  void *v36;
  FMDRemoteAsset *v37;
  Block_layout *v38;
  void *v39;
  void *v40;
  void **v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *, void *);
  void *v44;
  NSObject *v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;

  v2 = dispatch_group_create();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryTypeValidator sharedInstance](FMDAccessoryTypeValidator, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryType"));
  if (objc_msgSend(v3, "isAllowedAccessoryWithType:", v4))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isMF4i");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "getPairingStatus");
      if (objc_msgSend(*(id *)(a1 + 32), "isNVMSetup"))
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "keysAvailable") & 1) == 0)
        {
          dispatch_group_enter(v2);
          v6 = *(void **)(a1 + 32);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100008098;
          v50[3] = &unk_100034788;
          v51 = v6;
          v7 = v2;
          v52 = v7;
          +[FMDPairingCheckHelper pairingCheckForAccessory:completion:](FMDPairingCheckHelper, "pairingCheckForAccessory:completion:", v51, v50);
          v8 = dispatch_time(0, 10000000000);
          if (dispatch_group_wait(v7, v8))
          {
            v9 = sub_100005190();
            v10 = objc_claimAutoreleasedReturnValue(v9);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              sub_10001F01C();

          }
        }
      }
    }
  }
  else
  {

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isNVMSetup") & 1) == 0)
  {
    v21 = [FMDRemoteAsset alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "style"));
    v14 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v21, "initWithAccessoryType:style:type:", v22, v23, 0);

    dispatch_group_enter(v2);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000081C8;
    v48[3] = &unk_1000347B0;
    v24 = v2;
    v49 = v24;
    -[FMDRemoteAsset fetchAssetWithCompletion:](v14, "fetchAssetWithCompletion:", v48);
    v25 = [FMDRemoteAsset alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "style"));
    v28 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v25, "initWithAccessoryType:style:type:", v26, v27, 1);

    dispatch_group_enter(v24);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000082A0;
    v46[3] = &unk_1000347B0;
    v29 = v24;
    v47 = v29;
    -[FMDRemoteAsset fetchAssetWithCompletion:](v28, "fetchAssetWithCompletion:", v46);
    v30 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v29, v30))
    {
      v31 = sub_100005190();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10001EFF0();

    }
    v33 = objc_msgSend(*(id *)(a1 + 40), "isRestrictedSKU");
    v34 = [FMDRemoteAsset alloc];
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "style"));
    if (v33)
    {
      v37 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v34, "initWithAccessoryType:style:type:", v35, v36, 3);

      v38 = &stru_1000347F0;
    }
    else
    {
      v37 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v34, "initWithAccessoryType:style:type:", v35, v36, 2);

      v38 = &stru_100034810;
    }
    -[FMDRemoteAsset fetchAssetWithCompletion:](v37, "fetchAssetWithCompletion:", v38);

    v15 = v49;
    goto LABEL_28;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isNVMSetup")
    && (objc_msgSend(*(id *)(a1 + 32), "keysAvailable") & 1) == 0)
  {
    v11 = [FMDRemoteAsset alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "style"));
    v14 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v11, "initWithAccessoryType:style:type:", v12, v13, 3);

    v15 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v14, "getStoredAssetLocation"));
    if (!v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v41 = _NSConcreteStackBlock;
      v42 = 3221225472;
      v43 = sub_100008510;
      v44 = &unk_1000347B0;
      v17 = v16;
      v45 = v17;
      -[FMDRemoteAsset fetchAssetWithCompletion:](v14, "fetchAssetWithCompletion:", &v41);
      v18 = dispatch_time(0, 3000000000);
      if (dispatch_group_wait(v17, v18))
      {
        v19 = sub_100005190();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_10001EFF0();

      }
    }
LABEL_28:

  }
  objc_msgSend(*(id *)(a1 + 40), "setPhysicalAccessory:", *(_QWORD *)(a1 + 32), v41, v42, v43, v44);
  v39 = *(void **)(a1 + 40);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "physicalAccessory"));
  objc_msgSend(v39, "prepareForSetupFlowFor:", v40);

}

void sub_100008098(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pairingCheckForAccessory completed with error = %@ lostModeInfo = %@", (uint8_t *)&v11, 0x16u);
  }

  if (!v5 && v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ownerNumber")));
    objc_msgSend(*(id *)(a1 + 32), "setPhoneNumber:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("email")));
    objc_msgSend(*(id *)(a1 + 32), "setEmail:", v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_1000081C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remoteAsset pairing video fetched with path %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000082A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remoteAsset pairing video adjustments fetched with path %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100008378(id a1, NSString *a2, NSError *a3)
{
  NSString *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  int v8;
  NSString *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAsset fetched with path %@ error %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_100008444(id a1, NSString *a2, NSError *a3)
{
  NSString *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  int v8;
  NSString *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remoteAsset map image fetched with path %@ error %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_100008510(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remoteAsset fetched with path %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100008DF8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory removed with error %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100009144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000916C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000917C(uint64_t a1)
{

}

void sub_100009184(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory set name completed with error %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000925C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory added with error %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100009420(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  switch(*(_QWORD *)(a1 + 40))
  {
    case 1:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardAttachAccessory"));
      goto LABEL_17;
    case 2:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardAlreadyAttached"));
      goto LABEL_17;
    case 3:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardUnsupportedAccessory"));
      goto LABEL_17;
    case 4:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardLockedFindMyNotPaired"));
      goto LABEL_17;
    case 5:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardUnlockedStartFlow"));
      goto LABEL_17;
    case 6:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardSetupFindmy"));
      goto LABEL_17;
    case 7:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardSetupComplete"));
      goto LABEL_17;
    case 8:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardSetupError"));
      goto LABEL_17;
    case 9:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNonOwnerLockedDevice"));
      goto LABEL_17;
    case 0xALL:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNonOwnerUnlocked"));
      goto LABEL_17;
    case 0xBLL:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNoAccount"));
      goto LABEL_17;
    case 0xCLL:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardUpgradeAccountSecurity"));
      goto LABEL_17;
    case 0xDLL:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardUpgradeAccountSecurityError"));
      goto LABEL_17;
    case 0xELL:
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardSpinner"));
LABEL_17:
      v3 = (void *)v2;
      break;
    default:
      v3 = 0;
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "setProxCardState:", *(_QWORD *)(a1 + 40));
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));
    v15 = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: nextCard = %@ %@", (uint8_t *)&v15, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));

  if (v7)
  {
    if (!v3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));
      objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

      goto LABEL_30;
    }
    v8 = sub_100005190();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: pushing view cotroler %@", (uint8_t *)&v15, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedCard"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationController"));
    objc_msgSend(v11, "pushViewController:animated:", v3, 1);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (!v3)
    {
      objc_msgSend(v12, "setupEnded");
      goto LABEL_30;
    }
    v13 = objc_msgSend(v12, "presentProxCardFlowWithDelegate:initialViewController:", *(_QWORD *)(a1 + 32), v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPresentedCard:", v3);
LABEL_30:

}

void sub_100009AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009B28(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_1000114EC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "add to FindMy button tapped", v4, 2u);
  }

  objc_msgSend(WeakRetained, "continueWithAccountValidationFlow");
}

void sub_100009C84(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_time_t v20;
  intptr_t v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  FMDRemoteUnlockPairingData *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  dispatch_time_t v36;
  intptr_t v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  dispatch_time_t v41;
  intptr_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  dispatch_time_t v73;
  intptr_t v74;
  id v75;
  NSObject *v76;
  FMDMagSafeAccessory *v77;
  void *v78;
  FMDMagSafeAccessory *v79;
  void *v80;
  NSObject *v81;
  dispatch_time_t v82;
  intptr_t v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  uint64_t v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  _QWORD v96[4];
  NSObject *v97;
  uint64_t *v98;
  _QWORD v99[4];
  NSObject *v100;
  uint64_t *v101;
  uint8_t v102[16];
  _QWORD v103[4];
  NSObject *v104;
  uint64_t *v105;
  __int128 *v106;
  _QWORD v107[4];
  NSObject *v108;
  uint64_t *v109;
  id v110;
  id v111;
  _QWORD v112[4];
  NSObject *v113;
  uint64_t *v114;
  _QWORD v115[4];
  NSObject *v116;
  uint64_t *v117;
  __int128 *p_buf;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  __int128 v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  char v130[32];
  __int128 buf;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "physicalAccessory"));
  v2 = objc_alloc_init((Class)FMDPairingLockRegisterRequestInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "serialNumber"));
  objc_msgSend(v2, "setSerialNumber:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "accessoryType"));
  objc_msgSend(v2, "setAccessoryType:", v4);

  v5 = dispatch_group_create();
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Doing register to server for accessory with serial number = %@", (uint8_t *)&buf, 0xCu);

  }
  dispatch_group_enter(v5);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v132 = 0x3032000000;
  v133 = sub_10000916C;
  v134 = sub_10000917C;
  v135 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = sub_10000916C;
  v123 = sub_10000917C;
  v124 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_10000AAA4;
  v115[3] = &unk_100034900;
  v117 = &v119;
  p_buf = &buf;
  v10 = v5;
  v116 = v10;
  objc_msgSend(v9, "registerDeviceForPairingLock:completion:", v2, v115);

  v11 = dispatch_time(0, 5000000000);
  v12 = dispatch_group_wait(v10, v11);
  if (!v120[5] && !v12)
  {
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairingToken"));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "serialNumber"));
        v16 = v15 == 0;

        if (!v16)
        {
          v17 = sub_100005190();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v125) = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "provisioning keys to mulder", (uint8_t *)&v125, 2u);
          }

          dispatch_group_enter(v10);
          v112[0] = _NSConcreteStackBlock;
          v112[1] = 3221225472;
          v112[2] = sub_10000ABB4;
          v112[3] = &unk_100034888;
          v114 = &v119;
          v19 = v10;
          v113 = v19;
          objc_msgSend(v1, "setupKeysWithCompletion:", v112);
          v20 = dispatch_time(0, 5000000000);
          v21 = dispatch_group_wait(v19, v20);
          if (v120[5] || v21)
          {
            v53 = sub_100005190();
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              sub_10001F1E4();

            v55 = *(_QWORD *)(a1 + 40);
            if (v120[5])
            {
              (*(void (**)(_QWORD))(v55 + 16))(*(_QWORD *)(a1 + 40));
LABEL_83:
              v52 = v113;
              goto LABEL_84;
            }
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
            (*(void (**)(uint64_t, void *))(v55 + 16))(v55, v59);
LABEL_82:

            goto LABEL_83;
          }
          v110 = 0;
          v111 = 0;
          +[FMDCryptoUtil generatePublicPrivateKeyPair:privateKey:](FMDCryptoUtil, "generatePublicPrivateKeyPair:privateKey:", &v111, &v110);
          v22 = v111;
          v94 = v110;
          v23 = sub_100005190();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v93 = v22;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fm_hexString"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "fm_hexString"));
            sub_10001F270(v25, v26, (uint64_t)v130, v24);
          }

          v27 = sub_100005190();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v125) = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "setting up pairing data", (uint8_t *)&v125, 2u);
          }

          v29 = objc_alloc_init(FMDRemoteUnlockPairingData);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pairingToken"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v30));
          -[FMDRemoteUnlockPairingData setPairingCheckToken:](v29, "setPairingCheckToken:", v31);

          -[FMDRemoteUnlockPairingData setLostModePrivateKey:](v29, "setLostModePrivateKey:", v94);
          v32 = sub_100005190();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData pairingCheckToken](v29, "pairingCheckToken"));
            LODWORD(v125) = 138412290;
            *(_QWORD *)((char *)&v125 + 4) = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "data size = %@", (uint8_t *)&v125, 0xCu);

          }
          dispatch_group_enter(v19);
          v107[0] = _NSConcreteStackBlock;
          v107[1] = 3221225472;
          v107[2] = sub_10000AC8C;
          v107[3] = &unk_100034888;
          v109 = &v119;
          v35 = v19;
          v108 = v35;
          objc_msgSend(v1, "setPairingData:withCompletion:", v29, v107);
          v36 = dispatch_time(0, 5000000000);
          v37 = dispatch_group_wait(v35, v36);
          if (v120[5] || v37)
          {
            v56 = sub_100005190();
            v57 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              sub_10001F1E4();

            v58 = *(_QWORD *)(a1 + 40);
            if (v120[5])
            {
              (*(void (**)(_QWORD))(v58 + 16))(*(_QWORD *)(a1 + 40));
            }
            else
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
              (*(void (**)(uint64_t, void *))(v58 + 16))(v58, v63);

            }
            goto LABEL_81;
          }
          v38 = sub_100005190();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v125) = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "getting user private key", (uint8_t *)&v125, 2u);
          }

          dispatch_group_enter(v35);
          *(_QWORD *)&v125 = 0;
          *((_QWORD *)&v125 + 1) = &v125;
          v126 = 0x3032000000;
          v127 = sub_10000916C;
          v128 = sub_10000917C;
          v129 = 0;
          v103[0] = _NSConcreteStackBlock;
          v103[1] = 3221225472;
          v103[2] = sub_10000AD64;
          v103[3] = &unk_100034928;
          v105 = &v119;
          v106 = &v125;
          v40 = v35;
          v104 = v40;
          objc_msgSend(v1, "copyUserPrivateKeyWithCompletion:", v103);
          v41 = dispatch_time(0, 5000000000);
          v42 = dispatch_group_wait(v40, v41);
          if (v120[5] || v42)
          {
            v60 = sub_100005190();
            v61 = objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              sub_10001F1E4();

            v62 = *(_QWORD *)(a1 + 40);
            if (v120[5])
            {
              (*(void (**)(_QWORD))(v62 + 16))(*(_QWORD *)(a1 + 40));
LABEL_80:

              _Block_object_dispose(&v125, 8);
LABEL_81:

              v59 = v93;
              goto LABEL_82;
            }
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
            (*(void (**)(uint64_t, void *))(v62 + 16))(v62, v65);
LABEL_79:

            goto LABEL_80;
          }
          if (v93 && *(_QWORD *)(*((_QWORD *)&v125 + 1) + 40))
          {
            v43 = objc_alloc_init((Class)FMDPairingLockUpdateRequestInfo);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pairingToken"));
            -[NSObject setPairingCheckToken:](v43, "setPairingCheckToken:", v44);

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "fm_hexString"));
            -[NSObject setLostModePubKey:](v43, "setLostModePubKey:", v45);

            v46 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 40);
            if (v46)
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 40), "fm_hexString"));
            else
              v47 = 0;
            -[NSObject setUserPrivateKey:](v43, "setUserPrivateKey:", v47);
            if (v46)

            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "serialNumber"));
            -[NSObject setSerialNumber:](v43, "setSerialNumber:", v66);

            v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v67, "fm_epoch")));
            -[NSObject setTimeStamp:](v43, "setTimeStamp:", v68);

            v69 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
            objc_msgSend(v69, "updatePairingLockInfo:completion:", v43, &stru_100034948);

          }
          else
          {
            v64 = sub_100005190();
            v43 = objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              sub_10001F244();
          }

          v70 = sub_100005190();
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v102 = 0;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "setting the device name", v102, 2u);
          }

          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_computeName"));
          dispatch_group_enter(v40);
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472;
          v99[2] = sub_10000AF10;
          v99[3] = &unk_100034888;
          v101 = &v119;
          v72 = v40;
          v100 = v72;
          objc_msgSend(v1, "setName:withCompletion:", v65, v99);
          v73 = dispatch_time(0, 5000000000);
          v74 = dispatch_group_wait(v72, v73);
          if (v120[5] || v74)
          {
            v86 = sub_100005190();
            v87 = objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              sub_10001F1E4();

            v88 = *(_QWORD *)(a1 + 40);
            if (v120[5])
            {
              (*(void (**)(_QWORD))(v88 + 16))(*(_QWORD *)(a1 + 40));
LABEL_78:

              goto LABEL_79;
            }
            v79 = (FMDMagSafeAccessory *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
            (*(void (**)(uint64_t, FMDMagSafeAccessory *))(v88 + 16))(v88, v79);
          }
          else
          {
            v75 = sub_100005190();
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v102 = 0;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "adding device to data store", v102, 2u);
            }

            dispatch_group_enter(v72);
            v77 = [FMDMagSafeAccessory alloc];
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "physicalAccessory"));
            v79 = -[FMDMagSafeAccessory initWithPhysicalAccessory:fmEnabled:](v77, "initWithPhysicalAccessory:fmEnabled:", v78, 1);

            objc_msgSend(*(id *)(a1 + 32), "setMagSafeAccessory:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
            v96[0] = _NSConcreteStackBlock;
            v96[1] = 3221225472;
            v96[2] = sub_10000AFE4;
            v96[3] = &unk_100034888;
            v98 = &v119;
            v81 = v72;
            v97 = v81;
            objc_msgSend(v80, "addAccessory:withCompletion:", v79, v96);

            v82 = dispatch_time(0, 5000000000);
            v83 = dispatch_group_wait(v81, v82);
            if (v120[5] || v83)
            {
              v89 = sub_100005190();
              v90 = objc_claimAutoreleasedReturnValue(v89);
              if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                sub_10001F1E4();

              v91 = *(_QWORD *)(a1 + 40);
              if (v120[5])
              {
                (*(void (**)(_QWORD))(v91 + 16))(*(_QWORD *)(a1 + 40));
              }
              else
              {
                v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
                (*(void (**)(uint64_t, void *))(v91 + 16))(v91, v92);

              }
            }
            else
            {
              v84 = sub_100005190();
              v85 = objc_claimAutoreleasedReturnValue(v84);
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v102 = 0;
                _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Find My setup completed", v102, 2u);
              }

              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            }

          }
          goto LABEL_78;
        }
      }
    }
    v51 = *(_QWORD *)(a1 + 40);
    v52 = objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", CFSTR("Invalid register response")));
    (*(void (**)(uint64_t, NSObject *))(v51 + 16))(v51, v52);
LABEL_84:

    goto LABEL_85;
  }
  v48 = sub_100005190();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    sub_10001F1E4();

  v50 = *(_QWORD *)(a1 + 40);
  if (!v120[5])
  {
    v52 = objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
    (*(void (**)(uint64_t, NSObject *))(v50 + 16))(v50, v52);
    goto LABEL_84;
  }
  (*(void (**)(_QWORD))(v50 + 16))(*(_QWORD *)(a1 + 40));
LABEL_85:

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&buf, 8);

}

void sub_10000AA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  uint64_t v57;

  _Block_object_dispose((const void *)(v57 - 256), 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000AAA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "registerDeviceForPairingLock completed with error = %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000ABB4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setupKeysWithCompletion completed with error = %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AC8C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setPairingData completed with error = %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AD64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AE68(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairingKeyUpdated with error = %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10000AF10(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v7, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AFE4(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "add to data store completed with error = %@", (uint8_t *)&v7, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000B588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B5B4(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "operation cancelled", v4, 2u);
  }

}

void sub_10000B890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B8BC(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "operation cancelled", v4, 2u);
  }

}

void sub_10000BB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BBC4(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "operation cancelled", v4, 2u);
  }

}

void sub_10000BDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BDE4(uint64_t a1)
{
  unint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "accountState");
  if (v2 <= 3)
    objc_msgSend(WeakRetained, "progressFlowWithState:", qword_100025E58[v2]);

}

void sub_10000BF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BF7C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000C3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C3D8(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "view"));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5 = a1[4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADDING"), &stru_100036128, 0));
  objc_msgSend(v5, "showActivityIndicatorWithStatus:", v7);

  if ((objc_msgSend(a1[5], "isFindMyAppInstalled") & 1) == 0)
    objc_msgSend(a1[5], "triggerFindMyAppInstallation");
  v8 = a1[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C500;
  v9[3] = &unk_1000349E8;
  objc_copyWeak(&v10, a1 + 6);
  objc_msgSend(v8, "enableFindMyWithCompletion:", v9);
  objc_destroyWeak(&v10);

}

void sub_10000C4EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000C500(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v6 = sub_100005190();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001F3AC();

    objc_msgSend(WeakRetained, "progressFlowWithState:", 8);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C5F4;
    v8[3] = &unk_1000349E8;
    objc_copyWeak(&v9, v4);
    objc_msgSend(WeakRetained, "setUpFindMyWithCompletion:", v8);
    objc_destroyWeak(&v9);
  }

}

void sub_10000C5E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000C5F4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = sub_100005190();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001F438();

    objc_msgSend(v5, "progressFlowWithState:", 8);
  }
  else
  {
    objc_msgSend(WeakRetained, "postNotification:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"));
    v8 = sub_100005190();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10001F40C();

    v10 = dispatch_time(0, 8000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C728;
    block[3] = &unk_100034760;
    block[4] = v5;
    dispatch_after(v10, v12, block);

  }
}

id sub_10000C728(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10001F498();

  return objc_msgSend(*(id *)(a1 + 32), "progressFlowWithState:", 7);
}

void sub_10000D130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D1A8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "physicalAccessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fmip1://device/device?sn=%@"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  v9 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v10 = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v6, "openSensitiveURL:withOptions:", v7, v8);

}

void sub_10000D2E8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

}

void sub_10000D664(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_10000D694(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mailto:%@"), *(_QWORD *)(a1 + 32)));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v3));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("sms://open")));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("address"), *(_QWORD *)(a1 + 32)));
    v13 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v4, "setQueryItems:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v12 = v6;
  objc_msgSend(v7, "openURL:withOptions:error:", v8, 0, &v12);
  v9 = v12;

  if (v9)
  {
    v10 = sub_100005190();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001F4C4();

  }
}

void sub_10000D864(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://support.apple.com/kb/HT210982")));
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

}

void sub_10000DB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000DB70(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

}

void sub_10000DCA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000DCC0(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting to be implemented", v4, 2u);
  }

}

void sub_10000E148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E174(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E260;
  v7[3] = &unk_100034A60;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7[4] = *(_QWORD *)(a1 + 32);
  SBSRequestPasscodeUnlockUI(v7);
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "waiting for unlock", v6, 2u);
  }

  objc_destroyWeak(&v8);
}

void sub_10000E248(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000E260(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _DWORD v11[2];

  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SBSRequestPasscodeUnlockUI unlocked = %d", (uint8_t *)v11, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && (objc_msgSend(*(id *)(a1 + 32), "isLocked") & 1) == 0)
  {
    v9 = sub_100005190();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "device unlocked", (uint8_t *)v11, 2u);
    }

    objc_msgSend(WeakRetained, "continueWithAccountValidationFlow");
  }
  else
  {
    objc_msgSend(WeakRetained, "progressFlowWithState:", 0);
    v7 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device locked", (uint8_t *)v11, 2u);
    }

  }
}

void sub_10000E60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E634(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E720;
  v7[3] = &unk_100034A88;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  SBSRequestPasscodeUnlockUI(v7);
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "waiting for unlock", v6, 2u);
  }

  objc_destroyWeak(&v8);
}

void sub_10000E708(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000E720(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *WeakRetained;
  id v9;
  NSObject *v10;
  _DWORD v11[2];

  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SBSRequestPasscodeUnlockUI unlocked = %d", (uint8_t *)v11, 8u);
  }

  if (a2 && (objc_msgSend(*(id *)(a1 + 32), "isLocked") & 1) == 0)
  {
    v9 = sub_100005190();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "device unlocked", (uint8_t *)v11, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject progressFlowWithState:](WeakRetained, "progressFlowWithState:", 10);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "progressFlowWithState:", 0);

    v7 = sub_100005190();
    WeakRetained = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "device locked", (uint8_t *)v11, 2u);
    }
  }

}

void sub_10000EDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EDEC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  id v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
  v14 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v15 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v13 = v2;
  objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v4, v5, &v13);
  v6 = v13;

  if (v6)
  {
    v7 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001F4C4();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "operation cancelled", v12, 2u);
  }

}

void sub_10000F210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F23C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "upgradeAccountButtonPressedOn:", *(_QWORD *)(a1 + 32));

}

void sub_10000F49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F4C0(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressFlowWithState:", 0);

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "operation cancelled", v4, 2u);
  }

}

void sub_10000FCB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000FCCC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_TITLE"), &stru_100036128, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_MESSAGE"), &stru_100036128, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_CONFIRM"), &stru_100036128, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_SET_UP_WALLET_LATER_CANCEL"), &stru_100036128, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000FF24;
    v16[3] = &unk_100034AF8;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v17, (id *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v16));
    objc_msgSend(v13, "addAction:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));
    objc_msgSend(v13, "addAction:", v15);

    objc_msgSend(v13, "setPreferredAction:", v14);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);

    objc_destroyWeak(&v17);
  }

}

void sub_10000FF0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000FF24(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "storeAccessoryAsNotFindmyEnabled:", &stru_100034AD0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

void sub_10000FF84(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001F524();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "storeAccessoryAsNotFindmyEnabled completed with success", v6, 2u);
  }

}

void sub_1000109E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000109FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001F6FC(v4, v8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Installation of Find My started successfully.", buf, 2u);
    }

    v12 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXAppInstallCoordinator existingCoordinatorForAppWithBundleID:error:](IXAppInstallCoordinator, "existingCoordinatorForAppWithBundleID:error:", CFSTR("com.apple.findmy"), &v12));
    v8 = v12;
    if (v8)
    {
      v10 = sub_100005190();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10001F67C(v8, v11);

    }
    else
    {
      objc_msgSend(WeakRetained, "setAppInstallCoordinator:", v9);
    }

  }
}

void sub_100010E88(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "physicalAccessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v3));

  objc_msgSend(*(id *)(a1 + 32), "_removeAccessoryToDataStoreWithID:", v4);
  objc_msgSend(*(id *)(a1 + 32), "launchSettingsAppUpgradeFlow");
  objc_msgSend(*(id *)(a1 + 32), "progressFlowWithState:", 0);

}

void sub_10001144C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100011478(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100011488(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100011494(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1000114D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000114E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_1000114EC()
{
  if (qword_100042CB0 != -1)
    dispatch_once(&qword_100042CB0, &stru_100034B78);
  return (id)qword_100042CB8;
}

void sub_10001152C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "_");
  v2 = (void *)qword_100042CB8;
  qword_100042CB8 = (uint64_t)v1;

}

id sub_10001155C()
{
  if (qword_100042CC0 != -1)
    dispatch_once(&qword_100042CC0, &stru_100034B98);
  return (id)qword_100042CC8;
}

void sub_10001159C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "locations");
  v2 = (void *)qword_100042CC8;
  qword_100042CC8 = (uint64_t)v1;

}

id sub_1000115CC()
{
  if (qword_100042CD0 != -1)
    dispatch_once(&qword_100042CD0, &stru_100034BB8);
  return (id)qword_100042CD8;
}

void sub_10001160C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accessory");
  v2 = (void *)qword_100042CD8;
  qword_100042CD8 = (uint64_t)v1;

}

id sub_10001163C()
{
  if (qword_100042CE0 != -1)
    dispatch_once(&qword_100042CE0, &stru_100034BD8);
  return (id)qword_100042CE8;
}

void sub_10001167C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "traffic");
  v2 = (void *)qword_100042CE8;
  qword_100042CE8 = (uint64_t)v1;

}

id sub_1000116AC()
{
  if (qword_100042CF0 != -1)
    dispatch_once(&qword_100042CF0, &stru_100034BF8);
  return (id)qword_100042CF8;
}

void sub_1000116EC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "encoder");
  v2 = (void *)qword_100042CF8;
  qword_100042CF8 = (uint64_t)v1;

}

id sub_10001171C()
{
  if (qword_100042D00 != -1)
    dispatch_once(&qword_100042D00, &stru_100034C18);
  return (id)qword_100042D08;
}

void sub_10001175C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  v2 = (void *)qword_100042D08;
  qword_100042D08 = (uint64_t)v1;

}

id sub_10001178C()
{
  if (qword_100042D10 != -1)
    dispatch_once(&qword_100042D10, &stru_100034C38);
  return (id)qword_100042D18;
}

void sub_1000117CC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions");
  v2 = (void *)qword_100042D18;
  qword_100042D18 = (uint64_t)v1;

}

id sub_1000117FC()
{
  if (qword_100042D20 != -1)
    dispatch_once(&qword_100042D20, &stru_100034C58);
  return (id)qword_100042D28;
}

void sub_10001183C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  v2 = (void *)qword_100042D28;
  qword_100042D28 = (uint64_t)v1;

}

id sub_10001186C()
{
  if (qword_100042D30 != -1)
    dispatch_once(&qword_100042D30, &stru_100034C78);
  return (id)qword_100042D38;
}

void sub_1000118AC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  v2 = (void *)qword_100042D38;
  qword_100042D38 = (uint64_t)v1;

}

id sub_1000118DC()
{
  if (qword_100042D40 != -1)
    dispatch_once(&qword_100042D40, &stru_100034C98);
  return (id)qword_100042D48;
}

void sub_10001191C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  v2 = (void *)qword_100042D48;
  qword_100042D48 = (uint64_t)v1;

}

id sub_10001194C()
{
  if (qword_100042D50 != -1)
    dispatch_once(&qword_100042D50, &stru_100034CB8);
  return (id)qword_100042D58;
}

void sub_10001198C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  v2 = (void *)qword_100042D58;
  qword_100042D58 = (uint64_t)v1;

}

id sub_1000119BC()
{
  if (qword_100042D60 != -1)
    dispatch_once(&qword_100042D60, &stru_100034CD8);
  return (id)qword_100042D68;
}

void sub_1000119FC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  v2 = (void *)qword_100042D68;
  qword_100042D68 = (uint64_t)v1;

}

id sub_100011A2C()
{
  if (qword_100042D70 != -1)
    dispatch_once(&qword_100042D70, &stru_100034CF8);
  return (id)qword_100042D78;
}

void sub_100011A6C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  v2 = (void *)qword_100042D78;
  qword_100042D78 = (uint64_t)v1;

}

id sub_100011A9C()
{
  if (qword_100042D80 != -1)
    dispatch_once(&qword_100042D80, &stru_100034D18);
  return (id)qword_100042D88;
}

void sub_100011ADC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  v2 = (void *)qword_100042D88;
  qword_100042D88 = (uint64_t)v1;

}

id sub_100011B0C()
{
  if (qword_100042D90 != -1)
    dispatch_once(&qword_100042D90, &stru_100034D38);
  return (id)qword_100042D98;
}

void sub_100011B4C(id a1)
{
  os_log_t v1;
  void *v2;

  if (+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("ShowAutomationLogs"), CFSTR("com.apple.icloud.findmydeviced.notbackedup")))
  {
    v1 = os_log_create("com.apple.icloud.findmydeviced", "automation");
    v2 = (void *)qword_100042D98;
    qword_100042D98 = (uint64_t)v1;

  }
}

void sub_1000126E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012708(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012718(uint64_t a1)
{

}

void sub_100012720(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a2;
  v7 = a3;
  v8 = sub_100005190();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#CA getAccessoryUserName completed with error %@ %@", (uint8_t *)&v10, 0x16u);
  }

  if (!v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100012AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012B24(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;

  v5 = a3;
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = 138412546;
    v10 = v5;
    v11 = 2048;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA getPairingStatus completed with error %@ %lu", (uint8_t *)&v9, 0x16u);
  }

  if (!v5)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100012FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012FD8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA setPublicNVMKeyValues completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setPairingData:", *(_QWORD *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100013264(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  FMDRemoteUnlockPairingData *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v6;
    v33 = 2112;
    v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA getPublicNVMKeyValues completed with error %@ %@", buf, 0x16u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = objc_alloc_init((Class)NSMutableData);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      v24 = a1;
      v25 = 0;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description", v24, v25, (_QWORD)v26));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v16));

          if (!v17 || (v18 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v17, v18) & 1) == 0))
          {
            v19 = sub_100005190();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              sub_10001F7D4((uint64_t)v15, (uint64_t)v17, v20);

            a1 = v24;
            v6 = v25;
            goto LABEL_18;
          }
          objc_msgSend(v9, "appendData:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        a1 = v24;
        v6 = v25;
        if (v12)
          continue;
        break;
      }
    }
LABEL_18:

    v21 = -[FMDRemoteUnlockPairingData initWithData:]([FMDRemoteUnlockPairingData alloc], "initWithData:", v9);
    objc_msgSend(*(id *)(a1 + 40), "setPairingData:", v21);

    v22 = *(_QWORD *)(a1 + 48);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pairingData"));
    (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

  }
}

void sub_10001369C(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connectionInfo"));
  v3 = a1[5];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "endPointUUID"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013790;
  v5[3] = &unk_100034DB0;
  objc_copyWeak(&v8, a1 + 7);
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v2, "setAccessoryUserName:forEndpoint:withReply:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void sub_10001377C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100013790(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA set name completed with error %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (!v3)
    objc_msgSend(WeakRetained, "setName:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100013A68(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100013A84(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connectionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "endPointUUID"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013B58;
  v4[3] = &unk_100034E28;
  objc_copyWeak(&v6, a1 + 6);
  v5 = a1[5];
  objc_msgSend(v2, "provisionAccessoryForFindMy:withReply:", v3, v4);

  objc_destroyWeak(&v6);
}

void sub_100013B44(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100013B58(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA set keys completed with error %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!v3)
  {
    objc_msgSend(WeakRetained, "setIsNVMSetup:", 1);
    objc_msgSend(v7, "setKeysAvailable:", 1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100013E04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_100013E30(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "### #CA completed with error %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!v3)
  {
    objc_msgSend(WeakRetained, "setIsNVMSetup:", 0);
    objc_msgSend(v7, "setKeysAvailable:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100014014(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA beginVendorKeyErase completed with accessoryNonce %@  error %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100014234(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA continueVendorKeyErase completed with error %@", (uint8_t *)&v6, 0xCu);
  }

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsNVMSetup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setKeysAvailable:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100014408(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA copyUserPrivateKey completed with key = %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000145E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA beginUserKeyErase completed with accessoryNonce %@  error %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100014800(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA continueUserKeyErase completed with error %@", (uint8_t *)&v6, 0xCu);
  }

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsNVMSetup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setKeysAvailable:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000149D4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA cancelUserKeyErase completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void sub_100014B90(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA cancelVendorKeyErase completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void sub_100015038(id a1)
{
  unsigned int v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v1 = objc_msgSend(v2, "isInternalBuild");
  if (v1)
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("EnableMagSafeMocking"), kFMDNotBackedUpPrefDomain);
  byte_100042DA0 = v1;

}

void sub_100015100(id a1)
{
  void *v1;
  objc_class *v2;
  id v3;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
  v2 = (objc_class *)objc_msgSend(v1, "automationHelperClassWithName:", CFSTR("FMDAutomationACCConnectionInfo"));

  v3 = objc_alloc_init(v2);
  v4 = (void *)qword_100042DB0;
  qword_100042DB0 = (uint64_t)v3;

}

void sub_100015484(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  FMDMagSafeRawInfo *v10;
  FMDMagSafeRawInfo *v11;
  FMDMagSafeRawInfo *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v14 = 136315906;
    v15 = "-[FMDCoreAccessoryManager accessoryConnectionAttached:type:info:properties:]_block_invoke";
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@ %@", (uint8_t *)&v14, 0x2Au);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "cache"));
  v8 = objc_msgSend(v7, "isCachedAccessoryWithUUID:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "cache"));
    v10 = (FMDMagSafeRawInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAccessoryWithUUID:", *(_QWORD *)(a1 + 32)));
  }
  else
  {
    v11 = [FMDMagSafeRawInfo alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "connectionInfo"));
    v10 = -[FMDMagSafeRawInfo initWithConnectionInfo:](v11, "initWithConnectionInfo:", v9);
  }
  v12 = v10;

  -[FMDMagSafeRawInfo updateWithProperties:](v12, "updateWithProperties:", *(_QWORD *)(a1 + 48));
  -[FMDMagSafeRawInfo updateWithAccessoryInfo:](v12, "updateWithAccessoryInfo:", *(_QWORD *)(a1 + 40));
  -[FMDMagSafeRawInfo setConnectionUUID:](v12, "setConnectionUUID:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "cache"));
  objc_msgSend(v13, "saveAccessory:withUUID:", v12, *(_QWORD *)(a1 + 32));

}

void sub_100015710(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  _BYTE v25[18];
  __int16 v26;
  uint64_t v27;

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v25 = "-[FMDCoreAccessoryManager accessoryEndpointAttached:transportType:protocol:properties:forConnection:]_block_invoke";
    *(_WORD *)&v25[8] = 2112;
    *(_QWORD *)&v25[10] = v4;
    v26 = 2112;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", buf, 0x20u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAccessoryWithUUID:", *(_QWORD *)(a1 + 32)));

  objc_msgSend(v7, "updateWithProperties:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setEndPointUUID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "setProtocol:", *(unsigned int *)(a1 + 64));
  objc_msgSend(v7, "setTransportType:", *(unsigned int *)(a1 + 68));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cache"));
  objc_msgSend(v8, "accessoryDidUpdateWithUUID:", *(_QWORD *)(a1 + 32));

  v9 = sub_100005190();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_DWORD *)(a1 + 64);
    v12 = CFSTR("eACCEndpoint_Protocol_MFi4Auth");
    if (v11 != 14)
      v12 = CFSTR("unexpected");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v25 = v11;
    *(_WORD *)&v25[4] = 2112;
    *(_QWORD *)&v25[6] = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#CA protocol =  %u %@", buf, 0x12u);
  }

  v13 = sub_100005190();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_DWORD *)(a1 + 68);
    v16 = CFSTR("eACCEndpoint_TransportType_NFC");
    if (v15 != 13)
      v16 = CFSTR("unexpected");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v25 = v15;
    *(_WORD *)&v25[4] = 2112;
    *(_QWORD *)&v25[6] = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#CA transportType =  %u %@", buf, 0x12u);
  }

  if (!objc_msgSend(v7, "isMF4i") || objc_msgSend(v7, "authPassed"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100015A1C;
    v22[3] = &unk_100034838;
    v22[4] = *(_QWORD *)(a1 + 48);
    v23 = v7;
    dispatch_async(v18, v22);

  }
  v19 = sub_100005190();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accessoryRawInfo"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "dict = %@", buf, 0xCu);

  }
}

void sub_100015A1C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serialNumber"));
  objc_msgSend(v3, "accessoryDidConnect:", v2);

}

void sub_100015B9C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAccessoryWithUUID:", *(_QWORD *)(a1 + 40)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));

  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA current magsafe accessory disconnected  %@", buf, 0xCu);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100015D00;
  v14 = &unk_100034838;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v9 = v4;
  dispatch_async(v8, &v11);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache", v11, v12, v13, v14, v15));
  objc_msgSend(v10, "deleteAccessoryWithUUID:", *(_QWORD *)(a1 + 40));

}

void sub_100015D00(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "accessoryDidDisconnect:", *(_QWORD *)(a1 + 40));

}

void sub_10001604C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAccessoryWithUUID:", *(_QWORD *)(a1 + 40)));

  if (v3)
  {
    if (objc_msgSend(v3, "isMF4i"))
    {
      if ((objc_msgSend(v3, "authPassed") & 1) == 0)
      {
        objc_msgSend(v3, "updateWithProperties:", *(_QWORD *)(a1 + 48));
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache"));
        objc_msgSend(v4, "accessoryDidUpdateWithUUID:", *(_QWORD *)(a1 + 40));

        if (objc_msgSend(v3, "authPassed"))
        {
          v11[0] = 0;
          v11[1] = v11;
          v11[2] = 0x3042000000;
          v11[3] = sub_1000161E0;
          v11[4] = sub_1000161EC;
          objc_initWeak(&v12, *(id *)(a1 + 32));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionInfo"));
          v6 = *(_QWORD *)(a1 + 40);
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = sub_1000161F4;
          v7[3] = &unk_100035980;
          v8 = v3;
          v10 = v11;
          v9 = *(id *)(a1 + 40);
          objc_msgSend(v5, "accessoryInfoForConnection:withReply:", v6, v7);

          _Block_object_dispose(v11, 8);
          objc_destroyWeak(&v12);
        }
      }
    }
  }

}

void sub_1000161C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_1000161E0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_1000161EC(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1000161F4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "updateWithAccessoryInfo:");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cache"));
  objc_msgSend(v3, "accessoryDidUpdateWithUUID:", *(_QWORD *)(a1 + 40));

  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000162C4;
  v6[3] = &unk_100035958;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, v6);

}

void sub_1000162C4(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialNumber"));
  objc_msgSend(v2, "accessoryDidConnect:", v3);

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100016D68(id a1)
{
  FMDAccessoryTypeValidator *v1;
  void *v2;

  v1 = objc_opt_new(FMDAccessoryTypeValidator);
  v2 = (void *)qword_100042DC0;
  qword_100042DC0 = (uint64_t)v1;

}

id sub_100018274(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryViewsAlpha:", 1.0);
}

uint64_t sub_100018280(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000195E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000196AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000196BC(uint64_t a1)
{

}

void sub_1000196C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getPairingDataWithCompletion completed with error = %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000197D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "beginUserKeyEraseWithCompletion return with accessoryNonce = %@ error = %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000198E4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getAuthNonceWithCompletion return with accessoryNonce = %@ error = %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000199F4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v8 = sub_100005190();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "phoneNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "serverNonce"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "signature"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "statusCode"));
    v14 = 138413058;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got pairingCheckResponseInfo %@ %@ %@ %@", (uint8_t *)&v14, 0x2Au);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100019B88(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100019BD4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100019C20(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "continueUserKeyErase return with serverNounce = %@ error = %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100019D08(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "vendorKeyErase return with serverNonce = %@ error = %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001A688(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Lost Mode key roll time updated for %@ to %@ with error = %@", (uint8_t *)&v13, 0x20u);
  }

  if (!v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", a1[6]));
    objc_msgSend(v8, "removeObject:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "readLostModeAccessoriesListVersion"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v12 = objc_msgSend(v11, "writeLostModeInfo:version:", v8, v10);

  }
}

void sub_10001A7D4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairingKeyUpdated with error = %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10001AA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001AA74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001AD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AD60(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setPairingData completed with error = %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001B15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001B198(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "registerDeviceForPairingLock completed with error = %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001B474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001B49C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getPairingDataWithCompletion completed with error = %@ %@", (uint8_t *)&v15, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001B7A8(id a1)
{
  FMDMagSafeDataStore *v1;
  void *v2;

  v1 = objc_alloc_init(FMDMagSafeDataStore);
  v2 = (void *)qword_100042DD0;
  qword_100042DD0 = (uint64_t)v1;

}

id sub_10001BA10(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_writeAccessoriesToDisk:", &__NSDictionary0__struct);
  return objc_msgSend(*(id *)(a1 + 32), "writeLostModeInfo:version:", &__NSArray0__struct, &stru_100036128);
}

void sub_10001BB20(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = objc_alloc((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readAllAccessoriesFromDisk"));
  v4 = objc_msgSend(v2, "initWithDictionary:", v3);

  v5 = *(void **)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryIdentifier"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_writeAccessoriesToDisk:", v4));
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001BC38;
  v12[3] = &unk_100035B28;
  v10 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v10;
  v11 = v7;
  dispatch_async(v9, v12);

}

uint64_t sub_10001BC38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10001BD04(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = objc_alloc((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readAllAccessoriesFromDisk"));
  v4 = objc_msgSend(v2, "initWithDictionary:", v3);

  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_writeAccessoriesToDisk:", v4));
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BE00;
  v10[3] = &unk_100035B28;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t sub_10001BE00(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10001BECC(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  dispatch_queue_global_t global_queue;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  dispatch_queue_global_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v2 = objc_alloc((Class)NSMutableDictionary);
  v30 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readAllAccessoriesFromDisk"));
  v4 = objc_msgSend(v2, "initWithDictionary:", v3);

  v39 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v6)
  {
    v7 = v6;
    v29 = v4;
    v8 = 0;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serialNumbers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(v30 + 40));

        if (v14)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryIdentifier"));

          v8 = (void *)v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v7);

    v4 = v29;
    if (v8)
    {
      v16 = sub_10001178C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(v30 + 40);
        *(_DWORD *)buf = 138412546;
        v41 = v18;
        v42 = 2112;
        v43 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDMagSafeDataSource: removing accessory with serialNumber %@ accessoryId = %@", buf, 0x16u);
      }

      objc_msgSend(v29, "removeObjectForKey:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v30 + 32), "_writeAccessoriesToDisk:", v29));
      global_queue = dispatch_get_global_queue(0, 0);
      v21 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C244;
      block[3] = &unk_100035B28;
      v22 = *(id *)(v30 + 48);
      v34 = v19;
      v35 = v22;
      v23 = v19;
      dispatch_async(v21, block);

      goto LABEL_18;
    }
  }
  else
  {

  }
  v24 = sub_10001178C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(v30 + 40);
    *(_DWORD *)buf = 138412290;
    v41 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "FMDMagSafeDataSource: No magsafe accessory with serialNumber %@ found", buf, 0xCu);
  }

  v27 = dispatch_get_global_queue(0, 0);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001C254;
  v31[3] = &unk_100035B78;
  v32 = *(id *)(v30 + 48);
  dispatch_async(v28, v31);

  v8 = v32;
LABEL_18:

}

uint64_t sub_10001C244(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_10001C254(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001C9B8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v2 = objc_alloc((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readAllAccessoriesFromDisk"));
  v4 = objc_msgSend(v2, "initWithDictionary:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setLastLostModeKeyRollTime:", *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_writeAccessoriesToDisk:", v4));
  }
  else
  {
    v8 = sub_1000114EC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001FE24(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
  }
  v17 = (void *)v7;
  global_queue = dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue(global_queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001CB14;
  v22[3] = &unk_100035B28;
  v20 = *(id *)(a1 + 56);
  v23 = v17;
  v24 = v20;
  v21 = v17;
  dispatch_async(v19, v22);

}

uint64_t sub_10001CB14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_10001CBE8(id a1)
{
  NSString *v1;
  void *v2;
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v1 = NSStringFromSelector("pairingCheckToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v11[0] = v2;
  v3 = NSStringFromSelector("lostModePrivateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v11[1] = v4;
  v5 = NSStringFromSelector("phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11[2] = v6;
  v7 = NSStringFromSelector("keysUpdated");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[3] = v8;
  v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));
  v10 = (void *)qword_100042DE0;
  qword_100042DE0 = v9;

}

void sub_10001E8C4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

size_t sub_10001E91C()
{
  __SecKey *v0;

  return SecKeyGetBlockSize(v0);
}

id *sub_10001EB84(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id *v5;
  unsigned __int8 *v6;
  unsigned int v7;

  if (a4)
  {
    v4 = a4;
    v5 = result;
    v6 = (unsigned __int8 *)(a2 + a3);
    do
    {
      v7 = *v6++;
      result = (id *)objc_msgSend(v5[4], "appendFormat:", CFSTR("%02lx"), v7);
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_10001EBE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10001EBF0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_10001EC64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no pattern in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_10001ECCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no mask in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_10001ED34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "FMDRemoteAsset: Invalid cached asset removing failed with error = : %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_10001ED98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a1, a3, "FMDRemoteAsset: createDirectoryAtPath failed with error = %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_10001EE00(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "FMDRemoteAsset: asset validation failed. requestURL = %@, responseURL = %@", (uint8_t *)&v8, 0x16u);

}

void sub_10001EED4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "FMDRemoteAsset: asset validation error %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_10001EF38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "failed to ger remoteVCProxy with error %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001EF98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "accessoryDidConnect: got connection call for the same accessory", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001EFC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "accessoryDidConnect: another accessory Connected", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001EFF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "timeout while trying to get image", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F01C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "pairingCheckForAccessory timeout with error %ld", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F07C(void *a1, NSObject *a2)
{
  uint8_t v3[24];

  objc_msgSend(a1, "magSafeState");
  sub_1000114A4();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "not starting magSafe flow setup with state = %lu", v3, 0xCu);
  sub_1000114C4();
}

void sub_10001F0F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "unexpected state FMDMagSafeStateUnknown", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F124()
{
  uint64_t v0;
  os_log_t v1;

  sub_100011494(__stack_chk_guard);
  sub_100011460();
  sub_10001144C((void *)&_mh_execute_header, v0, v1, "Failed to set name with error = %@ waitError = %ld");
  sub_1000069D8();
}

void sub_10001F184()
{
  uint64_t v0;
  os_log_t v1;

  sub_100011494(__stack_chk_guard);
  sub_100011460();
  sub_10001144C((void *)&_mh_execute_header, v0, v1, "Failed to add device with error = %@ waitError = %ld");
  sub_1000069D8();
}

void sub_10001F1E4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100011494(__stack_chk_guard);
  sub_100011460();
  sub_10001144C((void *)&_mh_execute_header, v0, v1, "Find My setup failed with error = %@ %ld");
  sub_1000069D8();
}

void sub_10001F244()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "#CA unable to get user privateKey", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F270(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  sub_1000114E0((void *)&_mh_execute_header, a4, a3, "setting up pairing data %@ %@", (uint8_t *)a3);

}

void sub_10001F2D8()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000114A4();
  v3 = 2112;
  v4 = v0;
  sub_1000114E0((void *)&_mh_execute_header, v1, (uint64_t)v1, "user %@! %@!", v2);
  sub_1000069D8();
}

void sub_10001F34C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "isFindMyEnabled timeout with error %ld", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F3AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "enable findmy completed with error = %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F40C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_1000114D0((void *)&_mh_execute_header, v0, v1, "waiting for device to show up in the app", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F438()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "setup findmy completed with error = %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_1000114D0((void *)&_mh_execute_header, v0, v1, "wait finished", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F4C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "Failed to open url with error = %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "storeAccessoryAsNotFindmyEnabled completed with error = %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001F584(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unlock state is %i", (uint8_t *)v2, 8u);
  sub_1000114B0();
}

void sub_10001F5F4(int *a1, NSObject *a2)
{
  int v2;
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;

  v2 = *a1;
  v3 = 138412546;
  v4 = CFSTR("FMFAllowed");
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
  sub_1000069D8();
}

void sub_10001F67C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_1000114A4();
  sub_100011488((void *)&_mh_execute_header, a2, v4, "#Failed to fetch install coordinator for Find My error: %@", v5);

  sub_1000114C4();
}

void sub_10001F6FC(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_1000114A4();
  sub_100011488((void *)&_mh_execute_header, a2, v4, "#Installation of Find My failed. error: %@", v5);

  sub_1000114C4();
}

void sub_10001F77C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "failed to get altDSID", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F7A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "failed to get authKitaccount", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001F7D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no data or corrupted data found at key = %@ data = %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001F858(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "keys already setup", v1, 2u);
}

void sub_10001F898()
{
  uint64_t v0;
  os_log_t v1;

  sub_100011494(__stack_chk_guard);
  sub_100011460();
  sub_10001144C((void *)&_mh_execute_header, v0, v1, "Find My pairing check failed with error = %@ %ld");
  sub_1000069D8();
}

void sub_10001F8F8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100011488((void *)&_mh_execute_header, a2, a3, "cancelErase api time out with error = %ld", (uint8_t *)&v3);
  sub_1000069D8();
}

void sub_10001F960(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100011488((void *)&_mh_execute_header, a2, a3, "got unexpected lostModeInfo = %@", (uint8_t *)&v3);
  sub_1000069D8();
}

void sub_10001F9C8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serialNumber"));
  v5 = 138412290;
  v6 = v3;
  sub_100011488((void *)&_mh_execute_header, a2, v4, "failed to update pairing data for %@", (uint8_t *)&v5);

}

void sub_10001FA54(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "fm_hexString"));
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "setting up pairing data %@ %@", (uint8_t *)&v7, 0x16u);

}

void sub_10001FB14(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pairingCheckToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "phoneNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_hexString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keysUpdated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_hexString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lostModePrivateKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_hexString"));
  v12 = 138413058;
  v13 = v5;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v9;
  v18 = 2112;
  v19 = v11;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "pairingCheckToken = %@\nphoneNumber = %@\nkeysUpdated = %@\nlostModePrivateKey = %@", (uint8_t *)&v12, 0x2Au);

}

void sub_10001FC64(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid registerResponse = %@ %@", buf, 0x16u);

}

void sub_10001FCD0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100011494(__stack_chk_guard);
  sub_100011460();
  sub_10001144C((void *)&_mh_execute_header, v0, v1, "fetching pairingData failed with errror = %@ timeout error =  %ld");
  sub_1000069D8();
}

void sub_10001FD30(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint8_t v5[24];

  v3 = objc_msgSend((id)objc_opt_class(a1), "defaultStorageLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000114A4();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "read magSafe data store from %@", v5, 0xCu);

}

void sub_10001FDC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114A4();
  sub_100005E78((void *)&_mh_execute_header, v0, v1, "Could not read magSafe accessories list from disk %@", v2, v3, v4, v5, v6);
  sub_1000069D8();
}

void sub_10001FE24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a1, a3, "trying to udpate key roll time for non exisiting accessory %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_10001FE8C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to decode corrupted data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001FF00(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "encoded data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001FF74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "Unable to encode obect", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001FFA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "Unable to decode data", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001FFCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000114B8();
  sub_100011478((void *)&_mh_execute_header, v0, v1, "FMDRemoteUnlockPairingData: Unable to decode data", v2, v3, v4, v5, v6);
  sub_1000114B0();
}

void sub_10001FFF8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "### decryption failed with error = %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_10002005C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011478((void *)&_mh_execute_header, a1, a3, "### algorithm is not supported", a5, a6, a7, a8, 0);
}

void sub_100020090(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005E78((void *)&_mh_execute_header, a2, a3, "### error encoding message = %@", a5, a6, a7, a8, 2u);
  sub_1000069D8();
}

void sub_1000200F4(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001E904();
  sub_10001E8C4((void *)&_mh_execute_header, v4, v5, "### error = %@, %@", v6, v7, v8, v9, v10);

  sub_10001E8D8();
}

void sub_100020188(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "length");
  sub_10001E91C();
  sub_10001E8E8();
  sub_10001E8C4((void *)&_mh_execute_header, v1, v2, "### message size two big %lu >= %lu", v3, v4, v5, v6, v7);
  sub_10001E8D8();
}

void sub_100020200(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001EBE0((void *)&_mh_execute_header, a2, a3, "Hex strings should have an even number of digits (%@)", a5, a6, a7, a8, 2u);
}

void sub_100020268(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001EBE0((void *)&_mh_execute_header, a2, a3, "MAC address should be 6 bytes (%@)", a5, a6, a7, a8, 2u);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MIMEType");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLAssetWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLAssetWithURL:options:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addAccessorytoDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addAccessorytoDataStore:");
}

id objc_msgSend__applyCircularShadowToLayer_bounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyCircularShadowToLayer:bounds:");
}

id objc_msgSend__bezierPathWithBalloonRadius_tailLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bezierPathWithBalloonRadius:tailLength:");
}

id objc_msgSend__cleanupDuplicationsOfAccessoryWithSerialNumber_currentAccessoryUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:");
}

id objc_msgSend__computeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeName");
}

id objc_msgSend__computehash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computehash:");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__removeAccessoryToDataStoreWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAccessoryToDataStoreWithID:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setLayoutDebuggingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLayoutDebuggingIdentifier:");
}

id objc_msgSend__setupLayers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupLayers");
}

id objc_msgSend__updateAnnotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAnnotation:");
}

id objc_msgSend__updateAppearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAppearance");
}

id objc_msgSend__updateDynamicLayers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDynamicLayers");
}

id objc_msgSend__writeAccessoriesToDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeAccessoriesToDisk:");
}

id objc_msgSend_aa_firstName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_firstName");
}

id objc_msgSend_aa_lastName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_lastName");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessoriesRawInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoriesRawInfo");
}

id objc_msgSend_accessoryDidConnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDidConnect:");
}

id objc_msgSend_accessoryDidDisconnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDidDisconnect:");
}

id objc_msgSend_accessoryDidUpdateWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDidUpdateWithUUID:");
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryIdentifier");
}

id objc_msgSend_accessoryInfoForConnection_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryInfoForConnection:withReply:");
}

id objc_msgSend_accessoryRawInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryRawInfo");
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryType");
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountState");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAccessory_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAccessory:withCompletion:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnnotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnnotation:");
}

id objc_msgSend_addCurveToPoint_controlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:");
}

id objc_msgSend_addDismissButtonAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDismissButtonAction:");
}

id objc_msgSend_addDynamicMapToCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDynamicMapToCard:");
}

id objc_msgSend_addFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFeature:");
}

id objc_msgSend_addImagetoCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addImagetoCard:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_additionalInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalInfo");
}

id objc_msgSend_additionalInfoForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalInfoForAccount:");
}

id objc_msgSend_adjustmentsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustmentsURL");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowedAccessoryTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedAccessoryTypes");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotation");
}

id objc_msgSend_appInstallCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appInstallCoordinator");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetStorageLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetStorageLocation");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetType");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetURL");
}

id objc_msgSend_authKitAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authKitAccountWithAltDSID:");
}

id objc_msgSend_authPassed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authPassed");
}

id objc_msgSend_authStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authStatus");
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automationHelperBundle");
}

id objc_msgSend_automationHelperClassWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automationHelperClassWithName:");
}

id objc_msgSend_auxiliaryViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auxiliaryViews");
}

id objc_msgSend_balloonImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonImage");
}

id objc_msgSend_balloonLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonLayer");
}

id objc_msgSend_beginUserKeyErase_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginUserKeyErase:withReply:");
}

id objc_msgSend_beginUserKeyEraseWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginUserKeyEraseWithCompletion:");
}

id objc_msgSend_beginVendorKeyErase_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginVendorKeyErase:withReply:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:inDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_caAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caAccessoryManager");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cache");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelUserKeyErase_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelUserKeyErase:withReply:");
}

id objc_msgSend_cancelUserKeyEraseWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelUserKeyEraseWithCompletion:");
}

id objc_msgSend_cancelVendorKeyErase_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelVendorKeyErase:withReply:");
}

id objc_msgSend_cancelVendorKeyEraseWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelVendorKeyEraseWithCompletion:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closePath");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_connectionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInfo");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:completion:");
}

id objc_msgSend_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:");
}

id objc_msgSend_continueVendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueVendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:");
}

id objc_msgSend_continueWithAccountValidationFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueWithAccountValidationFlow");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyUserPrivateKey_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUserPrivateKey:withReply:");
}

id objc_msgSend_copyUserPrivateKeyWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUserPrivateKeyWithCompletion:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataArchiver");
}

id objc_msgSend_dataToKey_isPublic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataToKey:isPublic:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithHexString:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decryptData_privateKeyData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decryptData:privateKeyData:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultStorageLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStorageLocation");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteAccessoryWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAccessoryWithUUID:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceAnnotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAnnotation");
}

id objc_msgSend_deviceDiscoveryId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDiscoveryId");
}

id objc_msgSend_deviceIDFromAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIDFromAddress:");
}

id objc_msgSend_deviceImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceImage");
}

id objc_msgSend_deviceLockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLockState");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_downloadTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithURL:completionHandler:");
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "email");
}

id objc_msgSend_enableCAAPI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCAAPI:");
}

id objc_msgSend_enableFMIPInContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFMIPInContext:");
}

id objc_msgSend_enableFindMyWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFindMyWithCompletion:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endPointUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endPointUUID");
}

id objc_msgSend_enumerateByteRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateByteRangesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_eraseKeyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseKeyType");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithMessage:");
}

id objc_msgSend_existingCoordinatorForAppWithBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingCoordinatorForAppWithBundleID:error:");
}

id objc_msgSend_fadeInAuxiliaryViewsOverDuration_delay_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeInAuxiliaryViewsOverDuration:delay:completion:");
}

id objc_msgSend_featurePlatterView_backgrounColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featurePlatterView:backgrounColor:");
}

id objc_msgSend_fetchAssetWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetWithCompletion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findMyEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findMyEnabled");
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareVersion");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fm_epoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_epoch");
}

id objc_msgSend_fm_genericError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_genericError");
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_hexString");
}

id objc_msgSend_fm_isFileNotFoundError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_isFileNotFoundError");
}

id objc_msgSend_fm_preferencesPathURLForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_preferencesPathURLForDomain:");
}

id objc_msgSend_fm_sha256Hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_sha256Hash");
}

id objc_msgSend_fm_timeoutError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_timeoutError");
}

id objc_msgSend_fmipStateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fmipStateWithCompletion:");
}

id objc_msgSend_generatePublicPrivateKeyPair_privateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePublicPrivateKeyPair:privateKey:");
}

id objc_msgSend_getAccessoryUserName_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessoryUserName:withReply:");
}

id objc_msgSend_getAccessoryWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessoryWithUUID:");
}

id objc_msgSend_getAuthNonceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAuthNonceWithCompletion:");
}

id objc_msgSend_getPairingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairingData:");
}

id objc_msgSend_getPairingDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairingDataWithCompletion:");
}

id objc_msgSend_getPairingStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairingStatus");
}

id objc_msgSend_getPairingStatus_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairingStatus:withReply:");
}

id objc_msgSend_getPublicNVMKeyValues_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPublicNVMKeyValues:forEndpoint:withReply:");
}

id objc_msgSend_getStoredAssetLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStoredAssetLocation");
}

id objc_msgSend_getUserPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUserPrivateKey:");
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAttemptedLoad");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:scale:");
}

id objc_msgSend_infoAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoAvailable");
}

id objc_msgSend_initWithAccessoryType_style_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryType:style:type:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAnnotation_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAnnotation:reuseIdentifier:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnectionInfo:");
}

id objc_msgSend_initWithCoordinate_title_subtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinate:title:subtitle:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEffectiveBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithMovieURL_adjustmentsURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMovieURL:adjustmentsURL:");
}

id objc_msgSend_initWithMovieURL_adjustmentsURL_movieDimensions_productHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPhysicalAccessory_fmEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhysicalAccessory:fmEnabled:");
}

id objc_msgSend_initWithQueue_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:timeout:completion:");
}

id objc_msgSend_initWithRequestURL_mimeTypeProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequestURL:mimeTypeProvider:");
}

id objc_msgSend_initWithTitle_detailText_imageView_valueChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:detailText:imageView:valueChangedBlock:");
}

id objc_msgSend_installApp_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installApp:withCompletionHandler:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isAllowedAccessoryWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAllowedAccessoryWithType:");
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomationActive");
}

id objc_msgSend_isBeingPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBeingPresented");
}

id objc_msgSend_isCachedAccessoryWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCachedAccessoryWithUUID:");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isComplete");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFindMyAppInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFindMyAppInstalled");
}

id objc_msgSend_isFindMyEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFindMyEnabled");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isMF4i(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMF4i");
}

id objc_msgSend_isNVMSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNVMSetup");
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlayable");
}

id objc_msgSend_isRestrictedSKU(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestrictedSKU");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidReponse_validationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidReponse:validationError:");
}

id objc_msgSend_isValidVideoAtFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidVideoAtFilePath:");
}

id objc_msgSend_keyToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyToData:");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keys");
}

id objc_msgSend_keysAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysAvailable");
}

id objc_msgSend_keysUpdated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysUpdated");
}

id objc_msgSend_lastLostModeKeyRollTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLostModeKeyRollTime");
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchContext");
}

id objc_msgSend_launchSettingsAppUpgradeFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchSettingsAppUpgradeFlow");
}

id objc_msgSend_launchedFromFindMyApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchedFromFindMyApp");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationManager");
}

id objc_msgSend_lostModeDataArchiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostModeDataArchiver");
}

id objc_msgSend_lostModeInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostModeInfo");
}

id objc_msgSend_lostModePrivateKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostModePrivateKey");
}

id objc_msgSend_lostModeStorageLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostModeStorageLocation");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_magSafeAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magSafeAccessory");
}

id objc_msgSend_magSafeState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magSafeState");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainContentGuide");
}

id objc_msgSend_mapDeviceImagePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapDeviceImagePath");
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapView");
}

id objc_msgSend_mimeTypeForFileExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mimeTypeForFileExtension:");
}

id objc_msgSend_mimeTypeProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mimeTypeProvider");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_movieDimensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movieDimensions");
}

id objc_msgSend_movieView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movieView");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_otherData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherData");
}

id objc_msgSend_pairingCheckForAccessory_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCheckForAccessory:completion:");
}

id objc_msgSend_pairingCheckForAccessory_useEraseKeyType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCheckForAccessory:useEraseKeyType:completion:");
}

id objc_msgSend_pairingCheckToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCheckToken");
}

id objc_msgSend_pairingCheckWith_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCheckWith:completion:");
}

id objc_msgSend_pairingData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingData");
}

id objc_msgSend_pairingToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingToken");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_physicalAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalAccessory");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "play");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player");
}

id objc_msgSend_playerWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerWithURL:");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_preferredMIMEType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredMIMEType");
}

id objc_msgSend_prepareForSetupFlowFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForSetupFlowFor:");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedCard");
}

id objc_msgSend_presentingAccessorySerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingAccessorySerialNumber");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_productHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productHeight");
}

id objc_msgSend_progressFlowWithState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressFlowWithState:");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocol");
}

id objc_msgSend_provisionAccessoryForFindMy_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisionAccessoryForFindMy:withReply:");
}

id objc_msgSend_proxCardAlreadyAttached(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardAlreadyAttached");
}

id objc_msgSend_proxCardAttachAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardAttachAccessory");
}

id objc_msgSend_proxCardLockedFindMyNotPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardLockedFindMyNotPaired");
}

id objc_msgSend_proxCardNoAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardNoAccount");
}

id objc_msgSend_proxCardNonOwnerLockedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardNonOwnerLockedDevice");
}

id objc_msgSend_proxCardNonOwnerUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardNonOwnerUnlocked");
}

id objc_msgSend_proxCardSetupComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardSetupComplete");
}

id objc_msgSend_proxCardSetupError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardSetupError");
}

id objc_msgSend_proxCardSetupFindmy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardSetupFindmy");
}

id objc_msgSend_proxCardSpinner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardSpinner");
}

id objc_msgSend_proxCardUnlockedStartFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardUnlockedStartFlow");
}

id objc_msgSend_proxCardUnsupportedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardUnsupportedAccessory");
}

id objc_msgSend_proxCardUpgradeAccountSecurity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardUpgradeAccountSecurity");
}

id objc_msgSend_proxCardUpgradeAccountSecurityError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardUpgradeAccountSecurityError");
}

id objc_msgSend_publicKeyFromPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKeyFromPrivateKey:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_randomDataOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "randomDataOfSize:");
}

id objc_msgSend_readAllAccessoriesFromDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readAllAccessoriesFromDisk");
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDictionaryAndClasses:error:");
}

id objc_msgSend_readLostModeAccessoriesList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLostModeAccessoriesList");
}

id objc_msgSend_readLostModeAccessoriesListVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLostModeAccessoriesListVersion");
}

id objc_msgSend_registerDelegate_withFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDelegate:withFilter:");
}

id objc_msgSend_registerDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDevice:");
}

id objc_msgSend_registerDeviceForPairingLock_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDeviceForPairingLock:completion:");
}

id objc_msgSend_remoteVCProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteVCProxy");
}

id objc_msgSend_removeAccessoryWithId_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccessoryWithId:withCompletion:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeKey:inDomain:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_requestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestURL");
}

id objc_msgSend_resetPairingInformation_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetPairingInformation:withReply:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_sanitizedHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sanitizedHexString:");
}

id objc_msgSend_saveAccessory_withUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAccessory:withUUID:");
}

id objc_msgSend_saveDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveDictionary:");
}

id objc_msgSend_securityLevelForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityLevelForAccount:");
}

id objc_msgSend_selectAnnotation_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectAnnotation:animated:");
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumbers");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_serverNonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverNonce");
}

id objc_msgSend_setAccessoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryUserName_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryUserName:forEndpoint:withReply:");
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionAtItemEnd:");
}

id objc_msgSend_setAdditionalInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalInfo:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAppInstallCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppInstallCoordinator:");
}

id objc_msgSend_setAuthNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthNonce:");
}

id objc_msgSend_setAuthStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthStatus:");
}

id objc_msgSend_setAutomationHelperBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomationHelperBundle:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAuxiliaryViewsAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuxiliaryViewsAlpha:");
}

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackedUp:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBalloonImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBalloonImage:");
}

id objc_msgSend_setBalloonLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBalloonLayer:");
}

id objc_msgSend_setBodyText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBodyText:");
}

id objc_msgSend_setCaAccessoryManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaAccessoryManager:");
}

id objc_msgSend_setCanShowCallout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanShowCallout:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setConnectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionInfo:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setCoordinate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoordinate:");
}

id objc_msgSend_setCoreAccessoryUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoreAccessoryUID:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCreateDirectories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreateDirectories:");
}

id objc_msgSend_setDataArchiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataArchiver:");
}

id objc_msgSend_setDataProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataProtectionClass:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDeviceAnnotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceAnnotation:");
}

id objc_msgSend_setDeviceDiscoveryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDiscoveryId:");
}

id objc_msgSend_setDeviceImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceImage:");
}

id objc_msgSend_setDeviceLockState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLockState:");
}

id objc_msgSend_setDismissButtonAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissButtonAction:");
}

id objc_msgSend_setDismissalType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalType:");
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistanceFilter:");
}

id objc_msgSend_setEmail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmail:");
}

id objc_msgSend_setEndPointUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndPointUUID:");
}

id objc_msgSend_setEraseKeyType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEraseKeyType:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFindMyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFindMyEnabled:");
}

id objc_msgSend_setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareVersion:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHasAttemptedLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasAttemptedLoad:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImageStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageStyle:");
}

id objc_msgSend_setImageViewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageViewSize:");
}

id objc_msgSend_setImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImages:");
}

id objc_msgSend_setInfoAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInfoAvailable:");
}

id objc_msgSend_setIsNVMSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsNVMSetup:");
}

id objc_msgSend_setKeysAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeysAvailable:");
}

id objc_msgSend_setKeysUpdated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeysUpdated:");
}

id objc_msgSend_setLastLostModeKeyRollTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastLostModeKeyRollTime:");
}

id objc_msgSend_setLaunchContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchContext:");
}

id objc_msgSend_setLaunchedFromFindMyApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchedFromFindMyApp:");
}

id objc_msgSend_setLocationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationManager:");
}

id objc_msgSend_setLockStateNotifyToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockStateNotifyToken:");
}

id objc_msgSend_setLostModeDataArchiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLostModeDataArchiver:");
}

id objc_msgSend_setLostModePrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLostModePrivateKey:");
}

id objc_msgSend_setLostModePubKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLostModePubKey:");
}

id objc_msgSend_setMagSafeAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMagSafeAccessory:");
}

id objc_msgSend_setMagSafeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMagSafeState:");
}

id objc_msgSend_setMapDeviceImagePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapDeviceImagePath:");
}

id objc_msgSend_setMapType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapType:");
}

id objc_msgSend_setMapView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapView:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setName_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:withCompletion:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtherData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOtherData:");
}

id objc_msgSend_setPairingCheckToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingCheckToken:");
}

id objc_msgSend_setPairingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingData:");
}

id objc_msgSend_setPairingData_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingData:withCompletion:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPhysicalAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhysicalAccessory:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPresentedCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentedCard:");
}

id objc_msgSend_setPresentingAccessorySerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingAccessorySerialNumber:");
}

id objc_msgSend_setPrevProxCardState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrevProxCardState:");
}

id objc_msgSend_setProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocol:");
}

id objc_msgSend_setProxCardState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxCardState:");
}

id objc_msgSend_setPublicNVMKeyValues_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPublicNVMKeyValues:forEndpoint:withReply:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRegion_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegion:animated:");
}

id objc_msgSend_setRemoteVCProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteVCProxy:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setSerialNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumbers:");
}

id objc_msgSend_setSerialQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialQueue:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShowAttachScreenTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowAttachScreenTimer:");
}

id objc_msgSend_setShowsUserLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsUserLocation:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setTimeStamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStamp:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransportType:");
}

id objc_msgSend_setUpFindMyWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpFindMyWithCompletion:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserLocationAnnotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserLocationAnnotation:");
}

id objc_msgSend_setUserPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserPrivateKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupEnded");
}

id objc_msgSend_setupKeysWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupKeysWithCompletion:");
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFactory");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_showActivityIndicatorWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showActivityIndicatorWithStatus:");
}

id objc_msgSend_showAttachScreenTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAttachScreenTimer");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signature");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpdatingLocation");
}

id objc_msgSend_stateForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateForAccessory:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_storeAccessoryAsNotFindmyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAccessoryAsNotFindmyEnabled:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGray3Color");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPinkColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_testCrypto2_privateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCrypto2:privateKey:");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_titleTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleTextView");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_triggerFindMyAppInstallation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerFindMyAppInstallation");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_updateAdjustments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAdjustments");
}

id objc_msgSend_updateLostModeKeyRollTimeFor_lastLostModeKeyRollTime_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLostModeKeyRollTimeFor:lastLostModeKeyRollTime:withCompletion:");
}

id objc_msgSend_updatePairingData_pairingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePairingData:pairingData:");
}

id objc_msgSend_updatePairingLockInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePairingLockInfo:completion:");
}

id objc_msgSend_updateWithAccessoryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithAccessoryInfo:");
}

id objc_msgSend_updateWithProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithProperties:");
}

id objc_msgSend_upgradeAccountButtonPressedOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradeAccountButtonPressedOn:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_useEraseKeyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useEraseKeyType");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_userLocationAnnotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userLocationAnnotation");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:completion:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_writeLostModeInfo_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeLostModeInfo:version:");
}

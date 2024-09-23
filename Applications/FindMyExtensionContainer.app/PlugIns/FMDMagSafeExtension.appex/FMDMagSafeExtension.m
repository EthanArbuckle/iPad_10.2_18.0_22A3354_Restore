id sub_10000430C()
{
  if (qword_100031188 != -1)
    dispatch_once(&qword_100031188, &stru_1000244E0);
  return (id)qword_100031190;
}

void sub_10000434C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "_");
  v2 = (void *)qword_100031190;
  qword_100031190 = (uint64_t)v1;

}

id sub_10000437C()
{
  if (qword_100031198 != -1)
    dispatch_once(&qword_100031198, &stru_100024500);
  return (id)qword_1000311A0;
}

void sub_1000043BC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "locations");
  v2 = (void *)qword_1000311A0;
  qword_1000311A0 = (uint64_t)v1;

}

id sub_1000043EC()
{
  if (qword_1000311A8 != -1)
    dispatch_once(&qword_1000311A8, &stru_100024520);
  return (id)qword_1000311B0;
}

void sub_10000442C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accessory");
  v2 = (void *)qword_1000311B0;
  qword_1000311B0 = (uint64_t)v1;

}

id sub_10000445C()
{
  if (qword_1000311B8 != -1)
    dispatch_once(&qword_1000311B8, &stru_100024540);
  return (id)qword_1000311C0;
}

void sub_10000449C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "traffic");
  v2 = (void *)qword_1000311C0;
  qword_1000311C0 = (uint64_t)v1;

}

id sub_1000044CC()
{
  if (qword_1000311C8 != -1)
    dispatch_once(&qword_1000311C8, &stru_100024560);
  return (id)qword_1000311D0;
}

void sub_10000450C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "encoder");
  v2 = (void *)qword_1000311D0;
  qword_1000311D0 = (uint64_t)v1;

}

id sub_10000453C()
{
  if (qword_1000311D8 != -1)
    dispatch_once(&qword_1000311D8, &stru_100024580);
  return (id)qword_1000311E0;
}

void sub_10000457C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  v2 = (void *)qword_1000311E0;
  qword_1000311E0 = (uint64_t)v1;

}

id sub_1000045AC()
{
  if (qword_1000311E8 != -1)
    dispatch_once(&qword_1000311E8, &stru_1000245A0);
  return (id)qword_1000311F0;
}

void sub_1000045EC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions");
  v2 = (void *)qword_1000311F0;
  qword_1000311F0 = (uint64_t)v1;

}

id sub_10000461C()
{
  if (qword_1000311F8 != -1)
    dispatch_once(&qword_1000311F8, &stru_1000245C0);
  return (id)qword_100031200;
}

void sub_10000465C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  v2 = (void *)qword_100031200;
  qword_100031200 = (uint64_t)v1;

}

id sub_10000468C()
{
  if (qword_100031208 != -1)
    dispatch_once(&qword_100031208, &stru_1000245E0);
  return (id)qword_100031210;
}

void sub_1000046CC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  v2 = (void *)qword_100031210;
  qword_100031210 = (uint64_t)v1;

}

id sub_1000046FC()
{
  if (qword_100031218 != -1)
    dispatch_once(&qword_100031218, &stru_100024600);
  return (id)qword_100031220;
}

void sub_10000473C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  v2 = (void *)qword_100031220;
  qword_100031220 = (uint64_t)v1;

}

id sub_10000476C()
{
  if (qword_100031228 != -1)
    dispatch_once(&qword_100031228, &stru_100024620);
  return (id)qword_100031230;
}

void sub_1000047AC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  v2 = (void *)qword_100031230;
  qword_100031230 = (uint64_t)v1;

}

id sub_1000047DC()
{
  if (qword_100031238 != -1)
    dispatch_once(&qword_100031238, &stru_100024640);
  return (id)qword_100031240;
}

void sub_10000481C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  v2 = (void *)qword_100031240;
  qword_100031240 = (uint64_t)v1;

}

id sub_10000484C()
{
  if (qword_100031248 != -1)
    dispatch_once(&qword_100031248, &stru_100024660);
  return (id)qword_100031250;
}

void sub_10000488C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  v2 = (void *)qword_100031250;
  qword_100031250 = (uint64_t)v1;

}

id sub_1000048BC()
{
  if (qword_100031258 != -1)
    dispatch_once(&qword_100031258, &stru_100024680);
  return (id)qword_100031260;
}

void sub_1000048FC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  v2 = (void *)qword_100031260;
  qword_100031260 = (uint64_t)v1;

}

id sub_10000492C()
{
  if (qword_100031268 != -1)
    dispatch_once(&qword_100031268, &stru_1000246A0);
  return (id)qword_100031270;
}

void sub_10000496C(id a1)
{
  os_log_t v1;
  void *v2;

  if (+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("ShowAutomationLogs"), CFSTR("com.apple.icloud.findmydeviced.notbackedup")))
  {
    v1 = os_log_create("com.apple.icloud.findmydeviced", "automation");
    v2 = (void *)qword_100031270;
    qword_100031270 = (uint64_t)v1;

  }
}

void sub_100005B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005C2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005C3C(uint64_t a1)
{

}

void sub_100005C44(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100005D54(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100005E64(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100005F74(uint64_t a1, void *a2, void *a3)
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
  v8 = sub_100007B7C();
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

void sub_100006108(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100006154(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_1000061A0(uint64_t a1, void *a2)
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
  v4 = sub_100007B7C();
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

void sub_100006288(uint64_t a1, void *a2)
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
  v4 = sub_100007B7C();
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

void sub_100006C08(_QWORD *a1, void *a2)
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
  v4 = sub_100007B7C();
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

void sub_100006D54(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_100007B7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairingKeyUpdated with error = %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100006FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100006FF4(uint64_t a1, void *a2, void *a3)
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

  v10 = sub_100007B7C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setName completed with error = %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000072C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000072E0(uint64_t a1, void *a2)
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
  v4 = sub_100007B7C();
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

void sub_1000076DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100007718(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_1000079F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100007A1C(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100007B2C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100007B58(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_100007B70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_100007B7C()
{
  if (qword_100031278 != -1)
    dispatch_once(&qword_100031278, &stru_100024828);
  return (id)qword_100031280;
}

void sub_100007BBC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "magSafe");
  v2 = (void *)qword_100031280;
  qword_100031280 = (uint64_t)v1;

}

void sub_1000084C0(id a1)
{
  FMDMagSafeDataStore *v1;
  void *v2;

  v1 = objc_alloc_init(FMDMagSafeDataStore);
  v2 = (void *)qword_100031288;
  qword_100031288 = (uint64_t)v1;

}

id sub_100008728(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_writeAccessoriesToDisk:", &__NSDictionary0__struct);
  return objc_msgSend(*(id *)(a1 + 32), "writeLostModeInfo:version:", &__NSArray0__struct, &stru_100025AC8);
}

void sub_100008838(uint64_t a1)
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
  v12[2] = sub_100008950;
  v12[3] = &unk_1000248B8;
  v10 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v10;
  v11 = v7;
  dispatch_async(v9, v12);

}

uint64_t sub_100008950(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100008A1C(uint64_t a1)
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
  v10[2] = sub_100008B18;
  v10[3] = &unk_1000248B8;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t sub_100008B18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100008BE4(uint64_t a1)
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
      v16 = sub_1000045AC();
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
      block[2] = sub_100008F5C;
      block[3] = &unk_1000248B8;
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
  v24 = sub_1000045AC();
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
  v31[2] = sub_100008F6C;
  v31[3] = &unk_100024908;
  v32 = *(id *)(v30 + 48);
  dispatch_async(v28, v31);

  v8 = v32;
LABEL_18:

}

uint64_t sub_100008F5C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100008F6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000096D0(uint64_t a1)
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
    v8 = sub_10000430C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100016AA4(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
  }
  v17 = (void *)v7;
  global_queue = dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue(global_queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000982C;
  v22[3] = &unk_1000248B8;
  v20 = *(id *)(a1 + 56);
  v23 = v17;
  v24 = v20;
  v21 = v17;
  dispatch_async(v19, v22);

}

uint64_t sub_10000982C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_1000098C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009A40(id a1)
{
  FMDMagSafeSetupAgent *v1;
  void *v2;

  v1 = objc_alloc_init(FMDMagSafeSetupAgent);
  v2 = (void *)qword_100031298;
  qword_100031298 = (uint64_t)v1;

  objc_msgSend((id)qword_100031298, "setRemoteAlertHandle:", 0);
}

void sub_100009CAC(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));

  if (v2)
  {
    v3 = sub_10000430C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100016B0C(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v4 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.FMDMagSafeSetupRemoteUI"), CFSTR("FMDMagSafeSetupRemoteUIViewController"));
    v12 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v13 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v4, v12);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteAlertHandle:", v13);

    v14 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    v15 = *(_QWORD *)(a1 + 40);
    v19 = CFSTR("FMLaunchContext");
    v20 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    objc_msgSend(v14, "setUserInfo:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));
    objc_msgSend(v17, "activateWithContext:", v14);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));
    objc_msgSend(v18, "addObserver:", *(_QWORD *)(a1 + 32));

  }
}

void sub_100009EF4(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));

  v3 = sub_10000430C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v5)
      sub_100016B0C(v4, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    if (v5)
      sub_100016B3C(v4, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(a1 + 32), "setLaunchCompleted:", *(_QWORD *)(a1 + 48));
    v4 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.FMDMagSafeSetupRemoteUI"), CFSTR("FMDMagSafeSetupRemoteUIViewController"));
    v13 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v14 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v4, v13);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteAlertHandle:", v14);

    v15 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    v16 = *(_QWORD *)(a1 + 40);
    v20 = CFSTR("FMLaunchContext");
    v21 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    objc_msgSend(v15, "setUserInfo:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));
    objc_msgSend(v18, "activateWithContext:", v15);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteAlertHandle"));
    objc_msgSend(v19, "addObserver:", *(_QWORD *)(a1 + 32));

  }
}

void sub_10000A2B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A310(id a1)
{
  FMDAccessoryTypeValidator *v1;
  void *v2;

  v1 = objc_opt_new(FMDAccessoryTypeValidator);
  v2 = (void *)qword_1000312A8;
  qword_1000312A8 = (uint64_t)v1;

}

void sub_10000A76C(uint64_t a1)
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

  v2 = sub_100007B7C();
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

void sub_10000A9F8(uint64_t a1)
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

  v2 = sub_100007B7C();
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

  v9 = sub_100007B7C();
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

  v13 = sub_100007B7C();
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
    v22[2] = sub_10000AD04;
    v22[3] = &unk_100024978;
    v22[4] = *(_QWORD *)(a1 + 48);
    v23 = v7;
    dispatch_async(v18, v22);

  }
  v19 = sub_100007B7C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accessoryRawInfo"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "dict = %@", buf, 0xCu);

  }
}

void sub_10000AD04(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serialNumber"));
  objc_msgSend(v3, "accessoryDidConnect:", v2);

}

void sub_10000AE84(uint64_t a1)
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

  v5 = sub_100007B7C();
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
  v13 = sub_10000AFE8;
  v14 = &unk_100024978;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v9 = v4;
  dispatch_async(v8, &v11);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache", v11, v12, v13, v14, v15));
  objc_msgSend(v10, "deleteAccessoryWithUUID:", *(_QWORD *)(a1 + 40));

}

void sub_10000AFE8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "accessoryDidDisconnect:", *(_QWORD *)(a1 + 40));

}

void sub_10000B334(uint64_t a1)
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
          v11[3] = sub_10000B4C8;
          v11[4] = sub_10000B4D4;
          objc_initWeak(&v12, *(id *)(a1 + 32));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionInfo"));
          v6 = *(_QWORD *)(a1 + 40);
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = sub_10000B4DC;
          v7[3] = &unk_100024A60;
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

void sub_10000B4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_10000B4C8(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_10000B4D4(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_10000B4DC(uint64_t a1)
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
  v6[2] = sub_10000B5AC;
  v6[3] = &unk_100024A38;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  dispatch_async(v5, v6);

}

void sub_10000B5AC(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialNumber"));
  objc_msgSend(v2, "accessoryDidConnect:", v3);

}

void sub_10000B760(id a1)
{
  FMDAutomationHelperFactory *v1;
  void *v2;

  v1 = objc_alloc_init(FMDAutomationHelperFactory);
  v2 = (void *)qword_1000312B8;
  qword_1000312B8 = (uint64_t)v1;

}

void sub_10000BA48(id a1)
{
  unsigned int v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v1 = objc_msgSend(v2, "isInternalBuild");
  if (v1)
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("EnableMagSafeMocking"), kFMDNotBackedUpPrefDomain);
  byte_1000312C8 = v1;

}

void sub_10000BB10(id a1)
{
  void *v1;
  objc_class *v2;
  id v3;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
  v2 = (objc_class *)objc_msgSend(v1, "automationHelperClassWithName:", CFSTR("FMDAutomationACCConnectionInfo"));

  v3 = objc_alloc_init(v2);
  v4 = (void *)qword_1000312D8;
  qword_1000312D8 = (uint64_t)v3;

}

void sub_10000CAA8(id a1)
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
  v10 = (void *)qword_1000312E8;
  qword_1000312E8 = v9;

}

id *sub_10000DE88(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
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

void sub_10000DEE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

NSError *__cdecl sub_10000DEF4(id a1, SEL a2, id a3)
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

void sub_10000E024(id a1)
{
  FMDMagSafeAccessoryManager *v1;
  void *v2;

  v1 = objc_alloc_init(FMDMagSafeAccessoryManager);
  v2 = (void *)qword_1000312F8;
  qword_1000312F8 = (uint64_t)v1;

}

void sub_10000E874(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = a2;
  v4 = sub_100007B7C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removeKeysWithCompletion completed with error %@", buf, 0xCu);
  }

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSource"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000E9AC;
    v8[3] = &unk_100025538;
    v7 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "removeAccessoryWithSerialNumber:withCompletion:", v7, v8);

  }
}

void sub_10000E9AC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_1000045AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory failed with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory successful", (uint8_t *)&v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getFindMyEnabledAccessories"));
    objc_msgSend(*(id *)(a1 + 32), "setAllAccessories:", v7);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.removed"), 0, 0, 1u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000EAE8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_1000045AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory failed with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory successful", (uint8_t *)&v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getFindMyEnabledAccessories"));
    objc_msgSend(*(id *)(a1 + 32), "setAllAccessories:", v7);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.removed"), 0, 0, 1u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000EF48(id *a1)
{
  void *v2;
  FMFuture *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD block[5];
  uint8_t buf[16];
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "launchFlowFuture"));

  if (!v2)
  {
    v3 = objc_opt_new(FMFuture);
    objc_msgSend(a1[4], "setLaunchFlowFuture:", v3);

    objc_initWeak(&location, a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "launchFlowFuture"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000F190;
    v15[3] = &unk_100025588;
    objc_copyWeak(&v18, &location);
    v16 = a1[5];
    v17 = a1[6];
    v5 = objc_msgSend(v4, "addCompletionBlock:", v15);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connectedAccessory"));
    if (v6)
    {
      v7 = sub_1000045AC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accessory already connected", buf, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "launchFlowFuture"));
      objc_msgSend(v9, "finishWithNoResult");

    }
    else
    {
      v10 = sub_1000045AC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "accessory not connected waiting", buf, 2u);
      }

      v12 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F1CC;
      block[3] = &unk_100024890;
      block[4] = a1[4];
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void sub_10000F160(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10000F190(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "launchSetupModuleWithInfo2:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10000F1CC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_1000045AC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "accessory connection wait finished", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "launchFlowFuture"));
  objc_msgSend(v4, "finishWithNoResult");

}

void sub_10000F384(id *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  dispatch_time_t v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  FMDRemoteAsset *v44;
  void *v45;
  void *v46;
  FMDRemoteAsset *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  dispatch_time_t v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  FMDRemoteAsset *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  FMDRemoteAsset *v66;
  void *v67;
  void *v68;
  dispatch_time_t v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  FMDRemoteAsset *v79;
  void *v80;
  void *v81;
  FMDRemoteAsset *v82;
  FMDRemoteAsset *v83;
  void *v84;
  void *v85;
  FMDRemoteAsset *v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  FMDMagSafeAccessory *v94;
  void *v95;
  id v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  FMDRemoteAsset *v105;
  void *v106;
  id v108;
  _QWORD v109[5];
  id v110;
  id v111;
  _QWORD v112[4];
  NSObject *v113;
  _QWORD v114[4];
  NSObject *v115;
  _QWORD v116[4];
  NSObject *v117;
  _QWORD v118[4];
  NSObject *v119;
  __int128 *p_buf;
  _QWORD v121[5];
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 buf;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  _BYTE v132[128];

  objc_msgSend(a1[4], "setLaunchFlowFuture:", 0);
  v1 = sub_1000045AC();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "### preparing for launching setup module with info = %@", (uint8_t *)&buf, 0xCu);
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("notificationName")));
  v4 = objc_msgSend(v106, "isEqualToString:", CFSTR("com.apple.icloud.FindMy.addMagSafeAccessory"));
  v5 = sub_1000045AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "caAccessoryManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryRawInfo"));
    v9 = objc_msgSend(v8, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### connected accessories count = %lu", (uint8_t *)&buf, 0xCu);

  }
  v108 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connectedAccessory"));
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "caAccessoryManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryRawInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allValues"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v124 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryTypeValidator sharedInstance](FMDAccessoryTypeValidator, "sharedInstance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessoryType"));
        if (objc_msgSend(v17, "isAllowedAccessoryWithType:", v18)
          && objc_msgSend(v16, "isMF4i"))
        {
          v19 = objc_msgSend(v16, "authPassed");

          if (v19)
          {
            v20 = v16;

            v108 = v20;
            goto LABEL_17;
          }
        }
        else
        {

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
    }
    while (v13);
  }
LABEL_17:

  if (v4)
  {
    v21 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100028B18, CFSTR("launchedFromFindMyApp"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_100028B18, CFSTR("includeFindMyDisabledDevices"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "serialNumber"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("serialNumber"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeSetupAgent sharedInstance](FMDMagSafeSetupAgent, "sharedInstance"));
    objc_msgSend(v23, "launchSetupModuleWith:completion:", v21, a1[6]);

LABEL_60:
    v24 = v108;
    goto LABEL_61;
  }
  v24 = v108;
  if (v108)
  {
    objc_msgSend(v108, "getPairingStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "serialNumber"));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v25));

    if (objc_msgSend(v108, "isNVMSetup") && objc_msgSend(v108, "keysAvailable"))
    {
      if (v21
        && (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "allAccessories")),
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v21)),
            v28 = v27 == 0,
            v27,
            v26,
            v28))
      {
        v94 = -[FMDMagSafeAccessory initWithPhysicalAccessory:fmEnabled:]([FMDMagSafeAccessory alloc], "initWithPhysicalAccessory:fmEnabled:", v108, 1);
        if (v94)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dataSource"));
          v121[0] = _NSConcreteStackBlock;
          v121[1] = 3221225472;
          v121[2] = sub_10000FFE8;
          v121[3] = &unk_100025538;
          v121[4] = a1[4];
          v122 = a1[6];
          objc_msgSend(v95, "addAccessory:withCompletion:", v94, v121);

        }
        else
        {
          v96 = sub_100007B7C();
          v97 = objc_claimAutoreleasedReturnValue(v96);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            sub_100016FAC(v97, v98, v99, v100, v101, v102, v103, v104);

          (*((void (**)(void))a1[6] + 2))();
        }

      }
      else
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"), 0, 0, 1u);
      }
      +[FMDPairingCheckHelper checkAndHealPairingKeys:completion:](FMDPairingCheckHelper, "checkAndHealPairingKeys:completion:", v108, &stru_1000255A8);
      goto LABEL_60;
    }
    v30 = objc_alloc_init((Class)NSMutableDictionary);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v128 = 0x3032000000;
    v129 = sub_100010174;
    v130 = sub_100010184;
    v131 = 0;
    if (objc_msgSend(v108, "isNVMSetup") && (objc_msgSend(v108, "keysAvailable") & 1) == 0)
    {
      v31 = dispatch_group_create();
      dispatch_group_enter(v31);
      v32 = v108;
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_10001018C;
      v118[3] = &unk_1000255D0;
      p_buf = &buf;
      v33 = v31;
      v119 = v33;
      +[FMDPairingCheckHelper pairingCheckForAccessory:completion:](FMDPairingCheckHelper, "pairingCheckForAccessory:completion:", v32, v118);
      v34 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(v33, v34))
      {
        v35 = sub_100007B7C();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_10001700C();

      }
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("ownerNumber")));
    objc_msgSend(v108, "setPhoneNumber:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("email")));
    objc_msgSend(v108, "setEmail:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "serialNumber"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v39, CFSTR("serialNumber"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v108, "isNVMSetup")));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v40, CFSTR("isNVMSetup"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v108, "keysAvailable")));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v41, CFSTR("keysAvailable"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "phoneNumber"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v42, CFSTR("phoneNumber"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "email"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v43, CFSTR("email"));

    if ((objc_msgSend(v108, "isNVMSetup") & 1) != 0)
    {
      if (!objc_msgSend(v108, "isNVMSetup")
        || (objc_msgSend(v108, "keysAvailable") & 1) != 0)
      {
        goto LABEL_48;
      }
      v44 = [FMDRemoteAsset alloc];
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "style"));
      v47 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v44, "initWithAccessoryType:style:type:", v45, v46, 3);

      v48 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v47, "getStoredAssetLocation"));
      if (v48)
      {
LABEL_47:

LABEL_48:
        if (!v21
          || (v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "allAccessories")),
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", v21)),
              v89 = v88 == 0,
              v88,
              v87,
              v89))
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeSetupAgent sharedInstance](FMDMagSafeSetupAgent, "sharedInstance", v105));
          objc_msgSend(v93, "launchSetupModuleWith:completion:", v30, a1[6]);
        }
        else
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dataSource"));
          v109[0] = _NSConcreteStackBlock;
          v109[1] = 3221225472;
          v109[2] = sub_1000106A0;
          v109[3] = &unk_100025680;
          v91 = a1[6];
          v92 = a1[4];
          v111 = v91;
          v109[4] = v92;
          v110 = v30;
          objc_msgSend(v90, "removeAccessoryWithId:withCompletion:", v21, v109);

          v93 = v111;
        }

        _Block_object_dispose(&buf, 8);
        goto LABEL_60;
      }
      v49 = dispatch_group_create();
      dispatch_group_enter(v49);
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = sub_1000105C8;
      v112[3] = &unk_1000255F8;
      v50 = v49;
      v113 = v50;
      -[FMDRemoteAsset fetchAssetWithCompletion:](v47, "fetchAssetWithCompletion:", v112);
      v51 = dispatch_time(0, 3000000000);
      if (dispatch_group_wait(v50, v51))
      {
        v52 = sub_100007B7C();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_100016FDC(v53, v54, v55, v56, v57, v58, v59, v60);

      }
    }
    else
    {
      v61 = [FMDRemoteAsset alloc];
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryType"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "style"));
      v47 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v61, "initWithAccessoryType:style:type:", v62, v63, 0);

      v64 = dispatch_group_create();
      dispatch_group_enter(v64);
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472;
      v116[2] = sub_100010280;
      v116[3] = &unk_1000255F8;
      v65 = v64;
      v117 = v65;
      -[FMDRemoteAsset fetchAssetWithCompletion:](v47, "fetchAssetWithCompletion:", v116);
      v66 = [FMDRemoteAsset alloc];
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryType"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "style"));
      v105 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v66, "initWithAccessoryType:style:type:", v67, v68, 1);

      dispatch_group_enter(v65);
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_100010358;
      v114[3] = &unk_1000255F8;
      v48 = v65;
      v115 = v48;
      -[FMDRemoteAsset fetchAssetWithCompletion:](v105, "fetchAssetWithCompletion:", v114);
      v69 = dispatch_time(0, 5000000000);
      if (dispatch_group_wait(v48, v69))
      {
        v70 = sub_100007B7C();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          sub_100016FDC(v71, v72, v73, v74, v75, v76, v77, v78);

      }
      v79 = [FMDRemoteAsset alloc];
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryType"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "style"));
      v82 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v79, "initWithAccessoryType:style:type:", v80, v81, 2);

      -[FMDRemoteAsset fetchAssetWithCompletion:](v82, "fetchAssetWithCompletion:", &stru_100025638);
      v83 = [FMDRemoteAsset alloc];
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryType"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "style"));
      v86 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v83, "initWithAccessoryType:style:type:", v84, v85, 3);

      -[FMDRemoteAsset fetchAssetWithCompletion:](v86, "fetchAssetWithCompletion:", &stru_100025658);
      v50 = v117;
    }

    goto LABEL_47;
  }
LABEL_61:

}

void sub_10000FF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_10000FFE8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_1000045AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "add accessory failed with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "add accessory successful", (uint8_t *)&v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getFindMyEnabledAccessories"));
    objc_msgSend(*(id *)(a1 + 32), "setAllAccessories:", v7);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"), 0, 0, 1u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100010124(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100007B7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10001706C();

}

uint64_t sub_100010174(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010184(uint64_t a1)
{

}

void sub_10001018C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = sub_100007B7C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pairingCheckForAccessory completed with error = %@ lostModeInfo = %@", (uint8_t *)&v12, 0x16u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100010280(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100010358(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100010430(id a1, NSString *a2, NSError *a3)
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
  v6 = sub_100007B7C();
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

void sub_1000104FC(id a1, NSString *a2, NSError *a3)
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
  v6 = sub_100007B7C();
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

void sub_1000105C8(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_1000106A0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_1000045AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory failed with error %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove accessory successful", (uint8_t *)&v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getFindMyEnabledAccessories"));
    objc_msgSend(*(id *)(a1 + 32), "setAllAccessories:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeSetupAgent sharedInstance](FMDMagSafeSetupAgent, "sharedInstance"));
    objc_msgSend(v8, "launchSetupModuleWith:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void sub_100010990(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  if (v3)
  {
    v9 = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 1));
    objc_msgSend(v3, "setKeysUpdated:", v4);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010A7C;
    v6[3] = &unk_100025538;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "setPairingData:withCompletion:", v3, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100010A7C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_10000430C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "## keysUpdated for %@ with error = %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100010CC4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectedAccessory"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "launchFlowFuture"));

    if (v4)
    {
      v5 = sub_1000045AC();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "new accessory connected", v8, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "launchFlowFuture"));
      objc_msgSend(v7, "finishWithNoResult");

    }
  }
}

void sub_10001160C(uint64_t a1, void *a2, void *a3, void *a4)
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
  v10 = sub_100007B7C();
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
      v40 = sub_100007B7C();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_1000171A4(a1, v8, v41);

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
    v28 = sub_100007B7C();
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
        v42 = sub_100007B7C();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          sub_10001713C(v43, v44, v45, v46, v47, v48, v49, v50);

        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, 0);
        goto LABEL_30;
      }

    }
    v34 = *(void **)(a1 + 56);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(a1 + 48)));
    v51 = 0;
    objc_msgSend(v34, "moveItemAtURL:toURL:error:", v7, v35, &v51);
    v33 = v51;

    v36 = sub_100007B7C();
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
  v15 = sub_100007B7C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100017278((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);

  v23 = *(_QWORD *)(a1 + 64);
  v24 = 1;
LABEL_23:
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydevice.RemoteAsset"), v24, 0));
  (*(void (**)(uint64_t, _QWORD, id))(v23 + 16))(v23, 0, v25);
LABEL_24:

}

void sub_100011FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012010(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012020(uint64_t a1)
{

}

void sub_100012028(_QWORD *a1, void *a2, void *a3)
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

void sub_100012C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012C40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012C50(uint64_t a1)
{

}

void sub_100012C58(uint64_t a1, void *a2, void *a3)
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
  v8 = sub_100007B7C();
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

void sub_100013030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001305C(uint64_t a1, int a2, void *a3)
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
  v6 = sub_100007B7C();
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

void sub_1000134E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013510(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_10001379C(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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
            v19 = sub_100007B7C();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              sub_1000172DC((uint64_t)v15, (uint64_t)v17, v20);

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

void sub_100013BD4(id *a1)
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
  v5[2] = sub_100013CC8;
  v5[3] = &unk_100025778;
  objc_copyWeak(&v8, a1 + 7);
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v2, "setAccessoryUserName:forEndpoint:withReply:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void sub_100013CB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100013CC8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_100013FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_100013FBC(id *a1)
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
  v4[2] = sub_100014090;
  v4[3] = &unk_1000257F0;
  objc_copyWeak(&v6, a1 + 6);
  v5 = a1[5];
  objc_msgSend(v2, "provisionAccessoryForFindMy:withReply:", v3, v4);

  objc_destroyWeak(&v6);
}

void sub_10001407C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100014090(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_10001433C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_100014368(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_10001454C(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_10001476C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_100014940(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100014B18(uint64_t a1, void *a2, void *a3)
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
  v7 = sub_100007B7C();
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

void sub_100014D38(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_100014F0C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_1000150C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = sub_100007B7C();
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

void sub_1000162F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

size_t sub_100016348()
{
  __SecKey *v0;

  return SecKeyGetBlockSize(v0);
}

void sub_100016444()
{
  uint64_t v0;
  os_log_t v1;

  sub_100007B58(__stack_chk_guard);
  sub_100007B40();
  sub_100007B2C((void *)&_mh_execute_header, v0, v1, "Find My pairing check failed with error = %@ %ld");
  sub_100007B68();
}

void sub_1000164A4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100007B70((void *)&_mh_execute_header, a2, a3, "cancelErase api time out with error = %ld", (uint8_t *)&v3);
  sub_100007B68();
}

void sub_10001650C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100007B70((void *)&_mh_execute_header, a2, a3, "got unexpected lostModeInfo = %@", (uint8_t *)&v3);
  sub_100007B68();
}

void sub_100016574(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serialNumber"));
  v5 = 138412290;
  v6 = v3;
  sub_100007B70((void *)&_mh_execute_header, a2, v4, "failed to update pairing data for %@", (uint8_t *)&v5);

}

void sub_100016600(void *a1, void *a2, NSObject *a3)
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

void sub_1000166C0(void *a1, NSObject *a2)
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

void sub_100016810()
{
  uint64_t v0;
  os_log_t v1;

  sub_100007B58(__stack_chk_guard);
  sub_100007B40();
  sub_100007B2C((void *)&_mh_execute_header, v0, v1, "Find My setup failed with error = %@ %ld");
  sub_100007B68();
}

void sub_100016870(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid registerResponse = %@ %@", buf, 0x16u);

}

void sub_1000168DC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100007B58(__stack_chk_guard);
  sub_100007B40();
  sub_100007B2C((void *)&_mh_execute_header, v0, v1, "fetching pairingData failed with errror = %@ timeout error =  %ld");
  sub_100007B68();
}

void sub_10001693C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "invalid host received %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000169B0(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint8_t v5[24];

  v3 = objc_msgSend((id)objc_opt_class(a1), "defaultStorageLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000098D0();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "read magSafe data store from %@", v5, 0xCu);

}

void sub_100016A44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000098D0();
  sub_1000098C0((void *)&_mh_execute_header, v0, v1, "Could not read magSafe accessories list from disk %@", v2, v3, v4, v5, v6);
  sub_100007B68();
}

void sub_100016AA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a1, a3, "trying to udpate key roll time for non exisiting accessory %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_100016B0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A2B8((void *)&_mh_execute_header, a1, a3, "### setup module already running", a5, a6, a7, a8, 0);
  sub_10000A2C8();
}

void sub_100016B3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A2B8((void *)&_mh_execute_header, a1, a3, "### launching setupmodule", a5, a6, a7, a8, 0);
  sub_10000A2C8();
}

void sub_100016B6C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100016BE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no pattern in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_100016C48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no mask in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_100016CB0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to decode corrupted data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_100016D24(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "encoded data = %@", (uint8_t *)&v2, 0xCu);
}

void sub_100016D98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D934();
  sub_10000A2B8((void *)&_mh_execute_header, v0, v1, "Unable to encode obect", v2, v3, v4, v5, v6);
  sub_10000A2C8();
}

void sub_100016DC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D934();
  sub_10000A2B8((void *)&_mh_execute_header, v0, v1, "Unable to decode data", v2, v3, v4, v5, v6);
  sub_10000A2C8();
}

void sub_100016DF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D934();
  sub_10000A2B8((void *)&_mh_execute_header, v0, v1, "FMDRemoteUnlockPairingData: Unable to decode data", v2, v3, v4, v5, v6);
  sub_10000A2C8();
}

void sub_100016E1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DEE4((void *)&_mh_execute_header, a2, a3, "Hex strings should have an even number of digits (%@)", a5, a6, a7, a8, 2u);
}

void sub_100016E84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DEE4((void *)&_mh_execute_header, a2, a3, "MAC address should be 6 bytes (%@)", a5, a6, a7, a8, 2u);
}

void sub_100016EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000098D0();
  sub_1000098C0((void *)&_mh_execute_header, v0, v1, "Counld not get the device, timeout error %ld", v2, v3, v4, v5, v6);
  sub_100007B68();
}

void sub_100016F4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000098D0();
  sub_1000098C0((void *)&_mh_execute_header, v0, v1, "Accessory with id %@ not found", v2, v3, v4, v5, v6);
  sub_100007B68();
}

void sub_100016FAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A2B8((void *)&_mh_execute_header, a1, a3, "unable to create accessory", a5, a6, a7, a8, 0);
  sub_10000A2C8();
}

void sub_100016FDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A2B8((void *)&_mh_execute_header, a1, a3, "timeout while trying to get image", a5, a6, a7, a8, 0);
  sub_10000A2C8();
}

void sub_10001700C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000098D0();
  sub_1000098C0((void *)&_mh_execute_header, v0, v1, "pairingCheckForAccessory timeout with error %ld", v2, v3, v4, v5, v6);
  sub_100007B68();
}

void sub_10001706C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1000098D0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "checkAndHealPairingKeys completed with error %@", v1, 0xCu);
  sub_100007B68();
}

void sub_1000170D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "FMDRemoteAsset: Invalid cached asset removing failed with error = : %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_10001713C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a1, a3, "FMDRemoteAsset: createDirectoryAtPath failed with error = %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_1000171A4(uint64_t a1, void *a2, NSObject *a3)
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

void sub_100017278(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "FMDRemoteAsset: asset validation error %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_1000172DC(uint64_t a1, uint64_t a2, os_log_t log)
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

void sub_100017360(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "keys already setup", v1, 2u);
}

void sub_1000173A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "### decryption failed with error = %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_100017404(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A2B8((void *)&_mh_execute_header, a1, a3, "### algorithm is not supported", a5, a6, a7, a8, 0);
}

void sub_100017438(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000098C0((void *)&_mh_execute_header, a2, a3, "### error encoding message = %@", a5, a6, a7, a8, 2u);
  sub_100007B68();
}

void sub_10001749C(void *a1)
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
  sub_100016330();
  sub_1000162F0((void *)&_mh_execute_header, v4, v5, "### error = %@, %@", v6, v7, v8, v9, v10);

  sub_100016304();
}

void sub_100017530(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "length");
  sub_100016348();
  sub_100016314();
  sub_1000162F0((void *)&_mh_execute_header, v1, v2, "### message size two big %lu >= %lu", v3, v4, v5, v6, v7);
  sub_100016304();
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

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__cleanupDuplicationsOfAccessoryWithSerialNumber_currentAccessoryUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:");
}

id objc_msgSend__computehash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computehash:");
}

id objc_msgSend__launchRemoteViewWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchRemoteViewWithContext:");
}

id objc_msgSend__writeAccessoriesToDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeAccessoriesToDisk:");
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

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addAccessory_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAccessory:withCompletion:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_additionalInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalInfo");
}

id objc_msgSend_allAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allAccessories");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowedAccessoryTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedAccessoryTypes");
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

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:inDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
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

id objc_msgSend_caGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caGroup");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cache");
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

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkAndHealPairingKeys_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndHealPairingKeys:completion:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_conncetionStatusFor_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conncetionStatusFor:withCompletion:");
}

id objc_msgSend_connectdAccessoryWithSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectdAccessoryWithSerialNumber:");
}

id objc_msgSend_connectedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessory");
}

id objc_msgSend_connectionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInfo");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataArchiver");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
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

id objc_msgSend_dataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithHexString:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
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

id objc_msgSend_deviceDiscoveryId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDiscoveryId");
}

id objc_msgSend_deviceIDFromAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIDFromAddress:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
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

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithNoResult");
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareVersion");
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

id objc_msgSend_getAllAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllAccessories");
}

id objc_msgSend_getAuthNonceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAuthNonceWithCompletion:");
}

id objc_msgSend_getFindMyEnabledAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFindMyEnabledAccessories");
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

id objc_msgSend_infoAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoAvailable");
}

id objc_msgSend_initWithAccessoryType_style_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryType:style:type:");
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

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithPhysicalAccessory_fmEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhysicalAccessory:fmEnabled:");
}

id objc_msgSend_initWithRequestURL_mimeTypeProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequestURL:mimeTypeProvider:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
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

id objc_msgSend_isCachedAccessoryWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCachedAccessoryWithUUID:");
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

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
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

id objc_msgSend_launchCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchCompleted");
}

id objc_msgSend_launchFlowFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchFlowFuture");
}

id objc_msgSend_launchSetupModuleWith_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchSetupModuleWith:completion:");
}

id objc_msgSend_launchSetupModuleWithInfo2_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchSetupModuleWithInfo2:withCompletion:");
}

id objc_msgSend_launchSetupModuleWithInfo_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchSetupModuleWithInfo:withCompletion:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
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

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
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

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_preferredMIMEType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredMIMEType");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocol");
}

id objc_msgSend_provisionAccessoryForFindMy_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisionAccessoryForFindMy:withReply:");
}

id objc_msgSend_publicKeyFromPrivateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKeyFromPrivateKey:");
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

id objc_msgSend_remoteAlertHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAlertHandle");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeAccesoryWithSerialNumber_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccesoryWithSerialNumber:completion:");
}

id objc_msgSend_removeAccessoryWithId_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccessoryWithId:withCompletion:");
}

id objc_msgSend_removeAccessoryWithSerialNumber_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccessoryWithSerialNumber:withCompletion:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeKey:inDomain:");
}

id objc_msgSend_removeKeysWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeKeysWithCompletion:");
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

id objc_msgSend_setAccessoryProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryProvider:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryUserName_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryUserName:forEndpoint:withReply:");
}

id objc_msgSend_setAdditionalInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalInfo:");
}

id objc_msgSend_setAllAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllAccessories:");
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

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackedUp:");
}

id objc_msgSend_setBool_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:inDomain:");
}

id objc_msgSend_setCaAccessoryManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaAccessoryManager:");
}

id objc_msgSend_setCaGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaGroup:");
}

id objc_msgSend_setConnectedAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedAccessory:");
}

id objc_msgSend_setConnectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionInfo:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setCoreAccessoryUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoreAccessoryUID:");
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

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceDiscoveryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDiscoveryId:");
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

id objc_msgSend_setFindMyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFindMyEnabled:");
}

id objc_msgSend_setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareVersion:");
}

id objc_msgSend_setHasAttemptedLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasAttemptedLoad:");
}

id objc_msgSend_setHostProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostProxy:");
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

id objc_msgSend_setLaunchCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchCompleted:");
}

id objc_msgSend_setLaunchFlowFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchFlowFuture:");
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

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
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

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPhoneNumberForAccessoryId_phoneNumber_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumberForAccessoryId:phoneNumber:completion:");
}

id objc_msgSend_setProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocol:");
}

id objc_msgSend_setPublicNVMKeyValues_forEndpoint_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPublicNVMKeyValues:forEndpoint:withReply:");
}

id objc_msgSend_setRemoteAlertHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteAlertHandle:");
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

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setTimeStamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStamp:");
}

id objc_msgSend_setTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransportType:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
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

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signature");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
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

id objc_msgSend_styleFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleFor:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_testCrypto2_privateKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCrypto2:privateKey:");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_updateCompletedFor_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCompletedFor:withCompletion:");
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

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:completion:");
}

id objc_msgSend_writeLostModeInfo_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeLostModeInfo:version:");
}

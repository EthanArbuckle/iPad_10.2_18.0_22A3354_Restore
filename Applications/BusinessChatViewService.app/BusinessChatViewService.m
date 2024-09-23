id sub_100003D00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActionListViewWithAnimation");
}

id sub_100003D08(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLastActionItemWithAnimationIfNecessary");
}

void sub_100004A9C(id a1)
{
  BCCoreAnalytics *v1;
  void *v2;

  v1 = objc_alloc_init(BCCoreAnalytics);
  v2 = (void *)qword_100016860;
  qword_100016860 = (uint64_t)v1;

}

id sub_100004B54(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("bizIdCallToAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bizID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messageSubtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v2, v3));
  v10[0] = v4;
  v9[1] = CFSTR("chatSuggestLatencyInMiliSeconds");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v10[1] = v5;
  v9[2] = CFSTR("bizItemReturnedAfterAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

id sub_100004D64(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("bizIdCallToAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bizID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messageSubtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v2, v3));
  v10[0] = v4;
  v9[1] = CFSTR("bizIsVisible");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  v10[1] = v5;
  v9[2] = CFSTR("chatSuggestLatencyInMiliSeconds");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

id sub_100004E9C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v7[0] = CFSTR("bizFetchError");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code")));
  v8[0] = v2;
  v7[1] = CFSTR("bizIsVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  v8[1] = v3;
  v7[2] = CFSTR("chatSuggestLatencyInMiliSeconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

  return v5;
}

void sub_100005B1C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  char *v7;
  os_signpost_id_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dialRequestAction"));
  objc_msgSend(v2, "configureAlertControllerForDialRequestAction:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alertController"));
  if (v4)
  {
    v5 = sub_1000081C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (char *)objc_msgSend(*(id *)(a1 + 32), "tapId");
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = (os_signpost_id_t)v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v8, "RenderBusinessChatCallAction", "", buf, 2u);
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceState"));
    v10 = objc_msgSend(v9, "isLocked");

    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v11, "_dismiss");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presenter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alertController"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005C84;
      v14[3] = &unk_100010430;
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, v14);

    }
  }
}

void sub_100005C84(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "setChatSuggestUIPresented:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingActionItems"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceState"));
    v5 = objc_msgSend(v4, "isLocked");

    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "_dismiss");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionsViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingActionItems"));
      objc_msgSend(v7, "addActionItems:", v8);

      objc_msgSend(*(id *)(a1 + 32), "setPendingActionItems:", 0);
    }
  }
}

void sub_1000066C4(id *a1)
{
  void *v2;
  void *v3;
  NSDictionary *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;

  +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.MessageButtonTapped"), a1[4], 0, objc_msgSend(a1[5], "_latencyFromViewDidLoad"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "messagesOpenURL"));
  v4 = objc_opt_new(NSDictionary);
  v18 = 0;
  objc_msgSend(v2, "openURL:withOptions:error:", v3, v4, &v18);
  v5 = v18;

  v6 = sub_1000081C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "messagesOpenURL"));
    *(_DWORD *)buf = 136315394;
    v20 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Error opening Messages url: %@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "messagesOpenURL"));
    *(_DWORD *)buf = 136315394;
    v20 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Success open Messages url: %@", buf, 0x16u);
  }

LABEL_7:
  if (objc_msgSend(a1[6], "isValid"))
  {
    v10 = objc_alloc_init((Class)BSMutableSettings);
    objc_msgSend(v10, "setObject:forSetting:", CFSTR("Message"), 10);
    v11 = a1[6];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v10));
    objc_msgSend(v11, "sendResponse:", v12);

    v13 = sub_1000081C4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via XPC Action to place a call", buf, 0xCu);
    }

    objc_msgSend(a1[5], "_dismiss");
  }
  else
  {
    v15 = sub_1000081C4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = a1[6];
      *(_DWORD *)buf = 136315394;
      v20 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
      v21 = 2112;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s invalid dialrequest message action : %@", buf, 0x16u);
    }

    objc_msgSend(a1[5], "_dismiss");
  }

}

void sub_100006B9C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_latencyFromViewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bizItem"));
  +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.CallButtonTapped"), v3, 0, objc_msgSend(*(id *)(a1 + 32), "_latencyFromViewDidLoad"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoreAnalytics sharedInstance](BCCoreAnalytics, "sharedInstance"));
  objc_msgSend(v4, "setLastActionTaken:withLatency:", CFSTR("com.apple.BusinessChatViewService.CallButtonTapped"), v2);

  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = objc_msgSend(v5, "isValid");
    v7 = sub_1000081C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via XPC Action to place a call", buf, 0xCu);
      }

      v8 = objc_alloc_init((Class)BSMutableSettings);
      -[NSObject setObject:forSetting:](v8, "setObject:forSetting:", CFSTR("Call"), 10);
      v10 = *(void **)(a1 + 40);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v8));
      objc_msgSend(v10, "sendResponse:", v11);

    }
    else if (v9)
    {
      v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v24 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
      v25 = 2112;
      v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s invalid dialrequest call action : %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }
  else
  {
    v12 = sub_1000081C4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via launch services to place a call", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tel://%@?handleType=phoneNumber"), *(_QWORD *)(a1 + 48)));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v17 = objc_opt_new(NSDictionary);
    v22 = 0;
    objc_msgSend(v16, "openURL:withOptions:error:", v15, v17, &v22);
    v18 = v22;

    if (v18)
    {
      v19 = sub_1000081C4();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
        v25 = 2112;
        v26 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Error opening Telephony url: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_dismiss");

  }
}

id sub_100006FB0(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
  {
    v2 = objc_alloc_init((Class)BSMutableSettings);
    objc_msgSend(v2, "setObject:forSetting:", CFSTR("Cancel"), 10);
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v2));
    objc_msgSend(v3, "sendResponse:", v4);

    v5 = sub_1000081C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[BCChatSuggestRemoteViewController defaultAlertActionForDialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s sendResponse", (uint8_t *)&v11, 0xCu);
    }

    v7 = objc_msgSend(*(id *)(a1 + 40), "_latencyFromViewDidLoad");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bizItem"));
    +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.ChatSuggestDismissed"), v8, 0, objc_msgSend(*(id *)(a1 + 40), "_latencyFromViewDidLoad"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoreAnalytics sharedInstance](BCCoreAnalytics, "sharedInstance"));
    objc_msgSend(v9, "setLastActionTaken:withLatency:", CFSTR("com.apple.BusinessChatViewService.ChatSuggestDismissed"), v7);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_dismiss");
}

void sub_100007604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007628(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  os_signpost_id_t v17;
  id v18;
  NSObject *v19;
  char *v20;
  os_signpost_id_t v21;
  id v22;
  NSObject *v23;
  char *v24;
  os_signpost_id_t v25;
  id v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = sub_1000081C4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[BCChatSuggestRemoteViewController fetchBizInfoForDialRequestAction:]_block_invoke";
    v36 = 2112;
    v37 = v7;
    v38 = 1024;
    v39 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Fetch returned BizItem %@ Visible:%d", buf, 0x1Cu);
  }

  if (v8)
  {
    v12 = sub_1000081C4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[BCChatSuggestRemoteViewController fetchBizInfoForDialRequestAction:]_block_invoke";
      v36 = 2112;
      v37 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Error fetching biz item. Error %@", buf, 0x16u);
    }

    +[BCCoreAnalytics logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:](BCCoreAnalytics, "logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:", v7, v8, a3, objc_msgSend(WeakRetained, "_latencyFromViewDidLoad"));
    v14 = sub_1000081C4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (char *)objc_msgSend(WeakRetained, "tapId");
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = (os_signpost_id_t)v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v17, "RenderBusinessChatUI", "", buf, 2u);
      }
    }

    v18 = sub_1000081C4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (char *)objc_msgSend(WeakRetained, "tapId");
    if ((unint64_t)(v20 - 1) > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_22;
    v21 = (os_signpost_id_t)v20;
    if (!os_signpost_enabled(v19))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    goto LABEL_21;
  }
  if (v7 && (_DWORD)a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007A4C;
    block[3] = &unk_100010508;
    block[4] = WeakRetained;
    v32 = v7;
    v33 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_23;
  }
  +[BCCoreAnalytics logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:](BCCoreAnalytics, "logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:", v7, 0, a3, objc_msgSend(WeakRetained, "_latencyFromViewDidLoad"));
  v22 = sub_1000081C4();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = (char *)objc_msgSend(WeakRetained, "tapId");
  if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v25 = (os_signpost_id_t)v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v25, "RenderBusinessChatUI", "", buf, 2u);
    }
  }

  v26 = sub_1000081C4();
  v19 = objc_claimAutoreleasedReturnValue(v26);
  v27 = (char *)objc_msgSend(WeakRetained, "tapId");
  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = (os_signpost_id_t)v27;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
LABEL_21:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, v21, "ChatSuggestEnd", "", buf, 2u);
    }
  }
LABEL_22:

LABEL_23:
  if (objc_msgSend(WeakRetained, "chatSuggestRemoteViewControllerDismissed"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoreAnalytics sharedInstance](BCCoreAnalytics, "sharedInstance"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastActionTaken"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoreAnalytics sharedInstance](BCCoreAnalytics, "sharedInstance"));
    +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", v29, v7, 1, objc_msgSend(v30, "lastActionLatency"));

    objc_msgSend(WeakRetained, "_logPhoneNumberDisplayedIfNecessary");
  }

}

id sub_100007A4C(uint64_t a1)
{
  id result;

  objc_msgSend(*(id *)(a1 + 32), "setBizItem:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "chatSuggestRemoteViewControllerDismissed");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "configureAlertControllerForBusinessItem:dialRequestAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

id sub_1000081C4()
{
  if (qword_100016890 != -1)
    dispatch_once(&qword_100016890, &stru_100010550);
  return (id)qword_100016888;
}

void sub_100008204(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.BusinessServices.businesschatviewservice", "Common");
  v2 = (void *)qword_100016888;
  qword_100016888 = (uint64_t)v1;

}

uint64_t sub_10000825C()
{
  uint64_t (*v0)(_QWORD);
  char *v2;
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (uint64_t (*)(_QWORD))off_100016878;
  v8 = off_100016878;
  if (!off_100016878)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100008328;
    v4[3] = &unk_100010578;
    v4[4] = &v5;
    sub_100008328((uint64_t)v4);
    v0 = (uint64_t (*)(_QWORD))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v2 = dlerror();
    v3 = (_Unwind_Exception *)abort_report_np("%s", v2);
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  return v0(0);
}

void *sub_100008328(uint64_t a1)
{
  void *v2;
  char *v3;
  void *result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_100016880)
  {
    v6 = off_100010598;
    v7 = 0;
    qword_100016880 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_100016880;
    if (qword_100016880)
    {
      if (!v5)
        goto LABEL_5;
    }
    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100016880;
LABEL_5:
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_100016878 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(AppDelegate, v5);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  objc_autoreleasePoolPop(v4);
  return v9;
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__computeMaxHeights(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeMaxHeights");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__handleSizeClassDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSizeClassDidChange");
}

id objc_msgSend__latencyFromViewDidLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_latencyFromViewDidLoad");
}

id objc_msgSend__logPhoneNumberDisplayedIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logPhoneNumberDisplayedIfNecessary");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__replaceActionItem_atIndex_reloadRowImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replaceActionItem:atIndex:reloadRowImmediately:");
}

id objc_msgSend__setShouldAlignToKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldAlignToKeyboard:");
}

id objc_msgSend__sizeAndLoadTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sizeAndLoadTable");
}

id objc_msgSend__systemBlueColor2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemBlueColor2");
}

id objc_msgSend_actionItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionItems");
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionType");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_actionsViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionsViewController");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addActionItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addActionItems:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertController");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bizID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bizID");
}

id objc_msgSend_bizItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bizItem");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_brandedHeaderDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brandedHeaderDelegate");
}

id objc_msgSend_businessItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "businessItem");
}

id objc_msgSend_callAlertActionForBizItem_dialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callAlertActionForBizItem:dialRequestAction:");
}

id objc_msgSend_callSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callSubtitle");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cellSeparatorHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellSeparatorHeight");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_chatSuggestRemoteViewControllerDismissed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatSuggestRemoteViewControllerDismissed");
}

id objc_msgSend_chatSuggestUIPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatSuggestUIPresented");
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classBundle");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorNamed:");
}

id objc_msgSend_configureAlertControllerForDialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureAlertControllerForDialRequestAction:");
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

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_defaultAlertActionForDialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAlertActionForDialRequestAction:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_deviceState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceState");
}

id objc_msgSend_dialRequestAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialRequestAction");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fetchBizInfoForDialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchBizInfoForDialRequestAction:");
}

id objc_msgSend_fetchBusinessItemForPhoneNumber_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchBusinessItemForPhoneNumber:completion:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_hadBizItemWhenPhoneNumberUIPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hadBizItemWhenPhoneNumberUIPresented");
}

id objc_msgSend_handleWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleWithDictionaryRepresentation:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_headerActionItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerActionItem");
}

id objc_msgSend_headerAlertActionForBizItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerAlertActionForBizItem:");
}

id objc_msgSend_headerImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerImageView");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_heightForActionItem_forWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightForActionItem:forWidth:");
}

id objc_msgSend_heightForBusinessItem_forWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightForBusinessItem:forWidth:");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icon");
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconName");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithActionItems_brandedHeaderDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActionItems:brandedHeaderDelegate:");
}

id objc_msgSend_initWithDeviceState_presenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceState:presenter:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTitle_subTitle_iconName_actionType_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:subTitle:iconName:actionType:handler:");
}

id objc_msgSend_initialTableLoadCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialTableLoadCompleted");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_isAvailableForCalling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAvailableForCalling");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isVerified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVerified");
}

id objc_msgSend_itemsToAdd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemsToAdd");
}

id objc_msgSend_lastActionItemPendingUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActionItemPendingUpdate");
}

id objc_msgSend_lastActionLatency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActionLatency");
}

id objc_msgSend_lastActionTaken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActionTaken");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadContentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadContentView");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logEventForChatSuggestDidNotAppearForBizItem_error_isVisible_latency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:");
}

id objc_msgSend_logEventForView_bizItem_bizItemReturnedAfterAction_latency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:");
}

id objc_msgSend_mainImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainImageView");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeBrandedHeaderViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeBrandedHeaderViewController");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_maxActionCellHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxActionCellHeight");
}

id objc_msgSend_maxHeaderCellHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxHeaderCellHeight");
}

id objc_msgSend_messageAlertActionForBizItem_dialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageAlertActionForBizItem:dialRequestAction:");
}

id objc_msgSend_messageSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageSubtitle");
}

id objc_msgSend_messageTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageTitle");
}

id objc_msgSend_messagesOpenURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagesOpenURL");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_pendingActionItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingActionItems");
}

id objc_msgSend_phoneNumberDisplayLogged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumberDisplayLogged");
}

id objc_msgSend_phoneNumberUIPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumberUIPresented");
}

id objc_msgSend_phoneNumberUIPresentedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumberUIPresentedTime");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenter");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTraitChanges:withAction:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_replaceLastActionItem_reloadRowImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceLastActionItem:reloadRowImmediately:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithInfo:");
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reuseIdentifier");
}

id objc_msgSend_reuseIdentifierForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reuseIdentifierForItem:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scaledFontForFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledFontForFont:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screen");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_setActionItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionItems:");
}

id objc_msgSend_setActionsViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionsViewController:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAlertController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlertController:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBizItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBizItem:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setBusinessItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBusinessItem:");
}

id objc_msgSend_setChatSuggestUIPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChatSuggestUIPresented:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDialRequestAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDialRequestAction:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setHadBizItemWhenPhoneNumberUIPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHadBizItemWhenPhoneNumberUIPresented:");
}

id objc_msgSend_setHeaderActionItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderActionItem:");
}

id objc_msgSend_setHeaderImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderImageView:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInitialTableLoadCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialTableLoadCompleted:");
}

id objc_msgSend_setItemsToAdd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemsToAdd:");
}

id objc_msgSend_setLastActionItemPendingUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastActionItemPendingUpdate:");
}

id objc_msgSend_setLastActionTaken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastActionTaken:");
}

id objc_msgSend_setLastActionTaken_withLatency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastActionTaken:withLatency:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forSetting:");
}

id objc_msgSend_setOrientationChangedEventsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationChangedEventsEnabled:");
}

id objc_msgSend_setPendingActionItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingActionItems:");
}

id objc_msgSend_setPhoneNumberDisplayLogged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumberDisplayLogged:");
}

id objc_msgSend_setPhoneNumberUIPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumberUIPresented:");
}

id objc_msgSend_setPhoneNumberUIPresentedTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumberUIPresentedTime:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredStyle:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setTapId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapId:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTraitChangeRegistration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTraitChangeRegistration:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setViewControllerDidLoadTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerDidLoadTime:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subTitle");
}

id objc_msgSend_subTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subTitleLabel");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_tapId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapId");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitChangeRegistration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitChangeRegistration");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unregisterForTraitChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForTraitChanges:");
}

id objc_msgSend_updateContentIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContentIfNecessary");
}

id objc_msgSend_updateContentViewUsingBusinessItem_brandedHeaderDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContentViewUsingBusinessItem:brandedHeaderDelegate:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerDidLoadTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerDidLoadTime");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

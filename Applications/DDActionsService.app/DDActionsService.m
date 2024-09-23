void sub_100005C5C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void sub_100005CB0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

_QWORD *sub_100005CDC(_QWORD *a1)
{
  _QWORD *result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  result = a1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 24) & 1;
  return result;
}

_BYTE *sub_100005D3C(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100005D58(uint64_t a1)
{
  id location;
  dispatch_once_t *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  if ((*(_BYTE *)(a1 + 48) & 1) != 0 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v3 = (dispatch_once_t *)&unk_100028728;
    location = 0;
    objc_storeStrong(&location, &stru_100020600);
    if (*v3 != -1)
      dispatch_once(v3, location);
    objc_storeStrong(&location, 0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
}

void sub_100005E38(id a1)
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v3[7];
  char v4;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = &_os_log_default;
  v4 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    type = v4;
    sub_100005D3C(v3);
    _os_log_error_impl((void *)&_mh_execute_header, log, type, "Couldn't fetch the bag, network calls will be disabled", v3, 2u);
  }
  objc_storeStrong(location, 0);
}

intptr_t sub_100006058(intptr_t result)
{
  intptr_t v1;

  v1 = result;
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 24) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(result + 32) + 16), *(id *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void sub_100008048(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  char *v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = (char *)objc_msgSend(location[0], "range");
  if (v2 == 3)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "stringByReplacingCharactersInRange:withString:", v7 + 1, 1, CFSTR("״"));
    v4 = *(_QWORD *)(a1[4] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  objc_storeStrong(location, 0);
}

void sub_100008134(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.lookup.dictionary", 0);
  v2 = (void *)qword_100028730;
  qword_100028730 = (uint64_t)v1;

}

void sub_10000817C(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  NSArray *v5;
  id v6;
  id v7[3];
  id v8;

  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = objc_msgSend(objc_alloc((Class)SFStartLocalSearchFeedback), "initWithInput:triggerEvent:indexType:queryId:", *(_QWORD *)(a1 + 32), 11, 6, *(_QWORD *)(a1 + 56));
  v6 = +[DDLookupQuery dictionarySectionForString:queryId:](DDLookupQuery, "dictionarySectionForString:queryId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v4 = 0;
  if (v6)
  {
    v8 = v6;
    v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1);
    v4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), &__NSArray0__struct);
  }
  if ((v4 & 1) != 0)

  v3 = objc_msgSend(objc_alloc((Class)SFEndLocalSearchFeedback), "initWithStartSearch:", v7[0]);
  v2 = objc_msgSend(*(id *)(a1 + 40), "feedbackListener");
  objc_msgSend(v2, "didStartSearch:", v7[0]);
  objc_msgSend(v2, "didEndSearch:", v3);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
}

void sub_10000837C(uint64_t a1)
{
  NSObject *group;
  dispatch_queue_t queue;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11[6];

  v11[5] = (id)a1;
  v11[4] = (id)a1;
  group = *(NSObject **)(a1 + 32);
  queue = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000084BC;
  v8 = &unk_1000206E8;
  v11[1] = *(id *)(a1 + 64);
  v11[2] = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11[3] = *(id *)(a1 + 80);
  v11[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void sub_1000084BC(uint64_t a1)
{
  BOOL v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v8;
  id v9;
  id v10;
  NSError *v11;
  char v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v17 = a1;
  v16 = a1;
  v1 = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) & 1) != 0;
  v14 = 0;
  v12 = 0;
  v8 = 0;
  if (!v1)
  {
    v8 = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", 0);
      v14 = 1;
      v13 = objc_msgSend(v15, "results");
      v12 = 1;
      v8 = objc_msgSend(v13, "count") != 0;
    }
  }
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.datadetectors.ui"), 1);
    v2 = objc_alloc((Class)SFErrorFeedback);
    v10 = objc_msgSend(v2, "initWithError:", v11);
    v3 = objc_msgSend(*(id *)(a1 + 32), "feedbackListener");
    objc_msgSend(v3, "didErrorOccur:", v10);

    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v6 = +[DDLookupQuery footerSectionForString:queryId:](DDLookupQuery, "footerSectionForString:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    v9 = objc_msgSend(v5, "_rankFeedbackWithLocalSections:remoteSections:footerSection:", v4, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
}

void sub_100008778(uint64_t a1, void *a2, void *a3)
{
  id v3;
  NSObject *group;
  dispatch_queue_t queue;
  id v6;
  void **v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18[4];
  id v19[2];
  id v20;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v20 = 0;
  objc_storeStrong(&v20, a3);
  v19[1] = (id)a1;
  if (v20)
  {
    v3 = objc_alloc((Class)SFErrorFeedback);
    v19[0] = objc_msgSend(v3, "initWithError:", v20);
    v6 = objc_msgSend(*(id *)(a1 + 32), "feedbackListener");
    objc_msgSend(v6, "didErrorOccur:", v19[0]);

    objc_storeStrong(v19, 0);
  }
  group = *(NSObject **)(a1 + 40);
  queue = &_dispatch_main_q;
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1000089C0;
  v13 = &unk_100020738;
  v18[1] = *(id *)(a1 + 64);
  v14 = v20;
  v18[2] = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 32);
  v16 = location[0];
  v17 = *(id *)(a1 + 48);
  v18[3] = *(id *)(a1 + 80);
  v18[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v9);

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void sub_1000089C0(_QWORD *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
    v8[0] = 0;
    if (!a1[4] || objc_msgSend(*(id *)(*(_QWORD *)(a1[10] + 8) + 40), "count"))
    {
      v5 = (void *)a1[5];
      v3 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
      v4 = a1[6];
      v6 = +[DDLookupQuery footerSectionForString:queryId:](DDLookupQuery, "footerSectionForString:queryId:", a1[7], a1[11]);
      v1 = objc_msgSend(v5, "_rankFeedbackWithLocalSections:remoteSections:footerSection:", v3, v4);
      v2 = v8[0];
      v8[0] = v1;

    }
    (*(void (**)(void))(a1[8] + 16))();
    objc_storeStrong(v8, 0);
  }
}

void sub_100008B10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  NSObject *group;
  dispatch_queue_t queue;
  id v7;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20[4];
  id v21[2];
  id v22;
  id v23;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v23 = 0;
  objc_storeStrong(&v23, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = (id)a1;
  if (v22)
  {
    v4 = objc_alloc((Class)SFErrorFeedback);
    v21[0] = objc_msgSend(v4, "initWithError:", v22);
    v7 = objc_msgSend(*(id *)(a1 + 32), "feedbackListener");
    objc_msgSend(v7, "didErrorOccur:", v21[0]);

    objc_storeStrong(v21, 0);
  }
  group = *(NSObject **)(a1 + 40);
  queue = &_dispatch_main_q;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_100008D78;
  v15 = &unk_100020738;
  v20[1] = *(id *)(a1 + 64);
  v16 = v22;
  v20[2] = *(id *)(a1 + 72);
  v17 = *(id *)(a1 + 32);
  v18 = v23;
  v19 = *(id *)(a1 + 48);
  v20[3] = *(id *)(a1 + 80);
  v20[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v11);

  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void sub_100008D78(uint64_t a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v8[3];

  v8[2] = (id)a1;
  v8[1] = (id)a1;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v8[0] = 0;
    if (!*(_QWORD *)(a1 + 32) || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
    {
      v4 = *(void **)(a1 + 40);
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v6 = objc_msgSend(*(id *)(a1 + 48), "sections");
      v5 = +[DDLookupQuery footerSectionForString:queryId:](DDLookupQuery, "footerSectionForString:queryId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
      v1 = objc_msgSend(v4, "_rankFeedbackWithLocalSections:remoteSections:footerSection:", v3, v6);
      v2 = v8[0];
      v8[0] = v1;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_storeStrong(v8, 0);
  }
}

void sub_100008EE4(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  dispatch_queue_t queue;
  void **v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[3];

  v16[2] = (id)a1;
  v16[1] = (id)a1;
  v16[0] = &__NSArray0__struct;
  v15 = +[DDLookupQuery dictionarySectionForString:queryId:](DDLookupQuery, "dictionarySectionForString:queryId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (v15)
  {
    v1 = objc_msgSend(v16[0], "arrayByAddingObject:", v15);
    v2 = v16[0];
    v16[0] = v1;

  }
  v14 = +[DDLookupQuery footerSectionForString:queryId:](DDLookupQuery, "footerSectionForString:queryId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (v15 && v14)
  {
    v3 = objc_msgSend(v16[0], "arrayByAddingObject:", v14);
    v4 = v16[0];
    v16[0] = v3;

  }
  queue = &_dispatch_main_q;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1000090E4;
  v11 = &unk_1000207B0;
  v13 = *(id *)(a1 + 40);
  v12 = v16[0];
  dispatch_async(queue, &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

uint64_t sub_1000090E4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100009B04(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "updateForCurrentTraitCollection");
  objc_storeStrong(location, 0);
}

void sub_10000A4E0(id *a1, char a2, id obj)
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  dispatch_queue_t queue;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  uint8_t v12[7];
  char v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[2];
  id location;
  char v27;
  id *v28;

  v28 = a1;
  v27 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v25[1] = a1;
  if ((v27 & 1) == 0 || location)
  {
    v14 = &_os_log_default;
    v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = v14;
      type = v13;
      sub_100005D3C(v12);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Event Store access for DDEventAddViewController not granted.", v12, 2u);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v25[0] = objc_msgSend(a1[4], "context");
    v9 = objc_msgSend(v25[0], "objectForKeyedSubscript:", kDataDetectorsIsAccountManagedKey);
    v10 = (objc_msgSend(v9, "BOOLValue") & 1) != 1;

    if (!v10)
    {
      v7 = a1[5];
      v8 = objc_msgSend(a1[6], "_hostApplicationBundleIdentifier");
      objc_msgSend(v7, "setSourceAccountManagement:withBundleID:", 2);

    }
    v5 = objc_msgSend(a1[4], "context");
    v24 = objc_msgSend(v5, "objectForKeyedSubscript:", kDataDetectorsICSKey);

    queue = &_dispatch_main_q;
    v15 = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_10000A808;
    v19 = &unk_100020830;
    v20 = v24;
    v21 = a1[5];
    v22 = a1[6];
    v23 = a1[4];
    dispatch_async(queue, &v15);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_10000A808(uint64_t a1)
{
  id v1;
  NSObject *log;
  os_log_type_t type;
  id v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  char v12;
  id v13;
  id v14[3];
  uint8_t v15[24];

  v14[2] = (id)a1;
  v14[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = objc_alloc((Class)EKICSPreviewController);
    v8 = objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v14[0] = objc_msgSend(v7, "initWithData:eventStore:");

    objc_msgSend(v14[0], "setAllowsImport:", 1);
    objc_msgSend(v14[0], "setPreviewDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v14[0], "setCancelButtonWithTarget:action:", *(_QWORD *)(a1 + 48), "doneWithAddingEvent");
    v9 = objc_msgSend(v14[0], "viewController");
    objc_msgSend(v9, "setModalInPresentation:", 1);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 24), v14[0]);
    objc_msgSend(*(id *)(a1 + 48), "setModalInPresentation:", 1);
    objc_storeStrong(v14, 0);
  }
  v5 = *(id **)(a1 + 48);
  v6 = objc_msgSend(v5[3], "viewController");
  objc_msgSend(v5, "pushViewController:animated:");

  objc_msgSend(*(id *)(a1 + 48), "setAction:", *(_QWORD *)(a1 + 56));
  v13 = &_os_log_default;
  v12 = 2;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
  {
    log = v13;
    type = v12;
    v4 = objc_msgSend(*(id *)(a1 + 48), "_remoteViewControllerProxy");
    v11 = v4;
    sub_10000AB04((uint64_t)v15, (uint64_t)v11);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Telling proxy %@ that the remote view controller is ready", v15, 0xCu);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_msgSend(*(id *)(a1 + 48), "setCancellable:", 0);
  v1 = objc_msgSend(*(id *)(a1 + 48), "_remoteViewControllerProxy");
  objc_msgSend(v1, "viewControllerReady");

}

uint64_t sub_10000AB04(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_10000ADB4(id *a1, void *a2)
{
  BOOL v3;
  UIApplication *v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = objc_msgSend(a1[4], "verticalSizeClass") == (id)1;
  objc_msgSend(a1[5], "transitionDuration");
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v3;
  NSString *v5;
  void *v6;
  int v9;

  v6 = objc_autoreleasePoolPush();
  +[CLLocationManager setDefaultEffectiveBundleIdentifier:](CLLocationManager, "setDefaultEffectiveBundleIdentifier:", CFSTR("com.apple.Maps"));
  v3 = (objc_class *)objc_opt_class(DDASAppDelegate);
  v5 = NSStringFromClass(v3);
  v9 = UIApplicationMain(argc, (char **)argv, 0, v5);

  objc_autoreleasePoolPop(v6);
  return v9;
}

void sub_10000B3AC(uint64_t a1)
{
  id v1;
  id v3;

  v1 = objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "setAlpha:", 1.0);

  v3 = objc_msgSend(*(id *)(a1 + 40), "view");
  objc_msgSend(v3, "setAlpha:", 0.0);

}

id sub_10000B430(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", (objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1) & 1);
}

void sub_10000B824(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  *(_QWORD *)(v12 - 88) = a1;
  *(_DWORD *)(v12 - 92) = a2;
  objc_destroyWeak((id *)(v12 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 88));
}

void sub_10000B864(uint64_t a1)
{
  double v1;
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  id v10;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  id v17[3];

  v17[2] = (id)a1;
  v17[1] = (id)a1;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_BYTE *)(a1 + 96);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 72);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "DDViewScale");
    v9 = v1;
    v3 = *(_QWORD *)(a1 + 56);
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_10000BA04;
    v16 = &unk_1000208F8;
    objc_copyWeak(v17, (id *)(a1 + 64));
    objc_msgSend(v4, "sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:", v5, v6 & 1, v7, v8, 1, 0, v9, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v3, &v12);

    objc_destroyWeak(v17);
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v10, "showError:animated:", 0, 0);

  }
}

void sub_10000BA04(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "addSections:error:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void sub_10000BB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  uint64_t v20;

  objc_destroyWeak(&a20);
  objc_destroyWeak((id *)(v20 - 32));
  _Unwind_Resume(a1);
}

void sub_10000BBBC(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_remoteViewControllerProxy");
  objc_msgSend(v2, "performClientQueryWithServerAccessPermitted:localSearchPermitted:", *(_BYTE *)(a1 + 40) & 1, 1);

}

void sub_10000BFF4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 80) = a1;
  *(_DWORD *)(v11 - 84) = a2;
  objc_destroyWeak((id *)(v11 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 80));
}

void sub_10000C034(uint64_t a1)
{
  double v1;
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  id v17[3];

  v17[2] = (id)a1;
  v17[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 64) = 1;
    v3 = *(void **)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 32), "coreResult");
    v5 = *(_BYTE *)(a1 + 88);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 80);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "DDViewScale");
    v8 = v1;
    v9 = *(_QWORD *)(a1 + 64);
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_10000C1CC;
    v16 = &unk_1000208F8;
    objc_copyWeak(v17, (id *)(a1 + 72));
    objc_msgSend(v3, "sectionsForResult:useNetwork:clientId:queryId:scale:proxy:handler:", v4, v5 & 1, v6, v7, v9, &v12, v8);

    objc_destroyWeak(v17);
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v10, "showError:animated:", 0, 0);

  }
}

void sub_10000C1CC(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "addSections:error:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

id sub_10000CC98(id *a1)
{
  BOOL v2;
  unsigned __int8 v3;
  char v4;
  os_log_t oslog;
  char v7;
  id v8;
  id *v9;
  id *v10;
  uint8_t v11[24];

  v10 = a1;
  v9 = a1;
  if (a1[4] && !objc_msgSend(a1[5], "count"))
    return objc_msgSend(a1[6], "showError:animated:", a1[4], 0);
  v2 = a1[4] == 0;
  v7 = 0;
  v4 = 0;
  if (!v2)
  {
    v3 = 0;
    if (a1[4])
    {
      v3 = 0;
      if (objc_msgSend(a1[4], "code") == (id)-1009)
      {
        v8 = objc_msgSend(a1[4], "domain");
        v7 = 1;
        v3 = objc_msgSend(v8, "isEqualToString:", NSURLErrorDomain);
      }
    }
    v4 = v3 ^ 1;
  }
  if ((v7 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_10000AB04((uint64_t)v11, (uint64_t)a1[4]);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "We have dictionary results, ignoring Parsec error: %@", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  return objc_msgSend(a1[6], "setSections:", a1[5]);
}

void sub_10000DE5C(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "view");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_10000EC0C(uint64_t a1)
{
  double v1;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  uint8_t v9[7];
  char v10;
  id v11;
  uint8_t v12[7];
  char v13;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "timeIntervalSinceNow"), v1 > -1.0))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      location[0] = &_os_log_default;
      v13 = 2;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
      {
        log = location[0];
        type = v13;
        sub_100005D3C(v12);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Ignoring viewDisappearFeedback, probably pop from orb", v12, 2u);
      }
      objc_storeStrong(location, 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setQueryBlock:", 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "feedbackListener");
      objc_msgSend(v5, "searchViewDidDisappear:", *(_QWORD *)(a1 + 40));

      v11 = &_os_log_default;
      v10 = 2;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
      {
        v3 = v11;
        v4 = v10;
        sub_100005D3C(v9);
        _os_log_debug_impl((void *)&_mh_execute_header, v3, v4, "Sending delayed viewDisappearFeedback", v9, 2u);
      }
      objc_storeStrong(&v11, 0);
    }
  }
  return objc_msgSend(UIApp, "endBackgroundTask:", *(_QWORD *)(a1 + 48));
}

void sub_10000EFB4(uint64_t a1, char a2)
{
  dispatch_queue_t queue;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = a1;
  v12 = a2 & 1;
  v11 = a1;
  queue = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10000F088;
  v8 = &unk_1000209E8;
  v9 = *(id *)(a1 + 32);
  v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
}

void sub_10000F088(uint64_t a1)
{
  UIApplication *v2;
  char v3;

  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "verticalSizeClass") != (id)1)
    v3 = *(_BYTE *)(a1 + 40);
  -[UIApplication setStatusBarHidden:duration:](v2, "setStatusBarHidden:duration:", v3 & 1, 0.0);

}

uint64_t sub_10000FA54(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  v1 = objc_opt_class(DDParsecNoDataViewController);
  result = objc_opt_isKindOfClass(v4, v1);
  if ((result & 1) != 0)
    return (uint64_t)objc_msgSend(*(id *)(a1 + 32), "updateStyle");
  return result;
}

void sub_100010550(_QWORD *a1, void *a2)
{
  uint64_t v2;
  UIImage *v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    v2 = a1[4];
    v3 = +[UIImage imageWithData:](UIImage, "imageWithData:", location[0]);
    (*(void (**)(void))(v2 + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void sub_100010C74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *log;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSAssertionHandler *v14;
  id v16;
  os_log_type_t type;
  os_log_t oslog;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24[3];
  uint8_t v25[24];

  v24[2] = (id)a1;
  v24[1] = (id)a1;
  v24[0] = -[DDReminderCreationController initWithAction:delegate:]([DDReminderCreationController alloc], "initWithAction:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v23 = objc_msgSend(objc_alloc((Class)REMReminderCreationViewController), "initWithDelegate:", v24[0]);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), v24[0]);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v23);
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v14 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("DDReminderViewController.m"), 63, CFSTR("-[DDReminderViewController prepareForAction:] should be called from the main thread!"));

  }
  objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", v23);
  v10 = objc_msgSend(*(id *)(a1 + 40), "view");
  v9 = objc_msgSend(v23, "view");
  objc_msgSend(v10, "addSubview:");

  objc_msgSend(v23, "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  v12 = objc_msgSend(*(id *)(a1 + 40), "view");
  objc_msgSend(v12, "bounds");
  *(_QWORD *)&v21 = v1;
  *((_QWORD *)&v21 + 1) = v2;
  *(_QWORD *)&v22 = v3;
  *((_QWORD *)&v22 + 1) = v4;
  v11 = objc_msgSend(v23, "view");
  v19 = v21;
  v20 = v22;
  objc_msgSend(v11, "setFrame:", v21, v22);

  v13 = objc_msgSend(v23, "view");
  objc_msgSend(v13, "setAutoresizingMask:", 18);

  oslog = &_os_log_default;
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    v7 = type;
    v8 = objc_msgSend(*(id *)(a1 + 40), "_remoteViewControllerProxy");
    v16 = v8;
    sub_10000AB04((uint64_t)v25, (uint64_t)v16);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v7, "Telling proxy %@ that the remote view controller is ready", v25, 0xCu);

    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(*(id *)(a1 + 40), "setCancellable:", 0);
  v5 = objc_msgSend(*(id *)(a1 + 40), "_remoteViewControllerProxy");
  objc_msgSend(v5, "viewControllerReady");

  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
}

uint64_t sub_1000117E0(id obj)
{
  char v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = sub_100011F04(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

void sub_100011838(uint64_t a1, void *a2, void *a3)
{
  NSObject *queue;
  os_log_t oslog;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  id v16;
  id location[2];
  uint8_t v18[24];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16 = 0;
  objc_storeStrong(&v16, a3);
  v15[1] = (id)a1;
  v15[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v15[0])
  {
    if (v16 || !objc_msgSend(location[0], "length"))
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      if (v16)
      {
        oslog = &_os_log_default;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10000AB04((uint64_t)v18, (uint64_t)v16);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to fetch title: %@", v18, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    else
    {
      queue = *((_QWORD *)v15[0] + 3);
      v7 = _NSConcreteStackBlock;
      v8 = -1073741824;
      v9 = 0;
      v10 = sub_100011AC4;
      v11 = &unk_100020650;
      v12 = v15[0];
      v13 = location[0];
      v14 = *(id *)(a1 + 32);
      dispatch_async(queue, &v7);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v12, 0);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void sub_100011AC4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_100011F04(id obj)
{
  unsigned int v2;
  id v3;
  id location;
  id v5;

  location = 0;
  objc_storeStrong(&location, obj);
  v5 = (id)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = v5;
  v2 = objc_msgSend(v3, "containsObject:", location) ^ 1;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

NSString *sub_100012778(uint64_t a1)
{
  BOOL v1;
  id location;
  CFTypeRef cf1;
  int Category;
  uint64_t v6;
  NSString *v7;

  v6 = a1;
  Category = DDResultGetCategory(a1);
  cf1 = 0;
  if (Category == 2)
  {
    v7 = CNContactPhoneNumbersKey;
  }
  else if (Category == 3)
  {
    v7 = CNContactPostalAddressesKey;
  }
  else
  {
    cf1 = (CFTypeRef)DDResultGetType(v6);
    v1 = CFEqual(cf1, DDBinderEmailKey) != 0;
    if (v1 || CFEqual(cf1, DDBinderJabberOrEmailKey) || CFEqual(cf1, DDBinderAIMOrEmailKey))
    {
      v7 = CNContactEmailAddressesKey;
    }
    else if (CFEqual(cf1, DDBinderGenericURLKey))
    {
      location = objc_msgSend((id)DDResultGetMatchedString(v6), "lowercaseString");
      if ((objc_msgSend(location, "hasPrefix:", CFSTR("mailto:")) & 1) != 0)
      {
        v7 = CNContactEmailAddressesKey;
      }
      else if ((objc_msgSend(location, "hasPrefix:", CFSTR("tel:")) & 1) != 0)
      {
        v7 = CNContactPhoneNumbersKey;
      }
      else
      {
        v7 = 0;
      }
      objc_storeStrong(&location, 0);
    }
    else if (CFEqual(cf1, DDBinderIMScreenNameKey))
    {
      v7 = CNContactInstantMessageAddressesKey;
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

void sub_1000129B8(uint64_t a1)
{
  id v1;
  CNContactStore *v2;
  id v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, char, id);
  void *v9;
  id v10;
  id location;
  id v12[3];

  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v12[0] = +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", *(_QWORD *)(a1 + 32));
  v2 = objc_opt_new(CNContactStore);
  objc_msgSend(v12[0], "setContactStore:");

  objc_msgSend(v12[0], "setAllowsActions:", 1);
  objc_msgSend(v12[0], "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v12[0], "setActions:", 33);
  objc_msgSend(v12[0], "setEditMode:", 0);
  v3 = +[DDAddToContactsViewController alternateNameForContact:](DDAddToContactsViewController, "alternateNameForContact:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v12[0], "setAlternateName:");

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v12[0]);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 0;
  if (*(_QWORD *)(a1 + 48))
  {
    location = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *(_QWORD *)(a1 + 48));
    if (objc_msgSend(location, "count") == (id)1)
      objc_msgSend(v12[0], "setPrimaryPropertyKey:", *(_QWORD *)(a1 + 48));
    objc_storeStrong(&location, 0);
  }
  v1 = objc_msgSend(v12[0], "contactStore");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100012C0C;
  v9 = &unk_100020A88;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v1, "requestAccessForEntityType:completionHandler:", 0, &v5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(v12, 0);
}

void sub_100012C0C(id *a1, char a2, id obj)
{
  NSObject *log;
  os_log_type_t v4;
  dispatch_queue_t queue;
  uint8_t v7[15];
  os_log_type_t type;
  os_log_t oslog;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  id v15[2];
  id location;
  char v17;
  id *v18;

  v18 = a1;
  v17 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v15[1] = a1;
  if ((v17 & 1) == 0 || location)
  {
    oslog = &_os_log_default;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v4 = type;
      sub_100005D3C(v7);
      _os_log_error_impl((void *)&_mh_execute_header, log, v4, "Contact Store access for person view controller not granted.", v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    queue = &_dispatch_main_q;
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_100012D98;
    v14 = &unk_100020998;
    v15[0] = a1[4];
    dispatch_async(queue, &v10);

    objc_storeStrong(v15, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_100012D98(id *a1)
{
  id v2;
  os_log_t oslog;
  void **v4;
  int v5;
  int v6;
  id (*v7)(uint64_t, char);
  void *v8;
  id v9;
  id v10[3];
  uint8_t v11[24];

  v10[2] = a1;
  v10[1] = a1;
  objc_msgSend(a1[4], "pushViewController:animated:", *((_QWORD *)a1[4] + 3), 0);
  objc_msgSend(a1[4], "setCancellable:", 1);
  v10[0] = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  v2 = v10[0];
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100012F7C;
  v8 = &unk_100020A10;
  v9 = a1[4];
  objc_msgSend(v2, "getIsBeingPresentedInPopover:", &v4);
  oslog = &_os_log_default;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10000AB04((uint64_t)v11, (uint64_t)v10[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Telling proxy %@ that we're done", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(v10[0], "viewControllerReady");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
}

id sub_100012F7C(uint64_t a1, char a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCancelButtonVisible:", !(a2 & 1));
}

void sub_100013644(id *a1, void *a2)
{
  BOOL v3;
  UIApplication *v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = objc_msgSend(a1[4], "verticalSizeClass") == (id)1;
  objc_msgSend(a1[5], "transitionDuration");
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

void sub_100013C68(id *a1, char a2, id obj)
{
  double v3;
  EKEvent *v4;
  void **v5;
  void *v6;
  NSObject *log;
  os_log_type_t type;
  dispatch_queue_t queue;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  uint8_t v44[7];
  char v45;
  id v46;
  void **v47;
  int v48;
  int v49;
  void (*v50)(uint64_t);
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61[2];
  id location;
  char v63;
  id *v64;

  v64 = a1;
  v63 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v61[1] = a1;
  if ((v63 & 1) == 0 || location)
  {
    v46 = &_os_log_default;
    v45 = 16;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
    {
      log = v46;
      type = v45;
      sub_100005D3C(v44);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Event Store access for DDEventEditViewController not granted.", v44, 2u);
    }
    objc_storeStrong(&v46, 0);
  }
  else
  {
    v41 = objc_msgSend(a1[4], "context");
    v40 = objc_msgSend(v41, "objectForKeyedSubscript:", kDataDetectorsIsAccountManagedKey);
    v42 = (objc_msgSend(v40, "BOOLValue") & 1) != 1;

    if (!v42)
    {
      v38 = a1[5];
      v39 = objc_msgSend(a1[6], "_hostApplicationBundleIdentifier");
      objc_msgSend(v38, "setSourceAccountManagement:withBundleID:", 2);

    }
    v61[0] = 0;
    v60 = 0;
    v31 = a1[5];
    v30 = objc_msgSend(a1[4], "associatedResults");
    v32 = objc_msgSend(a1[4], "context");
    v59 = (id)DDUIEventForResults(v31, v30);

    v34 = a1[5];
    v33 = objc_msgSend(a1[4], "associatedResults");
    v37 = objc_msgSend(a1[4], "context");
    v36 = objc_msgSend(a1[6], "_hostApplicationBundleIdentifier");
    v57 = v61[0];
    v35 = (id)DDUISuggestedEventForResults(v34, v33, v37);
    objc_storeStrong(v61, v57);
    v58 = v35;

    v56 = 0;
    if (v35)
    {
      v28 = objc_msgSend(v58, "title");
      v29 = objc_msgSend(v28, "length");

      if (v29)
      {
        v27 = objc_msgSend(v58, "title");
        objc_msgSend(v59, "setTitle:");

        v56 = 1;
      }
      v25 = objc_msgSend(v58, "notes");
      v26 = objc_msgSend(v25, "length");

      if (v26)
      {
        v24 = objc_msgSend(v58, "notes");
        objc_msgSend(v59, "setNotes:");

        v56 = 1;
      }
      v23 = objc_msgSend(v58, "URL");

      if (v23)
      {
        v22 = objc_msgSend(v58, "URL");
        objc_msgSend(v59, "setURL:");

        v56 = 1;
      }
      v21 = objc_msgSend(v58, "location");

      if (v21)
      {
        v20 = objc_msgSend(v58, "location");
        objc_msgSend(v59, "setLocation:");

        v56 = 1;
      }
      v19 = objc_msgSend(v58, "structuredLocation");

      if (v19)
      {
        v18 = objc_msgSend(v58, "structuredLocation");
        objc_msgSend(v59, "setStructuredLocation:");

        v56 = 1;
      }
      v17 = objc_msgSend(v58, "startDate");

      if (v17)
      {
        objc_msgSend(v59, "setAllDay:", 0);
        v15 = objc_msgSend(v58, "startDate");
        objc_msgSend(v59, "setStartDate:");

        v16 = objc_msgSend(v58, "endDate");
        objc_msgSend(v59, "setEndDate:");

        v56 = 1;
      }
      v13 = objc_msgSend(v58, "startDate");
      LOBYTE(v14) = 0;
      if (!v13)
      {
        objc_msgSend(v58, "duration");
        LOBYTE(v14) = 0;
        if (v3 > 0.0)
          v14 = objc_msgSend(v59, "isAllDay") ^ 1;
      }

      if ((v14 & 1) != 0)
      {
        v12 = objc_msgSend(v59, "startDate");
        objc_msgSend(v58, "duration");
        v11 = objc_msgSend(v12, "dateByAddingTimeInterval:");
        objc_msgSend(v59, "setEndDate:");

        v56 = 1;
      }
      if ((v56 & 1) != 0)
        *((_QWORD *)a1[6] + 5) = v60;
      objc_storeStrong((id *)a1[6] + 7, v61[0]);
    }
    v10 = 1;
    if (objc_msgSend(a1[4], "hostApplication") != 1)
      v10 = objc_msgSend(a1[4], "hostApplication") == 2;
    *((_BYTE *)a1[6] + 32) = v10;
    v4 = sub_100014564(v59, a1[5]);
    v5 = (void **)((char *)a1[6] + 48);
    v6 = *v5;
    *v5 = v4;

    queue = &_dispatch_main_q;
    v47 = _NSConcreteStackBlock;
    v48 = -1073741824;
    v49 = 0;
    v50 = sub_100014768;
    v51 = &unk_100020830;
    v52 = a1[6];
    v53 = a1[5];
    v54 = v59;
    v55 = a1[4];
    dispatch_async(queue, &v47);

    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(v61, 0);
  }
  objc_storeStrong(&location, 0);
}

EKEvent *sub_100014564(void *a1, void *a2)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  EKEvent *v12;
  EKEvent *v13;
  id v14;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v14 = 0;
  objc_storeStrong(&v14, a2);
  v13 = +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v14, a1);
  v5 = objc_msgSend(location, "title");
  -[EKEvent setTitle:](v13, "setTitle:");

  v6 = objc_msgSend(location, "timeZone");
  -[EKEvent setTimeZone:](v13, "setTimeZone:");

  v7 = objc_msgSend(location, "startDate");
  -[EKEvent setStartDate:](v13, "setStartDate:");

  v8 = objc_msgSend(location, "endDate");
  -[EKEvent setEndDate:](v13, "setEndDate:");

  v9 = objc_msgSend(location, "notes");
  -[EKEvent setNotes:](v13, "setNotes:");

  v10 = objc_msgSend(location, "location");
  -[EKEvent setLocation:](v13, "setLocation:");

  v11 = objc_msgSend(location, "URL");
  -[EKEvent setURL:](v13, "setURL:");

  v12 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  return v12;
}

void sub_100014768(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  NSObject *log;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  id v12;
  os_log_type_t type;
  os_log_t oslog;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20[3];
  uint8_t v21[24];

  v20[2] = (id)a1;
  v20[1] = (id)a1;
  v20[0] = objc_alloc_init((Class)EKEventEditViewController);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v20[0]);
  objc_msgSend(v20[0], "setEventStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v20[0], "setEvent:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v20[0], "setEditViewDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v20[0], "setModalInPresentation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setModalInPresentation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v20[0]);
  v19 = objc_msgSend(v20[0], "view");
  v9 = objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v9, "addSubview:", v19);

  objc_msgSend(v20[0], "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  v10 = objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v10, "bounds");
  *(double *)&v17 = v1;
  *((double *)&v17 + 1) = v2;
  *(double *)&v18 = v3;
  *((double *)&v18 + 1) = v4;
  v15 = v17;
  v16 = v18;
  objc_msgSend(v19, "setFrame:", v1, v2, v3, v4);

  objc_msgSend(v19, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "setAction:", *(_QWORD *)(a1 + 56));
  oslog = &_os_log_default;
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    v7 = type;
    v8 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
    v12 = v8;
    sub_10000AB04((uint64_t)v21, (uint64_t)v12);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v7, "Telling proxy %@ that the remote view controller is ready", v21, 0xCu);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(*(id *)(a1 + 32), "setCancellable:", 0);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  objc_msgSend(v5, "viewControllerReady");

  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
}

uint64_t sub_100014F80(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

void sub_1000151BC(id *a1, void *a2)
{
  BOOL v3;
  UIApplication *v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = objc_msgSend(a1[4], "verticalSizeClass") == (id)1;
  objc_msgSend(a1[5], "transitionDuration");
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

id sub_1000153E0(void *a1, void *a2)
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v19 = 0;
  objc_storeStrong(&v19, a2);
  v18 = +[NSMutableString string](NSMutableString, "string");
  v17 = objc_msgSend(v19, "objectForKeyedSubscript:", kDataDetectorsLeadingText);
  v16 = objc_msgSend(v19, "objectForKeyedSubscript:", kDataDetectorsMiddleText);
  v15 = objc_msgSend(v19, "objectForKeyedSubscript:", kDataDetectorsTrailingText);
  v13 = 0;
  v12 = 0;
  if (!v16)
  {
    v14 = objc_msgSend(location, "firstObject");
    v13 = 1;
    v12 = v14 != 0;
  }
  if ((v13 & 1) != 0)

  if (v12)
  {
    v10 = objc_msgSend(location, "firstObject");

    v2 = (id)DDResultGetMatchedString(v10);
    v3 = v16;
    v16 = v2;

  }
  if (v16)
  {
    if (v17)
    {
      v9 = objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("\n"));
      v8 = objc_msgSend(v9, "lastObject");
      objc_msgSend(v18, "appendString:");

    }
    objc_msgSend(v18, "appendString:", v16);
    if (v15)
    {
      v7 = objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("\n"));
      v6 = objc_msgSend(v7, "firstObject");
      objc_msgSend(v18, "appendString:");

    }
  }
  v5 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

id sub_100015700(void *a1, void *a2)
{
  id v4;
  id v5;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v5 = 0;
  objc_storeStrong(&v5, a2);
  v4 = objc_msgSend(v5, "objectForKey:", kDataDetectorsEventTitleKey);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

id sub_100015798(void *a1, void *a2)
{
  const __CFString *Type;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v12;
  CFTypeRef cf;
  uint64_t v14;
  _QWORD __b[8];
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id location;
  _BYTE v21[128];

  location = 0;
  objc_storeStrong(&location, a1);
  v19 = 0;
  objc_storeStrong(&v19, a2);
  v18 = +[NSMutableArray array](NSMutableArray, "array");
  if (objc_msgSend(location, "count"))
  {
    v17 = objc_msgSend(location, "sortedArrayUsingFunction:context:", &DDResultProximitySort, objc_msgSend(location, "objectAtIndex:", 0));
    memset(__b, 0, sizeof(__b));
    v9 = v17;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    if (v10)
    {
      v6 = *(_QWORD *)__b[2];
      v7 = 0;
      v8 = v10;
      while (1)
      {
        v5 = v7;
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(__b[1] + 8 * v7);
        v14 = v16;
        Type = (const __CFString *)DDResultGetType(v16);
        if (CFStringCompare(Type, DDBinderPhoneNumberKey, 0) == kCFCompareEqualTo)
        {
          cf = 0;
          DDResultCopyPhoneValue(v14, &cf, 0);
          if (cf)
          {
            objc_msgSend(v18, "addObject:", cf);
            CFRelease(cf);
          }
        }
        ++v7;
        if (v5 + 1 >= (unint64_t)v8)
        {
          v7 = 0;
          v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
          if (!v8)
            break;
        }
      }
    }

    objc_storeStrong(&v17, 0);
  }
  v12 = objc_msgSend(v19, "objectForKey:", kDataDetectorsSelectedTextKey);
  if (v12)
    objc_msgSend(v18, "addObject:", v12);
  v4 = objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

id sub_100015AEC(void *a1, void *a2)
{
  const __CFString *Type;
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;
  _QWORD __b[8];
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id location;
  _BYTE v21[128];

  location = 0;
  objc_storeStrong(&location, a1);
  v19 = 0;
  objc_storeStrong(&v19, a2);
  v18 = 0;
  if (objc_msgSend(location, "count"))
  {
    v17 = objc_msgSend(location, "sortedArrayUsingFunction:context:", &DDResultProximitySort, objc_msgSend(location, "objectAtIndex:", 0));
    memset(__b, 0, sizeof(__b));
    v11 = v17;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(__b[1] + 8 * v9);
        v14 = v16;
        Type = (const __CFString *)DDResultGetType(v16);
        if (CFStringCompare(Type, DDBinderFullAddressKey, 0) == kCFCompareEqualTo)
        {
          v3 = (id)DDResultGetMatchedString(v14);
          v4 = v18;
          v18 = v3;

        }
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          v9 = 0;
          v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
          if (!v10)
            break;
        }
      }
    }

    objc_storeStrong(&v17, 0);
  }
  v6 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

id sub_100015D98(void *a1, void *a2, BOOL *a3)
{
  id v3;
  id v4;
  id v6;
  id v7;
  NSString *v8;
  NSCalendar *v9;
  id v10;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  BOOL *v19;
  id v20;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v20 = 0;
  objc_storeStrong(&v20, a2);
  v19 = a3;
  v18 = 0;
  if (objc_msgSend(location, "count"))
  {
    v17 = 0;
    v16 = 0;
    v14 = 0;
    v10 = (id)dueDateAndTimezoneOfEventResults(location, v20, &v16, &v14);
    objc_storeStrong(&v17, v14);
    v15 = v10;
    if (v10)
    {
      v7 = objc_alloc((Class)NSCalendar);
      v9 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
      v8 = -[NSCalendar calendarIdentifier](v9, "calendarIdentifier");
      v13 = objc_msgSend(v7, "initWithCalendarIdentifier:");

      if (v17)
        objc_msgSend(v13, "setTimeZone:", v17);
      v3 = objc_msgSend(v13, "components:fromDate:", 2122492, v15);
      v4 = v18;
      v18 = v3;

      if (v19)
        *v19 = v16 != 0;
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v17, 0);
  }
  v6 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

uint64_t sub_100015FD8(void *a1, void *a2)
{
  id v4;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v4 = 0;
  objc_storeStrong(&v4, a2);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return 0;
}

id objc_msgSend_DDViewScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DDViewScale");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostApplicationBundleIdentifier");
}

id objc_msgSend__hostProcessIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostProcessIdentifier");
}

id objc_msgSend__rankFeedbackWithLocalSections_remoteSections_footerSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rankFeedbackWithLocalSections:remoteSections:footerSection:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setBuiltinTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBuiltinTransitionStyle:");
}

id objc_msgSend_actionCanBeCancelledExternally_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionCanBeCancelledExternally:");
}

id objc_msgSend_actionDidFinishShouldDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionDidFinishShouldDismiss:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSections_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSections:error:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alternateNameForContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateNameForContact:");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedResults");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backgroundTimeRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundTimeRemaining");
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bag");
}

id objc_msgSend_beginBackgroundTaskWithExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarIdentifier");
}

id objc_msgSend_cancelEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelEditing");
}

id objc_msgSend_cardSection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cardSection");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completeTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeTransition:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contact");
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactStore");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_coreResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreResult");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cornerRadius");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dd_emailFromMailtoScheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dd_emailFromMailtoScheme");
}

id objc_msgSend_dd_isAnySimpleTelephonyScheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dd_isAnySimpleTelephonyScheme");
}

id objc_msgSend_dd_phoneNumberFromTelScheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dd_phoneNumberFromTelScheme");
}

id objc_msgSend_dd_userFriendlyEmail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dd_userFriendlyEmail");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTimeZone");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destination");
}

id objc_msgSend_dictionarySectionForString_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionarySectionForString:queryId:");
}

id objc_msgSend_didEndSearch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEndSearch:");
}

id objc_msgSend_didEngageCardSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEngageCardSection:");
}

id objc_msgSend_didEngageResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEngageResult:");
}

id objc_msgSend_didErrorOccur_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didErrorOccur:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didRankSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didRankSections:");
}

id objc_msgSend_didStartSearch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartSearch:");
}

id objc_msgSend_didSubmitUserReportFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSubmitUserReportFeedback:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScale");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doneButtonPressed_punchout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneButtonPressed:punchout:");
}

id objc_msgSend_doneWithAddingContactShouldDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithAddingContactShouldDismiss:");
}

id objc_msgSend_doneWithAddingEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWithAddingEvent");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddresses");
}

id objc_msgSend_enabledDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledDomains");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "event");
}

id objc_msgSend_eventWithEventStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithEventStore:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyName");
}

id objc_msgSend_feedbackListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedbackListener");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstUseDescriptionText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUseDescriptionText");
}

id objc_msgSend_firstUseLearnMoreText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUseLearnMoreText");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_footerSectionForString_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footerSectionForString:queryId:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_getIsBeingPresentedInPopover_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIsBeingPresentedInPopover:");
}

id objc_msgSend_getStatusBarHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStatusBarHidden:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenName");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hostApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostApplication");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_initWithAction_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAction:delegate:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithData_eventStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:eventStore:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDomains_explanationText_learnMoreText_continueButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomains:explanationText:learnMoreText:continueButtonTitle:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEvent:");
}

id objc_msgSend_initWithFacade_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFacade:");
}

id objc_msgSend_initWithId_userAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithId:userAgent:");
}

id objc_msgSend_initWithInput_triggerEvent_indexType_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInput:triggerEvent:indexType:queryId:");
}

id objc_msgSend_initWithNibName_bundle_bag_sceneAwareVariant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:bag:sceneAwareVariant:");
}

id objc_msgSend_initWithQuery_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQuery:queryId:");
}

id objc_msgSend_initWithResult_hiddenResults_duplicateResults_localResultPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResult:hiddenResults:duplicateResults:localResultPosition:");
}

id objc_msgSend_initWithResults_section_localSectionPosition_personalizationScore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResults:section:localSectionPosition:personalizationScore:");
}

id objc_msgSend_initWithSearchString_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchString:queryId:");
}

id objc_msgSend_initWithSections_blendingDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSections:blendingDuration:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithStartSearch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartSearch:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_inlineCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inlineCard");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_interactionEndedWithPunchout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionEndedWithPunchout:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAllDay");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labeledValueWithLabel:value:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadReportAnIssueImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadReportAnIssueImage:");
}

id objc_msgSend_localizedModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedModel");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_lookupRequestWithString_queryContext_domain_lookupSelectionType_appBundleId_queryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:queryId:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nickname");
}

id objc_msgSend_notes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notes");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openTrailerPunchout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openTrailerPunchout:");
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationName");
}

id objc_msgSend_parsecEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parsecEnabled");
}

id objc_msgSend_performAnimatableChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAnimatableChanges:");
}

id objc_msgSend_performAnimatableChanges_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAnimatableChanges:animated:");
}

id objc_msgSend_performClientQueryWithServerAccessPermitted_localSearchPermitted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performClientQueryWithServerAccessPermitted:localSearchPermitted:");
}

id objc_msgSend_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performClientTextQueryWithTerm:queryId:sessionId:userAgent:reply:");
}

id objc_msgSend_placement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placement");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredOpenableURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredOpenableURL");
}

id objc_msgSend_presentsWithMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentsWithMargins");
}

id objc_msgSend_punchoutWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "punchoutWithURL:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryBlock");
}

id objc_msgSend_queryID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryID");
}

id objc_msgSend_queryId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryId");
}

id objc_msgSend_queryWithQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryWithQuery:");
}

id objc_msgSend_queryWithoutNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryWithoutNetwork");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_recordUserInteraction_withLinkInApplication_eventPrefillMode_eventTypeClassification_proposedEvent_confirmedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_reminderTitleForContent_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reminderTitleForContent:withCompletion:");
}

id objc_msgSend_remoteVCIsReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteVCIsReady");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_reportAnIssueWithReportIdentifier_sfReportData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportAnIssueWithReportIdentifier:sfReportData:");
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_requestFullAccessToEventsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestFullAccessToEventsWithCompletion:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_sceneAwareLookupEnabledDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneAwareLookupEnabledDomains");
}

id objc_msgSend_sceneAwareLookupFirstUseDescriptionText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneAwareLookupFirstUseDescriptionText");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_searchRenderTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchRenderTimeout");
}

id objc_msgSend_searchViewDidAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidAppear:");
}

id objc_msgSend_searchViewDidDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidDisappear:");
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sections");
}

id objc_msgSend_sectionsForResult_useNetwork_clientId_queryId_scale_proxy_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionsForResult:useNetwork:clientId:queryId:scale:proxy:handler:");
}

id objc_msgSend_sectionsForString_useNetwork_clientId_queryId_selectionType_domain_range_scale_proxy_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:");
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selector");
}

id objc_msgSend_serviceForReminders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForReminders");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAllDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllDay:");
}

id objc_msgSend_setAllowsActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsActions:");
}

id objc_msgSend_setAllowsImport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsImport:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAltURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltURL:");
}

id objc_msgSend_setAlternateName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateName:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setCancelButtonVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButtonVisible:");
}

id objc_msgSend_setCancelButtonWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButtonWithTarget:action:");
}

id objc_msgSend_setCancellable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellable:");
}

id objc_msgSend_setCardSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCardSections:");
}

id objc_msgSend_setCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommand:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactStore:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDDViewScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDDViewScale:");
}

id objc_msgSend_setDefaultEffectiveBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultEffectiveBundleIdentifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEditMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditMode:");
}

id objc_msgSend_setEditViewDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditViewDelegate:");
}

id objc_msgSend_setEmailAddresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmailAddresses:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEvent:");
}

id objc_msgSend_setEventStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventStore:");
}

id objc_msgSend_setFeedbackListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeedbackListener:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setIconType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconType:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImmediatelyShowCardForSingleResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImmediatelyShowCardForSingleResult:");
}

id objc_msgSend_setInlineCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInlineCard:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLookup:");
}

id objc_msgSend_setMainIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainIdentifier:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setNavigationBarHidden_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationBarHidden:animated:");
}

id objc_msgSend_setNotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotes:");
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumbers:");
}

id objc_msgSend_setPreviewDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewDelegate:");
}

id objc_msgSend_setPreviewMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewMode:");
}

id objc_msgSend_setPrimaryPropertyKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryPropertyKey:");
}

id objc_msgSend_setPunchout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPunchout:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryBlock:");
}

id objc_msgSend_setQueryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryId:");
}

id objc_msgSend_setQueryString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryString:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setReportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportType:");
}

id objc_msgSend_setResultBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultBundleId:");
}

id objc_msgSend_setResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResults:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:animated:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setSearchString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchString:");
}

id objc_msgSend_setSearchVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchVisible:");
}

id objc_msgSend_setSearchWebQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchWebQuery:");
}

id objc_msgSend_setSectionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionBundleIdentifier:");
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSections:");
}

id objc_msgSend_setShouldUseCompactDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUseCompactDisplay:");
}

id objc_msgSend_setShouldUseInsetRoundedSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUseInsetRoundedSections:");
}

id objc_msgSend_setShouldUseStandardSectionInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUseStandardSectionInsets:");
}

id objc_msgSend_setSourceAccountManagement_withBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceAccountManagement:withBundleID:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStatusBarHidden_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:duration:");
}

id objc_msgSend_setStructuredLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStructuredLocation:");
}

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbnail:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUploadedDataIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadedDataIdentifier:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_showBackgroundEffect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showBackgroundEffect");
}

id objc_msgSend_showContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContent:");
}

id objc_msgSend_showError_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showError:animated:");
}

id objc_msgSend_showLoadingSpinner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showLoadingSpinner:");
}

id objc_msgSend_showingErrorView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showingErrorView:");
}

id objc_msgSend_showingFTE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showingFTE:");
}

id objc_msgSend_sortedArrayUsingFunction_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingFunction:context:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "structuredLocation");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGroupedBackgroundColor");
}

id objc_msgSend_taskWithRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithRequest:completion:");
}

id objc_msgSend_textWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textWithString:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZone");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionDuration");
}

id objc_msgSend_transitionDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionDuration:");
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWasCancelled");
}

id objc_msgSend_updateForCurrentTraitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateForCurrentTraitCollection");
}

id objc_msgSend_updateStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStyle");
}

id objc_msgSend_updateVisualMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateVisualMode:");
}

id objc_msgSend_updateVisualModeWithController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateVisualModeWithController:animated:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAgent");
}

id objc_msgSend_userSelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSelection");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController");
}

id objc_msgSend_viewControllerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForKey:");
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForUnknownContact:");
}

id objc_msgSend_viewControllerReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerReady");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

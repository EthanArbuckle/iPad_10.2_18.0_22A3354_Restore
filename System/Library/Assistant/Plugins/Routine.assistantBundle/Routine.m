void sub_22793CE64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "code");
    v6 = objc_alloc(MEMORY[0x24BE811A8]);
    if (v5 == 2)
      v7 = (void *)objc_msgSend(v6, "initWithErrorCode:", *MEMORY[0x24BE82320]);
    else
      v7 = (void *)objc_msgSend(v6, "initWithReason:", CFSTR("Failed creating vehicle events from CoreRoutine"));
    v8 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    sub_22793DEC4(qword_255903520);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_22793B000, v13, OS_LOG_TYPE_INFO, "Failed creating vehicle event, error, %@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BE811B8]);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

id sub_22793CFF0(double a1, double a2, double a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setDate:", v17);

  v19 = objc_alloc_init(MEMORY[0x24BE81450]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLatitude:", v20);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLongitude:", v21);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccuracy:", v22);

  objc_msgSend(v18, "setLocation:", v19);
  objc_msgSend(v18, "setNotes:", v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserSetLocation:", v23);

  objc_msgSend(v18, "setVehicleIdentifier:", v15);
  return v18;
}

void sub_22793D318(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22793D3E8;
  v11[3] = &unk_24F00BEC8;
  v12 = v5;
  v13 = v6;
  v8 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

void sub_22793D3E8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_group_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  dispatch_group_t v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  sub_22793DEC4(qword_255903520);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v27 = v3;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_22793B000, v2, OS_LOG_TYPE_INFO, "Received %lu vehicle events from CoreRoutine, error, %@", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = objc_msgSend(v5, "code");
    v7 = objc_alloc(MEMORY[0x24BE811A8]);
    if (v6 == 2)
      v8 = objc_msgSend(v7, "initWithErrorCode:", *MEMORY[0x24BE82320]);
    else
      v8 = objc_msgSend(v7, "initWithReason:", CFSTR("Failed fetching vehicle events from CoreRoutine"));
    v15 = v8;
    v18 = *(_QWORD *)(a1 + 56);
    -[NSObject dictionary](v8, "dictionary");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v17);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v10 = dispatch_group_create();
    v11 = MEMORY[0x24BDAC760];
    v12 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_22793D634;
    v22[3] = &unk_24F00BE78;
    v23 = v10;
    v13 = v9;
    v14 = *(_QWORD *)(a1 + 48);
    v24 = v13;
    v25 = v14;
    v15 = v10;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = sub_22793DBE0;
    block[3] = &unk_24F00BEA0;
    v20 = v13;
    v21 = *(id *)(a1 + 56);
    v17 = v13;
    dispatch_group_notify(v15, v16, block);

  }
}

void sub_22793D634(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latitude");
  v6 = v5;
  objc_msgSend(v3, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "longitude");
  v9 = v8;

  objc_msgSend(v3, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "referenceFrame"))
  {
    objc_msgSend(v3, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "referenceFrame");

    if (v12 != 1)
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v13 = objc_msgSend(MEMORY[0x24BE3CC28], "isLocationShiftRequiredForCoordinate:", v6, v9);
LABEL_6:
  sub_22793DEC4(qword_255903520);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v13)
      v15 = (const char *)&unk_22793EEDA;
    else
      v15 = "not ";
    objc_msgSend(v3, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v51 = v15;
    v52 = 2112;
    v53 = v16;
    _os_log_impl(&dword_22793B000, v14, OS_LOG_TYPE_INFO, "Shift %sneeded for locations, %@", buf, 0x16u);

  }
  if (v13)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v17 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = sub_22793D9F4;
    v46[3] = &unk_24F00BE28;
    v18 = v3;
    v47 = v18;
    v48 = *(id *)(a1 + 40);
    v49 = *(id *)(a1 + 32);
    v19 = (void *)MEMORY[0x22E2A04E8](v46);
    v41 = v17;
    v42 = 3221225472;
    v43 = sub_22793DB68;
    v44 = &unk_24F00BE50;
    v45 = *(id *)(a1 + 32);
    v20 = (void *)MEMORY[0x22E2A04E8](&v41);
    objc_msgSend(*(id *)(a1 + 48), "locationShifter", v41, v42, v43, v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "horizontalUncertainty");
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v19, 0, v20, v25, v6, v9, v24);

    v26 = v47;
  }
  else
  {
    v27 = (void *)MEMORY[0x24BE81440];
    objc_msgSend(v3, "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "latitude");
    v31 = v30;
    objc_msgSend(v3, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "longitude");
    v34 = v33;
    objc_msgSend(v3, "location");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "horizontalUncertainty");
    v37 = v36;
    objc_msgSend(v3, "notes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "userSetLocation");
    objc_msgSend(v3, "vehicleIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "vehicleEventWithDate:latitude:longitude:accuracy:notes:userSetLocation:vehicleIdentifier:", v28, v38, v39, v40, v31, v34, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v26);
  }

}

void sub_22793D9F4(uint64_t a1, double a2, double a3, double a4)
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sub_22793DEC4(qword_255903520);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 134283777;
    v16 = a2;
    v17 = 2049;
    v18 = a3;
    _os_log_impl(&dword_22793B000, v8, OS_LOG_TYPE_INFO, "Shifted coordinate: %{private}f, %{private}f", (uint8_t *)&v15, 0x16u);
  }

  v9 = (void *)MEMORY[0x24BE81440];
  objc_msgSend(*(id *)(a1 + 32), "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 32), "userSetLocation");
  objc_msgSend(*(id *)(a1 + 32), "vehicleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vehicleEventWithDate:latitude:longitude:accuracy:notes:userSetLocation:vehicleIdentifier:", v10, v11, v12, v13, a2, a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_22793DB68(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sub_22793DEC4(qword_255903520);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22793B000, v2, OS_LOG_TYPE_INFO, "Shift error.", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_22793DBE0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sub_22793DEC4(qword_255903520);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_22793B000, v2, OS_LOG_TYPE_INFO, "Reply to search with %lu vehicle events.", (uint8_t *)&v7, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BE81448]);
  objc_msgSend(v4, "setEvents:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void sub_22793DE40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BE811B8]);
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

id sub_22793DEC4(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_22793DF08);
  return (id)predicate[2];
}

os_log_t sub_22793DF08(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_22793E158(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  if (v12)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BE27EB0]);
    objc_msgSend(*(id *)(a1 + 32), "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v11, 2, a3, a4, a5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_22793E71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22793E75C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22793E76C(uint64_t a1)
{

}

void sub_22793E774(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  uint64_t v7;
  id v8;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v8 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_22793E9E0(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v5;
  CLLocationCoordinate2D v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = CLLocationCoordinate2DMake(a2, a3);
  return (*(uint64_t (**)(uint64_t, _QWORD, CLLocationDegrees, CLLocationDegrees, double))(v5 + 16))(v5, 0, v6.latitude, v6.longitude, a4);
}

uint64_t sub_22793EA1C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}


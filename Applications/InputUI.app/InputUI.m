id sub_1000039F4()
{
  if (qword_100029368 != -1)
    dispatch_once(&qword_100029368, &stru_10001C480);
  return (id)qword_100029360;
}

void sub_1000041A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.InputUI", "General");
  v2 = (void *)qword_100029360;
  qword_100029360 = (uint64_t)v1;

}

id sub_1000041D4()
{
  if (qword_100029378 != -1)
    dispatch_once(&qword_100029378, &stru_10001C4A0);
  return (id)qword_100029370;
}

void sub_100004214(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.InputUI", "InputSessionChange");
  v2 = (void *)qword_100029370;
  qword_100029370 = (uint64_t)v1;

}

void sub_100004358(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.inputservice.teletype"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.inputservice.teletype"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

void sub_100004D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004E9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForSpringBoardToForegroundInputUIScene");
}

Class sub_100005248(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100029388)
  {
    v3 = off_10001C538;
    v4 = 0;
    qword_100029388 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("AFUIServiceDelegate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100029380 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000052FC(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100029388)
  {
    v3 = off_10001C538;
    v4 = 0;
    qword_100029388 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("AFUIServiceListener");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100029390 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *sub_1000058C0(void *a1)
{
  id v1;
  uint64_t v2;
  NSString *v3;
  __CFString *v4;

  if (a1)
  {
    v1 = a1;
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(v1, v2), v1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);

  }
  else
  {
    v4 = CFSTR("(nil)");
  }
  return v4;
}

void sub_100005FDC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100005FFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t sub_100006010()
{
  uint64_t v0;

  return v0;
}

void sub_10000601C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000625C(id a1)
{
  byte_100029398 = _os_feature_enabled_impl("AutoFillUI", "afui_use_rti_interface_for_iphone");
}

void sub_10000683C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000068CC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_msgSend(*(id *)(a1 + 32), "handleTeardownExistingDelegate:", v6);

  objc_msgSend(v7, "returnExecutionToParent");
}

void sub_1000069A4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_msgSend(*(id *)(a1 + 32), "handleSetupNewDelegate:", v6);

  objc_msgSend(v7, "returnExecutionToParent");
}

id sub_100006BE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_handleSessionChange:", *(_QWORD *)(a1 + 40));
}

void sub_100007798(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007808(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007818(uint64_t a1)
{

}

void sub_100007820(id a1, IUISessionChangeResponse *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = sub_1000041D4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[IUISessionCoordinator _main_handleSessionChange:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  Placeholder service session and input source are (or were) removed.", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1000078C4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;

  v2 = sub_1000041D4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionChange"));
    *(_DWORD *)buf = 136315394;
    v7 = "-[IUISessionCoordinator _main_handleSessionChange:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  Will remove placeholder input source, if not already removed: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_queueSessionChange:", *(_QWORD *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000079E0;
  block[3] = &unk_10001C518;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000079E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_100007B38(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007BC4;
  block[3] = &unk_10001C630;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100007BC4(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:didCreateInputSession:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:didCreateInputSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void sub_100007FC4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008064;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_100008064(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSessionDidBegin:options:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSessionDidBegin:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

id sub_1000080F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queueSessionChange:", *(_QWORD *)(a1 + 40));
}

void sub_1000080FC(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008188;
  block[3] = &unk_10001C630;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100008188(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  if (objc_msgSend(*(id *)(a1 + 32), "needsToReloadInputSource"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsToReloadInputSource:", 0);
    objc_msgSend(*(id *)(a1 + 32), "reloadInputSource");
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSession:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RTIInputSystemDataPayload payloadWithData:](RTIInputSystemDataPayload, "payloadWithData:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "documentTraits"));
  v4 = objc_msgSend(v3, "copy");
  objc_msgSend(v2, "setDocumentTraits:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "documentState"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v2, "setDocumentState:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v2, "setSessionUUID:", v8);

  objc_msgSend(v2, "updateData");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  objc_msgSend(v9, "ingestDataPayload:", v2);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  objc_msgSend(v10, "setCanBecomeFirstResponder:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assertionForOptions:", *(_QWORD *)(a1 + 48)));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  objc_msgSend(v12, "becomeFirstResponder");

  objc_msgSend(*(id *)(a1 + 32), "invalidateAssertionIfNeeded:resetKeyboardAlpha:", v11, 1);
  objc_msgSend(*(id *)(a1 + 32), "handlePendingSuggestionsDataIfNecessary");
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));

  if (v14 != v13)
    objc_msgSend(v14, "removeFromSuperview");

}

uint64_t sub_1000085EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000085F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100008AA8(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008B48;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_100008B48(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSessionDidEnd:options:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSessionDidEnd:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t sub_100008BD0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100008BE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queueSessionChange:", *(_QWORD *)(a1 + 40));
}

void sub_100008BF0(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CA0;
  block[3] = &unk_10001C6F0;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100008CA0(uint64_t a1)
{
  id v2;
  NSObject *v3;

  v2 = sub_1000039F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E258();

  return objc_msgSend(*(id *)(a1 + 48), "_endSession:options:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void sub_100008E3C(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008EC8;
  block[3] = &unk_10001C630;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100008EC8(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSessionDidDie:");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSessionDidDie:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_endSession:options:completion:", *(_QWORD *)(a1 + 48), 0, 0);
}

void sub_100009084(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009110;
  block[3] = &unk_10001C630;
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100009110(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id *v4;
  void *v5;
  char v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  id v16;

  v2 = sub_1000039F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E354();

  v4 = (id *)(a1 + 48);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "inputSystemService:inputSessionDocumentDidChange:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
    objc_msgSend(v7, "inputSystemService:inputSessionDocumentDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  v9 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[2], "currentSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "textInputSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "currentDataPayload"));
    -[NSObject ingestDataPayload:](v14, "ingestDataPayload:", v15);

  }
  else
  {
    v16 = sub_1000039F4();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000E2B8();
  }

}

void sub_1000093CC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009468;
  v5[3] = &unk_10001C658;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100009468(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v12;

  v2 = sub_1000039F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E450();

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "inputSystemService:inputSession:documentTraitsDidChange:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
    objc_msgSend(v6, "inputSystemService:inputSession:documentTraitsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "currentSession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "textInputSource"));
    -[NSObject ingestDocumentTraits:](v11, "ingestDocumentTraits:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v12 = sub_1000039F4();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000E3B4();
  }

}

void sub_10000971C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000097B8;
  v5[3] = &unk_10001C658;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_1000097B8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v12;

  v2 = sub_1000039F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E54C();

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "inputSystemService:inputSession:documentStateDidChange:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
    objc_msgSend(v6, "inputSystemService:inputSession:documentStateDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "currentSession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "textInputSource"));
    -[NSObject ingestDocumentState:](v11, "ingestDocumentState:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v12 = sub_1000039F4();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000E4B0();
  }

}

void sub_100009A6C(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009B0C;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_100009B0C(uint64_t a1)
{
  id *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "inputSystemService:inputSession:textSuggestionsChanged:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v5, "inputSystemService:inputSession:textSuggestionsChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "textInputSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inputDelegate"));
    v12 = objc_opt_respondsToSelector(v11, "setSuggestions:");

    if ((v12 & 1) != 0)
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(+[UITextSuggestion decodeTextSuggestions:](UITextSuggestion, "decodeTextSuggestions:", *(_QWORD *)(a1 + 56)));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "inputDelegate"));
      objc_msgSend(v14, "setSuggestions:", v20);

LABEL_14:
      return;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "pendingSuggestions"));

      if (!v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(*v2, "setPendingSuggestions:", v18);

      }
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingSuggestions"));
      v19 = *(_QWORD *)(a1 + 56);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
      objc_msgSend(v20, "setObject:forKey:", v19, v13);
      goto LABEL_14;
    }
  }
  else
  {
    v15 = sub_1000039F4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000E5AC();

  }
}

void sub_100009E94(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009F30;
  v5[3] = &unk_10001C658;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100009F30(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;

  v2 = sub_1000039F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E6E4();

  v4 = (id *)(a1 + 48);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "inputSystemService:inputSession:performInputOperation:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "autofillUIServiceDelegate"));
    objc_msgSend(v7, "inputSystemService:inputSession:performInputOperation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "currentSession"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "keyboardInput"));

    v13 = sub_1000039F4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10000E648();
      goto LABEL_14;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "currentSession"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid"));
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: allowing performInputOperation received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v23, 0x16u);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "textInputSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sourceSessionDelegate"));
  v21 = objc_opt_respondsToSelector(v20, "inputSession:performInputOperation:");

  if ((v21 & 1) == 0)
    return;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "textInputSource"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sourceSessionDelegate](v15, "sourceSessionDelegate"));
  objc_msgSend(v22, "inputSession:performInputOperation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

LABEL_14:
}

void sub_10000A324(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;
  id v6;
  id v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3D8;
  block[3] = &unk_10001C6F0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000A3D8(uint64_t a1)
{
  id *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(void);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "inputSystemService:inputSession:performInputOperation:withResponse:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v5, "inputSystemService:inputSession:performInputOperation:withResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "keyboardInput"));

    v11 = sub_1000039F4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10000E744();

      v14 = *(_QWORD *)(a1 + 64);
      if (v14)
      {
        v15 = *(void (**)(void))(v14 + 16);
LABEL_16:
        v15();
        return;
      }
      return;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "currentSession"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid"));
      v25 = 138412546;
      v26 = v16;
      v27 = 2112;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: allowing performInputOperation without keyboardInput received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v25, 0x16u);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "textInputSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sourceSessionDelegate"));
  v21 = objc_opt_respondsToSelector(v20, "inputSession:performInputOperation:withResponse:");

  if ((v21 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sourceSessionDelegate"));
    objc_msgSend(v23, "inputSession:performInputOperation:withResponse:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    return;
  }
  v24 = *(_QWORD *)(a1 + 64);
  if (v24)
  {
    v15 = *(void (**)(void))(v24 + 16);
    goto LABEL_16;
  }
}

void sub_10000A7AC(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A84C;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_10000A84C(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSessionDidPause:withReason:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSessionDidPause:withReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void sub_10000AA40(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000AAE0;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_10000AAE0(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSessionDidUnpause:withReason:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSessionDidUnpause:withReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void sub_10000ACD4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000AD74;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_10000AD74(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSession:didAddRTISupplementalLexicon:");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSession:didAddRTISupplementalLexicon:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = sub_1000039F4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      v19 = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: allowing didAddRTISupplementalLexicon received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v19, 0x16u);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sourceSessionDelegate"));
  v16 = objc_opt_respondsToSelector(v15, "inputSession:didAddRTISupplementalLexicon:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sourceSessionDelegate"));
    objc_msgSend(v18, "inputSession:didAddRTISupplementalLexicon:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void sub_10000B0CC(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B16C;
  v3[3] = &unk_10001C658;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_10000B16C(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
  v3 = objc_opt_respondsToSelector(v2, "inputSystemService:inputSession:didRemoveRTISupplementalLexicon:");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "autofillUIServiceDelegate"));
    objc_msgSend(v4, "inputSystemService:inputSession:didRemoveRTISupplementalLexicon:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = sub_1000039F4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
      v19 = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: allowing didRemoveRTISupplementalLexicon received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v19, 0x16u);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sourceSessionDelegate"));
  v16 = objc_opt_respondsToSelector(v15, "inputSession:didRemoveRTISupplementalLexicon:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "textInputSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sourceSessionDelegate"));
    objc_msgSend(v18, "inputSession:didRemoveRTISupplementalLexicon:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void sub_10000B42C(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  byte_1000293A8 = +[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion");
  v1 = sub_1000041D4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10000E7E0(v2, v3, v4, v5, v6, v7, v8, v9);

}

Class sub_10000B480(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000293C0)
  {
    v3 = off_10001C730;
    v4 = 0;
    qword_1000293C0 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("AFUIServiceDelegate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1000293B8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000B534(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000B560(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10000B5A0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_10000B5AC()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_10000B5B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000B5C8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  NSString *v14;
  uint64_t v15;

  v4 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.InputUI") & 1) == 0)
  {
    v6 = sub_1000039F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000E87C(v7);

  }
  v8 = (objc_class *)objc_opt_class(InputUIAppDelegate, v5);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v12 = (objc_class *)objc_opt_class(InputUIApp, v11);
  v13 = NSStringFromClass(v12);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
  objc_autoreleasePoolPop(v4);
  v15 = UIApplicationMain(a1, a2, v14, v10);

  return v15;
}

void sub_10000C02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

id sub_10000C050()
{
  if (qword_1000293D0 != -1)
    dispatch_once(&qword_1000293D0, &stru_10001C7E8);
  return (id)qword_1000293C8;
}

__n128 sub_10000C090(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  BKSHIDServicesGetCALayerTransform(v9, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v9[2];
  result = (__n128)v9[3];
  v5 = v9[1];
  *(_OWORD *)(v2 + 32) = v9[0];
  *(_OWORD *)(v2 + 48) = v5;
  v7 = v9[6];
  v6 = v9[7];
  v8 = v9[5];
  *(_OWORD *)(v2 + 96) = v9[4];
  *(_OWORD *)(v2 + 112) = v8;
  *(_OWORD *)(v2 + 128) = v7;
  *(_OWORD *)(v2 + 144) = v6;
  *(_OWORD *)(v2 + 64) = v4;
  *(__n128 *)(v2 + 80) = result;
  return result;
}

__n128 sub_10000C0EC(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  BKSHIDServicesGetCALayerTransform(v9, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v9[2];
  result = (__n128)v9[3];
  v5 = v9[1];
  *(_OWORD *)(v2 + 32) = v9[0];
  *(_OWORD *)(v2 + 48) = v5;
  v7 = v9[6];
  v6 = v9[7];
  v8 = v9[5];
  *(_OWORD *)(v2 + 96) = v9[4];
  *(_OWORD *)(v2 + 112) = v8;
  *(_OWORD *)(v2 + 128) = v7;
  *(_OWORD *)(v2 + 144) = v6;
  *(_OWORD *)(v2 + 64) = v4;
  *(__n128 *)(v2 + 80) = result;
  return result;
}

void sub_10000C148(uint64_t a1)
{
  id WeakRetained;
  double y;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CATransform3D v21;
  CATransform3D v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    y = CGPointZero.y;
    v4 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = v4[7];
    *(_OWORD *)&v22.m31 = v4[6];
    *(_OWORD *)&v22.m33 = v5;
    v6 = v4[9];
    *(_OWORD *)&v22.m41 = v4[8];
    *(_OWORD *)&v22.m43 = v6;
    v7 = v4[3];
    *(_OWORD *)&v22.m11 = v4[2];
    *(_OWORD *)&v22.m13 = v7;
    v8 = v4[5];
    *(_OWORD *)&v22.m21 = v4[4];
    *(_OWORD *)&v22.m23 = v8;
    v9 = CA_CGPointApplyTransform(&v22, CGPointZero.x, y);
    v11 = v10;
    v12 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v12[7];
    *(_OWORD *)&v22.m31 = v12[6];
    *(_OWORD *)&v22.m33 = v13;
    v14 = v12[9];
    *(_OWORD *)&v22.m41 = v12[8];
    *(_OWORD *)&v22.m43 = v14;
    v15 = v12[3];
    *(_OWORD *)&v22.m11 = v12[2];
    *(_OWORD *)&v22.m13 = v15;
    v16 = v12[5];
    *(_OWORD *)&v22.m21 = v12[4];
    *(_OWORD *)&v22.m23 = v16;
    CATransform3DInvert(&v21, &v22);
    v17 = CA_CGPointApplyTransform(&v21, v9, v11);
    v19 = v18;
    v20 = v17;
    objc_msgSend(WeakRetained, "frame");
    objc_msgSend(WeakRetained, "setFrame:", v20, v19);
  }

}

void sub_10000C4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

NSUInteger sub_10000C520(_QWORD *a1, NSUInteger a2, NSUInteger a3, int a4, _BYTE *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double *v18;
  double MinY;
  double MidX;
  double MaxX;
  BOOL v22;
  double MinX;
  NSUInteger result;
  NSRange v25;
  NSRange v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32)))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) || (a4 & 1) != 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        v22 = a4 == 0;
      else
        v22 = 1;
      if (!v22)
      {
        MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
        v29.origin.x = a6;
        v29.origin.y = a7;
        v29.size.width = a8;
        v29.size.height = a9;
        if (MinX <= CGRectGetMidX(v29))
        {
          v30.origin.x = a6;
          v30.origin.y = a7;
          v30.size.width = a8;
          v30.size.height = a9;
          MidX = CGRectGetMidX(v30);
          MaxX = CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
LABEL_13:
          if (MidX <= MaxX)
          {
            v31.origin.x = a6;
            v31.origin.y = a7;
            v31.size.width = a8;
            v31.size.height = a9;
            *(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32), v31);
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
      MinY = CGRectGetMinY(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
      v27.origin.x = a6;
      v27.origin.y = a7;
      v27.size.width = a8;
      v27.size.height = a9;
      if (MinY <= CGRectGetMidY(v27))
      {
        v28.origin.x = a6;
        v28.origin.y = a7;
        v28.size.width = a8;
        v28.size.height = a9;
        MidX = CGRectGetMidY(v28);
        MaxX = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
        goto LABEL_13;
      }
    }
    *a5 = 1;
    goto LABEL_15;
  }
  v18 = *(double **)(a1[4] + 8);
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = a8;
  v18[7] = a9;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
LABEL_15:
  v26.location = a2;
  v26.length = a3;
  v25 = NSUnionRange(*(NSRange *)(*(_QWORD *)(a1[6] + 8) + 32), v26);
  result = v25.location;
  *(NSRange *)(*(_QWORD *)(a1[6] + 8) + 32) = v25;
  return result;
}

void sub_10000C7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[IUIRemoteSelectionRect rectWithCGRect:isVertical:](IUIRemoteSelectionRect, "rectWithCGRect:isVertical:", a4));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void sub_10000D5DC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.InputUI", "IUIRTIInputSource");
  v2 = (void *)qword_1000293C8;
  qword_1000293C8 = (uint64_t)v1;

}

void sub_10000D8A0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController"));
  objc_msgSend(v1, "_configureKey:domain:defaultValue:", CFSTR("InputUIWindowDebug"), CFSTR("com.apple.keyboard"), &__kCFBooleanFalse);

}

void sub_10000D8EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000601C((void *)&_mh_execute_header, a1, a3, "%s  Removed input source placeholder", a5, a6, a7, a8, 2u);
}

void sub_10000D960()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_100005FF0();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "endSessionID"));
  v2 = objc_msgSend((id)sub_100006010(), "sourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  sub_100005FB0();
  sub_100005FDC((void *)&_mh_execute_header, v5, v6, "%s  sessionChange's endSessionID: %@ does not match lastInputSource sourceSession ID: %@", v7, v8, v9, v10, 2u);

  sub_100005FCC();
}

void sub_10000DA08()
{
  void *v0;
  void *v1;
  __CFString *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_100005FF0();
  v2 = sub_1000058C0(v1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_100006010(), "outgoingInputSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_1000058C0(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100005FB0();
  sub_100005FFC((void *)&_mh_execute_header, v7, v8, "%s  existingDelegate: %@ does not match outgoingInputSource: %@", v9, v10, v11, v12, 2u);

  sub_100005FCC();
}

void sub_10000DAB0(void *a1, NSObject *a2)
{
  __CFString *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;

  v3 = sub_1000058C0(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 136315394;
  v6 = "-[IUISessionChangeAssistant handleTeardownExistingDelegate:]";
  v7 = 2112;
  v8 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s  Called with non-nil existingDelegate: %@ after handling outgoing input source", (uint8_t *)&v5, 0x16u);

}

void sub_10000DB58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000601C((void *)&_mh_execute_header, a1, a3, "%s  Installed an input source placeholder", a5, a6, a7, a8, 2u);
}

void sub_10000DBCC()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_100005FF0();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "beginSessionID"));
  v2 = objc_msgSend((id)sub_100006010(), "sourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  sub_100005FB0();
  sub_100005FDC((void *)&_mh_execute_header, v5, v6, "%s  sessionChange's beginSessionID (%@) does not match inputSource sourceSession ID (%@)", v7, v8, v9, v10, 2u);

  sub_100005FCC();
}

void sub_10000DC74()
{
  void *v0;
  void *v1;
  __CFString *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_100005FF0();
  v2 = sub_1000058C0(v1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_100006010(), "incomingInputSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_1000058C0(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100005FB0();
  sub_100005FFC((void *)&_mh_execute_header, v7, v8, "%s  newDelegate: %@ does not match incomingInputSource: %@", v9, v10, v11, v12, 2u);

  sub_100005FCC();
}

void sub_10000DD1C()
{
  void *v0;
  void *v1;
  __CFString *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_100005FF0();
  v2 = sub_1000058C0(v1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_100006010(), "sessionChangeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  sub_100005FB0();
  sub_100005FDC((void *)&_mh_execute_header, v6, v7, "%s  Called before handling outgoing input source (newDelegate: %@, sessionChange: %@)", v8, v9, v10, v11, 2u);

  sub_100005FCC();
}

void sub_10000DDC4()
{
  void *v0;
  void *v1;
  __CFString *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_100005FF0();
  v2 = sub_1000058C0(v1);
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_100006010(), "sessionChangeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  sub_100005FB0();
  sub_100005FDC((void *)&_mh_execute_header, v6, v7, "%s  Called again after handling incoming input source (newDelegate: %@, sessionChange: %@)", v8, v9, v10, v11, 2u);

  sub_100005FCC();
}

void sub_10000DE6C(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionChangeContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "outgoingInputSource"));
  v7 = sub_1000058C0(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "incomingInputSource"));
  v10 = sub_1000058C0(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = 136315906;
  v13 = "-[IUISessionChangeAssistant finalizeSessionChange]";
  v14 = 2112;
  v15 = v5;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v11;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s  Outgoing or incoming input source not handled during -become/resignFirstResponder for unknown reason: unknown. Handling now. (sessionChange: %@, outgoingInputSource: %@, incomingInputSource: %@)", (uint8_t *)&v12, 0x2Au);

}

void sub_10000DF98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B5B8((void *)&_mh_execute_header, a1, a3, "%s dropping payload: there is no current service session", a5, a6, a7, a8, 2u);
  sub_10000B598();
}

void sub_10000E008(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B5B8((void *)&_mh_execute_header, a1, a3, "%s returning nil: there is no current service session", a5, a6, a7, a8, 2u);
  sub_10000B598();
}

void sub_10000E078(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionChange"));
  sub_10000B5D4();
  sub_10000B534((void *)&_mh_execute_header, v2, v3, "%s  Session change does nothing (sessionChange=%@)", v4, v5, v6, v7, 2u);

}

void sub_10000E104()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_10000B5D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s  inputSource is not becoming first responder and lastInputSource is not resigning (sessionChange: %@)", (uint8_t *)v1, 0x16u);
  sub_10000B598();
}

void sub_10000E17C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "-[IUISessionCoordinator _main_handleSessionChange:]";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Nothing to do: change ends a session that is not current: %@", buf, 0x16u);

}

void sub_10000E1E4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "-[IUISessionCoordinator _main_handleSessionChange:]";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Ending currentSession: %@ as a side-effect of this sessionChange: %@", buf, 0x20u);

}

void sub_10000E258()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B5C8(__stack_chk_guard);
  sub_10000B570();
  sub_10000B560((void *)&_mh_execute_header, v0, v1, "(MAIN) did end session %@, service: %@", v2, v3, v4, v5, v6);
  sub_10000B598();
}

void sub_10000E2B8()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring inputSessionDocumentDidChange received for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B5C8(__stack_chk_guard);
  sub_10000B570();
  sub_10000B560((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document for session %@, service: %@", v2, v3, v4, v5, v6);
  sub_10000B598();
}

void sub_10000E3B4()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring documentTraitsDidChange received for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B5C8(__stack_chk_guard);
  sub_10000B570();
  sub_10000B560((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document traits for session %@, service: %@", v2, v3, v4, v5, v6);
  sub_10000B598();
}

void sub_10000E4B0()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring documentStateDidChange received for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E54C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B5C8(__stack_chk_guard);
  sub_10000B570();
  sub_10000B560((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document state for session %@, service: %@", v2, v3, v4, v5, v6);
  sub_10000B598();
}

void sub_10000E5AC()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring textSuggestionsChanged received for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E648()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring performInputOperation received for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E6E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000B5C8(__stack_chk_guard);
  sub_10000B570();
  sub_10000B560((void *)&_mh_execute_header, v0, v1, "(MAIN) did receive input operation from session %@, service: %@", v2, v3, v4, v5, v6);
  sub_10000B598();
}

void sub_10000E744()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_100005FF0();
  v2 = objc_msgSend((id)sub_10000B5A0(v1), "uuid");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000B5AC(), "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  sub_10000B548();
  sub_10000B534((void *)&_mh_execute_header, v6, v7, "Ignoring performInputOperation received with keyboardInput for sessionID=%@ while current sessionID=%@", v8, v9, v10, v11, v12);

  sub_10000B588();
}

void sub_10000E7E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B560((void *)&_mh_execute_header, a1, a3, "%s  endInputSession completion is %s", a5, a6, a7, a8, 2u);
  sub_10000B598();
}

void sub_10000E87C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user dir suffix", v1, 2u);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__changeHasNonUIKeyInputInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_changeHasNonUIKeyInputInputSource");
}

id objc_msgSend__configureKey_domain_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureKey:domain:defaultValue:");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contextId");
}

id objc_msgSend__endSession_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endSession:options:completion:");
}

id objc_msgSend__main_didTeardownExistingDelegateCallback_withSessionChangeAssistant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:");
}

id objc_msgSend__main_inputSourceForChangeContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_inputSourceForChangeContext:");
}

id objc_msgSend__main_placeholderInputSourceForSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_placeholderInputSourceForSession:");
}

id objc_msgSend__main_placeholderServiceSessionWithIdentifier_documentTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_placeholderServiceSessionWithIdentifier:documentTraits:");
}

id objc_msgSend__main_willSetupNewDelegateCallback_withSessionChangeAssistant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_willSetupNewDelegateCallback_withSessionChangeAssistant:");
}

id objc_msgSend__queue_queueSessionChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_queueSessionChange:");
}

id objc_msgSend__responseForCompletedChangeContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_responseForCompletedChangeContext:");
}

id objc_msgSend__setSafeAreaInsetsFrozen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSafeAreaInsetsFrozen:");
}

id objc_msgSend__useRTIInterfaceForAutoFillOnIphone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_useRTIInterfaceForAutoFillOnIphone");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activeKeyboardSceneDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeKeyboardSceneDelegate");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_additionalLocaleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalLocaleIdentifiers");
}

id objc_msgSend_animated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animated");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_assertionForOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionForOptions:");
}

id objc_msgSend_autofillUIServiceDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autofillUIServiceDelegate");
}

id objc_msgSend_autofillUIServiceQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autofillUIServiceQueue");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginSessionDocumentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSessionDocumentState");
}

id objc_msgSend_beginSessionDocumentTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSessionDocumentTraits");
}

id objc_msgSend_beginSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSessionID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completion");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_contextAfterInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextAfterInput");
}

id objc_msgSend_contextBeforeInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextBeforeInput");
}

id objc_msgSend_contextDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextDelegate");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextID");
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextId");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controller");
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

id objc_msgSend_currentDataPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDataPayload");
}

id objc_msgSend_currentServiceSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentServiceSession");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSession");
}

id objc_msgSend_dataTransportDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTransportDelegate");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeTextSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeTextSuggestions:");
}

id objc_msgSend_defaultTextInputTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTextInputTraits");
}

id objc_msgSend_delegateConformanceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateConformanceType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_disableAutomaticKeyboardUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAutomaticKeyboardUI");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_documentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentState");
}

id objc_msgSend_documentTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentTraits");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionID");
}

id objc_msgSend_enhancedWindowingModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enhancedWindowingModeEnabled");
}

id objc_msgSend_enumerateRectsWithOptions_range_granularity_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRectsWithOptions:range:granularity:block:");
}

id objc_msgSend_finalizeSessionChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeSessionChange");
}

id objc_msgSend_firstSelectionRectInWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstSelectionRectInWindow");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "greenColor");
}

id objc_msgSend_handlePendingSuggestionsDataIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePendingSuggestionsDataIfNecessary");
}

id objc_msgSend_handleSetupNewDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSetupNewDelegate:");
}

id objc_msgSend_handleTeardownExistingDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTeardownExistingDelegate:");
}

id objc_msgSend_handleTextActionPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTextActionPayload:");
}

id objc_msgSend_incomingInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingInputSource");
}

id objc_msgSend_ingestDataPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestDataPayload:");
}

id objc_msgSend_ingestDocumentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestDocumentState:");
}

id objc_msgSend_ingestDocumentTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestDocumentTraits:");
}

id objc_msgSend_initBeginSession_withID_documentTraits_documentState_andEndSessionWithID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initBeginSession:withID:documentTraits:documentState:andEndSessionWithID:options:");
}

id objc_msgSend_initBeginSessionWithID_documentTraits_documentState_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initBeginSessionWithID:documentTraits:documentState:options:");
}

id objc_msgSend_initDefaultServiceWithServiceQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDefaultServiceWithServiceQueue:");
}

id objc_msgSend_initEndSessionWithID_andBeginPlaceholderSessionWithID_documentTraits_documentState_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initEndSessionWithID:andBeginPlaceholderSessionWithID:documentTraits:documentState:options:");
}

id objc_msgSend_initEndSessionWithID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initEndSessionWithID:options:");
}

id objc_msgSend_initWithCGRect_isVertical_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCGRect:isVertical:");
}

id objc_msgSend_initWithController_sessionChangeContext_outgoingInputSource_incomingInputSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithController:sessionChangeContext:outgoingInputSource:incomingInputSource:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_pid_contextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:pid:contextID:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithResponseState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseState:");
}

id objc_msgSend_initWithService_session_sessionChange_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:session:sessionChange:completion:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_inputDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputDelegate");
}

id objc_msgSend_inputSession_didAddRTISupplementalLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSession:didAddRTISupplementalLexicon:");
}

id objc_msgSend_inputSession_didRemoveRTISupplementalLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSession:didRemoveRTISupplementalLexicon:");
}

id objc_msgSend_inputSession_performInputOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSession:performInputOperation:");
}

id objc_msgSend_inputSession_performInputOperation_withResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSession:performInputOperation:withResponse:");
}

id objc_msgSend_inputSource_didGenerateTextActionPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSource:didGenerateTextActionPayload:");
}

id objc_msgSend_inputSourceViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSourceViewController");
}

id objc_msgSend_inputSystemService_didCreateInputSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:didCreateInputSession:");
}

id objc_msgSend_inputSystemService_inputSession_didAddRTISupplementalLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:didAddRTISupplementalLexicon:");
}

id objc_msgSend_inputSystemService_inputSession_didRemoveRTISupplementalLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:didRemoveRTISupplementalLexicon:");
}

id objc_msgSend_inputSystemService_inputSession_documentStateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:documentStateDidChange:");
}

id objc_msgSend_inputSystemService_inputSession_documentTraitsDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:documentTraitsDidChange:");
}

id objc_msgSend_inputSystemService_inputSession_performInputOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:performInputOperation:");
}

id objc_msgSend_inputSystemService_inputSession_performInputOperation_withResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:performInputOperation:withResponse:");
}

id objc_msgSend_inputSystemService_inputSession_textSuggestionsChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSession:textSuggestionsChanged:");
}

id objc_msgSend_inputSystemService_inputSessionDidBegin_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDidBegin:options:");
}

id objc_msgSend_inputSystemService_inputSessionDidDie_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDidDie:");
}

id objc_msgSend_inputSystemService_inputSessionDidEnd_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDidEnd:options:");
}

id objc_msgSend_inputSystemService_inputSessionDidPause_withReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDidPause:withReason:");
}

id objc_msgSend_inputSystemService_inputSessionDidUnpause_withReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDidUnpause:withReason:");
}

id objc_msgSend_inputSystemService_inputSessionDocumentDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:inputSessionDocumentDidChange:");
}

id objc_msgSend_inputSystemService_prepareForInputSession_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSystemService:prepareForInputSession:options:");
}

id objc_msgSend_inputUIOOP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputUIOOP");
}

id objc_msgSend_inputViewInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputViewInfo");
}

id objc_msgSend_insets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insets");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAssertionIfNeeded_resetKeyboardAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAssertionIfNeeded:resetKeyboardAlpha:");
}

id objc_msgSend_isBeginningSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBeginningSession");
}

id objc_msgSend_isEndingSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEndingSession");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isServicePaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePaused");
}

id objc_msgSend_keyboardInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardInput");
}

id objc_msgSend_keyboardSceneDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardSceneDelegate");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layerID");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_markedText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markedText");
}

id objc_msgSend_matchInputDestinationFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchInputDestinationFrame");
}

id objc_msgSend_needsToReloadInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsToReloadInputSource");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_offscreenDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offscreenDirection");
}

id objc_msgSend_offsetFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetFromPosition:toPosition:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_outgoingInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingInputSource");
}

id objc_msgSend_overlayWithTITextInputTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayWithTITextInputTraits:");
}

id objc_msgSend_pauseTextInputService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseTextInputService");
}

id objc_msgSend_payloadDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadDelegate");
}

id objc_msgSend_payloadWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadWithData:");
}

id objc_msgSend_pendingSuggestions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingSuggestions");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_placeholderServiceSessionWithIdentifier_traits_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderServiceSessionWithIdentifier:traits:state:");
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionFromPosition:offset:");
}

id objc_msgSend_primaryDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryDelegate");
}

id objc_msgSend_processId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processId");
}

id objc_msgSend_rangeInDocumentState_fromTextRange_inUITextInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeInDocumentState:fromTextRange:inUITextInput:");
}

id objc_msgSend_rectWithCGRect_isVertical_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectWithCGRect:isVertical:");
}

id objc_msgSend_reloadInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadInputSource");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestAnimationAssertionWithDirection_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAnimationAssertionWithDirection:animated:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resumeTextInputService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeTextInputService");
}

id objc_msgSend_returnExecutionToParent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnExecutionToParent");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rtiService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rtiService");
}

id objc_msgSend_selectedRangeInMarkedText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedRangeInMarkedText");
}

id objc_msgSend_selectedText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedText");
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedTextRange");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_servicePausedLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicePausedLock");
}

id objc_msgSend_serviceSessionPayloadDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSessionPayloadDelegate");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionChange");
}

id objc_msgSend_sessionChangeContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionChangeContext");
}

id objc_msgSend_sessionCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionCoordinator");
}

id objc_msgSend_sessionCoordinatorQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionCoordinatorQueue");
}

id objc_msgSend_setAllowsHitTesting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsHitTesting:");
}

id objc_msgSend_setAutofillContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutofillContext:");
}

id objc_msgSend_setAutofillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutofillMode:");
}

id objc_msgSend_setAutofillSubMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutofillSubMode:");
}

id objc_msgSend_setAutofillUIServiceQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutofillUIServiceQueue:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCanBecomeFirstResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanBecomeFirstResponder:");
}

id objc_msgSend_setContextDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextDelegate:");
}

id objc_msgSend_setCurrentSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSession:");
}

id objc_msgSend_setDataTransportDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataTransportDelegate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidTeardownExistingDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidTeardownExistingDelegate:");
}

id objc_msgSend_setDocumentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDocumentState:");
}

id objc_msgSend_setDocumentTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDocumentTraits:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInputSourceViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputSourceViewController:");
}

id objc_msgSend_setKeyboardAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardAlpha:");
}

id objc_msgSend_setKeyboardContainerVC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardContainerVC:");
}

id objc_msgSend_setNeedsToReloadInputSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToReloadInputSource:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPayloadDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadDelegate:");
}

id objc_msgSend_setPendingSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingSuggestions:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPrimaryDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryDelegate:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServicePaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServicePaused:");
}

id objc_msgSend_setSessionCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionCoordinator:");
}

id objc_msgSend_setSessionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionUUID:");
}

id objc_msgSend_setShouldResign_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldResign:");
}

id objc_msgSend_setShouldShowDockView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowDockView:");
}

id objc_msgSend_setSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuggestions:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextInputSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextInputSource:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWillSetupNewDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWillSetupNewDelegate:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferencesController");
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedServer");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedServiceWithDomainName_serviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedServiceWithDomainName:serviceName:");
}

id objc_msgSend_shouldResign(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldResign");
}

id objc_msgSend_shouldShowDockView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowDockView");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sourceSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceSession");
}

id objc_msgSend_sourceSessionDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceSessionDelegate");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsAutoFillPanel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsAutoFillPanel");
}

id objc_msgSend_systemDelegateMultiplexer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemDelegateMultiplexer");
}

id objc_msgSend_takeTraitsFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeTraitsFrom:");
}

id objc_msgSend_textInputContextIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textInputContextIdentifier");
}

id objc_msgSend_textInputModeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textInputModeData");
}

id objc_msgSend_textInputSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textInputSource");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textInputTraits");
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_updateData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateData");
}

id objc_msgSend_usingEndInputSessionCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usingEndInputSessionCompletion");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForPreferenceKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForPreferenceKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

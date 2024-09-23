uint64_t sub_100002CB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002F58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = _FALogSystem(v4, v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000032D8(v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "followupItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
    +[FAFollowupManager tearDownFollowupItemWithIdentifier:completion:](FAFollowupManager, "tearDownFollowupItemWithIdentifier:completion:", v11, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishProcessing");

}

void sub_1000031BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000031DC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No url, urlKey/idmsData or AKAction found.", v1, 2u);
}

void sub_10000321C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_1000031BC((void *)&_mh_execute_header, v2, v3, "Failed to open URL with error: %@", v4, v5, v6, v7, 2u);

  sub_1000031D0();
}

void sub_100003298(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "urlKey must not be nil to continue loading famlily circle UI.", v1, 2u);
}

void sub_1000032D8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_1000031BC((void *)&_mh_execute_header, v2, v3, "Failed to load remoteUI with error: %@", v4, v5, v6, v7, 2u);

  sub_1000031D0();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__beginLoadingFamilyCircleUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginLoadingFamilyCircleUI");
}

id objc_msgSend__urlEndpointForFollowpItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlEndpointForFollowpItem");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_akAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "akAction");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishProcessing");
}

id objc_msgSend_followupItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "followupItem");
}

id objc_msgSend_handleAKAction_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAKAction:completion:");
}

id objc_msgSend_handleActionWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleActionWithURL:");
}

id objc_msgSend_handleActionWithURLKey_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleActionWithURLKey:completion:");
}

id objc_msgSend_initWithEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:");
}

id objc_msgSend_initWithPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresenter:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_performOperationWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performOperationWithContext:completion:");
}

id objc_msgSend_setAdditionalParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalParameters:");
}

id objc_msgSend_setAkAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAkAction:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setIdmsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdmsData:");
}

id objc_msgSend_setItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemIdentifier:");
}

id objc_msgSend_setUrlEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrlEndpoint:");
}

id objc_msgSend_tearDownFollowupItemWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownFollowupItemWithIdentifier:completion:");
}

id objc_msgSend_teardownFollowUpWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownFollowUpWithContext:completion:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

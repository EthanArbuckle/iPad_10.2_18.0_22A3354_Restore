id sub_10000264C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForZKWBrowser");
}

void sub_100002A0C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error inserting attachment to current coversation %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "requestPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_addResultToRecents:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;

}

id sub_100002AE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestPresentationStyle:", 0);
}

void sub_100002AEC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v2, "didEngageResult:", *(_QWORD *)(a1 + 32));

}

void sub_100002B30(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "engagementFeedbackBlock"));

  if (v3)
  {
    v5 = objc_loadWeakRetained(v1);
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "engagementFeedbackBlock"));
    v4[2]();

  }
}

id sub_100002C98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForSearchBrowser");
}

void sub_100002CA0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPresentationStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchHeaderView"));
  objc_msgSend(v2, "invalidateIntrinsicContentSize");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "view"));
  objc_msgSend(v3, "setNeedsLayout");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v4, "searchViewDidAppearWithEvent:", 21);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchHeaderView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  objc_msgSend(v5, "becomeFirstResponder");

}

id sub_100002E04(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));
  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[2];
  v6 = v4[4];
  v8[4] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002ECC;
  v9[3] = &unk_100008280;
  v9[4] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002ED4;
  v8[3] = &unk_100008280;
  return objc_msgSend(v4, "_transitionContentFromViewController:toViewController:animations:completion:", v5, v6, v9, v8);
}

id sub_100002ECC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForSearchBrowser");
}

void sub_100002ED4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v2, "searchViewDidAppearWithEvent:", 20);

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "searchHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  objc_msgSend(v3, "becomeFirstResponder");

}

void sub_100003020(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  v4 = v2[4];
  v6[4] = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000030D0;
  v7[3] = &unk_100008280;
  v7[4] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000030D8;
  v6[3] = &unk_100008280;
  objc_msgSend(v2, "_transitionContentFromViewController:toViewController:animations:completion:", v3, v4, v7, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v5, "didEngageResult:", *(_QWORD *)(a1 + 40));

}

id sub_1000030D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForSearchBrowser");
}

void sub_1000030D8(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pickerViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pickerView"));
  objc_msgSend(v1, "setNeedsLayout");

}

void sub_100003200(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  v4 = v2[4];
  v6[4] = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000032B0;
  v7[3] = &unk_100008280;
  v7[4] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000032B8;
  v6[3] = &unk_100008280;
  objc_msgSend(v2, "_transitionContentFromViewController:toViewController:animations:completion:", v3, v4, v7, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance"));
  objc_msgSend(v5, "didSearchWithSuggestedQuery:", *(_QWORD *)(a1 + 40));

}

id sub_1000032B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForSearchBrowser");
}

void sub_1000032B8(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pickerViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pickerView"));
  objc_msgSend(v1, "setNeedsLayout");

}

id sub_100003644(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[4];
  v3 = v1[2];
  v5[4] = v1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000036C8;
  v6[3] = &unk_100008280;
  v6[4] = v1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000036D0;
  v5[3] = &unk_100008280;
  return objc_msgSend(v1, "_transitionContentFromViewController:toViewController:animations:completion:", v2, v3, v6, v5);
}

id sub_1000036C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForZKWBrowser");
}

id sub_1000036D0(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clear");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enableSearchButton");
}

id sub_100003708(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForZKWBrowser");
}

id sub_100003710(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "clear");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enableSearchButton");
}

void sub_100003808(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003870;
  block[3] = &unk_100008280;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100003870(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));
  v4 = objc_msgSend(v3, "isFirstResponder");

  if ((v4 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchHeaderView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

uint64_t sub_100003B7C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "view"));
  objc_msgSend(v2, "setContentView:", v3);

  objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000041A8(_Unwind_Exception *a1, int a2)
{
  id v2;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100004D50((uint64_t)v2);
    objc_end_catch();
    JUMPOUT(0x100004148);
  }
  _Unwind_Resume(a1);
}

id sub_1000041F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConstraintsForZKWBrowser");
}

void sub_100004200(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchResultForDict:", a2));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

BOOL sub_100004418(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v6 = objc_msgSend(v4, "caseInsensitiveCompare:", v5) == 0;
  return v6;
}

void sub_100004558(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dictForSearchResult:", a2));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void sub_100004D50(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error loading recents %@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__addResultToRecents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addResultToRecents:");
}

id objc_msgSend__insertAttachment_adamID_appName_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_insertAttachment:adamID:appName:completionHandler:");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setup");
}

id objc_msgSend__transitionContentFromViewController_toViewController_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionContentFromViewController:toViewController:animations:completion:");
}

id objc_msgSend__updatePickerBottomInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePickerBottomInset");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cancelImageDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelImageDownloads");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clear");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_conversationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationIdentifier");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_dictForSearchResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictForSearchResult:");
}

id objc_msgSend_didEngageProviderLogo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEngageProviderLogo");
}

id objc_msgSend_didEngageResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEngageResult:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didSearchWithSuggestedQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSearchWithSuggestedQuery:");
}

id objc_msgSend_engagementFeedbackBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engagementFeedbackBlock");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fetchCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCategories");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURL");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithId_userAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithId:userAgent:");
}

id objc_msgSend_initWithSearchModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchModel:");
}

id objc_msgSend_initWithSearchModel_showSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchModel:showSuggestions:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertText_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertText:completionHandler:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateIntrinsicContentSize");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isPencilInputExpected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPencilInputExpected");
}

id objc_msgSend_isPickerVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPickerVisible");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:completionHandler:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_performZKWSearchQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performZKWSearchQuery");
}

id objc_msgSend_performZKWSearchQueryWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performZKWSearchQueryWithCompletion:");
}

id objc_msgSend_pickerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickerView");
}

id objc_msgSend_pickerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickerViewController");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationStyle");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_requestExpandedCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestExpandedCompletion");
}

id objc_msgSend_requestExpandedPresentationStyleForBrowser_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestExpandedPresentationStyleForBrowser:completion:");
}

id objc_msgSend_requestPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPresentationStyle:");
}

id objc_msgSend_resetContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetContent");
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultType");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_saveRecents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRecents");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchBar");
}

id objc_msgSend_searchHeaderView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchHeaderView");
}

id objc_msgSend_searchResultForDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchResultForDict:");
}

id objc_msgSend_searchViewDidAppearWithEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidAppearWithEvent:");
}

id objc_msgSend_searchViewDidDisappear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchViewDidDisappear");
}

id objc_msgSend_secondaryTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryTitle");
}

id objc_msgSend_sessionWithConfiguration_delegate_startImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:startImmediately:");
}

id objc_msgSend_setBottomInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomInset:");
}

id objc_msgSend_setCardSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCardSections:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setConversationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConversationID:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDontPreloadImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDontPreloadImages:");
}

id objc_msgSend_setEngagementFeedbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEngagementFeedbackBlock:");
}

id objc_msgSend_setFbr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFbr:");
}

id objc_msgSend_setHeaderView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderView:");
}

id objc_msgSend_setHostPageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostPageURL:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInlineCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInlineCard:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setParsecSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParsecSession:");
}

id objc_msgSend_setPickerSelectionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPickerSelectionDelegate:");
}

id objc_msgSend_setPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationStyle:");
}

id objc_msgSend_setPunchout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPunchout:");
}

id objc_msgSend_setRecentResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecentResults:");
}

id objc_msgSend_setRecentsDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecentsDelegate:");
}

id objc_msgSend_setRequestExpandedCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestExpandedCompletion:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setSectionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionBundleIdentifier:");
}

id objc_msgSend_setSelectionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionDelegate:");
}

id objc_msgSend_setStoreIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreIdentifier:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbnail:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTopInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopInset:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCategories");
}

id objc_msgSend_showPickerAndPerformQuery_requestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPickerAndPerformQuery:requestType:");
}

id objc_msgSend_snapshotImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotImage");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeIdentifier");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_sts_appProviderName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sts_appProviderName");
}

id objc_msgSend_sts_providerHostPageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sts_providerHostPageURL");
}

id objc_msgSend_sts_providerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sts_providerName");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_thumbnail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnail");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_transitionFromViewController_toViewController_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_urlValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlValue");
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoURL");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_willResignActiveWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willResignActiveWithConversation:");
}

id objc_msgSend_willTransitionToPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willTransitionToPresentationStyle:");
}

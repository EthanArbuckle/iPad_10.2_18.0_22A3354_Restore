void sub_1000023A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000023B8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  unsigned int v22;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsAnimatedScrolling:", 1);

  v4 = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v4, "page");

  v6 = objc_loadWeakRetained(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));
  objc_msgSend(v7, "frame");
  v9 = v8;

  v10 = objc_loadWeakRetained(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v11, "contentOffset");
  v13 = (int)(floor((v12 + v9 * -0.5) / v9) + 1.0);
  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "setPage:", v13);

  v15 = objc_loadWeakRetained(v2);
  LODWORD(v11) = objc_msgSend(v15, "page");

  if ((_DWORD)v11 != v5)
  {
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_10000255C;
    v20 = &unk_10000C2D8;
    v22 = v5;
    objc_copyWeak(&v21, v2);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v17);
    v16 = objc_loadWeakRetained(v2);
    objc_msgSend(v16, "handleViewDidScroll:", *(_QWORD *)(a1 + 32), v17, v18, v19, v20);

    objc_destroyWeak(&v21);
  }
}

void sub_100002548(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000255C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id *v4;
  id WeakRetained;
  signed int v6;
  _DWORD *v7;
  signed int v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v2 = DiagnosticLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100006B58(a1, v3);

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "page");
  v8 = *(_DWORD *)(a1 + 40);
  v7 = (_DWORD *)(a1 + 40);
  v9 = objc_loadWeakRetained(v4);
  v10 = v9;
  if (v6 <= v8)
    objc_msgSend(v9, "moveLeading");
  else
    objc_msgSend(v9, "moveTrailing");

  v11 = DiagnosticLogHandleForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100006A44(v7, v4, v12);

}

void sub_1000026F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002704(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAnimatedScrolling:", 0);

}

id sub_100003040()
{
  id *v0;

  return objc_loadWeakRetained(v0);
}

void sub_100003064(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_log_t log, uint64_t a12, uint8_t buf)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, &buf, 0x2Cu);
}

void sub_100003DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003E30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003E40(uint64_t a1)
{

}

void sub_100003E48(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;

  v3 = a2;
  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got asset data for [%@]", (uint8_t *)&v10, 0xCu);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100004130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004144(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAnimatedScrolling:", 0);

}

void sub_10000466C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004698(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  _UNKNOWN **v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "allResults"));
  v4 = objc_msgSend(v3, "count");

  v5 = objc_loadWeakRetained(v1);
  v7 = v5;
  if (v4)
    v6 = &off_10000C7E8;
  else
    v6 = &off_10000C800;
  objc_msgSend(v5, "endTestWithStatusCode:", v6);

}

id sub_1000055E0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeResultWithTag:", objc_msgSend(*(id *)(a1 + 32), "tag"));
}

void sub_100005614(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

id sub_100005B18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "hideBrightnessIndicator", 0, 1.0);
}

void sub_100006A44(_DWORD *a1, id *location, os_log_t log)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  id v20;
  uint8_t v21;

  HIDWORD(v17) = *a1;
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(WeakRetained, "page");
  v3 = sub_100003040();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingImageViews"));
  objc_msgSend(v4, "count");
  v5 = sub_100003040();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingImageViews"));
  objc_msgSend(v6, "count");
  v7 = sub_100003040();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
  sub_100003004();
  sub_100003064((void *)&_mh_execute_header, v10, v11, "END PAGE (%d) -> (%d) = Leading (%lu), Trailing (%lu), Current (%@)", v12, v13, v14, v15, v16, v17, log, (uint64_t)WeakRetained, v21);

  sub_100003048();
}

void sub_100006B58(uint64_t a1, os_log_t log)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  uint8_t v20;

  HIDWORD(v16) = *(_DWORD *)(a1 + 40);
  v18 = sub_100003040();
  objc_msgSend(v18, "page");
  v2 = sub_100003040();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leadingImageViews"));
  objc_msgSend(v3, "count");
  v4 = sub_100003040();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingImageViews"));
  objc_msgSend(v5, "count");
  v6 = sub_100003040();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  sub_100003004();
  sub_100003064((void *)&_mh_execute_header, v9, v10, "BGN PAGE (%d) -> (%d) = Leading (%lu), Trailing (%lu), Current (%@)", v11, v12, v13, v14, v15, v16, log, (uint64_t)v18, v20);

  sub_100003048();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_adaptationClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adaptationClient");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addPanGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPanGesture");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTapGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTapGesture");
}

id objc_msgSend_addedRectangleView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedRectangleView");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_animateToBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateToBrightness:");
}

id objc_msgSend_animatedScrollingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animatedScrollingQueue");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_assetName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetName");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blueLightClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueLightClient");
}

id objc_msgSend_blueLightStatusActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueLightStatusActive");
}

id objc_msgSend_borderViewBlack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "borderViewBlack");
}

id objc_msgSend_borderViewWhite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "borderViewWhite");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_brightnessAdjustable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessAdjustable");
}

id objc_msgSend_brightnessIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnessIndicator");
}

id objc_msgSend_cancelTimerForHideBrightnessIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTimerForHideBrightnessIndicator");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_colorAdaptationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorAdaptationStatus");
}

id objc_msgSend_colorWithHexValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithHexValue:error:");
}

id objc_msgSend_confirmPageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmPageView");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentOffset");
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

id objc_msgSend_currentImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentImageView");
}

id objc_msgSend_currentPanType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPanType");
}

id objc_msgSend_currentTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTag");
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticResponder");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didUpdateCurrentImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUpdateCurrentImageView:");
}

id objc_msgSend_disableAdaptationAndBlueLightReduction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAdaptationAndBlueLightReduction");
}

id objc_msgSend_disableAmbientLightAdaptation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAmbientLightAdaptation");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_BOOLFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromRequiredKey:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawBrightnessIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawBrightnessIndicator");
}

id objc_msgSend_drawColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawColor");
}

id objc_msgSend_drawableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawableView");
}

id objc_msgSend_drawingOverlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingOverlay");
}

id objc_msgSend_endDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDrawing");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "file");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frameForConfirmation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForConfirmation");
}

id objc_msgSend_frameForPage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForPage:");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getBlueLightStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBlueLightStatus:");
}

id objc_msgSend_getEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnabled");
}

id objc_msgSend_handleViewDidEndDecelerating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleViewDidEndDecelerating:");
}

id objc_msgSend_handleViewDidScroll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleViewDidScroll:");
}

id objc_msgSend_hideBrightnessIndicatorWithDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideBrightnessIndicatorWithDelay");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageFileNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageFileNames");
}

id objc_msgSend_imageViewForPage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageViewForPage:");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_rectangleFillColor_rectangleEdgeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:rectangleFillColor:rectangleEdgeColor:");
}

id objc_msgSend_initWithFrame_title_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:title:style:");
}

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressViewStyle:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isAnimatedScrolling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnimatedScrolling");
}

id objc_msgSend_isDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDrawing");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isGestureEnded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGestureEnded:");
}

id objc_msgSend_labelForConfirmation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelForConfirmation");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingImageViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingImageViews");
}

id objc_msgSend_loadLeading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadLeading");
}

id objc_msgSend_loadTrailing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrailing");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_maxNumPages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNumPages");
}

id objc_msgSend_minimumSquareLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumSquareLength");
}

id objc_msgSend_moveLeading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveLeading");
}

id objc_msgSend_moveTrailing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveTrailing");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfTouches");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_originPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originPoint");
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalScreenBrightness");
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "page");
}

id objc_msgSend_panGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGesture");
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGestureRecognizer");
}

id objc_msgSend_parseResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseResults");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_randomizeImageOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "randomizeImageOrder");
}

id objc_msgSend_rectangle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangle");
}

id objc_msgSend_rectangleEdgeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleEdgeColor");
}

id objc_msgSend_rectangleFillColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleFillColor");
}

id objc_msgSend_rectangleWithFrame_borderColor_fillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleWithFrame:borderColor:fillColor:");
}

id objc_msgSend_rectangleWithFrame_borderColor_fillColor_borderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleWithFrame:borderColor:fillColor:borderWidth:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resetBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetBrightness");
}

id objc_msgSend_resetBrightnessOnChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetBrightnessOnChange");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_saveAndMaximizeBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAndMaximizeBrightness");
}

id objc_msgSend_saveColorAdjustmentStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveColorAdjustmentStates");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollView");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdaptationClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdaptationClient:");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setAnimatedScrollingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimatedScrollingQueue:");
}

id objc_msgSend_setAssetName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetName:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlueLightClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlueLightClient:");
}

id objc_msgSend_setBlueLightStatusActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlueLightStatusActive:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderViewBlack_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderViewBlack:");
}

id objc_msgSend_setBorderViewWhite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderViewWhite:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBrightnessAdjustable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessAdjustable:");
}

id objc_msgSend_setBrightnessIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightnessIndicator:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonTitle:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setColorAdaptationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorAdaptationStatus:");
}

id objc_msgSend_setConfirmPageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfirmPageView:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setCurrentImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentImageView:");
}

id objc_msgSend_setCurrentPanType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPanType:");
}

id objc_msgSend_setCurrentTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTag:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiagnosticResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticResponder:");
}

id objc_msgSend_setDisableAmbientLightAdaptation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableAmbientLightAdaptation:");
}

id objc_msgSend_setDrawColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawColor:");
}

id objc_msgSend_setDrawableView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawableView:");
}

id objc_msgSend_setDrawingOverlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawingOverlay:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFile:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageFileNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageFileNames:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsAnimatedScrolling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAnimatedScrolling:");
}

id objc_msgSend_setIsDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDrawing:");
}

id objc_msgSend_setLeadingImageViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeadingImageViews:");
}

id objc_msgSend_setMaximumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumNumberOfTouches:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMinimumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumNumberOfTouches:");
}

id objc_msgSend_setMinimumSquareLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumSquareLength:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setOriginPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginPoint:");
}

id objc_msgSend_setOriginalScreenBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalScreenBrightness:");
}

id objc_msgSend_setPage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPage:");
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPagingEnabled:");
}

id objc_msgSend_setPanGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanGesture:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressTintColor:");
}

id objc_msgSend_setRandomizeImageOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRandomizeImageOrder:");
}

id objc_msgSend_setRectangle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRectangle:");
}

id objc_msgSend_setResetBrightnessOnChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResetBrightnessOnChange:");
}

id objc_msgSend_setScreenToBrightness_animate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenToBrightness:animate:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollView:");
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollsToTop:");
}

id objc_msgSend_setShapeView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShapeView:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTapGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapGesture:");
}

id objc_msgSend_setTestImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestImages:");
}

id objc_msgSend_setTrackTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackTintColor:");
}

id objc_msgSend_setTrailingImageViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingImageViews:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_shapeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shapeView");
}

id objc_msgSend_shuffleImageOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shuffleImageOrder");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag");
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapGesture");
}

id objc_msgSend_testImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testImages");
}

id objc_msgSend_trailingImageViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingImageViews");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transform");
}

id objc_msgSend_unloadLeading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadLeading");
}

id objc_msgSend_unloadTrailing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadTrailing");
}

id objc_msgSend_updateBrightnessIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBrightnessIndicator:");
}

id objc_msgSend_updateDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDrawing:");
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "velocityInView:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

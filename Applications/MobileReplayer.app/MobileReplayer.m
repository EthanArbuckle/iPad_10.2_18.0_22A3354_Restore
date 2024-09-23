uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  setenv("MTL_TRACING_ENABLE_RESOURCE_RESOLUTION", "1", 1);
  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, CFSTR("MRAppDelegateiOS"));
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_10000201C(id a1)
{
  MRReplayController *v1;
  void *v2;

  v1 = objc_opt_new(MRReplayController);
  v2 = (void *)qword_10000D420;
  qword_10000D420 = (uint64_t)v1;

}

void sub_100002190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1000023AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000024CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100002C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  void *v43;
  id *v44;
  void *v45;
  uint64_t v46;

  objc_destroyWeak(v44);
  objc_destroyWeak((id *)(v46 - 200));

  _Unwind_Resume(a1);
}

void sub_100002E24(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v10 = WeakRetained;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfiler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startShaderProfiler:", v4));

  objc_msgSend(v5, "waitUntilResolved");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transport"));
  v7 = objc_msgSend(*(id *)(a1 + 48), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", v7, v8));
  objc_msgSend(v6, "send:inReplyTo:error:", v9, *(_QWORD *)(a1 + 48), 0);

}

void sub_100002F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t sub_100002F58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002F68(uint64_t a1)
{

}

void sub_100002F70(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfiler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "batchedCounterDataForShaderProfiler:", v4));

  global_queue = dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003074;
  v9[3] = &unk_100008340;
  v10 = v5;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = v5;
  objc_msgSend(v8, "notifyOnQueue:handler:", v7, v9);

}

void sub_100003044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_100003074(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), kDYBatchFilteredCounterProgress);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", 4123, v4));
  objc_msgSend(v2, "send:inReplyTo:error:", v3, 0, 0);

}

void sub_100003110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100003140(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  void *v9;
  id v10;
  id v11;
  int8x16_t v12;
  _QWORD v13[4];
  int8x16_t v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfiler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("highPriorityBatches")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "batchedCounterDataForShaderProfiler:forHighPriorityBatches:", v4, v6));

  global_queue = dispatch_get_global_queue(0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000032B4;
  v13[3] = &unk_100008390;
  v12 = *(int8x16_t *)(a1 + 40);
  v10 = (id)v12.i64[0];
  v14 = vextq_s8(v12, v12, 8uLL);
  v15 = v7;
  v11 = v7;
  objc_msgSend(v11, "notifyOnQueue:handler:", v9, v13);

}

void sub_100003268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1000032B4(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "transport"));
  v2 = objc_msgSend(a1[5], "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", v2, v3));
  objc_msgSend(v5, "send:inReplyTo:error:", v4, a1[5], 0);

}

void sub_10000334C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100003378(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v10 = WeakRetained;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shaderProfiler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "derivedCounterDataForFrameProfiler:", v4));

  objc_msgSend(v5, "waitUntilResolved");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "transport"));
  v7 = objc_msgSend(*(id *)(a1 + 48), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", v7, v8));
  objc_msgSend(v6, "send:inReplyTo:error:", v9, *(_QWORD *)(a1 + 48), 0);

}

void sub_10000345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_100003634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000366C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "strongDelegate"));
  objc_msgSend(v2, "setViewController:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

}

void sub_1000036B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000036C8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
    objc_msgSend(v9, "setImage:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = objc_alloc_init((Class)UIViewController);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v9 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v9, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "bounds");
    objc_msgSend(v9, "setFrame:");

    objc_msgSend(v9, "setContentMode:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setView:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "strongDelegate"));
    objc_msgSend(v8, "setViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
}

void sub_1000037DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100003A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id sub_100003B08(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "archiveStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_replayerControllerSupportForCaptureStore:", v3));
  objc_msgSend(*(id *)(a1 + 32), "setReplayControllerSupport:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "replayControllerSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "archiveStack"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createDebugPlaybackEngineWithCaptureStore:", v6));
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackEngine:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "_displayPlaybackEngine");
}

void sub_100003BB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003F24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100004030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_100004160((uint64_t)&a9);

  _Unwind_Resume(a1);
}

uint64_t sub_100004098(uint64_t a1, int a2, char a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  *(_QWORD *)(a1 + 8) = objc_claimAutoreleasedReturnValue(+[CATransaction animationTimingFunction](CATransaction, "animationTimingFunction"));
  +[CATransaction animationDuration](CATransaction, "animationDuration");
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = +[CATransaction disableActions](CATransaction, "disableActions");
  *(_BYTE *)(a1 + 33) = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATransaction completionBlock](CATransaction, "completionBlock"));
  v8 = objc_msgSend(v7, "copy");
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;

  if (a2)
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  return a1;
}

void sub_100004130(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_100004160(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 33))
    +[CATransaction flush](CATransaction, "flush");
  v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v2);

  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", *(double *)(a1 + 16));
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", *(_QWORD *)(a1 + 24));
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", *(unsigned __int8 *)(a1 + 32));

  return a1;
}

void sub_1000041F4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100004248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MRAppDelegate;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100004494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id objc_msgSend__closeInterposeDylib(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeInterposeDylib");
}

id objc_msgSend__replayerControllerSupportForCaptureStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replayerControllerSupportForCaptureStore:");
}

id objc_msgSend__updateBackgroundImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBackgroundImage:");
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationDuration");
}

id objc_msgSend_animationTimingFunction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationTimingFunction");
}

id objc_msgSend_archiveStack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveStack");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_availableCountersForFrameProfiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableCountersForFrameProfiler:");
}

id objc_msgSend_batchedCounterDataForShaderProfiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batchedCounterDataForShaderProfiler:");
}

id objc_msgSend_batchedCounterDataForShaderProfiler_forHighPriorityBatches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batchedCounterDataForShaderProfiler:forHighPriorityBatches:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clear");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
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

id objc_msgSend_createDebugPlaybackEngineWithCaptureStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDebugPlaybackEngineWithCaptureStore:");
}

id objc_msgSend_derivedCounterDataForFrameProfiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "derivedCounterDataForFrameProfiler:");
}

id objc_msgSend_disableActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableActions");
}

id objc_msgSend_empty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "empty");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_extensionsForSlot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsForSlot:");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_informReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "informReady");
}

id objc_msgSend_initWithBundle_includeDeveloperDirectory_includeBundleDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundle:includeDeveloperDirectory:includeBundleDirectory:");
}

id objc_msgSend_initWithCaptureStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureStore:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initializeTransportWith_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeTransportWith:");
}

id objc_msgSend_isDebugPlaybackEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDebugPlaybackEngine:");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kind");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_loadPluginsWithProvider_pathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPluginsWithProvider:pathExtension:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_messageWithKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:");
}

id objc_msgSend_messageWithKind_plistPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithKind:plistPayload:");
}

id objc_msgSend_newShaderProfilerWithPlaybackEngine_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newShaderProfilerWithPlaybackEngine:payload:");
}

id objc_msgSend_notifyOnQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyOnQueue:handler:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPayload");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_playbackEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackEngine");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_profileBlockBackgroundQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileBlockBackgroundQueue");
}

id objc_msgSend_profileBlockQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileBlockQueue");
}

id objc_msgSend_profileInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileInfo");
}

id objc_msgSend_profilerCounters_withFrameProfiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profilerCounters:withFrameProfiler:");
}

id objc_msgSend_pushBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushBlock:");
}

id objc_msgSend_replayControllerSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replayControllerSupport");
}

id objc_msgSend_resolveWithFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveWithFuture:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_send_inReplyTo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "send:inReplyTo:error:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationTimingFunction:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPlaybackEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaybackEngine:");
}

id objc_msgSend_setReplayControllerSupport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReplayControllerSupport:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setShouldCreateViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCreateViewController:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_shaderProfiler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shaderProfiler");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedExtensionRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedExtensionRegistry");
}

id objc_msgSend_shouldCreateViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCreateViewController");
}

id objc_msgSend_startShaderProfiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startShaderProfiler:");
}

id objc_msgSend_startupAndCreateViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startupAndCreateViewController:");
}

id objc_msgSend_strongDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongDelegate");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updatePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePayload:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForPlaybackEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForPlaybackEngine:");
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilResolved");
}

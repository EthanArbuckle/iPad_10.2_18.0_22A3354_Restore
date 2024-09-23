id sub_1CC97C554()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1ED8AFE00;
  v7 = qword_1ED8AFE00;
  if (!qword_1ED8AFE00)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1CC99B0B4;
    v3[3] = &unk_1E88E34C0;
    v3[4] = &v4;
    sub_1CC99B0B4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CC97C5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC97C918(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC97C9DC;
  v9[3] = &unk_1E88E3DC0;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(void **)(a1 + 80);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v9);

}

void sub_1CC97C9DC(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC97CA90;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 20, a2, v5, v9);

}

void sub_1CC97CA90(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Rate Media Entity"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Rate Media Entity"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Rate Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC97CD68(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC97D060(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC97D124;
  v9[3] = &unk_1E88E3DC0;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(void **)(a1 + 80);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v9);

}

void sub_1CC97D124(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC97D1D8;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 0, a2, v5, v9);

}

void sub_1CC97D1D8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Start Playback"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Start Playback"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Start Playback (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC97D4B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC97DD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  uint64_t v61;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC97DE24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC97DE34(uint64_t a1)
{

}

void sub_1CC97DE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ContentItemAtOffset;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length");
  if (a3)
  {
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 104);
      *(_QWORD *)(v9 + 104) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v23 = 138543874;
      v24 = v13;
      v25 = 2114;
      v26 = a3;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_ERROR, "Get State Response Remote (playinginfo) <%{public}@>: no queue %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 104);
      *(_QWORD *)(v16 + 104) = v15;

    }
    _MPLogCategoryAssistant();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v23 = 138543874;
      v24 = v20;
      v25 = 2114;
      v26 = ContentItemAtOffset;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: playing %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }

    v21 = MRContentItemCopyNowPlayingInfo();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(NSObject **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
  }

  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1CC97E03C(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    v12 = 138543874;
    v13 = v10;
    v14 = 2048;
    v15 = a2;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: playback state %ld endpoint %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if (a2 - 1 > 4)
    v11 = 0;
  else
    v11 = dword_1CC9AEAC0[a2 - 1];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1CC97E198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *BundleIdentifier;
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  _BYTE v26[18];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 104);
      *(_QWORD *)(v7 + 104) = v6;

    }
    _MPLogCategoryAssistant();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v23 = 138543874;
      v24 = v11;
      v25 = 2114;
      *(_QWORD *)v26 = a3;
      *(_WORD *)&v26[8] = 2114;
      *(_QWORD *)&v26[10] = v10;
      _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_ERROR, "Get State Response Remote (playinginfo) <%{public}@>: no device info %{public}@ endpoint %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    BundleIdentifier = *(void **)(a1 + 64);
    if (BundleIdentifier)
      BundleIdentifier = (void *)MRNowPlayingClientGetBundleIdentifier();
    v13 = BundleIdentifier;
    v9 = MRPairedDeviceCopySystemMediaApplication();
    v14 = -[NSObject isEqual:](v9, "isEqual:", v13);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 104);
      *(_QWORD *)(v17 + 104) = v16;

    }
    _MPLogCategoryAssistant();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v23 = 138543874;
      v24 = v21;
      v25 = 1024;
      *(_DWORD *)v26 = v22;
      *(_WORD *)&v26[4] = 2114;
      *(_QWORD *)&v26[6] = v20;
      _os_log_impl(&dword_1CC97B000, v19, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: is music app %{BOOL}u endpoint %{public}@", (uint8_t *)&v23, 0x1Cu);
    }

  }
  CFRelease(*(CFTypeRef *)(a1 + 72));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1CC97E3D4(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = a2;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: group identity %{public}@endpoint %{public}@", (uint8_t *)&v14, 0x20u);
  }

  v11 = objc_msgSend(a2, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1CC97E510(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void **v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  char *aSelector;
  uint64_t v61;
  _QWORD block[5];
  __int128 v63;
  _QWORD v64[6];
  NSObject *v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  void *v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 72);
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    v10 = objc_msgSend(v3, "count");
    v11 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138543874;
    v81 = v9;
    v82 = 2048;
    v83 = v10;
    v84 = 2114;
    v85 = v11;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: %ld output devices endpoint %{public}@", buf, 0x20u);
  }

  CFRelease(*(CFTypeRef *)(a1 + 72));
  objc_msgSend(v2, "designatedGroupLeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v2, "outputDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 104);
      *(_QWORD *)(v16 + 104) = v15;

    }
    _MPLogCategoryAssistant();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138543618;
      v81 = v19;
      v82 = 2114;
      v83 = (uint64_t)v12;
      _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using first output device %{public}@", buf, 0x16u);
    }

  }
  v57 = v12;
  v58 = v2;
  objc_msgSend(v12, "groupID");
  v61 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v21 = v3;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  v59 = v21;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v73 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v26, "clusterComposition");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          NSStringFromSelector(sel_uid);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "valueForKeyPath:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObjectsFromArray:", v29);

          if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
          {
            objc_msgSend(*(id *)(a1 + 32), "aceId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Get State Response Remote"), v30);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = *(_QWORD *)(a1 + 32);
            v33 = *(void **)(v32 + 104);
            *(_QWORD *)(v32 + 104) = v31;

          }
          _MPLogCategoryAssistant();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
            *(_DWORD *)buf = 138543618;
            v81 = v35;
            v82 = 2114;
            v83 = (uint64_t)v20;
            _os_log_impl(&dword_1CC97B000, v34, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using cluster device IDs %{public}@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v26, "uid");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v36);

          if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
          {
            objc_msgSend(*(id *)(a1 + 32), "aceId");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Get State Response Remote"), v37);
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = *(_QWORD *)(a1 + 32);
            v40 = *(void **)(v39 + 104);
            *(_QWORD *)(v39 + 104) = v38;

          }
          _MPLogCategoryAssistant();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v41 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
            objc_msgSend(v26, "uid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v81 = v41;
            v21 = v59;
            v82 = 2114;
            v83 = (uint64_t)v42;
            _os_log_impl(&dword_1CC97B000, v34, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: using output device ID %{public}@", buf, 0x16u);

          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    }
    while (v23);
  }

  v43 = dispatch_group_create();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  aSelector = v20;
  v44 = objc_msgSend(aSelector, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  v45 = (void *)v61;
  if (v44)
  {
    v46 = v44;
    v47 = *(_QWORD *)v69;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v69 != v47)
          objc_enumerationMutation(aSelector);
        v49 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v48);
        dispatch_group_enter(v43);
        if (objc_msgSend(v45, "length"))
        {
          v77 = v45;
          v50 = &v77;
LABEL_36:
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
        {
          v76 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v50 = (void **)&v76;
          goto LABEL_36;
        }
        v51 = &unk_1E88E9C70;
LABEL_37:
        v52 = *(_QWORD *)(a1 + 32);
        v53 = *(void **)(v52 + 96);
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = sub_1CC97EC00;
        v64[3] = &unk_1E88E2890;
        v66 = *(_OWORD *)(a1 + 48);
        v67 = *(_QWORD *)(a1 + 64);
        v64[4] = v52;
        v64[5] = v49;
        v65 = v43;
        objc_msgSend(v53, "encodeHashedRouteUIDs:completion:", v51, v64);

        ++v48;
        v45 = (void *)v61;
      }
      while (v46 != v48);
      v54 = objc_msgSend(aSelector, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      v46 = v54;
    }
    while (v54);
  }

  v55 = *(_QWORD *)(a1 + 32);
  v56 = *(NSObject **)(v55 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC97EDBC;
  block[3] = &unk_1E88E28B8;
  v63 = *(_OWORD *)(a1 + 80);
  block[4] = v55;
  dispatch_group_notify(v43, v56, block);

}

void sub_1CC97EC00(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  __int128 v16;
  id v17;
  id v18;

  v3 = (objc_class *)MEMORY[0x1E0D88240];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHashedGroupID:", v6);
  sub_1CC994594(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D4CAE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = (id *)MEMORY[0x1E0D88DD8];
  if (v8)
    v9 = (id *)MEMORY[0x1E0D88DE0];
  v10 = *v9;
  objc_msgSend(v5, "setListeningToItem:", v14);
  objc_msgSend(v5, "setSource:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setListeningToMusicApplication:", v11);

  objc_msgSend(v5, "setState:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC97EDF8;
  block[3] = &unk_1E88E31D8;
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v16 = *(_OWORD *)(a1 + 32);
  v17 = v5;
  v18 = *(id *)(a1 + 48);
  v13 = v5;
  dispatch_sync(v12, block);

}

void sub_1CC97EDBC(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88));
}

void sub_1CC97EDF8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 64), "setObject:forKey:", *(_QWORD *)(a1 + 48), v2);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 104);
      *(_QWORD *)(v6 + 104) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      objc_msgSend(*(id *)(a1 + 48), "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2114;
      v20 = v2;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: hashedUID %{public}@ response %{public}@.", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(v3 + 104), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 104);
      *(_QWORD *)(v13 + 104) = v12;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 40);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v17 = 138543618;
      v18 = v16;
      v19 = 2114;
      v20 = v15;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (playinginfo) <%{public}@>: UID %{public}@ was not requested", (uint8_t *)&v17, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1CC97F020(id *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  dispatch_group_t v7;
  _QWORD *v8;
  void *v9;
  dispatch_queue_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  void (**v27)(id, void *);
  id v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)a1[4] + 7, a2);
  objc_msgSend(*((id *)a1[4] + 7), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (*((_QWORD *)a1[4] + 7))
  {
    v7 = dispatch_group_create();
    v8 = a1[4];
    v9 = (void *)v8[11];
    v8[11] = v7;

    v10 = dispatch_queue_create("com.apple.MediaPlayer.assistant.responseCollection", 0);
    v11 = a1[4];
    v12 = (void *)v11[10];
    v11[10] = v10;

    v13 = objc_msgSend(v6, "count");
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      if (!objc_msgSend(*((id *)a1[4] + 13), "length"))
      {
        objc_msgSend(a1[4], "aceId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Get State Response Remote"), v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = a1[4];
        v18 = (void *)v17[13];
        v17[13] = v16;

      }
      _MPLogCategoryAssistant();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *((_QWORD *)a1[4] + 13);
        *(_DWORD *)buf = 138543618;
        v37 = v20;
        v38 = 2114;
        v39 = v6;
        _os_log_impl(&dword_1CC97B000, v19, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (discovery) <%{public}@>: To discover: %{public}@", buf, 0x16u);
      }

      v21 = objc_alloc_init(MEMORY[0x1E0D4B308]);
      dispatch_group_enter(*((dispatch_group_t *)a1[4] + 11));
      v34[0] = v14;
      v34[1] = 3221225472;
      v34[2] = sub_1CC97F30C;
      v34[3] = &unk_1E88E27C8;
      v34[4] = a1[4];
      v35 = v21;
      v22 = v21;
      objc_msgSend(v22, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v6, v34);

    }
    v23 = *((_QWORD *)a1[4] + 11);
    dispatch_get_global_queue(25, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = sub_1CC97F570;
    block[3] = &unk_1E88E3CA8;
    v25 = a1[5];
    v26 = a1[4];
    v31 = v25;
    v32 = v26;
    v33 = a1[6];
    dispatch_group_notify(v23, v24, block);

  }
  else
  {
    v27 = (void (**)(id, void *))a1[6];
    v28 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v28, "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2](v27, v29);

  }
}

void sub_1CC97F30C(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;
  id obj;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v26;
    *(_QWORD *)&v4 = 138543618;
    v18 = v4;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length", v18))
        {
          objc_msgSend(*(id *)(a1 + 32), "aceId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Get State Response Remote"), v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(void **)(v12 + 104);
          *(_QWORD *)(v12 + 104) = v11;

        }
        _MPLogCategoryAssistant();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
          *(_DWORD *)buf = v18;
          v30 = v15;
          v31 = 2114;
          v32 = v9;
          _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (discovery) <%{public}@>: Discovered: %{public}@", buf, 0x16u);
        }

        v16 = objc_alloc_init(MEMORY[0x1E0D4B300]);
        dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88));
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = sub_1CC97F6C8;
        v20[3] = &unk_1E88E27A0;
        v21 = *(id *)(a1 + 40);
        v22 = v16;
        v23 = *(_QWORD *)(a1 + 32);
        v24 = v9;
        v17 = v16;
        objc_msgSend(v17, "connectToEndpoint:completion:", v9, v20);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88));

}

void sub_1CC97F570(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRouteResponses:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State Response Remote"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Get State Response Remote (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void sub_1CC97F6C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id **)(a1 + 48);
  if (v5)
  {
    if (!objc_msgSend(v8[13], "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get State Response Remote"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(void **)(v11 + 104);
      *(_QWORD *)(v11 + 104) = v10;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104);
      v16 = 138543874;
      v17 = v15;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_ERROR, "Get State Response Remote (connect) <%{public}@>: Failed connect: %{public}@ -- %{public}@", (uint8_t *)&v16, 0x20u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 88));
  }
  else
  {
    objc_msgSend(v8, "setPlayingInfoFromEndpoint:", *(_QWORD *)(a1 + 56));
  }

}

void sub_1CC981E10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MPLogCategoryAssistant();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = CFSTR("Add Media Items To Playlist");
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CC97B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud items) <%{public}@>: rewrite finished", (uint8_t *)&v6, 0x16u);
  }

  +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithError:requestHash:completion:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_1CC981EF0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MPLogCategoryAssistant();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = CFSTR("Add Media Items To Playlist");
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1CC97B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud items) <%{public}@>: rewrite finished", (uint8_t *)&v6, 0x16u);
  }

  +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithError:requestHash:completion:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_1CC981FD0(uint64_t a1, uint64_t a2)
{
  return +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithError:requestHash:completion:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_1CC981FE8(uint64_t a1, uint64_t a2)
{
  return +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithError:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithError:requestHash:completion:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_1CC982000(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v4;

    }
    _MPLogCategoryAssistant();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: added items", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    v10 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);

  }
  else
  {
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithString:requestHash:completion:", CFSTR("Unable to add item to playlist"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40));
  }
}

void sub_1CC982188(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v4;

    }
    _MPLogCategoryAssistant();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: added items", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    v10 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);

  }
  else
  {
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithString:requestHash:completion:", CFSTR("Unable to add item to playlist"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40));
  }
}

void sub_1CC982310(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC9824F8;
    v16[3] = &unk_1E88E38D8;
    v5 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_appendToPlaylistWithCompletion:", v16);
    v6 = v17;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

uint64_t sub_1CC9824F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC982AF0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[9];

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC982BAC;
  v9[3] = &unk_1E88E3608;
  v4 = *(id *)(a1 + 32);
  v9[4] = v4;
  v9[5] = v3;
  v5 = *(void **)(a1 + 48);
  v9[6] = *(_QWORD *)(a1 + 40);
  v6 = v5;
  v9[7] = v6;
  v7 = *(id *)(a1 + 56);
  v9[8] = v7;
  v8 = v3;
  sub_1CC982BAC((uint64_t)v9, 0);

}

void sub_1CC982BAC(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC982C88;
  v9[3] = &unk_1E88E2908;
  v10 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v4, "pauseDevicesByUID:withRefId:audioRoutingInfo:source:completion:", v5, v6, a2, CFSTR("siri"), v9);

}

void sub_1CC982C88(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  if (v3)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v3);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Pause Playback"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
      objc_msgSend(v6, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Pause Playback (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "aceId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Pause Playback"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(void **)(v14 + 56);
      *(_QWORD *)(v14 + 56) = v13;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
  }

  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

}

void sub_1CC98315C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  sub_1CC994594(v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CAA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4C8F8]);
  v6 = (id *)MEMORY[0x1E0D88DD8];
  if (v5)
    v6 = (id *)MEMORY[0x1E0D88DE0];
  v7 = *v6;
  objc_msgSend(*(id *)(a1 + 32), "setListeningToItem:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setSource:", v7);
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CA80]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setListeningToMusicApplication:", v10);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC983274(uint64_t a1, int a2)
{
  uint64_t v3;

  if ((a2 - 1) > 4)
    v3 = 0;
  else
    v3 = dword_1CC9AEAC0[a2 - 1];
  objc_msgSend(*(id *)(a1 + 32), "setState:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9832BC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get State"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Get State (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

id sub_1CC9833FC(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = *MEMORY[0x1E0CC1D68];
  v2 = a1;
  objc_msgSend(v2, "valueForProperty:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "identifierURLScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setScheme:", v6);
  objc_msgSend(v5, "setHost:", CFSTR("device"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%lld"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPath:", v7);

  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t sub_1CC9834E0(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = qword_1EF9DDB90;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_1EF9DDB90, &unk_1E88E2978);
  v3 = (void *)qword_1EF9DDB88;
  objc_msgSend(v2, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

void sub_1CC983574()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("device");
  v2[1] = CFSTR("multiverse");
  v3[0] = &unk_1E88E9C88;
  v3[1] = &unk_1E88E9CA0;
  v2[2] = CFSTR("store");
  v2[3] = CFSTR("ulid");
  v3[2] = &unk_1E88E9CB8;
  v3[3] = &unk_1E88E9CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF9DDB88;
  qword_1EF9DDB88 = v0;

}

void sub_1CC984690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC9848E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC9848F8(uint64_t a1)
{

}

intptr_t sub_1CC984900(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1CC98493C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  NSObject *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(v3, "mediaPlayerOrderingTerms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v107 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        if (objc_msgSend(v10, "mediaPlayerSearchProperty") == 7)
        {
          v11 = *(void **)(a1 + 32);
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v10, "mediaPlayerOrderingDirection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_playlistsByDateCreatedOrder:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v14);

          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "searchProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56))
  {
    if (objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D88E40]))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Search"), v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(void **)(v20 + 56);
        *(_QWORD *)(v20 + 56) = v19;

      }
      _MPLogCategoryAssistant();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v3, "query");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v111 = v23;
        v112 = 2113;
        v113 = v24;
        _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for artist: %{private}@", buf, 0x16u);

      }
      v25 = *(void **)(a1 + 32);
      v26 = *(void **)(a1 + 40);
      objc_msgSend(v3, "query");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_songCollectionsWithGroupingType:searchString:mediaTypes:", 2, v27, *(_QWORD *)(a1 + 56));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v28);

    }
    if (objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D88E38]))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Search"), v29);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 40);
        v32 = *(void **)(v31 + 56);
        *(_QWORD *)(v31 + 56) = v30;

      }
      _MPLogCategoryAssistant();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v3, "query");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v111 = v34;
        v112 = 2113;
        v113 = v35;
        _os_log_impl(&dword_1CC97B000, v33, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for album: %{private}@", buf, 0x16u);

      }
      v36 = *(void **)(a1 + 32);
      v37 = *(void **)(a1 + 40);
      objc_msgSend(v3, "query");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_songCollectionsWithGroupingType:searchString:mediaTypes:", 1, v38, *(_QWORD *)(a1 + 56));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v39);

    }
    if (objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D88E50]))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Search"), v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = *(_QWORD *)(a1 + 40);
        v43 = *(void **)(v42 + 56);
        *(_QWORD *)(v42 + 56) = v41;

      }
      _MPLogCategoryAssistant();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v3, "query");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v111 = v45;
        v112 = 2113;
        v113 = v46;
        _os_log_impl(&dword_1CC97B000, v44, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for genre: %{private}@", buf, 0x16u);

      }
      v47 = *(void **)(a1 + 32);
      v48 = *(void **)(a1 + 40);
      objc_msgSend(v3, "query");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_songCollectionsWithGroupingType:searchString:mediaTypes:", 5, v49, *(_QWORD *)(a1 + 56));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v50);

    }
    if (objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D88E48]))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Search"), v51);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = *(_QWORD *)(a1 + 40);
        v54 = *(void **)(v53 + 56);
        *(_QWORD *)(v53 + 56) = v52;

      }
      _MPLogCategoryAssistant();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v3, "query");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v111 = v56;
        v112 = 2113;
        v113 = v57;
        _os_log_impl(&dword_1CC97B000, v55, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for composer: %{private}@", buf, 0x16u);

      }
      v58 = *(void **)(a1 + 32);
      v59 = *(void **)(a1 + 40);
      objc_msgSend(v3, "query");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "_songCollectionsWithGroupingType:searchString:mediaTypes:", 4, v60, *(_QWORD *)(a1 + 56));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v61);

    }
    if (objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D88E58]))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Search"), v62);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = *(_QWORD *)(a1 + 40);
        v65 = *(void **)(v64 + 56);
        *(_QWORD *)(v64 + 56) = v63;

      }
      _MPLogCategoryAssistant();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v3, "query");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v111 = v67;
        v112 = 2113;
        v113 = v68;
        _os_log_impl(&dword_1CC97B000, v66, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for title: %{private}@", buf, 0x16u);

      }
      v69 = *(void **)(a1 + 32);
      v70 = *(void **)(a1 + 40);
      objc_msgSend(v3, "query");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "_itemsByTitle:mediaTypes:", v71, *(_QWORD *)(a1 + 56));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v72);

    }
  }
  if (!(v7 & 1 | ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D88E78]) & 1) == 0)))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v73);
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = *(_QWORD *)(a1 + 40);
      v76 = *(void **)(v75 + 56);
      *(_QWORD *)(v75 + 56) = v74;

    }
    _MPLogCategoryAssistant();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v3, "query");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v111 = v78;
      v112 = 2113;
      v113 = v79;
      _os_log_impl(&dword_1CC97B000, v77, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for playlist: %{private}@", buf, 0x16u);

    }
    v80 = *(void **)(a1 + 32);
    v81 = *(void **)(a1 + 40);
    objc_msgSend(v3, "query");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_playlistsByName:isGeniusMix:", v82, 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObject:", v83);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D88E70]))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v84);
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = *(_QWORD *)(a1 + 40);
      v87 = *(void **)(v86 + 56);
      *(_QWORD *)(v86 + 56) = v85;

    }
    _MPLogCategoryAssistant();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v89 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v3, "query");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v111 = v89;
      v112 = 2113;
      v113 = v90;
      _os_log_impl(&dword_1CC97B000, v88, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for genius mix: %{private}@", buf, 0x16u);

    }
    v91 = *(void **)(a1 + 32);
    v92 = *(void **)(a1 + 40);
    objc_msgSend(v3, "query");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "_playlistsByName:isGeniusMix:", v93, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v94);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", *MEMORY[0x1E0D88E68]))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v95);
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = *(_QWORD *)(a1 + 40);
      v98 = *(void **)(v97 + 56);
      *(_QWORD *)(v97 + 56) = v96;

    }
    _MPLogCategoryAssistant();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      v100 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v3, "query");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v111 = v100;
      v112 = 2113;
      v113 = v101;
      _os_log_impl(&dword_1CC97B000, v99, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: search for audiobook: %{private}@", buf, 0x16u);

    }
    v103 = *(void **)(a1 + 32);
    v102 = *(void **)(a1 + 40);
    objc_msgSend(v3, "query");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "_audiobooksByName:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addObject:", v105);

  }
}

void sub_1CC9853CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC985450;
  v9[3] = &unk_1E88E29C8;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v9);

}

void sub_1CC985450(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 40))
  {
    **(_BYTE **)(a1 + 48) = 1;
  }
  else
  {
    objc_msgSend(v4, "SAMPMediaEntityRepresentationUsingIdentifierType:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

void sub_1CC9854CC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    objc_msgSend(*(id *)(a1 + 32), "_perform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = v7;

    }
    _MPLogCategoryAssistant();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v5, "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      v13 = "Search (completion) <%{public}@>: notifying assistant: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 56);
      *(_QWORD *)(v16 + 56) = v15;

    }
    _MPLogCategoryAssistant();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v5, "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2114;
      v24 = v12;
      v13 = "Search (completion) <%{public}@>: notifying assistant %{public}@";
      goto LABEL_10;
    }
  }

  v19 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

}

void sub_1CC985AEC(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC985BC4;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC985BC4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC985C78;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 26, a2, v5, v9);

}

void sub_1CC985C78(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Set Shuffle Mode"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Shuffle Mode"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Set Shuffle Mode (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC985F50(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC985F58(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  __int16 v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  uint64_t v55;
  __int16 v56;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((v6 & 0x402) != 0)
  {
    v7 = (objc_class *)MEMORY[0x1E0D88280];
  }
  else if ((v6 & 4) != 0)
  {
    v7 = (objc_class *)MEMORY[0x1E0D88208];
  }
  else if ((v6 & 0x200) != 0)
  {
    v7 = (objc_class *)MEMORY[0x1E0D88218];
  }
  else
  {
    if ((v6 & 0x100) == 0)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D882A8]);
      objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1E08]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGenre:", v9);

      goto LABEL_11;
    }
    v7 = (objc_class *)MEMORY[0x1E0D88250];
  }
  v8 = objc_alloc_init(v7);
LABEL_11:
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1D98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArtist:", v10);

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F58]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortArtist:", v11);

  v12 = *MEMORY[0x1E0CC1D88];
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1D88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlbum:", v13);

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F50]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortAlbum:", v14);

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FD8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v15);

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F60]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortTitle:", v16);

  objc_msgSend(v8, "setIsExplicit:", objc_msgSend(a1, "isExplicitItem"));
  if (a3 == 1)
  {
    sub_1CC9833FC(a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v17);

  }
  if ((v6 & 0x1F0F) != 0)
  {
    v55 = v12;
    v56 = v6;
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc_init(MEMORY[0x1E0D87FC8]);
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EB8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDate:", v21);

    objc_msgSend(v20, "setTimeZoneId:", v19);
    v22 = objc_alloc_init(MEMORY[0x1E0D88270]);
    objc_msgSend(v22, "setLastPlayedDate:", v20);
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DB8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v22, "setPlaybackPositionMillis:", (uint64_t)(v24 * 1000.0));

    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F00]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRememberPlaybackPosition:", objc_msgSend(v25, "BOOLValue"));

    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1ED8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    v28 = 0.0;
    if (v27 >= 0x64)
    {
      v29 = 0;
      do
      {
        v30 = v27;
        v27 /= 0xAuLL;
        ++v29;
      }
      while (v30 > 0x3E7);
      v28 = (double)v29;
    }
    objc_msgSend(v22, "setPlays:", (unint64_t)(__exp10(v28) * (double)v27));
    objc_msgSend(v8, "setPlaybackInfo:", v22);
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1DE0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = objc_alloc_init(MEMORY[0x1E0D87FC8]);
      objc_msgSend(v32, "setDate:", v31);
      objc_msgSend(v32, "setTimeZoneId:", v19);
      objc_msgSend(v8, "setDateAdded:", v32);

    }
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F88]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0D87FC8]);
      objc_msgSend(v34, "setDate:", v33);
      objc_msgSend(v34, "setTimeZoneId:", v19);
      objc_msgSend(v8, "setDatePurchased:", v34);

    }
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EF8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = objc_alloc_init(MEMORY[0x1E0D87FC8]);
      objc_msgSend(v36, "setDate:", v35);
      objc_msgSend(v36, "setTimeZoneId:", v19);
      v37 = objc_alloc_init(MEMORY[0x1E0D88298]);
      objc_msgSend(v37, "setReleaseDate:", v36);
      objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FE8]);
      v54 = v8;
      v38 = v33;
      v39 = v22;
      v40 = v31;
      v41 = v20;
      v42 = v19;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setReleaseYear:", objc_msgSend(v43, "unsignedIntegerValue"));

      v19 = v42;
      v20 = v41;
      v31 = v40;
      v22 = v39;
      v33 = v38;
      v8 = v54;
      objc_msgSend(v54, "setReleaseInfo:", v37);

    }
    v12 = v55;
    v6 = v56;
  }
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v44, "longLongValue"))
  {
    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1FC8]);
    v45 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v45;
  }
  if (v44)
  {
    objc_msgSend(v44, "stringValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdamIdentifier:", v46);

  }
  if ((v6 & 0x200) != 0)
  {
    v47 = *MEMORY[0x1E0CC1DF8];
    v48 = v8;
    objc_msgSend(a1, "valueForProperty:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setEpisodeNumber:", objc_msgSend(v49, "unsignedIntegerValue"));

    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1F40]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSeasonNumber:", objc_msgSend(v50, "unsignedIntegerValue"));

    objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1D90]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShowEpisodesCount:", objc_msgSend(v51, "unsignedIntegerValue"));

    objc_msgSend(a1, "valueForProperty:", v12);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShowName:", v52);

  }
  return v8;
}

const __CFString *sub_1CC9865E8()
{
  __CFString *v0;

  v0 = CFSTR("x-sampmeditem");
  return CFSTR("x-sampmeditem");
}

id sub_1CC986614(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EF9DDB98;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1EF9DDB98, &unk_1E88E2A38);
  objc_msgSend((id)qword_1EF9DDBA0, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id sub_1CC98667C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EF9DDBA8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1EF9DDBA8, &unk_1E88E2A58);
  objc_msgSend((id)qword_1EF9DDBB0, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1CC9866E4()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E0CC1D88], *MEMORY[0x1E0D88E38], *MEMORY[0x1E0CC1D98], *MEMORY[0x1E0D88E40], *MEMORY[0x1E0CC1E08], *MEMORY[0x1E0D88E50], *MEMORY[0x1E0CC1DD0], *MEMORY[0x1E0D88E48], *MEMORY[0x1E0CC1FD8], *MEMORY[0x1E0D88E58], 0);
  v2 = (void *)qword_1EF9DDBB0;
  qword_1EF9DDBB0 = v1;

}

void sub_1CC9867A4()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E0D88E38], *MEMORY[0x1E0CC1D88], *MEMORY[0x1E0D88E40], *MEMORY[0x1E0CC1D98], *MEMORY[0x1E0D88E50], *MEMORY[0x1E0CC1E08], *MEMORY[0x1E0D88E48], *MEMORY[0x1E0CC1DD0], *MEMORY[0x1E0D88E58], *MEMORY[0x1E0CC1FD8], 0);
  v2 = (void *)qword_1EF9DDBA0;
  qword_1EF9DDBA0 = v1;

}

void sub_1CC986AF0(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC986BC8;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC986BC8(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC986C7C;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 19, a2, v5, v9);

}

void sub_1CC986C7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Decrease Playback Speed"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (sub_1CC994D30(v4))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
LABEL_5:
    v12 = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "containsObject:", &unk_1E88E9D30))
  {
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v10 = (id)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88E90]);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("player statuses: %@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v13);

LABEL_7:
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Decrease Playback Speed"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v12, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Decrease Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v12, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v24 = v6;
  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC986F80(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC9884A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC98870C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC98871C(uint64_t a1)
{

}

void sub_1CC988724(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1CC9887BC;
  v5[3] = &unk_1E88E2A80;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  sub_1CC996D10(CFSTR("Subscription Status Sync Handler"), CFSTR("*"), 1, a2, v5);

}

void sub_1CC9887BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_1CC9888C4(void *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 6;
  objc_msgSend(a1, "itemsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "filterPredicates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v2)
    {
      v6 = *(_QWORD *)v14;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (qword_1EF9DDBB8 != -1)
              dispatch_once(&qword_1EF9DDBB8, &unk_1E88E2AC8);
            objc_msgSend(v8, "property");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)qword_1EF9DDBC0, "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = v10;
              v2 = objc_msgSend(v10, "integerValue");

              goto LABEL_19;
            }

          }
          ++v7;
        }
        while (v2 != v7);
        v2 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_19:

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id sub_1CC988A94(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  Class *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a1, "itemsQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v12 = 0;
      v9 = 0;
      v8 = 0;
      goto LABEL_21;
    }
    v14 = objc_msgSend(a1, "groupingType");
    v15 = objc_msgSend(a1, "_assistantCollectionType");
    v16 = v15;
    if (v15 <= 6 && ((0x5Fu >> v15) & 1) != 0)
      v8 = objc_alloc_init(**((Class **)&unk_1E88E2B00 + v15));
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x1E0CC2400], "titlePropertyForGroupingType:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(a1, "valueForProperty:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _MPLogCategoryAssistant();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 134217984;
        v27 = v14;
        _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "No title property for grouping %ld", (uint8_t *)&v26, 0xCu);
      }

      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CC2400], "sortTitlePropertyForGroupingType:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(a1, "valueForProperty:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
LABEL_20:

LABEL_21:
        v11 = 0;
        if (!v8)
          goto LABEL_26;
        goto LABEL_22;
      }
    }
    else
    {
      v12 = 0;
      if (v16)
        goto LABEL_20;
    }
    v20 = *MEMORY[0x1E0CC1D50];
    v21 = v8;
    objc_msgSend(a1, "valueForProperty:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setArtist:", v22);

    goto LABEL_20;
  }
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC2028]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (Class *)0x1E0D88220;
  if (!v6)
    v7 = (Class *)0x1E0D88278;
  v8 = objc_alloc_init(*v7);
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC2040]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC2038]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = 0;
  if (v8)
  {
LABEL_22:
    if (a3 == 1)
    {
      sub_1CC9833FC(a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v8, "setIdentifier:", v23);
    objc_msgSend(v8, "setTitle:", v9);
    objc_msgSend(v8, "setSortTitle:", v12);
    objc_msgSend(v8, "setEditable:", v11);

  }
LABEL_26:
  v24 = v8;

  return v24;
}

id sub_1CC988DB4(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "SAMPCollectionRepresentationUsingIdentifierType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "items", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "SAMPMediaItemRepresentationUsingIdentifierType:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "setItems:", v7);
  }

  return v5;
}

__CFString *sub_1CC988F3C(void *a1)
{
  unint64_t v1;
  __CFString **v2;

  v1 = objc_msgSend(a1, "_assistantCollectionType");
  if (v1 > 6)
    v2 = &off_1E88E2AF8;
  else
    v2 = off_1E88E2B38[v1];
  return *v2;
}

uint64_t sub_1CC988F74(void *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = 3;
  switch(objc_msgSend(a1, "groupingType"))
  {
    case 1:
      objc_msgSend(a1, "representativeItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0CC1EC0]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "integerValue");

        if ((v6 & 0x402) != 0)
        {
          v2 = 5;
        }
        else if ((v6 & 4) != 0)
        {
          v2 = 4;
        }
        else
        {
          v2 = (v6 << 54 >> 63) & 6;
        }
      }
      else
      {
        v2 = 0;
      }

      break;
    case 2:
      v2 = 1;
      break;
    case 5:
      v2 = 2;
      break;
    case 7:
      v2 = 5;
      break;
    case 10:
      v2 = 4;
      break;
    default:
      return v2;
  }
  return v2;
}

void sub_1CC989058()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CC1DA0];
  v3[0] = *MEMORY[0x1E0CC1D80];
  v3[1] = v0;
  v4[0] = &unk_1E88E9D48;
  v4[1] = &unk_1E88E9D60;
  v3[2] = *MEMORY[0x1E0CC1E10];
  v4[2] = &unk_1E88E9D78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EF9DDBC0;
  qword_1EF9DDBC0 = v1;

}

void sub_1CC98B124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1CC98B64C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(*(id *)(a1 + 32), "setUserIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  objc_msgSend(*(id *)(a1 + 32), "setFeatureName:", CFSTR("siri"));
  v17 = *MEMORY[0x1E0D4CCC0];
  v18[0] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D4CCA0]);
  v8 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1CC98BB68;
  v12[3] = &unk_1E88E2D30;
  v13 = v4;
  v16 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v14 = v3;
  v15 = v9;
  v10 = v3;
  v11 = v4;
  objc_msgSend(v11, "sendPlaybackQueue:toDestination:withOptions:completion:", v8, v10, v6, v12);

}

void sub_1CC98B7E8(id *a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  MRAVEndpointGetLocalEndpoint();
  v4 = (void *)MRAVEndpointCopyUniqueIdentifier();
  v5 = a1[4];
  v6 = a2;
  objc_msgSend(v5, "outputDeviceUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "containsObject:", v6);

  if ((_DWORD)v5)
  {

LABEL_4:
    if (!objc_msgSend(*((id *)a1[5] + 11), "length"))
    {
      objc_msgSend(a1[5], "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[5];
      v13 = (void *)v12[11];
      v12[11] = v11;

    }
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *((_QWORD *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to local WHA destination", buf, 0xCu);
    }

    v16 = (void *)*((_QWORD *)a1[5] + 7);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1CC98BB58;
    v32[3] = &unk_1E88E2D80;
    v34 = a1[8];
    v33 = a1[6];
    objc_msgSend(v16, "prepareForAudioHandoffWithCompletion:", v32);

    goto LABEL_21;
  }
  objc_msgSend(a1[4], "outputDeviceUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
    goto LABEL_4;
  objc_msgSend(a1[4], "outputDeviceUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  v19 = objc_msgSend(*((id *)a1[5] + 11), "length");
  if (v18)
  {
    if (!v19)
    {
      objc_msgSend(a1[5], "aceId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = a1[5];
      v23 = (void *)v22[11];
      v22[11] = v21;

    }
    _MPLogCategoryAssistant();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *((_QWORD *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to WHA destination", buf, 0xCu);
    }

    objc_msgSend(a1[7], "setShouldImmediatelyStartPlayback:", 1);
  }
  else
  {
    if (!v19)
    {
      objc_msgSend(a1[5], "aceId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = a1[5];
      v29 = (void *)v28[11];
      v28[11] = v27;

    }
    _MPLogCategoryAssistant();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *((_QWORD *)a1[5] + 11);
      *(_DWORD *)buf = 138543362;
      v36 = v31;
      _os_log_impl(&dword_1CC97B000, v30, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: sending to default destination", buf, 0xCu);
    }

  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_21:

}

uint64_t sub_1CC98BB58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1CC98BB68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  id v29;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v5 && *(_BYTE *)(a1 + 56))
    notify_post("com.apple.media.entities.siri_data_changed");
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v29 = v5;
  v10 = v6;
  objc_msgSend(v29, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D4B2B0]);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v29, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D4B2C0]);

    if (!v17)
      goto LABEL_14;
    v18 = objc_msgSend(v29, "code");
    if (!v18)
      goto LABEL_14;
    if (v18 == 9)
    {
      objc_msgSend(v9, "appBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (MRMediaRemoteApplicationIsSystemMediaApplication())
      {

LABEL_18:
        v14 = objc_alloc(MEMORY[0x1E0D87FE8]);
        v15 = (_QWORD *)MEMORY[0x1E0D88E10];
        goto LABEL_19;
      }
      objc_msgSend(v9, "appBundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D4CDB0]);

      if (v26)
        goto LABEL_18;
    }
    v27 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v28 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
    v24 = (void *)objc_msgSend(v27, "initWithReason:", v28);

    goto LABEL_21;
  }
  v13 = objc_msgSend(v29, "code");
  switch(v13)
  {
    case 0:
LABEL_14:
      sub_1CC994E2C(v10);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v24 = (void *)v20;
      goto LABEL_21;
    case 7:
      v14 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v15 = (_QWORD *)MEMORY[0x1E0D88E28];
      goto LABEL_19;
    case 6:
      v14 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v15 = (_QWORD *)MEMORY[0x1E0D88E20];
LABEL_19:
      v20 = objc_msgSend(v14, "initWithErrorCode:", *v15);
      goto LABEL_20;
  }
  MPCAssistantCreateError();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0D87FE8]);
  objc_msgSend(v21, "localizedDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithReason:", v23);

LABEL_21:
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v24);

}

void sub_1CC98BDE0(uint64_t a1, unsigned int a2)
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(_QWORD);
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  BOOL v43;
  unsigned int v44;
  char v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "assistantStreamingGetAvailability:", a2) == 4;
  objc_msgSend(*(id *)(a1 + 40), "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "representativeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0CC1EC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 88);
    *(_QWORD *)(v12 + 88) = v11;

  }
  _MPLogCategoryAssistant();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(v6, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v15;
    v48 = 2048;
    v49 = objc_msgSend(v16, "count");
    v50 = 2112;
    v51 = v6;
    _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: item collection [%ld items] %@", buf, 0x20u);

  }
  v17 = objc_msgSend(*(id *)(a1 + 32), "shouldShuffle");
  objc_msgSend(*(id *)(a1 + 40), "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(MEMORY[0x1E0D4B328], "queryQueueWithContextID:query:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShuffleType:", v17);
  objc_msgSend(v18, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
  objc_msgSend(*(id *)(a1 + 32), "startPlaying");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShouldImmediatelyStartPlayback:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "recommendationId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSiriRecommendationID:", v20);

  objc_msgSend(*(id *)(a1 + 32), "assetInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSiriAssetInfo:", v21);

  objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSiriWHAMetricsInfo:", v22);

  objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((v9 & 4) != 0)
    objc_msgSend(v23, "setAppBundleID:", CFSTR("com.apple.iBooks"));
  v25 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1CC98C214;
  v38[3] = &unk_1E88E2CB8;
  v26 = v24;
  v39 = v26;
  v27 = v18;
  v28 = *(_QWORD *)(a1 + 32);
  v40 = v27;
  v41 = v28;
  v43 = v4;
  v44 = a2;
  v42 = *(id *)(a1 + 56);
  v45 = *(_BYTE *)(a1 + 64);
  v29 = (void (**)(_QWORD))MEMORY[0x1D17B0600](v38);
  objc_msgSend(*(id *)(a1 + 40), "items");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForProperty:", *MEMORY[0x1E0CC1E60]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0DDBEE0], "defaultManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v25;
    v35[1] = 3221225472;
    v35[2] = sub_1CC98C2E4;
    v35[3] = &unk_1E88E2CE0;
    v35[4] = *(_QWORD *)(a1 + 32);
    v36 = *(id *)(a1 + 56);
    v37 = v29;
    objc_msgSend(v34, "getAgeVerificationStateWithCompletion:", v35);

  }
  else
  {
    v29[2](v29);
  }

}

void sub_1CC98C214(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;
  char v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "hashedRouteUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = sub_1CC98C458;
  v7[3] = &unk_1E88E2BA0;
  v5 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7[1] = 3221225472;
  v10 = v6;
  v9 = v5;
  v11 = *(_BYTE *)(a1 + 69);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v3, v4, v6, *(unsigned int *)(a1 + 65), v7);

}

void sub_1CC98C2E4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    *(_QWORD *)(v6 + 88) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v13 = 138543618;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "isExplicitContentAllowed");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: explicit content allowed: %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if ((objc_msgSend(v3, "isExplicitContentAllowed") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88D88]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
}

void sub_1CC98C458(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 88);
      *(_QWORD *)(v6 + 88) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v10 = *(unsigned __int8 *)(a1 + 56);
      v16 = 138543618;
      v17 = v9;
      v18 = 1024;
      v19 = v10;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Set Queue (local) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v13 = (void *)objc_msgSend(v12, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendQueue:toDestination:shouldResync:completion:", *(_QWORD *)(a1 + 40), v3, 1, *(_QWORD *)(a1 + 48));
  }

}

void sub_1CC98C5F8(uint64_t a1, unsigned int a2)
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void (**v46)(_QWORD);
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  void (**v70)(_QWORD);
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  BOOL v76;
  unsigned int v77;
  char v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "assistantStreamingGetAvailability:", a2) == 4;
  objc_msgSend(*(id *)(a1 + 40), "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1EC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v7, "unsignedIntegerValue");

  v8 = *MEMORY[0x1E0CC1F70];
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1F70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CC1FA8];
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FA8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CC1D88];
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1D88]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v11;
  if (objc_msgSend(v9, "length"))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 88);
      *(_QWORD *)(v15 + 88) = v14;

    }
    _MPLogCategoryAssistant();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      v80 = v18;
      v81 = 2114;
      v82 = v9;
      _os_log_impl(&dword_1CC97B000, v17, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found cloud album %{public}@", buf, 0x16u);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0CC2438]);
    objc_msgSend(v6, "predicateForProperty:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addFilterPredicate:", v20);
  }
  else if (objc_msgSend(v11, "longLongValue"))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 88);
      *(_QWORD *)(v23 + 88) = v22;

    }
    _MPLogCategoryAssistant();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      v80 = v26;
      v81 = 2114;
      v82 = v11;
      _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found store album %{public}@", buf, 0x16u);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0CC2438]);
    objc_msgSend(v6, "predicateForProperty:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addFilterPredicate:", v20);
  }
  else
  {
    if (!objc_msgSend(v67, "length"))
      goto LABEL_34;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(void **)(v29 + 88);
      *(_QWORD *)(v29 + 88) = v28;

    }
    _MPLogCategoryAssistant();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      v80 = v32;
      v81 = 2114;
      v82 = v67;
      _os_log_impl(&dword_1CC97B000, v31, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: found album title %{public}@", buf, 0x16u);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0CC2438]);
    objc_msgSend(v6, "predicateForProperty:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addFilterPredicate:", v20);
  }

  if (v19)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setMediaLibrary:", v33);

    }
    objc_msgSend(v19, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v19, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(v19, "setGroupingType:", 1);
    if (objc_msgSend(v19, "_hasCollections")
      && (objc_msgSend(v19, "collections"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend(v34, "count"),
          v34,
          v35 == 1))
    {
      v36 = objc_msgSend(*(id *)(a1 + 32), "shouldShuffle");
      objc_msgSend(MEMORY[0x1E0D4B328], "queryQueueWithContextID:query:", *(_QWORD *)(a1 + 48), v19);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFirstItem:", v6);
      objc_msgSend(v37, "setShuffleType:", v36);
      objc_msgSend(v37, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
      objc_msgSend(*(id *)(a1 + 32), "startPlaying");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setShouldImmediatelyStartPlayback:", objc_msgSend(v38, "BOOLValue"));

      objc_msgSend(*(id *)(a1 + 32), "recommendationId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSiriRecommendationID:", v39);

      objc_msgSend(*(id *)(a1 + 32), "assetInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSiriAssetInfo:", v40);

      objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSiriWHAMetricsInfo:", v41);

      objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if ((v64 & 4) != 0)
        objc_msgSend(v42, "setAppBundleID:", CFSTR("com.apple.iBooks"));
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = sub_1CC98CECC;
      v71[3] = &unk_1E88E2CB8;
      v65 = v43;
      v72 = v65;
      v44 = v37;
      v45 = *(_QWORD *)(a1 + 32);
      v73 = v44;
      v74 = v45;
      v76 = v4;
      v77 = a2;
      v75 = *(id *)(a1 + 56);
      v78 = *(_BYTE *)(a1 + 64);
      v46 = (void (**)(_QWORD))MEMORY[0x1D17B0600](v71);
      objc_msgSend(v19, "items");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "valueForProperty:", *MEMORY[0x1E0CC1E60]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "BOOLValue");

      if (v50)
      {
        objc_msgSend(MEMORY[0x1E0DDBEE0], "defaultManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = sub_1CC98CF9C;
        v68[3] = &unk_1E88E2CE0;
        v68[4] = *(_QWORD *)(a1 + 32);
        v69 = *(id *)(a1 + 56);
        v70 = v46;
        objc_msgSend(v51, "getAgeVerificationStateWithCompletion:", v68);

      }
      else
      {
        v46[2](v46);
      }

    }
    else
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v52);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = *(_QWORD *)(a1 + 32);
        v55 = *(void **)(v54 + 88);
        *(_QWORD *)(v54 + 88) = v53;

      }
      _MPLogCategoryAssistant();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        v80 = v57;
        _os_log_impl(&dword_1CC97B000, v56, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: enqueueing reference item", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

    v11 = v66;
    goto LABEL_42;
  }
  v11 = v66;
LABEL_34:
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v58);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = *(_QWORD *)(a1 + 32);
    v61 = *(void **)(v60 + 88);
    *(_QWORD *)(v60 + 88) = v59;

  }
  _MPLogCategoryAssistant();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    v80 = v63;
    _os_log_impl(&dword_1CC97B000, v62, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: enqueueing reference item", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_42:

}

void sub_1CC98CECC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;
  char v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "hashedRouteUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = sub_1CC98D110;
  v7[3] = &unk_1E88E2BA0;
  v5 = *(void **)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7[1] = 3221225472;
  v10 = v6;
  v9 = v5;
  v11 = *(_BYTE *)(a1 + 69);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v3, v4, v6, *(unsigned int *)(a1 + 65), v7);

}

void sub_1CC98CF9C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    *(_QWORD *)(v6 + 88) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v13 = 138543618;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "isExplicitContentAllowed");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: explicit content allowed: %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if ((objc_msgSend(v3, "isExplicitContentAllowed") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88D88]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
}

void sub_1CC98D110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 88);
      *(_QWORD *)(v6 + 88) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v10 = *(unsigned __int8 *)(a1 + 56);
      v16 = 138543618;
      v17 = v9;
      v18 = 1024;
      v19 = v10;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Set Queue (local) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v13 = (void *)objc_msgSend(v12, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendQueue:toDestination:shouldResync:completion:", *(_QWORD *)(a1 + 40), v3, 1, *(_QWORD *)(a1 + 48));
  }

}

uint64_t sub_1CC98D2B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC98D2C0(uint64_t a1)
{

}

void sub_1CC98D2C8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(id **)(a1 + 32);
  if (v3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = *(unsigned __int8 *)(a1 + 64);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC98D4B0;
    v16[3] = &unk_1E88E3E38;
    v7 = *(_QWORD *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_playMediaItems:contextID:dryRun:completion:", v5, v7, v6, v16);
    v8 = v17;
  }
  else
  {
    if (!objc_msgSend(v4[11], "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 88);
      *(_QWORD *)(v11 + 88) = v10;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no for you cache", buf, 0xCu);
    }

    v15 = *(_QWORD *)(a1 + 48);
    v8 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, 1, v8);
  }

}

uint64_t sub_1CC98D48C(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1CC98D4B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC98D4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  unint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void (*v82)(void);
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  _QWORD v103[4];
  id v104;
  uint64_t v105;
  id v106;
  int v107;
  char v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "assistantStreamingGetAvailability:", a2);
  if (v4 != 1)
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v42);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(a1 + 32);
        v45 = *(void **)(v44 + 88);
        *(_QWORD *)(v44 + 88) = v43;

      }
      _MPLogCategoryAssistant();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        v118 = v47;
        _os_log_impl(&dword_1CC97B000, v46, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no media items requested", buf, 0xCu);
      }

      v11 = *(_QWORD *)(a1 + 48);
      v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v13 = (_QWORD *)MEMORY[0x1E0D88E08];
      goto LABEL_31;
    }
    v100 = a2;
    v102 = v4;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v114 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "identifier", v100);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = sub_1CC9834E0(v20);
          if (v21 == 3)
          {
            objc_msgSend(v20, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "longLongValue");

            if (!v23)
              goto LABEL_21;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v24);
          }
          else
          {
            v25 = v21;
            if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
            {
              objc_msgSend(*(id *)(a1 + 32), "aceId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1CC994A10(CFSTR("Set Queue"), v26);
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = *(_QWORD *)(a1 + 32);
              v29 = *(void **)(v28 + 88);
              *(_QWORD *)(v28 + 88) = v27;

            }
            _MPLogCategoryAssistant();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
              *(_DWORD *)buf = 138543618;
              v118 = v30;
              v119 = 2048;
              v120 = v25;
              _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: content origin %ld", buf, 0x16u);
            }
          }

LABEL_21:
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
      }
      while (v17);
    }

    v31 = v14;
    v32 = objc_msgSend(v14, "count");
    v33 = MEMORY[0x1E0C809B0];
    if (v32
      || (objc_msgSend(*(id *)(a1 + 40), "identifier"),
          v53 = (void *)objc_claimAutoreleasedReturnValue(),
          v53,
          !v53))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier", v100);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scheme");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("x-sampplaylist"));

      v37 = 0x1EF9DC000;
      if (v36)
      {
        v38 = objc_alloc(MEMORY[0x1E0CC2398]);
        objc_msgSend(MEMORY[0x1E0CC2458], "identityKind");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = v33;
        v111[1] = 3221225472;
        v111[2] = sub_1CC98DF78;
        v111[3] = &unk_1E88E2F38;
        v112 = *(id *)(a1 + 40);
        v40 = (void *)objc_msgSend(v38, "initWithSource:modelKind:block:", CFSTR("MPCAssistant"), v39, v111);

        v41 = v112;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "scheme");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("x-sampcollection-album"));

        if (!v50)
        {
          v40 = 0;
LABEL_41:
          v62 = objc_msgSend(v14, "count", v100);
          v63 = *(int *)(v37 + 3348);
          v64 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v63), "length");
          if (!v62)
          {
            if (!v64)
            {
              objc_msgSend(*(id *)(a1 + 32), "aceId");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1CC994A10(CFSTR("Set Queue"), v83);
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = *(_QWORD *)(a1 + 32);
              v86 = *(void **)(v85 + v63);
              *(_QWORD *)(v85 + v63) = v84;

            }
            _MPLogCategoryAssistant();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              v88 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v63);
              objc_msgSend(*(id *)(a1 + 40), "items");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v118 = v88;
              v119 = 2114;
              v120 = (uint64_t)v89;
              _os_log_impl(&dword_1CC97B000, v87, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no playable items in %{public}@", buf, 0x16u);

            }
            v90 = *(_QWORD *)(a1 + 48);
            v91 = objc_alloc(MEMORY[0x1E0D87FE8]);
            v72 = (void *)objc_msgSend(v91, "initWithErrorCode:", *MEMORY[0x1E0D88E08]);
            (*(void (**)(uint64_t, void *))(v90 + 16))(v90, v72);
            goto LABEL_62;
          }
          if (!v64)
          {
            objc_msgSend(*(id *)(a1 + 32), "aceId");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Set Queue"), v65);
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = *(_QWORD *)(a1 + 32);
            v68 = *(void **)(v67 + v63);
            *(_QWORD *)(v67 + v63) = v66;

          }
          _MPLogCategoryAssistant();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v63);
            *(_DWORD *)buf = 138543618;
            v118 = v70;
            v119 = 2114;
            v120 = (uint64_t)v14;
            _os_log_impl(&dword_1CC97B000, v69, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: queue from store identifers: %{public}@", buf, 0x16u);
          }

          v71 = objc_msgSend(*(id *)(a1 + 32), "shouldShuffle");
          objc_msgSend(*(id *)(a1 + 32), "refId");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D4B340], "storeTracklistQueueWithContextID:storeItemIDs:collectionIdentifierSet:", v72, v14, v40);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setShuffleType:", v71);
          objc_msgSend(v73, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
          objc_msgSend(*(id *)(a1 + 32), "startPlaying");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setShouldImmediatelyStartPlayback:", objc_msgSend(v74, "BOOLValue"));

          objc_msgSend(*(id *)(a1 + 32), "recommendationId");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setSiriRecommendationID:", v75);

          objc_msgSend(*(id *)(a1 + 32), "assetInfo");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setSiriAssetInfo:", v76);

          objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setSiriWHAMetricsInfo:", v77);

          v103[0] = v33;
          v103[1] = 3221225472;
          v103[2] = sub_1CC98E050;
          v103[3] = &unk_1E88E2C68;
          v78 = v73;
          v79 = *(_QWORD *)(a1 + 32);
          v104 = v78;
          v105 = v79;
          v107 = v101;
          v106 = *(id *)(a1 + 48);
          v108 = *(_BYTE *)(a1 + 56);
          v80 = MEMORY[0x1D17B0600](v103);
          v81 = (void *)v80;
          if (v102 == 3)
          {
            v82 = *(void (**)(void))(v80 + 16);
          }
          else
          {
            if (v102 != 4)
            {
              if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v63), "length"))
              {
                objc_msgSend(*(id *)(a1 + 32), "aceId");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1CC994A10(CFSTR("Set Queue"), v92);
                v93 = objc_claimAutoreleasedReturnValue();
                v94 = *(_QWORD *)(a1 + 32);
                v95 = *(void **)(v94 + v63);
                *(_QWORD *)(v94 + v63) = v93;

              }
              _MPLogCategoryAssistant();
              v96 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
              {
                v97 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v63);
                *(_DWORD *)buf = 138543362;
                v118 = v97;
                _os_log_impl(&dword_1CC97B000, v96, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: remapping not supported", buf, 0xCu);
              }

              v98 = *(_QWORD *)(a1 + 48);
              v99 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
              (*(void (**)(uint64_t, id))(v98 + 16))(v98, v99);

              goto LABEL_61;
            }
            v82 = *(void (**)(void))(v80 + 16);
          }
          v82();
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
        v51 = objc_alloc(MEMORY[0x1E0CC2398]);
        objc_msgSend(MEMORY[0x1E0CC2440], "identityKind");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v109[0] = v33;
        v109[1] = 3221225472;
        v109[2] = sub_1CC98DFE4;
        v109[3] = &unk_1E88E2F38;
        v110 = *(id *)(a1 + 40);
        v40 = (void *)objc_msgSend(v51, "initWithSource:modelKind:block:", CFSTR("MPCAssistant"), v52, v109);

        v41 = v110;
      }
    }
    else
    {
      v37 = 0x1EF9DC000uLL;
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v54);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = *(_QWORD *)(a1 + 32);
        v57 = *(void **)(v56 + 88);
        *(_QWORD *)(v56 + 88) = v55;

      }
      _MPLogCategoryAssistant();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v118 = v59;
        v119 = 2114;
        v120 = (uint64_t)v60;
        _os_log_impl(&dword_1CC97B000, v58, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: using collection identifier %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v61);

      v40 = 0;
    }

    goto LABEL_41;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = v6;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    v118 = v10;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: network unavailable", buf, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 48);
  v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
  v13 = (_QWORD *)MEMORY[0x1E0D88D98];
LABEL_31:
  v31 = (void *)objc_msgSend(v12, "initWithErrorCode:", *v13);
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v31);
LABEL_63:

}

void sub_1CC98DF78(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1CC98E324;
  v3[3] = &unk_1E88E2F10;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void sub_1CC98DFE4(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1CC98E2C0;
  v3[3] = &unk_1E88E2F10;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void sub_1CC98E050(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0D4B338], "systemMediaApplicationDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC98E130;
  v8[3] = &unk_1E88E2D58;
  v7 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = *(_BYTE *)(a1 + 60);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v5, v6, a2, *(unsigned int *)(a1 + 56), v8);

}

void sub_1CC98E130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 88);
      *(_QWORD *)(v6 + 88) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: destination not available, local allowed YES", (uint8_t *)&v15, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendQueue:toDestination:shouldResync:completion:", *(_QWORD *)(a1 + 40), v3, 0, *(_QWORD *)(a1 + 48));
  }

}

void sub_1CC98E2C0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));

}

void sub_1CC98E324(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlobalPlaylistID:", v4);

}

void sub_1CC98E384(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x-sampplaylist"));

  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(v4, "MPMediaItemQueryOnlyPlayableItems:withUserIdentity:plugin:hash:", 1, *(_QWORD *)(v5 + 72), CFSTR("Set Queue"), *(_QWORD *)(v5 + 88));
    v6 = v9;
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "albumQueryByGroupingForSchemeWithUserIdentity:plugin:hash:", *(_QWORD *)(v5 + 72), CFSTR("Set Queue"), *(_QWORD *)(v5 + 88));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 1)
    {
      v6 = v6;

      objc_msgSend(*(id *)(a1 + 56), "setShouldShuffle:", 0);
      v9 = v6;
    }
  }

  objc_msgSend(*(id *)(a1 + 56), "_playMediaItems:contextID:dryRun:completion:", v9, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

uint64_t sub_1CC98E49C(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC98E4B8(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  unsigned int v9;
  char v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1CC98E56C;
  v6[3] = &unk_1E88E2BC8;
  v6[4] = v4;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v9 = a2;
  v10 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v5, "assistantRadioGetAvailability:completion:", a2, v6);

}

void sub_1CC98E56C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  _BOOL8 v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
  id v55;
  id v56;
  BOOL v57;
  char v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 88);
        *(_QWORD *)(v15 + 88) = v14;

      }
      _MPLogCategoryAssistant();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        v60 = v18;
        _os_log_impl(&dword_1CC97B000, v17, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: radio unavailable", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 48);
      v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v12 = (_QWORD *)MEMORY[0x1E0D88E18];
      goto LABEL_14;
    case 2:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 88);
        *(_QWORD *)(v22 + 88) = v21;

      }
      _MPLogCategoryAssistant();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        v60 = v25;
        _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: companion unavailable", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 48);
      v19 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
      goto LABEL_20;
    case 1:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v4);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 88);
        *(_QWORD *)(v6 + 88) = v5;

      }
      _MPLogCategoryAssistant();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 138543362;
        v60 = v9;
        _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: network unavailable", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 48);
      v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v12 = (_QWORD *)MEMORY[0x1E0D88D98];
LABEL_14:
      v19 = (id)objc_msgSend(v11, "initWithErrorCode:", *v12);
LABEL_20:
      v26 = v19;
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v19);
      goto LABEL_33;
  }
  objc_msgSend(*(id *)(a1 + 32), "refId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0D4B330], "radioQueueWithContextID:stationStringID:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startPlaying");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShouldImmediatelyStartPlayback:", objc_msgSend(v29, "BOOLValue"));

    objc_msgSend(v28, "setShouldOverrideManuallyCuratedQueue:", objc_msgSend(*(id *)(a1 + 32), "shouldOverrideManuallyCuratedUpNext"));
    objc_msgSend(*(id *)(a1 + 32), "recommendationId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSiriRecommendationID:", v30);

    objc_msgSend(*(id *)(a1 + 32), "assetInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSiriAssetInfo:", v31);

    objc_msgSend(*(id *)(a1 + 32), "MP_WHAMetricsInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSiriWHAMetricsInfo:", v32);

    v33 = a2 == 4;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(void **)(v36 + 88);
      *(_QWORD *)(v36 + 88) = v35;

    }
    _MPLogCategoryAssistant();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      v60 = v39;
      v61 = 2114;
      v62 = v27;
      _os_log_impl(&dword_1CC97B000, v38, OS_LOG_TYPE_DEFAULT, "Set Queue (radio) <%{public}@>: station %{public}@", buf, 0x16u);
    }
    v40 = a2 == 4;

    objc_msgSend(MEMORY[0x1E0D4B338], "systemMediaApplicationDestination");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hashedRouteUIDs");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = sub_1CC98EB80;
    v54[3] = &unk_1E88E2BA0;
    v54[4] = *(_QWORD *)(a1 + 32);
    v57 = v33;
    v43 = *(id *)(a1 + 48);
    v58 = *(_BYTE *)(a1 + 60);
    v55 = v28;
    v56 = v43;
    v44 = *(unsigned int *)(a1 + 56);
    v45 = v28;
    objc_msgSend(v41, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v45, v42, v40, v44, v54);

  }
  else
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v46);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = *(_QWORD *)(a1 + 32);
      v49 = *(void **)(v48 + 88);
      *(_QWORD *)(v48 + 88) = v47;

    }
    _MPLogCategoryAssistant();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = *(void **)(a1 + 40);
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138543618;
      v60 = v52;
      v61 = 2114;
      v62 = v51;
      _os_log_impl(&dword_1CC97B000, v50, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: no radio identifier %{public}@", buf, 0x16u);
    }

    v53 = *(_QWORD *)(a1 + 48);
    v41 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
    (*(void (**)(uint64_t, id))(v53 + 16))(v53, v41);
  }

LABEL_33:
}

void sub_1CC98EB80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 88);
      *(_QWORD *)(v6 + 88) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v10 = *(unsigned __int8 *)(a1 + 56);
      v16 = 138543618;
      v17 = v9;
      v18 = 1024;
      v19 = v10;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Set Queue (radio) <%{public}@>: destination not available, local allowed %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v13 = (void *)objc_msgSend(v12, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendQueue:toDestination:shouldResync:completion:", *(_QWORD *)(a1 + 40), v3, 0, *(_QWORD *)(a1 + 48));
  }

}

uint64_t sub_1CC98ED20(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a3);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    *(_QWORD *)(v6 + 88) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9[11];
    v12 = objc_msgSend(v9, "dryRun");
    v13 = &stru_1E88E41D0;
    v15 = 138543874;
    v16 = v11;
    v17 = 2114;
    if (v12)
      v13 = CFSTR(" ⚠️ DRY RUN");
    v18 = v10;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (localstore) <%{public}@>: search failed, use identifier %{public}@%{public}@", (uint8_t *)&v15, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_performStoreItemsSetQueueAsDryRun:completion:", objc_msgSend(*(id *)(a1 + 32), "dryRun"), *(_QWORD *)(a1 + 48));
}

void sub_1CC98EEA8(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[11];
  objc_msgSend(v2, "requesterSharedUserId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharedUserIdFromPlayableMusicAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CC98EF68;
  v7[3] = &unk_1E88E3E10;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  sub_1CC995BFC(CFSTR("Set Queue"), v3, v4, v5, v7);

}

void sub_1CC98EF68(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a3);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1CC98F188;
    v19[3] = &unk_1E88E3FA0;
    v8 = *(void **)(a1 + 40);
    v20 = *(id *)(a1 + 32);
    v21 = v8;
    objc_msgSend(v20, "_performWithCompletion:", v19);

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 88);
      *(_QWORD *)(v12 + 88) = v11;

    }
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      objc_msgSend(v9, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Set Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
}

void sub_1CC98F188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    *(_QWORD *)(v6 + 88) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(v3, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

__CFString *sub_1CC98F360(void *a1)
{
  void *v1;
  int v2;
  __CFString *v3;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC2028]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  if (v2)
    v3 = CFSTR("x-sampgeniusmix");
  else
    v3 = CFSTR("x-sampplaylist");
  return v3;
}

void sub_1CC98F634(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LOCAL_DEVICE"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeysForObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 56))
      objc_msgSend(v5, "removeObjectForKey:", v8);
  }
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v25 = *(id *)(a1 + 48);
    MRAVEndpointMoveOutputGroupToDevicesFromSource();

  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Move Output Group To Devices"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v15, "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Move Output Group To Devices (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v15, "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  }
}

void sub_1CC98F900(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithReason:", v5);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Move Output Group To Devices"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v14, v15, "Move Output Group To Devices (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D882E8]);
    objc_msgSend(v6, "setRouteResponse:", *MEMORY[0x1E0D88E30]);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Move Output Group To Devices"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

void sub_1CC98FE34(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC98FF0C;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC98FF0C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC98FFC0;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 19, a2, v5, v9);

}

void sub_1CC98FFC0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Seek To Playback Speed"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Playback Speed"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC990298(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC9905A4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  const char *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("x-sampmeditem")) & 1) == 0)
  {
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v34 = 138543362;
      v35 = v6;
      v21 = "Unknown identifier URL scheme: %{public}@";
LABEL_15:
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v34, 0xCu);
    }
LABEL_16:

    v32 = 0;
    goto LABEL_17;
  }
  v7 = sub_1CC9834E0(v5);
  v8 = v7;
  if (v7 != 4 && v7 != 1)
  {
    _MPLogCategoryAssistant();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 136315394;
      v35 = "/Library/Caches/com.apple.xbs/Sources/MobileMusicPlayer/AssistantBundle/Categories/SAMPMediaItem_MPAdditions.m";
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_ERROR, "[%s] Unsupported identifier URL host: %@", (uint8_t *)&v34, 0x16u);

    }
LABEL_13:
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v34 = 138412290;
      v35 = (const char *)v5;
      v21 = "Could not find item with identifier %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  v12 = (void *)MEMORY[0x1E0CC23C0];
  v13 = (void *)MEMORY[0x1E0CC2430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 4)
  {
    objc_msgSend(v13, "predicateWithValue:forProperty:", v14, *MEMORY[0x1E0CC1F70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v15;
    v16 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithValue:forProperty:", v17, *MEMORY[0x1E0CC1F80]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v18;
    v19 = v39;
  }
  else
  {
    objc_msgSend(v13, "predicateWithValue:forProperty:", v14, *MEMORY[0x1E0CC1ED0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    v24 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithValue:forProperty:", v17, *MEMORY[0x1E0CC1FD0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v18;
    v19 = v38;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingPredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc(MEMORY[0x1E0CC2438]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithFilterPredicates:library:", v29, v27);

  objc_msgSend(v30, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v30, "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(v30, "items");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_13;
LABEL_17:

  return v32;
}

void sub_1CC990D4C(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC990E24;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC990E24(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC990ED8;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 25, a2, v5, v9);

}

void sub_1CC990ED8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Set Repeat Mode"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Repeat Mode"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Set Repeat Mode (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC9911B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC99161C(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CC9916E0;
  v7[3] = &unk_1E88E2DD0;
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v7);

}

void sub_1CC9916E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CC991790;
  v7[3] = &unk_1E88E3978;
  v7[4] = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v6, "sendCommand:toDestination:withOptions:completion:", 5, a2, v5, v7);

}

void sub_1CC991790(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Seek To Previous Item"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Previous Item"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Previous Item (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC991A74(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_1CC992820(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if ((v4 & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v6;

    }
    _MPLogCategoryAssistant();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v11 = *(int *)(a1 + 40);
      v13 = 138543874;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      v17 = 2114;
      v18 = v2;
      _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (issupported) <%{public}@>: mode %ld not in %{public}@", (uint8_t *)&v13, 0x20u);
    }

  }
  return v4;
}

void sub_1CC992998(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1CC992AD4;
  v3[3] = &unk_1E88E2F10;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void sub_1CC992A04(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1CC992A70;
  v3[3] = &unk_1E88E2F10;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void sub_1CC992A70(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v4, "longLongValue"));

}

void sub_1CC992AD4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlobalPlaylistID:", v4);

}

void sub_1CC992B34(uint64_t a1, const void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[10];
    objc_msgSend(v9, "insertLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v10;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = a2;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: mode %{public}@ to origin %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  v29 = 0;
  objc_msgSend(v13, "_createPlaybackQueueWithCollection:error:", v12, &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  v16 = *(id **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v16, "insertLocation");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D88D70]) & 1) == 0
      && (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D88D80]) & 1) == 0)
    {
      objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D88D78]);
    }

    objc_msgSend(v14, "createRemotePlaybackQueue");
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    if (a2)
      CFRetain(a2);
    v28 = *(id *)(a1 + 40);
    MRMediaRemoteGetSupportedCommandsForOrigin();

  }
  else
  {
    if (!objc_msgSend(v16[10], "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 80);
      *(_QWORD *)(v20 + 80) = v19;

    }
    _MPLogCategoryAssistant();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (perform) <%{public}@>: playback queue creation failed %{public}@", buf, 0x16u);
    }

    v24 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v25 = (void *)objc_msgSend(v24, "initWithErrorCode:", *MEMORY[0x1E0D88DF8]);
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v25, "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  }
}

void sub_1CC992EA4(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v4 = objc_alloc_init(MEMORY[0x1E0D4B300]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1CC993598;
  v6[3] = &unk_1E88E2E48;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5 = v4;
  objc_msgSend(v5, "connectToEndpoint:completion:", a2, v6);

}

void sub_1CC992F5C(id *a1, uint64_t a2)
{
  dispatch_queue_t v3;
  id v4;
  id v5;
  id v6;

  if (a2)
  {
    v3 = dispatch_queue_create("com.apple.MPAssistantAddMediaItemsToUpNextQueue", 0);
    v4 = a1[7];
    MRMediaRemoteGetActiveOrigin();

  }
  else
  {
    v5 = a1[5];
    v6 = a1[6];
    MRAVEndpointGetMyGroupLeaderWithTimeout();

  }
}

void sub_1CC993058(uint64_t a1, void *a2)
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v5 = v3;
    objc_msgSend(a2, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D4B308]);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 56);
    *(_QWORD *)(v8 + 56) = v7;

    v10 = *(void **)(a1 + 48);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC993184;
    v16[3] = &unk_1E88E2EC0;
    v17 = v10;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v6, v16);

  }
  else
  {
    v12 = (objc_class *)MEMORY[0x1E0D87FE8];
    v13 = v3;
    v6 = (void *)objc_msgSend([v12 alloc], "initWithReason:", CFSTR("UID decoding error"));
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void sub_1CC993184(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v4 = CFSTR("Too many endpoints requested");
LABEL_6:
    v6 = (void *)objc_msgSend(v3, "initWithReason:", v4);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v4 = CFSTR("No endpoints found");
    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_7:

}

void sub_1CC993258(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(v31 + 80);
      *(_QWORD *)(v31 + 80) = v30;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v36 = 138543618;
    v37 = v33;
    v38 = 2114;
    v39 = a2;
    v15 = "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader endpoint %{public}@";
    v16 = v13;
    v17 = 22;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "code") == 33)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D4C8E8]);

    if (v8)
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 80);
        *(_QWORD *)(v11 + 80) = v10;

      }
      _MPLogCategoryAssistant();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v36 = 138543362;
      v37 = v14;
      v15 = "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader legacy";
      v16 = v13;
      v17 = 12;
LABEL_17:
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v36, v17);
LABEL_18:

      (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v34, v35);
      goto LABEL_19;
    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 80);
    *(_QWORD *)(v20 + 80) = v19;

  }
  _MPLogCategoryAssistant();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v36 = 138543618;
    v37 = v23;
    v38 = 2114;
    v39 = v6;
    _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (perform) <%{public}@>: group leader endpoint not found %{public}@", (uint8_t *)&v36, 0x16u);
  }

  v24 = objc_alloc(MEMORY[0x1E0D87FE8]);
  objc_msgSend(v6, "localizedFailureReason");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithReason:", v25);

  v27 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v26, "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

LABEL_19:
}

uint64_t sub_1CC993588(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC993598(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  id v14;
  id v15;

  v5 = (void *)a1[4];
  v15 = v5;
  if (a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0D87FE8];
    v7 = v5;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithReason:", CFSTR("Failed to connect to endpoint"));
    v9 = a1[6];
    objc_msgSend(v8, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    v12 = a1[5];
    v13 = *(void (**)(uint64_t, uint64_t))(v12 + 16);
    v14 = v5;
    v13(v12, a3);
  }

}

void sub_1CC993640(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInsertionPositionSupported:origin:supportedCommands:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), a2) & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v4;

    }
    _MPLogCategoryAssistant();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v9 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: sending add request to %@", buf, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v32;
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length");
    if (v13)
    {
      if (!v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 80);
        *(_QWORD *)(v17 + 80) = v16;

      }
      _MPLogCategoryAssistant();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        *(_DWORD *)buf = 138543618;
        v34 = v20;
        v35 = 2114;
        v36 = v13;
        _os_log_impl(&dword_1CC97B000, v19, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: could not encode user identity: %{public}@", buf, 0x16u);
      }

    }
    else
    {
      if (!v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 80);
        *(_QWORD *)(v25 + 80) = v24;

      }
      _MPLogCategoryAssistant();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        *(_DWORD *)buf = 138543619;
        v34 = v28;
        v35 = 2113;
        v36 = v12;
        _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (perform) <%{public}@>: user identity set to: %{private}@", buf, 0x16u);
      }

      objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x1E0D4CD30]);
    }
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v29)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D4CCA0]);
    v31 = *(id *)(a1 + 40);
    MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions();

  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v10 = (id)objc_msgSend(v21, "initWithErrorCode:", *MEMORY[0x1E0D88E88]);
    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v13);
  }

  MRSystemAppPlaybackQueueDestroy();
  v30 = *(const void **)(a1 + 48);
  if (v30)
    CFRelease(v30);
}

void sub_1CC993A24(uint64_t a1, unsigned int a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2)
  {
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MediaRemote command failed. err = %ld"), a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "initWithReason:", v5);

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  }
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void sub_1CC993AE0(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a3);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1CC993D00;
    v19[3] = &unk_1E88E3D48;
    v8 = *(void **)(a1 + 40);
    v20 = *(id *)(a1 + 32);
    v21 = v8;
    objc_msgSend(v20, "_perform:", v19);

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 80);
      *(_QWORD *)(v12 + 80) = v11;

    }
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      objc_msgSend(v9, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
}

void sub_1CC993D00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1CC994128(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC994200;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC994200(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC9942B4;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 24, a2, v5, v9);

}

void sub_1CC9942B4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Seek To Playback Position"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Seek To Playback Position"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Seek To Playback Position (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC99458C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC994594(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4C910]))
  {
    v3 = (objc_class *)MEMORY[0x1E0D88280];
LABEL_5:
    v4 = objc_alloc_init(v3);
    goto LABEL_7;
  }
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4C8F0]))
  {
    v3 = (objc_class *)MEMORY[0x1E0D88208];
    goto LABEL_5;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D882A8]);
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CA40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenre:", v5);

LABEL_7:
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C980]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtist:", v6);

  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C968]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlbum:", v7);

  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CB40]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CB80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4C8F8]))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v11, "setScheme:", CFSTR("x-sampradiotrack"));
    objc_msgSend(v11, "setHost:", CFSTR("device"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%lld"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPath:", v12);

    objc_msgSend(v11, "URL");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setIdentifier:", v13);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23F0]), "initWithPersistentID:", v10);
    if (v14)
    {
      v15 = (objc_class *)MEMORY[0x1E0D4B310];
      v13 = v14;
      v16 = objc_alloc_init(v15);
      objc_msgSend(v13, "multiverseIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "encodeURLData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v13, "identifierURLScheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setScheme:", v21);
      objc_msgSend(v20, "setHost:", CFSTR("multiverse"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPath:", v22);

      objc_msgSend(v20, "URL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setIdentifier:", v23);
    }
    else
    {
      v13 = 0;
    }
  }

  return v4;
}

id sub_1CC9948E4(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (objc_class *)MEMORY[0x1E0D87FC8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setDate:", v2);

  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZoneId:", v5);

  return v3;
}

BOOL sub_1CC994964(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "getPropertiesForUserIdentity:error:", v1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue")
    && objc_msgSend(v3, "isActiveLocker")
    && MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity() == 0;

  return v5;
}

id sub_1CC994A10(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "substringToIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v12 = v3;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (gethash) <%{public}@>: ace id: %{public}@", buf, 0x20u);
  }

  return v8;
}

void sub_1CC994B48(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_INFO, "%{public}@ (hashedroute) <%{public}@>: encoded route UID table", buf, 0x16u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        _MPLogCategoryAssistant();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v21 = v5;
          v22 = 2114;
          v23 = v6;
          v24 = 2114;
          v25 = v14;
          _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_INFO, "%{public}@ (hashedroute) <%{public}@>: id: %{public}@", buf, 0x20u);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v11);
  }

}

uint64_t sub_1CC994D30(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v6))
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

id sub_1CC994E2C(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "containsObject:", &unk_1E88E9D90) & 1) != 0)
  {
LABEL_2:
    v2 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    goto LABEL_23;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v4)
  {
LABEL_20:

    v15 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("player statuses: %@"), v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithReason:", v16);

    goto LABEL_24;
  }
  v5 = v4;
  v6 = *(_QWORD *)v20;
  v7 = (uint64_t *)MEMORY[0x1E0D88E00];
  v8 = (uint64_t *)MEMORY[0x1E0D88D90];
  v9 = (uint64_t *)MEMORY[0x1E0D88DC0];
  v10 = (uint64_t *)MEMORY[0x1E0D88E60];
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v6)
      objc_enumerationMutation(v3);
    v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "unsignedIntValue");
    if (v12 > 99)
      break;
    if (v12 == 1)
    {
      v13 = v7;
      goto LABEL_17;
    }
    if (v12 == 20)
    {
      v13 = v8;
      goto LABEL_17;
    }
LABEL_18:
    if (v5 == ++v11)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  if (v12 != 101)
  {
    if (v12 == 100)
    {
      v13 = v10;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v13 = v9;
LABEL_17:
  v14 = *v13;
  if (*v13 == -1)
    goto LABEL_18;

  if (!v14)
    goto LABEL_2;
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithErrorCode:", v14);
LABEL_23:
  v17 = v2;
LABEL_24:

  return v17;
}

void sub_1CC995028(void *a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[10];
  int v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("pluginname"));
  _MPLogCategoryAssistant();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138543874;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: feedback command %{public}@", buf, 0x20u);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1CC995218;
  v23[3] = &unk_1E88E3028;
  v24 = a3;
  v23[4] = v9;
  v23[5] = v10;
  v23[6] = v11;
  v23[7] = v14;
  v23[8] = v13;
  v23[9] = v12;
  v17 = v13;
  v18 = v14;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  v22 = v9;
  sub_1CC995218((uint64_t)v23, 0);

}

void sub_1CC995218(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CFTypeRef v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, CFArrayRef);
  void *v20;
  id v21;
  int v22;

  if (cf)
    CFRetain(cf);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_DWORD *)(a1 + 80);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC995364;
  v8[3] = &unk_1E88E3000;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = cf;
  v11 = *(id *)(a1 + 48);
  v16 = *(_DWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v6 = v8;
  v17 = v4;
  v18 = 3221225472;
  v19 = sub_1CC9954F4;
  v20 = &unk_1E88E3050;
  v22 = v5;
  v21 = v6;
  v7 = v6;
  MRMediaRemoteGetSupportedCommandsForOrigin();

}

void sub_1CC995364(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _MPLogCategoryAssistant();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: getting now playing", buf, 0x16u);
  }

  v5 = a1[6];
  v6 = a1[4];
  v7 = a1[5];
  v10 = a1[9];
  v8 = a1[7];
  v9 = a1[8];
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

}

uint64_t sub_1CC9954F4(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  unsigned int v7;
  const void *ValueAtIndex;
  BOOL v9;

  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    v7 = 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v6);
      v9 = MEMORY[0x1D17B01A4](ValueAtIndex) == *(_DWORD *)(a1 + 40);
      v6 = v7++;
    }
    while (!v9 && v5 > v6);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC995574(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39[5];
  id v40;
  char v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v41 = 0;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D4CA80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v39[1] = (id)MEMORY[0x1E0C809B0];
    v39[2] = (id)3221225472;
    v39[3] = sub_1CC9959CC;
    v39[4] = &unk_1E88E2F88;
    v40 = v3;
    MPMediaRemoteCommandOptionsForFeedbackOrPurchaseCommandEvent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = 0;
  }
  v9 = *MEMORY[0x1E0D88DB0];
  if (*(_BYTE *)(a1 + 92))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v39[0] = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, v39);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v39[0];
      if (!v12)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D4CD30]);

    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.MediaAssistant.siri"), *MEMORY[0x1E0D4CCC0]);
    v13 = objc_alloc_init(MEMORY[0x1E0D4B318]);
    objc_msgSend(v13, "setOrigin:", *(_QWORD *)(a1 + 80));
    v14 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v43 = v16;
      v44 = 2114;
      v45 = v17;
      v46 = 2114;
      v47 = v8;
      _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ (feedback) <%{public}@>: sending command with options: %{public}@", buf, 0x20u);
    }

    v18 = *(unsigned int *)(a1 + 88);
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = sub_1CC9959D8;
    v33[3] = &unk_1E88E2FB0;
    v34 = v14;
    v37 = *(id *)(a1 + 72);
    v35 = *(id *)(a1 + 56);
    v38 = v9;
    v36 = *(id *)(a1 + 64);
    v19 = v14;
    objc_msgSend(v19, "sendCommand:toDestination:withOptions:completion:", v18, v13, v8, v33);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 72))
      goto LABEL_17;
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v43 = v21;
      v44 = 2114;
      v45 = v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "%{public}@ (feedback) <%{public}@>: command not supported", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v24, CFSTR("errorcode"));

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
    objc_msgSend(v25, "numberWithDouble:", fabs(v26));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v27, CFSTR("duration"));

    v28 = *(_QWORD *)(a1 + 72);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithErrorCode:", v9);
    objc_msgSend(v29, "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v30);

    v32 = *(id *)(a1 + 56);
    AnalyticsSendEventLazy();
    v13 = v32;
  }

LABEL_17:
  v31 = *(const void **)(a1 + 80);
  if (v31)
    CFRelease(v31);

}

uint64_t sub_1CC9959CC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

void sub_1CC9959D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v5 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 56))
  {
    if (sub_1CC994D30(a3))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
      objc_msgSend(v6, "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithErrorCode:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v8, "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, CFSTR("errorcode"));

    }
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
    objc_msgSend(v11, "numberWithDouble:", fabs(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, CFSTR("duration"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v14 = *(id *)(a1 + 40);
    AnalyticsSendEventLazy();

  }
}

id sub_1CC995B8C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC995B94(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC995B9C()
{
  if (qword_1EF9DDBC8 != -1)
    dispatch_once(&qword_1EF9DDBC8, &unk_1E88E3070);
  return (id)qword_1EF9DDBD0;
}

void sub_1CC995BDC()
{
  dispatch_group_t v0;
  void *v1;

  v0 = dispatch_group_create();
  v1 = (void *)qword_1EF9DDBD0;
  qword_1EF9DDBD0 = (uint64_t)v0;

}

void sub_1CC995BFC(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  void (**v41)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  void (**v48)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((MSVDeviceIsAudioAccessory() & 1) != 0)
  {
    v43 = v12;
    v14 = objc_alloc_init(MEMORY[0x1E0CFE920]);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1CC996290;
    v50[3] = &unk_1E88E30E8;
    v15 = v14;
    v51 = v15;
    v16 = v9;
    v52 = v16;
    v42 = v10;
    v17 = v10;
    v53 = v17;
    v40 = v13;
    v54 = v40;
    v41 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17B0600](v50);
    v18 = v16;
    v19 = v17;
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isInternalBuild");

    if (v21)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
      v22 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriLibrarySharedUserID"), CFSTR("com.apple.mobileipod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        if (v23)
        {
          _MPLogCategoryAssistant();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v56 = v18;
            v57 = 2114;
            v58 = v19;
            _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ (utility) <%{public}@>: override library Shared User ID in place", buf, 0x16u);
          }

        }
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

    v26 = v18;
    v27 = v19;
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isInternalBuild");

    if (v29)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
      v30 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriRequesterSharedUserID"), CFSTR("com.apple.mobileipod"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v30;
        if (v31)
        {
          _MPLogCategoryAssistant();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v56 = v26;
            v57 = 2114;
            v58 = v27;
            _os_log_impl(&dword_1CC97B000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ (utility) <%{public}@>: override requester Shared User ID in place", buf, 0x16u);
          }

        }
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
    v12 = v43;

    if (v23)
    {
      if (v31)
      {
LABEL_25:
        if (objc_msgSend(v23, "length"))
        {
          _MPLogCategoryAssistant();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543875;
            v56 = v26;
            v57 = 2114;
            v58 = v27;
            v59 = 2113;
            v60 = v23;
            _os_log_impl(&dword_1CC97B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: library Shared User ID %{private}@", buf, 0x20u);
          }

          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = sub_1CC99639C;
          v44[3] = &unk_1E88E3138;
          v45 = v26;
          v46 = v27;
          v47 = v31;
          v34 = v41;
          v48 = v41;
          v49 = v40;
          ((void (**)(_QWORD, id, uint64_t, _QWORD *))v41)[2](v48, v23, 1, v44);

          v35 = v45;
        }
        else
        {
          v36 = objc_msgSend(v31, "length");
          _MPLogCategoryAssistant();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
          if (v36)
          {
            if (v38)
            {
              objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543875;
              v56 = v26;
              v57 = 2114;
              v58 = v27;
              v59 = 2113;
              v60 = v39;
              _os_log_impl(&dword_1CC97B000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in forced guest mode with forced private listening: YES", buf, 0x20u);

            }
            objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *, _QWORD))v40 + 2))(v40, v35, MEMORY[0x1E0C9AAB0]);
            v12 = v43;
          }
          else
          {
            v12 = v43;
            if (v38)
            {
              *(_DWORD *)buf = 138543618;
              v56 = v26;
              v57 = 2114;
              v58 = v27;
              _os_log_impl(&dword_1CC97B000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using active account with configured private listening", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *, _QWORD))v40 + 2))(v40, v35, 0);
          }
          v34 = v41;
        }

        v10 = v42;
        goto LABEL_40;
      }
    }
    else
    {
      v23 = v43;
      if (v31)
        goto LABEL_25;
    }
    v31 = v11;
    goto LABEL_25;
  }
  _MPLogCategoryAssistant();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v56 = v9;
    v57 = 2114;
    v58 = v10;
    _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using active account with configured private listening for single user only device", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v15, 0);
LABEL_40:

}

void sub_1CC996290(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1CC9967F8;
  v12[3] = &unk_1E88E30C0;
  v13 = v9;
  v19 = a3;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v13, "getHomeUserIdForSharedUserId:completion:", v10, v12);

}

void sub_1CC99639C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MPLogCategoryAssistant();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543875;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    v26 = 2113;
    v27 = v3;
    _os_log_impl(&dword_1CC97B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: library User Identity %{private}@", buf, 0x20u);
  }

  v7 = objc_msgSend(*(id *)(a1 + 48), "length");
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543875;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2113;
      v27 = v12;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: requester Shared User ID %{private}@", buf, 0x20u);
    }

    v14 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1CC9965F4;
    v17[3] = &unk_1E88E3110;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v20 = v3;
    v21 = *(id *)(a1 + 64);
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD *))(v13 + 16))(v13, v14, 0, v17);

  }
  else
  {
    if (v9)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2113;
      v27 = v3;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in guest mode with forced private listening: YES", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void sub_1CC9965F4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MPLogCategoryAssistant();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v18 = 138543875;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    v22 = 2113;
    v23 = v3;
    _os_log_impl(&dword_1CC97B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: requester User Identity %{private}@", (uint8_t *)&v18, 0x20u);
  }

  objc_msgSend(v3, "DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v18 = 138543875;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      v22 = 2113;
      v23 = v14;
      _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ and not enforcing private listening override because requester and library match", (uint8_t *)&v18, 0x20u);
    }
  }
  else if (v11)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v18 = 138543875;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2113;
    v23 = v17;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: using %{private}@ in cross-user mode with forced private listening: YES", (uint8_t *)&v18, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_1CC9967F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MPLogCategoryAssistant();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544131;
      v24 = v8;
      v25 = 2114;
      v26 = v9;
      v27 = 2113;
      v28 = v10;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ (sharedid) <%{public}@>: shared ID %{private}@ not available: %{public}@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1CC996A08;
    v14[3] = &unk_1E88E3098;
    v15 = *(id *)(a1 + 32);
    v22 = *(_BYTE *)(a1 + 80);
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v18 = v5;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 72);
    v19 = v11;
    v13 = v11;
    objc_msgSend(v12, "ic_storeAccountForHomeUserIdentifier:completion:", v13, v14);

  }
}

void sub_1CC996A08(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void (*v15)(void);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v35 = 138544131;
      v36 = v9;
      v37 = 2114;
      v38 = v10;
      v39 = 2113;
      v40 = v11;
      v41 = 2114;
      v42 = v6;
      v12 = "%{public}@ (sharedid) <%{public}@>: home ID %{private}@ not found in database: %{public}@";
      v13 = v8;
      v14 = 42;
LABEL_4:
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v35, v14);
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  objc_msgSend(v5, "ic_DSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "longLongValue");

  if (!v17)
  {
    v27 = *(unsigned __int8 *)(a1 + 88);
    _MPLogCategoryAssistant();
    v28 = objc_claimAutoreleasedReturnValue();
    v8 = v28;
    if (!v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 48);
        v34 = *(_QWORD *)(a1 + 56);
        v35 = 138543875;
        v36 = v32;
        v37 = 2114;
        v38 = v33;
        v39 = 2113;
        v40 = v34;
        _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ (sharedid) <%{public}@>: no DSID for home ID: %{private}@, but it is NOT required", (uint8_t *)&v35, 0x20u);
      }

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
      goto LABEL_6;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(_QWORD *)(a1 + 48);
      v31 = *(_QWORD *)(a1 + 56);
      v35 = 138543875;
      v36 = v29;
      v37 = 2114;
      v38 = v30;
      v39 = 2113;
      v40 = v31;
      v12 = "%{public}@ (sharedid) <%{public}@>: no DSID for home ID: %{private}@";
      v13 = v8;
      v14 = 32;
      goto LABEL_4;
    }
LABEL_5:

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_6:
    v15();
    goto LABEL_13;
  }
  objc_msgSend(v5, "ic_privateListeningEnabledForHomeUsers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", *(_QWORD *)(a1 + 64));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0CC2380], "isCurrentDeviceValidHomeAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0CC2390], "userMonitorWithHomeIdentifier:", *(_QWORD *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "isPrivateListeningEnabledForCurrentAccessory"));
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }

  }
  v23 = *(_QWORD *)(a1 + 80);
  v24 = (void *)MEMORY[0x1E0DDC100];
  objc_msgSend(v5, "ic_DSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "specificAccountWithDSID:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v26, v19);

LABEL_13:
}

void sub_1CC996D10(void *a1, void *a2, int a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t (*v71)(uint64_t, uint64_t);
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  void *v78;
  id v79;
  NSObject *v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  id v95;
  NSObject *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  NSObject *v101;
  int v102;
  void *v103;
  id v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  NSObject *v113;
  NSObject *v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id obj;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  id v140;
  NSObject *group;
  dispatch_queue_t v142;
  uint64_t v144;
  void *v145;
  uint64_t *v146;
  uint64_t i;
  NSObject *v148;
  id v149;
  id v150;
  NSObject *queue;
  dispatch_queue_t queuea;
  NSObject *v153;
  id v154;
  id v155;
  dispatch_queue_t v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, void *);
  void *v161;
  NSObject *v162;
  id v163;
  NSObject *v164;
  id v165;
  NSObject *v166;
  id v167;
  NSObject *v168;
  _QWORD *v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD *v172;
  char v173;
  char v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[3];
  int v180;
  _QWORD v181[3];
  int v182;
  _QWORD v183[4];
  id v184;
  _QWORD v185[4];
  int v186;
  _QWORD v187[5];
  id v188;
  _QWORD v189[5];
  id v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  id v201;
  id v202;
  NSObject *v203;
  id v204;
  NSObject *v205;
  NSObject *v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t (*v215)(uint64_t, uint64_t);
  void (*v216)(uint64_t);
  id v217;
  _BYTE block[24];
  uint64_t (*v219)(uint64_t, uint64_t);
  __int128 v220;
  id v221;
  id v222;
  uint64_t *v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  _BYTE *v236;
  __int128 *v237;
  uint64_t *v238;
  uint64_t *v239;
  uint64_t *v240;
  _BYTE buf[24];
  void *v242;
  __int128 v243;
  id v244;
  NSObject *v245;
  NSObject *v246;
  id v247;
  id v248;
  __int128 *v249;
  __int128 *v250;
  uint64_t *v251;
  uint64_t *v252;
  _BYTE *v253;
  uint64_t *v254;
  char v255;
  uint64_t v256;

  v256 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a2;
  v132 = a1;
  v130 = v9;
  v131 = v8;
  v129 = v10;
  if (!_os_feature_enabled_impl())
  {
    v86 = v132;
    v87 = v10;
    v88 = v8;
    v89 = v87;
    v90 = v9;
    v154 = v88;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setObject:forKeyedSubscript:", v86, CFSTR("plugin_name"));
    v197 = 0;
    v198 = (uint64_t)&v197;
    v199 = 0x3010000000;
    v202 = 0;
    v200 = &unk_1CC9B747B;
    v201 = 0;
    _MPLogCategoryAssistant();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v86;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v89;
      _os_log_impl(&dword_1CC97B000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting dynamite client state using ACAccount", buf, 0x16u);
    }

    v156 = dispatch_queue_create("com.apple.Assistant.MPAssistantUtilitiesGetDynamiteClientState", 0);
    v94 = dispatch_group_create();
    v95 = objc_alloc_init(MEMORY[0x1E0D88068]);
    *(_QWORD *)block = 0;
    *(_QWORD *)&block[8] = block;
    *(_QWORD *)&block[16] = 0x3032000000;
    v219 = sub_1CC9985D8;
    *(_QWORD *)&v220 = sub_1CC9985E8;
    *((_QWORD *)&v220 + 1) = 0;
    *(_QWORD *)&v208 = 0;
    *((_QWORD *)&v208 + 1) = &v208;
    *(_QWORD *)&v209 = 0x3032000000;
    *((_QWORD *)&v209 + 1) = sub_1CC9985D8;
    *(_QWORD *)&v210 = sub_1CC9985E8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    *((_QWORD *)&v210 + 1) = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v175 = 0;
    *((_QWORD *)&v175 + 1) = &v175;
    *(_QWORD *)&v176 = 0x2810000000;
    *((_QWORD *)&v176 + 1) = &unk_1CC9B747B;
    LODWORD(v177) = 0;
    if ((MSVDeviceIsAudioAccessory() & 1) != 0)
      goto LABEL_61;
    _MPLogCategoryAssistant();
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v86;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v89;
      _os_log_impl(&dword_1CC97B000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting stored WLK configuration", buf, 0x16u);
    }

    v225 = 0;
    v226 = (uint64_t)&v225;
    v227 = 0x2050000000;
    v97 = (void *)qword_1ED8AFE08;
    v228 = (void *)qword_1ED8AFE08;
    if (!qword_1ED8AFE08)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1CC9985F0;
      v242 = &unk_1E88E34C0;
      *(_QWORD *)&v243 = &v225;
      sub_1CC9985F0((uint64_t)buf);
      v97 = *(void **)(v226 + 24);
    }
    v98 = objc_retainAutorelease(v97);
    _Block_object_dispose(&v225, 8);
    objc_msgSend(v98, "sharedInstance");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "storedConfiguration");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v95, "setActiveTvUser:", objc_msgSend(v100, "activeUser"));
      _MPLogCategoryAssistant();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        v102 = objc_msgSend(v100, "activeUser");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v89;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v242) = v102;
        _os_log_impl(&dword_1CC97B000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: active TV user: %{BOOL}u", buf, 0x1Cu);
      }
    }
    else
    {
      v225 = 0;
      v226 = (uint64_t)&v225;
      v227 = 0x2050000000;
      v103 = (void *)qword_1EF9DDBD8;
      v228 = (void *)qword_1EF9DDBD8;
      if (!qword_1EF9DDBD8)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_1CC9986B4;
        v242 = &unk_1E88E34C0;
        *(_QWORD *)&v243 = &v225;
        sub_1CC9986B4((uint64_t)buf);
        v103 = *(void **)(v226 + 24);
      }
      v104 = objc_retainAutorelease(v103);
      _Block_object_dispose(&v225, 8);
      if (!v104)
        goto LABEL_60;
      dispatch_group_enter(v94);
      _MPLogCategoryAssistant();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v89;
        _os_log_impl(&dword_1CC97B000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting WLK configuration", buf, 0x16u);
      }

      objc_msgSend(v104, "sharedInstance");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = MEMORY[0x1E0C809B0];
      v159 = 3221225472;
      v160 = sub_1CC998778;
      v161 = &unk_1E88E3200;
      v162 = v156;
      v163 = v95;
      v164 = v86;
      v165 = v89;
      v166 = v94;
      objc_msgSend(v106, "fetchConfigurationWithCompletionHandler:", &v158);

      v101 = v162;
    }

LABEL_60:
LABEL_61:
    v107 = v90;
    v108 = v92;
    v212 = 0;
    v213 = &v212;
    v214 = 0x2020000000;
    LODWORD(v215) = 0;
    v191 = 0;
    v192 = &v191;
    v193 = 0x2020000000;
    LODWORD(v194) = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v94);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_1CC99883C;
    v242 = &unk_1E88E32B8;
    queuea = v107;
    *(_QWORD *)&v243 = queuea;
    v111 = v86;
    *((_QWORD *)&v243 + 1) = v111;
    v112 = v89;
    v244 = v112;
    v113 = v94;
    v245 = v113;
    v255 = a3;
    v114 = v156;
    v246 = v114;
    v249 = &v175;
    v250 = &v208;
    v115 = v95;
    v247 = v115;
    v251 = &v191;
    v116 = v109;
    v248 = v116;
    v252 = &v212;
    v253 = block;
    v254 = &v197;
    objc_msgSend(v110, "ic_allStoreAccountsWithCompletion:", buf);

    v117 = v108;
    v225 = MEMORY[0x1E0C809B0];
    v226 = 3221225472;
    v227 = (uint64_t)sub_1CC999B10;
    v228 = &unk_1E88E32E0;
    v229 = v111;
    v230 = v112;
    v231 = v115;
    v232 = v116;
    v236 = block;
    v235 = v154;
    v233 = v108;
    v234 = v91;
    v237 = &v208;
    v238 = &v197;
    v239 = &v212;
    v240 = &v191;
    v118 = v91;
    v119 = v117;
    v157 = v154;
    v120 = v116;
    v121 = v115;
    v122 = v112;
    v123 = v111;
    dispatch_group_notify(v113, v114, &v225);

    _Block_object_dispose(&v191, 8);
    _Block_object_dispose(&v212, 8);
    _Block_object_dispose(&v175, 8);
    _Block_object_dispose(&v208, 8);

    _Block_object_dispose(block, 8);
    _Block_object_dispose(&v197, 8);

    goto LABEL_62;
  }
  v149 = v132;
  v148 = v10;
  v11 = v9;
  v126 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v128 = objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v128, "setObject:forKeyedSubscript:", v149, CFSTR("plugin_name"));
  v191 = 0;
  v192 = &v191;
  v193 = 0x3010000000;
  v196 = 0;
  v194 = &unk_1CC9B747B;
  v195 = 0;
  _MPLogCategoryAssistant();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v149;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v148;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v242) = a3;
    _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: getting dynamite client state using media user state, syncing: %d", buf, 0x1Cu);
  }

  v142 = dispatch_queue_create("com.apple.Assistant.MPAssistantUtilitiesGetDynamiteClientState", 0);
  group = dispatch_group_create();
  v140 = objc_alloc_init(MEMORY[0x1E0D88068]);
  v189[0] = 0;
  v189[1] = v189;
  v189[2] = 0x3032000000;
  v189[3] = sub_1CC9985D8;
  v189[4] = sub_1CC9985E8;
  v190 = 0;
  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x3032000000;
  v187[3] = sub_1CC9985D8;
  v187[4] = sub_1CC9985E8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v188 = (id)objc_claimAutoreleasedReturnValue();
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x2810000000;
  v185[3] = &unk_1CC9B747B;
  v186 = 0;
  objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allUserStates");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v183[0] = MEMORY[0x1E0C809B0];
  v183[1] = 3221225472;
  v183[2] = sub_1CC99BFC0;
  v183[3] = &unk_1E88E3160;
  v124 = v11;
  v184 = v124;
  objc_msgSend(v127, "msv_firstWhere:", v183);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  _MPLogCategoryAssistant();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v145, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    *(_QWORD *)&buf[4] = v149;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v148;
    *(_WORD *)&buf[22] = 2113;
    v242 = v15;
    _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: found prefferedMediaUserStateCandidate=%{private}@", buf, 0x20u);

  }
  v181[0] = 0;
  v181[1] = v181;
  v181[2] = 0x2020000000;
  v182 = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  v180 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allUserStates");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, &v225, 16);
  if (v144)
  {
    v137 = *MEMORY[0x1E0D886E8];
    v138 = *(_QWORD *)v176;
    v136 = *MEMORY[0x1E0D886F0];
    v134 = *MEMORY[0x1E0D88C38];
    v135 = *MEMORY[0x1E0D88C30];
    do
    {
      for (i = 0; i != v144; ++i)
      {
        if (*(_QWORD *)v176 != v138)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "isEqual:", v145);
        v19 = v18;
        if (v145)
          v20 = 1;
        else
          v20 = v18;
        if ((v20 & 1) == 0)
          v19 = objc_msgSend(v17, "isActive");
        dispatch_group_enter(group);
        v158 = MEMORY[0x1E0C809B0];
        v159 = 3221225472;
        v160 = (void (*)(uint64_t, void *))sub_1CC99C000;
        v161 = &unk_1E88E31B0;
        v162 = v142;
        v173 = v19;
        v21 = v149;
        v163 = v21;
        v22 = v148;
        v164 = v22;
        v165 = v17;
        v169 = v185;
        v170 = v187;
        v23 = v140;
        v174 = a3;
        v166 = v23;
        v171 = v179;
        v167 = v139;
        v172 = v181;
        v168 = group;
        v155 = v21;
        v153 = v22;
        v24 = v17;
        v146 = &v158;
        _MPLogCategoryAssistant();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v24, "shortDebugName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = v149;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v148;
          *(_WORD *)&buf[22] = 2113;
          v242 = v26;
          _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: getting user state for %{private}@", buf, 0x20u);

        }
        v212 = 0;
        v213 = &v212;
        v214 = 0x3032000000;
        v215 = sub_1CC9985D8;
        v216 = sub_1CC9985E8;
        v27 = (objc_class *)MEMORY[0x1E0D885F0];
        v28 = v24;
        v29 = objc_alloc_init(v27);
        objc_msgSend(v29, "setAgeVerificationRequired:", objc_msgSend(v28, "ageVerificationRequired"));
        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "music");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "usesListeningHistory") ^ 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setUserHistoryUnmodifiable:", v32);

        objc_msgSend(v28, "music");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "subscriptionStatus");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (~(unsigned __int16)objc_msgSend(v34, "capabilities") & 0x101) == 0;

        if (v35)
          v36 = v137;
        else
          v36 = v136;
        objc_msgSend(v29, "setStatus:", v36);
        objc_msgSend(v29, "setIsPromotionRelatedStatus:", 0);
        objc_msgSend(v28, "music");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subscriptionStatus");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "eligibleOffers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setEligibleOffers:", v39);

        objc_msgSend(v28, "music");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "subscriptionStatus");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "isMatchEnabled"))
          v42 = v135;
        else
          v42 = v134;
        objc_msgSend(v29, "setITunesMatchSubscriptionStatus:", v42);

        v43 = objc_alloc_init(MEMORY[0x1E0D885F8]);
        v44 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "music");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "libraryAuthTokenStatus");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastError");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v47, "code"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setErrorCode:", v48);

        v49 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "music");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "libraryAuthTokenStatus");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "lastUpdatedDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "timeIntervalSinceReferenceDate");
        objc_msgSend(v49, "numberWithDouble:");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setLastUpdateAttemptTime:", v53);

        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "music");
        v55 = objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v55, "libraryAuthTokenStatus");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "numberWithBool:", objc_msgSend(v56, "shouldExcludeFromBackgroundRefresh"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setShouldExcludeFromBackgroundRefresh:", v57);

        objc_msgSend(v29, "setUserTokenStatus:", v43);
        v217 = v29;
        objc_msgSend(v28, "homeUserIDs");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v55) = objc_msgSend(v58, "count") == 0;

        if ((v55 & 1) != 0)
        {
          _MPLogCategoryAssistant();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "shortDebugName");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            *(_QWORD *)&buf[4] = v149;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v148;
            *(_WORD *)&buf[22] = 2113;
            v242 = v78;
            _os_log_impl(&dword_1CC97B000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user does not have any home IDs for %{private}@", buf, 0x20u);

          }
          ((void (*)(uint64_t *, _QWORD, uint64_t))v160)(v146, 0, v213[5]);
        }
        else
        {
          _MPLogCategoryAssistant();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "shortDebugName");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v28, "homeUserIDs");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "numberWithUnsignedInteger:", objc_msgSend(v62, "count"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544131;
            *(_QWORD *)&buf[4] = v149;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v148;
            *(_WORD *)&buf[22] = 2113;
            v242 = v60;
            LOWORD(v243) = 2114;
            *(_QWORD *)((char *)&v243 + 2) = v63;
            _os_log_impl(&dword_1CC97B000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: media user state %{private}@ has %{public}@ homeUserIDs", buf, 0x2Au);

          }
          queue = dispatch_queue_create("com.apple.Assistant.MPAssistantGetDynamiteClientState.userState", 0);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_alloc_init((Class)sub_1CC97C554());
          v66 = dispatch_group_create();
          v208 = 0u;
          v209 = 0u;
          v210 = 0u;
          v211 = 0u;
          objc_msgSend(v28, "homeUserIDs");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v208, buf, 16);
          if (v68)
          {
            v69 = *(_QWORD *)v209;
            v150 = v67;
            do
            {
              for (j = 0; j != v68; ++j)
              {
                if (*(_QWORD *)v209 != v69)
                  objc_enumerationMutation(v150);
                v71 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v208 + 1) + 8 * j);
                dispatch_group_enter(v66);
                _MPLogCategoryAssistant();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  v73 = v28;
                  objc_msgSend(v28, "shortDebugName");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)block = 138544131;
                  *(_QWORD *)&block[4] = v149;
                  *(_WORD *)&block[12] = 2114;
                  *(_QWORD *)&block[14] = v148;
                  *(_WORD *)&block[22] = 2113;
                  v219 = v71;
                  LOWORD(v220) = 2113;
                  *(_QWORD *)((char *)&v220 + 2) = v74;
                  _os_log_impl(&dword_1CC97B000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching shared user id for home user id %{private}@ for %{private}@", block, 0x2Au);

                  v28 = v73;
                }

                v197 = MEMORY[0x1E0C809B0];
                v198 = 3221225472;
                v199 = (uint64_t)sub_1CC99C43C;
                v200 = &unk_1E88E3330;
                v75 = v65;
                v201 = v75;
                v202 = v155;
                v203 = v153;
                v204 = v28;
                v205 = v66;
                v206 = queue;
                v207 = v64;
                objc_msgSend(v75, "getConformingSharedUserIdForHomeUserId:completion:", v71, &v197);

              }
              v67 = v150;
              v68 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v208, buf, 16);
            }
            while (v68);
          }

          *(_QWORD *)block = MEMORY[0x1E0C809B0];
          *(_QWORD *)&block[8] = 3221225472;
          *(_QWORD *)&block[16] = sub_1CC99C678;
          v219 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E88E3358;
          *(_QWORD *)&v220 = v155;
          *((_QWORD *)&v220 + 1) = v153;
          v221 = v28;
          v223 = v146;
          v222 = v64;
          v224 = &v212;
          v76 = v64;
          dispatch_group_notify(v66, queue, block);

        }
        _Block_object_dispose(&v212, 8);

      }
      v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, &v225, 16);
    }
    while (v144);
  }

  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_1CC99C124;
  v242 = &unk_1E88E32E0;
  *(_QWORD *)&v243 = v140;
  *((_QWORD *)&v243 + 1) = v139;
  v244 = v149;
  v245 = v148;
  v249 = (__int128 *)v189;
  v248 = v126;
  v246 = v128;
  v247 = v125;
  v250 = (__int128 *)v187;
  v251 = &v191;
  v252 = v181;
  v253 = v179;
  v79 = v125;
  v80 = v128;
  v81 = v126;
  v82 = v148;
  v83 = v149;
  v84 = v139;
  v85 = v140;
  dispatch_group_notify(group, v142, buf);

  _Block_object_dispose(v179, 8);
  _Block_object_dispose(v181, 8);

  _Block_object_dispose(v185, 8);
  _Block_object_dispose(v187, 8);

  _Block_object_dispose(v189, 8);
  _Block_object_dispose(&v191, 8);

LABEL_62:
}

void sub_1CC998478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x350], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC9985D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC9985E8(uint64_t a1)
{

}

void sub_1CC9985F0(uint64_t a1)
{
  void *v2;
  void *v3;

  sub_1CC99BEC0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WLKStoredConfigurationManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED8AFE08 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getWLKStoredConfigurationManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPAssistantUtilities.m"), 49, CFSTR("Unable to find class %s"), "WLKStoredConfigurationManager");

    __break(1u);
  }
}

void sub_1CC9986B4(uint64_t a1)
{
  void *v2;
  void *v3;

  sub_1CC99BEC0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WLKConfigurationManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF9DDBD8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getWLKConfigurationManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPAssistantUtilities.m"), 47, CFSTR("Unable to find class %s"), "WLKConfigurationManager");

    __break(1u);
  }
}

void sub_1CC998778(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC99BDE0;
  block[3] = &unk_1E88E31D8;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void sub_1CC99883C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  BOOL v76;
  void *v77;
  NSObject *v78;
  id v79;
  id v80;
  id v81;
  _BOOL4 v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  _QWORD *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  id obj;
  id obja;
  void *v99;
  uint64_t v100;
  id v101;
  int v102;
  NSObject *v103;
  uint64_t v105;
  id v106;
  void *group;
  NSObject *groupa;
  _QWORD v109[2];
  void (*v110)(uint64_t, void *, void *, void *, void *, char, float, float, float, float);
  void *v111;
  NSObject *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  char v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[4];
  id v138;
  id v139;
  id v140;
  id v141;
  NSObject *v142;
  id v143;
  _QWORD *v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  void (*v151)(uint64_t, void *, void *);
  void *v152;
  NSObject *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  NSObject *v158;
  _QWORD *v159;
  uint64_t *v160;
  _QWORD v161[4];
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  NSObject *v168;
  _QWORD *v169;
  _QWORD *v170;
  uint64_t *v171;
  _QWORD v172[4];
  id v173;
  _QWORD v174[4];
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  NSObject *v180;
  _QWORD *v181;
  _QWORD *v182;
  uint64_t *v183;
  _QWORD v184[5];
  id v185;
  _QWORD v186[4];
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  NSObject *v192;
  _QWORD *v193;
  uint64_t *v194;
  _QWORD v195[5];
  id v196;
  _QWORD v197[4];
  int v198;
  uint64_t v199;
  float *v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  uint64_t v204;
  _BYTE v205[128];
  _BYTE v206[128];
  uint8_t v207[128];
  _BYTE block[24];
  void *v209;
  __int128 v210;
  id v211;
  id v212;
  id v213;
  _QWORD *v214;
  _QWORD *v215;
  _QWORD *v216;
  uint64_t *v217;
  BOOL v218;
  uint8_t buf[4];
  id v220;
  __int16 v221;
  id v222;
  __int16 v223;
  void *v224;
  uint64_t v225;

  v225 = *MEMORY[0x1E0C80C00];
  v80 = a2;
  v81 = a3;
  objc_msgSend(v80, "msv_filter:", &unk_1E88E3240);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    obj = v95;
    v101 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v207, 16);
    if (v101)
    {
      v100 = *(_QWORD *)v134;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v134 != v100)
          {
            v5 = v4;
            objc_enumerationMutation(obj);
            v4 = v5;
          }
          v105 = v4;
          v6 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v4);
          objc_msgSend(v6, "ic_homeUserIdentifiers");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "ams_isLocalAccount") & 1) != 0 || !objc_msgSend(v7, "count"))
            goto LABEL_23;
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v129, v206, 16);
          if (!v9)
          {

LABEL_23:
            goto LABEL_24;
          }
          v99 = 0;
          v10 = *(_QWORD *)v130;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v130 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * i), "UUIDString");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32));

              if (v13)
              {
                _MPLogCategoryAssistant();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = *(void **)(a1 + 40);
                  v15 = *(void **)(a1 + 48);
                  v17 = *(void **)(a1 + 32);
                  *(_DWORD *)buf = 138543875;
                  v220 = v16;
                  v221 = 2114;
                  v222 = v15;
                  v223 = 2113;
                  v224 = v17;
                  _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (preferredMediaUserHomeUserID) <%{public}@>: found preferredMediaUser's account with home ID: %{private}@", buf, 0x20u);
                }

                v18 = v6;
                v99 = v18;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v129, v206, 16);
          }
          while (v9);

          if (v99)
            goto LABEL_27;
LABEL_24:
          v4 = v105 + 1;
        }
        while ((id)(v105 + 1) != v101);
        v101 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v207, 16);
      }
      while (v101);
    }
    v99 = 0;
LABEL_27:

  }
  else
  {
    v99 = 0;
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v83 = v95;
  v89 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v205, 16);
  if (v89)
  {
    v88 = *(_QWORD *)v126;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v126 != v88)
        {
          v20 = v19;
          objc_enumerationMutation(v83);
          v19 = v20;
        }
        v96 = v19;
        v21 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v19);
        if (objc_msgSend(v21, "ams_isLocalAccount"))
        {
          _MPLogCategoryAssistant();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = *(void **)(a1 + 40);
            v24 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            v220 = v23;
            v221 = 2114;
            v222 = v24;
            _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: skipping local account", buf, 0x16u);
          }
        }
        else
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
          v26 = *(void **)(a1 + 40);
          v25 = *(void **)(a1 + 48);
          v102 = *(unsigned __int8 *)(a1 + 136);
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v110 = sub_1CC999E24;
          v111 = &unk_1E88E3290;
          v112 = *(id *)(a1 + 64);
          v113 = v21;
          v114 = v99;
          v115 = *(id *)(a1 + 40);
          v116 = *(id *)(a1 + 48);
          v120 = *(_OWORD *)(a1 + 88);
          v27 = *(id *)(a1 + 72);
          v124 = *(_BYTE *)(a1 + 136);
          v28 = *(_QWORD *)(a1 + 104);
          v117 = v27;
          v121 = v28;
          v118 = *(id *)(a1 + 80);
          v122 = *(_OWORD *)(a1 + 112);
          v123 = *(_QWORD *)(a1 + 128);
          v119 = *(id *)(a1 + 56);
          v93 = v26;
          v94 = v25;
          obja = v21;
          v91 = v109;
          v199 = 0;
          v200 = (float *)&v199;
          v201 = 0x3010000000;
          v202 = &unk_1CC9B747B;
          v203 = 0;
          v204 = 0;
          v106 = objc_alloc_init((Class)sub_1CC97C554());
          _MPLogCategoryAssistant();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(obja, "shortDebugName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            v220 = v93;
            v221 = 2114;
            v222 = v94;
            v223 = 2113;
            v224 = v30;
            _os_log_impl(&dword_1CC97B000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: getting user state for %{private}@", buf, 0x20u);

          }
          v90 = objc_alloc_init(MEMORY[0x1E0D885F0]);
          v197[0] = 0;
          v197[1] = v197;
          v197[2] = 0x2810000000;
          v197[3] = &unk_1CC9B747B;
          v198 = 0;
          v195[0] = 0;
          v195[1] = v195;
          v195[2] = 0x3032000000;
          v195[3] = sub_1CC9985D8;
          v195[4] = sub_1CC9985E8;
          v196 = 0;
          objc_msgSend(obja, "ic_DSID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "longLongValue") == 0;

          if (v32)
          {
            _MPLogCategoryAssistant();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(obja, "shortDebugName");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543875;
              v220 = v93;
              v221 = 2114;
              v222 = v94;
              v223 = 2113;
              v224 = v63;
              _os_log_impl(&dword_1CC97B000, v62, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: no DSID found in account for %{private}@", buf, 0x20u);

            }
            v110((uint64_t)v91, 0, 0, 0, 0, 0, v200[8], v200[9], v200[10], v200[11]);
          }
          else
          {
            v33 = (void *)MEMORY[0x1E0DDC100];
            objc_msgSend(obja, "ic_DSID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "specificAccountWithDSID:", v34);
            group = (void *)objc_claimAutoreleasedReturnValue();

            v35 = dispatch_group_create();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v35);
            objc_msgSend(MEMORY[0x1E0DDBEE0], "defaultManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v186[0] = MEMORY[0x1E0C809B0];
            v186[1] = 3221225472;
            v186[2] = sub_1CC999FE4;
            v186[3] = &unk_1E88E3380;
            v38 = v93;
            v187 = v38;
            v39 = v94;
            v188 = v39;
            v40 = obja;
            v189 = v40;
            v193 = v197;
            v41 = v90;
            v190 = v41;
            v194 = &v199;
            v42 = v36;
            v191 = v42;
            v43 = v35;
            v192 = v43;
            objc_msgSend(v37, "getAgeVerificationStateWithCompletion:", v186);

            dispatch_group_enter(v43);
            v184[0] = 0;
            v184[1] = v184;
            v184[2] = 0x3032000000;
            v184[3] = sub_1CC9985D8;
            v184[4] = sub_1CC9985E8;
            v185 = 0;
            objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v174[0] = MEMORY[0x1E0C809B0];
            v174[1] = 3221225472;
            v174[2] = sub_1CC99A150;
            v174[3] = &unk_1E88E33A8;
            v45 = v38;
            v175 = v45;
            v46 = v39;
            v176 = v46;
            v47 = v40;
            v177 = v47;
            v181 = v197;
            v48 = v41;
            v178 = v48;
            v182 = v184;
            v183 = &v199;
            v49 = v42;
            v179 = v49;
            v50 = v43;
            v180 = v50;
            objc_msgSend(v44, "getPropertiesForUserIdentity:completionHandler:", group, v174);

            _MPLogCategoryAssistant();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v47, "shortDebugName");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543875;
              v220 = v45;
              v221 = 2114;
              v222 = v46;
              v223 = 2113;
              v224 = v52;
              _os_log_impl(&dword_1CC97B000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching subscription status for %{private}@", buf, 0x20u);

            }
            dispatch_group_enter(v50);
            v53 = objc_alloc(MEMORY[0x1E0DDC0A0]);
            v172[0] = MEMORY[0x1E0C809B0];
            v172[1] = 3221225472;
            v172[2] = sub_1CC99A350;
            v172[3] = &unk_1E88E33D0;
            v86 = group;
            v173 = v86;
            v54 = (void *)objc_msgSend(v53, "initWithBlock:", v172);
            v55 = v48;
            v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFF8]), "initWithStoreRequestContext:", v54);
            objc_msgSend(v92, "setAllowsFallbackToExpiredStatus:", 1);
            objc_msgSend(v92, "setAllowsFallbackToStatusNeedingReload:", 1);
            objc_msgSend(MEMORY[0x1E0DDBFE8], "sharedStatusController");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v161[0] = MEMORY[0x1E0C809B0];
            v161[1] = 3221225472;
            v161[2] = sub_1CC99A3B0;
            v161[3] = &unk_1E88E3420;
            v57 = v45;
            v162 = v57;
            v58 = v46;
            v163 = v58;
            v59 = v47;
            v164 = v59;
            v84 = v54;
            v165 = v84;
            v169 = v197;
            v170 = v195;
            v87 = v55;
            v166 = v87;
            v171 = &v199;
            v85 = v49;
            v167 = v85;
            groupa = v50;
            v168 = groupa;
            objc_msgSend(v56, "performSubscriptionStatusRequest:withCompletionHandler:", v92, v161);

            if (v102)
            {
              _MPLogCategoryAssistant();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v59, "shortDebugName");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                v220 = v57;
                v221 = 2114;
                v222 = v58;
                v223 = 2113;
                v224 = v61;
                _os_log_impl(&dword_1CC97B000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: not syncing token for %{private}@", buf, 0x20u);

              }
            }
            else
            {
              _MPLogCategoryAssistant();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v59, "shortDebugName");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                v220 = v57;
                v221 = 2114;
                v222 = v58;
                v223 = 2113;
                v224 = v65;
                _os_log_impl(&dword_1CC97B000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching store client token for %{private}@", buf, 0x20u);

              }
              dispatch_group_enter(groupa);
              v149 = MEMORY[0x1E0C809B0];
              v150 = 3221225472;
              v151 = sub_1CC99A7F4;
              v152 = &unk_1E88E3448;
              v159 = v197;
              v153 = v57;
              v154 = v58;
              v155 = v59;
              v156 = v87;
              v160 = &v199;
              v157 = v85;
              v158 = groupa;
              MPStoreGetClientTokenStatusForIdentity();

              v60 = v153;
            }

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (MSVDeviceIsAudioAccessory())
            {
              objc_msgSend(v59, "ic_homeUserIdentifiers");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v67, "count") != 0;

              if (v82)
              {
                v147 = 0u;
                v148 = 0u;
                v145 = 0u;
                v146 = 0u;
                objc_msgSend(v59, "ic_homeUserIdentifiers");
                v68 = objc_claimAutoreleasedReturnValue();
                v69 = -[NSObject countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                v103 = v68;
                if (v69)
                {
                  v70 = *(_QWORD *)v146;
                  do
                  {
                    for (j = 0; j != v69; ++j)
                    {
                      if (*(_QWORD *)v146 != v70)
                        objc_enumerationMutation(v103);
                      objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * j), "UUIDString");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      dispatch_group_enter(groupa);
                      _MPLogCategoryAssistant();
                      v73 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v59, "shortDebugName");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)block = 138544131;
                        *(_QWORD *)&block[4] = v57;
                        *(_WORD *)&block[12] = 2114;
                        *(_QWORD *)&block[14] = v58;
                        *(_WORD *)&block[22] = 2113;
                        v209 = v72;
                        LOWORD(v210) = 2113;
                        *(_QWORD *)((char *)&v210 + 2) = v74;
                        _os_log_impl(&dword_1CC97B000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetching shared user id for home user id %{private}@ for %{private}@", block, 0x2Au);

                      }
                      v137[0] = MEMORY[0x1E0C809B0];
                      v137[1] = 3221225472;
                      v137[2] = sub_1CC99ABC4;
                      v137[3] = &unk_1E88E3470;
                      v75 = v106;
                      v138 = v75;
                      v139 = v57;
                      v140 = v58;
                      v141 = v59;
                      v142 = groupa;
                      v144 = v197;
                      v143 = v66;
                      objc_msgSend(v75, "getConformingSharedUserIdForHomeUserId:completion:", v72, v137);

                    }
                    v69 = -[NSObject countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                  }
                  while (v69);
                }
              }
              else
              {
                _MPLogCategoryAssistant();
                v103 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v59, "shortDebugName");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543875;
                  v220 = v57;
                  v221 = 2114;
                  v222 = v58;
                  v223 = 2113;
                  v224 = v77;
                  _os_log_impl(&dword_1CC97B000, v103, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user does not have any home IDs for %{private}@", buf, 0x20u);

                }
              }

              v76 = v82;
            }
            else
            {
              v76 = 0;
            }
            dispatch_get_global_queue(0, 0);
            v78 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)block = MEMORY[0x1E0C809B0];
            *(_QWORD *)&block[8] = 3221225472;
            *(_QWORD *)&block[16] = sub_1CC99ADBC;
            v209 = &unk_1E88E3498;
            *(_QWORD *)&v210 = v57;
            *((_QWORD *)&v210 + 1) = v58;
            v211 = v59;
            v214 = v91;
            v212 = v87;
            v213 = v66;
            v215 = v195;
            v216 = v184;
            v218 = v76;
            v217 = &v199;
            v79 = v66;
            dispatch_group_notify(groupa, v78, block);

            _Block_object_dispose(v184, 8);
          }
          _Block_object_dispose(v195, 8);

          _Block_object_dispose(v197, 8);
          _Block_object_dispose(&v199, 8);

          v22 = v112;
        }

        v19 = v96 + 1;
      }
      while (v96 + 1 != v89);
      v89 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v205, 16);
    }
    while (v89);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1CC999A5C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x468], 8);
  _Block_object_dispose(&STACK[0x4F8], 8);
  _Block_object_dispose(&STACK[0x528], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Unwind_Resume(a1);
}

void sub_1CC999B10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _MPLogCategoryAssistant();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v23 = v3;
    v24 = 2114;
    v25 = v4;
    v26 = 2114;
    v27 = v5;
    _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: finished getting dynamite client state: %{public}@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "setInContextUsersStates:", *(_QWORD *)(a1 + 56));
  sub_1CC9948E4(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setExpirationDate:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  LODWORD(v10) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v11, CFSTR("age_verification_duration"));

  LODWORD(v12) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v13, CFSTR("subscription_status_duration"));

  LODWORD(v14) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v15, CFSTR("token_duration"));

  LODWORD(v16) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 44);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v17, CFSTR("use_history_duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v18, CFSTR("accounts_on_device"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v19, CFSTR("accounts_without_state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v20, CFSTR("token_failure"));

  v21 = *(id *)(a1 + 64);
  AnalyticsSendEventLazy();

}

id sub_1CC999E1C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC999E24(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6, float a7, float a8, float a9, float a10)
{
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  char v49;
  char v50;

  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC99B250;
  block[3] = &unk_1E88E3268;
  v24 = *(NSObject **)(a1 + 32);
  v23 = *(_QWORD *)(a1 + 40);
  v31 = v19;
  v32 = v23;
  v33 = *(id *)(a1 + 48);
  v34 = *(id *)(a1 + 56);
  v35 = *(id *)(a1 + 64);
  v41 = *(_OWORD *)(a1 + 96);
  v36 = *(id *)(a1 + 72);
  v37 = v22;
  v49 = *(_BYTE *)(a1 + 144);
  v42 = *(_QWORD *)(a1 + 112);
  v38 = v21;
  v25 = *(id *)(a1 + 80);
  v50 = a6;
  v39 = v25;
  v40 = v20;
  v43 = *(_OWORD *)(a1 + 120);
  v44 = *(_QWORD *)(a1 + 136);
  v45 = a7;
  v46 = a8;
  v47 = a9;
  v48 = a10;
  v26 = v20;
  v27 = v21;
  v28 = v22;
  v29 = v19;
  dispatch_sync(v24, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));

}

void sub_1CC999FE4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MPLogCategoryAssistant();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(v3, "status");
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544131;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 2048;
    v15 = v7;
    v16 = 2113;
    v17 = v8;
    _os_log_impl(&dword_1CC97B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: age verification: %ld for %{private}@", (uint8_t *)&v10, 0x2Au);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  if (objc_msgSend(v3, "status") == 2)
    objc_msgSend(*(id *)(a1 + 56), "setAgeVerificationRequired:", 1);
  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
  *(float *)&v9 = v9;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = fabsf(*(float *)&v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void sub_1CC99A150(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "privateListeningEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CC2380], "isCurrentDeviceValidHomeAccessory"))
  {
    v5 = (void *)MEMORY[0x1E0CC2390];
    objc_msgSend(v3, "homeUserIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userMonitorWithHomeIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isPrivateListeningEnabledForCurrentAccessory"));
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544131;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v4;
    v23 = 2113;
    v24 = v12;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: user history unmodifiable: %{public}@ for %{private}@", (uint8_t *)&v17, 0x2Au);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  objc_msgSend(*(id *)(a1 + 56), "setUserHistoryUnmodifiable:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isActiveLocker"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
  *(float *)&v16 = v16;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 44) = fabsf(*(float *)&v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void sub_1CC99A350(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0B0]), "initWithUserInteractionLevel:", 1);
  objc_msgSend(v3, "setAuthenticationProvider:", v4);

}

void sub_1CC99A3B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  _BYTE v46[10];
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MPLogCategoryAssistant();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v42 = v8;
      v43 = 2114;
      v44 = v9;
      v45 = 2114;
      *(_QWORD *)v46 = v6;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: Failed to load subscription status. error=%{public}@", buf, 0x20u);
    }

    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DDBD38]) & 1) != 0)
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == -7007)
      {
        _MPLogCategoryAssistant();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v14 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v42 = v13;
          v43 = 2114;
          v44 = v14;
          v45 = 2113;
          *(_QWORD *)v46 = v15;
          _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: Privacy acceptance required - falling back to lightweight status for %{private}@", buf, 0x20u);

        }
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF78]), "initWithRequestContext:", *(_QWORD *)(a1 + 56));
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = sub_1CC99AED0;
        v32[3] = &unk_1E88E33F8;
        v39 = *(_OWORD *)(a1 + 88);
        v33 = *(id *)(a1 + 32);
        v34 = *(id *)(a1 + 40);
        v35 = *(id *)(a1 + 48);
        v17 = *(id *)(a1 + 64);
        v18 = *(_QWORD *)(a1 + 104);
        v36 = v17;
        v40 = v18;
        v37 = *(id *)(a1 + 72);
        v38 = *(id *)(a1 + 80);
        objc_msgSend(v16, "performRequestWithResponseHandler:", v32);

        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v5, "subscriptionStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "capabilities") & 0x101;
  v20 = objc_msgSend(v16, "isMatchEnabled");
  _MPLogCategoryAssistant();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v42 = v22;
    v43 = 2114;
    v44 = v23;
    v45 = 1024;
    *(_DWORD *)v46 = v19 == 257;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v20;
    v47 = 2113;
    v48 = v24;
    _os_log_impl(&dword_1CC97B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: store account is a subscriber: %{BOOL}u, match subscriber: %{BOOL}u for %{private}@", buf, 0x2Cu);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
  v25 = (_QWORD *)MEMORY[0x1E0D886E8];
  if (v19 != 257)
    v25 = (_QWORD *)MEMORY[0x1E0D886F0];
  objc_msgSend(*(id *)(a1 + 64), "setStatus:", *v25);
  v26 = (_QWORD *)MEMORY[0x1E0D88C30];
  if (!v20)
    v26 = (_QWORD *)MEMORY[0x1E0D88C38];
  objc_msgSend(*(id *)(a1 + 64), "setITunesMatchSubscriptionStatus:", *v26);
  objc_msgSend(*(id *)(a1 + 64), "setIsPromotionRelatedStatus:", 0);
  objc_msgSend(v16, "eligibleOffers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setEligibleOffers:", v27);

  objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
  *(float *)&v28 = v28;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 44) = fabsf(*(float *)&v28);
  objc_msgSend(v16, "expirationDate");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
LABEL_17:

}

void sub_1CC99A7F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  v7 = objc_alloc_init(MEMORY[0x1E0D885F8]);
  if (v6)
  {
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138544131;
      v32 = v9;
      v33 = 2114;
      v34 = v10;
      v35 = 2113;
      v36 = v11;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching store client token status for %{private}@: %{public}@", (uint8_t *)&v31, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setErrorCode:", v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "lastUpdateAttemptTime");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastUpdateAttemptTime:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "shouldExcludeFromBackgroundRefresh"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldExcludeFromBackgroundRefresh:", v15);

    objc_msgSend(v5, "lastError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _MPLogCategoryAssistant();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138544131;
        v32 = v19;
        v33 = 2114;
        v34 = v20;
        v35 = 2113;
        v36 = v21;
        v37 = 2114;
        v38 = v22;
        _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: error fetching client token for %{private}@: %{public}@", (uint8_t *)&v31, 0x2Au);

      }
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "lastError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v12, "code"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setErrorCode:", v24);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "tokenResult");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "token");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138544131;
        v32 = v25;
        v33 = 2114;
        v34 = v26;
        v35 = 2113;
        v36 = v28;
        v37 = 2113;
        v38 = v29;
        _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched store client token %{private}@ for %{private}@", (uint8_t *)&v31, 0x2Au);

      }
      objc_msgSend(v5, "tokenResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "token");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setUserToken:", v24);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "setUserTokenStatus:", v7);
  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
  *(float *)&v30 = v30;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = fabsf(*(float *)&v30);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void sub_1CC99ABC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  _MPLogCategoryAssistant();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "shortDebugName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544131;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      v23 = 2113;
      v24 = v15;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching shared user id for %{private}@: %{public}@", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "shortDebugName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544387;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      v23 = 2114;
      v24 = v8;
      v25 = 2113;
      v26 = v7;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched shared user id: %{public}@:%{private}@ for %{public}@", (uint8_t *)&v19, 0x34u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v7, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t sub_1CC99ADBC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MPLogCategoryAssistant();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543875;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: finished getting user state for %{private}@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(float, float, float, float))(*(_QWORD *)(a1 + 72) + 16))(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 36), *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 44));
}

void sub_1CC99AED0(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  double v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(v4, "lightweightSubscriptionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "expirationDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "capabilities") & 0x101;
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544131;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 1024;
    v22 = v9 == 257;
    v23 = 2113;
    v24 = v13;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: store account is a subscriber: %{BOOL}u for %{private}@", (uint8_t *)&v17, 0x26u);

  }
  v14 = (_QWORD *)MEMORY[0x1E0D886E8];
  if (v9 != 257)
    v14 = (_QWORD *)MEMORY[0x1E0D886F0];
  objc_msgSend(*(id *)(a1 + 56), "setStatus:", *v14);
  objc_msgSend(*(id *)(a1 + 56), "setIsPromotionRelatedStatus:", 0);
  objc_msgSend(v5, "eligibleOffers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setEligibleOffers:", v15);

  objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
  *(float *)&v16 = v16;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 44) = fabsf(*(float *)&v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

Class sub_1CC99B0B4(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ED8AFDF0)
    qword_1ED8AFDF0 = _sl_dlopen();
  if (!qword_1ED8AFDF0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPAssistantUtilities.m"), 59, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFMultiUserConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFMultiUserConnectionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MPAssistantUtilities.m"), 60, CFSTR("Unable to find class %s"), "AFMultiUserConnection");

LABEL_8:
    __break(1u);
  }
  qword_1ED8AFE00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CC99B250(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  id obj;
  uint64_t v87;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v1 = a1;
  v106 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(a1 + 48)) & 1) != 0
      || !*(_QWORD *)(v1 + 48) && objc_msgSend(*(id *)(v1 + 40), "isActive"))
    {
      _MPLogCategoryAssistant();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(v1 + 56);
        v4 = *(_QWORD *)(v1 + 64);
        objc_msgSend(*(id *)(v1 + 40), "shortDebugName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v96 = v3;
        v97 = 2114;
        v98 = v4;
        v99 = 2113;
        v100 = v5;
        _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ is default", buf, 0x20u);

      }
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v1 + 32), "syncSharedUserId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "userHistoryUnmodifiable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "status");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(v1 + 32), "ageVerificationRequired"))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      objc_msgSend(*(id *)(v1 + 32), "defaultMediaPlaybackAppBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(v1 + 32), "isPromotionRelatedStatus"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 32), "eligibleOffers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v13;
      v1 = a1;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Default_UserState_v2_%@_%@_%@_%@_%@_%@_%@"), v7, v9, v10, v11, v12, v85, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 32));
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 32));
      objc_msgSend(*(id *)(v1 + 72), "setDefaultUserState:", *(_QWORD *)(v1 + 32));
      _MPLogCategoryAssistant();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 32), "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v96 = v19;
        v97 = 2114;
        v98 = v20;
        v99 = 2113;
        v100 = v21;
        _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: default user state: %{private}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 72), "setICloudMusicLibraryToggle:", *(_QWORD *)(a1 + 80));
      objc_msgSend(*(id *)(a1 + 72), "setAgeVerificationRequired:", objc_msgSend(*(id *)(a1 + 32), "ageVerificationRequired"));
      objc_msgSend(*(id *)(a1 + 32), "status");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setStatus:", v22);

      objc_msgSend(*(id *)(a1 + 32), "iTunesMatchSubscriptionStatus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setITunesMatchSubscriptionStatus:", v23);

      objc_msgSend(*(id *)(a1 + 32), "userHistoryUnmodifiable");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setUserHistoryUnmodifiable:", v24);

      objc_msgSend(*(id *)(a1 + 32), "userToken");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setUserToken:", v25);

      objc_msgSend(*(id *)(a1 + 32), "userTokenStatus");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setUserTokenStatus:", v26);

      objc_msgSend(*(id *)(a1 + 32), "eligibleOffers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setEligibleOffers:", v27);

      objc_msgSend(*(id *)(a1 + 72), "setIsPromotionRelatedStatus:", objc_msgSend(*(id *)(a1 + 32), "isPromotionRelatedStatus"));
      objc_msgSend(*(id *)(a1 + 32), "xpAbCookie");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setXpAbCookie:", v28);

      if (!*(_BYTE *)(a1 + 176))
      {
        objc_msgSend(*(id *)(a1 + 72), "userToken");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "length");

        if (!v30)
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
      }

    }
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(*(id *)(v1 + 88), "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    if (v89)
    {
      v87 = *(_QWORD *)v92;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v92 != v87)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v31);
          _MPLogCategoryAssistant();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = *(_QWORD *)(v1 + 56);
            v35 = *(_QWORD *)(v1 + 64);
            objc_msgSend(*(id *)(v1 + 40), "shortDebugName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v1 + 88), "objectForKeyedSubscript:", v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544387;
            v96 = v34;
            v97 = 2114;
            v98 = v35;
            v99 = 2113;
            v100 = v36;
            v101 = 2114;
            v102 = v32;
            v103 = 2113;
            v104 = v37;
            _os_log_impl(&dword_1CC97B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shared user ID %{public}@:%{private}@", buf, 0x34u);

          }
          v90 = v31;

          v38 = (void *)objc_msgSend(*(id *)(v1 + 32), "copy");
          if (!*(_BYTE *)(v1 + 176))
          {
            objc_msgSend(*(id *)(v1 + 88), "objectForKeyedSubscript:", v32);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setSharedUserId:", v39);

          }
          objc_msgSend(v38, "setSyncSharedUserId:", v32);
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v38, "syncSharedUserId");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "userHistoryUnmodifiable");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringValue");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "status");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = CFSTR("NO");
          if (objc_msgSend(v38, "ageVerificationRequired"))
            v46 = CFSTR("YES");
          else
            v46 = CFSTR("NO");
          objc_msgSend(v38, "defaultMediaPlaybackAppBundleIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "isPromotionRelatedStatus"))
            v45 = CFSTR("YES");
          objc_msgSend(v38, "eligibleOffers");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("UserState_v2_%@_%@_%@_%@_%@_%@_%@"), v41, v43, v44, v46, v47, v45, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v1 = a1;
          _MPLogCategoryAssistant();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = *(_QWORD *)(a1 + 56);
            v52 = *(_QWORD *)(a1 + 64);
            objc_msgSend(*(id *)(a1 + 40), "shortDebugName");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "dictionary");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544131;
            v96 = v51;
            v97 = 2114;
            v98 = v52;
            v99 = 2113;
            v100 = v53;
            v101 = 2113;
            v102 = v54;
            _os_log_impl(&dword_1CC97B000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);

          }
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 32));
          objc_msgSend(*(id *)(a1 + 96), "addObject:", v38);
          v55 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
          objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v49, v56);

          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 32));
          v31 = v90 + 1;
        }
        while (v89 != v90 + 1);
        v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
      }
      while (v89);
    }

    if (!objc_msgSend(*(id *)(v1 + 88), "count") && *(_BYTE *)(v1 + 177))
    {
      _MPLogCategoryAssistant();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = *(_QWORD *)(v1 + 56);
        v59 = *(_QWORD *)(v1 + 64);
        objc_msgSend(*(id *)(v1 + 40), "shortDebugName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v96 = v58;
        v97 = 2114;
        v98 = v59;
        v99 = 2113;
        v100 = v60;
        _os_log_impl(&dword_1CC97B000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has no shared user IDs", buf, 0x20u);

      }
      _MPLogCategoryAssistant();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = *(_QWORD *)(v1 + 56);
        v63 = *(_QWORD *)(v1 + 64);
        objc_msgSend(*(id *)(v1 + 40), "shortDebugName");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 32), "dictionary");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v96 = v62;
        v97 = 2114;
        v98 = v63;
        v99 = 2113;
        v100 = v64;
        v101 = 2113;
        v102 = v65;
        _os_log_impl(&dword_1CC97B000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);

      }
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v1 + 32), "userHistoryUnmodifiable");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringValue");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "status");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(v1 + 32), "ageVerificationRequired"))
        v70 = CFSTR("YES");
      else
        v70 = CFSTR("NO");
      objc_msgSend(*(id *)(v1 + 32), "defaultMediaPlaybackAppBundleIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("UserState_v2_%@_%@_%@_%@_%@"), CFSTR("none"), v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 32));
      v73 = *(void **)(v1 + 96);
      v74 = (void *)objc_msgSend(*(id *)(v1 + 32), "copy");
      objc_msgSend(v73, "addObject:", v74);

      v75 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40);
      objc_msgSend(*(id *)(v1 + 40), "ic_DSID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setObject:forKeyedSubscript:", v72, v76);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 32));
    }
  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
  }
  v77 = *(void **)(v1 + 104);
  if (v77)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 144) + 8) + 40)
      || (objc_msgSend(v77, "timeIntervalSince1970"),
          v79 = v78,
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 144) + 8) + 40), "timeIntervalSince1970"),
          v79 < v80))
    {
      _MPLogCategoryAssistant();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v82 = *(_QWORD *)(v1 + 56);
        v83 = *(_QWORD *)(v1 + 64);
        objc_msgSend(*(id *)(v1 + 40), "shortDebugName");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v96 = v82;
        v97 = 2114;
        v98 = v83;
        v99 = 2113;
        v100 = v84;
        _os_log_impl(&dword_1CC97B000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shortest expiration time", buf, 0x20u);

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 144) + 8) + 40), *(id *)(v1 + 104));
    }
  }
  *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8) + 32) = *(float *)(v1 + 160)
                                                              + *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8)
                                                                         + 32);
  *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8) + 40) = *(float *)(v1 + 168)
                                                              + *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8)
                                                                         + 40);
  *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8) + 44) = *(float *)(v1 + 172)
                                                              + *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8)
                                                                         + 44);
  *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8) + 36) = *(float *)(v1 + 164)
                                                              + *(float *)(*(_QWORD *)(*(_QWORD *)(v1 + 152) + 8)
                                                                         + 36);
}

uint64_t sub_1CC99BD7C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsMultipleITunesAccounts") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isActive");

  return v4;
}

void sub_1CC99BDE0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setActiveTvUser:", objc_msgSend(*(id *)(a1 + 40), "isActiveUser"));
  _MPLogCategoryAssistant();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v5 = objc_msgSend(*(id *)(a1 + 40), "isActiveUser");
    v6 = 138543874;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: active TV user: %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
  }

}

void sub_1CC99BEC0()
{
  void *v0;
  void *v1;
  void *v2;

  if (!qword_1ED8AFDF8)
    qword_1ED8AFDF8 = _sl_dlopen();
  if (!qword_1ED8AFDF8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WatchListKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MPAssistantUtilities.m"), 46, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

uint64_t sub_1CC99BFC0(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "homeUserIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_1CC99C000(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC99C780;
  block[3] = &unk_1E88E3188;
  v17 = v6;
  v27 = *(_BYTE *)(a1 + 120);
  v7 = *(NSObject **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 64);
  v19 = v8;
  v20 = v9;
  v24 = *(_OWORD *)(a1 + 88);
  v11 = v10;
  v28 = *(_BYTE *)(a1 + 121);
  v25 = *(_QWORD *)(a1 + 104);
  v21 = v11;
  v22 = v5;
  v12 = *(id *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 112);
  v23 = v12;
  v26 = v13;
  v14 = v5;
  v15 = v6;
  dispatch_sync(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));

}

void sub_1CC99C124(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setInContextUsersStates:", *(_QWORD *)(a1 + 40));
  sub_1CC9948E4(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExpirationDate:", v2);

  _MPLogCategoryAssistant();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543875;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    v26 = 2113;
    v27 = v6;
    _os_log_impl(&dword_1CC97B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: finished getting dynamite client state: %{private}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  LODWORD(v10) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v11, CFSTR("age_verification_duration"));

  LODWORD(v12) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v13, CFSTR("subscription_status_duration"));

  LODWORD(v14) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v15, CFSTR("token_duration"));

  LODWORD(v16) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 44);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v17, CFSTR("use_history_duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v18, CFSTR("accounts_on_device"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v19, CFSTR("accounts_without_state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v20, CFSTR("token_failure"));

  v21 = *(id *)(a1 + 64);
  AnalyticsSendEventLazy();

}

id sub_1CC99C434(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC99C43C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  _MPLogCategoryAssistant();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "shortDebugName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      v28 = 2113;
      v29 = v15;
      v30 = 2114;
      v31 = v9;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (userstate) <%{public}@>: failed fetching shared user id for %{private}@: %{public}@", buf, 0x2Au);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "shortDebugName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v25 = v16;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v8;
      v30 = 2113;
      v31 = v7;
      v32 = 2114;
      v33 = v18;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: fetched shared user id: %{public}@:%{private}@ for %{public}@", buf, 0x34u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CC99C770;
    block[3] = &unk_1E88E3308;
    v19 = *(NSObject **)(a1 + 72);
    v21 = *(id *)(a1 + 80);
    v22 = v8;
    v23 = v7;
    dispatch_sync(v19, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

  }
}

uint64_t sub_1CC99C678(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MPLogCategoryAssistant();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543875;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (userstate) <%{public}@>: finished getting user state for %{private}@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t sub_1CC99C770(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_1CC99C780(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  id obj;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;

  v1 = a1;
  v105 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 120))
    {
      _MPLogCategoryAssistant();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(v1 + 40);
        v4 = *(_QWORD *)(v1 + 48);
        objc_msgSend(*(id *)(v1 + 56), "shortDebugName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v95 = v3;
        v96 = 2114;
        v97 = v4;
        v98 = 2113;
        v99 = v5;
        _os_log_impl(&dword_1CC97B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ is default", buf, 0x20u);

      }
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v1 + 32), "syncSharedUserId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "userHistoryUnmodifiable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "status");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(v1 + 32), "ageVerificationRequired"))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 32), "defaultMediaPlaybackAppBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "isPromotionRelatedStatus"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 32), "eligibleOffers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v11;
      v1 = a1;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Default_UserState_v2_%@_%@_%@_%@_%@_%@_%@"), v7, v9, v10, v84, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 56), "dsid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
      _MPLogCategoryAssistant();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v95 = v20;
        v96 = 2114;
        v97 = v19;
        v98 = 2113;
        v99 = v21;
        _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: default user state: %{private}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 64), "setDefaultUserState:", *(_QWORD *)(a1 + 32));
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 56), "music");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "cloudLibrarySyncStatus") == 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setICloudMusicLibraryToggle:", v24);

      objc_msgSend(*(id *)(a1 + 64), "setAgeVerificationRequired:", objc_msgSend(*(id *)(a1 + 32), "ageVerificationRequired"));
      objc_msgSend(*(id *)(a1 + 32), "iTunesMatchSubscriptionStatus");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setITunesMatchSubscriptionStatus:", v25);

      objc_msgSend(*(id *)(a1 + 32), "userHistoryUnmodifiable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setUserHistoryUnmodifiable:", v26);

      objc_msgSend(*(id *)(a1 + 32), "userToken");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setUserToken:", v27);

      objc_msgSend(*(id *)(a1 + 32), "status");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setStatus:", v28);

      objc_msgSend(*(id *)(a1 + 32), "userTokenStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setUserTokenStatus:", v29);

      objc_msgSend(*(id *)(a1 + 32), "eligibleOffers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setEligibleOffers:", v30);

      objc_msgSend(*(id *)(a1 + 64), "setIsPromotionRelatedStatus:", objc_msgSend(*(id *)(a1 + 32), "isPromotionRelatedStatus"));
      objc_msgSend(*(id *)(a1 + 56), "music");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cookies");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "xpab");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setXpAbCookie:", v33);

      if (!*(_BYTE *)(a1 + 121))
      {
        objc_msgSend(*(id *)(a1 + 64), "userToken");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "length");

        if (!v35)
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
      }

    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend(*(id *)(v1 + 72), "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
    if (v88)
    {
      v86 = *(_QWORD *)v91;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v91 != v86)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v36);
          _MPLogCategoryAssistant();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = *(_QWORD *)(v1 + 40);
            v40 = *(_QWORD *)(v1 + 48);
            objc_msgSend(*(id *)(v1 + 56), "shortDebugName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v1 + 72), "objectForKeyedSubscript:", v37);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544387;
            v95 = v39;
            v96 = 2114;
            v97 = v40;
            v98 = 2113;
            v99 = v41;
            v100 = 2114;
            v101 = v37;
            v102 = 2113;
            v103 = v42;
            _os_log_impl(&dword_1CC97B000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has shared user ID %{public}@:%{private}@", buf, 0x34u);

          }
          v89 = v36;

          v43 = (void *)objc_msgSend(*(id *)(v1 + 32), "copy");
          if (!*(_BYTE *)(v1 + 121))
          {
            objc_msgSend(*(id *)(v1 + 72), "objectForKeyedSubscript:", v37);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setSharedUserId:", v44);

          }
          objc_msgSend(v43, "setSyncSharedUserId:", v37);
          v45 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v43, "syncSharedUserId");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "userHistoryUnmodifiable");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringValue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "status");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = CFSTR("NO");
          if (objc_msgSend(v43, "ageVerificationRequired"))
            v51 = CFSTR("YES");
          else
            v51 = CFSTR("NO");
          objc_msgSend(v43, "defaultMediaPlaybackAppBundleIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "isPromotionRelatedStatus"))
            v50 = CFSTR("YES");
          objc_msgSend(v43, "eligibleOffers");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("UserState_v2_%@_%@_%@_%@_%@_%@_%@"), v46, v48, v49, v51, v52, v50, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v1 = a1;
          _MPLogCategoryAssistant();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = *(_QWORD *)(a1 + 40);
            v57 = *(_QWORD *)(a1 + 48);
            objc_msgSend(*(id *)(a1 + 56), "shortDebugName");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "dictionary");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544131;
            v95 = v56;
            v96 = 2114;
            v97 = v57;
            v98 = 2113;
            v99 = v58;
            v100 = 2113;
            v101 = v59;
            _os_log_impl(&dword_1CC97B000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);

          }
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
          objc_msgSend(*(id *)(a1 + 80), "addObject:", v43);
          v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(*(id *)(a1 + 56), "dsid");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v54, v61);

          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
          v36 = v89 + 1;
        }
        while (v88 != v89 + 1);
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
      }
      while (v88);
    }

    if (!objc_msgSend(*(id *)(v1 + 72), "count"))
    {
      objc_msgSend(*(id *)(v1 + 56), "homeUserIDs");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count");

      if (v63)
      {
        _MPLogCategoryAssistant();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = *(_QWORD *)(v1 + 40);
          v66 = *(_QWORD *)(v1 + 48);
          objc_msgSend(*(id *)(v1 + 56), "shortDebugName");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v95 = v65;
          v96 = 2114;
          v97 = v66;
          v98 = 2113;
          v99 = v67;
          _os_log_impl(&dword_1CC97B000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: account %{private}@ has no shared user IDs", buf, 0x20u);

        }
        _MPLogCategoryAssistant();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          v69 = *(_QWORD *)(v1 + 40);
          v70 = *(_QWORD *)(v1 + 48);
          objc_msgSend(*(id *)(v1 + 56), "shortDebugName");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 32), "dictionary");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544131;
          v95 = v69;
          v96 = 2114;
          v97 = v70;
          v98 = 2113;
          v99 = v71;
          v100 = 2113;
          v101 = v72;
          _os_log_impl(&dword_1CC97B000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ (clientstate) <%{public}@>: %{private}@ user state: %{private}@", buf, 0x2Au);

        }
        v73 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(v1 + 32), "userHistoryUnmodifiable");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "stringValue");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 32), "status");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v1 + 32), "ageVerificationRequired"))
          v77 = CFSTR("YES");
        else
          v77 = CFSTR("NO");
        objc_msgSend(*(id *)(v1 + 32), "defaultMediaPlaybackAppBundleIdentifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stringWithFormat:", CFSTR("UserState_v2_%@_%@_%@_%@_%@"), CFSTR("none"), v75, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 32));
        v80 = *(void **)(v1 + 80);
        v81 = (void *)objc_msgSend(*(id *)(v1 + 32), "copy");
        objc_msgSend(v80, "addObject:", v81);

        v82 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 40);
        objc_msgSend(*(id *)(v1 + 56), "dsid");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v79, v83);

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 32));
      }
    }
  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  }
}

void sub_1CC99D6E4(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v4 = objc_alloc_init(MEMORY[0x1E0D4B318]);
  objc_msgSend(v4, "setOrigin:", a2);
  v5 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  v6 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1CC99E0F0;
  v11[3] = &unk_1E88E3D98;
  v12 = v5;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v13 = v8;
  v14 = v9;
  v10 = v5;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 121, v4, v6, v11);

}

void sub_1CC99D7C8(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = objc_alloc_init(MEMORY[0x1E0D4B300]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC99DE70;
  v8[3] = &unk_1E88E3540;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v4;
  objc_msgSend(v7, "connectToEndpoint:completion:", a2, v8);

}

void sub_1CC99D880(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    MRAVEndpointGetMyGroupLeaderWithTimeout();

  }
}

void sub_1CC99D92C(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1CC99D9EC;
  v6[3] = &unk_1E88E3B90;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v6);

}

void sub_1CC99D9EC(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1CC99DA74;
  v5[3] = &unk_1E88E35E0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "sendCommand:toDestination:withOptions:completion:", 121, a2, v4, v5);

}

void sub_1CC99DA74(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  if (v9)
  {
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v9, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithReason:", v5);

    v3 = (id)v6;
  }
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void sub_1CC99DB2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Create Radio Station"), v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(void **)(v32 + 56);
      *(_QWORD *)(v32 + 56) = v31;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v37 = 138543618;
    v38 = v34;
    v39 = 2114;
    v40 = a2;
    v15 = "Create Radio Station (perform) <%{public}@>: group leader endpoint %{public}@";
    v16 = v13;
    v17 = 22;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "code") == 33)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D4C8E8]);

    if (v8)
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Create Radio Station"), v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 56);
        *(_QWORD *)(v11 + 56) = v10;

      }
      _MPLogCategoryAssistant();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v37 = 138543362;
      v38 = v14;
      v15 = "Create Radio Station (perform) <%{public}@>: group leader legacy";
      v16 = v13;
      v17 = 12;
LABEL_17:
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v37, v17);
LABEL_18:

      (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v35, v36);
      goto LABEL_19;
    }
  }
  v18 = objc_alloc(MEMORY[0x1E0D87FE8]);
  objc_msgSend(v6, "localizedFailureReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithReason:", v19);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Create Radio Station"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 56);
    *(_QWORD *)(v23 + 56) = v22;

  }
  _MPLogCategoryAssistant();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(v20, "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543618;
    v38 = v26;
    v39 = 2114;
    v40 = v27;
    _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v37, 0x16u);

  }
  v28 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v20, "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

LABEL_19:
}

void sub_1CC99DE70(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v6, "localizedFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithReason:", v9);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Create Radio Station"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(v13 + 56);
      *(_QWORD *)(v13 + 56) = v12;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v10, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v26, 0x16u);

    }
    v18 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v10, "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
  else
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Create Radio Station"), v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(void **)(v22 + 56);
      *(_QWORD *)(v22 + 56) = v21;

    }
    _MPLogCategoryAssistant();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      v26 = 138543618;
      v27 = v25;
      v28 = 2114;
      v29 = a2;
      _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_DEFAULT, "Create Radio Station (connection) <%{public}@>: connected to: %{public}@", (uint8_t *)&v26, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_1CC99E0F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 56))
  {
    if (sub_1CC994D30(a3))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Create Radio Station"), v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(void **)(v9 + 56);
        *(_QWORD *)(v9 + 56) = v8;

      }
      _MPLogCategoryAssistant();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The system media app reported that creating the station was unsuccessful. (stationURL = %@)"), *(_QWORD *)(a1 + 48));
      v11 = objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v11);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aceId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Create Radio Station"), v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(void **)(v16 + 56);
        *(_QWORD *)(v16 + 56) = v15;

      }
      _MPLogCategoryAssistant();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(v6, "dictionary");
        v19 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v18;
        v24 = 2114;
        v25 = v19;
        _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_ERROR, "Create Radio Station (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

      }
    }

LABEL_12:
    v20 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

  }
}

void sub_1CC99E608(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LOCAL_DEVICE"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeysForObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 56))
      objc_msgSend(v5, "removeObjectForKey:", v8);
  }
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v25 = *(id *)(a1 + 48);
    MRAVEndpointRemoveOutputDevicesFromGroupFromSource();

  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Remove Output Devices From Group"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v15, "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Remove Output Devices From Group (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v15, "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  }
}

void sub_1CC99E8D4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithReason:", v5);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Remove Output Devices From Group"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v14, v15, "Remove Output Devices From Group (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D882F0]);
    objc_msgSend(v6, "setRouteResponse:", *MEMORY[0x1E0D88E30]);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Remove Output Devices From Group"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

void sub_1CC99EDE4(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC99EEBC;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC99EEBC(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC99EF70;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 4, a2, v5, v9);

}

void sub_1CC99EF70(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Skip To Next Item"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Skip To Next Item"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Skip To Next Item (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC99F248(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1CC99F250(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  char v6;
  id v7;
  Class *v8;
  void *v9;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0CC1EC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((v6 & 1) != 0)
  {
    v8 = (Class *)0x1E0D882A8;
  }
  else if ((v6 & 2) != 0)
  {
    v8 = (Class *)0x1E0D88280;
  }
  else if ((v6 & 4) != 0)
  {
    v8 = (Class *)0x1E0D88208;
  }
  else
  {
    if ((v6 & 0x20) == 0)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v8 = (Class *)0x1E0D88290;
  }
  v7 = objc_alloc_init(*v8);
LABEL_11:
  if (a3 == 1)
  {
    sub_1CC9833FC(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "setIdentifier:", v9);

  return v7;
}

const __CFString *sub_1CC99F320()
{
  __CFString *v0;

  v0 = CFSTR("x-sampmedentity");
  return CFSTR("x-sampmedentity");
}

id sub_1CC99F34C(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "metricsContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("WHAMetrics"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
        v4 = v5;
      else
        v4 = 0;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1CC99F688(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_group_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  _QWORD block[5];
  id v32;
  _BYTE *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  NSObject *v39;
  id v40;
  _BYTE *v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Volume Level"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = v8;

    }
    _MPLogCategoryAssistant();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
      objc_msgSend(v6, "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_ERROR, "Set Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v47 = sub_1CC99FA74;
  v48 = sub_1CC99FA84;
  v49 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
  v15 = dispatch_group_create();
  v16 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1CC99FA8C;
  v42[3] = &unk_1E88E3658;
  v17 = v15;
  v18 = *(_QWORD *)(a1 + 40);
  v43 = v17;
  v44 = v18;
  v45 = buf;
  v19 = (void *)MEMORY[0x1D17B0600](v42);
  v37[0] = v16;
  v37[1] = 3221225472;
  v37[2] = sub_1CC99FB5C;
  v37[3] = &unk_1E88E36A8;
  v37[4] = *(_QWORD *)(a1 + 40);
  v20 = v5;
  v38 = v20;
  v21 = v19;
  v40 = v21;
  v22 = v17;
  v39 = v22;
  v41 = buf;
  v23 = (void *)MEMORY[0x1D17B0600](v37);
  v24 = objc_alloc_init(MEMORY[0x1E0D4B308]);
  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 56);
  *(_QWORD *)(v25 + 56) = v24;

  dispatch_group_enter(v22);
  v27 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = sub_1CC9A02BC;
  v34[3] = &unk_1E88E36F8;
  v28 = v22;
  v35 = v28;
  v29 = v23;
  v36 = v29;
  objc_msgSend(v27, "discoverRemoteControlEndpointsMatchingUIDs:completion:", v20, v34);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = sub_1CC9A0454;
  block[3] = &unk_1E88E3720;
  v30 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v33 = buf;
  v32 = v30;
  dispatch_group_notify(v28, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(buf, 8);
}

void sub_1CC99FA54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC99FA74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC99FA84(uint64_t a1)
{

}

void sub_1CC99FA8C(uint64_t a1, const void *a2, void *a3)
{
  id v5;
  id v6;
  int8x16_t v7;

  v5 = a3;
  CFRetain(a2);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v7 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v7.i64[0];
  MRAVEndpointSetOutputDeviceUIDVolume();

}

void sub_1CC99FB5C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  int v24;
  id *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  float v34;
  uint64_t v35;
  void *v36;
  int v37;
  id *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  _QWORD *v44;
  uint64_t v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  _QWORD *v56;
  uint64_t v57;
  void *v58;
  float v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  double v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Volume Level"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

  }
  _MPLogCategoryAssistant();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD **)(a1 + 32);
    v9 = v8[8];
    objc_msgSend(v8, "volumeValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)buf = 138543874;
    v85 = v9;
    v86 = 2048;
    v87 = v11;
    v88 = 2114;
    v89 = a2;
    _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: volume: %f endpoint %{public}@", buf, 0x20u);

  }
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)MRAVEndpointCopyOutputDevices();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v79;
    v67 = *MEMORY[0x1E0D88F68];
    v64 = *MEMORY[0x1E0D88F60];
    v63 = *MEMORY[0x1E0D88F58];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v79 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v16, "uid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v18 = *(id *)(a1 + 40);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        if (!v19)
          goto LABEL_25;
        v20 = v19;
        v21 = *(_QWORD *)v75;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v75 != v21)
              objc_enumerationMutation(v18);
            if ((objc_msgSend(v16, "containsUID:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j)) & 1) != 0)
            {

              objc_msgSend(*(id *)(a1 + 32), "actionType");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", v67);

              v25 = *(id **)(a1 + 32);
              if (v24)
              {
                if (!objc_msgSend(v25[8], "length"))
                {
                  objc_msgSend(*(id *)(a1 + 32), "aceId");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Set Volume Level"), v26);
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = *(_QWORD *)(a1 + 32);
                  v29 = *(void **)(v28 + 64);
                  *(_QWORD *)(v28 + 64) = v27;

                }
                _MPLogCategoryAssistant();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = *(_QWORD **)(a1 + 32);
                  v32 = v31[8];
                  objc_msgSend(v31, "volumeValue");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "floatValue");
                  *(_DWORD *)buf = 138543874;
                  v85 = v32;
                  v86 = 2048;
                  v87 = v34;
                  v88 = 2114;
                  v89 = v17;
                  _os_log_impl(&dword_1CC97B000, v30, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: set volume: %f outputDeviceUID %{public}@", buf, 0x20u);

                }
                v35 = *(_QWORD *)(a1 + 56);
                objc_msgSend(*(id *)(a1 + 32), "volumeValue");
                v18 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "floatValue");
                (*(void (**)(uint64_t, void *, void *))(v35 + 16))(v35, a2, v17);
                goto LABEL_25;
              }
              objc_msgSend(v25, "actionType");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToString:", v64);

              v38 = *(id **)(a1 + 32);
              if (v37)
              {
                if (!objc_msgSend(v38[8], "length"))
                {
                  objc_msgSend(*(id *)(a1 + 32), "aceId");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Set Volume Level"), v39);
                  v40 = objc_claimAutoreleasedReturnValue();
                  v41 = *(_QWORD *)(a1 + 32);
                  v42 = *(void **)(v41 + 64);
                  *(_QWORD *)(v41 + 64) = v40;

                }
                _MPLogCategoryAssistant();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  v44 = *(_QWORD **)(a1 + 32);
                  v45 = v44[8];
                  objc_msgSend(v44, "volumeValue");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "floatValue");
                  *(_DWORD *)buf = 138543874;
                  v85 = v45;
                  v86 = 2048;
                  v87 = v47;
                  v88 = 2114;
                  v89 = v17;
                  _os_log_impl(&dword_1CC97B000, v43, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: increase volume: %f outputDeviceUID %{public}@", buf, 0x20u);

                }
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
                CFRetain(a2);
                v73 = *(id *)(a1 + 56);
                v71 = v17;
                v72 = *(id *)(a1 + 48);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v48 = v73;
              }
              else
              {
                objc_msgSend(v38, "actionType");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "isEqualToString:", v63);

                if (!v50)
                {
                  v60 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
                  v61 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                  v62 = *(void **)(v61 + 40);
                  *(_QWORD *)(v61 + 40) = v60;

                  goto LABEL_40;
                }
                if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length"))
                {
                  objc_msgSend(*(id *)(a1 + 32), "aceId");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Set Volume Level"), v51);
                  v52 = objc_claimAutoreleasedReturnValue();
                  v53 = *(_QWORD *)(a1 + 32);
                  v54 = *(void **)(v53 + 64);
                  *(_QWORD *)(v53 + 64) = v52;

                }
                _MPLogCategoryAssistant();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v56 = *(_QWORD **)(a1 + 32);
                  v57 = v56[8];
                  objc_msgSend(v56, "volumeValue");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "floatValue");
                  *(_DWORD *)buf = 138543874;
                  v85 = v57;
                  v86 = 2048;
                  v87 = v59;
                  v88 = 2114;
                  v89 = v17;
                  _os_log_impl(&dword_1CC97B000, v55, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: decrease volume: %f outputDeviceUID %{public}@", buf, 0x20u);

                }
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
                CFRetain(a2);
                v70 = *(id *)(a1 + 56);
                v68 = v17;
                v69 = *(id *)(a1 + 48);
                MRAVEndpointGetOutputDeviceUIDVolume();

                v48 = v70;
              }

              goto LABEL_40;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (v20)
            continue;
          break;
        }
LABEL_25:

LABEL_40:
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v13);
  }

}

void sub_1CC9A02BC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id obj;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0D4B300]);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = sub_1CC9A05A8;
        v12[3] = &unk_1E88E36D0;
        v13 = v9;
        v15 = *(id *)(a1 + 40);
        v16 = v8;
        v14 = *(id *)(a1 + 32);
        v10 = v9;
        objc_msgSend(v10, "connectToEndpoint:completion:", v8, v12);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_1CC9A0454(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Volume Level"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Set Volume Level (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void sub_1CC9A05A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = *(id *)(a1 + 32);
  v4(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_1CC9A0600(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  __n128 v12;
  int v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = a3;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "volumeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10 + a3;

    v12.n128_u32[0] = 1.0;
    if (v11 <= 1.0)
      v12.n128_f32[0] = v11;
    (*(void (**)(__n128))(*(_QWORD *)(a1 + 56) + 16))(v12);
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_1CC9A077C(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = a3;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_ERROR, "volume: %f error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "volume: %f", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "volumeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = a3 - v10;

    (*(void (**)(float))(*(_QWORD *)(a1 + 56) + 16))(fmaxf(v11, 0.0));
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_1CC9A08F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length");
  if (a2)
  {
    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Volume Level"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = v6;

    }
    _MPLogCategoryAssistant();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = *(double *)&a2;
      _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_ERROR, "Set Volume Level (setvolume) <%{public}@>: volume set failed with error: %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Volume Level"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 64);
      *(_QWORD *)(v13 + 64) = v12;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v17 = *(float *)(a1 + 64);
      v20 = 138543618;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_DEFAULT, "Set Volume Level (setvolume) <%{public}@>: new volume: %f", (uint8_t *)&v20, 0x16u);
    }

    v18 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A10D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1CC9A120C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 48));
  if (!a3 && MRPlaybackQueueGetContentItemsCount())
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (id)MRPlaybackQueueCopyContentItems();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)MRContentItemCopyNowPlayingInfo();
          sub_1CC994594(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1CC9A1378(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v6 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v6);

    v7 = v17;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 56);
      *(_QWORD *)(v10 + 56) = v9;

    }
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v7, "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v15 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

void sub_1CC9A15AC(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = a2;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (default) <%{public}@>: leader %{public}@", (uint8_t *)&v10, 0x16u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MRAVEndpointCopyOrigin();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MRMediaRemoteGetLocalOrigin();
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A1700(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreviousItems:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A172C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setNextItems:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A1758(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void sub_1CC9A18A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (a4)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D4B300]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1CC9A1990;
    v13[3] = &unk_1E88E3748;
    v8 = *(_QWORD *)(a1 + 56);
    v14 = v7;
    v18 = v8;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v12 = v7;
    objc_msgSend(v12, "connectToEndpoint:completion:", a3, v13);

  }
}

void sub_1CC9A1990(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v6, "localizedFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithReason:", v9);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(void **)(v13 + 56);
      *(_QWORD *)(v13 + 56) = v12;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
      objc_msgSend(v10, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v18 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v10, "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void sub_1CC9A1DEC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 32);
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LOCAL_DEVICE"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeysForObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 56))
      objc_msgSend(v5, "removeObjectForKey:", v8);
  }
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v25 = *(id *)(a1 + 48);
    MRAVEndpointAddOutputDevicesToGroupFromSource();

  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Output Devices To Group"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v15, "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v22;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "Add Output Devices To Group (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v15, "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  }
}

void sub_1CC9A20B8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithReason:", v5);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Output Devices To Group"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v14, v15, "Add Output Devices To Group (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D882D0]);
    objc_msgSend(v6, "setRouteResponse:", *MEMORY[0x1E0D88E30]);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Output Devices To Group"), v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v17;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v13;
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

void sub_1CC9A2690(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  int v14;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC9A2770;
  v8[3] = &unk_1E88E3888;
  v9 = *(id *)(a1 + 48);
  v14 = *(_DWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC9A2770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v4 = *(unsigned int *)(a1 + 72);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1CC9A2830;
  v10[3] = &unk_1E88E3D98;
  v11 = v5;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v12 = v7;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "sendCommand:toDestination:withOptions:completion:", v4, a2, v6, v10);

}

void sub_1CC9A2830(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Skip Time Interval"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v3, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithReason:", v11);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
    objc_msgSend(v3, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));

    v5 = (id)v12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Skip Time Interval"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v5, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Skip Time Interval (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC9A2B08(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_1CC9A2BE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1CC9A2BF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "MPMediaItemQueryOnlyPlayableItems:withUserIdentity:plugin:hash:", 0, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_1CC9A2C54(void *a1, uint64_t a2, int a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void (**v51)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  uint64_t *v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  objc_msgSend(a1, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = sub_1CC9834E0(v13);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = sub_1CC9A37B0;
  v52[3] = &unk_1E88E3900;
  v59 = a3;
  v16 = v14;
  v53 = v16;
  v17 = v11;
  v54 = v17;
  v18 = v12;
  v55 = v18;
  v57 = a1;
  v58 = &v60;
  v50 = v10;
  v56 = v50;
  v51 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17B0600](v52);
  if (v15 == 4)
  {
    objc_msgSend(v13, "scheme");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = sub_1CC9A35D8(v48, 1);
    objc_msgSend(MEMORY[0x1E0CC23F0], "ULIDPropertyForGroupingType:", v26);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastPathComponent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    sub_1CC9A3B5C(v50, (uint64_t)v20, (uint64_t)v47, v26, a3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v49, "_countOfCollections");
    v61[3] = v28;
    if (v28)
    {
      _MPLogCategoryAssistant();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend(v49, "_countOfCollections");
        *(_DWORD *)buf = 138543874;
        v65 = v17;
        v66 = 2114;
        v67 = v18;
        v68 = 2048;
        v69 = v30;
        _os_log_impl(&dword_1CC97B000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ (ulid) <%{public}@>: collections: %lu", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CC23F0], "persistentIDPropertyForGroupingType:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "collections");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "representativeItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "valueForProperty:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "longLongValue");

      if (!v36)
      {
        objc_msgSend(v33, "valueForProperty:", v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v37, "longLongValue");

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v36, v47);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *, void *))v51)[2](v51, v26, v31, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _MPLogCategoryAssistant();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v65 = v17;
        v66 = 2114;
        v67 = v18;
        _os_log_impl(&dword_1CC97B000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ (ulid) <%{public}@>: no collections", buf, 0x16u);
      }

      objc_msgSend(a1, "items");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC9A3C88(v50, v41, a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend(v25, "_countOfCollections");
      v61[3] = v42;
    }

    v16 = v48;
  }
  else if (v15 == 1)
  {
    v19 = sub_1CC9A35D8(v16, 0);
    objc_msgSend(MEMORY[0x1E0CC23F0], "persistentIDPropertyForGroupingType:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, NSObject *, void *))v51)[2](v51, v19, v20, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _MPLogCategoryAssistant();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "host");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v17;
      v66 = 2114;
      v67 = v18;
      v68 = 2112;
      v69 = (uint64_t)v39;
      _os_log_impl(&dword_1CC97B000, v20, OS_LOG_TYPE_ERROR, "%{public}@ (query) <%{public}@>:  Unsupported identifier URL host: %@", buf, 0x20u);

    }
    v25 = 0;
  }

  _MPLogCategoryAssistant();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = v61[3];
    v45 = objc_msgSend(v25, "_countOfItems");
    *(_DWORD *)buf = 138544130;
    v65 = v17;
    v66 = 2114;
    v67 = v18;
    v68 = 2048;
    v69 = v44;
    v70 = 2048;
    v71 = v45;
    _os_log_impl(&dword_1CC97B000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ (query) <%{public}@>: collections: %lu items: %lu", buf, 0x2Au);
  }

  _Block_object_dispose(&v60, 8);
  return v25;
}

void sub_1CC9A3218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC9A3288(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = sub_1CC9A35D8(v3, 0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_1CC9A32E8(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CC23F0], "persistentIDPropertyForGroupingType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithValue:forProperty:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithFilterPredicates:", v10);
    objc_msgSend(v11, "setGroupingType:", 1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id sub_1CC9A3400(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "MPMediaGroupingForScheme");
  if (v11 == 1)
  {
    objc_msgSend(a1, "MPMediaItemQueryOnlyPlayableItems:withUserIdentity:plugin:hash:", 1, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC23F0], "persistentIDPropertyForGroupingType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CC1ED0]) & 1) == 0)
    {
      objc_msgSend(a1, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");

        v20 = (void *)MEMORY[0x1E0CC2430];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "predicateWithValue:forProperty:", v21, v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC1E98]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v22, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithFilterPredicates:", v24);
        objc_msgSend(v12, "setGroupingType:", 1);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

uint64_t sub_1CC9A35D8(void *a1, int a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[7];
  _QWORD v14[9];

  v14[7] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("x-sampcollection-album");
  v13[1] = CFSTR("x-sampcollection-artist");
  v14[0] = &unk_1E88E9DA8;
  v14[1] = &unk_1E88E9DC0;
  v13[2] = CFSTR("x-sampcollection-genre");
  v13[3] = CFSTR("x-sampcollection-audiobook");
  v14[2] = &unk_1E88E9DD8;
  v14[3] = &unk_1E88E9DF0;
  v13[4] = CFSTR("x-sampcollection-podcast");
  v13[5] = CFSTR("x-sampplaylist");
  v14[4] = &unk_1E88E9E08;
  v14[5] = &unk_1E88E9E20;
  v13[6] = CFSTR("x-sampgeniusmix");
  v14[6] = &unk_1E88E9E20;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("x-sampcollection-album");
  v11[1] = CFSTR("x-sampcollection-artist");
  v12[0] = &unk_1E88E9DA8;
  v12[1] = &unk_1E88E9E38;
  v11[2] = CFSTR("x-sampcollection-genre");
  v11[3] = CFSTR("x-sampcollection-audiobook");
  v12[2] = &unk_1E88E9DD8;
  v12[3] = &unk_1E88E9DF0;
  v11[4] = CFSTR("x-sampcollection-podcast");
  v11[5] = CFSTR("x-sampplaylist");
  v12[4] = &unk_1E88E9E08;
  v12[5] = &unk_1E88E9E20;
  v11[6] = CFSTR("x-sampgeniusmix");
  v12[6] = &unk_1E88E9E20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a2)
    v5 = v4;
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 0;

  return v8;
}

id sub_1CC9A37B0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(a1 + 80)
    && ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("x-sampgeniusmix")) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("x-sampplaylist"))))
  {
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v36 = 138543618;
      v37 = v15;
      v38 = 2114;
      v39 = v16;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local playlist", (uint8_t *)&v36, 0x16u);
    }

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = (void *)MEMORY[0x1E0CC2430];
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v18, "predicateWithValue:forProperty:", v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithFilterPredicates:library:", v21, v22);
    objc_msgSend(v13, "setGroupingType:", 6);

    v12 = v13;
LABEL_12:
    v23 = objc_msgSend(v12, "_countOfCollections");
    v24 = a1 + 72;
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v24 + 8) + 24) = v23;
    goto LABEL_14;
  }
  if (a2 == 7 || !a2)
  {
    _MPLogCategoryAssistant();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v36 = 138543618;
      v37 = v10;
      v38 = 2114;
      v39 = v11;
      _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local title query", (uint8_t *)&v36, 0x16u);
    }

    sub_1CC9A3B5C(*(void **)(a1 + 56), (uint64_t)v7, (uint64_t)v8, a2, *(unsigned __int8 *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    goto LABEL_12;
  }
  _MPLogCategoryAssistant();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 48);
    v36 = 138543618;
    v37 = v28;
    v38 = 2114;
    v39 = v29;
    _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: local query", (uint8_t *)&v36, 0x16u);
  }

  sub_1CC9A3B5C(*(void **)(a1 + 56), (uint64_t)v7, (uint64_t)v8, a2, *(unsigned __int8 *)(a1 + 80));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a1 + 72;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v13, "_countOfCollections");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    _MPLogCategoryAssistant();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 40);
      v32 = *(_QWORD *)(a1 + 48);
      v36 = 138543618;
      v37 = v31;
      v38 = 2114;
      v39 = v32;
      _os_log_impl(&dword_1CC97B000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ (getquery) <%{public}@>: no collections", (uint8_t *)&v36, 0x16u);
    }

    v33 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "items");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC9A3C88(v33, v34, *(unsigned __int8 *)(a1 + 80));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v35, "_countOfCollections");
    v13 = v35;
    goto LABEL_13;
  }
LABEL_14:
  v25 = v13;

  return v25;
}

id sub_1CC9A3B5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0CC2430];
  v10 = a1;
  objc_msgSend(v9, "predicateWithValue:forProperty:", a3, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC1E98]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithFilterPredicates:library:", v13, v14);
  objc_msgSend(v15, "setGroupingType:", a4);
  if (a5)
  {
    objc_msgSend(v15, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(v15, "setIgnoreSystemFilterPredicates:", 1);
  }

  return v15;
}

id sub_1CC9A3C88(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = *MEMORY[0x1E0CC1F30];
    v25 = *MEMORY[0x1E0CC1E98];
    v12 = a3 ^ 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "MPMediaItemRepresentationWithUserIdentity:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "valueForProperty:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          if ((v18 & 1) == 0)
          {
            objc_msgSend(v16, "valueForProperty:", v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "BOOLValue");

            if ((v12 | v20) == 1)
              objc_msgSend(v24, "addObject:", v16);
          }
        }
        else
        {
          _MPLogCategoryAssistant();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v14;
            _os_log_impl(&dword_1CC97B000, v21, OS_LOG_TYPE_DEFAULT, "Warning, could not find local item for %{public}@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v24, "count"))
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithEntities:entityType:", v24, 0);
  else
    v22 = 0;

  return v22;
}

void sub_1CC9A4958(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  Class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 32);
  v6 = sub_1CC994D30(a3);
  v7 = (Class *)0x1E0D87FF8;
  if (!v6)
    v7 = (Class *)0x1E0D87FE8;
  v8 = objc_alloc_init(*v7);
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Music Playback Imminent"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v11 + 72);
      *(_QWORD *)(v11 + 72) = v10;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
      objc_msgSend(v8, "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (perform) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v18, 0x16u);

    }
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
}

void sub_1CC9A4AF4(id *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void (**v19)(id, void *);
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)a1[4] + 7, a2);
    objc_storeStrong((id *)a1[4] + 8, a3);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1CC9A4D2C;
    v21[3] = &unk_1E88E3F78;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[4];
    v22 = v9;
    v23 = v10;
    v24 = a1[6];
    objc_msgSend(v8, "_perform:", v21);

    v11 = v22;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*((id *)a1[4] + 9), "length"))
    {
      objc_msgSend(a1[4], "aceId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Music Playback Imminent"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      v15 = (void *)v14[9];
      v14[9] = v13;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *((_QWORD *)a1[4] + 9);
      objc_msgSend(v11, "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v19 = (void (**)(id, void *))a1[6];
    objc_msgSend(v11, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v20);

    dispatch_group_leave((dispatch_group_t)a1[5]);
  }

}

void sub_1CC9A4D2C(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_leave(v3);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Music Playback Imminent"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 72);
    *(_QWORD *)(v7 + 72) = v6;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Music Playback Imminent (completion) <%{public}@>: done", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_1CC9A579C(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v2 = v1;
    objc_msgSend(v2, "itemsQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1CC9A5944;
    v13[3] = &unk_1E88E3A10;
    v13[4] = &v14;
    objc_msgSend(v3, "_enumerateItemsUsingBlock:", v13);

    v4 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v5 = *MEMORY[0x1E0CC1EC0];
    v6 = *MEMORY[0x1E0CC1E88];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1EC0], *MEMORY[0x1E0CC1E88], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "valuesForProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if ((v10 & 0x300) != 0)
    {
      objc_msgSend(v8, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v11, "BOOLValue");

    }
    else
    {
      v4 = (v10 & 0x805) != 0;
    }

  }
  return v4;
}

void sub_1CC9A592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC9A5944(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  if (v5)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
      || (v6 = v5,
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sub_1CC9A579C(),
          v5 = v6,
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
    {
      *a3 = 1;
    }
  }

}

void sub_1CC9A59B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[5];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1CC9A5AD4;
  v13[3] = &unk_1E88E39A0;
  v13[4] = v3;
  objc_msgSend(v4, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:inUsersLibrary:usingBlock:", v2, 0, 1, v13);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 42))
  {
    _MPLogCategoryAssistant();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v7 = "Sync Handler (enumeration): aborted";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1CC97B000, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 16), 0xFFFFFFFFFFFFFFFFLL);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = 0;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
    _MPLogCategoryAssistant();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      v7 = "Sync Handler (enumeration): finished";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }

}

void sub_1CC9A5AD4(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = (void *)MEMORY[0x1D17B04C8]();
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 42))
  {
    objc_msgSend(v16, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) && objc_msgSend(v16, "deletionType"))
      goto LABEL_5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC2028]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
      {
LABEL_10:
        v7 = 16;
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC2030]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "BOOLValue"))
      {

        goto LABEL_10;
      }
      objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC2020]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if ((v13 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1E98]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if ((v11 & 1) == 0)
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
        }
        goto LABEL_18;
      }
      if (objc_msgSend(v6, "groupingType"))
      {
LABEL_18:
        v14 = *(_QWORD *)(a1 + 32);
        v15 = v16;
        v8 = *(void **)(v14 + 32);
        *(_QWORD *)(v14 + 32) = v15;
        v7 = 24;
        goto LABEL_19;
      }
    }
LABEL_5:
    v7 = 16;
LABEL_20:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + v7));

    goto LABEL_21;
  }
  *a3 = 1;
LABEL_21:
  objc_autoreleasePoolPop(v5);

}

uint64_t sub_1CC9A5D1C()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ED8AFDE8;
  qword_1ED8AFDE8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED8AFDE8, "setMaxConcurrentOperationCount:", 5);
}

void sub_1CC9A6CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CC9A6D74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CC9A6D84(uint64_t a1)
{

}

void sub_1CC9A6D8C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "stations", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectsFromArray:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1CC9A6EE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setSingleGroup:", 1);
  v7 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
  objc_msgSend(v5, "setUserIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v5, "setFeatureName:", CFSTR("siri"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1CC9A8028;
  v10[3] = &unk_1E88E4068;
  v11 = v7;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v9 = v7;
  objc_msgSend(v9, "sendPlaybackQueue:toDestination:withOptions:completion:", v5, v6, v8, v10);

}

void sub_1CC9A6FE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_queue_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = dispatch_queue_create("com.apple.mediaPlayer.assistant.loadPredefinedQueue.sendCommand", 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1CC9A7D48;
  v12[3] = &unk_1E88E3B40;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  MEMORY[0x1D17B0210](v7, v12);

}

void sub_1CC9A70B4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  _QWORD *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  _QWORD v71[5];
  id v72;
  id v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Load Predefined Queue"), v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 72);
        *(_QWORD *)(v15 + 72) = v14;

      }
      _MPLogCategoryAssistant();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        v75 = v18;
        _os_log_impl(&dword_1CC97B000, v17, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: radio not available", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 56);
      v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v12 = (_QWORD *)MEMORY[0x1E0D88E18];
      goto LABEL_14;
    case 2:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Load Predefined Queue"), v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 72);
        *(_QWORD *)(v22 + 72) = v21;

      }
      _MPLogCategoryAssistant();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        v75 = v25;
        _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: companion not available", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 56);
      v19 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
      goto LABEL_20;
    case 1:
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "aceId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Load Predefined Queue"), v4);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 72);
        *(_QWORD *)(v6 + 72) = v5;

      }
      _MPLogCategoryAssistant();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        *(_DWORD *)buf = 138543362;
        v75 = v9;
        _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: network conditions do not permit radio playback", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 56);
      v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v12 = (_QWORD *)MEMORY[0x1E0D88D98];
LABEL_14:
      v19 = (id)objc_msgSend(v11, "initWithErrorCode:", *v12);
LABEL_20:
      v26 = v19;
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v19);
      goto LABEL_44;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0D4CAD8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(id **)(a1 + 32);
  if (v26)
  {
    if (!objc_msgSend(v27[9], "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 72);
      *(_QWORD *)(v30 + 72) = v29;

    }
    _MPLogCategoryAssistant();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138543362;
      v75 = v33;
      _os_log_impl(&dword_1CC97B000, v32, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (radio) <%{public}@>: resuming playback", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hashedRouteUIDs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = sub_1CC9A79D4;
    v71[3] = &unk_1E88E3B90;
    v71[4] = *(_QWORD *)(a1 + 32);
    v72 = *(id *)(a1 + 48);
    v73 = *(id *)(a1 + 56);
    objc_msgSend(v34, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v35, *(unsigned int *)(a1 + 76), v71);

  }
  else
  {
    objc_msgSend(v27, "_radioStations");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "count")
      && (objc_msgSend(v34, "firstObject"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v37 = v36;
      v38 = a2 == 4;
      objc_msgSend(v36, "stationStringID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D4B330];
      objc_msgSend(*(id *)(a1 + 32), "refId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "radioQueueWithContextID:stationStringID:", v41, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "startPlaying");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setShouldImmediatelyStartPlayback:", objc_msgSend(v43, "BOOLValue"));

      objc_msgSend(v42, "setShouldOverrideManuallyCuratedQueue:", 1);
      objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hashedRouteUIDs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = sub_1CC9A7AF4;
      v67[3] = &unk_1E88E3BB8;
      v67[4] = *(_QWORD *)(a1 + 32);
      v69 = *(id *)(a1 + 56);
      v70 = *(id *)(a1 + 64);
      v68 = v42;
      v46 = *(unsigned int *)(a1 + 76);
      v47 = v42;
      objc_msgSend(v44, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v47, v45, v38, v46, v67);

    }
    else
    {
      v48 = sub_1CC994964(*(void **)(*(_QWORD *)(a1 + 32) + 80));
      v49 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length");
      if (v48)
      {
        if (!v49)
        {
          objc_msgSend(*(id *)(a1 + 32), "aceId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Load Predefined Queue"), v50);
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = *(_QWORD *)(a1 + 32);
          v53 = *(void **)(v52 + 72);
          *(_QWORD *)(v52 + 72) = v51;

        }
        _MPLogCategoryAssistant();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
          v56 = *(unsigned int *)(a1 + 72);
          *(_DWORD *)buf = 138543618;
          v75 = v55;
          v76 = 2048;
          v77 = v56;
          _os_log_impl(&dword_1CC97B000, v54, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: still loading library (type %ld).", buf, 0x16u);
        }

        v57 = *(_QWORD *)(a1 + 56);
        v58 = objc_alloc(MEMORY[0x1E0D87FE8]);
        v59 = (_QWORD *)MEMORY[0x1E0D88DF0];
      }
      else
      {
        if (!v49)
        {
          objc_msgSend(*(id *)(a1 + 32), "aceId");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Load Predefined Queue"), v60);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = *(_QWORD *)(a1 + 32);
          v63 = *(void **)(v62 + 72);
          *(_QWORD *)(v62 + 72) = v61;

        }
        _MPLogCategoryAssistant();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
          v66 = *(unsigned int *)(a1 + 72);
          *(_DWORD *)buf = 138543618;
          v75 = v65;
          v76 = 2048;
          v77 = v66;
          _os_log_impl(&dword_1CC97B000, v64, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: empty library for (type %ld).", buf, 0x16u);
        }

        v57 = *(_QWORD *)(a1 + 56);
        v58 = objc_alloc(MEMORY[0x1E0D87FE8]);
        v59 = (_QWORD *)MEMORY[0x1E0D88DD0];
      }
      v37 = (void *)objc_msgSend(v58, "initWithErrorCode:", *v59);
      (*(void (**)(uint64_t, void *))(v57 + 16))(v57, v37);
    }

  }
LABEL_44:

}

void sub_1CC9A7840(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 72);
      *(_QWORD *)(v6 + 72) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: no available destination", (uint8_t *)&v15, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "dryRun") & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_1CC9A79D4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if ((objc_msgSend(v3, "dryRun") & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v10 = objc_alloc_init(MEMORY[0x1E0D87FF8]);

    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v10);
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v6, "setSingleGroup:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1CC9A7C88;
    v11[3] = &unk_1E88E4068;
    v12 = v7;
    v8 = *(_QWORD *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v9 = v7;
    objc_msgSend(v9, "sendCommand:toDestination:withOptions:completion:", 0, v6, v8, v11);

  }
}

void sub_1CC9A7AF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 72);
      *(_QWORD *)(v6 + 72) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_ERROR, "Load Predefined Queue (radio) <%{public}@>: no available destination", (uint8_t *)&v15, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88D90]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "dryRun") & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_1CC9A7C88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  if (v3)
  {
    v6 = (objc_class *)MEMORY[0x1E0D87FE8];
    v7 = v5;
    v8 = [v6 alloc];
    objc_msgSend(v13, "localizedFailureReason");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithReason:", v9);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

  }
  else
  {
    v11 = (objc_class *)MEMORY[0x1E0D87FF8];
    v12 = v5;
    v9 = objc_alloc_init(v11);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
  }

}

void sub_1CC9A7D48(id *a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  MRAVEndpointGetLocalEndpoint();
  v4 = (void *)MRAVEndpointCopyUniqueIdentifier();
  v5 = a1[4];
  v6 = a2;
  objc_msgSend(v5, "outputDeviceUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "containsObject:", v6);

  if ((_DWORD)v5)
  {

LABEL_4:
    if (!objc_msgSend(*((id *)a1[5] + 9), "length"))
    {
      objc_msgSend(a1[5], "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[5];
      v13 = (void *)v12[9];
      v12[9] = v11;

    }
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *((_QWORD *)a1[5] + 9);
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (send) <%{public}@>: sending to local WHA destination", buf, 0xCu);
    }

    v16 = (void *)*((_QWORD *)a1[5] + 7);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1CC9A8014;
    v24[3] = &unk_1E88E3B18;
    v27 = a1[7];
    v25 = a1[6];
    v26 = a1[4];
    objc_msgSend(v16, "prepareForAudioHandoffWithCompletion:", v24);

    goto LABEL_14;
  }
  objc_msgSend(a1[4], "outputDeviceUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
    goto LABEL_4;
  if (!objc_msgSend(*((id *)a1[5] + 9), "length"))
  {
    objc_msgSend(a1[5], "aceId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Load Predefined Queue"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = a1[5];
    v20 = (void *)v19[9];
    v19[9] = v18;

  }
  _MPLogCategoryAssistant();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = a1[4];
    v23 = *((_QWORD *)a1[5] + 9);
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2114;
    v31 = v22;
    _os_log_impl(&dword_1CC97B000, v21, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (send) <%{public}@>: sending to destination %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))a1[7] + 2))();
LABEL_14:

}

uint64_t sub_1CC9A8014(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1CC9A8028(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  int IsInformational;
  id v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v16;
  if (v16
    && (objc_msgSend(v16, "domain"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D4B2B0]),
        v8,
        v7 = v16,
        !v9))
  {
    IsInformational = MRMediaRemoteErrorIsInformational();
    v10 = *(_QWORD *)(a1 + 40);
    if (!IsInformational)
    {
      v14 = objc_alloc(MEMORY[0x1E0D87FE8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Send playback failed: %@"), v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "initWithReason:", v12);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v15);

      goto LABEL_5;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "code");
    sub_1CC994E2C(v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
LABEL_5:

}

void sub_1CC9A8164(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  objc_msgSend(v2, "requesterSharedUserId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharedUserIdFromPlayableMusicAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1CC9A8224;
  v7[3] = &unk_1E88E3E10;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  sub_1CC995BFC(CFSTR("Load Predefined Queue"), v3, v4, v5, v7);

}

void sub_1CC9A8224(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC9A8410;
    v16[3] = &unk_1E88E3AA0;
    v5 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v6 = v5;
    v16[5] = v6;
    sub_1CC9A8410((uint64_t)v16);
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void sub_1CC9A8410(uint64_t a1)
{
  void *v2;
  id v3;

  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  MRMediaRemoteGetNowPlayingInfo();

}

void sub_1CC9A84AC(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1CC9A8534;
  v5[3] = &unk_1E88E3FA0;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v4;
  objc_msgSend(v6, "_performWithNowPlayingItem:audioRoutingInfo:completion:", a2, *(unsigned int *)(a1 + 48), v5);

}

void sub_1CC9A8534(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Load Predefined Queue"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v3, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void sub_1CC9A8690()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1EF9DDBE8;
  qword_1EF9DDBE8 = (uint64_t)v0;

  objc_msgSend((id)qword_1EF9DDBE8, "setMaxConcurrentOperationCount:", 2);
  objc_msgSend((id)qword_1EF9DDBE8, "setName:", CFSTR("com.apple.MediaPlayer.AssistantBundle.MPAssistantLoadPredefinedQueue"));
  v2 = (void *)qword_1EF9DDBE8;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQualityOfService:", objc_msgSend(v3, "qualityOfService"));

}

void sub_1CC9A898C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Dislikes Media Entity"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1CC9A8AB4(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC9A8CA4;
    v16[3] = &unk_1E88E3D48;
    v5 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v18 = v5;
    objc_msgSend(v17, "_performWithCompletion:", v16);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Dislikes Media Entity"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void sub_1CC9A8CA4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Dislikes Media Entity"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1CC9A8F54(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = sub_1CC9A9004;
  v8[3] = &unk_1E88E3C30;
  v8[1] = 3221225472;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  sub_1CC996D10(CFSTR("Get Dynamite Client State"), v5, 0, a2, v8);

}

uint64_t sub_1CC9A9004(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setClientState:", a2);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "aceId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Dynamite Client State"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

  }
  _MPLogCategoryAssistant_Oversize();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543619;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_1CC97B000, v7, OS_LOG_TYPE_DEFAULT, "Get Dynamite Client State (completion) <%{public}@>: notifying assistant %{private}@", (uint8_t *)&v13, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  return ICSiriPostDynamiteClientStateChangedNotification();
}

void sub_1CC9A94D0(id *a1, void *a2)
{
  id v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(id, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v6 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    v17 = a1[6];
    v18 = a1[7];
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*((id *)a1[5] + 7), "length"))
    {
      objc_msgSend(a1[5], "aceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details Remote"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      v11 = (void *)v10[7];
      v10[7] = v9;

    }
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *((_QWORD *)a1[5] + 7);
      objc_msgSend(v7, "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v15 = (void (**)(id, void *))a1[7];
    objc_msgSend(v7, "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v16);

  }
}

void sub_1CC9A96F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v6, "localizedFailureReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithReason:", v8);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details Remote"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 56);
      *(_QWORD *)(v12 + 56) = v11;

    }
    _MPLogCategoryAssistant();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v9, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2114;
      v30 = v16;
      _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D4B300]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1CC9A9918;
    v22[3] = &unk_1E88E3CD0;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v23 = v19;
    v24 = v20;
    v25 = v21;
    v26 = *(id *)(a1 + 48);
    v9 = v19;
    objc_msgSend(v9, "connectToEndpoint:completion:", a3, v22);

    v18 = v23;
  }

}

void sub_1CC9A9918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v5, "queueDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D882D8]);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v9 = -objc_msgSend(v7, "previousItemCount");
  v10 = objc_msgSend(v7, "previousItemCount");
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1CC9A9AF0;
  v23[3] = &unk_1E88E3C80;
  v12 = v8;
  v24 = v12;
  v25 = *(id *)(a1 + 48);
  objc_msgSend(v7, "getSAMPMediaItems:origin:completion:", v9, v10, a3, v23);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v13 = objc_msgSend(v7, "nextItemCount");
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = sub_1CC9A9B1C;
  v20[3] = &unk_1E88E3C80;
  v14 = v12;
  v21 = v14;
  v22 = *(id *)(a1 + 48);
  objc_msgSend(v7, "getSAMPMediaItems:origin:completion:", 0, v13, a3, v20);
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = sub_1CC9A9B48;
  block[3] = &unk_1E88E3CA8;
  v15 = *(NSObject **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v18 = v14;
  v19 = *(id *)(a1 + 56);
  v16 = v14;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);

}

void sub_1CC9A9AF0(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreviousItems:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A9B1C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setNextItems:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1CC9A9B48(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Now Playing Queue Details Remote"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 40), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details Remote (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void sub_1CC9A9F00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Likes Media Entity"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1CC9AA028(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC9AA218;
    v16[3] = &unk_1E88E3D48;
    v5 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v18 = v5;
    objc_msgSend(v17, "_performWithCompletion:", v16);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Likes Media Entity"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void sub_1CC9AA218(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Likes Media Entity"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Likes Media Entity (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1CC9AA5CC(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC9AA6A4;
  v8[3] = &unk_1E88E3DC0;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v4, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", v5, a2, v8);

}

void sub_1CC9AA6A4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CC9AA758;
  v9[3] = &unk_1E88E3D98;
  v10 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v10, "sendCommand:toDestination:withOptions:completion:", 19, a2, v5, v9);

}

void sub_1CC9AA758(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Increase Playback Speed"), CFSTR("pluginname"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  if (sub_1CC994D30(v4))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
LABEL_5:
    v12 = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "containsObject:", &unk_1E88E9E68))
  {
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v10 = (id)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88E90]);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("player statuses: %@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("errorstring"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v13);

LABEL_7:
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 48), "aceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Increase Playback Speed"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  _MPLogCategoryAssistant();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
    objc_msgSend(v12, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2114;
    v28 = v20;
    _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_DEFAULT, "Increase Playback Speed (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v12, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  v24 = v6;
  v23 = v6;
  AnalyticsSendEventLazy();

}

id sub_1CC9AAA5C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1CC9AB658(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MPLogCategoryAssistant();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[7];
      *(_DWORD *)buf = 138544130;
      v18 = CFSTR("Add Media Items To Library");
      v19 = 2114;
      v20 = v7;
      v21 = 2048;
      v22 = v8;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ (cloud) <%{public}@>: Failed adding %lld. %{public}@", buf, 0x2Au);
    }

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to add store item. %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v11);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[4];
      v14 = a1[7];
      *(_DWORD *)buf = 138543874;
      v18 = CFSTR("Add Media Items To Library");
      v19 = 2114;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (cloud) <%{public}@>: Added %lld.", buf, 0x20u);
    }

    v12 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  }
  (*(void (**)(void))(a1[6] + 16))();
  v15 = a1[5];
  v16 = *(void **)(v15 + 72);
  *(_QWORD *)(v15 + 72) = 0;

}

void sub_1CC9AB848(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (sub_1CC994D30(a2))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The system media app reported that adding the track to library was unsuccessful. (trackID = %@)"), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1CC9AB8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  v6 = *(id *)(a1 + 32);
  v5(v4, a3);

}

uint64_t sub_1CC9AB92C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC9AB938(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1CC9ABA04;
    v7[3] = &unk_1E88E3E38;
    v4 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_requestCompanionToAddMediaItemsForOrigin:withCompletion:", a2, v7);

  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v6 = (id)objc_msgSend(v5, "initWithErrorCode:", *MEMORY[0x1E0D88DA0]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t sub_1CC9ABA04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CC9ABA10(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1CC9ABC00;
    v16[3] = &unk_1E88E3FA0;
    v5 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v18 = v5;
    objc_msgSend(v17, "_performWithCompletion:", v16);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no user identity"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Library"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void sub_1CC9ABC00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Library"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(v3, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Library (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void sub_1CC9ABF90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3)
    {
      v5 = objc_alloc(MEMORY[0x1E0D87FE8]);
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v5, "initWithReason:", v6);

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Entity To Acoustic ID History"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 56);
      *(_QWORD *)(v10 + 56) = v9;

    }
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v7, "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Acoustic ID History (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v17, 0x16u);

    }
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

void sub_1CC9AC338(id *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(id, void *);
  void *v15;
  const void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(id, void *);
  void *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("UID decoding error"));
    if (!objc_msgSend(*((id *)a1[5] + 7), "length"))
    {
      objc_msgSend(a1[5], "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Volume Level"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      v10 = (void *)v9[7];
      v9[7] = v8;

    }
    _MPLogCategoryAssistant();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *((_QWORD *)a1[5] + 7);
      objc_msgSend(v6, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v14 = (void (**)(id, void *))a1[6];
    objc_msgSend(v6, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);

  }
  if (objc_msgSend(v5, "count") == 1)
  {
    v16 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    v27 = a1[6];
    MRAVReconnaissanceSessionBeginSearch();
    CFRelease(v16);

  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("Too many UIDs requested"));
    if (!objc_msgSend(*((id *)a1[5] + 7), "length"))
    {
      objc_msgSend(a1[5], "aceId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Volume Level"), v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a1[5];
      v21 = (void *)v20[7];
      v20[7] = v19;

    }
    _MPLogCategoryAssistant();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *((_QWORD *)a1[5] + 7);
      objc_msgSend(v17, "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v25 = (void (**)(id, void *))a1[6];
    objc_msgSend(v17, "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v26);

  }
}

void sub_1CC9AC670(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v7, "localizedFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "initWithReason:", v9);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Volume Level"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 56);
      *(_QWORD *)(v13 + 56) = v12;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v10, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2114;
      v36 = v17;
      _os_log_impl(&dword_1CC97B000, v15, OS_LOG_TYPE_ERROR, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc_init(MEMORY[0x1E0D4B300]);
    CFRetain(*(CFTypeRef *)(a1 + 48));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1CC9AC8A8;
    v26[3] = &unk_1E88E3F28;
    v30 = a3;
    v31 = v20;
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v27 = v21;
    v28 = v22;
    v24 = v23;
    v25 = *(_QWORD *)(a1 + 48);
    v29 = v24;
    v32 = v25;
    v10 = v21;
    objc_msgSend(v10, "connectToEndpoint:completion:", a3, v26);

    v19 = v27;
  }

}

void sub_1CC9AC8A8(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  MRAVEndpointGetOutputDeviceVolume();

}

void sub_1CC9AC948(uint64_t a1, void *a2, float a3)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v7, "localizedFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "initWithReason:", v9);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Volume Level"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(v13 + 56);
      *(_QWORD *)(v13 + 56) = v12;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v10, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      v18 = v15;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_1CC97B000, v18, v19, "Get Volume Level (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v29, 0x16u);

    }
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D882E0]);
    *(float *)&v20 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVolumeValue:", v21);

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Volume Level"), v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(void **)(v24 + 56);
      *(_QWORD *)(v24 + 56) = v23;

    }
    _MPLogCategoryAssistant();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(v10, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v26;
      v31 = 2114;
      v32 = v17;
      v18 = v15;
      v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  v27 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v10, "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void sub_1CC9AD1B0(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  id v5;

  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0D4CAD8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0D4CB80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "longLongValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1CC9AD230(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = v5;
    if (sub_1CC994D30(a3))
      v6 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    else
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("System media app reported failure adding track to wishlist."));
    v7 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v5 = v8;
  }

}

void sub_1CC9AD2BC(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 | v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DDC098]);
    v7 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentity:", v8);

    objc_msgSend(v6, "setRequestContext:", v9);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemIdentifiers:", v11);

    objc_msgSend(v6, "setPersonalizationStyle:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1CC9AD488;
    v14[3] = &unk_1E88E4018;
    v15 = (id)v5;
    v12 = *(id *)(a1 + 32);
    v16 = v9;
    v17 = v12;
    v13 = (id)objc_msgSend(v6, "performWithResponseHandler:", v14);

  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("User is not signed into an iTunes account."));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1CC9AD488(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBED8]), "initWithRequestContext:platformMetadataItem:", *(_QWORD *)(a1 + 40), v9);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1CC9AD5F8;
      v13[3] = &unk_1E88E3FF0;
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v11, "performWithResponseHandler:", v13);

    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v11 = (void *)objc_msgSend(v12, "initWithErrorCode:", *MEMORY[0x1E0D88DA8]);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = objc_alloc(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithReason:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_8:

  }
}

void sub_1CC9AD5F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v5)
    {
      v7 = objc_alloc(MEMORY[0x1E0D87FE8]);
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "initWithReason:", v8);

    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D87FF8]);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void sub_1CC9AD6A8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Entity To Wish List"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = v5;

    }
    _MPLogCategoryAssistant();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(v3, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Wish List (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

void sub_1CC9AD80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  id v5;

  if (a2 && a3)
  {
    MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__addRadioTrackToWishListWithStoreID_stationHash_completion_);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v5 = (id)objc_msgSend(v4, "initWithErrorCode:", *MEMORY[0x1E0D88DA8]);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
}

uint64_t MPAssistantWatchGetCompanionOriginUniqueIdentifier()
{
  return 1129140302;
}

uint64_t MPAssistantWatchGetCompanionOriginIfAvailable(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 16))(a1, 0);
}

uint64_t MPAssistantWatchGetCurrentAudioRoutingInfo(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 16))(a1, 0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

uint64_t ICSiriPostDynamiteClientStateChangedNotification()
{
  return MEMORY[0x1E0DDBD80]();
}

uint64_t MPCAssistantCreateError()
{
  return MEMORY[0x1E0D4B2A8]();
}

uint64_t MPCAssistantWatchIsConnectedToCompanion()
{
  return MEMORY[0x1E0D4B2C8]();
}

uint64_t MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity()
{
  return MEMORY[0x1E0CC1D28]();
}

uint64_t MPMediaRemoteCommandOptionsForFeedbackOrPurchaseCommandEvent()
{
  return MEMORY[0x1E0CC2048]();
}

uint64_t MPStoreGetClientTokenStatusForIdentity()
{
  return MEMORY[0x1E0CC22B8]();
}

uint64_t MRAVEndpointAddOutputDevicesToGroupFromSource()
{
  return MEMORY[0x1E0D4B3C8]();
}

uint64_t MRAVEndpointCopyOrigin()
{
  return MEMORY[0x1E0D4B3D8]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1E0D4B3E0]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B3E8]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1E0D4B418]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x1E0D4B420]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x1E0D4B428]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolume()
{
  return MEMORY[0x1E0D4B430]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x1E0D4B440]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x1E0D4B460]();
}

uint64_t MRAVEndpointMoveOutputGroupToDevicesFromSource()
{
  return MEMORY[0x1E0D4B468]();
}

uint64_t MRAVEndpointRemoveOutputDevicesFromGroupFromSource()
{
  return MEMORY[0x1E0D4B490]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x1E0D4B4B0]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1E0D4B658]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1E0D4B668]();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return MEMORY[0x1E0D4B720]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x1E0D4BC58]();
}

uint64_t MRMediaRemoteApplicationIsSystemMediaApplication()
{
  return MEMORY[0x1E0D4BDF8]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x1E0D4BE10]();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return MEMORY[0x1E0D4BE20]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x1E0D4BE28]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x1E0D4BE58]();
}

uint64_t MRMediaRemoteCopySendCommandErrorDescription()
{
  return MEMORY[0x1E0D4BEA0]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1E0D4BEB8]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x1E0D4BED0]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x1E0D4BEE8]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1E0D4BEF8]();
}

uint64_t MRMediaRemoteGetLocalReceiverGroupingIdentity()
{
  return MEMORY[0x1E0D4BF00]();
}

uint64_t MRMediaRemoteGetLocalReceiverPairingIdentity()
{
  return MEMORY[0x1E0D4BF08]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1E0D4BF18]();
}

uint64_t MRMediaRemoteGetNowPlayingInfo()
{
  return MEMORY[0x1E0D4BF38]();
}

uint64_t MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork()
{
  return MEMORY[0x1E0D4BF40]();
}

uint64_t MRMediaRemoteGetPlaybackStateForPlayer()
{
  return MEMORY[0x1E0D4BF60]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForOrigin()
{
  return MEMORY[0x1E0D4BF80]();
}

uint64_t MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions()
{
  return MEMORY[0x1E0D4BF88]();
}

uint64_t MRMediaRemoteIsBooksAppInstalled()
{
  return MEMORY[0x1E0D4BF98]();
}

uint64_t MRMediaRemoteNowPlayingCopyResolvedPlayerPath()
{
  return MEMORY[0x1E0D4BFA8]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return MEMORY[0x1E0D4C0A0]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x1E0D4C1E0]();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return MEMORY[0x1E0D4C1F8]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x1E0D4C200]();
}

uint64_t MRPairedDeviceCopySystemMediaApplication()
{
  return MEMORY[0x1E0D4C248]();
}

uint64_t MRPlaybackQueueCopyContentItems()
{
  return MEMORY[0x1E0D4C258]();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return MEMORY[0x1E0D4C260]();
}

uint64_t MRPlaybackQueueGetContentItemsCount()
{
  return MEMORY[0x1E0D4C268]();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return MEMORY[0x1E0D4C278]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x1E0D4C2B8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x1E0D4C2D0]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x1E0D4C370]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x1E0D4C430]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0D4CE78]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _MPLogCategoryAssistant()
{
  return MEMORY[0x1E0CC2580]();
}

uint64_t _MPLogCategoryAssistant_Oversize()
{
  return MEMORY[0x1E0CC2588]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t stringForSAMPType()
{
  return MEMORY[0x1E0D89348]();
}


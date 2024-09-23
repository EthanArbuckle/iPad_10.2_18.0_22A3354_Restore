void sub_100003C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003C3C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003C4C(uint64_t a1)
{

}

void sub_100003C54(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  id obj;
  _QWORD v36[5];
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v33 = objc_alloc_init((Class)NSMutableSet);
  if (dword_10001E9D8 <= 30
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554462)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "availableOutputDevices"));
    LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke", 33554462, "[%{ptr}] Available output device changed=%@.", v2, v3);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "availableOutputDevices"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("IsDiscoveredWithBroker");
    v7 = *(_QWORD *)v42;
    do
    {
      v8 = 0;
      v34 = v5;
      do
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "airPlayProperties"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v6));

        if (v13)
        {
          if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
          {
            v14 = objc_alloc((Class)IRCandidate);
            v15 = v7;
            v16 = v6;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
            v18 = objc_msgSend(v14, "initWithCandidateIdentifier:", v17);

            v19 = objc_alloc_init((Class)IRNode);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
            objc_msgSend(v19, "setAvOutpuDeviceIdentifier:", v20);

            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v19));
            objc_msgSend(v18, "updateNodes:", v21);

            v22 = objc_alloc((Class)IRMediaEvent);
            if (v11)
              v23 = 9;
            else
              v23 = 10;
            v24 = objc_msgSend(v22, "initWithEventType:eventSubType:", v23, 0);
            v25 = *(_QWORD *)(a1 + 32);
            v26 = *(NSObject **)(v25 + 24);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000040A8;
            block[3] = &unk_1000184D0;
            block[4] = v25;
            v39 = v24;
            v40 = v18;
            v27 = v18;
            v28 = v24;
            dispatch_async(v26, block);
            objc_msgSend(v33, "addObject:", v27);

            v6 = v16;
            v7 = v15;
            v5 = v34;

          }
          if (v11 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            if (dword_10001E9D8 <= 50
              && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
            {
              v29 = *(_QWORD *)(a1 + 32);
              v30 = *(const __CFString **)(a1 + 48);
              if (v30)
              {
                if (IsAppleInternalBuild())
                  v30 = *(const __CFString **)(a1 + 48);
                else
                  v30 = CFSTR("#Redacted#");
              }
              LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke", 33554482, "[%{ptr}] Found output device with deviceID=%@.", v29, v30);
            }
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v33, "count"))
  {
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(NSObject **)(v31 + 24);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100004164;
    v36[3] = &unk_1000184F8;
    v36[4] = v31;
    v37 = v33;
    dispatch_async(v32, v36);

  }
}

_QWORD *sub_1000040A8(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int v4;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 48);
  if (v2)
  {
    v3 = result;
    if (dword_10001E9D8 <= 30)
    {
      if (dword_10001E9D8 == -1)
      {
        v4 = _LogCategory_Initialize(&dword_10001E9D8, 33554462);
        v1 = v3[4];
        if (!v4)
          return objc_msgSend(*(id *)(v1 + 48), "addEvent:forCandidate:", v3[5], v3[6]);
        v2 = *(_QWORD *)(v1 + 48);
      }
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke_2", 33554462, "[%{ptr}] IRSession [%{ptr}]: Adding event %@ for candidate %@", v1, v2, v3[5], v3[6]);
      v1 = v3[4];
    }
    return objc_msgSend(*(id *)(v1 + 48), "addEvent:forCandidate:", v3[5], v3[6]);
  }
  return result;
}

_QWORD *sub_100004164(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int v4;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 48);
  if (v2)
  {
    v3 = result;
    if (dword_10001E9D8 <= 30)
    {
      if (dword_10001E9D8 == -1)
      {
        v4 = _LogCategory_Initialize(&dword_10001E9D8, 33554462);
        v1 = v3[4];
        if (!v4)
          return objc_msgSend(*(id *)(v1 + 48), "updateCandidates:", v3[5]);
        v2 = *(_QWORD *)(v1 + 48);
      }
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke_3", 33554462, "[%{ptr}] IRSession [%{ptr}]: Updating %d candidates", v1, v2, objc_msgSend((id)v3[5], "count"));
      v1 = v3[4];
    }
    return objc_msgSend(*(id *)(v1 + 48), "updateCandidates:", v3[5]);
  }
  return result;
}

void sub_100004230(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6727, 0));
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id sub_100004404(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pickRouteWithID:authString:useRemoteControl:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void sub_100004610(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  int v21;
  BOOL v22;

  v3 = a2;
  v4 = objc_msgSend(v3, "status");
  if (v4 == (id)2)
  {
    if (dword_10001E9D8 <= 50
      && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
      if (v6 && !IsAppleInternalBuild())
      {
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke", 33554482, "[%{ptr}] Added device with deviceID=%@ to output context.", v5, CFSTR("#Redacted#"));
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke", 33554482, "[%{ptr}] Added device with deviceID=%@ to output context.", v5, v7);

      }
    }
    v12 = 0;
  }
  else
  {
    if (dword_10001E9D8 <= 90
      && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554522)))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
      if (v9 && !IsAppleInternalBuild())
      {
        v11 = 0;
        v10 = CFSTR("#Redacted#");
      }
      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
        v11 = 1;
      }
      v13 = objc_msgSend(v3, "status");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cancellationReason"));
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke", 33554522, "[%{ptr}] Failed to add device with deviceID=%@ to output context (status=%d, reason=%@).", v8, v10, v13, v14);

      if (v11)
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cancellationReason"));
    v16 = objc_msgSend(v15, "isEqualToString:", AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped);

    if (v16)
      v12 = -6754;
    else
      v12 = -6700;
  }
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000048A0;
    block[3] = &unk_100018598;
    v20 = v17;
    v22 = v4 == (id)2;
    v21 = v12;
    dispatch_async(v18, block);

  }
}

void sub_1000048A0(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _BOOL8 v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    v3 = v2 != 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain));
    (*(void (**)(uint64_t, _BOOL8, id))(v1 + 16))(v1, v3, v4);

  }
  else
  {
    (*(void (**)(_QWORD, BOOL, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), v2 != 0, 0);
  }
}

void sub_100004A54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  int v21;
  BOOL v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (dword_10001E9D8 <= 50
      && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
      if (v11 && !IsAppleInternalBuild())
      {
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke", 33554482, "[%{ptr}] Created silent connection to deviceID=%@\n", v10, CFSTR("#Redacted#"));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke", 33554482, "[%{ptr}] Created silent connection to deviceID=%@\n", v10, v12);

      }
    }
    v16 = 0;
  }
  else
  {
    if (dword_10001E9D8 <= 90
      && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554522)))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
      if (v14 && !IsAppleInternalBuild())
      {
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke", 33554522, "[%{ptr}] Failed to create silent connection to deviceID=%@ (error=%@, reason=%@)\n", v13, CFSTR("#Redacted#"), v8, v9);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceID"));
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke", 33554522, "[%{ptr}] Failed to create silent connection to deviceID=%@ (error=%@, reason=%@)\n", v13, v15, v8, v9);

      }
    }
    if (objc_msgSend(v9, "isEqualToString:", AVOutputDeviceCommunicationChannelOpenCancellationReasonAuthorizationSkipped))v16 = -6754;
    else
      v16 = -6700;
  }
  objc_msgSend(v7, "close");
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004CE0;
    block[3] = &unk_100018598;
    v20 = v17;
    v22 = v7 != 0;
    v21 = v16;
    dispatch_async(v18, block);

  }
}

void sub_100004CE0(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _BOOL8 v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    v3 = v2 != 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain));
    (*(void (**)(uint64_t, _BOOL8, id))(v1 + 16))(v1, v3, v4);

  }
  else
  {
    (*(void (**)(_QWORD, BOOL, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), v2 != 0, 0);
  }
}

void sub_1000050F4(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = dispatch_time(0, 30000000000);
  v4 = dispatch_semaphore_wait(v2, v3);
  v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  if (dword_10001E9D8 <= 50
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
  {
    v5 = "timed out waiting for";
    if (!v4)
      v5 = "received";
    LogPrintF(&dword_10001E9D8, "-[APUIRouteManager startIntelligentRoutingLocationSensing]_block_invoke", 33554482, "[%{ptr}] IRSession [%{ptr}] %s setSpotOnLocationWithParameters callback with error=%{error}.", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v4 || *(_QWORD *)(v6 + 40))
  {
    objc_msgSend(*(id *)(v6 + 48), "setDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = 0;

  }
  objc_sync_exit(v9);

}

void sub_100005218(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_sync_exit(*(id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100005684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(int *)(a1 + 48);
  if ((_DWORD)v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v3, 0));
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v4, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
  }
}

void sub_1000057B8(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = v2;
  v4 = a1[4];
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("BrokerGroupID"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005874;
  v6[3] = &unk_100018660;
  v5 = (void *)a1[6];
  v7 = (id)a1[5];
  v8 = v5;
  objc_msgSend(v7, "_sendBrokerRequest:params:timeout:completion:", CFSTR("GetInfo"), v3, 4, v6);

}

id sub_100005874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetInfoResponse:requestUUID:error:completion:", a4, a2, a3, *(_QWORD *)(a1 + 40));
}

void sub_100005AE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(int *)(a1 + 48);
  if ((_DWORD)v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v3, 0));
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v4, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
  }
}

void sub_100005C38(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[4], CFSTR("BrokerAuthString"));
  v3 = a1[5];
  if (v3)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("BrokerGroupID"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005D04;
  v5[3] = &unk_100018660;
  v4 = (void *)a1[7];
  v6 = (id)a1[6];
  v7 = v4;
  objc_msgSend(v6, "_sendBrokerRequest:params:timeout:completion:", CFSTR("Authenticate"), v2, 25, v5);

}

id sub_100005D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticationResponse:requestUUID:error:completion:", a4, a2, a3, *(_QWORD *)(a1 + 40));
}

void sub_100005DF4(uint64_t a1)
{
  void *v2;
  void *v3;
  APUIBrokerHelperRequestContext *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  intptr_t v15;
  id v16;
  APUIBrokerHelperRequestContext *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  int v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  v4 = objc_opt_new(APUIBrokerHelperRequestContext);
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v4, v3);
  objc_sync_exit(v5);

  v6 = *(void **)(a1 + 40);
  if (v6)
    v7 = objc_msgSend(v6, "mutableCopy");
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("RequestType"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, CFSTR("RequestUUID"));
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = IsAppleInternalBuild();
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 33554482, "[%{ptr}] Sending discovery broker %'@ command %@%?{end} with param %@", v9, v10, v3, v11 == 0, v8);
  }
  v12 = APSXPCClientSendCommandCreatingReply(CFSTR("com.apple.airplay.discoverybroker"), CFSTR("BrokerRequest"), v8, 0);
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 33554482, "[%{ptr}] Sent %'@ request: %#m", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v12);
  }
  if ((_DWORD)v12)
  {
    APSLogErrorAt(v12, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 209, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[APUIBrokerHelperRequestContext semaphore](v4, "semaphore"));
    v14 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 64));
    v15 = dispatch_semaphore_wait(v13, v14);

    if (v15)
    {
      if (dword_10001EB68 <= 90
        && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554522)))
      {
        LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 33554522, "[%{ptr}] Giving up waiting for %'@ request %@ response after %d secs", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 64));
      }
      v12 = 4294960574;
    }
    else
    {
      v12 = 0;
    }
  }
  v16 = *(id *)(a1 + 32);
  objc_sync_enter(v16);
  if ((_DWORD)v12 || !v4)
  {
    if (dword_10001EB68 <= 90
      && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554522)))
    {
      LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 33554522, "[%{ptr}] Discovery broker request %@ failed with error: %#m", *(_QWORD *)(a1 + 32), v3, v12);
    }
    v18 = 0;
  }
  else
  {
    v17 = v4;
    objc_sync_enter(v17);
    LODWORD(v12) = -[APUIBrokerHelperRequestContext status](v17, "status");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[APUIBrokerHelperRequestContext response](v17, "response"));
    objc_sync_exit(v17);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v3);
  objc_sync_exit(v16);

  v19 = *(void **)(a1 + 56);
  if (v19)
  {
    v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006234;
    block[3] = &unk_1000186D8;
    v24 = v19;
    v22 = v3;
    v25 = v12;
    v23 = v18;
    dispatch_async(v20, block);

  }
}

void sub_10000620C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006234(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(int *)(a1 + 56);
  if ((_DWORD)v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v4, 0));
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v3, v5, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  }
}

void sub_10000657C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100006614(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10001F050;
  qword_10001F050 = v1;

  return APSXPCClientAddEventHandler(CFSTR("com.apple.airplay.discoverybroker"), CFSTR("BrokerResponse"), sub_100006654);
}

void sub_100006654(__CFString *a1, uint64_t a2)
{
  void *v4;
  int v5;
  int v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APUIBrokerHelper sharedInstance](APUIBrokerHelper, "sharedInstance"));
  v7 = v4;
  if (a1 == CFSTR("BrokerResponse") || a1 && (v5 = CFEqual(a1, CFSTR("BrokerResponse")), v4 = v7, v5))
  {
    objc_msgSend(v4, "_handleBrokerResponse:", a2);
LABEL_5:
    v4 = v7;
    goto LABEL_10;
  }
  if (dword_10001EB68 <= 90)
  {
    if (dword_10001EB68 != -1 || (v6 = _LogCategory_Initialize(&dword_10001EB68, 33554522), v4 = v7, v6))
    {
      LogPrintF(&dword_10001EB68, "void _HandleBrokerServiceResponse(CFStringRef, CFDictionaryRef)", 33554522, "[%{ptr}] Unsupported event type: %@\n", v4, a1);
      goto LABEL_5;
    }
  }
LABEL_10:

}

uint64_t sub_100006BF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100006F6C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_100007978(id a1)
{
  if (dword_10001ED08 <= 50
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _initWifiInterface]_block_invoke", 33554482, "CWFInterface invalidated.");
  }
}

void sub_100007CA0(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  NSObject *v15;
  id v16;
  id location;
  NSErrorUserInfoKey v18;
  void *v19;

  v2 = dispatch_semaphore_create(0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100007F10;
  v14 = &unk_1000187D8;
  objc_copyWeak(&v16, &location);
  v4 = v2;
  v15 = v4;
  objc_msgSend(v3, "setEventHandler:", &v11);
  v5 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (dword_10001ED08 <= 90
      && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554522)))
    {
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke", 33554522, "[%{ptr}] WiFi has no valid IP after %d secs.", *(_QWORD *)(a1 + 32), 10, v11, v12, v13, v14);
    }
    v18 = NSLocalizedDescriptionKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WiFi has no valid IP"), &stru_100018E60, 0));
    v19 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301028, v9));

  }
  else
  {
    v6 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void sub_100007EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007F10(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;

  v38 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[4];
    v6 = objc_msgSend(v38, "type");
    if (v6 == (id)19)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4Addresses"));
      if (!objc_msgSend(v15, "count"))
      {

LABEL_43:
        goto LABEL_44;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4SubnetMasks"));
      v17 = objc_msgSend(v16, "count");

      if (!v17)
        goto LABEL_43;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4Addresses"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4SubnetMasks"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 0));
      v22 = objc_msgSend(v19, "isValidIPv4AddressWithSubnetMask:", v21);

      if (!v22)
        goto LABEL_43;
      if (dword_10001ED08 <= 50
        && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4Addresses"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));
        if (v24 && !IsAppleInternalBuild())
        {
          v25 = 0;
          v37 = CFSTR("#Redacted#");
        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4Addresses"));
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 0));
          v25 = 1;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4SubnetMasks"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", 0));
        if (v31 && !IsAppleInternalBuild())
        {
          LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2", 33554482, "[%{ptr}] Configured IPv4 address %@ with subnet mask %@ are valid.", v4, v37, CFSTR("#Redacted#"));
        }
        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv4SubnetMasks"));
          v33 = v23;
          v34 = v25;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
          LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2", 33554482, "[%{ptr}] Configured IPv4 address %@ with subnet mask %@ are valid.", v4, v37, v35);

          v25 = v34;
          v23 = v33;

        }
        if (v25)
        {

        }
      }
    }
    else
    {
      if (v6 != (id)20)
        goto LABEL_43;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv6Addresses"));
      v8 = objc_msgSend(v7, "count");

      if (!v8)
        goto LABEL_43;
      v9 = 0;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv6Addresses"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
        v12 = objc_msgSend(v11, "isValidIPv6Address");

        if (v12)
          break;
        ++v9;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv6Addresses"));
        v14 = objc_msgSend(v13, "count");

        if (v9 >= (unint64_t)v14)
          goto LABEL_43;
      }
      if (dword_10001ED08 <= 50
        && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv6Addresses"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", v9));
        if (v27 && !IsAppleInternalBuild())
        {
          LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2", 33554482, "[%{ptr}] Configured IPv6 address %@ is valid.", v4, CFSTR("#Redacted#"));
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IPv6Addresses"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v9));
          LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2", 33554482, "[%{ptr}] Configured IPv6 address %@ is valid.", v4, v29);

        }
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_43;
  }
  if (dword_10001ED08 <= 60
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554492)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2", 33554492, "APUIConnectivityManager has gone away in CWInterface eventHandler");
  }
LABEL_44:

}

void sub_1000088A8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  id v8;
  id v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSErrorUserInfoKey v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  if (-[__CFString count](v6, "count"))
  {
    if (dword_10001ED08 <= 50
      && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
    {
      v7 = a1[4];
      v8 = -[__CFString count](v6, "count");
      v9 = v8;
      if (v6 && !IsAppleInternalBuild(v8))
        v10 = CFSTR("#Redacted#");
      else
        v10 = v6;
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:]_block_invoke", 33554482, "[%{ptr}] Found %lu networks with scan results = %@.", v7, v9, v10);
    }
    v16 = (void *)a1[4];
    v17 = a1[5];
    v18 = a1[6];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v16, "_associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:", v17, v18, v19, a1[7]);

    v11 = 0;
  }
  else
  {
    if (v5)
    {
      v11 = v5;
    }
    else
    {
      v20 = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("No results found in WiFi scan"), &stru_100018E60, 0));
      v21 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6700, v14));

    }
    v15 = a1[7];
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v11);
  }

}

void sub_100008C18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  if (v3)
  {
    if (dword_10001ED08 <= 50
      && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke", 33554482, "[%{ptr}] WiFi association failed with error %@.", v4, v5);

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v3);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008E90;
    v17[3] = &unk_100018850;
    v6 = *(void **)(a1 + 40);
    v18 = *(id *)(a1 + 32);
    v19 = v6;
    objc_msgSend(v18, "_monitorWiFiIPAddressConfigurationWithCompletion:", v17);
    objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWiFiEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentKnownNetworkProfile"));
    if (dword_10001ED08 <= 50
      && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "networkName"));
      v10 = (void *)v9;
      if (v9 && !IsAppleInternalBuild(v9))
      {
        v12 = 0;
        v11 = CFSTR("#Redacted#");
      }
      else
      {
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "networkName"));
        v12 = 1;
      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "captiveProfile"));
      v15 = (void *)v14;
      if (v14 && !IsAppleInternalBuild(v14))
      {
        LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke", 33554482, "[%{ptr}] WiFi associated with %@. currentNetworkProfile captiveProfile: %@", v8, v11, CFSTR("#Redacted#"));
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "captiveProfile"));
        LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke", 33554482, "[%{ptr}] WiFi associated with %@. currentNetworkProfile captiveProfile: %@", v8, v11, v16);

      }
      if (v12)

    }
    objc_msgSend(*(id *)(a1 + 32), "tagAirPlayNetwork");

  }
}

void sub_100008E90(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5
    && dword_10001ED08 <= 90
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554522)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke_2", 33554522, "[%{ptr}] Associated WiFi has no IP configuration.", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringWiFiEvents");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v5;
  if (v3)
  {
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v5 == 0, v5);
    v4 = v5;
  }

}

void sub_100009094(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009208(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100009328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000093BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000944C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000095A8(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  if (a2 == 3)
  {
    v7 = v6;
    objc_msgSend(v6, "handleWiFiInterfaceChangedWithEventInfo:", a3);
    goto LABEL_5;
  }
  if (a2 == 4)
  {
    v7 = v6;
    objc_msgSend(v6, "handleUSBInterfaceChangedWithEventInfo:", a3);
LABEL_5:
    v6 = v7;
  }

}

void sub_1000096D8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10001F060;
  qword_10001F060 = v1;

}

id sub_10000A190(uint64_t a1)
{
  id WeakRetained;

  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController viewDidLoad]_block_invoke", 33554482, "[%{ptr}] Stopping discovery pre-warm with session [%{ptr}]", WeakRetained, *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 32), "setDiscoveryMode:", 0);
}

void sub_10000A750(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setupAirPlayConnectingProxCardManagerWithSetupPayload:withTitle:withSubTitle:withImageName:andCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectingProxCardController"));
  objc_msgSend(v4, "pushViewController:animated:", v5, 0);

}

uint64_t sub_10000AAE4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000AE18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AF24;
  v10[3] = &unk_100018930;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AirPlayAlertViewController alertWithTitle:withMessage:actions:withCompletion:](AirPlayAlertViewController, "alertWithTitle:withMessage:actions:withCompletion:", v2, v3, v4, v10));
  objc_msgSend(*(id *)(a1 + 32), "setAirPlayAlertController:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipInvalidateOnProxCardFlowDidDismiss:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B070;
  v9[3] = &unk_100018610;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

}

id sub_10000AF24(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=WIFI")));
    objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentUnableToConnectToWiFiAlertWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentUnableToConnectToWiFiAlertWithSetupPayload opened Wi-Fi settings", *(_QWORD *)(a1 + 40));
    }

  }
  else if (dword_10001EDE8 <= 50
         && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentUnableToConnectToWiFiAlertWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentUnableToConnectToWiFiAlertWithSetupPayload dismissed", *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void sub_10000B070(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "airPlayAlertController"));
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, 0);

}

void sub_10000B2B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B39C;
  v8[3] = &unk_100018980;
  v4 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AirPlayAlertViewController alertWithTitle:withMessage:actions:withCompletion:](AirPlayAlertViewController, "alertWithTitle:withMessage:actions:withCompletion:", v4, v2, v3, v8));
  objc_msgSend(*(id *)(a1 + 32), "setAirPlayAlertController:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipInvalidateOnProxCardFlowDidDismiss:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B434;
  v7[3] = &unk_100018610;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

}

void sub_10000B39C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentUnableToConnectToDeviceAlertWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentUnableToConnectToDeviceAlertWithSetupPayload dismissed", *(_QWORD *)(a1 + 32), v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void sub_10000B434(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "airPlayAlertController"));
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, 0);

}

void sub_10000B61C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B700;
  v8[3] = &unk_100018980;
  v4 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AirPlayAlertViewController alertWithTitle:withMessage:actions:withCompletion:](AirPlayAlertViewController, "alertWithTitle:withMessage:actions:withCompletion:", v4, v2, v3, v8));
  objc_msgSend(*(id *)(a1 + 32), "setAirPlayAlertController:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipInvalidateOnProxCardFlowDidDismiss:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B798;
  v7[3] = &unk_100018610;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

}

void sub_10000B700(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentInvalidCodeAlertWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentInvalidCodeAlertWithSetupPayload dismissed", *(_QWORD *)(a1 + 32), v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void sub_10000B798(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "airPlayAlertController"));
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, 0);

}

void sub_10000BBA0(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((a2 & 1) != 0)
  {
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "wifiSSID"));
      v7 = (void *)v6;
      if (v6 && !IsAppleInternalBuild(v6))
      {
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _joinWiFiAndConnectToReceiverWithSetupPayload:]_block_invoke", 33554482, "[%{ptr}] Wifi was successfully associated with %@", v5, CFSTR("#Redacted#"));
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "wifiSSID"));
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _joinWiFiAndConnectToReceiverWithSetupPayload:]_block_invoke", 33554482, "[%{ptr}] Wifi was successfully associated with %@", v5, v8);

      }
    }
    if (objc_msgSend(v13, "code") == (id)-71157
      && dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _joinWiFiAndConnectToReceiverWithSetupPayload:]_block_invoke", 33554482, "[%{ptr}] Network Connectivity Error: %@", v11, v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "_performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if (dword_10001EDE8 <= 90
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554522)))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _joinWiFiAndConnectToReceiverWithSetupPayload:]_block_invoke", 33554522, "[%{ptr}] Wifi connection failed with error %@.", v9, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "_presentUnableToConnectToWiFiAlertWithSetupPayload:", *(_QWORD *)(a1 + 40));
  }

}

void sub_10000BEE0(_QWORD *a1, void *a2, void *a3)
{
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = (uint64_t)v15;
  if (v15)
  {
    if (dword_10001EDE8 <= 90
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554522)))
    {
      v13 = a1[4];
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _getSupportedNetworks:withSetupPayload:completion:]_block_invoke", 33554522, "[%{ptr}] Failed to get brokerGroupInfo with error: %@", v13, v9);
      v12 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (v6 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)v6))
      {
        v7 = a1[4];
        if (v5 && !IsAppleInternalBuild(v6))
          v8 = CFSTR("#Redacted#");
        else
          v8 = v5;
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _getSupportedNetworks:withSetupPayload:completion:]_block_invoke", 33554482, "[%{ptr}] Successfully obtained brokerGroupInfo: %@", v7, v8);
      }
    }
    if (-[__CFString count](v5, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString allKeys](v5, "allKeys"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("supportedWiFiNetworkSSIDs")));

LABEL_13:
      goto LABEL_19;
    }
  }
  v12 = 0;
LABEL_19:
  v14 = a1[6];
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, objc_msgSend(v12, "containsObject:", a1[5]));

}

void sub_10000C174(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  v6 = (uint64_t)v19;
  if (v19)
  {
    if (dword_10001EDE8 <= 90
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554522)))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554522, "[%{ptr}] Failed to perform broker authentication with error: %@", v7, v8);

    }
    if (*(_BYTE *)(a1 + 48))
    {
      if (dword_10001EDE8 <= 50
        && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "wifiSSID"));
        v13 = (void *)v12;
        if (v12 && !IsAppleInternalBuild(v12))
        {
          LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554482, "[%{ptr}] Switch to WiFi %@ after broker authentication failure and re-try", v11, CFSTR("#Redacted#"));
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "wifiSSID"));
          LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554482, "[%{ptr}] Switch to WiFi %@ after broker authentication failure and re-try", v11, v14);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_joinWiFiAndConnectToReceiverWithSetupPayload:", *(_QWORD *)(a1 + 40));
    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "routeToReceiver") & 1) != 0)
    {
      if (objc_msgSend(v19, "code") == (id)-6754)
      {
        if (dword_10001EDE8 <= 50
          && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "brokerToken"));
          v17 = (void *)v16;
          if (v16 && !IsAppleInternalBuild(v16))
          {
            LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554482, "[%{ptr}] Showing invalid code alert as broker token %@ is invalid", v15, CFSTR("#Redacted#"));
          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "brokerToken"));
            LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554482, "[%{ptr}] Showing invalid code alert as broker token %@ is invalid", v15, v18);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "_presentInvalidCodeAlertWithSetupPayload:", *(_QWORD *)(a1 + 40));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_presentUnableToConnectToDeviceAlertWithSetupPayload:", *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentSetupCompletedProxCard:isAirPlaySetUp:", *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (v6 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)v6))
      {
        v9 = *(_QWORD *)(a1 + 32);
        if (v5 && !IsAppleInternalBuild(v6))
          v10 = CFSTR("#Redacted#");
        else
          v10 = v5;
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:]_block_invoke", 33554482, "[%{ptr}] Broker authentication succeeded with setupTargetReceiverDeviceID: %@", v9, v10);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_connectToAirPlayReceiverWithDeviceID:andSetupPayload:", v5, *(_QWORD *)(a1 + 40));
  }

}

void sub_10000C570(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;

  v5 = a3;
  v18 = v5;
  if ((a2 & 1) != 0)
  {
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _connectToAirPlayReceiverWithDeviceID:andSetupPayload:]_block_invoke", 33554482, "[%{ptr}] presentAirPlaySetupProxCardWithSetupPayload:Successfully routed to receiver", *(_QWORD *)(a1 + 32));
    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 1;
    goto LABEL_20;
  }
  v6 = v5;
  if (dword_10001EDE8 <= 90)
  {
    if (dword_10001EDE8 != -1 || (v12 = _LogCategory_Initialize(&dword_10001EDE8, 33554522), v6 = v18, v12))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _connectToAirPlayReceiverWithDeviceID:andSetupPayload:]_block_invoke", 33554522, "[%{ptr}] presentAirPlaySetupProxCardWithSetupPayload:Failed to pick route %@", v7, v8);

      v6 = v18;
    }
  }
  if (NSErrorToOSStatus(v6) == -6754)
  {
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "receiverToken"));
      v15 = (void *)v14;
      if (v14 && !IsAppleInternalBuild(v14))
      {
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _connectToAirPlayReceiverWithDeviceID:andSetupPayload:]_block_invoke", 33554482, "[%{ptr}] Showing invalid code alert as AirPlay receiver token %@ has expired", v13, CFSTR("#Redacted#"));
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "receiverToken"));
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _connectToAirPlayReceiverWithDeviceID:andSetupPayload:]_block_invoke", 33554482, "[%{ptr}] Showing invalid code alert as AirPlay receiver token %@ has expired", v13, v16);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_presentInvalidCodeAlertWithSetupPayload:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v17 = objc_msgSend(*(id *)(a1 + 40), "routeToReceiver");
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    if (!v17)
    {
      v11 = 0;
LABEL_20:
      objc_msgSend(v9, "_presentSetupCompletedProxCard:isAirPlaySetUp:", v10, v11);
      goto LABEL_26;
    }
    objc_msgSend(v9, "_presentUnableToConnectToDeviceAlertWithSetupPayload:", v10);
  }
LABEL_26:

}

void sub_10000C8FC(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[5];
  __CFString *v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentNetworkSSID"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiSSID"));
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  v6 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 40)), "isMultipleWifiFeatureEnabled");
  if ((_DWORD)v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000CB30;
    v14[3] = &unk_100018A48;
    v14[4] = v7;
    v15 = v3;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v7, "_getSupportedNetworks:withSetupPayload:completion:", v15, v8, v14);

  }
  else if ((v5 & 1) != 0)
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (v6 = (id)_LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)v6))
      {
        v9 = *(_QWORD *)(a1 + 40);
        if (v3 && !IsAppleInternalBuild(v6))
          v10 = CFSTR("#Redacted#");
        else
          v10 = v3;
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:]_block_invoke", 33554482, "[%{ptr}] presentAirPlayConnectionProxCardWithSetupPayload: Multiple network feature is not enabled. Current network (%@) is the same as network in payload, try broker authentication", v9, v10);
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
    objc_msgSend(v13, "tagAirPlayNetwork");

    objc_msgSend(*(id *)(a1 + 40), "_performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (v6 = (id)_LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)v6))
      {
        v11 = *(_QWORD *)(a1 + 40);
        if (v3 && !IsAppleInternalBuild(v6))
          v12 = CFSTR("#Redacted#");
        else
          v12 = v3;
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:]_block_invoke", 33554482, "[%{ptr}] presentAirPlayConnectionProxCardWithSetupPayload: Multiple network feature is not enabled. Current network (%@) is not the same as network in payload, try to connect to WiFi", v11, v12);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_joinWiFiAndConnectToReceiverWithSetupPayload:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "startIntelligentRoutingLocationSensing");

}

id sub_10000CB30(uint64_t a1, char a2)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;

  v2 = a1;
  if ((a2 & 1) != 0)
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (a1 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)a1))
      {
        v4 = *(_QWORD *)(v2 + 32);
        v3 = *(const __CFString **)(v2 + 40);
        if (v3)
        {
          if (IsAppleInternalBuild(a1))
            v3 = *(const __CFString **)(v2 + 40);
          else
            v3 = CFSTR("#Redacted#");
        }
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentAirPlayConnectionProxCardWithSetupPayload: Multiple network feature is enabled. Current network (%@) is supported, try broker authentication.", v4, v3);
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
    objc_msgSend(v7, "tagAirPlayNetwork");

    return objc_msgSend(*(id *)(v2 + 32), "_performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:", *(_QWORD *)(v2 + 48), 0);
  }
  else
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (a1 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), (_DWORD)a1))
      {
        v6 = *(_QWORD *)(v2 + 32);
        v5 = *(const __CFString **)(v2 + 40);
        if (v5)
        {
          if (IsAppleInternalBuild(a1))
            v5 = *(const __CFString **)(v2 + 40);
          else
            v5 = CFSTR("#Redacted#");
        }
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:]_block_invoke_2", 33554482, "[%{ptr}] presentAirPlayConnectionProxCardWithSetupPayload: Multiple network feature is enabled. Current network (%@) is not supported and is not the same network in payload, try to connect to WiFi.", v6, v5);
      }
    }
    return objc_msgSend(*(id *)(v2 + 32), "_joinWiFiAndConnectToReceiverWithSetupPayload:", *(_QWORD *)(v2 + 48));
  }
}

void sub_10000CD88(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CE28;
  v7[3] = &unk_100018A98;
  v7[4] = v2;
  objc_msgSend(v2, "_initializeSetupCompletionProxCardManagerWithSetupPayload:isAirPlaySetUp:andCompletion:", v3, v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completedProxCardController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 0);

}

void sub_10000CE28(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavigationController"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000CEA0;
  v3[3] = &unk_100018610;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t sub_10000CEA0(uint64_t result)
{
  uint64_t v1;

  if (dword_10001EDE8 <= 50)
  {
    v1 = result;
    if (dword_10001EDE8 != -1)
      return LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentSetupCompletedProxCard:isAirPlaySetUp:]_block_invoke_3", 33554482, "[%{ptr}] presentSetupCompletedProxCard dismissed", *(_QWORD *)(v1 + 32));
    result = _LogCategory_Initialize(&dword_10001EDE8, 33554482);
    if ((_DWORD)result)
      return LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentSetupCompletedProxCard:isAirPlaySetUp:]_block_invoke_3", 33554482, "[%{ptr}] presentSetupCompletedProxCard dismissed", *(_QWORD *)(v1 + 32));
  }
  return result;
}

void sub_10000D11C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (dword_10001EDE8 <= 90)
  {
    v8 = v3;
    if (dword_10001EDE8 != -1 || (v7 = _LogCategory_Initialize(&dword_10001EDE8, 33554522), v4 = v8, v7))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController configureWithContext:completion:]_block_invoke", 33554522, "[%{ptr}]:Failed to configure remote alert %@", v5, v6);

      v4 = v8;
    }
  }

}

void sub_10000D434(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (dword_10001EDE8 <= 90)
  {
    v8 = v3;
    if (dword_10001EDE8 != -1 || (v7 = _LogCategory_Initialize(&dword_10001EDE8, 33554522), v4 = v8, v7))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController prepareForActivationWithContext:completion:]_block_invoke", 33554522, "[%{ptr}]: Failed to activate remote alert %@", v5, v6);

      v4 = v8;
    }
  }

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv4Addresses");
}

id objc_msgSend_IPv4SubnetMasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv4SubnetMasks");
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv6Addresses");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLContexts");
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

id objc_msgSend__addOutputDeviceToSystemMusicContext_authString_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addOutputDeviceToSystemMusicContext:authString:completion:");
}

id objc_msgSend__associateWithNetworkWithPassPhrase_captivePortalAuthToken_scanResults_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:");
}

id objc_msgSend__connectToAirPlayReceiverWithDeviceID_andSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToAirPlayReceiverWithDeviceID:andSetupPayload:");
}

id objc_msgSend__createSilentConnectionToDevice_authString_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSilentConnectionToDevice:authString:completion:");
}

id objc_msgSend__getSupportedNetworks_withSetupPayload_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSupportedNetworks:withSetupPayload:completion:");
}

id objc_msgSend__handleBrokerResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleBrokerResponse:");
}

id objc_msgSend__handleURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleURL:");
}

id objc_msgSend__initWifiInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWifiInterface");
}

id objc_msgSend__initializeAirPlayConnectionProxCardManagerWithSetupPayload_andCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeAirPlayConnectionProxCardManagerWithSetupPayload:andCompletion:");
}

id objc_msgSend__initializeSetupCompletionProxCardManagerWithSetupPayload_isAirPlaySetUp_andCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeSetupCompletionProxCardManagerWithSetupPayload:isAirPlaySetUp:andCompletion:");
}

id objc_msgSend__joinWiFiAndConnectToReceiverWithSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_joinWiFiAndConnectToReceiverWithSetupPayload:");
}

id objc_msgSend__localizedSystemWiFiString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedSystemWiFiString");
}

id objc_msgSend__monitorWiFiIPAddressConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monitorWiFiIPAddressConfigurationWithCompletion:");
}

id objc_msgSend__performBrokerAuthenticationWithSetupPayload_switchWiFiIfFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBrokerAuthenticationWithSetupPayload:switchWiFiIfFailed:");
}

id objc_msgSend__presentAirPlayConnectionProxCardWithSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAirPlayConnectionProxCardWithSetupPayload:");
}

id objc_msgSend__presentInvalidCodeAlertWithSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentInvalidCodeAlertWithSetupPayload:");
}

id objc_msgSend__presentProxCardFlowForLaunchType_andSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentProxCardFlowForLaunchType:andSetupPayload:");
}

id objc_msgSend__presentSetupCompletedProxCard_isAirPlaySetUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentSetupCompletedProxCard:isAirPlaySetUp:");
}

id objc_msgSend__presentUnableToConnectToDeviceAlertWithSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentUnableToConnectToDeviceAlertWithSetupPayload:");
}

id objc_msgSend__presentUnableToConnectToWiFiAlertWithSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentUnableToConnectToWiFiAlertWithSetupPayload:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__sendBrokerRequest_params_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendBrokerRequest:params:timeout:completion:");
}

id objc_msgSend__setUpByURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUpByURL:");
}

id objc_msgSend__setupAirPlayConnectingProxCardManagerWithSetupPayload_withTitle_withSubTitle_withImageName_andCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupAirPlayConnectingProxCardManagerWithSetupPayload:withTitle:withSubTitle:withImageName:andCompletion:");
}

id objc_msgSend__setupAssistantEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupAssistantEnabled");
}

id objc_msgSend__startMonitoringWiFiEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startMonitoringWiFiEvents");
}

id objc_msgSend__startWiFiNetworkScanWithScanParameters_passPhrase_captivePortalAuthToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:");
}

id objc_msgSend__stopMonitoringWiFiEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopMonitoringWiFiEvents");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOutputDevice_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOutputDevice:options:completionHandler:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSymbolEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSymbolEffect:");
}

id objc_msgSend_airPlayAlertController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airPlayAlertController");
}

id objc_msgSend_airPlayProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airPlayProperties");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertWithTitle_withMessage_actions_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertWithTitle:withMessage:actions:withCompletion:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associateWithParameters_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associateWithParameters:reply:");
}

id objc_msgSend_availableOutputDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableOutputDevices");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brokerToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brokerToken");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancellationReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancellationReason");
}

id objc_msgSend_captivePortalAuthToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captivePortalAuthToken");
}

id objc_msgSend_captiveProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captiveProfile");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completedProxCardController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedProxCardController");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_connectingProxCardController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingProxCardController");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentKnownNetworkProfile");
}

id objc_msgSend_currentNetworkSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentNetworkSSID");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoveryFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryFeatures:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_enableCaptiveWebsheet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCaptiveWebsheet:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getBrokerGroupInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBrokerGroupInfo:completion:");
}

id objc_msgSend_handleUSBInterfaceChangedWithEventInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUSBInterfaceChangedWithEventInfo:");
}

id objc_msgSend_handleWiFiInterfaceChangedWithEventInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleWiFiInterfaceChangedWithEventInfo:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initWithCandidateIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCandidateIdentifier:");
}

id objc_msgSend_initWithDeviceFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceFeatures:");
}

id objc_msgSend_initWithEventType_eventSubType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:eventSubType:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithServiceToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceToken:");
}

id objc_msgSend_initWithServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:");
}

id objc_msgSend_initWithTitle_subTitle_imageName_tintColor_shouldAnimate_actionTitle_bottomSubtitle_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCaptivePortalMitigationSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCaptivePortalMitigationSupported");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMultipleWifiFeatureEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultipleWifiFeatureEnabled");
}

id objc_msgSend_isNetworkHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNetworkHidden");
}

id objc_msgSend_isValidIPv4Address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidIPv4Address");
}

id objc_msgSend_isValidIPv4AddressWithSubnetMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidIPv4AddressWithSubnetMask:");
}

id objc_msgSend_isValidIPv6Address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidIPv6Address");
}

id objc_msgSend_isValidSubnetMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidSubnetMask");
}

id objc_msgSend_joinWiFiNetworkWithSSID_isNetworkHidden_passPhrase_captivePortalAuthToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWiFiNetworkWithSSID:isNetworkHidden:passPhrase:captivePortalAuthToken:completion:");
}

id objc_msgSend_launchAirPlaySetupFlowWithUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchAirPlaySetupFlowWithUserInfo:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainContentGuide");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkName");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openCommunicationChannelToDestination_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openCommunicationChannelToDestination:options:completionHandler:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_performBrokerAuthenticationForBrokerGroup_withBrokerAuth_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBrokerAuthenticationForBrokerGroup:withBrokerAuth:completion:");
}

id objc_msgSend_performScanWithParameters_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanWithParameters:reply:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_pickRouteWithRouteID_authString_useRemoteControl_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickRouteWithRouteID:authString:useRemoteControl:completion:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:configuration:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_proxCardNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardNavigationController");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_receiverToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiverToken");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_routeToReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeToReceiver");
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithConfiguration:");
}

id objc_msgSend_scaleUpEffect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaleUpEffect");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semaphore");
}

id objc_msgSend_serviceTokenForServiceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTokenForServiceIdentifier:");
}

id objc_msgSend_setAirPlayAlertController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirPlayAlertController:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsBanners:");
}

id objc_msgSend_setAllowsControlCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsControlCenter:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setAvOutpuDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvOutpuDeviceIdentifier:");
}

id objc_msgSend_setBottomTrayTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomTrayTitle:");
}

id objc_msgSend_setBrokerToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrokerToken:");
}

id objc_msgSend_setCaptivePortalAuthToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptivePortalAuthToken:");
}

id objc_msgSend_setCompletedProxCardController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedProxCardController:");
}

id objc_msgSend_setConnectingProxCardController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectingProxCardController:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscoveryMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryMode:");
}

id objc_msgSend_setDismissalType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalType:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setIncludeHiddenNetworks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeHiddenNetworks:");
}

id objc_msgSend_setIsNetworkHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsNetworkHidden:");
}

id objc_msgSend_setMaximumCacheAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumCacheAge:");
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMergeScanResults:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setNumberOfScans_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfScans:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setProxCardNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxCardNavigationController:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setReceiverToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceiverToken:");
}

id objc_msgSend_setRememberUponSuccessfulAssociation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRememberUponSuccessfulAssociation:");
}

id objc_msgSend_setResetAllBrokerDiscoveredCandidates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResetAllBrokerDiscoveredCandidates:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setRouteToReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouteToReceiver:");
}

id objc_msgSend_setSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSSID:");
}

id objc_msgSend_setScanResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanResult:");
}

id objc_msgSend_setSetupProxCardController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupProxCardController:");
}

id objc_msgSend_setShouldAnimate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldAnimate:");
}

id objc_msgSend_setShouldSkipInvalidateOnProxCardFlowDidDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSkipInvalidateOnProxCardFlowDidDismiss:");
}

id objc_msgSend_setSpotOnLocationWithParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpotOnLocationWithParameters:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setWifiPassphrase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiPassphrase:");
}

id objc_msgSend_setWifiSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiSSID:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPayloadFromAirPlayURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPayloadFromAirPlayURL:");
}

id objc_msgSend_setupProxCardController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupProxCardController");
}

id objc_msgSend_sharedAudioPresentationOutputContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAudioPresentationOutputContext");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldAnimate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAnimate");
}

id objc_msgSend_shouldSkipInvalidateOnProxCardFlowDidDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSkipInvalidateOnProxCardFlowDidDismiss");
}

id objc_msgSend_shouldUpdateNetworkProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUpdateNetworkProfile");
}

id objc_msgSend_showActivityIndicatorWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showActivityIndicatorWithStatus:");
}

id objc_msgSend_startIntelligentRoutingLocationSensing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startIntelligentRoutingLocationSensing");
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringEventType:error:");
}

id objc_msgSend_startMonitoringWiFiInterfaceChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWiFiInterfaceChange");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stopMonitoringEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringEventType:");
}

id objc_msgSend_stopMonitoringWiFiInterfaceChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringWiFiInterfaceChange");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_tagAirPlayNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tagAirPlayNetwork");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateKnownNetworkProfile_properties_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKnownNetworkProfile:properties:error:");
}

id objc_msgSend_updateNodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateNodes:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_wifiPassphrase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiPassphrase");
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiSSID");
}

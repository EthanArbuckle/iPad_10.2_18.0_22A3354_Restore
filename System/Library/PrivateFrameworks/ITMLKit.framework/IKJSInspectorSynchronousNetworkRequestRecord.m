@implementation IKJSInspectorSynchronousNetworkRequestRecord

void __82___IKJSInspectorSynchronousNetworkRequestRecord_willSendRequest_redirectResponse___block_invoke(double *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v4 = *((_QWORD *)a1 + 4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DD9670], "ik_responseFromURLResponse:forRequest:", v4, *((_QWORD *)a1 + 5));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v18 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", *((_QWORD *)a1 + 13));
  objc_msgSend(v3, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *((_QWORD *)a1 + 7);
  v9 = *((_QWORD *)a1 + 8);
  v10 = *((_QWORD *)a1 + 9);
  v11 = *((_QWORD *)a1 + 10);
  v12 = a1[14];
  v13 = a1[15];
  v14 = *((_QWORD *)a1 + 11);
  v15 = *((_QWORD *)a1 + 12);
  if (v5)
  {
    v17 = v5;
    objc_msgSend(v6, "safe_requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:", v8, v9, v10, v11, v14, v15, v12, v13, &v17, &v18, 0);
    v16 = v17;

  }
  else
  {
    objc_msgSend(v6, "safe_requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:", v8, v9, v10, v11, v14, v15, v12, v13, 0, &v18, 0);
  }

}

void __79___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveResponse_timingData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "dispatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safe_responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:", v4, v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

void __64___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "dispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safe_dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), 0, *(double *)(a1 + 40));

}

void __66___IKJSInspectorSynchronousNetworkRequestRecord_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "dispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safe_loadingFailedWithRequestId:timestamp:errorText:canceled:", v4, v5, 0, v3);

}

void __84___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingWithResponseBody___block_invoke(double *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0DD9658];
  v4 = *((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *((_QWORD *)a1 + 6);
  v7 = *((_QWORD *)a1 + 7);
  v8 = a2;
  objc_msgSend(v3, "ik_networkMetricsFromURLRequest:response:responseBody:timingData:", v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *((_QWORD *)a1 + 8);
  v12 = a1[9];
  v14 = v9;
  objc_msgSend(v10, "safe_loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:", v11, 0, &v14, v12);
  v13 = v14;

}

uint64_t __103___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_mimeType_withResponseBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

void __99___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_withResponseBodyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
      objc_msgSend(WeakRetained, "_didCompleteLoadingFromCache:mimeType:withResponseBody:timestamp:", *(_QWORD *)(a1 + 40), v7, v11, *(double *)(a1 + 48));
    else
      objc_msgSend(WeakRetained, "didFailWithError:", v8);
  }

}

void __114___IKJSInspectorSynchronousNetworkRequestRecord__didCompleteLoadingFromCache_mimeType_withResponseBody_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safe_responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:", v5, v6, v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(v3, "dispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safe_dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), 0, *(double *)(a1 + 48));

  objc_msgSend(v3, "dispatcher");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safe_loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:", *(_QWORD *)(a1 + 32), 0, 0, *(double *)(a1 + 48));
}

void __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DD9670], "ik_responseFromURLResponse:forRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSource:", 2);
      if (v8)
        objc_msgSend(v12, "setMimeType:", v8);
      objc_msgSend(MEMORY[0x1E0DD9640], "safe_initWithUrl:type:bodySize:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), (double)(unint64_t)objc_msgSend(v7, "length"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setResponse:", v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke_2;
      v15[3] = &unk_1E9F4D8A8;
      v16 = *(id *)(a1 + 56);
      v17 = *(id *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 88);
      v18 = *(id *)(a1 + 64);
      v19 = v13;
      v14 = v13;
      objc_msgSend(v11, "_dispatchEvent:block:", 5, v15);

    }
    else
    {
      objc_msgSend(WeakRetained, "didFailWithError:", v9);
    }
  }

}

void __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "dispatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safe_requestServedFromMemoryCacheWithRequestId:frameId:loaderId:documentURL:timestamp:initiator:resource:", v4, v5, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
}

@end

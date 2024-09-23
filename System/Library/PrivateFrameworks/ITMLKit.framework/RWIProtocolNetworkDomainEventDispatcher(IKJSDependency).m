@implementation RWIProtocolNetworkDomainEventDispatcher(IKJSDependency)

- (void)safe_loadingFinishedWithRequestId:()IKJSDependency timestamp:sourceMapURL:metrics:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v10 = a6;
  v11 = a5;
  v13 = a4;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("loadingFinishedWithRequestId:timestamp:sourceMapURL:metrics:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "retainArguments");
  objc_msgSend(v9, "invokeWithTarget:", a1);

}

- (void)safe_webSocketFrameErrorWithRequestId:()IKJSDependency timestamp:errorMessage:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v12 = a2;
  v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketFrameErrorWithRequestId:timestamp:errorMessage:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invokeWithTarget:", a1);

}

- (void)safe_webSocketFrameSentWithRequestId:()IKJSDependency timestamp:response:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v12 = a2;
  v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketFrameSentWithRequestId:timestamp:response:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invokeWithTarget:", a1);

}

- (void)safe_webSocketWillSendHandshakeRequestWithRequestId:()IKJSDependency timestamp:walltime:request:
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v14 = a3;
  v15 = a2;
  v13 = a6;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketWillSendHandshakeRequestWithRequestId:timestamp:walltime:request:"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "retainArguments");
  objc_msgSend(v12, "invokeWithTarget:", a1);

}

- (void)safe_webSocketHandshakeResponseReceivedWithRequestId:()IKJSDependency timestamp:response:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v12 = a2;
  v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketHandshakeResponseReceivedWithRequestId:timestamp:response:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invokeWithTarget:", a1);

}

- (void)safe_requestWillBeSentWithRequestId:()IKJSDependency frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:
{
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[12];

  v32[11] = *MEMORY[0x1E0C80C00];
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v27 = a9;
  v25 = a3;
  v26 = a2;
  v24 = a10;
  v32[0] = &v31;
  v32[1] = &v30;
  v32[2] = &v29;
  v32[3] = &v28;
  v32[4] = &v27;
  v32[5] = &v26;
  v32[6] = &v25;
  v32[7] = &v24;
  v32[8] = &a11;
  v32[9] = &a12;
  v32[10] = &a13;
  v21 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("requestWillBeSentWithRequestId:frameId:loaderId:documentURL:request:timestamp:walltime:initiator:redirectResponse:type:targetId:"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "retainArguments");
  objc_msgSend(v23, "invokeWithTarget:", a1);

}

- (void)safe_webSocketCreatedWithRequestId:()IKJSDependency url:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketCreatedWithRequestId:url:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

- (void)safe_responseReceivedWithRequestId:()IKJSDependency frameId:loaderId:timestamp:type:response:
{
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v19 = a2;
  v18 = a7;
  v17 = a8;
  v23[0] = &v22;
  v23[1] = &v21;
  v23[2] = &v20;
  v23[3] = &v19;
  v23[4] = &v18;
  v23[5] = &v17;
  v14 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("responseReceivedWithRequestId:frameId:loaderId:timestamp:type:response:"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "retainArguments");
  objc_msgSend(v16, "invokeWithTarget:", a1);

}

- (void)safe_webSocketClosedWithRequestId:()IKJSDependency timestamp:
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketClosedWithRequestId:timestamp:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_requestServedFromMemoryCacheWithRequestId:()IKJSDependency frameId:loaderId:documentURL:timestamp:initiator:resource:
{
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v21 = a2;
  v20 = a8;
  v19 = a9;
  v26[0] = &v25;
  v26[1] = &v24;
  v26[2] = &v23;
  v26[3] = &v22;
  v26[4] = &v21;
  v26[5] = &v20;
  v26[6] = &v19;
  v16 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("requestServedFromMemoryCacheWithRequestId:frameId:loaderId:documentURL:timestamp:initiator:resource:"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "retainArguments");
  objc_msgSend(v18, "invokeWithTarget:", a1);

}

- (void)safe_responseInterceptedWithRequestId:()IKJSDependency response:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("responseInterceptedWithRequestId:response:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

- (void)safe_loadingFailedWithRequestId:()IKJSDependency timestamp:errorText:canceled:
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  double v15;
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v15 = a2;
  v13 = a6;
  v14 = a5;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("loadingFailedWithRequestId:timestamp:errorText:canceled:"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "retainArguments");
  objc_msgSend(v12, "invokeWithTarget:", a1);

}

- (void)safe_dataReceivedWithRequestId:()IKJSDependency timestamp:dataLength:encodedDataLength:
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  double v12;
  id v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v10 = a6;
  v11 = a5;
  v13 = a4;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("dataReceivedWithRequestId:timestamp:dataLength:encodedDataLength:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "retainArguments");
  objc_msgSend(v9, "invokeWithTarget:", a1);

}

- (void)safe_webSocketFrameReceivedWithRequestId:()IKJSDependency timestamp:response:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v12 = a2;
  v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("webSocketFrameReceivedWithRequestId:timestamp:response:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invokeWithTarget:", a1);

}

- (void)safe_requestInterceptedWithRequestId:()IKJSDependency request:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("requestInterceptedWithRequestId:request:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

@end

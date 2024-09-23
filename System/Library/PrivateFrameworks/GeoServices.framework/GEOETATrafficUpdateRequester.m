@implementation GEOETATrafficUpdateRequester

- (void)sendETATrafficUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 finishedHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_mapsAbClientMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientDatasetMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAbClientMetadata:", v15);

  +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke;
  v21[3] = &unk_1E1C0C8A8;
  v22 = v9;
  v19[0] = v17;
  v19[1] = 3221225472;
  v19[2] = __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke_2;
  v19[3] = &unk_1E1C03638;
  v20 = v22;
  v18 = v22;
  objc_msgSend(v16, "startRequest:connectionProperties:auditToken:throttleToken:callbackQueue:willSendRequest:finished:networkActivity:error:", v12, 0, v11, v10, MEMORY[0x1E0C80D38], 0, v21, 0, v19);

}

uint64_t __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)sendConditionalETATrafficUpdateRequest:(id)a3 timeWindowDuration:(double)a4 auditToken:(id)a5 throttleToken:(id)a6 willSendRequestHandler:(id)a7 finishedHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  GEODataConditionalConnectionProperties *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[GEODataConditionalConnectionProperties initWithWorkload:timeWindowDuration:]([GEODataConditionalConnectionProperties alloc], "initWithWorkload:timeWindowDuration:", 1000, a4);
  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_mapsAbClientMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clientDatasetMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAbClientMetadata:", v22);

  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke;
  v31[3] = &unk_1E1C0C8D0;
  v32 = v13;
  v33 = v14;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_2;
  v29[3] = &unk_1E1C0C8A8;
  v30 = v15;
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_3;
  v27[3] = &unk_1E1C03638;
  v28 = v30;
  v24 = v30;
  v25 = v13;
  v26 = v14;
  objc_msgSend(v18, "startRequest:connectionProperties:auditToken:throttleToken:callbackQueue:willSendRequest:finished:networkActivity:error:", v25, v19, v17, v16, MEMORY[0x1E0C80D38], v31, v29, 0, v27);

}

void __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  void (**v5)(id, _QWORD);

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
LABEL_5:
    v3 = v5;
    goto LABEL_6;
  }
  if (v3)
  {
    v5 = v3;
    v3[2](v3, *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)cancelRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

}

@end

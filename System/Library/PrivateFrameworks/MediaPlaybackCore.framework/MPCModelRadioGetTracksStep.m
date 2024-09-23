@implementation MPCModelRadioGetTracksStep

- (MPCModelRadioGetTracksStep)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4
{
  id v6;
  NSObject *v7;
  MPCModelRadioGetTracksStep *v8;
  uint64_t v9;
  ICRadioGetTracksRequest *request;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  os_log_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  _BOOL4 v25;
  objc_class *v26;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MPCModelRadioGetTracksStep;
  v8 = -[MPCModelRadioGetTracksStep init](&v29, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (ICRadioGetTracksRequest *)v9;

    if (-[NSObject length](v7, "length"))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v7, 0);
      if (!objc_msgSend(v11, "length"))
      {
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "[MPCModelRadioGetTracksStep] Failed to convert Siri Asset Info into UTF-8 data.", buf, 2u);
        }
        goto LABEL_22;
      }
      v28 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v28;
      if (_NSIsNSDictionary())
      {
        v14 = objc_alloc(MEMORY[0x24BEC8948]);
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 10800.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (os_log_t)objc_msgSend(v14, "initWithResponseDictionary:expirationDate:", v12, v15);

        -[NSObject stationMetadata](v16, "stationMetadata");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[NSObject tracks](v16, "tracks");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            objc_storeStrong((id *)&v8->_siriAssetInfoGetTracksResponse, v16);
            v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v22 = "[MPCModelRadioGetTracksStep] Using Siri Asset Info as side-packed getTracks response.";
              v23 = v21;
              v24 = 2;
LABEL_19:
              _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
            }
LABEL_20:

            goto LABEL_21;
          }
        }
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_DWORD *)buf = 138543362;
        v31 = v7;
        v22 = "[MPCModelRadioGetTracksStep] Siri Asset Info provided with invalid content: %{public}@";
        v23 = v21;
      }
      else
      {
        v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v25 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (v13)
        {
          if (v25)
          {
            *(_DWORD *)buf = 138543362;
            v31 = v13;
            _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[MPCModelRadioGetTracksStep] Siri Asset Info failed to deserialize with error: %{public}@.", buf, 0xCu);
          }
          goto LABEL_21;
        }
        if (!v25)
        {
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v21;
        v22 = "[MPCModelRadioGetTracksStep] Siri Asset Info expected to be a dictionary, but is %{public}@ instead.";
        v23 = v16;
      }
      v24 = 12;
      goto LABEL_19;
    }
  }
LABEL_23:

  return v8;
}

- (MPCModelRadioGetTracksStep)initWithPreviousStep:(id)a3
{
  id *v4;
  MPCModelRadioGetTracksStep *v5;
  MPCModelRadioGetTracksStep *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelRadioGetTracksStep;
  v5 = -[MPCModelRadioGetTracksStep init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_delegatedIdentityProperties, v4[4]);
    objc_storeStrong((id *)&v6->_identityProperties, v4[3]);
    objc_storeStrong((id *)&v6->_request, v4[5]);
    objc_storeStrong((id *)&v6->_siriAssetInfoGetTracksResponse, v4[7]);
  }

  return v6;
}

- (id)nextStepWithError:(id)a3
{
  id v4;
  MPCModelRadioGetTracksStep *v5;
  uint64_t v6;
  NSError *error;

  v4 = a3;
  v5 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksStep alloc], "initWithPreviousStep:", self);
  v6 = objc_msgSend(v4, "copy");

  error = v5->_error;
  v5->_error = (NSError *)v6;

  v5->_finished = 1;
  return v5;
}

- (void)performWithCompletionHandler:(id)a3
{
  (*((void (**)(id, MPCModelRadioGetTracksStep *))a3 + 2))(a3, self);
}

- (void)_fireAndForgetServerDialog:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__MPCModelRadioGetTracksStep__fireAndForgetServerDialog___block_invoke;
  v3[3] = &unk_24CAB9500;
  v3[4] = self;
  -[MPCModelRadioGetTracksStep _presentServerDialog:completionHandler:](self, "_presentServerDialog:completionHandler:", a3, v3);
}

- (void)_performDefaultHandlingForButtonAction:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BEC89C8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  -[ICRadioGetTracksRequest requestContext](self->_request, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleButtonAction:usingRequestContext:withCompletionHandler:", v5, v6, &__block_literal_global_27000);

}

- (void)_presentServerDialog:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A68]), "initWithStoreDialog:", v5);
  objc_msgSend(v7, "setAllowInCar:", 1);
  v8 = objc_msgSend(v7, "createCFUserNotification");
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65CB8]), "initWithCFUserNotification:", v8);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke;
    v13[3] = &unk_24CAB9590;
    v14 = v5;
    v15 = v6;
    objc_msgSend(v10, "presentWithCompletion:", v13);
    CFRelease(v9);

  }
  else
  {
    ICUserNotificationGetResponseButton();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v12);

  }
}

- (ICUserIdentityProperties)delegatedIdentityProperties
{
  return self->_delegatedIdentityProperties;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (ICRadioGetTracksRequest)request
{
  return self->_request;
}

- (ICRadioGetTracksResponse)response
{
  return self->_response;
}

- (ICRadioGetTracksResponse)siriAssetInfoGetTracksResponse
{
  return self->_siriAssetInfoGetTracksResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriAssetInfoGetTracksResponse, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_delegatedIdentityProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke_2;
  v9[3] = &unk_24CAB9568;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "msv_firstWhere:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

uint64_t __69__MPCModelRadioGetTracksStep__presentServerDialog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "buttonIdentifier");
  if (v4 <= 2)
  {
    a1 = qword_210ED9420[v4];
    LOBYTE(a1) = objc_msgSend(v3, "type") == a1;
  }

  return a1 & 1;
}

uint64_t __57__MPCModelRadioGetTracksStep__fireAndForgetServerDialog___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_performDefaultHandlingForButtonAction:", a2);
  return result;
}

@end

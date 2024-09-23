@implementation MPCModelRadioGetTracksRequestStep

- (id)nextStepWithResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MPCModelRadioGetTracksRetryDialogStep *v13;
  id *p_response;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(v7, "dialog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = v9;
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      objc_msgSend(v11, "buttons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __MPCModelRadioGetTracksDialogIsRetryDialog_block_invoke;
      v16[3] = &unk_24CAB96A8;
      v16[4] = &v17;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

      LODWORD(v12) = *((unsigned __int8 *)v18 + 24);
      _Block_object_dispose(&v17, 8);

      if ((_DWORD)v12)
      {
        v13 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksRetryDialogStep alloc], "initWithPreviousStep:", self);
        objc_storeStrong((id *)&v13->super._error, v10);
        p_response = (id *)&v13->super._response;
        goto LABEL_10;
      }
      -[MPCModelRadioGetTracksStep _fireAndForgetServerDialog:](self, "_fireAndForgetServerDialog:", v11);
    }
    if (v10)
    {
      -[MPCModelRadioGetTracksStep nextStepWithError:](self, "nextStepWithError:", v10);
      v13 = (MPCModelRadioGetTracksRetryDialogStep *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      goto LABEL_12;
    }
    v13 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksStep alloc], "initWithPreviousStep:", self);
    v13->super._finished = 1;
    p_response = (id *)&v13->super._response;
LABEL_10:
    objc_storeStrong(p_response, a3);
    goto LABEL_11;
  }
  -[MPCModelRadioGetTracksStep nextStepWithError:](self, "nextStepWithError:", v8);
  v13 = (MPCModelRadioGetTracksRetryDialogStep *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  ICRadioGetTracksResponse *siriAssetInfoGetTracksResponse;
  void *v7;
  ICRadioGetTracksRequest *request;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  siriAssetInfoGetTracksResponse = self->super._siriAssetInfoGetTracksResponse;
  if (siriAssetInfoGetTracksResponse)
  {
    -[MPCModelRadioGetTracksRequestStep nextStepWithResponse:error:](self, "nextStepWithResponse:error:", siriAssetInfoGetTracksResponse, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
  else
  {
    request = self->super._request;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__MPCModelRadioGetTracksRequestStep_performWithCompletionHandler___block_invoke;
    v9[3] = &unk_24CAB9658;
    v9[4] = self;
    v10 = v4;
    -[ICRadioGetTracksRequest performWithResponseHandler:](request, "performWithResponseHandler:", v9);

  }
}

void __66__MPCModelRadioGetTracksRequestStep_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "nextStepWithResponse:error:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

@end

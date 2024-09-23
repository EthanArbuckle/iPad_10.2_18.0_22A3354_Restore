@implementation MPCModelRadioGetTracksRetryDialogStep

- (id)nextStepByPerformingButtonAction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  MPCModelRadioGetTracksRequestStep *v10;
  ICRadioGetTracksRequest *request;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("getTracks"));

  if (v6)
  {
    objc_msgSend(v4, "actionDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("additionalData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_NSIsNSDictionary() & 1) != 0)
    {
      v9 = (void *)-[ICRadioGetTracksRequest copy](self->super._request, "copy");
      objc_msgSend(v9, "setAdditionalRequestParameters:", v8);

      if (v9)
      {
        v10 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksRequestStep alloc], "initWithPreviousStep:", self);
        request = v10->super._request;
        v10->super._request = (ICRadioGetTracksRequest *)v9;
        v12 = v9;

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  if (v4)
    -[MPCModelRadioGetTracksStep _performDefaultHandlingForButtonAction:](self, "_performDefaultHandlingForButtonAction:", v4);
  -[MPCModelRadioGetTracksStep nextStepWithError:](self, "nextStepWithError:", self->super._error);
  v10 = (MPCModelRadioGetTracksRequestStep *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v10;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICRadioGetTracksResponse dialog](self->super._response, "dialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__MPCModelRadioGetTracksRetryDialogStep_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CAB9680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPCModelRadioGetTracksStep _presentServerDialog:completionHandler:](self, "_presentServerDialog:completionHandler:", v5, v7);

}

void __70__MPCModelRadioGetTracksRetryDialogStep_performWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "nextStepByPerformingButtonAction:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end

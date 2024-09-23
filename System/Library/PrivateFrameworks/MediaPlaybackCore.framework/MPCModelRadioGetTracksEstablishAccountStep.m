@implementation MPCModelRadioGetTracksEstablishAccountStep

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  MPCModelRadioGetTracksPrepareIdentityStep *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[ICRadioGetTracksRequest requestContext](self->super._request, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "getVerificationContextForUserIdentity:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v8)
  {
    objc_msgSend(v8, "setInteractionLevel:", 4);
    v10 = (MPCModelRadioGetTracksPrepareIdentityStep *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A70]), "initWithVerificationContext:", v8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __75__MPCModelRadioGetTracksEstablishAccountStep_performWithCompletionHandler___block_invoke;
    v11[3] = &unk_24CAB95B8;
    v11[4] = self;
    v12 = v4;
    -[MPCModelRadioGetTracksPrepareIdentityStep performWithResponseHandler:](v10, "performWithResponseHandler:", v11);

  }
  else
  {
    v10 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksPrepareIdentityStep alloc], "initWithPreviousStep:", self);
    (*((void (**)(id, MPCModelRadioGetTracksPrepareIdentityStep *))v4 + 2))(v4, v10);
  }

}

void __75__MPCModelRadioGetTracksEstablishAccountStep_performWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  MPCModelRadioGetTracksPrepareIdentityStep *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  MPCModelRadioGetTracksPrepareIdentityStep *v7;

  if ((a2 & 1) != 0)
  {
    v3 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksPrepareIdentityStep alloc], "initWithPreviousStep:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void (**)(uint64_t))(v4 + 16);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "nextStepWithError:");
    v3 = (MPCModelRadioGetTracksPrepareIdentityStep *)objc_claimAutoreleasedReturnValue();
    v5 = *(void (**)(uint64_t))(v6 + 16);
    v4 = v6;
  }
  v7 = v3;
  v5(v4);

}

@end

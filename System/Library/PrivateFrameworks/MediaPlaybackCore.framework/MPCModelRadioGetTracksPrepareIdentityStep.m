@implementation MPCModelRadioGetTracksPrepareIdentityStep

- (id)nextStepWithIdentityProperties:(id)a3 delegatedIdentityProperties:(id)a4
{
  id v6;
  id v7;
  MPCModelRadioGetTracksRequestStep *v8;
  uint64_t v9;
  ICUserIdentityProperties *delegatedIdentityProperties;
  uint64_t v11;
  ICUserIdentityProperties *identityProperties;

  v6 = a4;
  v7 = a3;
  v8 = -[MPCModelRadioGetTracksStep initWithPreviousStep:]([MPCModelRadioGetTracksRequestStep alloc], "initWithPreviousStep:", self);
  v9 = objc_msgSend(v6, "copy");

  delegatedIdentityProperties = v8->super._delegatedIdentityProperties;
  v8->super._delegatedIdentityProperties = (ICUserIdentityProperties *)v9;

  v11 = objc_msgSend(v7, "copy");
  identityProperties = v8->super._identityProperties;
  v8->super._identityProperties = (ICUserIdentityProperties *)v11;

  return v8;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[10];
  _QWORD v20[10];
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__27020;
  v27[4] = __Block_byref_object_dispose__27021;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__27020;
  v25[4] = __Block_byref_object_dispose__27021;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__27020;
  v23[4] = __Block_byref_object_dispose__27021;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 1;
  v5 = dispatch_group_create();
  v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioGetTracksPrepareIdentityStep", 0);
  -[ICRadioGetTracksRequest requestContext](self->super._request, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);
  objc_msgSend(v7, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke;
  v20[3] = &unk_24CAB9608;
  v20[4] = v5;
  v20[5] = v6;
  v20[6] = v7;
  v20[7] = v23;
  v20[8] = v25;
  v20[9] = v21;
  objc_msgSend(v8, "getPropertiesForUserIdentity:completionHandler:", v9, v20);

  objc_msgSend(v7, "delegatedIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    dispatch_group_enter(v5);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_24CAB9608;
    v19[4] = v5;
    v19[5] = v6;
    v19[6] = v7;
    v19[7] = v27;
    v19[8] = v25;
    v19[9] = v21;
    objc_msgSend(v8, "getPropertiesForUserIdentity:completionHandler:", v11, v19);
  }
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_5;
  v13[3] = &unk_24CAB9630;
  v13[4] = self;
  v14 = v4;
  v15 = v21;
  v16 = v25;
  v17 = v23;
  v18 = v27;
  v12 = v4;
  dispatch_group_notify(v5, v6, v13);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __int128 v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_24CAB95E0;
  v13 = v5;
  v14 = v6;
  v9 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 48);
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_group_async(v7, v8, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __int128 v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_24CAB95E0;
  v13 = v5;
  v14 = v6;
  v9 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 48);
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_group_async(v7, v8, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  v2 = a1[5];
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v4 = (void *)a1[4];
  if (v3)
    objc_msgSend(v4, "nextStepWithIdentityProperties:delegatedIdentityProperties:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40));
  else
    objc_msgSend(v4, "nextStepWithError:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isDelegated");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;

  }
  else if (!v3)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDD1398]);
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unable to get radio tracks [invalid delegate user identity] - userIdentity=%@ - properties%@"), v8, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0BA0]);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7400, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = v2;
    v5 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v4;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDD1398]);
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Unable to get radio tracks [invalid user identity] - userIdentity=%@ - properties%@"), v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0BA0]);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7400, v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v5 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

@end

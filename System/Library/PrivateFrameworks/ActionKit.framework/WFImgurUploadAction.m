@implementation WFImgurUploadAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (WFImgurUploadAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  WFImgurUploadAction *v5;
  void *v6;
  void *v7;
  WFImgurUploadAction *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFImgurUploadAction;
  v5 = -[WFImgurUploadAction initWithIdentifier:definition:serializedParameters:](&v10, sel_initWithIdentifier_definition_serializedParameters_, a3, a4, a5);
  if (v5)
  {
    -[WFImgurUploadAction unevaluatedResourceObjectsOfClass:](v5, "unevaluatedResourceObjectsOfClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAction:", v5);
    v8 = v5;

  }
  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  -[WFImgurUploadAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceObjectsOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurAnonymous"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v9)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (v12)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__WFImgurUploadAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8B61E0;
    v13[4] = self;
    v14 = v4;
    v15 = v9;
    objc_msgSend(v15, "refreshWithCompletionHandler:", v13);

  }
  else
  {
    -[WFImgurUploadAction uploadInput:withAccount:](self, "uploadInput:withAccount:", v4, 0);
  }

}

- (void)uploadInput:(id)a3 withAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFImgurSessionManager *v16;
  void *v17;
  WFImgurSessionManager *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  WFImgurSessionManager *v25;
  char v26;
  id v27;
  _QWORD v28[5];
  WFImgurSessionManager *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;
  char v35;

  v6 = a4;
  v27 = a3;
  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurDirectLink"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v7, "BOOLValue");

  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurAlbum"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurTitle"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurDescription"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurAlbumLayout"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFImgurUploadAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImgurAlbumPrivacy"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [WFImgurSessionManager alloc];
  +[WFImgurAccount clientID](WFImgurAccount, "clientID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFImgurSessionManager initWithClientID:](v16, "initWithClientID:", v17);

  objc_msgSend(v6, "credential");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFImgurSessionManager setCredential:](v18, "setCredential:", v19);
  v20 = objc_opt_class();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke;
  v28[3] = &unk_24F8B1728;
  v28[4] = self;
  v29 = v18;
  v34 = v9;
  v30 = v10;
  v31 = v11;
  v35 = v26;
  v32 = v13;
  v33 = v15;
  v21 = v15;
  v22 = v13;
  v23 = v11;
  v24 = v10;
  v25 = v18;
  objc_msgSend(v27, "generateCollectionByCoercingToItemClass:completionHandler:", v20, v28);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "imgurLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to upload %2$@ to Imgur?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to upload image(s) to Imgur?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_2;
  v5[3] = &unk_24F8B1700;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v11 = *(_BYTE *)(a1 + 80);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 81);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(a2, "getFileRepresentations:forType:", v5, 0);

}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  char v23;
  char v24;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompletedUnitCount:", 0);

    v5 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTotalUnitCount:", v5);

  }
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_3;
  v19[3] = &unk_24F8B1688;
  v8 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v8;
  v23 = *(_BYTE *)(a1 + 80);
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v24 = *(_BYTE *)(a1 + 81);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_5;
  v11[3] = &unk_24F8B16D8;
  v18 = *(_BYTE *)(a1 + 80);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  objc_msgSend(v3, "if_mapAsynchronously:completionHandler:", v19, v11);

}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  __int16 v18;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "becomeCurrentWithPendingUnitCount:", 1);

  v10 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 64))
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
  }
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_4;
  v16[3] = &unk_24F8B1660;
  v18 = *(_WORD *)(a1 + 64);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v14 = v6;
  objc_msgSend(v10, "uploadImage:title:description:progress:completionHandler:", v8, v11, v12, v13, v16);

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resignCurrent");

}

uint64_t __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  if (!*(_BYTE *)(a1 + 80))
    return objc_msgSend(*(id *)(a1 + 72), "finishRunningWithError:");
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_6;
  v8[3] = &unk_24F8B16B0;
  v6 = *(_QWORD *)(a1 + 64);
  v8[4] = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v3, "createAlbumWithIDs:title:description:layout:privacy:completionHandler:", a2, v2, v4, v5, v6, v8);
}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if (a3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a3;
    objc_msgSend(v6, "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);

}

void __47__WFImgurUploadAction_uploadInput_withAccount___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14 && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(v10, "addObject:", v14);
    }
    else
    {
      objc_msgSend(v14, "URLByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__WFImgurUploadAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if (!+[WFAccount numberOfAccounts](WFImgurAccount, "numberOfAccounts"))
    {
      v5 = *MEMORY[0x24BDD0FC8];
      v8[0] = *MEMORY[0x24BDD0FD8];
      v8[1] = v5;
      v9[0] = CFSTR("Upload Failed");
      v9[1] = CFSTR("Please sign in to your Imgur account.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), -1, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uploadInput:withAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

@end

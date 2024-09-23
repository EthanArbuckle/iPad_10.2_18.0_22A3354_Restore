@implementation BridgedCampaignClickRecorder

- (id)recordCampaignClickWithReportUrl:(id)a3 campaignUrl:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BridgedCampaignClickRecorder *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke;
  v13[3] = &unk_1E7211D98;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithResolver:", v13);

  return v11;
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[6];

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CFDC80]);
    objc_msgSend(MEMORY[0x1E0D58928], "sharedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeiTunesAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccount:", v10);

    objc_msgSend(v8, "setUrlKnownToBeTrusted:", 1);
    objc_msgSend(v8, "requestWithMethod:URL:parameters:", 4, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_3;
    v14[3] = &unk_1E7211D70;
    v17 = v6;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = v12;
    v16 = v13;
    v18 = v5;
    objc_msgSend(v11, "addFinishBlock:", v14);

  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2;
    v19[3] = &unk_1E7211D20;
    v19[4] = *(_QWORD *)(a1 + 40);
    v19[5] = v6;
    __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2((uint64_t)v19);
  }

}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "campaignClickErrorWithDescription:", CFSTR("Malformed campaign click reporting url"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  __int128 v17;

  v5 = a2;
  if (a3)
  {
    v6 = (void (**)(id, _QWORD))*(id *)(a1 + 48);
    v6[2](v6, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void (**)(id, _QWORD))objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v6, "removeCharactersInString:", CFSTR("?=&+"));
    objc_msgSend(*(id *)(a1 + 32), "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("url=%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHTTPBody:", v10);

      objc_msgSend(MEMORY[0x1E0CFDCA0], "defaultSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataTaskPromiseWithRequest:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_6;
      v13[3] = &unk_1E7211D48;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v12, "addFinishBlock:", v13);

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5;
      v16[3] = &unk_1E7211D20;
      v17 = *(_OWORD *)(a1 + 40);
      __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5((uint64_t)v16);
    }

  }
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "campaignClickErrorWithDescription:", CFSTR("Encoding failure to encode campaign url"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)campaignClickErrorWithDescription:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = BridgedCampaignClickErrorCode;
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.campaignclick"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

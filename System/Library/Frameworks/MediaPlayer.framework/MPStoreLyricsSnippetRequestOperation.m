@implementation MPStoreLyricsSnippetRequestOperation

- (void)execute
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[MPStoreLyricsSnippetRequestOperation snippetURL](self, "snippetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithIdentity:", v5);

    objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke;
    v9[3] = &unk_1E31638C0;
    v9[4] = self;
    objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsSnippetRequestErrorDomain"), -3001, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[MPStoreLyricsSnippetRequestOperation finishWithError:](self, "finishWithError:", v8);

  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsSnippetRequestOperation;
  -[MPAsyncOperation finishWithError:](&v7, sel_finishWithError_, v4);
  if (v4)
  {
    -[MPStoreLyricsSnippetRequestOperation responseHandler](self, "responseHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MPStoreLyricsSnippetRequestOperation responseHandler](self, "responseHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

    }
  }

}

- (MPStoreLyricsSnippetURLComponents)snippetURL
{
  return self->_snippetURL;
}

- (void)setSnippetURL:(id)a3
{
  objc_storeStrong((id *)&self->_snippetURL, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_snippetURL, 0);
}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ic_stringValueForKey:", CFSTR("default"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setScheme:", CFSTR("https"));
      objc_msgSend(v6, "setHost:", v5);
      v43 = v4;
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "countryCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("/v1/lyrics/%@/snippet/songs/%lld"), v9, objc_msgSend(v10, "songAdamID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPath:", v11);

      v42 = v5;
      v12 = (void *)MEMORY[0x1E0CB39D8];
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "startTime");
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%.03f"), v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queryItemWithName:value:", CFSTR("ts"), v40);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v39;
      v15 = (void *)MEMORY[0x1E0CB39D8];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "endTime");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%.03f"), v17);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "queryItemWithName:value:", CFSTR("te"), v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v18;
      v19 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "language");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "queryItemWithName:value:", CFSTR("l"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v22;
      v23 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(*(id *)(a1 + 32), "snippetURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "signature");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "queryItemWithName:value:", CFSTR("tk"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQueryItems:", v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFA8]), "initWithBlock:", &__block_literal_global_14993);
      v29 = objc_alloc(MEMORY[0x1E0DDBFB0]);
      v30 = (void *)MEMORY[0x1E0CB39E0];
      objc_msgSend(v6, "URL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "requestWithURL:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v29, "initWithURLRequest:requestContext:", v32, v28);

      objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_3;
      v44[3] = &unk_1E315D630;
      v44[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v34, "enqueueDataRequest:withCompletionHandler:", v33, v44);

      v5 = v42;
      v4 = v43;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsSnippetRequestErrorDomain"), -3002, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v36);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsSnippetRequestErrorDomain"), -3002, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v35);

  }
}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    objc_msgSend(v5, "urlResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parsedBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "statusCode") != 200)
    {
      v15 = *(void **)(a1 + 32);
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v21 = CFSTR("HTTPStatusCodeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "statusCode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsSnippetRequestErrorDomain"), -3003, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishWithError:", v19);

LABEL_11:
      goto LABEL_12;
    }
    if (v8)
    {
      objc_msgSend(v8, "ic_dictionaryValueForKey:", CFSTR("results"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_stringValueForKey:", CFSTR("text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v12, 0);

      v13 = *(void **)(a1 + 32);
      v14 = 0;
    }
    else
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsSnippetRequestErrorDomain"), -3003, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20;
      v14 = v9;
    }
    objc_msgSend(v13, "finishWithError:", v14);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
LABEL_12:

}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  v5 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  objc_msgSend(MEMORY[0x1E0DDBEF8], "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:", v5, CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientInfo:", v3);
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentityStore:", v4);

}

@end

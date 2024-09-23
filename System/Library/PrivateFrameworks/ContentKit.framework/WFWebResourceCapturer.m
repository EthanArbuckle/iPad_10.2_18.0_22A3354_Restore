@implementation WFWebResourceCapturer

- (void)generatePDFForWebResource:(id)a3 includeMargin:(BOOL)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v9 = a6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __99__WFWebResourceCapturer_generatePDFForWebResource_includeMargin_coercionOptions_completionHandler___block_invoke;
  v11[3] = &unk_24C4DF840;
  v12 = v9;
  v13 = a4;
  v10 = v9;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPrintFormatterForWebResource:coercionOptions:completionHandler:", a3, a5, v11);

}

void __99__WFWebResourceCapturer_generatePDFForWebResource_includeMargin_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v8[0] = a2;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFPDFContentItem getPDFFromPrintFormatters:nameIfKnown:matchingInputSize:withMargin:startingAtPage:endingAtPage:completionHandler:](WFPDFContentItem, "getPDFFromPrintFormatters:nameIfKnown:matchingInputSize:withMargin:startingAtPage:endingAtPage:completionHandler:", v7, 0, 1, *(unsigned __int8 *)(a1 + 40), 1, 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a4);
    v7 = 0;
  }

}

+ (void)getPasteboardRepresentationForWebResource:(id)a3 type:(id)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id *v15;
  id *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToType:", v13))
  {

    goto LABEL_5;
  }
  v14 = objc_msgSend(getWKWebViewClass(), "instancesRespondToSelector:", sel__getWebArchiveDataWithCompletionHandler_);

  if (!v14)
  {
LABEL_5:
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_3;
    v27 = &unk_24C4E0850;
    v15 = &v29;
    v16 = &v28;
    v28 = v10;
    v29 = v12;
    v17 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v22 = v10;
    v23 = v12;
    v21 = &v24;
    goto LABEL_6;
  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke;
  v30[3] = &unk_24C4E0850;
  v15 = &v32;
  v16 = &v31;
  v31 = v10;
  v32 = v12;
  v17 = *MEMORY[0x24BDBF148];
  v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v19 = v10;
  v20 = v12;
  v21 = v30;
LABEL_6:
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v9, 0, v11, v21, v17, v18, v24, v25, v26, v27);

}

+ (void)getPrintFormatterForWebResource:(id)a3 coercionOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[3];
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  getWFContentGraphLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "+[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:]";
    _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_INFO, "%s getting print formatter", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", CFSTR("pages"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", CFSTR("key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v12;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", CFSTR("numbers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "file");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wfType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "conformsToTypes:", v14);

    if (v17)
    {
      v29 = v8;
      objc_msgSend(v15, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *MEMORY[0x24BDBCC60];
      v19 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resourceValuesForKeys:error:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
      {
        v33 = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "filename");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        WFCreateArchiveWithFiles(v24, v25, CFSTR("zip"), &v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v32;

        if (!v26)
        {
          (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v27);

          v8 = v29;
          goto LABEL_11;
        }
        +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v26);
        v28 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v28;
      }
      v8 = v29;
    }

  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __91__WFWebResourceCapturer_getPrintFormatterForWebResource_coercionOptions_completionHandler___block_invoke;
  v30[3] = &unk_24C4DF818;
  v31 = v9;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v7, 0, v8, v30, 612.0, 792.0);
  v15 = v31;
LABEL_11:

}

+ (void)getImageRepresentationForWebResource:(id)a3 atSize:(CGSize)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  height = a4.height;
  width = a4.width;
  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke;
  v12[3] = &unk_24C4DF818;
  v13 = v10;
  v11 = v10;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", a3, 0, a5, v12, width, height);

}

void __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke_2;
    v4[3] = &unk_24C4DF868;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    objc_msgSend(v5, "takeSnapshotWithConfiguration:completionHandler:", 0, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = objc_alloc(MEMORY[0x24BEC14E0]);
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screenScale");
    v5 = (void *)objc_msgSend(v3, "initWithPlatformImage:scale:", v8);

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v6 + 16))(v6, v5, v7, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __91__WFWebResourceCapturer_getPrintFormatterForWebResource_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (*v11)(uint64_t, _QWORD, _QWORD, id);
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  if (v5)
  {
    v7 = a3;
    objc_msgSend(v12, "viewPrintFormatter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v12, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v6 + 16))(v6, v9, v10, v7);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16);
    v8 = a3;
    v11(v6, 0, 0, v8);
  }

}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_2;
    v4[3] = &unk_24C4E2D08;
    v7 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v6, "_getWebArchiveDataWithCompletionHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[2];
  void (*v14)(_QWORD *, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v14 = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_4;
    v15 = &unk_24C4DF7F0;
    v8 = *(void **)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    v17 = v5;
    v18 = v6;
    v9 = v17;
    v10 = v8;
    v11 = v13;
    if (objc_msgSend(getWKWebViewClass(), "instancesRespondToSelector:", sel__executeEditCommand_argument_completion_)&& (objc_msgSend(getWKWebViewClass(), "instancesRespondToSelector:", sel__doAfterNextPresentationUpdateWithoutWaitingForPainting_) & 1) != 0)
    {
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __WFGetPasteboardRepresentationFromWKWebView_block_invoke;
      v20[3] = &unk_24C4DF8F8;
      v12 = v9;
      v21 = v12;
      v22 = v10;
      v23 = v11;
      objc_msgSend(v12, "_executeEditCommand:argument:completion:", CFSTR("selectAll"), 0, v20);

    }
    else
    {
      v14(v11, 0);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a1[7];
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = a2;
  objc_msgSend(v5, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id, _QWORD))(v3 + 16))(v3, v6, v4, v7, a1[6]);

}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v5 = (void *)a1[5];
  v4 = a1[6];
  v6 = a1[4];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "title");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id, id))(v4 + 16))(v4, v8, v6, v9, v7);

}

@end

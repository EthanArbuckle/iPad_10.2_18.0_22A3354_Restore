@implementation WFURLContentItem

- (NSDictionary)additionalRepresentationsForSerialization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x24BEC18A8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (void)getHeadersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16B0];
  -[WFURLContentItem URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("HEAD"));
  objc_msgSend(v7, "_setNonAppInitiated:", 1);
  objc_msgSend(MEMORY[0x24BDD1850], "wf_sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WFURLContentItem_getHeadersWithCompletionHandler___block_invoke;
  v11[3] = &unk_24C4DF988;
  v12 = v4;
  v9 = v4;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

- (void)getContentsOfURLWithHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16B0];
  v5 = a3;
  -[WFURLContentItem URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestWithURL:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setNonAppInitiated:", 1);
  -[WFURLContentItem getContentsWithRequest:cacheResult:expectedByteCountHandler:writtenByteCountHandler:completionHandler:](self, "getContentsWithRequest:cacheResult:expectedByteCountHandler:writtenByteCountHandler:completionHandler:", v7, 1, 0, 0, v5);

}

- (void)getContentsWithRequest:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6
{
  -[WFURLContentItem getContentsWithRequest:cacheResult:expectedByteCountHandler:writtenByteCountHandler:completionHandler:](self, "getContentsWithRequest:cacheResult:expectedByteCountHandler:writtenByteCountHandler:completionHandler:", a3, 0, a4, a5, a6);
}

- (void)getContentsWithRequest:(id)a3 cacheResult:(BOOL)a4 expectedByteCountHandler:(id)a5 writtenByteCountHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFDownloadURLTask *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  id v22;
  id v23;
  BOOL v24;
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[WFDownloadURLTask initWithRequest:]([WFDownloadURLTask alloc], "initWithRequest:", v12);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __122__WFURLContentItem_getContentsWithRequest_cacheResult_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke;
  v21 = &unk_24C4DF9B0;
  objc_copyWeak(&v23, &location);
  v17 = v15;
  v22 = v17;
  v24 = a4;
  -[WFDownloadURLTask setCompletionHandler:](v16, "setCompletionHandler:", &v18);
  -[WFDownloadURLTask setExpectedByteCountHandler:](v16, "setExpectedByteCountHandler:", v13, v18, v19, v20, v21);
  -[WFDownloadURLTask setWrittenByteCountHandler:](v16, "setWrittenByteCountHandler:", v14);
  -[WFDownloadURLTask start](v16, "start");

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  WFURLContentItem *v27;
  id v28;
  void (**v29)(id, void *, _QWORD);
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _QWORD))a3;
  v9 = a4;
  v10 = a5;
  -[WFURLContentItem URL](self, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isFileURL");

  if (v12)
  {
    v13 = *MEMORY[0x24BDF84E0];
    if (objc_msgSend(v10, "isEqualToUTType:", *MEMORY[0x24BDF84E0])
      && (-[WFURLContentItem URL](self, "URL"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "wfType"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToUTType:", v13),
          v15,
          v14,
          (v16 & 1) == 0))
    {
      -[WFURLContentItem getPDFWithOptions:completionHandler:](self, "getPDFWithOptions:completionHandler:", v9, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFURLContentItem URL](self, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "fileExistsAtPath:", v19) & 1) != 0)
      {
        -[WFURLContentItem URL](self, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v21, 0);

      }
      else
      {
        v8[2](v8, 0, 0);
      }

    }
  }
  else
  {
    objc_msgSend(v9, "permissionRequestor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLContentItem URL](self, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke;
    v25[3] = &unk_24C4DFA28;
    v29 = v8;
    v26 = v10;
    v27 = self;
    v28 = v9;
    objc_msgSend(v22, "allowNetworkAccessAfterPromptingForURLs:completionHandler:", v24, v25);

  }
}

- (void)getPDFWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  WFWebResourceCapturer *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("WFCoercionOptionPDFIncludeMargin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v12 = objc_alloc_init(WFWebResourceCapturer);
  -[WFURLContentItem webResource](self, "webResource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResourceCapturer generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:](v12, "generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:", v11, v10, v7, v6);

}

- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, void *);
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[WFContentItem objectRepresentationForClass:](self, "objectRepresentationForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifiedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "specifiedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "wfName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v7[2](v7, v13);
      }
      else
      {
        -[WFContentItem name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v16);

      }
    }
    else
    {
      objc_msgSend(v8, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke;
      v17[3] = &unk_24C4E2960;
      v17[4] = self;
      v18 = v7;
      objc_msgSend(v6, "allowNetworkAccessAfterPromptingForURLs:completionHandler:", v15, v17);

    }
  }

}

- (void)getPreferredFileSize:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__WFURLContentItem_getPreferredFileSize___block_invoke;
  v6[3] = &unk_24C4DFA78;
  v7 = v4;
  v5 = v4;
  -[WFURLContentItem getHeadersWithCompletionHandler:](self, "getHeadersWithCompletionHandler:", v6);

}

- (void)getPreferredFileExtension:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[WFURLContentItem URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v4[2](v4, v6);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__WFURLContentItem_getPreferredFileExtension___block_invoke;
    v7[3] = &unk_24C4DFA78;
    v8 = v4;
    -[WFURLContentItem getHeadersWithCompletionHandler:](self, "getHeadersWithCompletionHandler:", v7);

  }
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFAppTransportSecuredURL(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)webResource
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFURLContentItem URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFileURL");

  -[WFURLContentItem URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFWebResource webResourceWithURL:](WFWebResource, "webResourceWithURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
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
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  void (**v50)(id, void *, _QWORD);
  _QWORD v51[5];
  id v52;
  void (**v53)(id, void *, _QWORD);
  _BYTE v54[128];
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _QWORD))a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    -[WFURLContentItem URL](self, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v20, 0);

LABEL_20:
    goto LABEL_21;
  }
  NSStringFromClass(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v9, "permissionRequestor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLContentItem URL](self, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v51[3] = &unk_24C4DFD48;
    v53 = v8;
    v51[4] = self;
    v52 = v9;
    objc_msgSend(v12, "allowNetworkAccessAfterPromptingForURLs:completionHandler:", v14, v51);

    v15 = v53;
LABEL_4:

    goto LABEL_21;
  }
  if ((Class)objc_opt_class() == a5)
  {
    -[WFURLContentItem URL](self, "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFEmailAddress addressesWithMailtoURL:](WFEmailAddress, "addressesWithMailtoURL:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "if_map:", &__block_literal_global_30_11160);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v31, 0);

    goto LABEL_20;
  }
  if ((Class)objc_opt_class() == a5)
  {
    -[WFURLContentItem URL](self, "URL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[DCMapsLink mapsLinkWithURL:](DCMapsLink, "mapsLinkWithURL:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v35, 0);

    goto LABEL_21;
  }
  if ((Class)objc_opt_class() == a5)
  {
    objc_msgSend(v9, "permissionRequestor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLContentItem URL](self, "URL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v49[3] = &unk_24C4E2960;
    v49[4] = self;
    v50 = v8;
    objc_msgSend(v36, "allowNetworkAccessAfterPromptingForURLs:completionHandler:", v38, v49);

    v15 = v50;
    goto LABEL_4;
  }
  if ((Class)objc_opt_class() == a5)
  {
    -[WFURLContentItem webResource](self, "webResource");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v43, 0);

  }
  else
  {
    v44 = v9;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend((id)objc_opt_class(), "URLCoercions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v26, "urlItem_outputClasses");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "containsObject:", a5);

          if (v28)
          {
            -[WFURLContentItem URL](self, "URL");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "urlItem_generateObjectRepresentations:fromURL:forClass:", v8, v39, a5);

            goto LABEL_25;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v23)
          continue;
        break;
      }
    }

    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v29);

LABEL_25:
    v9 = v44;
  }
LABEL_21:

}

- (void)generateObjectRepresentationForPrintHandler:(id)a3 coercionOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[WFURLContentItem webResource](self, "webResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__WFURLContentItem_generateObjectRepresentationForPrintHandler_coercionOptions___block_invoke;
  v10[3] = &unk_24C4DFAE8;
  v11 = v6;
  v9 = v6;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPrintFormatterForWebResource:coercionOptions:completionHandler:", v8, v7, v10);

}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFURLContentItem URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("mailto"));
LABEL_7:
    v9 = v7;
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFURLContentItem URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[DCMapsLink isMapsURL:](DCMapsLink, "isMapsURL:", v8);

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFURLContentItem URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("http"));
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8350]))
  {
    -[WFURLContentItem URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("http")) & 1) == 0)
    {
      -[WFURLContentItem URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scheme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ftp")) & 1) == 0)
      {
        -[WFURLContentItem URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "isFileURL");
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToClass:", getUIPrintFormatterClass_11141())
    || (objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v4, "isEqualToType:", v14),
        v14,
        v15))
  {
    -[WFURLContentItem URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("http")) & 1) == 0)
    {
      -[WFURLContentItem URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scheme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("data")) & 1) == 0)
      {
        -[WFURLContentItem URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scheme");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ftp")) & 1) != 0)
        {
          v9 = 1;
        }
        else
        {
          -[WFURLContentItem URL](self, "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v25, "isFileURL");

        }
        goto LABEL_35;
      }
LABEL_19:
      v9 = 1;
LABEL_36:

      goto LABEL_8;
    }
LABEL_17:
    v9 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v4, "objectClass");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend((id)objc_opt_class(), "URLCoercions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v5);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "urlItem_outputClasses");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v16);

          if ((v23 & 1) != 0)
          {
            -[WFURLContentItem URL](self, "URL");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v21, "urlItem_canCoerceFromURL:", v6);
            goto LABEL_7;
          }
        }
        v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v18)
          continue;
        break;
      }
    }

  }
  v26.receiver = self;
  v26.super_class = (Class)WFURLContentItem;
  v9 = -[WFContentItem canGenerateRepresentationForType:](&v26, sel_canGenerateRepresentationForType_, v4);
LABEL_9:

  return v9;
}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class ownedTypes](a3, "ownedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (!v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)WFURLContentItem;
    -[WFContentItem intermediaryTypesForCoercionToItemClass:](&v16, sel_intermediaryTypesForCoercionToItemClass_, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
    {
      v10 = (objc_class *)objc_opt_class();

      if (v10 != a3)
        goto LABEL_10;
      v11 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "indexOfObject:", v12);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "moveObjectsAtIndexes:toIndex:", v14, 0);

      }
      v9 = v8;
    }
    else
    {
      v11 = v8;
    }

    v8 = v11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

- (id)outputTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFURLContentItem;
  -[WFContentItem outputTypes](&v10, sel_outputTypes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEC14A0];
  -[WFURLContentItem URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeFromFilename:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isDeclared"))
  {
    v8 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v8, "insertObject:atIndex:", v7, 0);

    v3 = v8;
  }

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFURLContentItem;
  -[WFContentItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFURLContentItem URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __80__WFURLContentItem_generateObjectRepresentationForPrintHandler_coercionOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, _QWORD, id);
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v7 = a4;
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", a2, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);

  }
  else
  {
    v10 = *(void (**)(uint64_t, _QWORD, id))(v4 + 16);
    v8 = a4;
    v10(v4, MEMORY[0x24BDBD1A8], v8);
  }

}

uint64_t __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "generateObjectRepresentationForPrintHandler:coercionOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, char a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    v4[3] = &unk_24C4DFAC0;
    v5 = *(id *)(a1 + 40);
    +[WFArticle fetchArticleFromURL:pageHTML:completionHandler:](WFArticle, "fetchArticleFromURL:pageHTML:completionHandler:", v3, 0, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

id __67__WFURLContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", a2);
}

void __46__WFURLContentItem_getPreferredFileExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "suggestedFilename");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

uint64_t __41__WFURLContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "expectedContentLength");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if ((a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_2;
    v7[3] = &unk_24C4DFA50;
    v3 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    objc_msgSend(v3, "getHeadersWithCompletionHandler:", v7);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_4;
  v7 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(v5, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeFromMIMEType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF83F8]);

  if ((v10 & 1) == 0)
  {
LABEL_4:
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_3;
    v15[3] = &unk_24C4E1E38;
    v11 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    objc_msgSend(v11, "getContentsOfURLWithHandler:", v15);

  }
}

void __70__WFURLContentItem_getTitleWithPermissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "wfName");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

      v5 = 0;
      goto LABEL_7;
    }
    v7 = v4;
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v7);
  }
  v5 = (void *)v7;
LABEL_7:

}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke(id *a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8558]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8560]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v4;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v5;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v6;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v7;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(a1[4], "conformsToTypes:", v9);
    v11 = a1[5];
    if (v10)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_2;
      v12[3] = &unk_24C4DFA00;
      v12[4] = v11;
      v15 = a1[7];
      v13 = a1[4];
      v14 = a1[6];
      objc_msgSend(v11, "getHeadersWithCompletionHandler:", v12);

    }
    else
    {
      objc_msgSend(a1[5], "getContentsOfURLWithHandler:", a1[7]);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))a1[7] + 2))(a1[7], 0);
  }
}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getContentsOfURLWithHandler:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(v5, "MIMEType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeFromMIMEType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "conformsToType:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      goto LABEL_5;
    v10 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(v6, "suggestedFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeFromFilename:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToType:", *(_QWORD *)(a1 + 40));

    if (v13)
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "getContentsOfURLWithHandler:", *(_QWORD *)(a1 + 56));
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToUTType:", *MEMORY[0x24BDF84E0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "getPDFWithOptions:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "webResource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_3;
      v17[3] = &unk_24C4DF9D8;
      v18 = *(id *)(a1 + 56);
      +[WFWebResourceCapturer getPasteboardRepresentationForWebResource:type:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPasteboardRepresentationForWebResource:type:coercionOptions:completionHandler:", v14, v15, v16, v17);

    }
  }

}

void __63__WFURLContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id v10;

  v10 = a5;
  if (a2)
  {
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", a2, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __122__WFURLContentItem_getContentsWithRequest_cacheResult_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v7 || v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_27;
  }
  v11 = v8;
  objc_opt_class();
  v37 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("Content-Type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(";"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("application/x-javascript")) & 1) != 0
      || (objc_msgSend(v15, "hasSuffix:", CFSTR("+json")) & 1) != 0)
    {
      v16 = CFSTR("application/json");
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("application/xhtml+xml")))
        goto LABEL_8;
      v16 = CFSTR("text/html");
    }

    v15 = (void *)v16;
LABEL_8:
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v17 = 0;
LABEL_11:
  if (!objc_msgSend(v17, "isDeclared")
    || objc_msgSend(v17, "isEqualToUTType:", *MEMORY[0x24BDF8350]))
  {
    v18 = WeakRetained;
    objc_msgSend(v11, "suggestedFilename");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x24BEC14A0];
      objc_msgSend(v11, "suggestedFilename");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "typeFromFilename:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v25;
    }
    WeakRetained = v18;
  }
  if (!v17)
  {
    v26 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(v11, "MIMEType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "typeFromMIMEType:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "suggestedFilename");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
  {
    v29 = WeakRetained;
    WFPageTitleFromHTMLFile((uint64_t)v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      objc_msgSend(v11, "suggestedFilename");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v32;

    v28 = v33;
    WeakRetained = v29;
  }
  objc_msgSend(v11, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:originalURL:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:originalURL:", v7, 3, v17, v28, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35 && *(_BYTE *)(a1 + 48))
  {
    v38[0] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setFileRepresentations:forType:", v36, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v8 = v37;
LABEL_27:

}

uint64_t __52__WFURLContentItem_getHeadersWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)filterRepresentationsForAllowedContent:(id)a3
{
  return (id)objc_msgSend(a3, "if_objectsPassingTest:", &__block_literal_global_11229);
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  _BYTE v34[24];
  id v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_opt_class();
  v16 = (void *)*MEMORY[0x24BDF85F0];
  objc_msgSend((id)*MEMORY[0x24BDF85F0], "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wfObjectOfClass:forKey:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "wfObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BEC18A8]);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v12;
  v22 = v21;

  if (!v18)
  {
    v23 = objc_opt_class();
    objc_msgSend(v16, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wfObjectOfClass:forKey:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v28 = v26;
    if (v28 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v34 = 136315906;
        *(_QWORD *)&v34[4] = "WFEnforceClass";
        *(_WORD *)&v34[12] = 2114;
        *(_QWORD *)&v34[14] = v28;
        *(_WORD *)&v34[22] = 2114;
        v35 = (id)objc_opt_class();
        LOWORD(v36) = 2114;
        *(_QWORD *)((char *)&v36 + 2) = v27;
        v31 = v35;
        _os_log_impl(&dword_20BBAD000, v30, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v34, 0x2Au);

      }
      v29 = 0;
    }
    else
    {
      v29 = v28;
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v18, v22, v13, v14, *(_OWORD *)v34, *(_QWORD *)&v34[16], v35, v36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  unsigned __int8 v19;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8350]) & 1) != 0)
  {
    goto LABEL_24;
  }
  v5 = v4;
  if (v5)
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", CFSTR("UIPrintFormatter"));
  if ((v7 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v5, "isEqualToType:", v9),
        v9,
        (v10 & 1) != 0))
  {
LABEL_24:
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v5, "objectClass");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend((id)objc_opt_class(), "URLCoercions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "urlItem_outputClasses");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "containsObject:", v11);

            if ((v18 & 1) != 0)
            {

              goto LABEL_24;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___WFURLContentItem;
    v19 = objc_msgSendSuper2(&v21, sel_supportedTypeMustBeDeterminedByInstance_, v5);
  }

  return v19;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedPasteboardTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF85F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC18A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)outputTypes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v25 = (void *)MEMORY[0x24BDBCEE0];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v2;
  objc_msgSend(v25, "orderedSetWithObjects:", v2, v24, v3, v4, v5, v6, v7, v8, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a1, "URLCoercions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v16, "urlItem_outputClasses");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v29;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v29 != v20)
                objc_enumerationMutation(v17);
              +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v22);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v19);
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }

  return v11;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Web");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("URL (singular)"), CFSTR("URL"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("URLs"), CFSTR("URLs"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d URLs"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)attributionSetContentOfURL:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "isFileURL");
  if (!v3 || v4)
  {
    +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", MEMORY[0x24BDBD1A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFURLContentLocation locationWithURLs:error:](WFURLContentLocation, "locationWithURLs:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[WFContentAttribution attributionWithDisclosureLevel:origin:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", 0, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContentAttributionSet attributionSetWithAttributions:](WFContentAttributionSet, "attributionSetWithAttributions:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[WFContentAttributionSet attributionSetWithAttributions:](WFContentAttributionSet, "attributionSetWithAttributions:", MEMORY[0x24BDBD1A8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

BOOL __59__WFURLContentItem_filterRepresentationsForAllowedContent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      if (objc_msgSend(v4, "isFileURL"))
        v5 = +[WFFileRepresentation isAllowedToRepresentFileURL:](WFFileRepresentation, "isAllowedToRepresentFileURL:", v4);
      else
        v5 = 1;

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)mutableURLCoercions
{
  if (mutableURLCoercions_onceToken != -1)
    dispatch_once(&mutableURLCoercions_onceToken, &__block_literal_global_17404);
  return (id)mutableURLCoercions_URLCoercions;
}

+ (id)URLCoercions
{
  objc_msgSend(a1, "rediscoverURLCoercionClassesIfNeeded");
  return (id)objc_msgSend(a1, "mutableURLCoercions");
}

+ (void)registerURLCoercion:(Class)a3
{
  id v4;

  objc_msgSend(a1, "mutableURLCoercions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", a3);

}

+ (void)rediscoverURLCoercionClassesIfNeeded
{
  _QWORD v3[5];

  if (rediscoverURLCoercionClassesIfNeeded_onceToken != -1)
    dispatch_once(&rediscoverURLCoercionClassesIfNeeded_onceToken, &__block_literal_global_8_17399);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke_2;
  v3[3] = &__block_descriptor_40_e8_v16__0_8l;
  v3[4] = a1;
  WFRegisterClassesFromClassVendingMethodsIfNeeded(a1, CFSTR("allURLCoercionsIn"), (os_unfair_lock_s *)&rediscoverURLCoercionClassesIfNeeded_lock, WFShouldRediscoverCURLCoercionClasses, (void *)rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors, v3);
}

uint64_t __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerURLCoercion:", a2);
}

uint64_t __70__WFURLContentItem_URLCoercions__rediscoverURLCoercionClassesIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors;
  rediscoverURLCoercionClassesIfNeeded_calledURLCoercionVendingSelectors = v0;

  rediscoverURLCoercionClassesIfNeeded_lock = 0;
  return _dyld_register_for_bulk_image_loads();
}

void __53__WFURLContentItem_URLCoercions__mutableURLCoercions__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)mutableURLCoercions_URLCoercions;
  mutableURLCoercions_URLCoercions = v0;

}

@end

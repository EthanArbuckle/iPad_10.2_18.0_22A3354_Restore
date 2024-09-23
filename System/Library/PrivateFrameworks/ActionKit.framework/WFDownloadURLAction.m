@implementation WFDownloadURLAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (void)getContentsOfURLItem:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHTTPMethod"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHTTPHeaders"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDB7458]);
  objc_msgSend(v10, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithURL:", v17);

  objc_msgSend(v18, "_setNonAppInitiated:", 1);
  objc_msgSend(v18, "setHTTPMethod:", v14);
  v19 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke;
  v32[3] = &unk_24F8B2600;
  v20 = v18;
  v33 = v20;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v32);
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_2;
  v26[3] = &unk_24F8B2628;
  v27 = v10;
  v28 = v20;
  v29 = v13;
  v30 = v11;
  v31 = v12;
  v21 = v12;
  v22 = v11;
  v23 = v20;
  v24 = v10;
  v25 = v13;
  -[WFDownloadURLAction configureHTTPBodyForRequest:withMethod:completionHandler:](self, "configureHTTPBodyForRequest:withMethod:completionHandler:", v23, v14, v26);

}

- (void)configureHTTPBodyForRequest:(id)a3 withMethod:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("GET")))
  {
    -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHTTPBodyType"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("File")))
    {
      -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRequestVariable"), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke;
        v44[3] = &unk_24F8BA660;
        v45 = v8;
        v46 = v9;
        objc_msgSend(v11, "getFileRepresentation:forType:", v44, 0);

      }
      else
      {
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
      }

      goto LABEL_31;
    }
    v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("JSON"));
    v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("Form"));
    v14 = v13;
    if ((v12 & 1) != 0 || v13)
    {
      if ((v12 & 1) != 0)
      {
        -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFJSONValues"), objc_opt_class());
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (id)v15;
          if (!v14)
          {
LABEL_25:
            v22 = (id *)MEMORY[0x24BE197D0];
            if (!v12)
              v22 = (id *)MEMORY[0x24BE197D8];
            v23 = (void *)MEMORY[0x24BE194D8];
            v24 = *v22;
            objc_msgSend(v23, "itemWithObject:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke_2;
            v37[3] = &unk_24F8BA660;
            v38 = v8;
            v39 = v9;
            objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "getFileRepresentation:forType:", v37, v25);
LABEL_30:

            goto LABEL_31;
          }
LABEL_16:
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v36 = v16;
          objc_msgSend(v16, "allValues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v41;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v41 != v20)
                  objc_enumerationMutation(v17);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v26 = v8;
                  v27 = v36;
                  v28 = v9;
                  v29 = (void *)objc_opt_new();
                  objc_msgSend(v27, "allKeys");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = MEMORY[0x24BDAC760];
                  v51[0] = MEMORY[0x24BDAC760];
                  v51[1] = 3221225472;
                  v51[2] = __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke;
                  v51[3] = &unk_24F8B2650;
                  v52 = v27;
                  v32 = v29;
                  v53 = v32;
                  v47[0] = v31;
                  v47[1] = 3221225472;
                  v47[2] = __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke_3;
                  v47[3] = &unk_24F8B2678;
                  v48 = v26;
                  v49 = v32;
                  v50 = v28;
                  v33 = v28;
                  v34 = v32;
                  v35 = v26;
                  v16 = v27;
                  objc_msgSend(v30, "if_enumerateAsynchronouslyInSequence:completionHandler:", v51, v47);

                  goto LABEL_30;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
              if (v19)
                continue;
              break;
            }
          }

          v16 = v36;
          goto LABEL_25;
        }
      }
      else if ((v13 & 1) != 0)
      {
        -[WFDownloadURLAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFormValues"), objc_opt_class());
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_16;
      }
    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_31:

    goto LABEL_32;
  }
  (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_32:

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDownloadURLAction input](self, "input");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ to “%3$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to connect to “%2$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  WFConfigureRequestBodyWithFile(v5, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  WFConfigureRequestBodyWithFile(v5, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", a3, a2);
}

void __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_3;
    v7[3] = &unk_24F8BA660;
    v9 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v3, "getContentsWithRequest:expectedByteCountHandler:writtenByteCountHandler:completionHandler:", v4, v6, v5, v7);

  }
}

void __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a2;
  v8 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(v8 + 8);
  v9 = a3;
  objc_msgSend(v7, "attributionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  v11 = v10;
  objc_msgSend(v17, "wfType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToUTType:", *MEMORY[0x24BDF8440]))
  {
    objc_msgSend(MEMORY[0x24BE194D8], "itemsWithJSONFileRepresentation:attributionSet:", v17, v11);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_6;
  }
  if (objc_msgSend(v12, "conformsToString:", *MEMORY[0x24BE19930]))
  {
    objc_msgSend(MEMORY[0x24BE194D8], "itemsWithPlistFileRepresentation:attributionSet:", v17, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v17)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:attributionSet:", v17, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithObjects:", v16, 0);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }
LABEL_6:

  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v14, v9);
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v8 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_2;
    v19[3] = &unk_24F8B25D8;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v21 = v10;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_6;
    v18[3] = &unk_24F8BAFA8;
    v18[4] = v10;
    objc_msgSend(v6, "transformItemsAndFlattenUsingBlock:completionHandler:", v19, v18);
    v11 = v20;
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BEC4270];
    v22[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No URL Specified"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v22[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Make sure to pass a valid URL to the Get Contents of URL action."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 6, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishRunningWithError:", v17);

  }
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, *(_QWORD *)(a1 + 32));
  v8 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v15[3] = &unk_24F8B25B0;
  v15[4] = v8;
  v13 = v7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_4;
  v14[3] = &unk_24F8B25B0;
  v14[4] = v8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_5;
  v11[3] = &unk_24F8BABC0;
  v12 = v5;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "getContentsOfURLItem:expectedByteCountHandler:writtenByteCountHandler:completionHandler:", v10, v15, v14, v11);

}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount") + a2);

}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + a2);

}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isFileURL"))
    goto LABEL_6;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) == 0)
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8 == -1100)
  {
    v6 = v5;
    v5 = 0;
LABEL_6:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

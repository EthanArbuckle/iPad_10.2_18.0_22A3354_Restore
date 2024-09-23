@implementation WFRunJavaScriptOnWebPageAction

- (id)missingCompletionError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Invalid JavaScript"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD0FC8];
  v8[0] = *MEMORY[0x24BDD0FD8];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)invalidJavaScriptErrorWithSyntaxErrorString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLocalizedString(CFSTR("Invalid JavaScript"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD0FC8];
  v9[0] = *MEMORY[0x24BDD0FD8];
  v9[1] = v5;
  v10[0] = v4;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WFRunJavaScriptOnWebPageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFJavaScript"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", CFSTR("completion")) & 1) != 0)
  {
    -[WFRunJavaScriptOnWebPageAction _getErrorFromScript:](self, "_getErrorFromScript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[WFRunJavaScriptOnWebPageAction invalidJavaScriptErrorWithSyntaxErrorString:](self, "invalidJavaScriptErrorWithSyntaxErrorString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRunJavaScriptOnWebPageAction finishRunningWithError:](self, "finishRunningWithError:", v7);

    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke;
      v8[3] = &unk_24F8B8F70;
      v8[4] = self;
      v9 = v5;
      -[WFRunJavaScriptOnWebPageAction getWebPageFromInput:completionHandler:](self, "getWebPageFromInput:completionHandler:", v4, v8);

    }
  }
  else
  {
    -[WFRunJavaScriptOnWebPageAction missingCompletionError](self, "missingCompletionError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunJavaScriptOnWebPageAction finishRunningWithError:](self, "finishRunningWithError:", v6);
  }

}

- (void)evaluateQuarantineWithJavaScript:(id)a3 webPageURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFRunJavaScriptOnWebPageAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFJavaScript"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "variableString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x24BEC3E20]);
  -[WFRunJavaScriptOnWebPageAction workflow](self, "workflow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithWorkflow:runtimeType:targetURL:preRuntimeVariableString:runtimeString:", v14, 1, v9, v12, v10);

  objc_msgSend(MEMORY[0x24BEC3FE0], "sharedEvaluator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke;
  v18[3] = &unk_24F8B8FC0;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  objc_msgSend(v16, "evaluatePolicyForRequest:completion:", v15, v18);

}

- (void)getWebPageFromInput:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke;
  v9[3] = &unk_24F8B9010;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend(v8, "getObjectRepresentationAndAttributionSet:forClass:", v9, objc_opt_class());

}

- (id)_getErrorFromScript:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  OpaqueJSString *v7;
  BOOL v8;
  __CFString *v9;
  const OpaqueJSContext *v10;
  OpaqueJSString *v11;
  JSValueRef exception;

  v3 = a3;
  v4 = (void *)MEMORY[0x22E315218]();
  v5 = objc_alloc_init(MEMORY[0x24BDDA720]);
  v6 = objc_retainAutorelease(v3);
  v7 = JSStringCreateWithUTF8CString((const char *)objc_msgSend(v6, "UTF8String"));
  exception = 0;
  v8 = JSCheckScriptSyntax((JSContextRef)objc_msgSend(v5, "JSGlobalContextRef"), v7, 0, 0, &exception);
  JSStringRelease(v7);
  v9 = 0;
  if (!v8)
  {
    v10 = (const OpaqueJSContext *)objc_msgSend(v5, "JSGlobalContextRef");
    v11 = JSValueToStringCopy(v10, exception, 0);
    v9 = (__CFString *)JSStringCopyCFString(0, v11);
    JSStringRelease(v11);
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (id)noWebPageProvidedError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("No Web Page"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Run JavaScript on Web Page failed because no web page was passed as input."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD0FC8];
  v8[0] = *MEMORY[0x24BDD0FD8];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in JavaScript on a webpage?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to run JavaScript?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Run JavaScript on Web Page"), CFSTR("Run JavaScript on Web Page"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameterSummary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC3A50]);
  WFLocalizedStringResourceWithKey(CFSTR("Run JavaScript on ${WFInput}"), CFSTR("Run JavaScript on ${WFInput}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_2;
    v8[3] = &unk_24F8BA1A0;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v11 = *(id *)(a1 + 40);
    v10 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_lp_highLevelDomain");
  else
    objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC3C28], "defaultDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_3;
  v7[3] = &unk_24F8B8FE8;
  v10 = a1[7];
  v8 = a1[5];
  v9 = a1[6];
  objc_msgSend(v2, "requestToRunScriptsOnDomain:withUserInterface:database:completionHandler:", v4, v5, v6, v7);

}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_3(_QWORD *a1, char a2)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(a1[6], a1[4], a1[5], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, v3);

  }
}

void __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke_2;
  block[3] = &unk_24F8B8F98;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_24F8B8F48;
    v14 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v10;
    v18 = v14;
    v19 = v8;
    v15 = v10;
    objc_msgSend(v11, "evaluateQuarantineWithJavaScript:webPageURL:completionHandler:", v12, v13, v16);

  }
  else
  {

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "variableSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listenerEndpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "javaScriptRunnerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19540]), "initWithEndpoint:", v9);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_3;
      v13[3] = &unk_24F8B8F20;
      v13[4] = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v10, "runJavaScript:completionHandler:", v11, v13);

    }
    else
    {
LABEL_7:
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "noWebPageProvidedError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishRunningWithError:", v9);
    }

  }
}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("success"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      WFEnforceClass(v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("userResult"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        WFEnforceClass(v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "dataUsingEncoding:", 4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x24BE194F8];
          objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8620]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileWithData:ofType:proposedFilename:", v13, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BE194D8], "itemsWithJSONFileRepresentation:attributionSet:", v16, *(_QWORD *)(a1 + 40));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setOutput:", v18);

        }
        objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
        goto LABEL_13;
      }
      WFLocalizedString(CFSTR("JavaScript Exception"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("exception"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_class();
      WFEnforceClass(v23, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "length"))
      {
        WFLocalizedString(CFSTR("An unknown error occurred when running JavaScript."));
        v25 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v25;
      }
      v26 = *MEMORY[0x24BDD0FC8];
      v29[0] = *MEMORY[0x24BDD0FD8];
      v29[1] = v26;
      v30[0] = v12;
      v30[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "finishRunningWithError:", v28);

    }
    else
    {
      WFLocalizedString(CFSTR("JavaScript Timeout"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Run JavaScript on Web Page failed because the script took too long to call the completion handler."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD0FC8];
      v31[0] = *MEMORY[0x24BDD0FD8];
      v31[1] = v19;
      v32[0] = v9;
      v32[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 6, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishRunningWithError:", v22);
    }

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
LABEL_14:

}

@end

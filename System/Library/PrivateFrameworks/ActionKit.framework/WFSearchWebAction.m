@implementation WFSearchWebAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB768;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentation:", v3);
}

- (id)getDestinationURLFromInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFSearchWebAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSearchWebDestination"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeCharactersInString:", CFSTR("?&="));
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Amazon")) & 1) != 0)
  {
    v9 = CFSTR("https://www.amazon.com/s/s?k=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Bing")) & 1) != 0)
  {
    v9 = CFSTR("https://www.bing.com/search?q=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DuckDuckGo")) & 1) != 0)
  {
    v9 = CFSTR("https://duckduckgo.com/?q=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("eBay")) & 1) != 0)
  {
    v9 = CFSTR("https://www.ebay.com/sch/%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Google")) & 1) != 0)
  {
    v9 = CFSTR("https://google.com/search?q=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Reddit")) & 1) != 0)
  {
    v9 = CFSTR("https://m.reddit.com/search?q=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Twitter")) & 1) != 0)
  {
    v9 = CFSTR("https://twitter.com/search?q=%@");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Yahoo!")) & 1) != 0)
  {
    v9 = CFSTR("https://search.yahoo.com/mobile/s?p=%@");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("YouTube")))
    {
LABEL_21:
      v12 = 0;
      goto LABEL_22;
    }
    v9 = CFSTR("https://www.youtube.com/results?search_query=%@");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_21;
  v11 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFSearchWebAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__WFSearchWebAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B8018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getStringRepresentation:", v7);

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
    WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a web search?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to perform a web search?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __64__WFSearchWebAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "getDestinationURLFromInputString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    objc_msgSend(MEMORY[0x24BE19658], "locationWithURL:error:", v7, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  uint64_t v20;
  _QWORD v21[5];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "length");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "getDestinationURLFromInputString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "userInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isRunningWithSiriUI") & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "userInterface");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "userInterface");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_2;
          v21[3] = &unk_24F8B7FF0;
          v21[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v13, "openURL:withBundleIdentifier:completionHandler:", v9, 0, v21);

          goto LABEL_6;
        }
      }
      else
      {

      }
      v14 = (void *)MEMORY[0x24BEC4238];
      objc_msgSend(*(id *)(a1 + 32), "userInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_3;
      v19[3] = &unk_24F8BA540;
      v20 = *(_QWORD *)(a1 + 32);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_4;
      v18[3] = &unk_24F8BB370;
      v18[4] = v20;
      objc_msgSend(v14, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v9, 0, v15, 0, v19, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performRequest:", v16);

      goto LABEL_10;
    }
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v8, "finishRunningWithError:", v6);
LABEL_11:

}

void __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v3);

  }
}

uint64_t __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

uint64_t __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end

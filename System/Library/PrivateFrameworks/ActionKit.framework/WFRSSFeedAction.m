@implementation WFRSSFeedAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BA0E8;
  v3[4] = self;
  -[WFRSSFeedAction getURLsFromInputWithCompletionHandler:](self, "getURLsFromInputWithCompletionHandler:", v3);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFRSSFeedAction parser](self, "parser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopParsing");

  v4.receiver = self;
  v4.super_class = (Class)WFRSSFeedAction;
  -[WFRSSFeedAction cancel](&v4, sel_cancel);
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFRSSFeedAction setParser:](self, "setParser:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFRSSFeedAction;
  -[WFRSSFeedAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

}

- (void)getURLsFromInputWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFRSSFeedAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WFRSSFeedAction_getURLsFromInputWithCompletionHandler___block_invoke;
  v8[3] = &unk_24F8B7658;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "generateCollectionByCoercingToItemClasses:completionHandler:", v6, v8);

}

- (void)feedParser:(id)a3 didParseFeedItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[WFRSSFeedAction output](self, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asWFArticle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  -[WFRSSFeedAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRSSItemQuantity"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  -[WFRSSFeedAction output](self, "output");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfItems");

  if (v12 >= v10)
    objc_msgSend(v13, "stopParsing");

}

- (void)feedParserDidFinish:(id)a3
{
  -[WFRSSFeedAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (void)feedParser:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v7 = a4;
  WFLocalizedString(CFSTR("Unable to parse news feed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v12[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please pass a valid feed URL to the Get Items from RSS Feed action."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = *MEMORY[0x24BDD1398];
  v13[1] = v9;
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFRSSFeedAction finishRunningWithError:](self, "finishRunningWithError:", v11);
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFRSSFeedAction input](self, "input");
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
    WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ while fetching a RSS feed from %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to fetch a RSS feed from %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MWFeedParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
}

void __57__WFRSSFeedAction_getURLsFromInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = a2;
  v10 = 0;
  objc_msgSend(v7, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  _QWORD v7[5];

  v6 = a2;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke_2;
    v7[3] = &unk_24F8B75F0;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateObjectRepresentations:forClass:completionHandler:", v7, objc_opt_class(), &__block_literal_global_36521);
  }

}

void __46__WFRSSFeedAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  MWFeedParser *v2;
  id v3;

  WFAppTransportSecuredURL();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[MWFeedParser initWithFeedURL:]([MWFeedParser alloc], "initWithFeedURL:", v3);
  -[MWFeedParser setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[MWFeedParser setFeedParseType:](v2, "setFeedParseType:", 1);
  -[MWFeedParser parse](v2, "parse");

}

@end

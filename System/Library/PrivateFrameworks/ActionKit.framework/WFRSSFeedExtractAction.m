@implementation WFRSSFeedExtractAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BA0E8;
  v3[4] = self;
  -[WFRSSFeedExtractAction getURLsFromInputWithCompletionHandler:](self, "getURLsFromInputWithCompletionHandler:", v3);
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
  -[WFRSSFeedExtractAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__WFRSSFeedExtractAction_getURLsFromInputWithCompletionHandler___block_invoke;
  v8[3] = &unk_24F8B7658;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "generateCollectionByCoercingToItemClasses:completionHandler:", v6, v8);

}

- (void)addRSSFeedItemsFromHTML:(id)a3 baseURL:(id)a4 encoding:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  htmlDocPtr Memory;
  xmlXPathContext *v13;
  xmlNode *RootElement;
  xmlXPathObjectPtr v15;
  xmlXPathObject *v16;
  int *p_nodeNr;
  uint64_t v18;
  void (**v19)(xmlChar *);
  const xmlNode *v20;
  xmlChar *Prop;
  xmlChar *v22;
  void *v23;
  void *v24;
  void *v25;
  xmlChar *v26;
  xmlChar *v27;
  void *v28;
  void *v29;
  xmlXPathContext *ctxt;
  xmlDoc *cur;
  id v32;
  id v33;
  id v35;

  v35 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v35, "length"))
  {
    v9 = objc_retainAutorelease(v35);
    v10 = (const char *)objc_msgSend(v9, "bytes");
    LODWORD(v9) = objc_msgSend(v9, "length");
    objc_msgSend(v7, "absoluteString");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Memory = htmlReadMemory(v10, (int)v9, (const char *)objc_msgSend(v11, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 2049);

    v13 = xmlXPathNewContext(Memory);
    RootElement = xmlDocGetRootElement(Memory);
    v15 = xmlXPathNodeEval(RootElement, (const xmlChar *)"//head/link[(@rel='self' or @rel='alternate') and (@type='application/atom+xml' or @type='application/rss+xml')]", v13);
    if (v15)
    {
      v16 = v15;
      ctxt = v13;
      cur = Memory;
      v32 = v8;
      v33 = v7;
      p_nodeNr = &v15->nodesetval->nodeNr;
      if (p_nodeNr)
      {
        v18 = 0;
        v19 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
        while (1)
        {
          if (v18 >= *p_nodeNr)
            goto LABEL_16;
          v20 = *(const xmlNode **)(*((_QWORD *)p_nodeNr + 1) + 8 * v18);
          Prop = xmlGetProp(v20, (const xmlChar *)"href");
          if (Prop)
          {
            v22 = Prop;
            v23 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Prop, ctxt, cur);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "URLWithString:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            (*v19)(v22);
          }
          else
          {
            v25 = 0;
          }
          v26 = xmlGetProp(v20, (const xmlChar *)"title");
          if (!v26)
            break;
          v27 = v26;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          (*v19)(v27);
          if (v25)
            goto LABEL_11;
LABEL_12:

          ++v18;
          p_nodeNr = &v16->nodesetval->nodeNr;
          if (!p_nodeNr)
            goto LABEL_16;
        }
        v28 = 0;
        if (!v25)
          goto LABEL_12;
LABEL_11:
        -[WFRSSFeedExtractAction output](self, "output", ctxt);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:named:", v25, v28);

        goto LABEL_12;
      }
LABEL_16:
      xmlXPathFreeObject(v16);
      xmlXPathFreeContext(ctxt);
      xmlFreeDoc(cur);
      v8 = v32;
      v7 = v33;
    }
  }

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFRSSFeedExtractAction input](self, "input");
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
    WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ while finding RSS feeds on %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to find RSS feed on %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __64__WFRSSFeedExtractAction_getURLsFromInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[5];

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
  else
  {
    v9 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_24F8B75F0;
    v16[4] = *(_QWORD *)(a1 + 32);
    v10 = objc_opt_class();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_4;
    v13[3] = &unk_24F8B37C8;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    objc_msgSend(v7, "enumerateObjectRepresentations:forClass:completionHandler:", v16, v10, v13);

  }
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a4;
  WFAppTransportSecuredURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB74B0], "wf_sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_24F8B0468;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "dataTaskWithURL:completionHandler:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v2 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_5;
  v6[3] = &unk_24F8BB028;
  v3 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_6;
  v5[3] = &unk_24F8BB050;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateFileRepresentations:forType:completionHandler:", v6, v4, v5);

}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRSSFeedItemsFromHTML:baseURL:encoding:", v5, 0, 0);

  v6[2](v6, 0);
}

uint64_t __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFRSSFeedExtractAction_runAsynchronouslyWithInput___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void *)a1[4];
  v8 = a1[5];
  v11 = a4;
  v9 = a2;
  objc_msgSend(a3, "textEncodingName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRSSFeedItemsFromHTML:baseURL:encoding:", v9, v8, v10);

  (*(void (**)(void))(a1[6] + 16))();
}

@end

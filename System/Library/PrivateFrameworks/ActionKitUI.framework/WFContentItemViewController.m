@implementation WFContentItemViewController

- (WFContentItemViewController)initWithContentItem:(id)a3
{
  id v6;
  WFContentItemViewController *v7;
  WFContentItemViewController *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentItemViewController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContentItemViewController;
  v7 = -[WFContentItemViewController init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentItem, a3);
    WFLocalizedString(CFSTR("Supported Types"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemViewController setTitle:](v8, "setTitle:", v9);

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContentItemViewController;
  -[WFContentItemViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WFContentItemViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFOutputTypeCellIdentifier"));

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFContentItem supportedTypes](self->_contentItem, "supportedTypes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFOutputTypeCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem supportedTypes](self->_contentItem, "supportedTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v10, "typeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "documentIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UIImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v14);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  WFContentItem *contentItem;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  WFContentItem *v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  contentItem = self->_contentItem;
  v6 = a4;
  -[WFContentItem supportedTypes](contentItem, "supportedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = self->_contentItem;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_24E343830;
    v12 = &v17;
    v16[4] = self;
    v17 = v10;
    -[WFContentItem getFileRepresentation:forType:](v11, "getFileRepresentation:forType:", v16);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    v12 = (id *)&v15;
    -[WFContentItem getObjectRepresentation:forClass:](self->_contentItem, "getObjectRepresentation:forClass:", &v14, objc_msgSend(v13, "objectClass", MEMORY[0x24BDAC760], 3221225472, __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_3, &unk_24E343858, self, v13));
    goto LABEL_5;
  }
LABEL_6:

}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v11[3] = &unk_24E343AD0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v6 = a2;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v12[3] = &unk_24E343AD0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WFUserInterfaceFromViewController();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentAlert:", v2);
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openURL:", *(_QWORD *)(a1 + 32));
LABEL_8:

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc_init(MEMORY[0x24BEBDB08]);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v15, "setView:", v3);

    objc_msgSend(*(id *)(a1 + 56), "typeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v4);

    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", v15, 1);
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  if ((isKindOfClass & 1) == 0)
  {
    v11 = objc_alloc_init(MEMORY[0x24BEBDA88]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "setAttributedText:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v12);

    }
    objc_msgSend(v15, "setView:", v11);
    objc_msgSend(*(id *)(a1 + 56), "typeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v13);

    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushViewController:animated:", v15, 1);

    goto LABEL_8;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDDB130]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithPlacemark:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "addAnnotation:", v7);
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showAnnotations:animated:", v8, 0);

  objc_msgSend(v15, "setView:", v6);
  objc_msgSend(*(id *)(a1 + 56), "typeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v9);

  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v15, 1);

}

void __65__WFContentItemViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8658]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

    if ((_DWORD)v2)
    {
      v4 = objc_alloc_init(MEMORY[0x24BEBDB08]);
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v5 = (void *)getWKWebViewClass_softClass_4880;
      v24 = getWKWebViewClass_softClass_4880;
      if (!getWKWebViewClass_softClass_4880)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __getWKWebViewClass_block_invoke_4881;
        v20[3] = &unk_24E343A50;
        v20[4] = &v21;
        __getWKWebViewClass_block_invoke_4881((uint64_t)v20);
        v5 = (void *)v22[3];
      }
      v6 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v21, 8);
      v7 = objc_alloc_init(v6);
      objc_msgSend(v4, "setView:", v7);
      objc_msgSend(*(id *)(a1 + 56), "typeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v8);

      v9 = (void *)MEMORY[0x24BDD1840];
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v7, "loadRequest:", v11);

      objc_msgSend(*(id *)(a1 + 40), "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pushViewController:animated:", v4, 1);

    }
    else
    {
      v15 = (void *)MEMORY[0x24BE8F668];
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "interactionControllerWithURL:", v16);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "typeDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setName:", v17);

      objc_msgSend(v19, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v19, "presentPreviewAnimated:", 1);

    }
  }
  else
  {
    WFUserInterfaceFromViewController();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentAlert:", v14);

  }
}

@end

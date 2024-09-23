@implementation SUUIShareTemplateTextItemProvider

- (SUUIShareTemplateTextItemProvider)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIShareTemplateTextItemProvider *v9;
  SUUIShareTemplateTextItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShareTemplateTextItemProvider;
  v9 = -[UIActivityItemProvider initWithPlaceholderItem:](&v12, sel_initWithPlaceholderItem_, &stru_2511FF0C8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_templateElement, a3);
  }

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  SUUIShareTemplateViewElement *templateElement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  templateElement = self->_templateElement;
  -[UIActivityItemProvider activityType](self, "activityType", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShareTemplateViewElement activityForUIActivityType:](templateElement, "activityForUIActivityType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)item
{
  SUUIShareTemplateViewElement *templateElement;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  templateElement = self->_templateElement;
  -[UIActivityItemProvider activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShareTemplateViewElement activityForUIActivityType:](templateElement, "activityForUIActivityType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "contentSourceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v6);
      objc_msgSend(MEMORY[0x24BEB20B0], "consumer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataConsumer:", v8);

      -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStoreFrontSuffix:", v9);

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __41__SUUIShareTemplateTextItemProvider_item__block_invoke;
      v15[3] = &unk_2511F5EB8;
      v15[4] = &v16;
      objc_msgSend(v7, "setOutputBlock:", v15);
      objc_msgSend(v7, "main");
    }
    else
    {
      objc_msgSend(v5, "message");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17[5];
      v17[5] = v11;

    }
  }
  v13 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v13;
}

void __41__SUUIShareTemplateTextItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BDD17C8];
    v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end

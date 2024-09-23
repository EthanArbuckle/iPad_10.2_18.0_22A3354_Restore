@implementation SUUIContextActionsConfiguration

- (SUUIContextActionsConfiguration)initWithDialogTemplate:(id)a3
{
  id v5;
  SUUIContextActionsConfiguration *v6;
  SUUIContextActionsConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsConfiguration;
  v6 = -[SUUIContextActionsConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dialogTemplate, a3);

  return v7;
}

- (id)contextActions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SUUIContextActionsConfiguration dialogTemplate](self, "dialogTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "buttonText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", 0, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "buttonImage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIContextActionsConfiguration _resourceImageForImageElement:](self, "_resourceImageForImageElement:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __49__SUUIContextActionsConfiguration_contextActions__block_invoke;
        v19[3] = &unk_2511F7CC0;
        v19[4] = v10;
        objc_msgSend(MEMORY[0x24BEBD678], "actionWithTitle:resource:handler:", v13, v15, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

uint64_t __49__SUUIContextActionsConfiguration_contextActions__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  *a3 = 1;
  return result;
}

- (id)_resourceImageForImageElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "resourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    SUUIImageWithResourceName(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageMaskColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "color");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_flatImageWithColor:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SUUIContextActionsPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSource, a3);
}

- (SUUIDialogTemplateViewElement)dialogTemplate
{
  return self->_dialogTemplate;
}

- (void)setDialogTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_dialogTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogTemplate, 0);
  objc_storeStrong((id *)&self->_presentationSource, 0);
}

@end

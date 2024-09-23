@implementation SUUINearMeViewElement

- (SUUINearMeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  SUUINearMeViewElement *v5;
  SUUINearMeViewElement *v6;
  _QWORD block[4];
  SUUINearMeViewElement *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUINearMeViewElement;
  v5 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v10, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SUUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
    block[3] = &unk_2511F47C0;
    v9 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v6;
}

void __66__SUUINearMeViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SUUINearMeController sharedController](SUUINearMeController, "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__itemsDidChange_, CFSTR("SUUINearMeItemsDidChangeNotification"), v3);

  if (objc_msgSend(v3, "status"))
    objc_msgSend(*(id *)(a1 + 32), "_itemsDidChange:", 0);
  else
    objc_msgSend(v3, "getItems");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUUINearMeViewElement;
  -[SUUIViewElement dealloc](&v4, sel_dealloc);
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v5 = SUUICoreLocationFramework();
  v6 = objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v5), "authorizationStatus");
  if (SUUINearMeIsEnabledForAuthorizationStatus(v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUINearMeViewElement;
    -[SUUIViewElement enumerateChildrenUsingBlock:](&v7, sel_enumerateChildrenUsingBlock_, v4);
  }

}

- (void)_itemsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[SUUINearMeController sharedController](SUUINearMeController, "sharedController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "itemIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  +[SUUINearMeController sharedController](SUUINearMeController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responseDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v15, 4);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __41__SUUINearMeViewElement__itemsDidChange___block_invoke;
    v18[3] = &unk_2511F46D0;
    v18[4] = self;
    v19 = v16;
    v17 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

  }
}

void __41__SUUINearMeViewElement__itemsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = CFSTR("nearMe");
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 13, 0, 1, v3, 0);

}

@end

@implementation SUUIShelfMenuBarViewElement

- (SUUIShelfMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SUUIShelfMenuBarViewElement *v12;
  SUUIDynamicShelfMenuBarViewElement *v13;
  SUUIMenuBarViewElementConfiguration *v14;
  SUUIMenuBarViewElementConfiguration *configuration;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityProviderID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v13 = -[SUUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:]([SUUIDynamicShelfMenuBarViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
      goto LABEL_6;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SUUIShelfMenuBarViewElement;
  v12 = -[SUUIShelfViewElement initWithDOMElement:parent:elementFactory:](&v19, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v13 = (SUUIDynamicShelfMenuBarViewElement *)v12;
  if (v12)
  {
    -[SUUIViewElement featureWithName:](v12, "featureWithName:", *MEMORY[0x24BE51810]);
    self = (SUUIShelfMenuBarViewElement *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUUIMenuBarViewElementConfiguration _initWithMenuBarDocument:]([SUUIMenuBarViewElementConfiguration alloc], "_initWithMenuBarDocument:", self);
    configuration = v13->super._configuration;
    v13->super._configuration = v14;

    -[SUUIMenuBarViewElementConfiguration _setReloadDelegate:](v13->super._configuration, "_setReloadDelegate:", v13);
LABEL_6:

  }
  return &v13->super;
}

+ (id)supportedFeatures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BE51810];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SUUIShelfMenuBarViewElement;
  objc_msgSendSuper2(&v8, sel_supportedFeatures);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIShelfMenuBarViewElement *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIShelfMenuBarViewElement;
  v4 = (SUUIShelfMenuBarViewElement *)a3;
  -[SUUIShelfViewElement applyUpdatesWithElement:](&v7, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v7.receiver, v7.super_class))
    -[SUUIMenuBarViewElementConfiguration _setNeedsReload:](self->_configuration, "_setNeedsReload:", 1, v7.receiver, v7.super_class);
  return v5;
}

- (unint64_t)elementType
{
  return 118;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUUIShelfMenuBarViewElement children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SUUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_2511F75D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __59__SUUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "elementType") == 72;
  v4 = v7;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "shelfItemViewElementValidator");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (!v5 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v7))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = v7;
  }

}

- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3
{
  if (self->_configuration == a3)
    -[SUUIShelfMenuBarViewElement _reloadMenuItems](self, "_reloadMenuItems");
}

- (id)regularViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_regularViewElements, "objectAtIndex:", a3);
}

- (id)focusedViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_focusedViewElements, "objectAtIndex:", a3);
}

- (void)_reloadMenuItems
{
  SUUIShelfMenuBarViewElement *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *focusedViewElements;
  uint64_t v21;
  NSArray *regularViewElements;
  void *v23;
  SUUIShelfMenuBarViewElement *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  SUUIShelfMenuBarViewElement *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x24BDAC8D0];
  -[SUUIShelfMenuBarViewElement style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForStyle:", CFSTR("itml-shelf-layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("zooming"));

  if (v5)
  {
    v28 = v5;
    v29 = v2;
    -[SUUIShelfMenuBarViewElement children](v2, "children");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v31 = 0;
          v32 = 0;
          v33 = 0;
          SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(v13, (uint64_t)&v31);
          if ((_BYTE)v31)
          {
            v14 = v13;
            objc_msgSend(v14, "children");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v32);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v33);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v10, "addObject:", v14);
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v9, "addObject:", v16);
            if (!v8)
              v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }

    v18 = 2;
    v2 = v29;
    v5 = v28;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v18 = 0;
  }
  v19 = objc_msgSend(v9, "copy");
  focusedViewElements = v2->_focusedViewElements;
  v2->_focusedViewElements = (NSArray *)v19;

  v21 = objc_msgSend(v8, "copy");
  regularViewElements = v2->_regularViewElements;
  v2->_regularViewElements = (NSArray *)v21;

  if (v5)
  {
    v23 = &__block_literal_global_15;
    v24 = v2;
  }
  else
  {
    v24 = v2;
    v23 = 0;
  }
  -[SUUIShelfViewElement setShelfItemViewElementValidator:](v24, "setShelfItemViewElementValidator:", v23);
  -[SUUIShelfMenuBarViewElement style](v2, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForStyle:", CFSTR("itml-scroll-enabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  -[SUUIMenuBarViewElementConfiguration _reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:](v2->_configuration, "_reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:", v18, v10, v27);
}

uint64_t __47__SUUIShelfMenuBarViewElement__reloadMenuItems__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(a2, (uint64_t)v3);
  return LOBYTE(v3[0]);
}

- (SUUIMenuBarViewElementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_regularViewElements, 0);
  objc_storeStrong((id *)&self->_focusedViewElements, 0);
}

@end

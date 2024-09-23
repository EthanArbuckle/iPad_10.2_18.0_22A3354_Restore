@implementation APUIWidgetViewController

- (APUIWidgetViewController)initWithIdentifier:(id)a3
{
  id v4;
  APUIWidgetViewController *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APUIWidgetViewController;
  v5 = -[APUIWidgetViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__topWidgetDidAppear_, *MEMORY[0x24BE04228], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__topWidgetDidDisappear_, *MEMORY[0x24BE04230], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  -[APUIWidgetViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  -[APUIWidgetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[APUIWidgetViewController setViewVisible:](self, "setViewVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  -[APUIWidgetViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[APUIWidgetViewController setViewVisible:](self, "setViewVisible:", 0);
}

- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[APUIWidgetViewController identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

- (void)_topWidgetDidAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE04240]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE04238]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__APUIWidgetViewController__topWidgetDidAppear___block_invoke;
  block[3] = &unk_24DB7D3D0;
  block[4] = self;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __48__APUIWidgetViewController__topWidgetDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "matchesWidgetUniqueID:stackID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setStackVisible:", 1);
  return result;
}

- (void)_topWidgetDidDisappear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE04240]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE04238]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__APUIWidgetViewController__topWidgetDidDisappear___block_invoke;
  block[3] = &unk_24DB7D3D0;
  block[4] = self;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __51__APUIWidgetViewController__topWidgetDidDisappear___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "matchesWidgetUniqueID:stackID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setStackVisible:", 0);
  return result;
}

- (void)logChangeWithNewSuggestionIds:(id)a3 previousSuggestionIds:(id)a4 suggestionClient:(id)a5
{
  id v8;
  id v9;
  ATXHomeScreenWidgetIdentifiable *widgetIdentifiable;
  void *v11;
  void *v12;
  void *v13;
  ATXHomeScreenWidgetIdentifiable *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (-[APUIWidgetViewController effectiveViewVisibility](self, "effectiveViewVisibility"))
  {
    if (objc_msgSend(v18, "count"))
    {
      widgetIdentifiable = self->_widgetIdentifiable;
      -[APUIWidgetViewController layout](self, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logSuggestionsDidAppear:widget:blendingCacheId:", v18, widgetIdentifiable, v13);

    }
    if (objc_msgSend(v8, "count"))
    {
      v14 = self->_widgetIdentifiable;
      -[APUIWidgetViewController layout](self, "layout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logSuggestionsDidDisappear:widget:blendingCacheId:", v8, v14, v17);

    }
  }

}

- (BOOL)isCurrentlyVisible
{
  _BOOL4 v3;

  v3 = -[APUIWidgetViewController isViewVisible](self, "isViewVisible");
  if (v3)
    LOBYTE(v3) = -[APUIWidgetViewController stackVisible](self, "stackVisible");
  return v3;
}

- (void)setStackVisible:(BOOL)a3
{
  if (self->_stackVisible != a3)
  {
    self->_stackVisible = a3;
    -[APUIWidgetViewController _updateViewVisibility](self, "_updateViewVisibility");
  }
}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    -[APUIWidgetViewController _updateViewVisibility](self, "_updateViewVisibility");
  }
}

- (void)_updateViewVisibility
{
  _BOOL4 v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = -[APUIWidgetViewController effectiveViewVisibility](self, "effectiveViewVisibility");
  v4 = -[APUIWidgetViewController isCurrentlyVisible](self, "isCurrentlyVisible");
  if (v3 != v4)
  {
    -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController layout](self, "layout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logWidgetDidAppear:blendingCacheId:", v6, v9);

      -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController layout](self, "layout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logSuggestionsDidAppear:widget:blendingCacheId:", v11, v12, v15);

    }
    else
    {
      -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController layout](self, "layout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logSuggestionsDidDisappear:widget:blendingCacheId:", v16, v17, v20);

      -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController layout](self, "layout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logWidgetDidDisappear:blendingCacheId:", v11, v14);
    }

  }
  -[APUIWidgetViewController setEffectiveViewVisibility:](self, "setEffectiveViewVisibility:", v4);
}

+ (id)imageForIconSize:(CGSize)a3 scale:(double)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("siri"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)smartStackImageForIconSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];

  height = a3.height;
  width = a3.width;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("smart-stack"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BE51A80]);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "CGImage");
  objc_msgSend(v11, "scale");
  v13 = (void *)objc_msgSend(v10, "initWithCGImage:scale:", v12);
  v14 = objc_alloc(MEMORY[0x24BE51A90]);
  v24[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithImages:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", width, height, a4);
  objc_msgSend(v16, "imageForDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "placeholder"))
  {
    objc_msgSend(v16, "prepareImageForDescriptor:", v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  v20 = (void *)MEMORY[0x24BDF6AC8];
  v21 = objc_msgSend(v18, "CGImage");
  objc_msgSend(v18, "scale");
  objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (BOOL)effectiveViewVisibility
{
  return self->_effectiveViewVisibility;
}

- (void)setEffectiveViewVisibility:(BOOL)a3
{
  self->_effectiveViewVisibility = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (ATXSuggestionLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (BOOL)stackVisible
{
  return self->_stackVisible;
}

- (ATXHomeScreenSuggestionClient)suggestionClient
{
  return self->_suggestionClient;
}

- (void)setSuggestionClient:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionClient, a3);
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIds, a3);
}

- (ATXHomeScreenWidgetIdentifiable)widgetIdentifiable
{
  return self->_widgetIdentifiable;
}

- (void)setWidgetIdentifiable:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifiable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifiable, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_suggestionClient, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

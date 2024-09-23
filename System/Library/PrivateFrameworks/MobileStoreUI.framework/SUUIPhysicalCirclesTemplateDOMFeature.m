@implementation SUUIPhysicalCirclesTemplateDOMFeature

- (SUUIPhysicalCirclesTemplateDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  SUUIPhysicalCirclesTemplateDOMFeature *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIPhysicalCirclesTemplateDOMFeature;
  v8 = -[SUUIPhysicalCirclesTemplateDOMFeature init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

  }
  return v8;
}

- (void)finishDOMUpdates
{
  void *v3;
  NSMutableArray *domUpdateBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_domUpdateBlocks, "copy");
  domUpdateBlocks = self->_domUpdateBlocks;
  self->_domUpdateBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)popPendingAnimationRequests
{
  void *v3;
  NSMutableArray *pendingAnimationRequests;

  v3 = (void *)-[NSMutableArray copy](self->_pendingAnimationRequests, "copy");
  pendingAnimationRequests = self->_pendingAnimationRequests;
  self->_pendingAnimationRequests = 0;

  return v3;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  SUUIJSPhysicalCirclesTemplate *v4;
  void *v5;
  SUUIJSPhysicalCirclesTemplate *v6;

  v3 = a3;
  v4 = [SUUIJSPhysicalCirclesTemplate alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIJSPhysicalCirclesTemplate initWithAppContext:DOMFeature:](v4, "initWithAppContext:DOMFeature:", v5, v3);

  return v6;
}

+ (id)featureName
{
  return CFSTR("CirclesContainer");
}

- (void)_addDOMUpdateBlock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *domUpdateBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!self->_domUpdateBlocks)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    domUpdateBlocks = self->_domUpdateBlocks;
    self->_domUpdateBlocks = v5;

    v4 = v10;
  }
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = self->_domUpdateBlocks;
  v9 = _Block_copy(v7);
  -[NSMutableArray addObject:](v8, "addObject:", v9);

}

- (void)_requestAnimation:(id)a3
{
  void *v4;
  NSMutableArray *pendingAnimationRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  -[SUUIPhysicalCirclesTemplateDOMFeature delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "physicalCirclesDOMFeature:didRequestAnimation:", self, v8);
  }
  else
  {
    pendingAnimationRequests = self->_pendingAnimationRequests;
    if (!pendingAnimationRequests)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_pendingAnimationRequests;
      self->_pendingAnimationRequests = v6;

      pendingAnimationRequests = self->_pendingAnimationRequests;
    }
    -[NSMutableArray addObject:](pendingAnimationRequests, "addObject:", v8);
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (SUUIPhysicalCirclesTemplateDelegate)delegate
{
  return (SUUIPhysicalCirclesTemplateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnimationRequests, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domUpdateBlocks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
}

@end

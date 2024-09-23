@implementation AMSUIWebFlowAction

- (AMSUIWebFlowAction)initWithContext:(id)a3
{
  AMSUIWebFlowAction *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebFlowAction;
  result = -[AMSUIWebAction initWithContext:](&v4, sel_initWithContext_, a3);
  if (result)
    result->_presentationType = 5;
  return result;
}

- (AMSUIWebFlowAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebFlowAction *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id actionData;
  void *v15;
  NSString *v16;
  NSString *backgroundColor;
  void *v18;
  NSDictionary *v19;
  NSDictionary *metrics;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  AMSUIWebLoadingPageModel *v27;
  AMSUIWebLoadingPageModel *loadingPage;
  void *v29;
  id v30;
  AMSUIWebNavigationBarModel *v31;
  AMSUIWebNavigationBarModel *navigationBar;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  AMSUIWebPageProvider *replacementPage;
  void *v40;
  void *v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)AMSUIWebFlowAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v43, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animationType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v42 = v10;
    v11 = objc_msgSend(v10, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    actionData = v8->_actionData;
    v8->_actionData = v13;

    v8->_animationType = v11;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = v16;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metrics"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    metrics = v8->_metrics;
    v8->_metrics = v19;

    +[AMSUIWebModel windowSizeFromJSObject:key:](AMSUIWebModel, "windowSizeFromJSObject:key:", v6, CFSTR("modalWindowSize"));
    v8->_modalWindowSize.width = v21;
    v8->_modalWindowSize.height = v22;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deferredPresentation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = objc_msgSend(v23, "BOOLValue");
    else
      v24 = 0;
    v8->_deferredPresentation = v24;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loadingPage"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    v27 = -[AMSUIWebLoadingPageModel initWithJSObject:context:]([AMSUIWebLoadingPageModel alloc], "initWithJSObject:context:", v26, v7);
    loadingPage = v8->_loadingPage;
    v8->_loadingPage = v27;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("navigationBar"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    v31 = -[AMSUIWebNavigationBarModel initWithJSObject:context:]([AMSUIWebNavigationBarModel alloc], "initWithJSObject:context:", v30, v7);
    navigationBar = v8->_navigationBar;
    v8->_navigationBar = v31;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("popToRelativeIndex"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("popToRelativeIndex"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_popToRelativeIndex = objc_msgSend(v34, "longLongValue");

    }
    else
    {
      v8->_popToRelativeIndex = 0x8000000000000000;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("presentationType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8->_presentationType = objc_msgSend(v35, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("replacementPage"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;

    if (v37)
    {
      +[AMSUIWebModel pageModelFromJSObject:context:](AMSUIWebModel, "pageModelFromJSObject:context:", v37, v7);
      v38 = objc_claimAutoreleasedReturnValue();
      replacementPage = v8->_replacementPage;
      v8->_replacementPage = (AMSUIWebPageProvider *)v38;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("replacementType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8->_replacementType = objc_msgSend(v40, "integerValue");

  }
  return v8;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  AMSUIWebFlowOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AMSUIWebFlowOptions *v15;
  void *v16;
  int64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  AMSUIWebFlowAction *v24;
  AMSUIWebFlowOptions *v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebFlowAction;
  v3 = -[AMSUIWebAction runAction](&v26, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSUIWebFlowAction presentationType](self, "presentationType");
    *(_DWORD *)buf = 138543874;
    v28 = v6;
    v29 = 2114;
    v30 = v7;
    v31 = 2048;
    v32 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running flow action with type: %ld", buf, 0x20u);

  }
  -[AMSUIWebAction context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "bootstrapComplete") & 1) != 0
    || -[AMSUIWebFlowAction presentationType](self, "presentationType") == 4)
  {

  }
  else
  {
    v18 = -[AMSUIWebFlowAction presentationType](self, "presentationType");

    if (v18 != 5)
    {
      v19 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v15 = (AMSUIWebFlowOptions *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "promiseWithError:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v10 = objc_alloc_init(AMSUIWebFlowOptions);
  -[AMSUIWebFlowOptions setAnimated:](v10, "setAnimated:", -[AMSUIWebFlowAction animationType](self, "animationType") != 0);
  -[AMSUIWebFlowAction backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowOptions setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[AMSUIWebFlowAction loadingPage](self, "loadingPage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowOptions setLoadingPage:](v10, "setLoadingPage:", v12);

  -[AMSUIWebFlowAction navigationBar](self, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowOptions setNavigationBar:](v10, "setNavigationBar:", v13);

  -[AMSUIWebFlowAction actionData](self, "actionData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowOptions setPageData:](v10, "setPageData:", v14);

  -[AMSUIWebFlowOptions setDeferredPresentation:](v10, "setDeferredPresentation:", -[AMSUIWebFlowAction deferredPresentation](self, "deferredPresentation"));
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __31__AMSUIWebFlowAction_runAction__block_invoke;
  v23 = &unk_24CB4F4C0;
  v24 = self;
  v25 = v10;
  v15 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], &v20);
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8], v20, v21, v22, v23, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v16;
}

uint64_t __31__AMSUIWebFlowAction_runAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runWithType:options:", objc_msgSend(*(id *)(a1 + 32), "presentationType"), *(_QWORD *)(a1 + 40));
}

- (void)_runWithType:(int64_t)a3 options:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  -[AMSUIWebAction context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[AMSUIWebFlowAction presentationType](self, "presentationType"))
  {
    case 0:
      if (-[AMSUIWebFlowAction replacementType](self, "replacementType"))
      {
        -[AMSUIWebFlowAction replacementPage](self, "replacementPage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIWebAction context](self, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "flowController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v6, "replaceWithPageModel:forContainer:options:", v7, v10, v16);

      }
      else
      {
        -[AMSUIWebAction context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "flowController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v6, "refreshPageForContainer:options:", v14, v16);

      }
      break;
    case 1:
    case 3:
      objc_msgSend(v16, "setModalPresentationStyle:", -[AMSUIWebFlowAction presentationType](self, "presentationType") != 3);
      objc_msgSend(v16, "setModalTransitionStyle:", -[AMSUIWebFlowAction animationType](self, "animationType") == 2);
      -[AMSUIWebFlowAction modalWindowSize](self, "modalWindowSize");
      objc_msgSend(v16, "setModalWindowSize:");
      objc_msgSend(v6, "presentWithOptions:", v16);
      break;
    case 2:
      objc_msgSend(v6, "pushWithOptions:", v16);
      break;
    case 4:
      objc_msgSend(v6, "dismissViewController");
      break;
    case 5:
      if (-[AMSUIWebFlowAction popToRelativeIndex](self, "popToRelativeIndex") == 0x8000000000000000)
        objc_msgSend(v6, "popViewController");
      else
        objc_msgSend(v6, "popViewControllerToRelativeIndex:", -[AMSUIWebFlowAction popToRelativeIndex](self, "popToRelativeIndex"));
      break;
    default:
      break;
  }

}

- (id)actionData
{
  return self->_actionData;
}

- (void)setActionData:(id)a3
{
  objc_storeStrong(&self->_actionData, a3);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)deferredPresentation
{
  return self->_deferredPresentation;
}

- (void)setDeferredPresentation:(BOOL)a3
{
  self->_deferredPresentation = a3;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (AMSUIWebLoadingPageModel)loadingPage
{
  return self->_loadingPage;
}

- (void)setLoadingPage:(id)a3
{
  objc_storeStrong((id *)&self->_loadingPage, a3);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (CGSize)modalWindowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_modalWindowSize.width;
  height = self->_modalWindowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setModalWindowSize:(CGSize)a3
{
  self->_modalWindowSize = a3;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (int64_t)popToRelativeIndex
{
  return self->_popToRelativeIndex;
}

- (void)setPopToRelativeIndex:(int64_t)a3
{
  self->_popToRelativeIndex = a3;
}

- (int64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(int64_t)a3
{
  self->_presentationType = a3;
}

- (AMSUIWebPageProvider)replacementPage
{
  return self->_replacementPage;
}

- (void)setReplacementPage:(id)a3
{
  objc_storeStrong((id *)&self->_replacementPage, a3);
}

- (int64_t)replacementType
{
  return self->_replacementType;
}

- (void)setReplacementType:(int64_t)a3
{
  self->_replacementType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementPage, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_loadingPage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong(&self->_actionData, 0);
}

@end

@implementation AMSEngagementMessageAction

- (AMSEngagementMessageAction)initWithJSObject:(id)a3
{
  id v4;
  AMSEngagementMessageAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  NSURL *deepLink;
  uint64_t v25;
  NSURL *iconURL;
  AMSMetricsEvent *v27;
  AMSMetricsEvent *metricsEvent;
  int64_t v29;
  NSString *title;
  AMSEngagementMessageAction *v31;
  id v33;
  id v34;
  id obj;
  id v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AMSEngagementMessageAction;
  v5 = -[AMSEngagementMessageAction init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clickstreamMetricsEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v6;
    else
      v33 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deepLink"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v7;
    else
      v36 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      obj = v8;
    else
      obj = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v9;
    else
      v34 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricsEvent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v33;

    if (v33)
      objc_storeStrong((id *)&v5->_clickstreamMetricsEvent, v33);
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v23 = objc_claimAutoreleasedReturnValue();
      deepLink = v5->_deepLink;
      v5->_deepLink = (NSURL *)v23;

    }
    objc_storeStrong((id *)&v5->_identifier, obj);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v25 = objc_claimAutoreleasedReturnValue();
      iconURL = v5->_iconURL;
      v5->_iconURL = (NSURL *)v25;

    }
    objc_storeStrong((id *)&v5->_kind, v34);
    if (v15)
    {
      v27 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v15);
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v27;

    }
    v5->_requiresDelegate = objc_msgSend(v13, "BOOLValue", v33);
    objc_storeStrong((id *)&v5->_parameters, v17);
    if (v19)
      v29 = (int)objc_msgSend(v19, "intValue");
    else
      v29 = 0;
    title = v5->_title;
    v5->_style = v29;
    v5->_title = v21;

    if (!v5->_deepLink && !v5->_requiresDelegate)
    {

      v31 = 0;
      goto LABEL_47;
    }

  }
  v31 = v5;
LABEL_47:

  return v31;
}

- (id)makeDialogAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[AMSEngagementMessageAction title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDialogAction actionWithTitle:](AMSDialogAction, "actionWithTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSEngagementMessageAction clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClickstreamMetricsEvent:", v5);

  -[AMSEngagementMessageAction deepLink](self, "deepLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeepLink:", v6);

  -[AMSEngagementMessageAction iconURL](self, "iconURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconURL:", v7);

  -[AMSEngagementMessageAction kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKind:", v8);

  -[AMSEngagementMessageAction metricsEvent](self, "metricsEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetricsEvent:", v9);

  -[AMSEngagementMessageAction parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v10);

  objc_msgSend(v4, "setRequiresDelegate:", -[AMSEngagementMessageAction requiresDelegate](self, "requiresDelegate"));
  objc_msgSend(v4, "setStyle:", -[AMSEngagementMessageAction style](self, "style"));
  -[AMSEngagementMessageAction identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSEngagementMessageAction identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v12);

  }
  return v4;
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)deepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(id)a3
{
  objc_storeStrong((id *)&self->_deepLink, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)requiresDelegate
{
  return self->_requiresDelegate;
}

- (void)setRequiresDelegate:(BOOL)a3
{
  self->_requiresDelegate = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
}

@end

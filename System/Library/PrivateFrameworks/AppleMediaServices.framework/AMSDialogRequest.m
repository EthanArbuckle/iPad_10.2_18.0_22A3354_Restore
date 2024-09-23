@implementation AMSDialogRequest

- (AMSDialogRequest)init
{
  AMSDialogRequest *v2;
  NSDictionary *v3;
  NSDictionary *userInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSDialogRequest;
  v2 = -[AMSDialogRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v2->_userInfo;
    v2->_userInfo = v3;

  }
  return v2;
}

- (AMSDialogRequest)initWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSDialogRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "ams_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AMSDialogRequest initWithTitle:message:](self, "initWithTitle:message:", v5, v6);
  return v7;
}

- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  AMSDialogRequest *v9;
  AMSDialogRequest *v10;
  uint64_t v11;
  NSString *logKey;

  v7 = a3;
  v8 = a4;
  v9 = -[AMSDialogRequest init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    AMSSetLogKeyIfNeeded();
    v11 = objc_claimAutoreleasedReturnValue();
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

+ (AMSDialogRequest)requestWithTitle:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:message:", v6, v5);

  return (AMSDialogRequest *)v7;
}

- (AMSDialogRequest)initWithTitle:(id)a3 message:(id)a4 appearanceInfo:(id)a5
{
  id v9;
  AMSDialogRequest *v10;
  AMSDialogRequest *v11;

  v9 = a5;
  v10 = -[AMSDialogRequest initWithTitle:message:](self, "initWithTitle:message:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_appearanceInfo, a5);

  return v11;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (os_variant_has_internal_content())
  {
    -[AMSDialogRequest title](self, "title");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("<private>");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AMSDialogRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest defaultAction](self, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDialogRequest buttonActions](self, "buttonActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{ id: %@, title: %@, default: %@, actions: %@ }"), v5, v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSDialogRequest buttonActions](self, "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[AMSDialogRequest setButtonActions:](self, "setButtonActions:", v9);

}

- (void)addTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSDialogRequest textFields](self, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[AMSDialogRequest setTextFields:](self, "setTextFields:", v9);

}

- (id)locateActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_15;
  }
  -[AMSDialogRequest defaultAction](self, "defaultAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (!v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[AMSDialogRequest buttonActions](self, "buttonActions", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v4);

          if ((v16 & 1) != 0)
          {
            v8 = v14;

            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
  -[AMSDialogRequest defaultAction](self, "defaultAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v8;
}

- (void)replaceAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AMSDialogRequest defaultAction](self, "defaultAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
      -[AMSDialogRequest setDefaultAction:](self, "setDefaultAction:", v19);
    -[AMSDialogRequest buttonActions](self, "buttonActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      while (1)
      {
        -[AMSDialogRequest buttonActions](self, "buttonActions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
          break;

        ++v10;
        -[AMSDialogRequest buttonActions](self, "buttonActions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v10 >= v16)
          goto LABEL_10;
      }
      -[AMSDialogRequest buttonActions](self, "buttonActions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "setObject:atIndexedSubscript:", v19, v10);
      -[AMSDialogRequest setButtonActions:](self, "setButtonActions:", v18);

    }
  }
LABEL_10:

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[AMSDialogRequest appearanceInfo](self, "appearanceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSDialogRequest appearanceInfo](self, "appearanceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v5, CFSTR("kCodingKeyAppearanceInfo"));

  }
  -[AMSDialogRequest buttonActions](self, "buttonActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSDialogRequest buttonActions](self, "buttonActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v7, CFSTR("kCodingKeyButtonActions"));

  }
  -[AMSDialogRequest clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSDialogRequest clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v9, CFSTR("kCodingKeyClickstreamMetricsEvent"));

  }
  -[AMSDialogRequest defaultAction](self, "defaultAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSDialogRequest defaultAction](self, "defaultAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v11, CFSTR("kCodingKeyDefaultAction"));

  }
  -[AMSDialogRequest iconURL](self, "iconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSDialogRequest iconURL](self, "iconURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v13, CFSTR("kCodingKeyIconURL"));

  }
  -[AMSDialogRequest identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSDialogRequest identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v15, CFSTR("kCodingKeyIdentifier"));

  }
  -[AMSDialogRequest logKey](self, "logKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSDialogRequest logKey](self, "logKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v17, CFSTR("kCodingKeyLogKey"));

  }
  -[AMSDialogRequest message](self, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSDialogRequest message](self, "message");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v19, CFSTR("kCodingKeyMessage"));

  }
  -[AMSDialogRequest messageAccessibilityLabel](self, "messageAccessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSDialogRequest messageAccessibilityLabel](self, "messageAccessibilityLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v21, CFSTR("kCodingKeyMessageAccessibilityLabel"));

  }
  -[AMSDialogRequest metricsEvent](self, "metricsEvent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AMSDialogRequest metricsEvent](self, "metricsEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "underlyingDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v24, CFSTR("kCodingKeyMetrics"));

  }
  objc_msgSend(v35, "encodeInteger:forKey:", -[AMSDialogRequest style](self, "style"), CFSTR("kCodingKeyStyle"));
  -[AMSDialogRequest preferredButtonActionIdentifier](self, "preferredButtonActionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[AMSDialogRequest preferredButtonActionIdentifier](self, "preferredButtonActionIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v26, CFSTR("preferredButtonActionIdentifier"));

  }
  objc_msgSend(v35, "encodeBool:forKey:", -[AMSDialogRequest preventsCancelButtonStyle](self, "preventsCancelButtonStyle"), CFSTR("kPreventsCancelButtonStyle"));
  -[AMSDialogRequest textFields](self, "textFields");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[AMSDialogRequest textFields](self, "textFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v28, CFSTR("kCodingKeyTextFields"));

  }
  -[AMSDialogRequest title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[AMSDialogRequest title](self, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v30, CFSTR("kCodingKeyTitle"));

  }
  -[AMSDialogRequest titleAccessibilityLabel](self, "titleAccessibilityLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[AMSDialogRequest titleAccessibilityLabel](self, "titleAccessibilityLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v32, CFSTR("kCodingKeyTitleAccessibilityLabel"));

  }
  -[AMSDialogRequest userInfo](self, "userInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[AMSDialogRequest userInfo](self, "userInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "encodeObject:forKey:", v34, CFSTR("kCodingKeyUserInfo"));

  }
}

- (AMSDialogRequest)initWithCoder:(id)a3
{
  id v4;
  AMSDialogRequest *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *appearanceInfo;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *buttonActions;
  void *v14;
  uint64_t v15;
  NSDictionary *clickstreamMetricsEvent;
  uint64_t v17;
  AMSDialogAction *defaultAction;
  uint64_t v19;
  NSURL *iconURL;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *logKey;
  uint64_t v25;
  NSString *message;
  uint64_t v27;
  NSString *messageAccessibilityLabel;
  void *v29;
  void *v30;
  AMSMetricsEvent *v31;
  AMSMetricsEvent *metricsEvent;
  uint64_t v33;
  NSString *preferredButtonActionIdentifier;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *textFields;
  uint64_t v40;
  NSString *title;
  uint64_t v42;
  NSString *titleAccessibilityLabel;
  void *v44;
  void *v45;
  void *v46;
  NSDictionary *v47;
  NSDictionary *userInfo;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)AMSDialogRequest;
  v5 = -[AMSDialogRequest init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyAppearanceInfo"));
    v7 = objc_claimAutoreleasedReturnValue();
    appearanceInfo = v5->_appearanceInfo;
    v5->_appearanceInfo = (NSDictionary *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kCodingKeyButtonActions"));
    v12 = objc_claimAutoreleasedReturnValue();
    buttonActions = v5->_buttonActions;
    v5->_buttonActions = (NSArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kCodingKeyClickstreamMetricsEvent"));
    v15 = objc_claimAutoreleasedReturnValue();
    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyDefaultAction"));
    v17 = objc_claimAutoreleasedReturnValue();
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (AMSDialogAction *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyIconURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyMessage"));
    v25 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyMessageAccessibilityLabel"));
    v27 = objc_claimAutoreleasedReturnValue();
    messageAccessibilityLabel = v5->_messageAccessibilityLabel;
    v5->_messageAccessibilityLabel = (NSString *)v27;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("kCodingKeyMetrics"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v30);
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v31;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredButtonActionIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    preferredButtonActionIdentifier = v5->_preferredButtonActionIdentifier;
    v5->_preferredButtonActionIdentifier = (NSString *)v33;

    v5->_preventsCancelButtonStyle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPreventsCancelButtonStyle"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyStyle"));
    v35 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("kCodingKeyTextFields"));
    v38 = objc_claimAutoreleasedReturnValue();
    textFields = v5->_textFields;
    v5->_textFields = (NSArray *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyTitle"));
    v40 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyTitleAccessibilityLabel"));
    v42 = objc_claimAutoreleasedReturnValue();
    titleAccessibilityLabel = v5->_titleAccessibilityLabel;
    v5->_titleAccessibilityLabel = (NSString *)v42;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("kCodingKeyUserInfo"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
      v47 = v45;
    else
      v47 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v5->_userInfo;
    v5->_userInfo = v47;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSDialogRequest *v5;
  uint64_t v6;
  NSDictionary *appearanceInfo;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v5 = -[AMSDialogRequest init](+[AMSDialogRequest allocWithZone:](AMSDialogRequest, "allocWithZone:"), "init");
  -[AMSDialogRequest appearanceInfo](self, "appearanceInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  appearanceInfo = v5->_appearanceInfo;
  v5->_appearanceInfo = (NSDictionary *)v6;

  -[AMSDialogRequest buttonActions](self, "buttonActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSDialogRequest buttonActions](self, "buttonActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
    -[AMSDialogRequest setButtonActions:](v5, "setButtonActions:", v10);

  }
  -[AMSDialogRequest clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSDialogRequest clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    -[AMSDialogRequest setClickstreamMetricsEvent:](v5, "setClickstreamMetricsEvent:", v13);

  }
  -[AMSDialogRequest defaultAction](self, "defaultAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSDialogRequest defaultAction](self, "defaultAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
    -[AMSDialogRequest setDefaultAction:](v5, "setDefaultAction:", v16);

  }
  -[AMSDialogRequest iconURL](self, "iconURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AMSDialogRequest iconURL](self, "iconURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    -[AMSDialogRequest setIconURL:](v5, "setIconURL:", v19);

  }
  -[AMSDialogRequest identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSDialogRequest identifier](self, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copyWithZone:", a3);
    -[AMSDialogRequest setIdentifier:](v5, "setIdentifier:", v22);

  }
  -[AMSDialogRequest logKey](self, "logKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSDialogRequest logKey](self, "logKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
    -[AMSDialogRequest setLogKey:](v5, "setLogKey:", v25);

  }
  -[AMSDialogRequest message](self, "message");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AMSDialogRequest message](self, "message");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copyWithZone:", a3);
    -[AMSDialogRequest setMessage:](v5, "setMessage:", v28);

  }
  -[AMSDialogRequest messageAccessibilityLabel](self, "messageAccessibilityLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[AMSDialogRequest messageAccessibilityLabel](self, "messageAccessibilityLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
    -[AMSDialogRequest setMessage:](v5, "setMessage:", v31);

  }
  -[AMSDialogRequest metricsEvent](self, "metricsEvent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AMSDialogRequest metricsEvent](self, "metricsEvent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copyWithZone:", a3);
    -[AMSDialogRequest setMetricsEvent:](v5, "setMetricsEvent:", v34);

  }
  -[AMSDialogRequest preferredButtonActionIdentifier](self, "preferredButtonActionIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[AMSDialogRequest preferredButtonActionIdentifier](self, "preferredButtonActionIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
    -[AMSDialogRequest setPreferredButtonActionIdentifier:](v5, "setPreferredButtonActionIdentifier:", v37);

  }
  -[AMSDialogRequest setPreventsCancelButtonStyle:](v5, "setPreventsCancelButtonStyle:", -[AMSDialogRequest preventsCancelButtonStyle](self, "preventsCancelButtonStyle"));
  -[AMSDialogRequest setStyle:](v5, "setStyle:", -[AMSDialogRequest style](self, "style"));
  -[AMSDialogRequest textFields](self, "textFields");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[AMSDialogRequest textFields](self, "textFields");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copyWithZone:", a3);
    -[AMSDialogRequest setTextFields:](v5, "setTextFields:", v40);

  }
  -[AMSDialogRequest title](self, "title");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[AMSDialogRequest title](self, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copyWithZone:", a3);
    -[AMSDialogRequest setTitle:](v5, "setTitle:", v43);

  }
  -[AMSDialogRequest titleAccessibilityLabel](self, "titleAccessibilityLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[AMSDialogRequest titleAccessibilityLabel](self, "titleAccessibilityLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copyWithZone:", a3);
    -[AMSDialogRequest setTitle:](v5, "setTitle:", v46);

  }
  -[AMSDialogRequest userInfo](self, "userInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[AMSDialogRequest userInfo](self, "userInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copyWithZone:", a3);
    -[AMSDialogRequest setUserInfo:](v5, "setUserInfo:", v49);

  }
  return v5;
}

- (BOOL)allowsNativeWatchCancelPlacement
{
  return self->_allowsNativeWatchCancelPlacement;
}

- (void)setAllowsNativeWatchCancelPlacement:(BOOL)a3
{
  self->_allowsNativeWatchCancelPlacement = a3;
}

- (NSDictionary)appearanceInfo
{
  return self->_appearanceInfo;
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AMSDialogAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AMSDialogAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (NSURL)iconBundleURL
{
  return self->_iconBundleURL;
}

- (void)setIconBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)messageAccessibilityLabel
{
  return self->_messageAccessibilityLabel;
}

- (void)setMessageAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)preferredButtonActionIdentifier
{
  return self->_preferredButtonActionIdentifier;
}

- (void)setPreferredButtonActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)preventsCancelButtonStyle
{
  return self->_preventsCancelButtonStyle;
}

- (void)setPreventsCancelButtonStyle:(BOOL)a3
{
  self->_preventsCancelButtonStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setTextFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)titleAccessibilityLabel
{
  return self->_titleAccessibilityLabel;
}

- (void)setTitleAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_titleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_preferredButtonActionIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_messageAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconBundleURL, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
}

@end

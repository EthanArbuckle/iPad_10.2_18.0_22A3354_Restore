@implementation AMSDialogAction

- (AMSDialogAction)init
{
  AMSDialogAction *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  NSMutableDictionary *v6;
  NSMutableDictionary *userInfo;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSDialogAction;
  v2 = -[AMSDialogAction init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v2->_inferLinkDestination = 1;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v2->_userInfo;
    v2->_userInfo = v6;

  }
  return v2;
}

+ (id)actionWithTitle:(id)a3
{
  return (id)objc_msgSend(a1, "actionWithTitle:identifier:", a3, 0);
}

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4
{
  void *v5;

  objc_msgSend(a1, "actionWithTitle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", a4);
  return v5;
}

+ (id)actionWithTitle:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setTitle:", v6);

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "setIdentifier:", v5);

  return v7;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  if (os_variant_has_internal_content())
  {
    -[AMSDialogAction kind](self, "kind");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogAction title](self, "title");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogAction parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[AMSDialogAction deepLink](self, "deepLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("<private>");
    v4 = CFSTR("<private>");
    v3 = CFSTR("<private>");
    v6 = CFSTR("<private>");
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[AMSDialogAction identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("{ id: %@, kind: %@, parameters: %@, title: %@, url: %@ }"), v10, v3, v6, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  id v27;

  v27 = a3;
  -[AMSDialogAction clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSDialogAction clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v5, CFSTR("kCodingKeyClickstreamMetricsEvent"));

  }
  -[AMSDialogAction deepLink](self, "deepLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSDialogAction deepLink](self, "deepLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v7, CFSTR("kCodingKeyDeepLink"));

  }
  -[AMSDialogAction dialogRequest](self, "dialogRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSDialogAction dialogRequest](self, "dialogRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v9, CFSTR("kCodingKeyDialogRequest"));

  }
  -[AMSDialogAction iconURL](self, "iconURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSDialogAction request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v11, CFSTR("kCodingKeyIconURL"));

  }
  -[AMSDialogAction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSDialogAction identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v13, CFSTR("kCodingKeyIdentifier"));

  }
  -[AMSDialogAction kind](self, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSDialogAction kind](self, "kind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v15, CFSTR("kCodingKeyKind"));

  }
  -[AMSDialogAction metricsEvent](self, "metricsEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSDialogAction metricsEvent](self, "metricsEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "underlyingDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v18, CFSTR("kCodingKeyMetrics"));

  }
  -[AMSDialogAction parameters](self, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AMSDialogAction parameters](self, "parameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v20, CFSTR("kCodingKeyParameters"));

  }
  -[AMSDialogAction request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AMSDialogAction request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v22, CFSTR("kCodingKeyRequest"));

  }
  if (-[AMSDialogAction requiresDelegate](self, "requiresDelegate"))
    objc_msgSend(v27, "encodeBool:forKey:", -[AMSDialogAction requiresDelegate](self, "requiresDelegate"), CFSTR("kCodingKeyRequiresDelegate"));
  objc_msgSend(v27, "encodeBool:forKey:", -[AMSDialogAction inferLinkDestination](self, "inferLinkDestination"), CFSTR("kCodingKeyInferLinkDest"));
  objc_msgSend(v27, "encodeBool:forKey:", -[AMSDialogAction shouldRetry](self, "shouldRetry"), CFSTR("kCodingKeyRetry"));
  objc_msgSend(v27, "encodeInteger:forKey:", -[AMSDialogAction style](self, "style"), CFSTR("kCodingKeyStyle"));
  -[AMSDialogAction title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSDialogAction title](self, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v24, CFSTR("kCodingKeyTitle"));

  }
  -[AMSDialogAction userInfo](self, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[AMSDialogAction userInfo](self, "userInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v26, CFSTR("kCodingKeyUserInfo"));

  }
}

- (AMSDialogAction)initWithCoder:(id)a3
{
  id v4;
  AMSDialogAction *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *clickstreamMetricsEvent;
  uint64_t v9;
  NSURL *deepLink;
  uint64_t v11;
  AMSDialogRequest *dialogRequest;
  uint64_t v13;
  NSURL *iconURL;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *kind;
  void *v19;
  void *v20;
  AMSMetricsEvent *v21;
  AMSMetricsEvent *metricsEvent;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *parameters;
  uint64_t v28;
  NSURLRequest *request;
  uint64_t v30;
  NSString *title;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *userInfo;
  objc_super v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AMSDialogAction;
  v5 = -[AMSDialogAction init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyClickstreamMetricsEvent"));
    v7 = objc_claimAutoreleasedReturnValue();
    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = (NSDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyDeepLink"));
    v9 = objc_claimAutoreleasedReturnValue();
    deepLink = v5->_deepLink;
    v5->_deepLink = (NSURL *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyDialogRequest"));
    v11 = objc_claimAutoreleasedReturnValue();
    dialogRequest = v5->_dialogRequest;
    v5->_dialogRequest = (AMSDialogRequest *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyIconURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

    v5->_inferLinkDestination = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeyInferLinkDest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyKind"));
    v17 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("kCodingKeyMetrics"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v20);
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v21;

    }
    v23 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("kCodingKeyParameters"));
    v26 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyRequest"));
    v28 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (NSURLRequest *)v28;

    v5->_requiresDelegate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeyRequiresDelegate"));
    v5->_shouldRetry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeyRetry"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyTitle"));
    v30 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v30;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("kCodingKeyUserInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");
    v35 = v34;
    if (v34)
      v36 = v34;
    else
      v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v5->_userInfo;
    v5->_userInfo = v36;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSDialogAction *v5;
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
  void *v35;

  v5 = -[AMSDialogAction init](+[AMSDialogAction allocWithZone:](AMSDialogAction, "allocWithZone:"), "init");
  -[AMSDialogAction clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSDialogAction clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogAction setClickstreamMetricsEvent:](v5, "setClickstreamMetricsEvent:", v7);

  }
  -[AMSDialogAction deepLink](self, "deepLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSDialogAction deepLink](self, "deepLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
    -[AMSDialogAction setDeepLink:](v5, "setDeepLink:", v10);

  }
  -[AMSDialogAction dialogRequest](self, "dialogRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSDialogAction dialogRequest](self, "dialogRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    -[AMSDialogAction setDialogRequest:](v5, "setDialogRequest:", v13);

  }
  -[AMSDialogAction identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSDialogAction identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
    -[AMSDialogAction setIdentifier:](v5, "setIdentifier:", v16);

  }
  -[AMSDialogAction kind](self, "kind");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[AMSDialogAction kind](self, "kind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    -[AMSDialogAction setKind:](v5, "setKind:", v19);

  }
  -[AMSDialogAction metricsEvent](self, "metricsEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSDialogAction metricsEvent](self, "metricsEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copyWithZone:", a3);
    -[AMSDialogAction setMetricsEvent:](v5, "setMetricsEvent:", v22);

  }
  -[AMSDialogAction parameters](self, "parameters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSDialogAction parameters](self, "parameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
    -[AMSDialogAction setParameters:](v5, "setParameters:", v25);

  }
  -[AMSDialogAction request](self, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AMSDialogAction request](self, "request");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copyWithZone:", a3);
    -[AMSDialogAction setRequest:](v5, "setRequest:", v28);

  }
  -[AMSDialogAction setRequiresDelegate:](v5, "setRequiresDelegate:", -[AMSDialogAction requiresDelegate](self, "requiresDelegate"));
  -[AMSDialogAction setInferLinkDestination:](v5, "setInferLinkDestination:", -[AMSDialogAction inferLinkDestination](self, "inferLinkDestination"));
  -[AMSDialogAction setShouldRetry:](v5, "setShouldRetry:", -[AMSDialogAction shouldRetry](self, "shouldRetry"));
  -[AMSDialogAction setStyle:](v5, "setStyle:", -[AMSDialogAction style](self, "style"));
  -[AMSDialogAction title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[AMSDialogAction title](self, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
    -[AMSDialogAction setTitle:](v5, "setTitle:", v31);

  }
  -[AMSDialogAction userInfo](self, "userInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AMSDialogAction userInfo](self, "userInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copyWithZone:", a3);
    v35 = (void *)objc_msgSend(v34, "mutableCopy");
    -[AMSDialogAction setUserInfo:](v5, "setUserInfo:", v35);

  }
  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)inferLinkDestination
{
  return self->_inferLinkDestination;
}

- (void)setInferLinkDestination:(BOOL)a3
{
  self->_inferLinkDestination = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)requiresDelegate
{
  return self->_requiresDelegate;
}

- (void)setRequiresDelegate:(BOOL)a3
{
  self->_requiresDelegate = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deepLink, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
}

- (int64_t)ams_actionType
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (void)ams_setActionType:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyType"));

}

- (NSString)ams_buyParams
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDialogAction ams_buttonDictionary](self, "ams_buttonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (BOOL)ams_commerceUIURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AMSDialogAction userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyCommerceUIURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSDialogAction userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyCommerceUIURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)ams_buttonDictionary
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSDictionary)ams_metricsDictionary
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyMetricsDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSURL)ams_rawURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSURL *)v5;
}

- (BOOL)ams_resolvedInterruption
{
  void *v2;
  void *v3;
  char v4;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyResolvedInterruption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)ams_setBuyParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSDialogAction ams_buttonDictionary](self, "ams_buttonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("buyParams"));
  -[AMSDialogAction ams_setButtonDictionary:](self, "ams_setButtonDictionary:", v9);

}

- (void)ams_setButtonDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSDialogAction userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));

}

- (void)ams_setCommerceUIURL:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyCommerceUIURL"));

}

- (void)ams_setMetricsDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSDialogAction userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kActionUserInfoKeyMetricsDictionary"));

}

- (void)ams_setRawURL:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyURL"));

}

- (void)ams_setResolvedInterruption:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyResolvedInterruption"));

}

- (void)ams_setShouldRetry:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyShouldRetry"));

}

- (void)ams_setSubtarget:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kActionUserInfoKeySubtarget"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("kActionUserInfoKeySubtarget"));

}

- (void)ams_setTidContinue:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyTIDContinue"));

}

- (void)ams_setURLType:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDialogAction userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kActionUserInfoKeyURLType"));

}

- (BOOL)ams_shouldRetry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AMSDialogAction userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyShouldRetry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSDialogAction userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyShouldRetry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)ams_subtarget
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeySubtarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (BOOL)ams_tidContinue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AMSDialogAction userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyTIDContinue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMSDialogAction userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyTIDContinue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)ams_URLType
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  -[AMSDialogAction userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kActionUserInfoKeyURLType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

@end

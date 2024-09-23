@implementation UIDocumentBrowserAction

- (void)setSupportsMultipleItems:(BOOL)supportsMultipleItems
{
  self->_supportsMultipleItems = supportsMultipleItems;
}

- (void)setMenuSortOrder:(unint64_t)a3
{
  self->_menuSortOrder = a3;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (void)setImage:(UIImage *)image
{
  objc_storeStrong((id *)&self->_image, image);
}

- (void)setFilteringPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filteringPredicate, a3);
}

- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 unresolvedHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIDocumentBrowserAction *v12;
  UIDocumentBrowserAction *v13;
  uint64_t v14;
  id unresolvedHandler;
  UIDocumentBrowserAction *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIDocumentBrowserAction;
  v12 = -[UIDocumentBrowserAction init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    -[UIDocumentBrowserAction commonInit](v12, "commonInit");
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    v13->_requiresResolvedItems = 0;
    v14 = MEMORY[0x20BD0CEF0](v11);
    unresolvedHandler = v13->_unresolvedHandler;
    v13->_unresolvedHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (void)commonInit
{
  void *v3;
  NSArray *v4;
  NSArray *supportedContentTypes;
  UIDocumentBrowserActionDescriptor *uiActionDescriptor;
  UIImage *image;
  id resolvedHandler;
  id unresolvedHandler;
  NSPredicate *v10;
  NSPredicate *filteringPredicate;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BDF8428], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedContentTypes = self->_supportedContentTypes;
  self->_supportedContentTypes = v4;

  self->_supportsMultipleItems = 1;
  self->_availability = 1;
  *(_WORD *)&self->_requiresFullyFormedItems = 1;
  *(_OWORD *)&self->_navigationSide = xmmword_209085400;
  uiActionDescriptor = self->_uiActionDescriptor;
  self->_uiActionDescriptor = 0;

  image = self->_image;
  self->_image = 0;

  resolvedHandler = self->_resolvedHandler;
  self->_resolvedHandler = 0;

  unresolvedHandler = self->_unresolvedHandler;
  self->_unresolvedHandler = 0;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v10 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  filteringPredicate = self->_filteringPredicate;
  self->_filteringPredicate = v10;

  self->_style = 0;
  self->_performActionExitsEditMode = 1;
  self->_actionStyle = 0;
}

- (void)setNavigationSide:(int64_t)a3
{
  self->_navigationSide = a3;
}

- (UIDocumentBrowserAction)initWithIdentifier:(NSString *)identifier localizedTitle:(NSString *)localizedTitle availability:(UIDocumentBrowserActionAvailability)availability handler:(void *)handler
{
  NSString *v11;
  NSString *v12;
  void *v13;
  UIDocumentBrowserAction *v14;
  UIDocumentBrowserAction *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id resolvedHandler;
  UIDocumentBrowserAction *v20;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v11 = identifier;
  v12 = localizedTitle;
  v13 = handler;
  v24.receiver = self;
  v24.super_class = (Class)UIDocumentBrowserAction;
  v14 = -[UIDocumentBrowserAction init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    -[UIDocumentBrowserAction commonInit](v14, "commonInit");
    objc_storeStrong((id *)&v15->_identifier, identifier);
    objc_storeStrong((id *)&v15->_localizedTitle, localizedTitle);
    v15->_availability = availability;
    v15->_requiresResolvedItems = 1;
    v16 = MEMORY[0x20BD0CEF0](v13);
    v17 = v15->_handler;
    v15->_handler = (id)v16;

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __82__UIDocumentBrowserAction_initWithIdentifier_localizedTitle_availability_handler___block_invoke;
    v22[3] = &unk_24C0F15F8;
    v23 = v13;
    v18 = MEMORY[0x20BD0CEF0](v22);
    resolvedHandler = v15->_resolvedHandler;
    v15->_resolvedHandler = (id)v18;

    v20 = v15;
  }

  return v15;
}

void __82__UIDocumentBrowserAction_initWithIdentifier_localizedTitle_availability_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[DOCItemBookmark documentsURLsForItemBookmarks:](DOCItemBookmark, "documentsURLsForItemBookmarks:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 resolvedHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIDocumentBrowserAction *v12;
  UIDocumentBrowserAction *v13;
  uint64_t v14;
  id resolvedHandler;
  UIDocumentBrowserAction *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIDocumentBrowserAction;
  v12 = -[UIDocumentBrowserAction init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    -[UIDocumentBrowserAction commonInit](v12, "commonInit");
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    v13->_requiresResolvedItems = 1;
    v14 = MEMORY[0x20BD0CEF0](v11);
    resolvedHandler = v13->_resolvedHandler;
    v13->_resolvedHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (UIDocumentBrowserAction)initWithUIActionDescriptor:(id)a3 providerDomain:(id)a4
{
  id v7;
  id v8;
  UIDocumentBrowserAction *v9;
  UIDocumentBrowserAction *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *localizedTitle;
  uint64_t v15;
  NSString *uiActionProviderIdentifier;
  UIDocumentBrowserAction *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIDocumentBrowserAction;
  v9 = -[UIDocumentBrowserAction init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    -[UIDocumentBrowserAction commonInit](v9, "commonInit");
    objc_msgSend(v7, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_msgSend(v7, "displayName");
    v13 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v13;

    v10->_requiresResolvedItems = 0;
    objc_storeStrong((id *)&v10->_uiActionDescriptor, a3);
    objc_msgSend(v7, "uiActionProviderIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    uiActionProviderIdentifier = v10->_uiActionProviderIdentifier;
    v10->_uiActionProviderIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v10->_uiActionProviderDomain, a4);
    v17 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)UIDocumentBrowserAction;
  -[UIDocumentBrowserAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserAction localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIDocumentBrowserAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDocumentBrowserAction)initWithCoder:(id)a3
{
  id v4;
  UIDocumentBrowserAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIDocumentBrowserAction *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentBrowserAction;
  v5 = -[UIDocumentBrowserAction init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setLocalizedTitle:](v5, "setLocalizedTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedCompactTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setLocalizedCompactTitle:](v5, "setLocalizedCompactTitle:", v8);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("supportedContentTypes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setSupportedContentTypes:](v5, "setSupportedContentTypes:", v12);

    -[UIDocumentBrowserAction setSupportsMultipleItems:](v5, "setSupportsMultipleItems:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsMultipleItems")));
    -[UIDocumentBrowserAction setAvailability:](v5, "setAvailability:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("availability")));
    -[UIDocumentBrowserAction setNavigationSide:](v5, "setNavigationSide:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("navigationSide")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setImage:](v5, "setImage:", v13);

    -[UIDocumentBrowserAction setMenuSortOrder:](v5, "setMenuSortOrder:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("menuSortOrder")));
    -[UIDocumentBrowserAction setRequiresResolvedItems:](v5, "setRequiresResolvedItems:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresResolvedItems")));
    -[UIDocumentBrowserAction setRequiresVersioning:](v5, "setRequiresVersioning:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresVersioning")));
    -[UIDocumentBrowserAction setRequiresFullyFormedItems:](v5, "setRequiresFullyFormedItems:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresFullyFormedItems")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filteringPredicate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setFilteringPredicate:](v5, "setFilteringPredicate:", v14);

    -[UIDocumentBrowserAction setPerformActionExitsEditMode:](v5, "setPerformActionExitsEditMode:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performActionExitsEditMode")));
    -[UIDocumentBrowserAction setActionStyle:](v5, "setActionStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionStyle")));
    v15 = v5;
  }

  return v5;
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
  id v16;

  v16 = a3;
  -[UIDocumentBrowserAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIDocumentBrowserAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("identifier"));

  }
  -[UIDocumentBrowserAction localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIDocumentBrowserAction localizedTitle](self, "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("localizedTitle"));

  }
  -[UIDocumentBrowserAction localizedCompactTitle](self, "localizedCompactTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIDocumentBrowserAction localizedCompactTitle](self, "localizedCompactTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("localizedCompactTitle"));

  }
  -[UIDocumentBrowserAction supportedContentTypes](self, "supportedContentTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIDocumentBrowserAction supportedContentTypes](self, "supportedContentTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("supportedContentTypes"));

  }
  -[UIDocumentBrowserAction filteringPredicate](self, "filteringPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIDocumentBrowserAction filteringPredicate](self, "filteringPredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("filteringPredicate"));

  }
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction supportsMultipleItems](self, "supportsMultipleItems"), CFSTR("supportsMultipleItems"));
  if (-[UIDocumentBrowserAction availability](self, "availability"))
    objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction availability](self, "availability"), CFSTR("availability"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction navigationSide](self, "navigationSide"), CFSTR("navigationSide"));
  -[UIDocumentBrowserAction image](self, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIDocumentBrowserAction image](self, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("image"));

  }
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction menuSortOrder](self, "menuSortOrder"), CFSTR("menuSortOrder"));
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresResolvedItems](self, "requiresResolvedItems"), CFSTR("requiresResolvedItems"));
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresVersioning](self, "requiresVersioning"), CFSTR("requiresVersioning"));
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresFullyFormedItems](self, "requiresFullyFormedItems"), CFSTR("requiresFullyFormedItems"));
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction performActionExitsEditMode](self, "performActionExitsEditMode"), CFSTR("performActionExitsEditMode"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction actionStyle](self, "actionStyle"), CFSTR("actionStyle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIDocumentBrowserAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIDocumentBrowserAction *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = +[UIDocumentBrowserAction allocWithZone:](UIDocumentBrowserAction, "allocWithZone:", a3);
  -[UIDocumentBrowserAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UIDocumentBrowserAction localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[UIDocumentBrowserAction resolvedHandler](self, "resolvedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[UIDocumentBrowserAction initWithIdentifier:localizedTitle:resolvedHandler:](v4, "initWithIdentifier:localizedTitle:resolvedHandler:", v6, v8, v10);

  if (v11)
  {
    -[UIDocumentBrowserAction image](self, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[UIDocumentBrowserAction setImage:](v11, "setImage:", v13);

    -[UIDocumentBrowserAction localizedCompactTitle](self, "localizedCompactTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[UIDocumentBrowserAction setLocalizedCompactTitle:](v11, "setLocalizedCompactTitle:", v15);

    v16 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[UIDocumentBrowserAction supportedContentTypes](self, "supportedContentTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithArray:copyItems:", v17, 1);
    -[UIDocumentBrowserAction setSupportedContentTypes:](v11, "setSupportedContentTypes:", v18);

    -[UIDocumentBrowserAction setSupportsMultipleItems:](v11, "setSupportsMultipleItems:", -[UIDocumentBrowserAction supportsMultipleItems](self, "supportsMultipleItems"));
    -[UIDocumentBrowserAction setAvailability:](v11, "setAvailability:", -[UIDocumentBrowserAction availability](self, "availability"));
    -[UIDocumentBrowserAction setRequiresResolvedItems:](v11, "setRequiresResolvedItems:", -[UIDocumentBrowserAction requiresResolvedItems](self, "requiresResolvedItems"));
    -[UIDocumentBrowserAction unresolvedHandler](self, "unresolvedHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[UIDocumentBrowserAction setUnresolvedHandler:](v11, "setUnresolvedHandler:", v20);

    -[UIDocumentBrowserAction setNavigationSide:](v11, "setNavigationSide:", -[UIDocumentBrowserAction navigationSide](self, "navigationSide"));
    -[UIDocumentBrowserAction setRequiresVersioning:](v11, "setRequiresVersioning:", -[UIDocumentBrowserAction requiresVersioning](self, "requiresVersioning"));
    -[UIDocumentBrowserAction setRequiresFullyFormedItems:](v11, "setRequiresFullyFormedItems:", -[UIDocumentBrowserAction requiresFullyFormedItems](self, "requiresFullyFormedItems"));
    -[UIDocumentBrowserAction setMenuSortOrder:](v11, "setMenuSortOrder:", -[UIDocumentBrowserAction menuSortOrder](self, "menuSortOrder"));
    -[UIDocumentBrowserAction filteringPredicate](self, "filteringPredicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserAction setFilteringPredicate:](v11, "setFilteringPredicate:", v21);

    -[UIDocumentBrowserAction setPerformActionExitsEditMode:](v11, "setPerformActionExitsEditMode:", -[UIDocumentBrowserAction performActionExitsEditMode](self, "performActionExitsEditMode"));
    -[UIDocumentBrowserAction setActionStyle:](v11, "setActionStyle:", -[UIDocumentBrowserAction actionStyle](self, "actionStyle"));
  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIDocumentBrowserActionAvailability)availability
{
  return self->_availability;
}

- (UIImage)image
{
  return self->_image;
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(NSArray *)supportedContentTypes
{
  objc_setProperty_nonatomic_copy(self, a2, supportedContentTypes, 48);
}

- (BOOL)supportsMultipleItems
{
  return self->_supportsMultipleItems;
}

- (BOOL)requiresResolvedItems
{
  return self->_requiresResolvedItems;
}

- (void)setRequiresResolvedItems:(BOOL)a3
{
  self->_requiresResolvedItems = a3;
}

- (BOOL)requiresFullyFormedItems
{
  return self->_requiresFullyFormedItems;
}

- (void)setRequiresFullyFormedItems:(BOOL)a3
{
  self->_requiresFullyFormedItems = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)resolvedHandler
{
  return self->_resolvedHandler;
}

- (void)setResolvedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)unresolvedHandler
{
  return self->_unresolvedHandler;
}

- (void)setUnresolvedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)uiActionProviderIdentifier
{
  return self->_uiActionProviderIdentifier;
}

- (void)setUiActionProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (FPProviderDomain)uiActionProviderDomain
{
  return self->_uiActionProviderDomain;
}

- (void)setUiActionProviderDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)navigationSide
{
  return self->_navigationSide;
}

- (BOOL)requiresVersioning
{
  return self->_requiresVersioning;
}

- (void)setRequiresVersioning:(BOOL)a3
{
  self->_requiresVersioning = a3;
}

- (unint64_t)menuSortOrder
{
  return self->_menuSortOrder;
}

- (NSPredicate)filteringPredicate
{
  return self->_filteringPredicate;
}

- (BOOL)performActionExitsEditMode
{
  return self->_performActionExitsEditMode;
}

- (void)setPerformActionExitsEditMode:(BOOL)a3
{
  self->_performActionExitsEditMode = a3;
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(int64_t)a3
{
  self->_actionStyle = a3;
}

- (NSString)localizedCompactTitle
{
  return self->_localizedCompactTitle;
}

- (void)setLocalizedCompactTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIDocumentBrowserActionDescriptor)uiActionDescriptor
{
  return self->_uiActionDescriptor;
}

- (void)setUiActionDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_uiActionDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiActionDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedCompactTitle, 0);
  objc_storeStrong((id *)&self->_filteringPredicate, 0);
  objc_storeStrong((id *)&self->_uiActionProviderDomain, 0);
  objc_storeStrong((id *)&self->_uiActionProviderIdentifier, 0);
  objc_storeStrong(&self->_unresolvedHandler, 0);
  objc_storeStrong(&self->_resolvedHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

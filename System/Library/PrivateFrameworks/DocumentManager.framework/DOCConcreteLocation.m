@implementation DOCConcreteLocation

uint64_t __46__DOCConcreteLocation_recentDocumentsLocation__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)recentDocumentsLocation_location;
  recentDocumentsLocation_location = v0;

  objc_msgSend((id)recentDocumentsLocation_location, "setSourceIdentifier:", *MEMORY[0x24BE2DE38]);
  _DocumentManagerBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Recents"), CFSTR("Recents"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)recentDocumentsLocation_location, "setTitle:", v3);

  _DocumentManagerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ Recents"), CFSTR("%@ Recents"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)recentDocumentsLocation_location, "setComposedTitleFormat:", v5);

  return objc_msgSend((id)recentDocumentsLocation_location, "setIsFPV2:", 1);
}

uint64_t __43__DOCConcreteLocation_trashedItemsLocation__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)trashedItemsLocation_trashedItemsLocation;
  trashedItemsLocation_trashedItemsLocation = v0;

  _DocumentManagerBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Recently Deleted [Sidebar]"), CFSTR("Recently Deleted"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)trashedItemsLocation_trashedItemsLocation, "setTitle:", v3);

  _DocumentManagerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Recently deleted items may be permanently deleted by your storage provider."), CFSTR("Recently deleted items may be permanently deleted by your storage provider."), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)trashedItemsLocation_trashedItemsLocation, "setPromptText:", v5);

  objc_msgSend((id)trashedItemsLocation_trashedItemsLocation, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.TrashedItems"));
  return objc_msgSend((id)trashedItemsLocation_trashedItemsLocation, "setIsFPV2:", 1);
}

- (id)placeholderLocation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)-[DOCConcreteLocation copy](self, "copy");
  objc_msgSend(v3, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.placeholderLocation"));
  objc_msgSend(v3, "setCanBeRestored:", 0);
  -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setOriginalSourceIdentifier:", v5);

  return v3;
}

- (void)setOriginalSourceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 node:(id)a4
{
  id v6;
  id v7;
  DOCConcreteLocation *v8;
  DOCConcreteLocation *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[DOCConcreteLocation init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[DOCConcreteLocation setSourceIdentifier:](v8, "setSourceIdentifier:", v6);
    -[DOCConcreteLocation setIsFPV2:](v9, "setIsFPV2:", 1);
    -[DOCConcreteLocation updateUnderlyingNodeToNode:](v9, "updateUnderlyingNodeToNode:", v7);
  }

  return v9;
}

- (void)updateUnderlyingNodeToNode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DOCConcreteLocation setNode:](self, "setNode:", v6);
  objc_msgSend(v6, "domainDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v6, "isRootItem"))
  {
    -[DOCConcreteLocation setTitle:](self, "setTitle:", v4);
  }
  else
  {
    objc_msgSend(v6, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation setTitle:](self, "setTitle:", v5);

  }
}

- (NSString)originalSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCConcreteLocation *v4;
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

  v4 = -[DOCConcreteLocation init](+[DOCConcreteLocation allocWithZone:](DOCConcreteLocation, "allocWithZone:", a3), "init");
  -[DOCConcreteLocation node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DOCConcreteLocation setNode:](v4, "setNode:", v6);

  -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DOCConcreteLocation setSourceIdentifier:](v4, "setSourceIdentifier:", v8);

  -[DOCConcreteLocation title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DOCConcreteLocation setTitle:](v4, "setTitle:", v10);

  -[DOCConcreteLocation composedTitleFormat](self, "composedTitleFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DOCConcreteLocation setComposedTitleFormat:](v4, "setComposedTitleFormat:", v12);

  -[DOCConcreteLocation representedTag](self, "representedTag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[DOCConcreteLocation setRepresentedTag:](v4, "setRepresentedTag:", v14);

  -[DOCConcreteLocation promptText](self, "promptText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[DOCConcreteLocation setPromptText:](v4, "setPromptText:", v16);

  -[DOCConcreteLocation setIsFPV2:](v4, "setIsFPV2:", -[DOCConcreteLocation isFPV2](self, "isFPV2"));
  -[DOCConcreteLocation setCanBeRestored:](v4, "setCanBeRestored:", -[DOCConcreteLocation canBeRestored](self, "canBeRestored"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedTitleFormat, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_representedTag, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_originalSourceIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DOCConcreteLocation *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  _BOOL4 v40;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v5 = (DOCConcreteLocation *)a3;
  if (self != v5)
  {
    if (-[DOCConcreteLocation isRoot](self, "isRoot"))
      v6 = -[DOCConcreteLocation isRoot](v5, "isRoot");
    else
      v6 = 0;
    -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation sourceIdentifier](v5, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    -[DOCConcreteLocation promptText](self, "promptText");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = &stru_24C0F2058;
    v14 = v13;

    -[DOCConcreteLocation promptText](v5, "promptText");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_24C0F2058;
    v18 = v17;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v7) = 0;
LABEL_45:

      goto LABEL_46;
    }
    -[DOCConcreteLocation fileProviderItem](self, "fileProviderItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation fileProviderItem](v5, "fileProviderItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 != v20)
    {
      v21 = v6 & v10;
      -[DOCConcreteLocation fileProviderItem](self, "fileProviderItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCConcreteLocation fileProviderItem](v5, "fileProviderItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqual:", v3) | v21) != 1)
      {
        LOBYTE(v7) = 0;
        goto LABEL_43;
      }
      v54 = v3;
      v55 = v22;
    }
    -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation sourceIdentifier](v5, "sourceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 != v24)
    {
      -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCConcreteLocation sourceIdentifier](v5, "sourceIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v25, "isEqual:", v3))
      {
        LOBYTE(v7) = 0;
LABEL_41:

LABEL_42:
        v22 = v55;
        v3 = v54;
        if (v19 == v20)
        {
LABEL_44:

          goto LABEL_45;
        }
LABEL_43:

        goto LABEL_44;
      }
      v51 = v25;
    }
    -[DOCConcreteLocation title](self, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation title](v5, "title");
    v27 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v26;
    v53 = v24;
    v28 = v26 == v27;
    v29 = v27;
    if (v28)
    {
      v47 = v3;
      v48 = v23;
    }
    else
    {
      v45 = v20;
      v30 = v14;
      v31 = v19;
      v32 = (void *)v27;
      -[DOCConcreteLocation title](self, "title");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCConcreteLocation title](v5, "title");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        v37 = v32;
        v38 = v52;
        v19 = v31;
        v14 = v30;
        v20 = v45;
LABEL_39:

LABEL_40:
        v24 = v53;
        v25 = v51;
        if (v23 == v53)
          goto LABEL_42;
        goto LABEL_41;
      }
      v47 = v3;
      v48 = v23;
      v29 = (uint64_t)v32;
      v19 = v31;
      v14 = v30;
      v20 = v45;
    }
    -[DOCConcreteLocation representedTag](self, "representedTag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation representedTag](v5, "representedTag");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v29;
    if (v34 != v35)
    {
      v42 = v34;
      -[DOCConcreteLocation representedTag](self, "representedTag");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCConcreteLocation representedTag](v5, "representedTag");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v36;
      if (!objc_msgSend(v36, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        v34 = v42;
        goto LABEL_36;
      }
      v34 = v42;
    }
    if (-[__CFString isEqualToString:](v14, "isEqualToString:", v18)
      && (v43 = -[DOCConcreteLocation isFPV2](self, "isFPV2"), v43 == -[DOCConcreteLocation isFPV2](v5, "isFPV2")))
    {
      v40 = -[DOCConcreteLocation canBeRestored](self, "canBeRestored");
      v7 = v40 ^ -[DOCConcreteLocation canBeRestored](v5, "canBeRestored") ^ 1;
      v39 = v7;
    }
    else
    {
      LOBYTE(v7) = 0;
      v39 = 0;
    }
    if (v34 == v35)
    {

      LOBYTE(v7) = v39;
LABEL_38:
      v38 = v52;
      v37 = v46;
      v3 = v47;
      v23 = v48;
      if (v52 == v46)
        goto LABEL_40;
      goto LABEL_39;
    }
LABEL_36:

    goto LABEL_38;
  }
  LOBYTE(v7) = 1;
LABEL_46:

  return v7;
}

- (NSString)sourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (FPItem)fileProviderItem
{
  void *v2;
  void *v3;

  -[DOCConcreteLocation node](self, "node");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fpfs_fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FPItem *)v3;
}

- (BOOL)isRoot
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[DOCConcreteLocation node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRootItem") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[DOCConcreteLocation node](self, "node");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (DOCNode)node
{
  return (DOCNode *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)promptText
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (DOCTag)representedTag
{
  return (DOCTag *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setIsFPV2:(BOOL)a3
{
  self->_isFPV2 = a3;
}

- (DOCConcreteLocation)init
{
  DOCConcreteLocation *v2;
  DOCConcreteLocation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCConcreteLocation;
  v2 = -[DOCConcreteLocation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DOCConcreteLocation setCanBeRestored:](v2, "setCanBeRestored:", 1);
  return v3;
}

- (void)setCanBeRestored:(BOOL)a3
{
  self->_canBeRestored = a3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)composedTitleFormat
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DOCConcreteLocation fileProviderSourceDisplayName](self, "fileProviderSourceDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCConcreteLocation title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DOCConcreteLocation isRoot](self, "isRoot") && v3 || !v4)
  {
    v5 = v3;
  }
  else
  {
    -[DOCConcreteLocation title](self, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)fileProviderSourceDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[DOCConcreteLocation fileProviderItem](self, "fileProviderItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", v3, 3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLocalizedDisplayName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBeRestored
{
  return self->_canBeRestored;
}

- (void)setNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setPromptText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setComposedTitleFormat:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setRepresentedTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isFPV2
{
  return self->_isFPV2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedItemsLocation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__DOCConcreteLocation_sharedItemsLocation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedItemsLocation_onceToken != -1)
    dispatch_once(&sharedItemsLocation_onceToken, block);
  return (id)sharedItemsLocation_location;
}

+ (id)recentDocumentsLocation
{
  if (recentDocumentsLocation_onceToken != -1)
    dispatch_once(&recentDocumentsLocation_onceToken, &__block_literal_global_15);
  return (id)recentDocumentsLocation_location;
}

- (NSString)shortDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@'>"), v5, self, self->_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (DOCConcreteLocation)initWithCoder:(id)a3
{
  id v4;
  DOCConcreteLocation *v5;
  uint64_t v6;
  DOCNode *node;
  uint64_t v8;
  NSString *sourceIdentifier;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  DOCTag *representedTag;
  uint64_t v14;
  NSString *promptText;
  uint64_t v16;
  NSString *composedTitleFormat;
  DOCConcreteLocation *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DOCConcreteLocation;
  v5 = -[DOCConcreteLocation init](&v20, sel_init);
  if (v5)
  {
    DOCNodeFromCoder();
    v6 = objc_claimAutoreleasedReturnValue();
    node = v5->_node;
    v5->_node = (DOCNode *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v5->_isFPV2 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFPV2"));
    v5->_canBeRestored = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeRestored"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_representedTag"));
    v12 = objc_claimAutoreleasedReturnValue();
    representedTag = v5->_representedTag;
    v5->_representedTag = (DOCTag *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_promptText"));
    v14 = objc_claimAutoreleasedReturnValue();
    promptText = v5->_promptText;
    v5->_promptText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_composedTitleFormat"));
    v16 = objc_claimAutoreleasedReturnValue();
    composedTitleFormat = v5->_composedTitleFormat;
    v5->_composedTitleFormat = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

+ (id)searchLocation
{
  if (searchLocation_onceToken != -1)
    dispatch_once(&searchLocation_onceToken, &__block_literal_global_8);
  return (id)searchLocation_searchLocation;
}

+ (id)trashedItemsLocation
{
  if (trashedItemsLocation_onceToken != -1)
    dispatch_once(&trashedItemsLocation_onceToken, &__block_literal_global_24);
  return (id)trashedItemsLocation_trashedItemsLocation;
}

uint64_t __42__DOCConcreteLocation_sharedItemsLocation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_opt_new();
  v3 = (void *)sharedItemsLocation_location;
  sharedItemsLocation_location = v2;

  objc_msgSend((id)sharedItemsLocation_location, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.SharedItems"));
  _DocumentManagerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Shared"), CFSTR("Shared"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedItemsLocation_location, "setTitle:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "disableWorkaroundFor88096763"))
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ Shared"), CFSTR("%@ Shared"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedItemsLocation_location, "setComposedTitleFormat:", v7);

  }
  return objc_msgSend((id)sharedItemsLocation_location, "setIsFPV2:", 1);
}

+ (BOOL)disableWorkaroundFor88096763
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableWorkaroundFor88096763"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DOCNode *node;
  NSString *sourceIdentifier;
  NSString *title;
  DOCTag *representedTag;
  NSString *promptText;
  NSString *composedTitleFormat;
  id v11;

  v4 = a3;
  node = self->_node;
  v11 = v4;
  if (node)
  {
    -[DOCNode encodeNodeWithCoder:](node, "encodeNodeWithCoder:", v4);
    v4 = v11;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", sourceIdentifier, CFSTR("_sourceIdentifier"));
    v4 = v11;
  }
  title = self->_title;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("_title"));
    v4 = v11;
  }
  representedTag = self->_representedTag;
  if (representedTag)
  {
    objc_msgSend(v4, "encodeObject:forKey:", representedTag, CFSTR("_representedTag"));
    v4 = v11;
  }
  promptText = self->_promptText;
  if (promptText)
  {
    objc_msgSend(v4, "encodeObject:forKey:", promptText, CFSTR("_promptText"));
    v4 = v11;
  }
  composedTitleFormat = self->_composedTitleFormat;
  if (composedTitleFormat)
  {
    objc_msgSend(v4, "encodeObject:forKey:", composedTitleFormat, CFSTR("_composedTitleFormat"));
    v4 = v11;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_isFPV2, CFSTR("isFPV2"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_canBeRestored, CFSTR("canBeRestored"));

}

+ (id)defaultLocation
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.defaultLocation"));
  objc_msgSend(v2, "setIsFPV2:", 1);
  return v2;
}

- (BOOL)isContainer
{
  void *v3;
  void *v4;
  char v5;

  -[DOCConcreteLocation node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[DOCConcreteLocation node](self, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFolder");

  return v5;
}

- (DOCConcreteLocation)initWithSourceIdentifier:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  DOCConcreteLocation *v8;
  DOCConcreteLocation *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[DOCConcreteLocation init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[DOCConcreteLocation setSourceIdentifier:](v8, "setSourceIdentifier:", v6);
    -[DOCConcreteLocation setTitle:](v9, "setTitle:", v7);
  }

  return v9;
}

uint64_t __37__DOCConcreteLocation_searchLocation__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)searchLocation_searchLocation;
  searchLocation_searchLocation = v0;

  _DocumentManagerBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search"), CFSTR("Search"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)searchLocation_searchLocation, "setTitle:", v3);

  objc_msgSend((id)searchLocation_searchLocation, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.Search"));
  objc_msgSend((id)searchLocation_searchLocation, "setIsFPV2:", 1);
  return objc_msgSend((id)searchLocation_searchLocation, "setCanBeRestored:", 0);
}

- (void)setNeedsToResolveHierarchy:(BOOL)a3
{
  self->_needsToResolveHierarchy = a3;
}

- (DOCConcreteLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3
{
  id v4;
  DOCConcreteLocation *v5;
  DOCConcreteLocation *v6;
  void *v7;

  v4 = a3;
  v5 = -[DOCConcreteLocation init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[DOCConcreteLocation setRepresentedTag:](v5, "setRepresentedTag:", v4);
    -[DOCConcreteLocation setSourceIdentifier:](v6, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.TaggedItems"));
    -[DOCConcreteLocation setIsFPV2:](v6, "setIsFPV2:", 1);
    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConcreteLocation setTitle:](v6, "setTitle:", v7);

  }
  return v6;
}

- (BOOL)isTaggedItemsSource
{
  void *v2;
  BOOL v3;

  -[DOCConcreteLocation representedTag](self, "representedTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSSet)attachedTags
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  -[DOCConcreteLocation representedTag](self, "representedTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DOCConcreteLocation node](self, "node");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tags");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __35__DOCConcreteLocation_attachedTags__block_invoke;
    v12[3] = &unk_24C0F1AF8;
    v4 = v10;
    v13 = v4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  return (NSSet *)v4;
}

void __35__DOCConcreteLocation_attachedTags__block_invoke(uint64_t a1)
{
  id v2;

  DOCTagFromFPTag();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

- (BOOL)isTrash
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[DOCConcreteLocation originalSourceIdentifier](self, "originalSourceIdentifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6 == CFSTR("com.apple.DocumentManager.TrashedItems");
}

+ (id)defaultSaveLocation
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.defaultSaveLocation"));
  objc_msgSend(v2, "setIsFPV2:", 1);
  return v2;
}

+ (id)iCloudDriveLocation
{
  void *v2;
  int v3;
  _QWORD *v4;

  v2 = (void *)objc_opt_new();
  v3 = FPIsCloudDocsWithFPFSEnabled();
  v4 = (_QWORD *)MEMORY[0x24BE2DE10];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x24BE2DE20];
  objc_msgSend(v2, "setSourceIdentifier:", *v4);
  objc_msgSend(v2, "setIsFPV2:", 1);
  return v2;
}

+ (id)emptyLocation
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.emptyLocation"));
  objc_msgSend(v2, "setIsFPV2:", 1);
  return v2;
}

+ (DOCConcreteLocation)browseStartingPointsLocation
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSourceIdentifier:", CFSTR("com.apple.DocumentManager.BrowseStartingPoints"));
  return (DOCConcreteLocation *)v2;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DOCConcreteLocation node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DOCConcreteLocation sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  -[DOCConcreteLocation representedTag](self, "representedTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  DOCTag *representedTag;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  representedTag = self->_representedTag;
  if (representedTag)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("representedTag=%@"), representedTag);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24C0F2058;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)DOCConcreteLocation;
  -[DOCConcreteLocation description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ title=\"%@\" [%@] DOCNode=%@%@"), v6, self->_title, self->_sourceIdentifier, self->_node, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)displayNameComposedWithLocalizedAppName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DOCConcreteLocation composedTitleFormat](self, "composedTitleFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needsToResolveHierarchy
{
  return self->_needsToResolveHierarchy;
}

@end

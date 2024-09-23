@implementation BCSLinkItem

+ (id)linkItemsFromLinkItemModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BCSLinkItem *v11;
  BCSLocaleHelper *v12;
  BCSLinkItem *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [BCSLinkItem alloc];
        v12 = objc_alloc_init(BCSLocaleHelper);
        v13 = -[BCSLinkItem initWithLinkItemModel:localeHelper:](v11, "initWithLinkItemModel:localeHelper:", v10, v12, (_QWORD)v16);
        objc_msgSend(v4, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (BCSLinkItem)initWithLinkItemModel:(id)a3 localeHelper:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  BCSLinkItem *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BCSLinkItem initWithLinkItemModel:expirationDate:localeHelper:](self, "initWithLinkItemModel:expirationDate:localeHelper:", v8, v9, v7);

  return v10;
}

- (BCSLinkItem)initWithLinkItemModel:(id)a3 expirationDate:(id)a4 localeHelper:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCSLinkItem *v12;
  BCSLinkItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCSLinkItem;
  v12 = -[BCSItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeStrong((id *)&v13->_localeHelper, a5);
    -[BCSItem setExpirationDate:](v13, "setExpirationDate:", v10);
  }

  return v13;
}

- (NSString)debugDescription
{
  return (NSString *)-[BCSLinkItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSDictionary)debugInfo
{
  _QWORD *v2;
  void *v3;
  NSDictionary *v4;

  -[BCSLinkItem model](self, "model");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[12];
  v4 = v2;

  return v4;
}

- (void)setDebugInfo:(id)a3
{
  id v4;
  const char *v5;
  id selfa;

  v4 = a3;
  -[BCSLinkItem model](self, "model");
  selfa = (id)objc_claimAutoreleasedReturnValue();
  if (selfa)
    objc_setProperty_nonatomic_copy(selfa, v5, v4, 96);

}

- (id)heroImageURLForSpecifier:(id *)a3
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];

  v4 = MEMORY[0x24BDBCF48];
  -[BCSLinkItem heroImageURLString](self, "heroImageURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  +[NSURL bcs_templatedImageURLWithString:imageSpecifier:](v4, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconImageURLForSpecifier:(id *)a3
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];

  v4 = MEMORY[0x24BDBCF48];
  -[BCSLinkItem iconImageURLString](self, "iconImageURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  +[NSURL bcs_templatedImageURLWithString:imageSpecifier:](v4, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BCSLinkItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesItemIdentifying:", v4);

  return v6;
}

- (BCSBusinessLinkContentItem)businessLinkContentItem
{
  BCSLinkItem *v2;
  void *v3;
  void *v4;
  void *v5;
  NSString *cachedContentItemLanguage;
  NSString *v7;
  BCSBusinessLinkContentItem *cachedContentItem;
  BCSBusinessLinkContentItem *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BCSLinkItem *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x24BDAC8D0];
  -[BCSLinkItem localeHelper](self, "localeHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale language](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    cachedContentItemLanguage = v2->_cachedContentItemLanguage;
  else
    cachedContentItemLanguage = 0;
  v7 = cachedContentItemLanguage;
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    if (v2)
      cachedContentItem = v2->_cachedContentItem;
    else
      cachedContentItem = 0;

    if (cachedContentItem)
    {
      if (v2)
        v9 = v2->_cachedContentItem;
      else
        v9 = 0;
      return v9;
    }
  }
  else
  {

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  if (v2)
  {
    v11 = (void *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[BCSLinkItem model](v2, "model");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 88);
    else
      v14 = 0;
    v15 = v14;

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v15);
          v20 = -[BCSBusinessLinkContentItem initWithBusinessLinkContentItemModel:]((id *)[BCSBusinessLinkContentItem alloc], *(void **)(*((_QWORD *)&v46 + 1) + 8 * i));
          objc_msgSend(v11, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    v21 = 0;
  }
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v22)
  {
    v23 = v22;
    obj = v21;
    v41 = 0;
    v24 = *(_QWORD *)v43;
LABEL_24:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v25);
      objc_msgSend(v26, "language", obj);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v2;
      -[BCSLinkItem localeHelper](v2, "localeHelper");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentLocale");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLocale language](v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v27, "isEqualToString:", v31);

      if ((v32 & 1) != 0)
        break;
      if (objc_msgSend(v26, "isDefault"))
      {
        v33 = v26;

        v41 = v33;
      }
      v2 = v28;
      if (v23 == ++v25)
      {
        v21 = obj;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v23)
          goto LABEL_24;
        goto LABEL_36;
      }
    }
    v34 = v26;

    v2 = v28;
    if (v34)
      goto LABEL_38;
  }
  else
  {
    v41 = 0;
LABEL_36:

  }
  v34 = v41;
  v41 = v34;
  if (v34)
  {
LABEL_38:
    if (v2)
      objc_storeStrong((id *)&v2->_cachedContentItem, v34);
    -[BCSLinkItem localeHelper](v2, "localeHelper");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "currentLocale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLocale language](v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_storeStrong((id *)&v2->_cachedContentItemLanguage, v37);

    v38 = v41;
  }
  else
  {
    v38 = 0;
  }
  v39 = v34;

  return (BCSBusinessLinkContentItem *)v39;
}

- (NSURL)linkURL
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)fullHash
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)heroImageURLString
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "heroImageURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)iconImageURLString
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)redirectURL
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redirectURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int64_t)action
{
  void *v2;
  int64_t v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "action");

  return v3;
}

- (BOOL)isPoweredBy
{
  void *v2;
  char v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPoweredBy");

  return v3;
}

- (NSDictionary)mapIconStyleAttributes
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapIconStyleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSNumber)mapItemMUID
{
  void *v2;
  void *v3;

  -[BCSLinkItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItemMUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[BCSLinkItem businessLinkContentItem](self, "businessLinkContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[BCSLinkItem businessLinkContentItem](self, "businessLinkContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)language
{
  void *v2;
  void *v3;

  -[BCSLinkItem businessLinkContentItem](self, "businessLinkContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[BCSLinkItemModel copyWithZone:](self->_model, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    -[BCSItem expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    objc_msgSend(v5, "setExpirationDate:", v9);

    -[BCSLinkItem localeHelper](self, "localeHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSLinkItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLinkItem model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSLinkItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BCSLinkItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSLinkItem debugInfo](self, "debugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("Debug Info"));

  -[BCSItem expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("expirationDate"));

  -[BCSLinkItem localeHelper](self, "localeHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("localeHelper"));

  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[BCSLinkItem debugInfo](self, "debugInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "Debug Info: %@", (uint8_t *)&v14, 0xCu);

  }
  return v4;
}

- (BCSLocaleHelperProtocol)localeHelper
{
  return self->_localeHelper;
}

- (BCSLinkItemModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContentItem, 0);
  objc_storeStrong((id *)&self->_cachedContentItemLanguage, 0);
  objc_storeStrong((id *)&self->_localeHelper, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSURL)heroImageURL
{
  int64x2_t v3;
  const char *v4;
  const char *v5;

  v3 = vdupq_n_s64(0x400uLL);
  v4 = "bb";
  v5 = "png";
  -[BCSLinkItem heroImageURLForSpecifier:](self, "heroImageURLForSpecifier:", &v3);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)iconImageURL
{
  int64x2_t v3;
  const char *v4;
  const char *v5;

  v3 = vdupq_n_s64(0xB4uLL);
  v4 = "bb";
  v5 = "png";
  -[BCSLinkItem iconImageURLForSpecifier:](self, "iconImageURLForSpecifier:", &v3);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

@end

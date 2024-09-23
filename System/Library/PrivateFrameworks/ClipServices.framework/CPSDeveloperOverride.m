@implementation CPSDeveloperOverride

- (CPSDeveloperOverride)initWithDictionary:(id)a3
{
  id v4;
  CPSDeveloperOverride *v5;
  uint64_t v6;
  NSString *invocationURL;
  uint64_t v8;
  NSString *clipBundleID;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subtitle;
  void *v14;
  CPSDeveloperOverride *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPSDeveloperOverride;
  v5 = -[CPSDeveloperOverride init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("invocationURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    invocationURL = v5->_invocationURL;
    v5->_invocationURL = (NSString *)v6;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("clipBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v8;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("subtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("action"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_action = objc_msgSend(v14, "integerValue");

    v15 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  NSString *invocationURL;
  int64_t action;
  void *v4;
  void *v5;
  _QWORD v7[5];
  NSString *v8;
  __int128 v9;
  NSString *subtitle;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  invocationURL = self->_invocationURL;
  v7[0] = CFSTR("invocationURL");
  v7[1] = CFSTR("clipBundleID");
  v9 = *(_OWORD *)&self->_clipBundleID;
  v7[2] = CFSTR("title");
  v7[3] = CFSTR("subtitle");
  action = self->_action;
  subtitle = self->_subtitle;
  v7[4] = CFSTR("action");
  v8 = invocationURL;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", action);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)hasOverride
{
  objc_msgSend(a1, "loadAllOverridesIfNeeded");
  return objc_msgSend((id)allOverrides, "count") != 0;
}

+ (void)loadAllOverridesIfNeeded
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CPSDeveloperOverride *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!allOverrides)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)allOverrides;
    allOverrides = v2;

    objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", CFSTR("DeveloperOverrides"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = -[CPSDeveloperOverride initWithDictionary:]([CPSDeveloperOverride alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
            objc_msgSend((id)allOverrides, "addObject:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }
    }

  }
}

+ (id)allOverrides
{
  objc_msgSend(a1, "loadAllOverridesIfNeeded");
  return (id)allOverrides;
}

+ (id)overrideForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "loadAllOverridesIfNeeded");
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)allOverrides;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "invocationURL", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "hasPrefix:", v11))
        {
          v12 = objc_msgSend(v10, "isValid");

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
LABEL_12:

  return v7;
}

+ (void)persistAllOverrides
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)allOverrides;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "dictionaryRepresentation", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v2, CFSTR("DeveloperOverrides"));
  objc_msgSend(v9, "synchronize");

}

+ (unint64_t)_indexOf:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "loadAllOverridesIfNeeded");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)allOverrides;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__CPSDeveloperOverride__indexOf___block_invoke;
  v8[3] = &unk_24C3BABA0;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __33__CPSDeveloperOverride__indexOf___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "invocationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "invocationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSURL)heroImageURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  v17[0] = CPSharedResourcesDirectory();
  v17[1] = CFSTR("Library");
  v17[2] = CFSTR("com.apple.ClipServices.clipserviced");
  v17[3] = CFSTR("DeveloperOverrides");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v16);
  v8 = v16;

  if ((v7 & 1) != 0)
  {
    v9 = v5;
  }
  else
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPSDeveloperOverride heroImageURL].cold.1(v10, v8);
    v9 = 0;
  }

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[NSString cps_sha256String](self->_invocationURL, "cps_sha256String");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-Hero.png"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v14;
}

- (void)save
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v5, v6, "Could not save developer override hero image: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)clear
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v5, v6, "Could not delete developer override hero image: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_invocationURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("https")))
    && -[NSString length](self->_title, "length")
    && -[NSString length](self->_subtitle, "length") != 0;

  return v6;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (!-[CPSDeveloperOverride isComplete](self, "isComplete"))
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_clipBundleID, 0, 0);
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "appClipMetadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if (objc_msgSend(v4, "isBeta"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_invocationURL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[CPSUtilities appClipAssociatedDomainIsApprovedForURL:applicationIdentifier:](CPSUtilities, "appClipAssociatedDomainIsApprovedForURL:applicationIdentifier:", v6, v7);

    }
    else if ((objc_msgSend(v4, "isProfileValidated") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v8 = objc_msgSend(v4, "isAdHocCodeSigned");
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setHeroImage:(CGImage *)a3
{
  CGImage *heroImage;

  heroImage = self->_heroImage;
  if (heroImage != a3)
  {
    CGImageRelease(heroImage);
    self->_heroImage = CGImageRetain(a3);
  }
}

- (CGImage)heroImage
{
  CGImage *result;
  void *v4;
  void *v5;

  result = self->_heroImage;
  if (!result)
  {
    -[CPSDeveloperOverride heroImageURL](self, "heroImageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_heroImage = CPSCreateImageWithContentsOfFile(v5);

    return self->_heroImage;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_invocationURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_clipBundleID, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v4[1] = CGImageCreateCopy(self->_heroImage);
  v9 = -[NSString copy](self->_title, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_subtitle, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v4[6] = self->_action;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDeveloperOverride)initWithCoder:(id)a3
{
  id v4;
  CPSDeveloperOverride *v5;
  void *v6;
  uint64_t v7;
  NSString *invocationURL;
  void *v9;
  uint64_t v10;
  NSString *clipBundleID;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  uint64_t v16;
  NSString *subtitle;
  CPSDeveloperOverride *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPSDeveloperOverride;
  v5 = -[CPSDeveloperOverride init](&v20, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("invocationURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    invocationURL = v5->_invocationURL;
    v5->_invocationURL = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("clipBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("title"));
    v13 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("subtitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v16;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *invocationURL;
  id v5;

  invocationURL = self->_invocationURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", invocationURL, CFSTR("invocationURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clipBundleID, CFSTR("clipBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("action"));

}

- (NSString)invocationURL
{
  return self->_invocationURL;
}

- (void)setInvocationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_invocationURL, 0);
}

- (void)heroImageURL
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v5, v6, "Cannot create developer overrides folder with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end

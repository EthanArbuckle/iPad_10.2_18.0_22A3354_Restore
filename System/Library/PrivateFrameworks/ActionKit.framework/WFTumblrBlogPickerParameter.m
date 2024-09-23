@implementation WFTumblrBlogPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setActionResources:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315906;
      v11 = "WFEnforceClass";
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v9 = v15;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  -[WFTumblrBlogPickerParameter setTumblrAccessResource:](self, "setTumblrAccessResource:", v7);
}

- (void)setTumblrAccessResource:(id)a3
{
  WFTumblrAccessResource **p_tumblrAccessResource;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_tumblrAccessResource = &self->_tumblrAccessResource;
  v6 = (_QWORD *)MEMORY[0x24BEC4628];
  if (self->_tumblrAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v6, *p_tumblrAccessResource);

  }
  objc_storeStrong((id *)&self->_tumblrAccessResource, a3);
  if (*p_tumblrAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_possibleStatesDidChange, *v6, *p_tumblrAccessResource);

  }
}

- (void)wasAddedToWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTumblrBlogPickerParameter;
  -[WFTumblrBlogPickerParameter wasAddedToWorkflow](&v3, sel_wasAddedToWorkflow);
  -[WFTumblrBlogPickerParameter updateBlogs](self, "updateBlogs");
}

- (void)updateBlogs
{
  TMAPIClient *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(TMAPIClient);
  +[WFTumblrAccessResource tumblrOAuthToken](WFTumblrAccessResource, "tumblrOAuthToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient setOAuthToken:](v3, "setOAuthToken:", v4);

  +[WFTumblrAccessResource tumblrOAuthTokenSecret](WFTumblrAccessResource, "tumblrOAuthTokenSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient setOAuthTokenSecret:](v3, "setOAuthTokenSecret:", v5);

  -[TMAPIClient setOAuthConsumerKey:](v3, "setOAuthConsumerKey:", CFSTR("cwKKz80VhsmeSt3n8ORZFqZSqYejgTm7DKGRxM5ecescOhZjRw"));
  -[TMAPIClient setOAuthConsumerSecret:](v3, "setOAuthConsumerSecret:", CFSTR("TvXKq6PUXP2GldJBTKM99C4ly30vrKerTF3Cr5LNqy3J3gZBPf"));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke;
  v6[3] = &unk_24F8B6F10;
  v6[4] = self;
  -[TMAPIClient userInfo:](v3, "userInfo:", v6);

}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTumblrBlogPickerParameter;
  -[WFTumblrBlogPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFTumblrBlogPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFTumblrBlogPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") < 2;

  return v3;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFTumblrBlogPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectOfClasses:forKey:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "if_compactMap:", &__block_literal_global_137);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_possibleStates;
    self->_possibleStates = v13;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (WFTumblrAccessResource)tumblrAccessResource
{
  return self->_tumblrAccessResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tumblrAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFTumblrBlogSubstitutableState *__45__WFTumblrBlogPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFTumblrBlogSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFTumblrBlogSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

void __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("user"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v6, "code") == 401)
  {
    +[WFTumblrAccessResource setTumblrOAuthTokenSecret:](WFTumblrAccessResource, "setTumblrOAuthTokenSecret:", 0);
    +[WFTumblrAccessResource setTumblrOAuthToken:](WFTumblrAccessResource, "setTumblrOAuthToken:", 0);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blogs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v21 = a1;
    v22 = v6;
    v23 = v5;
    v9 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blogs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKey:", CFSTR("url"), v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("title"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forKey:", v16, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_2;
    v24[3] = &unk_24F8BB638;
    v24[4] = *(_QWORD *)(v21 + 32);
    objc_msgSend(v18, "setObject:forKey:completion:", v9, v20, v24);

    v6 = v22;
    v5 = v23;
  }

}

void __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_3;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __42__WFTumblrBlogPickerParameter_updateBlogs__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

+ (void)initialize
{
  if (initialize_onceToken_35061 != -1)
    dispatch_once(&initialize_onceToken_35061, &__block_literal_global_35062);
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

void __41__WFTumblrBlogPickerParameter_initialize__block_invoke()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_110);
}

void __41__WFTumblrBlogPickerParameter_initialize__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("WFTumblrBlogs"));

}

@end

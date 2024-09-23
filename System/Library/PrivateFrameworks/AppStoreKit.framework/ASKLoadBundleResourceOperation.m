@implementation ASKLoadBundleResourceOperation

+ (id)supportedScheme
{
  return CFSTR("resource");
}

- (ASKLoadBundleResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  void *v5;
  void *v6;
  ASKLoadBundleResourceOperation *v7;

  objc_msgSend(a3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASKLoadBundleResourceOperation initWithResourceName:](self, "initWithResourceName:", v6);

  return v7;
}

- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3
{
  id v4;
  ASKLoadBundleResourceOperation *v5;
  uint64_t v6;
  NSString *resourceName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKLoadBundleResourceOperation;
  v5 = -[ASKLoadBundleResourceOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resourceName = v5->_resourceName;
    v5->_resourceName = (NSString *)v6;

  }
  return v5;
}

+ (id)_searchBundles
{
  if (_searchBundles_onceToken != -1)
    dispatch_once(&_searchBundles_onceToken, &__block_literal_global);
  return (id)_searchBundles__searchBundles;
}

void __48__ASKLoadBundleResourceOperation__searchBundles__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppStoreKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_searchBundles__searchBundles;
  _searchBundles__searchBundles = v2;

}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ASKLoadBundleResourceOperation *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend((id)objc_opt_class(), "_searchBundles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
      if ((-[ASKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v9 = (void *)MEMORY[0x1E0DC3870];
      -[ASKLoadBundleResourceOperation resourceName](self, "resourceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", v10, v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v17 = self;
        v18 = v11;
        v19 = 0;
        goto LABEL_13;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    if ((-[ASKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
      return;
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[ASKLoadBundleResourceOperation resourceName](self, "resourceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_searchBundles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("No image found for %@ in %@"), v13, v14, (_QWORD)v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ASKLoadBundleResourceOperationErrorDomain"), 560557415, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = self;
    v18 = 0;
    v19 = v11;
LABEL_13:
    -[ASKLoadResourceOperation didCompleteWithResource:error:](v17, "didCompleteWithResource:error:", v18, v19);

  }
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSArray)searchBundles
{
  return self->_searchBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBundles, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end

@implementation GKLoadBundleResourceOperation

- (GKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4
{
  id v6;
  id v7;
  GKLoadBundleResourceOperation *v8;
  uint64_t v9;
  NSString *resourceName;
  uint64_t v11;
  NSArray *searchBundles;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKLoadBundleResourceOperation;
  v8 = -[GKLoadBundleResourceOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    resourceName = v8->_resourceName;
    v8->_resourceName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    searchBundles = v8->_searchBundles;
    v8->_searchBundles = (NSArray *)v11;

  }
  return v8;
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
  GKLoadBundleResourceOperation *v17;
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
  -[GKLoadBundleResourceOperation searchBundles](self, "searchBundles");
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
      if ((-[GKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v9 = (void *)MEMORY[0x1E0DC3870];
      -[GKLoadBundleResourceOperation resourceName](self, "resourceName");
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

    if ((-[GKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
      return;
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GKLoadBundleResourceOperation resourceName](self, "resourceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLoadBundleResourceOperation searchBundles](self, "searchBundles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("No image found for %@ in %@"), v13, v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("GKLoadBundleResourceOperationErrorDomain"), 560557415, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = self;
    v18 = 0;
    v19 = v11;
LABEL_13:
    -[GKLoadResourceOperation didCompleteWithResource:error:](v17, "didCompleteWithResource:error:", v18, v19);

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

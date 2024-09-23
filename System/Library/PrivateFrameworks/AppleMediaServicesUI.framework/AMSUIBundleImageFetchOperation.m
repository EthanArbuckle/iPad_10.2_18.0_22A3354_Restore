@implementation AMSUIBundleImageFetchOperation

- (AMSUIBundleImageFetchOperation)initWithImageName:(id)a3 searchBundles:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUIBundleImageFetchOperation *v11;
  uint64_t v12;
  NSString *imageName;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIBundleImageFetchOperation;
  v11 = -[AMSUIBundleImageFetchOperation init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_bundlesToSearch, a4);
    objc_storeStrong((id *)&v11->_traitCollection, a5);
  }

  return v11;
}

- (BOOL)isLowLatency
{
  return 1;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  AMSUIBundleImageFetchOperation *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AMSUIBundleImageFetchOperation bundlesToSearch](self, "bundlesToSearch", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      if (v6)
        break;
      v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x24BEBD640];
      -[AMSUIBundleImageFetchOperation imageName](self, "imageName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIBundleImageFetchOperation traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v9, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          goto LABEL_3;

        if (!v6)
          goto LABEL_14;
LABEL_12:
        v13 = self;
        v14 = v6;
        v15 = 0;
        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }

LABEL_14:
  AMSError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self;
  v14 = 0;
  v15 = v6;
LABEL_15:
  -[AMSUIAssetFetchOperation _finishWithImage:error:](v13, "_finishWithImage:error:", v14, v15);

}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (NSArray)bundlesToSearch
{
  return self->_bundlesToSearch;
}

- (void)setBundlesToSearch:(id)a3
{
  objc_storeStrong((id *)&self->_bundlesToSearch, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_bundlesToSearch, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
